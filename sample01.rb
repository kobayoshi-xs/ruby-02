$patterns = ["グー", "チョキ", "パー"]
$face_patterns = ["上", "右", "下", "左"]
$win_boxs = []
$lose_boxs = []

p "ジャンケンスタート"
p "ジャンケン...?"

p "選択肢 : 0(グー) 1(チョキ) 2(パー) 3(戦わない)"
game = gets.to_s
def game_start(game)
  if game.to_i == 0
    p "あなたはグーを出しました"
  elsif game.to_i == 1
    p "あなたはチョキを出しました"
  elsif game.to_i == 2
    p "あなたはパーを出しました"
  elsif game.to_i == 3
    p "ゲームを終了します"
    exit
  else
    p "数字の0〜3を入力して下さい"
    exit
  end
end
game_start(game)
game_sub = $patterns.sample
p "相手は#{game_sub}を出しました"

#-----------------------------------------------------------------------

def result_pattern_yourself(game, game_sub)
  if game.to_i == 0 && game_sub == "上" || game.to_i == 1 && game_sub == "右" || game.to_i == 2 && game_sub == "下" || game.to_i == 3 && game_sub == "左"
    p "この勝負あなたの負けです。"
    exit
  else
    p "引き分けです。"
    
    p "----------------------------------"
    
    p "ジャンケン...？"
    p "選択肢 : 0(グー) 1(チョキ) 2(パー) 3(戦わない)"
    game = gets.to_s
    game_start(game)
    game_sub = $patterns.sample
    p "相手は#{game_sub}を出しました。"
    game_result(game, game_sub)
  end  
end

#------------------------------------------------------------------------

def result_pattern_myself(game, game_sub)
  if game.to_i == 0 && game_sub == "上" || game.to_i == 1 && game_sub == "右" || game.to_i == 2 && game_sub == "下" || game.to_i == 3 && game_sub == "左"
    p "この勝負あなたの勝ちです。"
    exit
  else
    p "引き分けです。"
    
    p "----------------------------------"
    
    p "ジャンケン...？"
    p "選択肢 : 0(グー) 1(チョキ) 2(パー) 3(戦わない)"
    game = gets.to_s
    game_start(game)
    game_sub = $patterns.sample
    p "相手は#{game_sub}を出しました。"
    game_result(game, game_sub)
  end  
end

#------------------------------------------------------------------------

def result(game)
  if game.to_i == 0
    p "あなたは上を向いた。"
  elsif game.to_i == 1
    p "あなたは右を向いた。"
  elsif game.to_i == 2
    p "あなたは下を向いた。"
  elsif game.to_i == 3
    p "あなたは左を向いた。"
  else
    p "数字の0〜3を入力して下さい"
  end
end

#-----------------------------------------------------------------------

def result_02(game)
  if game.to_i == 0
    p "あなたは上を指した。"
  elsif game.to_i == 1
    p "あなたは右を指した。"
  elsif game.to_i == 2
    p "あなたは下を指した。"
  elsif game.to_i == 3
    p "あなたは左を指した。"
  else
    p "数字の0〜3を入力して下さい"
  end
end

#------------------------------------------------------------------------

def game_result_last()
  if $lose_boxs.size >= 1
    p "相手 : あっち向いて...?"
    p "あなたの選択肢 : 0(上を向く) 1(右を向く) 2(下を向く) 3(左を向く)"
    game = gets.to_s
    p "ホイッ！！"
    result(game)
    game_sub = $face_patterns.sample
    p "相手は#{game_sub}を指した。"
    $lose_boxs.clear
    result_pattern_yourself(game, game_sub)
  elsif $win_boxs.size >= 1
    p "あなた : あっち向いて...?"
    p "あなたの選択肢 : 0(上を指す) 1(右を指す) 2(下を指す) 3(左を指す)"
    game = gets.to_s
    p "ホイッ！！"
    result_02(game)
    game_sub = $face_patterns.sample
    p "相手は#{game_sub}を向いた。"
    $win_boxs.clear
    result_pattern_myself(game, game_sub)
  end
end  

#-------------------------------------------------------------------------

def draw(game, game_sub)
  while game.to_i == 0 && game_sub == "グー" || game.to_i == 1 && game_sub == "チョキ" || game.to_i == 2 && game_sub == "パー" do
    p "引き分けです"
    p "あいこで...?"
    p "選択肢 : 0(グー) 1(チョキ) 2(パー)"
    game = gets.to_s
    game_start(game)
    game_sub = $patterns.sample
    p "相手は#{game_sub}を出しました"
    game_result(game, game_sub)
  end
end

#--------------------------------------------------------------------------

def game_result(game, game_sub)
  if game.to_i == 1 && game_sub == "グー"
    p "あなたの負けです"
    
    p "----------------------------------"
    
    $lose_boxs.push("lose")
    game_result_last()
  elsif game.to_i == 2 && game_sub == "グー"
    p "あなたの勝ちです"
    
    p "----------------------------------"
    
    $win_boxs.push("win")
    game_result_last()
  elsif game.to_i == 0 && game_sub == "チョキ"
    p "あなたの勝ちです"
    
    p "----------------------------------"
    
    $win_boxs.push("win")
    game_result_last()
  elsif game.to_i == 2 && game_sub == "チョキ"
    p "あなたの負けです"
    
    p "----------------------------------"
    
    $lose_boxs.push("lose")
    game_result_last()
  elsif game.to_i == 0 && game_sub == "パー"
    p "あなたの負けです"
    
    p "----------------------------------"
    
    $lose_boxs.push("lose")
    game_result_last()
  elsif game.to_i == 1 && game_sub == "パー"
    p "あなたの勝ちです"
    
    p "----------------------------------"
    
    $win_boxs.push("win")
    game_result_last()
  else 
    draw(game, game_sub)
  end
end

#---------------------------------------------------------------------------

game_result(game, game_sub)