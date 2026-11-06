Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964727;
	b=ohtjev16m5ybX9rIOkzwWJohtAR4X5V1Ii1+EtRIRN572skDoS6yXMVMKG/Z2cl1CLXw
	 9pZM7KY4c7ek/6qFMnoGnyL80VtxvpCQ40ATLxiWiaKUlhIJ5MNP2NyRnpbV7uLOrLMZ3
	 prf1IBwPIprI603TEv3g/QFpyf9V2i9SNYtK01YjfdfhMRGLowjM3y9uueOLvUyIU0u5t
	 V/tHFU6ijEWAkSHwaQRJiUuhQBXFA6jjha4HQuYCgeOn3aECaq9Z+tmmoi87SK6YuKf2R
	 RL2jllzEWi3+mgNMXZB7K/EpEf6dSmaU2ZVseWPV3PvgLotw5s1MfsQLrtcLrvFN0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PtV6cq4dyr3w2ghOOJN8RquIK5o5KTFWPxD8KVc0+kg=;
	b=SPBORLkLua3GPonKh6TickfKU4nxEuUWJos6s+kUcvt8xNYZx0L+EcZC6geqXe7oXQXx
	 8bLyditiBqob9VxSTNPqF4iNLJ7Zj8MWTDqx4M/gDn5AJ/ez3V/LZ0H2RpwpPeD/XdsdG
	 XcK8xElR4FL1OwrZZIw81ipVgYGZQDmLF5PCCrulOZxf5C2gMvZYD9o+pRA09eb8qjQeK
	 r3h8XyiEgFk6KtU1ofRMxuqiu6RmoVbry7M4WpGr8S36fHBJdWvryjeKOp1/Nm8lL7mbH
	 QR1LmilzdIEr2NfFxOfPtEfDBRm6DfjfY2U5L267u/N8bxhOz9IkFdFgxGlW3CV9FYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojXg+cUz;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A06082BFF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1A06082BFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojXg+cUz
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so65285a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964726; x=1794569526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtV6cq4dyr3w2ghOOJN8RquIK5o5KTFWPxD8KVc0+kg=;
        b=ojXg+cUzShwRqsR/uyeKq/S2Mfy3y3dl2CAwuwKTpKfQTkG3nVyIibtE0IOzLHi8Gb
         +UdQDKORt473SOnCiX8UzdDuKIhz0O4nuRn0SWmc7+vDr7ZFLnN+AT9AU53fCIYdMrpb
         th/SNsyC3Lw8nGjydxfJFJe8JnkFz9Al0LaHBVz2VDnn5xdDZW4ixmx3gTvIirXbjyPI
         q3xvNh8ZSD0y3130VQOu5RZkn1bqbVaLOcOeOqYva0yKk8wgM73kBgxkjWtr7wJTmrnk
         L0Smg1aKjSb1XBvVFJx5xp4Dn2G09JeqHJmlZP8Kdon3lLaoKVKzSip60uiM00CfavPI
         K3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964726; x=1794569526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtV6cq4dyr3w2ghOOJN8RquIK5o5KTFWPxD8KVc0+kg=;
        b=1XDQ40yIhh392Lca+t/SATGicM/u6p8XIs4kQkDptfHfV56wkYHOE4XZ0ncfqTev3C
         vNk6acPhzNRYJeEDmG0SRKM3ULl4TIESOVtoyGPeF58zPzsys/fhme+e7K0fpjRdvpSH
         iv5H9wJEL5al6U3zhccj4zE8gXgDFOwhhvDZ6Sn81TSJFyesYq8udz7DYaZ/5IlRNwq1
         EHORIDyUcU9xfiyyFutTovb9wD4TwgbnvBrJUgC2tuvc3ALvqIXmMrf/ei5kb6Nh8YJp
         0EIonjmnDAVZ5PowCUmQWT9rYW9nTZ6tA+ASNAYelpPSIAyOQyyGWm7V8JnQpKXkr4/U
         rNdA==
X-Forwarded-Encrypted: i=1; AL+hErGYluST91dmfNotRSKk39StPIPeZ6k6q1Y6lN4u0lsBw8SL5EVIffnXvuOdWd8c5ZgWsqYJRksSFbcRsKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T+EuhZ2eZJ+Ir4PETZNYyAI45siDU3yC7dKv1P64MV4j/Cle8
	pOUAgT2sftMLBfsFn1CUA1UZDJSYKabaTNPpSkSlBvUhpCB2Rw7u6QKA99qu+Q==
X-Gm-Gg: AYBFou3Eqx6WJM31KqS3y9+WaEpTGEojeUVLZCdmC7KcWHIbmA9maIZjKPhxn4Qyjvm
	fd88BNqM2Qgza/zXg8Mv+E69O/XIMIYSa4tsCVtMnEqSzwGh4l344h+AZ8w+1jlayKQCzhvFomb
	lnciVYmULlC5Aiqyu8gF1BqVHJePp02gvIVB3FQVzf0+LHJgi/ECt+oQG7cIbfMxYJYyeHCG54L
	+JPH/H2vOwKXFYtaTjwby58+Zz2QnE3ZsWwOtX4Ym4Wk/cMD5mlZ4EY7s6C4vP+mtziODcxZxtX
	Pqy8cCJl2uo3Wt+qNpmflZPWN8nBaS7AhZ8HyrkWOAOLpnJszvsF9ZxereQWIbrxpLpU8IfpE05
	Lm80pxSzbc/kIJ+kAWzRPyAmXgo5D+bonZqdW5fTLdMBVdUaOI9CjWru+LYTFXE7BKwsL2hX5OY
	5d60TKNqOGury/k1a1CDwBTKcOrxBBMKPi3hqo+U57x9v0yJ8MYgsx0VrQb99eSYDylvV8JzMNZ
	fuYKhjvvm2V7OpOa83C9mIS1uRmLcTiIjcdfOMBm1XbeJuigrBt0t+MNLQ3nKe6PQDdlLW6VRKW
	Vy114Kn0F7mcohn7nmRY8bWRTEJbQBC4r8dQpdBYGce1HcYrJplY49hwHxhjEt3eB0XZfF06EgU
	tdSWCL/FhO6GjGs/WiGBgWi7i
X-Received: by 2002:a17:90b:2590:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b0db014274mr3337386a91.0.1793964726098;
        Fri, 06 Nov 2026 03:32:06 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:05 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 05/25] docs/zh_TW: process: sync 6.Followthrough.rst with the English original
Date: Fri,  6 Nov 2026 19:31:20 +0800
Message-ID: <20261106113142.706783-6-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker and was still the
converted zh_CN text.  A section-by-section comparison against the
current English text shows it never picked up the coding-style and
code-sharing advice, and mistranslated a number of sentences.  Bring it
in line with the full current original:

- add the missing item on being prepared for coding style requests and
  for factoring code out into shared parts of the kernel
- retranslate sentences whose meaning had drifted (posting a perfect
  series "with the addition of" your engineering skills, a patch "of
  any significance", Linux still being around a decade from now,
  promoting employers' agendas at the expense of your own, Andrew
  Morton's suggestion of a code comment instead of a code change,
  patches going nowhere, subsystem trees feeding linux-next, everything
  applying cleanly, "where there are testers, there will be bug
  reports", nobody else fixing the regression for you, the limited
  resistance to patches opposed by the maintainer, and the community
  remembering your reaction)
- replace mainland terms with Taiwanese usage (內核, 代碼, 內存, 默認,
  信息, 響應, 硬件, 登錄, 郵件客戶端, ...) and the 爲/着/裏/喫
  conversion artifacts
- write MAINTAINERS file by name instead of translating it
- wrap the :Original: line to keep it within 80 columns, as in
  stable-api-nonsense.rst

update to commit fdd100ee60a0 ("docs: process: use gender-neutral
pronouns")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/6.Followthrough.rst         | 247 +++++++++---------
 1 file changed, 128 insertions(+), 119 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/6.Followthrough.rst b/Documentation/translations/zh_TW/process/6.Followthrough.rst
index 76082a15677f..81d16a088ba4 100644
--- a/Documentation/translations/zh_TW/process/6.Followthrough.rst
+++ b/Documentation/translations/zh_TW/process/6.Followthrough.rst
@@ -2,146 +2,155 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
+:Original: :ref:`Documentation/process/6.Followthrough.rst
+           <development_followthrough>`
 
 .. _tw_development_followthrough:
 
 跟進
 ====
 
-此時，您已經遵循了到目前爲止給出的指導方針，並且，隨着您自己的工程技能的增加，
-已經發布了一系列完美的補丁。即使是經驗豐富的內核開發人員也能犯的最大錯誤之一
-是，認爲他們的工作現在已經完成了。事實上，發佈補丁意味着進入流程的下一個階段，
-可能還需要做很多工作。
+此時，您已經遵循了到目前為止給出的指導方針，再加上您自己的工程技能，已經發
+布了一系列完美的補丁。即使是經驗豐富的核心開發人員也可能犯的最大錯誤之一，
+是認為他們的工作現在已經完成了。事實上，發布補丁意味著進入流程的下一個階段，
+可能還有相當多的工作要做。
 
-一個補丁在首次發佈時就非常出色、沒有改進的餘地，這是很罕見的。內核開發流程已
-認識到這一事實，因此它非常注重對已發佈代碼的改進。作爲代碼的作者，您應該與
-內核社區合作，以確保您的代碼符合內核的質量標準。如果不參與這個過程，很可能會
-無法將補丁合併到主線中。
+一個補丁在首次發布時就好到沒有改進的餘地，這是很罕見的。核心開發流程認識到
+這一事實，因此非常注重對已發布程式碼的改進。作為程式碼的作者，您應該與核心
+社群合作，以確保您的程式碼符合核心的品質標準。如果不參與這個過程，很可能會
+導致您的補丁無法被合併到主線中。
 
 與審閱者合作
 ------------
 
-任何意義上的補丁都會導致其他開發人員在審查代碼時發表大量評論。對於許多開發
-人員來說，與審閱人員合作可能是內核開發過程中最令人生畏的部分。但是如果你
+任何有一定份量的補丁，都會在其他開發人員審閱程式碼時引來不少評論。對於許多
+開發人員來說，與審閱者合作可能是核心開發過程中最令人生畏的部分。但是如果你
 記住一些事情，生活會變得容易得多：
 
- - 如果你已經很好地解釋了你的補丁，審閱人員會理解它的價值，以及爲什麼你會
-   費盡心思去寫它。但是這個並不能阻止他們提出一個基本的問題：在五年或十年後
-   維護含有此代碼的內核會怎麼樣？你可能被要求做出的許多改變——從編碼風格的
-   調整到大量的重寫——都來自於對Linux的理解，即從現在起十年後，Linux仍將
-   在開發中。
-
- - 代碼審查是一項艱苦的工作，這是一項相對喫力不討好的工作；人們記得誰編寫了
-   內核代碼，但對於那些審查它的人來說，幾乎沒有什麼長久的名聲。因此，審閱
-   人員可能會變得暴躁，尤其是當他們看到同樣的錯誤被一遍又一遍地犯下時。如果
-   你得到了一個看起來憤怒、侮辱或完全冒犯你的評論，請抑制以同樣方式回應的衝動。
-   代碼審查是關於代碼的，而不是關於人的，代碼審閱人員不會親自攻擊您。
-
- - 同樣，代碼審閱人員也不想以犧牲你僱主的利益爲代價來宣傳他們僱主的議程。
-   內核開發人員通常希望今後幾年能在內核上工作，但他們明白他們的僱主可能會改
-   變。他們真的，幾乎毫無例外地，致力於創造他們所能做到的最好的內核；他們並
-   沒有試圖給僱主的競爭對手造成不適。
-
-所有這些歸根結底就是，當審閱者向您發送評論時，您需要注意他們正在進行的技術
-評論。不要讓他們的表達方式或你自己的驕傲阻止此事。當你在一個補丁上得到評論
-時，花點時間去理解評論人想說什麼。如果可能的話，請修復審閱者要求您修復的內
-容。然後回覆審閱者：謝謝他們，並描述你將如何回答他們的問題。
-
-請注意，您不必同意審閱者建議的每個更改。如果您認爲審閱者誤解了您的代碼，請
-解釋到底發生了什麼。如果您對建議的更改有技術上的異議，請描述它並證明您對該
-問題的解決方案是正確的。如果你的解釋有道理，審閱者會接受的。不過，如果你的
-解釋證明缺乏說服力，尤其是當其他人開始同意審稿人的觀點時，請花些時間重新考慮
-一下。你很容易對自己解決問題的方法視而不見，以至於你沒有意識到某些東西完全
-是錯誤的，或者你甚至沒有解決正確的問題。
-
-Andrew Morton建議，每一個不會導致代碼更改的審閱評論都應該產生一個額外的代碼
-註釋；這可以幫助未來的審閱人員避免第一次出現的問題。
-
-一個致命的錯誤是忽視評論，希望它們會消失。它們不會走的。如果您在沒有對之前
-收到的評論做出響應的情況下重新發布代碼，那麼很可能會發現補丁毫無用處。
-
-說到重新發布代碼：請記住，審閱者不會記住您上次發佈的代碼的所有細節。因此，
-提醒審閱人員以前提出的問題以及您如何處理這些問題總是一個好主意；補丁變更
-日誌是提供此類信息的好地方。審閱者不必搜索列表檔案來熟悉上次所說的內容；
-如果您幫助他們直接開始，當他們重新查看您的代碼時，心情會更好。
-
-如果你已經試着做正確的事情，但事情仍然沒有進展呢？大多數技術上的分歧都可以
-通過討論來解決，但有時人們仍需要做出決定。如果你真的認爲這個決定對你不利，
-你可以試着向有更高權力的人上訴。對於本文，更高權力的人是 Andrew Morton 。
-Andrew 在內核開發社區中非常受尊敬；他經常爲似乎被絕望阻塞的事情清障。儘管
-如此，不應輕易就直接找 Andrew ，也不應在所有其他替代方案都被嘗試之前找他。
-當然，記住，他也可能不同意你的意見。
+ - 如果你已經很好地解釋了你的補丁，審閱者會理解它的價值，以及為什麼你會
+   費盡心思去寫它。但是這個價值並不能阻止他們提出一個基本的問題：五年或十
+   年後，維護一個含有此程式碼的核心會是什麼樣子？你可能被要求做出的許多改
+   變——從程式碼風格的調整到大量的重寫——都源於這樣的認識：十年後，Linux仍
+   將存在，並且仍在開發中。
+
+ - 程式碼審查是一項艱苦的工作，而且相對吃力不討好；人們記得誰編寫了核心程
+   式碼，但審查它的人卻很少能留下長久的名聲。因此，審閱者可能會變得暴躁，
+   尤其是當他們看到同樣的錯誤被一遍又一遍地犯下時。如果你收到的審閱意見看
+   起來憤怒、侮辱或完全冒犯，請抑制以同樣方式回應的衝動。程式碼審查針對的
+   是程式碼，而不是人，審閱者並不是在對您進行人身攻擊。
+
+ - 同樣，審閱者也不是要以犧牲你的利益為代價，來推動他們僱主的議程。核心開
+   發人員通常預期自己今後幾年仍會從事核心工作，但他們明白自己的僱主可能會
+   改變。他們真的幾乎毫無例外地致力於打造他們所能做到的最好的核心；他們並
+   沒有試圖給自己僱主的競爭對手製造麻煩。
+
+ - 對於看似無謂的程式碼風格修改要求，以及把部分程式碼抽出到核心共用部分的
+   要求，要有心理準備。維護人員的工作之一，就是讓各處看起來保持一致。有時
+   這意味著，你在驅動程式中為了繞過某個問題而寫的巧妙 hack，其實需要變成一
+   個通用的核心功能，供下次使用。
+
+所有這些歸根結底就是，當審閱者向您發送評論時，您需要注意他們提出的技術觀察。
+不要讓他們的表達方式或你自己的驕傲妨礙這一點。當你在一個補丁上得到審閱評論
+時，花點時間去理解審閱者想說什麼。如果可能的話，請修復審閱者要求您修復的內
+容。然後回覆審閱者：感謝他們，並描述你將如何回答他們的問題。
+
+請注意，您不必同意審閱者建議的每個更改。如果您認為審閱者誤解了您的程式碼，
+請解釋實際情況。如果您對建議的更改有技術上的異議，請描述它，並說明您對該問
+題的解決方案的理由。如果你的解釋有道理，審閱者會接受的。不過，如果你的解釋
+缺乏說服力，尤其是當其他人開始同意審閱者的觀點時，請花些時間重新考慮一下。
+你很容易被自己解決問題的方法蒙蔽，以至於沒有意識到某些東西根本上就是錯的，
+或者你甚至沒有在解決正確的問題。
+
+Andrew Morton建議，每一個沒有導致程式碼更改的審閱評論，都應該改為產生一個額
+外的程式碼註解；這可以幫助未來的審閱者避免再提出第一次出現過的問題。
+
+一個致命的錯誤是忽視審閱評論，希望它們會自行消失。它們不會消失的。如果您在
+沒有回應上次收到的評論的情況下重新發布程式碼，那麼很可能會發現您的補丁毫無
+進展。
+
+說到重新發布程式碼：請記住，審閱者不會記得您上次發布的程式碼的所有細節。因
+此，提醒審閱者先前提出的問題以及您如何處理這些問題，總是一個好主意；補丁變
+更日誌是提供此類資訊的好地方。審閱者不應該需要搜尋郵件列表存檔，才能熟悉上
+次討論的內容；如果您幫助他們快速進入狀況，當他們重新查看您的程式碼時，心情
+會更好。
+
+如果你已經試著把每件事都做對，但事情仍然沒有進展呢？大多數技術上的分歧都可
+以透過討論來解決，但有時就是必須有人做出決定。如果你真的認為這個決定錯誤地
+對你不利，你總是可以試著向更高權力者上訴。在撰寫本文時，這個更高權力者往往
+是 Andrew Morton。Andrew 在核心開發社群中非常受尊敬；他經常能夠疏通看似完全
+陷入僵局的情況。儘管如此，不應輕易就直接找 Andrew ，也不應在所有其他替代方
+案都被嘗試之前找他。當然，也請記住，他也可能不同意你的意見。
 
 接下來會發生什麼
 ----------------
 
-如果一個補丁被認爲適合添加到內核中，並且大多數審查問題得到解決，下一步通常
-是進入子系統維護人員的樹中。工作方式因子系統而異；每個維護人員都有自己的
-工作方式。特別是可能有不止一棵樹——也許一棵樹專門用於計劃下一個合併窗口的
-補丁，另一棵樹用於長期工作。
-
-對於應用到不屬於明顯子系統樹（例如內存管理修補程序）的區域的修補程序，默認樹
-通常上溯到-mm。影響多個子系統的補丁也可以最終進入-mm樹。
-
-包含在子系統樹中可以提高補丁的可見性。現在，使用該樹的其他開發人員將默認獲
-得補丁。子系統樹通常也爲Linux提供支持，使其內容對整個開發社區可見。在這一點
-上，您很可能會從一組新的審閱者那裏得到更多的評論；這些評論需要像上一輪那樣
-得到回應。
-
-在這時也會發生點什麼，這取決於你的補丁的性質，是否與其他人正在做的工作發生
-衝突。在最壞的情況下，嚴重的補丁衝突可能會導致一些工作被擱置，以便剩餘的補丁
-可以成形併合並。另一些時候，衝突解決將涉及到與其他開發人員合作，可能還會
-在樹之間移動一些補丁，以確保所有的應用都是乾淨的。這項工作可能是一件痛苦的
-事情，但也需慶幸現在的幸福：在linux-next樹出現之前，這些衝突通常只在合併窗口
-中出現，必須迅速解決。現在可以在合併窗口打開之前的空閒時間解決這些問題。
-
-有朝一日，如果一切順利，您將登錄並看到您的補丁已經合併到主線內核中。祝賀你！
-然而，一旦慶祝完了（並且您已經將自己添加到維護人員文件中），就一定要記住
-一個重要的小事實：工作仍然沒有完成。併入主線也帶來了它的挑戰。
-
-首先，補丁的可見性再次提高。可能會有以前不知道這個補丁的開發者的新一輪評論。
-忽略它們可能很有誘惑力，因爲您的代碼不再存在任何被合併的問題。但是，要抵制
-這種誘惑，您仍然需要對有問題或建議的開發人員作出響應。
-
-不過，更重要的是：將代碼包含在主線中會將代碼交給更多的一些測試人員。即使您
-爲尚未可用的硬件提供了驅動程序，您也會驚訝於有多少人會將您的代碼構建到內核
-中。當然，如果有測試人員，也可能會有錯誤報告。
-
-最糟糕的錯誤報告是迴歸。如果你的補丁導致迴歸，你會發現多到讓你不舒服的眼睛盯
-着你；迴歸需要儘快修復。如果您不願意或無法修復迴歸（其他人都不會爲您修復），
-那麼在穩定期內，您的補丁幾乎肯定會被移除。除了否定您爲使補丁進入主線所做的
-所有工作之外，如果由於未能修復迴歸而取消補丁，很可能會使將來的工作更難被合併。
-
-在處理完任何迴歸之後，可能還有其他普通缺陷需要處理。穩定期是修復這些錯誤並
-確保代碼在主線內核版本中的首次發佈儘可能可靠的最好機會。所以，請回應錯誤
-報告，並儘可能解決問題。這就是穩定期的目的；一旦解決了舊補丁的任何問題，就
-可以開始盡情創建新補丁。
-
-別忘了，還有其他節點也可能會創建缺陷報告：下一個主線穩定版本，當著名的發行
-商選擇包含您補丁的內核版本時等等。繼續響應這些報告是您工作的基本素養。但是
-如果這不能提供足夠的動機，那麼也需要考慮：開發社區會記住那些在合併後對代碼
-失去興趣的開發人員。下一次你發佈補丁時，他們會以你以後不會持續維護它爲前提
-來評估它。
+如果一個補丁被認為適合添加到核心中，並且大多數審閱問題都已解決，下一步通常
+是進入子系統維護人員的樹中。具體如何運作因子系統而異；每個維護人員都有自己
+的工作方式。特別是，可能有不止一棵樹——也許一棵樹專門用於計劃在下一個合併視
+窗合併的補丁，另一棵樹用於較長期的工作。
+
+對於不屬於任何明顯子系統樹的領域的補丁（例如記憶體管理補丁），預設的樹通常
+是-mm。影響多個子系統的補丁也可能最終經由-mm樹合併。
+
+被納入子系統樹可以提高補丁的能見度。現在，使用該樹的其他開發人員將預設獲得
+該補丁。子系統樹通常也會匯入linux-next，使其內容對整個開發社群可見。此時，
+您很可能會從一批新的審閱者那裡得到更多的評論；這些評論需要像上一輪那樣得到
+回應。
+
+在這個階段，取決於您補丁的性質，也可能會出現與其他人正在進行的工作發生衝突
+的情況。在最壞的情況下，嚴重的補丁衝突可能會導致一些工作被擱置，以便剩餘的
+補丁可以成形並合併。另一些時候，解決衝突將涉及與其他開發人員合作，可能還會
+在樹之間移動一些補丁，以確保所有補丁都能乾淨地套用。這項工作可能令人頭痛，
+但也該慶幸：在linux-next樹出現之前，這些衝突通常只在合併視窗期間出現，必須
+倉促解決。現在可以在合併視窗開啟之前從容地解決這些問題。
+
+有朝一日，如果一切順利，您將登入並看到您的補丁已經合併到主線核心中。恭喜！
+然而，一旦慶祝完了（並且您已經將自己添加到MAINTAINERS檔案中），就值得記住
+一個重要的小事實：工作仍然沒有完成。併入主線也帶來了它自己的挑戰。
+
+首先，補丁的能見度再次提高。可能會有以前不知道這個補丁的開發人員提出新一輪
+的評論。忽略它們可能很有誘惑力，因為您的程式碼已經不存在能否被合併的問題了。
+但是，要抵制這種誘惑；您仍然需要回應那些有問題或建議的開發人員。
+
+不過，更重要的是：被納入主線會將您的程式碼交到更大一群測試人員的手中。即使
+您貢獻的是尚未上市的硬體的驅動程式，您也會驚訝於有多少人會將您的程式碼建置
+到他們的核心中。當然，有測試人員的地方，就會有錯誤報告。
+
+最糟糕的錯誤報告是迴歸。如果你的補丁導致迴歸，你會發現多到讓你不舒服的眼睛
+盯著你；迴歸需要儘快修復。如果您不願意或無法修復迴歸（而且也沒有其他人替您
+修復），那麼在穩定期內，您的補丁幾乎肯定會被移除。除了抹煞您為使補丁進入主
+線所做的所有工作之外，因未能修復迴歸而被撤下補丁，很可能會使您將來的工作更
+難被合併。
+
+在處理完任何迴歸之後，可能還有其他普通錯誤需要處理。穩定期是修復這些錯誤的
+最好機會，並確保您的程式碼在主線核心版本中首次亮相時儘可能穩固。所以，請回
+應錯誤報告，並儘可能解決問題。這就是穩定期的目的；一旦舊補丁的任何問題都處
+理好了，就可以開始建立很酷的新補丁。
+
+別忘了，還有其他里程碑也可能會產生錯誤報告：下一個主線穩定版本、知名發行商
+採用包含您補丁的核心版本時等等。繼續回應這些報告，是對自己工作的基本自豪。
+但是如果這還不足以成為動機，那麼也值得考慮：開發社群會記住那些在程式碼合併
+後就失去興趣的開發人員。下一次你發布補丁時，他們會以你之後不會在場維護它為
+前提來評估它。
 
 其他可能發生的事情
 ------------------
 
-某天，當你打開你的郵件客戶端時，看到有人給你寄了一個代碼補丁。畢竟，這是
-讓您的代碼公開存在的好處之一。如果您同意這個補丁，您可以將它轉發給子系統
-維護人員（確保包含一個正確的From:行，這樣屬性是正確的，並添加一個您自己的
-signoff ），或者回復一個 Acked-by: 讓原始發送者向上發送它。
+某天，當你打開你的郵件用戶端時，可能會看到有人寄給你一個針對你程式碼的補丁。
+畢竟，這是讓您的程式碼公開的好處之一。如果您同意這個補丁，您可以將它轉發給
+子系統維護人員（確保包含一個正確的From:行，使作者歸屬正確，並添加一個您自己
+的 signoff），或者回覆一個 Acked-by: 讓原始發送者將它向上提交。
 
 如果您不同意補丁，請禮貌地回覆，解釋原因。如果可能的話，告訴作者需要做哪些
-更改才能讓您接受補丁。合併代碼的編寫者和維護者所反對的補丁的確存在着一定的
-阻力，但僅此而已。如果你被認爲不必要的阻礙了好的工作，那麼這些補丁最終會
-繞過你並進入主線。在Linux內核中，沒有人對任何代碼擁有絕對的否決權。可能除
-了Linus。
-
-在非常罕見的情況下，您可能會看到完全不同的東西：另一個開發人員發佈了針對您
-的問題的不同解決方案。在這時，兩個補丁之一可能不會被合併，“我的補丁首先
-發佈”不被認爲是一個令人信服的技術論據。如果有別人的補丁取代了你的補丁而進
-入了主線，那麼只有一種方法可以回應你：很高興你的問題解決了，請繼續工作吧。
-以這種方式把某人的工作推到一邊可能導致傷心和氣餒，但是社區會記住你的反應，
-即使很久以後他們已經忘記了誰的補丁真正被合併。
+更改才能讓您接受補丁。對於程式碼的作者和維護者所反對的補丁，合併時確實存在
+一定的阻力，但這種阻力也只有這麼大。如果你被認為在不必要地阻礙好的工作，那
+麼這些補丁最終會繞過你並進入主線。在Linux核心中，沒有人對任何程式碼擁有絕對
+的否決權。可能除了Linus。
+
+在非常罕見的情況下，您可能會看到完全不同的東西：另一個開發人員針對您的問題
+發布了不同的解決方案。這時，兩個補丁之一很可能不會被合併，而且“我的補丁先
+發布”並不被認為是一個令人信服的技術論據。如果有別人的補丁取代了你的補丁而
+進入了主線，那麼只有一種回應方式：為你的問題得到解決感到高興，然後繼續你的
+工作。自己的工作以這種方式被推到一邊，可能令人受傷和氣餒，但是在社群早已忘
+記究竟是誰的補丁被合併之後很久，他們仍會記得你的反應。
 
-- 
2.43.0

