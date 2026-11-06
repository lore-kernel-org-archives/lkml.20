Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964762;
	b=AAcMfgQuG9ofxJL2aMFrg3IJZ7RWAqPOzo5Y3Ye0id4XTi6VyCn0woN3tItTA8k9Ue6l
	 2Vh00uZcGTitnnWEQ7EH9tTQ44McNnjRy/XN13ws8QOUCwdenqbhoHyIPWd7JcDbyafa9
	 lf1rgzPtKFzkiOuXIKk8kMXLkARnLsDfRps7JvC/cKMbTOGqENGqPLIdJlvYlRDQwhsIg
	 TjPaDaJXFYopyCqoezLxhj1H69pFysgP4lHfhaXYa09E4BLpwJVJEEWX27U4dWC0vGtxo
	 MAlfJjpSSXXlFWqCycEbbnxRZy/pmy/fT8HTDTn/UYS7iNwv0XngYVundAoQ9ecxsnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=keJZcbIMxA2QWXZOsM5lsnoCR+Zxvop8jGtr5GaK0eY=;
	b=tTfYBZFIRbE5I5rqQb+IjRHMXAZjiYBMLwSFd37X/e/UfVgDiaP4IufxrjwctOpD+8lD
	 /rL81gfVXDKDb17J5Cl3uD7Z/9MZ2i+GYzfXx9fwNJ12kcIm2D45D69hR0Cwz3OiOWxnK
	 Q65HWepEESDTWHSqXSJBH6AmHfYXCbq73BGPYGGWW2yNs03L86LWBKeOBFlXSusaHANb7
	 PTh0PsPqDQAiS3taJPfyWMBhBHRaUzKr67A+VF8q/JOsm57O2XO51bKcNh74yvImzpMAs
	 eELrvnkWHdlq0Q6+aVirm/WTW8V678sLZ4zD8J9C9Ee8PpPR5L24xUkIgGzZ9ID3l/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj5UbmBc;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC0D60A261A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC0D60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj5UbmBc
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3afc7b51abfso32361a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964761; x=1794569561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=keJZcbIMxA2QWXZOsM5lsnoCR+Zxvop8jGtr5GaK0eY=;
        b=Rj5UbmBctyaY8uqotNdYuBhUUiP+8R+uGqCuDfOBcleRNL3ZqS54iB7rSF/H2Zu5VU
         +P26uWUzIC3NKQA0vuC9C7RkwBhuFA6zP4Ious8jKOCtASBOzZvlMcFBskIz6REmDrC2
         O5Vu6G1XpCTOZAX5CBTtI1PVhwVVlMFaRYEs/q92YZcaYzB5Mwp9KKTgi6dqVmVcLKsy
         5A8AA+qejLfV7KsLRILNMB8j4SwFGnaJ7ZnM7+yY+5XL5tK/Y2ZxCH4nkeAE8uBdYAeu
         XJxb2Fyg6wLOWh32vyDJxFcfyUGVTXiJn4RrkTS0Lj1V7e/glnwUj/7o/0U2OCYzq48f
         H+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964761; x=1794569561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keJZcbIMxA2QWXZOsM5lsnoCR+Zxvop8jGtr5GaK0eY=;
        b=XF/rjoQi7Jkeabmwdjv1FI4+Wfzi1Sw/GeKbaeeV1GS7w8ZvM3bcrLj7upSzO1rGUg
         Grv+FLzS6QCHOdd9dwOCRRZSm4l3rCMVWGUwCajkqPOxZsQruOwpZ61NGaWh6sdUPlga
         8GUcEBDtnawE54GFhMmDf7jaRIwSOs7PjjBsf/T5TYEfk+S014m0lThf6ETc79VRUunq
         5kZ7uDUgBVQgqEB+P65aC/LsjRlt54utRelfElTzohC1cnIgBDQq09t1fdxzQ2LXD3qJ
         Kwm8tvyubtEhRo8YzN1sPV2NxxD5+kRSxClnhhUBjYzxZixIShLTSpalizGGPtxc2KNK
         7RBA==
X-Forwarded-Encrypted: i=1; AL+hErEk8UCrQRo8jO9ar9zgCttp+yyajP9MxKUzF0CViWLL6qoCQHxk5v8GbtMwYp237RjdfPkG/DEmyRbIII4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MtdtmxaroJrTBgOYI2f/nB6VppI9CfSgD0/WiTcELHfUJeIOu
	KnUw5+Os6sr6rKxy4VLotJ3wxKYOxIn/PSBwqfo+BbUMvujusrTzsFcK
X-Gm-Gg: AYBFou23mvs+Bu77wsC6v6cIwVyr75x7cGwwj4MaOuvIYIIeesvF+1qGf/dKugPxofy
	2TAydPNakOyGuRgDTpgMzSqCY7uE7z507Yy8yxZcGZtC9Sl9u4gdVbym7a/yj2iuSAH0ravlMqq
	zYcMYwLr1C/g4k8cgu9BPno5LIjnoGasOSdjznnjyuMTf/fwSncNdLeu/CzIpoLDc3kpsjTIanp
	2l6DOeaVgjlC6o/gkdKJsCMYUx4xxtZq4OEK8CvjC4LrAOefu8Mxs2YKgNr5g+G+a/PaFQ5P873
	ET3NOaU2r3MAyaGqK2hi/g2GCQj3SkScpOjbdfszO4LAfu1xm5VuF8m4q9BBwYR5CVJgCcM2L7S
	if0RI3idqbqZTYpaejoWID4rpTXNng3NOUGSLqm98RjFKuDhBtZy5hyNpzG/aecBpcLPJV1XKEa
	BYnCUKvTICB6PgUfgVG58tpRjtDLx1fn8vEZGknykrdFFauhPX2s7KupMPqjvkkxqOAWDbSJJMN
	bO25gjI//XF1tUnviyMFIHciVwGK3FhvtohEhcLy725zIT+i6wdusyt4+YRwDW2JfUNZ1ILAVZp
	4hMxPfVcSlqYxSdTUov5tEeaTPrLuvUpm+fMGt2lVhthHt00U6qbnEAI4y78yOTgPYTWyAOhAA5
	9gbYxyM8S4cX2JXePn/bp/SyX
X-Received: by 2002:a17:90b:1c87:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b0db6cdd38mr3244649a91.4.1793964760997;
        Fri, 06 Nov 2026 03:32:40 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:39 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 15/25] docs/zh_TW: process: sync management-style.rst with the English original
Date: Fri,  6 Nov 2026 19:31:30 +0800
Message-ID: <20261106113142.706783-16-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113142.706783-1-chenyou910331@gmail.com>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carries no "update to commit" marker.  A comparison
against the current English text shows every section and footnote is
present, including the :ref: to the decisions label from
commit f77af637f29d ("doc:process: add links where missing"), but the
prose was converted from zh_CN and many sentences drifted from the
original:

- restore the emphasis the original puts on words such as **they**
  (commit 26f67b4c6e4c ("Documentation: management-style: Fix formatting
  of emphsized word")), **avoid**, **two**, **in private** and **will**
- retranslate sentences whose meaning had been lost: "doubly
  managerial for making two inconsequential decisions", "coming up
  smelling like roses", "Oops, not again", "Suck up to them", "in a
  sanctimonious voice", "doesn't scan nearly as well", "Tag, you're
  it", the flame-war hint in footnote 3 and the first footnote
- call people 笨蛋 consistently for "d*ckhead" (one place said 壞人)
- keep the book and song titles in English, as in the original
- localize terminology (內核→核心, 文檔→文件, 項目→專案, 網絡→網路,
  爲→為, 着→著, 裏→裡)
- number the section headings "1)" ... "6)" as in the original and drop
  the blank line at the end of the file

update to commit 26f67b4c6e4c ("Documentation: management-style: Fix
formatting of emphsized word")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/management-style.rst        | 294 +++++++++---------
 1 file changed, 153 insertions(+), 141 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/management-style.rst b/Documentation/translations/zh_TW/process/management-style.rst
index 2cef0ef25ede..0d583a089f31 100644
--- a/Documentation/translations/zh_TW/process/management-style.rst
+++ b/Documentation/translations/zh_TW/process/management-style.rst
@@ -6,204 +6,216 @@
 
 .. _tw_managementstyle:
 
-Linux內核管理風格
+Linux核心管理風格
 =================
 
-這是一個簡短的文檔，描述了Linux內核首選的（或胡編的，取決於您問誰）管理風格。
-它的目的是在某種程度上參照 :ref:`process/coding-style.rst <codingstyle>`
-主要是爲了避免反覆回答 [#cnf1]_ 相同（或類似）的問題。
+這是一份簡短的文件，描述Linux核心偏好的（或者說是胡謅的，看你問誰）管理風格。
+它某種程度上是要與 :ref:`process/coding-style.rst <codingstyle>` 文件相互
+呼應，而寫它主要是為了避免一再回答 [#cnf1]_ 相同（或類似）的問題。
 
-管理風格是非常個人化的，比簡單的編碼風格規則更難以量化，因此本文檔可能與實
-際情況有關，也可能與實際情況無關。起初它是一個玩笑，但這並不意味着它可能不
-是真的。你得自己決定。
+管理風格是非常個人化的事，比單純的程式碼風格規則難以量化得多，因此本文件
+可能與現實有關，也可能無關。它起初只是個玩笑，但這並不代表它實際上就不是
+真的。你得自己判斷。
 
-順便說一句，在談到“核心管理者”時，主要是技術負責人，而不是在公司內部進行傳
-統管理的人。如果你簽署了採購訂單或者對你的團隊的預算有任何瞭解，你幾乎肯定
-不是一個核心管理者。這些建議可能適用於您，也可能不適用於您。
+順帶一提，這裡所說的“核心管理者”，指的完全是技術上的領導者，而不是在公司
+內部從事傳統管理工作的人。如果你會簽採購單，或是對你所屬團隊的預算有任何
+概念，那你幾乎可以肯定不是核心管理者。這些建議對你可能適用，也可能不適用。
 
-首先，我建議你購買“高效人的七個習慣”，而不是閱讀它。燒了它，這是一個偉大的
-象徵性姿態。
+首先，我建議你買一本“Seven Habits of Highly Effective People”，然後 **不要**
+讀它。燒了它，這是個很棒的象徵性舉動。
 
-.. [#cnf1] 本文件並不是通過回答問題，而是通過讓提問者痛苦地明白，我們不知道
-   答案是什麼。
+.. [#cnf1] 本文件達成這個目的的方式，與其說是回答問題，不如說是讓提問者
+   痛苦地明白：我們根本不知道答案是什麼。
 
-不管怎樣，這裏是：
+不管怎樣，開始吧：
 
 .. _tw_decisions:
 
-1）決策
--------
+1) 決策
+--------
 
-每個人都認爲管理者做決定，而且決策很重要。決定越大越痛苦，管理者就必須越高級。
-這很明顯，但事實並非如此。
+每個人都以為管理者負責做決策，而且決策很重要。決策越重大、越痛苦，做決策的
+管理者就得越高階。這個道理非常深刻又顯而易見，但實際上並不正確。
 
-最重要的是 **避免** 做出決定。尤其是，如果有人告訴你“選擇（a）或（b），
-我們真的需要你來做決定”，你就是陷入麻煩的管理者。你管理的人比你更瞭解細節，
-所以如果他們來找你做技術決策，你完蛋了。你顯然沒有能力爲他們做這個決定。
+遊戲規則是 **避免** 做決策。尤其是，如果有人跟你說“選（a）還是（b），我們
+真的需要你來決定”，那麼身為管理者的你就麻煩了。你管理的人最好比你更了解
+細節，所以如果他們來找你做技術決策，你就完蛋了。你顯然沒有能力替他們做這個
+決策。
 
-（推論：如果你管理的人不比你更瞭解細節，你也會被搞砸，儘管原因完全不同。
-也就是說，你的工作是錯的，他們應該管理你的才智）
+（推論：如果你管理的人並不比你更了解細節，那你也完蛋了，只是原因完全不同：
+你入錯行了，應該反過來由 **他們** 來管理才華洋溢的你才對。）
 
-所以最重要的是 **避免** 做出決定，至少是那些大而痛苦的決定。做一些小的
-和非結果性的決定是很好的，並且使您看起來好像知道自己在做什麼，所以內核管理者
-需要做的是將那些大的和痛苦的決定變成那些沒有人真正關心的小事情。
+所以遊戲規則是 **避免** 做決策，至少要避免那些重大又痛苦的決策。做些小而
+無關緊要的決策沒有問題，還能讓你看起來像是知道自己在做什麼，所以核心管理者
+要做的，就是把那些重大又痛苦的決策變成沒有人真正在乎的小事。
 
-這有助於認識到一個大的決定和一個小的決定之間的關鍵區別是你是否可以在事後修正
-你的決定。任何決定都可以通過始終確保如果你錯了（而且你一定會錯），你以後總是
-可以通過回溯來彌補損失。突然間，你就要做兩個無關緊要的決定，一個是錯誤的，另
-一個是正確的。
+認清一點會有幫助：大決策和小決策之間的關鍵差別，在於你事後能否修正這個
+決策。只要始終確保在你犯錯時（而且你 **一定** 會犯錯），之後總是能透過走
+回頭路來彌補損害，任何決策都可以變成小決策。突然間，你因為做了 **兩個**
+無關緊要的決策（錯的那個 **和** 對的那個），而顯得加倍有管理者的架勢。
 
-人們甚至會認爲這是真正的領導能力（咳，胡說，咳）。
+而且大家甚至會把這視為真正的領導力（*咳* 胡扯 *咳*）。
 
-因此，避免重大決策的關鍵在於避免做那些無法挽回的事情。不要被引導到一個你無法
-逃離的角落。走投無路的老鼠可能很危險——走投無路的管理者真可憐。
+因此，避免重大決策的關鍵就變成：避免去做無法挽回的事。不要被逼進一個無法
+逃脫的角落。走投無路的老鼠也許很危險——走投無路的管理者則只是可悲。
 
-事實證明，由於沒有人會愚蠢到讓內核管理者承擔巨大的財政責任，所以通常很容易
-回溯。既然你不可能浪費掉你無法償還的鉅額資金，你唯一可以回溯的就是技術決策，
-而回溯很容易：只要告訴大家你是個不稱職的傻瓜，說對不起，然後撤銷你去年讓別
-人所做的毫無價值的工作。突然間，你一年前做的決定不在是一個重大的決定，因爲
-它很容易被推翻。
+事實證明，由於 **反正** 不會有人蠢到真的讓核心管理者承擔龐大的財務責任，
+所以要走回頭路通常相當容易。既然你不可能浪費掉一大筆你可能還不起的錢，你
+唯一能走回頭路的就是技術決策，而在這方面走回頭路非常容易：只要告訴大家你是
+個無能的蠢蛋，說聲抱歉，然後把過去一年你讓大家做的那些毫無價值的工作全部
+撤銷。突然間，你一年前做的決策終究不算重大決策，因為它很容易就能撤銷。
 
-事實證明，有些人對接受這種方法有困難，原因有兩個：
+事實證明，有些人對這種做法有困難，原因有二：
 
- - 承認你是個白癡比看起來更難。我們都喜歡保持形象，在公共場合說你錯了有時
-   確實很難。
- - 如果有人告訴你，你去年所做的工作終究是不值得的，那麼對那些可憐的低級工
-   程師來說也是很困難的，雖然實際的 **工作** 很容易刪除，但你可能已經不可
-   挽回地失去了工程師的信任。記住：“不可撤銷”是我們一開始就試圖避免的，
-   而你的決定終究是一個重大的決定。
+ - 承認自己是個白癡比看起來要難。我們都喜歡維持形象，公開站出來說自己錯了，
+   有時候確實非常困難。
+ - 有人告訴你，你過去一年做的工作終究沒有價值，這對那些可憐的基層工程師來說
+   也可能很難受。雖然實際的 **工作** 只要刪掉就能輕鬆撤銷，但你可能已經無可
+   挽回地失去了那位工程師的信任。記住：“無可挽回”正是我們一開始就想避免的，
+   而你的決策終究還是變成了重大決策。
 
-令人欣慰的是，這兩個原因都可以通過預先承認你沒有任何線索，提前告訴人們你的
-決定完全是初步的，而且可能是錯誤的事情來有效地緩解。你應該始終保留改變主意
-的權利，並讓人們 **意識** 到這一點。當你 **還沒有** 做過真正愚蠢的事情的時
-候，承認自己是愚蠢的要容易得多。
+令人高興的是，這兩個原因都可以有效緩解：只要事先坦承你根本完全摸不著頭緒，
+並且預先告訴大家你的決策純屬初步，而且可能是錯的。你應該永遠保留改變主意的
+權利，並讓大家非常 **清楚** 這一點。而且在你 **還沒** 做出真正愚蠢的事之前，
+承認自己很蠢要容易得多。
 
-然後，當它真的被證明是愚蠢的時候，人們就轉動他們的眼珠說“哎呀，下次不要了”。
+接著，當它真的被證明很蠢時，大家只會翻個白眼說“唉呀，又來了”。
 
-這種對不稱職的先發制人的承認，也可能使真正做這項工作的人也會三思是否值得做。
-畢竟，如果他們不確定這是否是一個好主意，你肯定不應該通過向他們保證他們所做
-的工作將會進入（內核）鼓勵他們。在他們開始一項巨大的努力之前，至少讓他們三
-思而後行。
+這種先發制人地承認自己無能的做法，也可能讓真正做事的人三思這件事是否值得
+做。畢竟，如果連 **他們** 都不確定這是不是個好主意，你就絕對不該向他們保證
+他們做的東西會被收錄，藉此鼓勵他們。至少要讓他們在展開大工程之前三思。
 
-記住：他們最好比你更瞭解細節，而且他們通常認爲他們對每件事都有答案。作爲一
-個管理者，你能做的最好的事情不是灌輸自信，而是對他們所做的事情進行健康的批
-判性思考。
+記住：他們最好比你更了解細節，而且他們通常已經自認對每件事都有答案。身為
+管理者，你能做的最好的事不是灌輸信心，而是讓他們對自己所做的事抱持適度的
+批判性思考。
 
-順便說一句，另一種避免做出決定的方法是看起來很可憐的抱怨 “我們不能兩者兼
-得嗎？” 相信我，它是有效的。如果不清楚哪種方法更好，他們最終會弄清楚的。
-最終的答案可能是兩個團隊都會因爲這種情況而感到沮喪，以至於他們放棄了。
+順帶一提，另一種避免做決策的方法，是哀怨地嘟囔一句“我們不能兩個都做嗎？”，
+然後裝出一副可憐相。相信我，這招有效。如果不清楚哪種做法比較好，他們最後
+會自己搞清楚。最後的答案可能是兩個團隊都對這種狀況感到非常挫折，乾脆直接
+放棄。
 
-這聽起來像是一個失敗，但這通常是一個跡象，表明兩個項目都有問題，而參與其中
-的人不能做決定的原因是他們都是錯誤的。你最終會聞到玫瑰的味道，你避免了另一
-個你本可以搞砸的決定。
+這聽起來也許像是失敗，但通常這表示兩個專案都有問題，而相關人員之所以無法
+做出決定，是因為他們都錯了。結果你反而一身光鮮地脫身，又避開了一個你原本
+可能搞砸的決策。
 
-2）人
------
 
-大多數人都是白癡，做一名管理者意味着你必須處理好這件事，也許更重要的是,
-**他們** 必須處理好你。
+2) 人
+------
 
-事實證明，雖然很容易糾正技術錯誤，但不容易糾正人格障礙。你只能和他們的和
-你的（人格障礙）共處。
+大多數人都是白癡，而身為管理者，意味著你必須面對這件事，也許更重要的是，
+**他們** 必須面對 **你**。
 
-但是，爲了做好作爲內核管理者的準備，最好記住不要燒掉任何橋樑，不要轟炸任何
-無辜的村民，也不要疏遠太多的內核開發人員。事實證明，疏遠人是相當容易的，而
-親近一個疏遠的人是很難的。因此，“疏遠”立即屬於“不可逆”的範疇，並根據
-:ref:`tw_decisions` 成爲絕不可以做的事情。
+事實證明，技術上的錯誤很容易撤銷，人格上的缺陷可就沒那麼容易撤銷了。你只能
+跟他們的——還有你自己的——人格缺陷共處。
 
-這裏只有幾個簡單的規則：
+不過，為了做好當核心管理者的準備，最好記住不要自斷後路、不要轟炸無辜的
+村民，也不要疏遠太多核心開發者。事實證明，疏遠別人相當容易，要挽回他們卻
+很難。因此，“疏遠”立刻就屬於“不可逆”的範疇，根據 :ref:`tw_decisions` 而
+成為絕對不能做的事。
 
- (1) 不要叫人笨蛋（至少不要在公共場合）
- (2) 學習如何在忘記規則(1)時道歉
+這裡只有幾條簡單的規則：
 
-問題在於 #1 很容易去做，因爲你可以用數百萬種不同的方式說“你是一個笨蛋” [#cnf2]_
-有時甚至沒有意識到，而且幾乎總是帶着一種白熱化的信念，認爲你是對的。
+ (1) 不要罵人笨蛋（至少不要在公開場合）
+ (2) 學會在忘記規則(1)時道歉
 
-你越確信自己是對的（讓我們面對現實吧，你可以把幾乎所有人都稱爲壞人，而且你
-經常是對的），事後道歉就越難。
+規則 #1 的問題在於它非常容易犯，因為你可以用數百萬種不同的方式說“你是個
+笨蛋” [#cnf2]_，有時甚至自己都沒意識到，而且幾乎總是帶著自認為正確的熾熱
+信念。
 
-要解決此問題，您實際上只有兩個選項：
+而你越確信自己是對的（說實話，你幾乎可以罵 **任何人** 是笨蛋，而且你往往
+**會** 是對的），事後就越難道歉。
 
- - 非常擅長道歉
- - 把“愛”均勻地散開，沒有人會真正感覺到自己被不公平地瞄準了。讓它有足夠的
-   創造性，他們甚至可能會覺得好笑。
+要解決這個問題，你其實只有兩個選擇：
 
-選擇永遠保持禮貌是不存在的。沒有人會相信一個如此明顯地隱藏了他們真實性格的人。
+ - 變得非常擅長道歉
+ - 把“愛”平均地撒出去，讓沒有人真的覺得自己被不公平地針對。做得夠有創意的話，
+   他們甚至可能會覺得好笑。
 
-.. [#cnf2] 保羅·西蒙演唱了“離開愛人的50種方法”，因爲坦率地說，“告訴開發者
-   他們是D*CKHEAD" 的100萬種方法都無法確認。但我確信他已經這麼想了。
+始終保持禮貌這個選項其實並不存在。沒有人會信任一個如此明顯地隱藏自己真實
+性格的人。
 
-3）人2 - 好人
--------------
+.. [#cnf2] Paul Simon唱的是“Fifty Ways to Leave Your Lover”（離開愛人的五十種
+   方法），因為坦白說，“A Million Ways to Tell a Developer They're a
+   D*ckhead”（告訴開發者他們是笨蛋的一百萬種方法）唱起來可遠沒那麼順口。但我
+   相信他一定考慮過。
 
-雖然大多數人都是白癡，但不幸的是，據此推論你也是白癡，儘管我們都自我感覺良
-好，我們比普通人更好（讓我們面對現實吧，沒有人相信他們是普通人或低於普通人），
-我們也應該承認我們不是最鋒利的刀，而且會有其他人比你更不像白癡。
 
-有些人對聰明人反應不好。其他人利用它們。
+3) 人（之二）——好的那種
+------------------------
 
-作爲內核維護人員，確保您在第二組中。接受他們，因爲他們會讓你的工作更容易。
-特別是，他們能夠爲你做決定，這就是遊戲的全部內容。
+雖然事實證明大多數人都是白癡，但遺憾的是，由此得出的推論就是你也是白癡。
+而且雖然我們都可以安心地相信自己比一般人強（說實話，從來沒有人相信自己只是
+普通或低於普通水準），我們也應該承認自己並不是最聰明的那一個，總會有其他人
+沒有你那麼白癡。
 
-所以當你發現一個比你聰明的人時，就順其自然吧。你的管理職責在很大程度上變成
-了“聽起來像是個好主意——去嘗試吧”，或者“聽起來不錯，但是XXX呢？”“。第二個版
-本尤其是一個很好的方法，要麼學習一些關於“XXX”的新東西，要麼通過指出一些聰明
-人沒有想到的東西來顯得更具管理性。無論哪種情況，你都會贏。
+有些人對聰明人反應很差。其他人則會善用他們。
 
-要注意的一件事是認識到一個領域的偉大不一定會轉化爲其他領域。所以你可能會向
-特定的方向刺激人們，但讓我們面對現實吧，他們可能擅長他們所做的事情，而且對
-其他事情都很差勁。好消息是，人們往往會自然而然地重拾他們擅長的東西，所以當
-你向某個方向刺激他們時，你並不是在做不可逆轉的事情，只是不要用力推。
+身為核心維護者，你要確保自己屬於第二種人。巴結他們，因為他們就是會讓你的
+工作更輕鬆的人。尤其是，他們能替你做決策，而這正是這場遊戲的重點所在。
 
-4）責備
--------
+所以當你找到比你聰明的人時，就順勢而行吧。你的管理職責大致上會變成說“聽起來
+是個好主意——放手去做吧”，或是“聽起來不錯，但是xxx呢？”。尤其第二種說法是個
+很棒的方式，不是能讓你學到一些關於“xxx”的新東西，就是能藉由指出那位聰明人
+沒想到的事，讓你顯得 **格外** 有管理者的架勢。無論哪種情況，你都是贏家。
 
-事情會出問題的，人們希望去責備人。貼標籤，你就是受責備的人。
+要注意的一點是，要認清在某個領域的傑出不一定能轉移到其他領域。所以你也許會
+推著大家往特定方向走，但說實話，他們可能擅長自己做的事，其他事卻都很爛。
+好消息是，人們往往會自然而然地回到自己擅長的事情上，所以當你 **真的** 推他們
+往某個方向走時，你並不是在做什麼不可逆的事，只是別推得太用力。
 
-事實上，接受責備並不難，尤其是當人們意識到這不 **全是** 你的過錯時。這讓我
-們找到了承擔責任的最佳方式：爲別人承擔這件事。你會感覺很好，他們會感覺很好，
-沒有受到指責. 那誰，失去了他們的全部36GB色情收藏的人，因爲你的無能將勉強承
-認，你至少沒有試圖逃避責任。
 
-然後讓真正搞砸了的開發人員（如果你能找到他們）私下知道他們搞砸了。不僅是爲
-了將來可以避免，而且爲了讓他們知道他們欠你一個人情。而且，也許更重要的是，
-他們也可能是能夠解決問題的人。因爲，讓我們面對現實吧，肯定不是你。
+4) 歸咎
+--------
 
-承擔責任也是你首先成爲管理者的原因。這是讓人們信任你，讓你獲得潛在的榮耀的
-一部分，因爲你就是那個會說“我搞砸了”的人。如果你已經遵循了以前的規則，你現
-在已經很擅長說了。
+事情總會出錯，而大家會想找個人來怪罪。抓到了，換你當鬼。
 
-5）應避免的事情
----------------
+其實承擔責任並沒有那麼難，尤其是在大家多少意識到這不 **全是** 你的錯的時候。
+這就帶出了承擔責任的最佳方式：替別人扛下來。你會因為扛下責任而感覺良好，
+他們會因為沒被怪罪而感覺良好，而那個因為你的無能而失去整整36GB色情收藏的人，
+也會不情願地承認你至少沒有試圖推卸責任。
 
-有一件事人們甚至比被稱爲“笨蛋”更討厭，那就是在一個神聖的聲音中被稱爲“笨蛋”。
-第一個你可以道歉，第二個你不會真正得到機會。即使你做得很好，他們也可能不再
-傾聽。
+然後 **私下** 讓真正搞砸的開發者（如果你找得到他們）知道他們搞砸了。這不只
+是為了讓他們將來能避免再犯，也是為了讓他們知道自己欠你一次人情。而且，也許
+更重要的是，他們很可能也是能修好它的人。因為，說實話，那絕對不會是你。
 
-我們都認爲自己比別人強，這意味着當別人裝腔作勢時，這會讓我們很惱火。你也許
-在道德和智力上比你周圍的每個人都優越，但不要試圖太明顯，除非你真的打算激怒
-某人 [#cnf3]_
+承擔責任也正是你當初能成為管理者的原因。這是讓大家信任你、讓你有機會獲得
+榮耀的一部分，因為你就是那個會說“我搞砸了”的人。而如果你遵循了前面的規則，
+現在你應該已經很擅長說這句話了。
 
-同樣，不要對事情太客氣或太微妙。禮貌很容易落得落花流水，把問題隱藏起來，
-正如他們所說，“在互聯網上，沒人能聽到你的含蓄。”用一個鈍器把這一點錘進去，
-因爲你不能真的依靠別人來獲得你的觀點。
 
-一些幽默可以幫助緩和直率和道德化。過度到荒謬的地步，可以灌輸一個觀點，而不
-會讓接受者感到痛苦，他們只是認爲你是愚蠢的。因此，它可以幫助我們擺脫對批評
-的個人心理障礙。
+5) 應避免的事
+--------------
 
-.. [#cnf3] 提示：與你的工作沒有直接關係的網絡新聞組是消除你對他人不滿的好
-   方法。偶爾寫些侮辱性的帖子，打個噴嚏，讓你的情緒得到淨化。別把牢騷帶回家
+有一件事比被叫“笨蛋”更讓人討厭，那就是被人用一副道貌岸然的語氣叫“笨蛋”。
+前者你還可以道歉，後者你就不太會有道歉的機會了。即使你在其他方面做得很好，
+他們可能也不會再聽你說話了。
 
-6）爲什麼是我？
----------------
+我們都認為自己比其他任何人都強，這表示當別人擺架子時，會 **真的** 讓我們很
+不爽。你也許在道德和智識上都勝過身邊的每一個人，但除非你真的 **有意** 激怒
+某人 [#cnf3]_，否則不要表現得太明顯。
 
-既然你的主要責任似乎是爲別人的錯誤承擔責任，並且讓別人痛苦地明白你是不稱職
-的，那麼顯而易見的問題之一就變成了爲什麼首先要這樣做。
+同樣地，也不要對事情太客氣或太含蓄。禮貌很容易做過頭而把問題掩蓋起來，而且
+正如俗話說的：“在網路上，沒有人聽得出你的含蓄。”用一個又大又鈍的東西把重點
+敲進去，因為除此之外你真的無法指望別人理解你的重點。
 
-首先，雖然你可能會或可能不會聽到十幾歲女孩（或男孩，讓我們不要在這裏評判或
-性別歧視）敲你的更衣室門，你會得到一個巨大的個人成就感爲“負責”。別介意你真
-的在領導別人，你要跟上別人，儘可能快地追趕他們。每個人都會認爲你是負責人。
+一點幽默有助於緩和直率與說教。誇張到荒謬的地步，可以讓重點深入人心，又不會
+讓接收者感到痛苦，他們只會覺得你在耍寶。因此，它有助於突破我們每個人面對
+批評時都有的心理障礙。
 
-如果你可以做到這個， 這是個偉大的工作！
+.. [#cnf3] 提示：與你的工作沒有直接關係的網路新聞群組，是發洩你對其他人的
+   不滿的好地方。偶爾帶著輕蔑寫幾篇侮辱人的文章，好好來場論戰，你就會覺得
+   身心都被淨化了。只是別在自家門口拉屎。
 
+
+6) 為什麼是我？
+----------------
+
+既然你的主要責任似乎就是替別人的錯誤背黑鍋，並且讓其他所有人都痛苦地清楚
+看到你有多無能，那麼顯而易見的問題就變成：當初為什麼要做這份工作？
+
+首先，雖然你不一定會有尖叫的少女（或少年，在這裡我們就別帶著評判眼光或性別
+歧視了）來敲你更衣室的門，但你 **一定** 會因為“負責掌管”而獲得巨大的個人
+成就感。別在意事實上你的領導方式，是努力跟上其他所有人，並盡可能快地追在
+他們後面跑。大家還是會認為你是負責人。
+
+如果你應付得來，這是一份很棒的工作。
-- 
2.43.0

