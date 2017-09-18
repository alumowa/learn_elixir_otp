defmodule Mp3id do

  def parse(file_name) do

    case File.read(file_name) do

      {:ok, mp3} ->
        audio_size = byte_size(mp3) - 128
        << _ :: binary-size(audio_size), id3_tag :: binary >> = mp3

        << "TAG", title :: binary-size(30),
                  artist :: binary-size(30),
                  album :: binary-size(30),
                  year :: binary-size(4),
                  _rest :: binary >> = id3_tag
        IO.puts "#{artist} - #{title} - (#{album}, #{year})"

      _ -> IO.puts "Could not open file: #{file_name}"

    end

  end
end
