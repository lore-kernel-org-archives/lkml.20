Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964732;
	b=4Vzv5LLzc5AamI+sR6toBDP4UXd9VjPwqDOkgDlbBsozLbBveZ0HxtN0r5ypBMr4sufH
	 3lLWTUVFnb1AMV1p5ILShUcy0hnPHFzSww7HuEo7rYr4jqK9rUVe0w9fl7UrP1oHYNVU+
	 4CscoEjgP7kDabjfA9GJ3Mt1VyljJZi88J/q/ehUnWifaBQPEfEIMrlPfhSEXLTZYotQp
	 vc2UNrKpKjuuN69zn049MC/gSEb27+LpD9n236DzvNozWk22wKno+k92s0Vjt6c/XnjQ1
	 N9XlTgQA7/pT1nI4NEO/jc3MAg65U5p26xYs0XEfuyf0+H9+NiPv9qRQ3g1xcy0IGBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6UzDQQC9pUpbFNJGCPAwBKGHS+Zn6EFgdW+XsfEYeU4=;
	b=tuwvhPuOGoKoqTadogIeKXCEgE8u9wHKi3z0EBuoe1735UBSxYuF+tJcGL4YWMK6PoAi
	 dFpvCBlIgc17RFpYmi2w4gFH/CSEz0maFoFbyM65LOjfS0kzKlqP69S5gTUAPNd7MrBHx
	 wtrJCVidfUkh/H7R2WsKlCdspVH2F6452iLoM/Le7o1lzba86MPcUJ1MD3Go9DCgp5e2D
	 i5zmj0dJuqyvlKhKeBRHDUZB0KSXx51KrJAX/0gCDVmMekST5FjQL2jbrVc85Vj+LpHOq
	 6HkrnIC8KhSFCylZZ8vf4xbOlZRcYTxcLE9jLBjnoqd4KwPAic+gvt6k7V997nch6Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUKFMQOr;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48BE606EE89
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48BE606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUKFMQOr
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso90994a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964731; x=1794569531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6UzDQQC9pUpbFNJGCPAwBKGHS+Zn6EFgdW+XsfEYeU4=;
        b=fUKFMQOrnhHAW2QfF/BQYk2v/auLaWwyMOfhr4iCicEfG6x6nYTODvfSYrRHMeOXtN
         0YkiJguUzTccrLv2PZnT5u190OXTaNoiLQx3Yld+XABEfykMCM0fJLP9SVejAxTzmNZr
         f1UVBFdKhmuI3ejOynWc4qEzFiLhYxgzlj+UakMpmMeir+3vrxZong1tPplFJq7kzfR6
         Hxb06iWlloM8/Pb7vhvtcQ0jTwnn+Sp4Cf/rRsEj3JN9597roOfeqPNGEMPGRplVugUS
         T92TPog9z487XOEM3P8qQwjJaVqI0Au7CZOuRQRN+L5JgpkYKeK5oOqtCDGLFl57s4JU
         hVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964731; x=1794569531;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UzDQQC9pUpbFNJGCPAwBKGHS+Zn6EFgdW+XsfEYeU4=;
        b=LUa9ZuT7F/tT/eubMCzcR5Z6Gro+KNdmDpgsSl1Jtdn4X+dIP2sNi82Bf0zXFYNZMo
         J+qsgFKdFzjEby63v9ILtY/Hf1NpZ3Hbccd6NSpK+CI4uPTiccYPs0epRcvvn9FfXK9i
         E3Cv+cXSqhbINtrH6/vXuLoxSk+lNAeCFaSfwC/g5WKkH4f/gYKHCWf7iLQIx0RsxA9k
         1WCnhOpe+SRIROEypn6A/K94O3KNvpt+MUbRlU8gMwVsVr88HwOkdbgF+aNjdTBtHhYZ
         3kOeaF7axsKb1SK5JV63Qa4bodloAkFgC4hPyKS6lVacVO71IYxzsfan+nIZ6xQHh25u
         7WFQ==
X-Forwarded-Encrypted: i=1; AL+hErGG6anoXY9EaT/ZosIlfu5hIjnrJKzvBKutfH8ot/z+m8hsqWB2kj8Rv2+ZM4bKb8fsY2N15d5vsiz5KgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qAdrz1wERHRY8B0xaSnVf/HmUe+ZCfUqGPGfZVyssC7gA4HJN
	gZXN9luPhMc9AxxS/WCqMdXGxnIpEBs9+kxLLZqampK38gtwo//yMz4D
X-Gm-Gg: AYBFou09Qv/FJcNQ869DFtVQQHcQ3EeMaJUJdkza7rcLcv+Hel3k6ljZuB0pPpCANJA
	zFUJ6JlMx5I1zKJoWtXtsrdb4XswBZda/W4OEiGi7PhyhOAnitCpEwysf7ZnyDlRccNJr+QeC/l
	Qk3CLpK0hULcsZ5yfXxWGvHvXwJLv5PEZs6nRk/f9vk3ZCIIgJEwDVwZoAbarBKVtDen9z1tbbU
	avTQUAlRX1/mT6wzCdmwkfDERPy67rOKwNxJ/hjVsthIopyYruQ2BFyPoeMq5emvggsqDPPeJ6W
	pNYCcTnTS32X7RQP+C70V3mfJasUn5b9blbrvyk2J4t61/d0Gfjfq8jzv3wHL1eGNWNeJwqV3uq
	4l0APy3OgGJsGv4efnTC2JJpkHPwWbvSTa6vDv9PffhvKPXu888HpZhxWLMt9GXL42ML+o3iWki
	10+SX2gzPvzTMHQf5PpwcGPm4gcdqK8zWFxGPyVqJt7agzw1rHwBr6ja27UdgBwxqGsL0pjuoUY
	gTuT6l4WKjHoDFnELf8SbSrciqGgqX9KPc0AIK5HCmfBUiYUj0owk/MPpDjQjHcTNgoi8mSl5ES
	tqevxQdNWiLP7Tw+CYm4/4gNC/aEPXEZprcWK30yM/4n3o0tyV1SK5BRaqBzSexF9WnQeQkzmjA
	OWWnMm7NOBp7j4naaT/MBGVQN
X-Received: by 2002:a17:90a:c10f:b0:3ae:629:ca12 with SMTP id 98e67ed59e1d1-3b0db6c47dfmr3394686a91.3.1793964730989;
        Fri, 06 Nov 2026 03:32:10 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:09 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 06/25] docs/zh_TW: process: sync 7.AdvancedTopics.rst with the English original
Date: Fri,  6 Nov 2026 19:31:21 +0800
Message-ID: <20261106113142.706783-7-chenyou910331@gmail.com>
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

The translation was marked as updated to commit 5ce70894f6ca ("Doc:
correct spelling and wording mistakes"), but its content predates
commit 93431e0607e5 ("Replace HTTP links with HTTPS ones:
documentation") and commit 6e55b1cbf05d ("docs: try to encourage
(netdev?) reviewers"): the lwn.net link was still http:// and the
reviewing section lacked the paragraphs added by "docs: try to encourage
(netdev?) reviewers".  A section-by-section comparison against the
current English text brings it in line with the full current original:

- add the _reviews label and the missing reviewing advice: asking
  others to chime in when a discussion stalls, reviews in plain English
  being encouraged even when a Reviewed-by tag is given, and throwing
  in a compliment once in a while
- switch the lwn.net link to https
- capitalize Git where the original now refers to the tool, and fix the
  BitKeeper spelling
- retranslate sentences whose meaning had drifted (pushing changes that
  do not fast-forward, overriding that check, moving work into public
  branches once it is reasonably advanced, ill-advised changes slipping
  in below the review radar)
- keep the Linus quote in its literal block in English and add a
  Chinese translation after it, as in 2.Process.rst
- replace tabs with spaces in the URL block, and wrap the :Original:
  line to keep it within 80 columns, as in stable-api-nonsense.rst

update to commit 4a0be1a25d98 ("Documentation: process: Capitalize Git,
Quilt, and Mercurial consistently")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/7.AdvancedTopics.rst        | 53 +++++++++++++------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
index 392c00213078..161c1afdd43f 100644
--- a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
@@ -2,7 +2,8 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/7.AdvancedTopics.rst <development_advancedtopics>`
+:Original: :ref:`Documentation/process/7.AdvancedTopics.rst
+           <development_advancedtopics>`
 
 .. _tw_development_advancedtopics:
 
@@ -15,20 +16,20 @@
 使用Git管理補丁
 ---------------
 
-核心使用分散式版本控制始於2002年初，當時Linus首次開始使用專有的Bitkeeper應用
+核心使用分散式版本控制始於2002年初，當時Linus首次開始使用專有的BitKeeper應用
 程式。雖然BitKeeper存在爭議，但它所體現的軟體版本管理方法卻肯定不是。分散式
 版本控制可以立即加速核心開發專案。現在有好幾種自由的BitKeeper替代品。
 但無論好壞，核心專案都已經選擇了Git作為其工具。
 
 使用Git管理補丁可以使開發人員的生活更加輕鬆，尤其是隨著補丁數量的增長。Git也
 有其粗糙的邊角和一定的危險性，它是一個年輕和強大的工具，仍然在其開發人員完善
-中。本文件不會試圖教會讀者如何使用git；這會是個巨長的文件。相反，這裡的重點
+中。本文件不會試圖教會讀者如何使用Git；這會是個巨長的文件。相反，這裡的重點
 將是Git如何特別適合核心開發過程。想要加快用Git速度的開發人員可以在以下網站上
 找到更多資訊：
 
-	https://git-scm.com/
+        https://git-scm.com/
 
-	https://www.kernel.org/pub/software/scm/git/docs/user-manual.html
+        https://www.kernel.org/pub/software/scm/git/docs/user-manual.html
 
 同時網上也能找到各種各樣的教程。
 
@@ -39,7 +40,7 @@
 快進合併、推拉、遊離頭等。一開始可能有點嚇人，但這些概念不難透過一點學習來
 理解。
 
-使用git產生透過電子郵件提交的補丁是提高速度的一個很好的練習。
+使用Git產生透過電子郵件提交的補丁是提高速度的一個很好的練習。
 
 當您準備好開始建立Git樹供其他人查看時，無疑需要一個可以從中拉取的伺服器。
 如果您有一個可以連上網際網路的系統，那麼使用git-daemon設定這樣的伺服器相對
@@ -50,14 +51,14 @@
 正常的Git工作流程涉及到許多分支的使用。每一條開發線都可以分為單獨的“主題
 分支”，並獨立維護。Git的分支很容易使用，沒有理由不使用它們。而且，在任何
 情況下，您都不應該在任何您打算讓其他人從中拉取的分支中進行開發。應該小心地
-建立公開可用的分支；當開發分支處於完整狀態並已準備好時(而不是之前）才合併
+建立公開可用的分支；當開發分支處於完整狀態並已準備好時（而不是之前）才合併
 開發分支的補丁。
 
 Git提供了一些強大的工具，可以讓您重寫開發歷史。一個不方便的補丁（比如說，
 一個打破二分法的補丁，或者有其他一些明顯的缺陷）可以在適當的位置修復，或者
 完全從歷史中消失。一個補丁系列可以被重寫，就好像它是在今天的主線上寫的一樣，
 即使你已經花了幾個月的時間在寫它。可以透明地將更改從一個分支轉移到另一個
-分支。等等。明智地使用git修改歷史的能力可以幫助建立問題更少的乾淨補丁集。
+分支。等等。明智地使用Git修改歷史的能力可以幫助建立問題更少的乾淨補丁集。
 
 然而，過度使用這種功能可能會導致其他問題，而不僅僅是對建立完美專案歷史的
 簡單癡迷。重寫歷史將重寫該歷史中包含的更改，將經過測試（希望如此）的核心樹
@@ -67,11 +68,11 @@ Git提供了一些強大的工具，可以讓您重寫開發歷史。一個不
 在此後通常被認為是不可變的。
 
 因此，一旦將一組更改推送到公開可用的伺服器上，就不應該重寫這些更改。如果您
-嘗試強制進行無法快進合併的更改（即不共享同一歷史記錄的更改），Git將嘗試強制
-執行此規則。這可能覆蓋檢查，有時甚至需要重寫導出的樹。在樹之間移動變更集以
-避免linux-next中的衝突就是一個例子。但這種行為應該是罕見的。這就是為什麼
-開發應該在私有分支中進行（必要時可以重寫）並且只有在公共分支處於合理的較新
-狀態時才轉移到公共分支中的原因之一。
+嘗試推送無法快進合併的更改（即不共享同一歷史記錄的更改），Git將嘗試強制執行
+此規則。可以覆蓋這項檢查，有時也可能確實需要重寫已導出的樹。在樹之間移動變更
+集以避免linux-next中的衝突就是一個例子。但這種行為應該是罕見的。這就是為什麼
+開發應該在私有分支中進行（必要時可以重寫），並且只有在開發進入相當成熟的狀態
+時才轉移到公共分支中的原因之一。
 
 當主線（或其他一組變更所基於的樹）前進時，很容易與該樹合併以保持領先地位。
 對於一個私有的分支，rebasing 可能是一個很容易跟上另一棵樹的方法，但是一旦
@@ -83,16 +84,21 @@ Git提供了一些強大的工具，可以讓您重寫開發歷史。一個不
 就不必重複相同的工作。
 
 關於Git這樣的工具的一個最大的反覆抱怨是：補丁從一個儲存庫到另一個儲存庫的
-大量移動使得很容易陷入錯誤建議的變更中，這些變更避開審查雷達進入主線。當內
+大量移動使得考慮欠周的變更很容易混入，在審查雷達之下溜進主線。當內
 核開發人員看到這種情況發生時，他們往往會感到不高興；在Git樹上放置未審閱或
 主題外的補丁可能會影響您將來讓樹被拉取的能力。引用Linus的話:
 
 ::
 
-   你可以給我發補丁，但當我從你那裡拉取一個Git補丁時，我需要知道你清楚
-   自己在做什麼，我需要能夠相信事情而 *無需* 手動檢查每個單獨的更改。
+        You can send me patches, but for me to pull a Git patch from you, I
+        need to know that you know what you're doing, and I need to be able
+        to trust things *without* then having to go and check every
+        individual change by hand.
 
-（http://lwn.net/Articles/224135/）。
+（中譯：你可以給我發補丁，但當我從你那裡拉取一個Git補丁時，我需要知道你清楚
+自己在做什麼，我需要能夠相信事情而 *無需* 手動檢查每個單獨的更改。）
+
+(https://lwn.net/Articles/224135/)。
 
 為了避免這種情況，請確保給定分支中的所有補丁都與相關主題緊密相關；“驅動程式
 修復”分支不應更改核心記憶體管理程式碼。而且，最重要的是，不要使用Git樹來繞過
@@ -107,6 +113,8 @@ Git提供了一些強大的工具，可以讓您重寫開發歷史。一個不
 更改。在這方面 git request-pull 命令非常有用；它將按照其他開發人員所期望的
 格式化請求，並檢查以確保您已記得將這些更改推送到公共伺服器。
 
+.. _tw_development_advancedtopics_reviews:
+
 審閱補丁
 --------
 
@@ -121,9 +129,20 @@ Git提供了一些強大的工具，可以讓您重寫開發歷史。一個不
 閱者最好的建議是：把審閱評論當成問題而不是批評。詢問“在這條路徑中如何釋放
 鎖？”總是比說“這裡的鎖是錯誤的”更好。
 
+出現分歧時，另一個有用的技巧是邀請其他人加入討論。如果幾輪交流後討論陷入
+僵局，就請其他審閱者或維護者發表意見。通常，與某位審閱者意見一致的人除非被
+點名，否則往往保持沉默。多人的意見會帶來成倍的分量。
+
 不同的開發人員將從不同的角度審查程式碼。部分人會主要關注程式碼風格以及程式
 碼行是否有尾隨空格。其他人會主要關注補丁作為一個整體實作的變更是否對核心有
 好處。同時也有人會檢查是否存在鎖問題、堆疊使用過度、可能的安全問題、在其他
 地方發現的程式碼重複、足夠的文件、對效能的不利影響、使用者空間ABI更改等。
 所有類型的檢查，只要它們能引導更好的程式碼進入核心，都是受歡迎和值得的。
 
+並沒有嚴格要求一定要使用 ``Reviewed-by`` 這類特定標籤。事實上，即使提供了
+標籤，也鼓勵用淺白的英文寫下審閱意見，這樣資訊量更大，例如：“我看過了這次
+提交的 A、B 和 C 方面，看起來沒有問題。”顯然，某種形式的審閱訊息或回覆是
+必要的，否則維護者根本無從得知審閱者是否看過這個補丁！
+
+最後但同樣重要的是，補丁審閱可能會變成一個專注於指出問題的負面過程。請偶爾
+給予稱讚，特別是對新手！
-- 
2.43.0

