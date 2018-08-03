defmodule Translations do

  def get(namespace, language) do
    filetype = Application.get_env(:translations, :filetype, :yaml)
    priv = :code.priv_dir(:translations)
    path = "#{priv}/#{namespace}/#{language}.#{filetype}"
    case File.exists?(path) do
      false -> nil
      true ->
        File.read!(path)
    end
  end
end
