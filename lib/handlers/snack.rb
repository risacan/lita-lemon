class Snack < Handler
  OYATSU = %w(
    🌰 🍏 🍎 🍐 🍊 🍋 🍌 🍉 🍇 🍓 🍈 🍒 🍑 🍍 🍅
    🍆 🌽 🍠 🍞 🧀 🍗 🍖 🍤 🍳 🍟 🌭 🍕 🍝 🌮 🌯
    🍜 🍲 🍥 🍣 🍱 🍛 🍙 🍚 🍘 🍢 🍡 🍧 🍨 🍦 🍰
    🎂 🍮 🍬 🍭 🍫 🍿 🍩 🍪 🍄 🥝 🥑 🥒 🥕 🌶 🥔
    🥜 🥐 🥖 🥚 🥓 🥞 🍔 🥙 🥗 🥘
  )

  REGEX = /お腹(?<status>.+)|harahe|はらへ|ハラへ|ﾊﾗﾍ|ハラヘ/

  route(
    REGEX,
    :feed,
    help: {"お腹空いた" => "おやつをくれる"},
    command: true,
  )

  def feed(response)
    status = response.matches.flatten.first
    food =
      case status
      when /すい/, /空/, /へっ/, /減/, /すき/,
            /ペコペコ/, /ぺこぺこ/
        oyatsu
      when /痛い/, /いたい/
        "💊"
      when /いっぱい/, /ぱんぱん/, /パンパン/, /く/, /苦/
        "☕"
      else
        oyatsu
      end
    response.reply("つ#{food}")
  end

  private

  def oyatsu
    OYATSU.sample
  end
end
