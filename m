Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964771;
	b=ckYusOxwYsmU73uwSVrJeq9v07qiERGvRPb83dkZWK20wWL9Od1+7oDDpfbXB9GiCrw6
	 S8UJTx6VhDP9vRunSpZGwvmVTNakUnNP99amAEUIP5jCyy0QQwhdB3YX1lEc/d7XfsjQE
	 pvSByqki8vMiWa/RI08Dr5bMOjWQ382RWf1tQjFMKwcBtIe626BwjBBdf9jEbcJBs7HOr
	 ZoZgELWsS3P/k+sPQN8JCDWJkCPA8x2izhoELnhQFmLoTbSeyQNLuO25l7An9cPU6NshC
	 p+6HX6AFyQ9WBmFUDd/mi7hKnGHGrB31959FzGPkzg/HJrgPIcrXEDALr4KMkXLyb0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mR7m2fQTRsXPNQiuhhMPUkmFQDy9mcZA3Fze0rAnqZg=;
	b=jxoHGMO9R0VZgHS6urxzF2LjW80LLP1d4LlqEPJiJqrazRmjgPxskzuUKMjXX0uXF7EZ
	 UVFFrVlyfVdFRPR9ubvR5zS/idkdYrJPawLd6A1Bbd/umh9fdLN1pMVOVif1LgqUHuUQP
	 U8i+6N7gkDWYOAiyPeq04jnEKovMr+ewqxsP+r6gfzlR7cANUL97k+OEpRtD5pvDp0jjg
	 ZrhSEKwqQIUv6dBUEry96pP+6ZRDsi7E7SIVN5IcMZgGqjvqcH0FmFNG9QZvCwN0Zff5w
	 lYvRRiMPD30Jp1Jtg+LM/p0xMns35zWfQHB2y/+OOQk3lVyt8gY92ZZPH1U8cyqkElQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P7sqyfU5;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD02606C7DB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD02606C7DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P7sqyfU5
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso106711a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964770; x=1794569570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mR7m2fQTRsXPNQiuhhMPUkmFQDy9mcZA3Fze0rAnqZg=;
        b=P7sqyfU5IWhMtwqQibuc3T8fsW/3pXIG3dZoerYp0zjOEzyoFQ52HBd6N1heyJ7EBo
         Gu1KJ/i7pPqR3TvdsjsZm5fJ5S3MpUnLQREzTx+62jeX6dEOZt0k5qMsHi734hvxLJrq
         xgLUclQN//h3rlhtdbPws7EGRPahbfT9/0ZKevL06OLWbFtMcaLQh6wCKxuFAj4CjER0
         EIyVwQ+DXLcGsL0W0SyNAhm9Yg2IzKn5cEYTRNtsiFrBT/Rwm43rHq6j5AZIDR2ZJUGM
         HRwbmEzEVqNmUASsj1TSvyjP4GGovdXCTzXeRNrEMjUO5Fv2H7yT0w2fAeuXWoTqltF8
         7a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964770; x=1794569570;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mR7m2fQTRsXPNQiuhhMPUkmFQDy9mcZA3Fze0rAnqZg=;
        b=VIuGNcXKAvCpDxTAnCr9JQcNhnZtrRwi9fvdh2iXjTPfrLs4poSZsFGPutpGvOV8Yy
         qgHMdHwfS1qeKZz16BSHA/3KDv42kI4lWYogIn3YNNQFG6QBioniR8eTmzfN3ujye1YF
         BAY+0tn0t2DX8nPtslK9Tbcc7IIUJ7C6MhJyTkDuRevuMvLt6/k75/jhpMvdQ24qQc6r
         DWlX/MziHbRyTlOuN12e0aCAtCX+G0nKTtQvNTESSWJv5P7aqbCFOygzSjKZVkVoe/dh
         yLo6ZqJIcIzmnIK5O50YjVez5MJ38j2GGrjkN3ZZlDVigvXBoNmD6wkJscFb/KkeZPGG
         PR2A==
X-Forwarded-Encrypted: i=1; AL+hErFb+Q10qWD3WRnY9arUYVwXzlM4Cdx57yVHMxZonrCp3gtJBEqanmVoxEw9ct+E6j09y5daL5t62dTLzro=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iNaI1Q9lIK8k8R9ajeaFDUzFgvgudn/XUmVBH1oXnYD5254D1
	XKJZY0kchvX5XkNO1mPhiir1d0Z5GZf7iZx751f/n7JP/xyt9tysta/x
X-Gm-Gg: AYBFou2PMcpEovYsFVtiM+ftHvSuxXzDDZf0BTBQu5jp3sBAEtbnaiCqpNyfaCOzCs9
	sm/+ksuPJUlArwIJo1EIrgP5LmO8O7bq+1p7XdXC5qV4V8Zkx8nd3Smp5Jdph4Dld0bgaEnjtTD
	30D2to2PeEWvj6gZxvMBwCRqGYuT8IRfNozXtPZ2MoSzbcjkdrcLWvyTk7qf6OSRfULC8//B2AN
	BrKWdlSq32j4zCblroL13OUwQ/So1dBYpOBbBJQUh2yQFyzMKV0k21EdUDd7YKqXZ5USKUOG3YF
	mPwdgPyG2xN5xqnwKrbDeroxW4YyiI/BcP7RQZKW/JmNeJR3WAl/wHbPmxgnHPL766WHQhdPX7I
	WlNCIN4A02+/4JJ1+YH7Tgm9VngmufLe1+9Rjol61V4Fho8BDKWSaVCEGqZH37cfPx66PXOI7v3
	r71veyVoZHjHzOWFDRIQTCxw3ji9A2duIW2vkPor6MTg5wQPA3qZ9YR8MxZwZV8xwfnp7wZHFmd
	36KYlj+vfpQBPfcRuRF7thqz8ZGczXBoRG+kH6+V/wKILLnr0OusuBz0u8kNzL5duxggcwtxXqN
	7BWj9ZfZAQN0SYGFhE7vXyHKYoSFZ1mQ5lHYlvY+voo++AXGRXlDzx507N9x4tZtY9DMiTYFOWO
	r6NSN7fLb+K2zcD90izSLD3lNlh8WcjjmeD4x+NN3Eo+XSA==
X-Received: by 2002:a17:90b:224e:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3b0db62ffb8mr3300484a91.2.1793964770045;
        Fri, 06 Nov 2026 03:32:50 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:49 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 18/25] docs/zh_TW: process: sync 3.Early-stage.rst with the English original
Date: Fri,  6 Nov 2026 19:31:33 +0800
Message-ID: <20261106113142.706783-19-chenyou910331@gmail.com>
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
against the current English text shows it never picked up several
later changes, and the prose was converted from zh_CN with a number of
sentences that drifted from the original:

- add the missing sentence from
  commit f1a693994b1c ("Documentation/process: use
  scripts/get_maintainer.pl on patches") that running the script on a
  patch is the preferred way to get the Cc list
- use the HTTPS LWN and Linux Foundation NDA URLs from
  commit 93431e0607e5 ("Replace HTTP links with HTTPS ones:
  documentation") and commit 997023047459 ("docs: Update the location of
  the LF NDA program"), and capitalize Git and write "git log" as in
  commit 4a0be1a25d98 ("Documentation: process: Capitalize Git, Quilt,
  and Mercurial consistently")
- retranslate sentences whose meaning had drifted: audio "dropouts"
  (rendered as exiting), "your author has seen" (rendered as "some
  author posted"), "no shortage of people with grand plans and little
  code", code "not cleared for release under a GPL-compatible
  license", a company that "legitimately" cannot disclose its plans,
  "a hostile reaction", and the Devicescape and AppArmor items
- spell Devicescape and AppArmor as in the original
- localize terminology (內核→核心, 代碼→程式碼, 項目→專案, 模塊→模組,
  用戶→使用者, 社區→社群, 文件系統→檔案系統, 信息→資訊, 補丁→修補程式,
  爲→為, 裏→裡)
- expand the tabs in the quoted block

update to commit 4a0be1a25d98 ("Documentation: process: Capitalize Git,
Quilt, and Mercurial consistently")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/3.Early-stage.rst           | 192 +++++++++---------
 1 file changed, 96 insertions(+), 96 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/3.Early-stage.rst b/Documentation/translations/zh_TW/process/3.Early-stage.rst
index 7d7ecf9658e5..deb5baa4e53f 100644
--- a/Documentation/translations/zh_TW/process/3.Early-stage.rst
+++ b/Documentation/translations/zh_TW/process/3.Early-stage.rst
@@ -9,155 +9,155 @@
 早期規劃
 ========
 
-當考慮一個Linux內核開發項目時，很可能會直接跳進去開始編碼。然而，與任何重要
-的項目一樣，許多成功的基礎最好是在第一行代碼編寫之前就打下。在早期計劃和
-溝通中花費一些時間可以在之後節省更多的時間。
+當考慮一個Linux核心開發專案時，很容易想直接跳進去開始寫程式。然而，與任何
+重要的專案一樣，許多成功的基礎最好是在寫下第一行程式碼之前就打好。在早期規
+劃和溝通上花一些時間，可以在之後節省更多的時間。
 
 搞清問題
 --------
 
-與任何工程項目一樣，成功的內核改善從清晰描述要解決的問題開始。在某些情況
-下，這個步驟很容易：例如當某個特定硬件需要驅動程序時。不過，在其他情況下，
-很容易將實際問題與建議的解決方案混在一起，這可能會導致麻煩。
+與任何工程專案一樣，成功的核心改進從清楚描述要解決的問題開始。在某些情況
+下，這個步驟很容易：例如當某個特定硬體需要驅動程式時。不過，在其他情況下，
+很容易將實際問題與建議的解決方案混為一談，這可能會導致麻煩。
 
-舉個例子：幾年前，Linux音頻的開發人員尋求一種方法來運行應用程序，而不會因
-系統延遲過大而導致退出或其他問題。他們得到的解決方案是一個連接到Linux安全
-模塊（LSM）框架中的內核模塊；這個模塊可以配置爲允許特定的應用程序訪問實時
-調度程序。這個模塊被實現併發到linux-kernel郵件列表，在那裏它立即遇到了麻煩。
+舉個例子：幾年前，從事Linux音訊工作的開發人員尋求一種方法，讓應用程式在執
+行時不會因系統延遲過大而產生斷音或其他雜音。他們得到的解決方案是一個掛接到
+Linux安全模組（LSM）框架中的核心模組；這個模組可以設定為允許特定的應用程式
+使用即時排程器。這個模組被實作出來並發送到linux-kernel郵件列表，在那裡它立
+即遇到了麻煩。
 
-對於音頻開發人員來說，這個安全模塊足以解決他們當前的問題。但是，對於更廣泛的
-內核社區來說，這被視爲對LSM框架的濫用（LSM框架並不打算授予他們原本不具備的
-進程特權），並對系統穩定性造成風險。他們首選的解決方案包括短期的通過rlimit
-機制進行實時調度訪問，以及長期的減少延遲的工作。
+對於音訊開發人員來說，這個安全模組足以解決他們眼前的問題。但是，對於更廣泛的
+核心社群來說，這被視為對LSM框架的濫用（LSM框架並不是用來授予行程原本不具備
+的特權的），並對系統穩定性造成風險。他們偏好的解決方案是短期內透過rlimit機
+制取得即時排程的權限，長期則持續進行減少延遲的工作。
 
-然而，音頻社區無法超越他們實施的特定解決方案來看問題；他們不願意接受替代方案。
-由此產生的分歧使這些開發人員對整個內核開發過程感到失望；其中一個開發人員返回
-到audio列表併發布了以下內容：
+然而，音訊社群無法跳脫他們已實作的特定解決方案來看問題；他們不願意接受替代
+方案。由此產生的分歧使這些開發人員對整個核心開發過程感到幻滅；其中一位開發
+人員回到一個音訊郵件列表上，發表了以下內容：
 
-	有很多非常好的Linux內核開發人員，但他們往往會被一羣傲慢的傻瓜所壓倒。
-	試圖向這些人傳達用戶需求是浪費時間。他們太“聰明”了，根本聽不到少數
-	人的話。
+        有很多非常好的Linux核心開發人員，但他們的聲音往往被一大群傲慢的
+        傻瓜蓋過。試圖向這些人傳達使用者的需求是浪費時間。他們太「聰明」
+        了，根本不屑聽凡夫俗子的話。
 
-（http://lwn.net/Articles/131776/）
+(https://lwn.net/Articles/131776/)。
 
-實際情況卻是不同的；與特定模塊相比，內核開發人員更關心繫統穩定性、長期維護
+實際情況卻是不同的；與特定模組相比，核心開發人員更關心系統穩定性、長期維護
 以及找到問題的正確解決方案。這個故事的寓意是把重點放在問題上——而不是具體的
-解決方案上——並在開始編寫代碼之前與開發社區討論這個問題。
+解決方案上——並在投入時間寫出大量程式碼之前，先與開發社群討論這個問題。
 
-因此，在考慮一個內核開發項目時，我們應該得到一組簡短問題的答案：
+因此，在考慮一個核心開發專案時，應該先得到以下幾個簡短問題的答案：
 
  - 需要解決的問題究竟是什麼？
 
- - 受此問題影響的用戶有哪些？解決方案應該解決哪些使用案例？
+ - 受此問題影響的使用者有哪些？解決方案應該涵蓋哪些使用情境？
 
- - 內核現在爲何沒能解決這個問題？
+ - 核心目前在處理這個問題上有何不足？
 
-只有這樣，才能開始考慮可能的解決方案。
+只有這樣，開始考慮可能的解決方案才有意義。
 
 
 早期討論
 --------
 
-在計劃內核開發項目時，在開始實施之前與社區進行討論是很有意義的。早期溝通可以
-通過多種方式節省時間和麻煩：
+在規劃核心開發專案時，在開始實作之前與社群進行討論是很有意義的。早期溝通可以
+透過多種方式節省時間和麻煩：
 
- - 很可能問題是由內核以您不理解的方式解決的。Linux內核很大，具有許多不明顯
-   的特性和功能。並不是所有的內核功能都像人們所希望的那樣有文檔記錄，而且很
-   容易遺漏一些東西。某作者發佈了一個完整的驅動程序，重複了一個其不
-   知道的現有驅動程序。重新發明現有輪子的代碼不僅浪費，而且不會被接受到主線
-   內核中。
+ - 很可能核心已經以您沒有理解的方式處理了這個問題。Linux核心很大，具有許多不
+   明顯的特性和功能。並不是所有的核心功能都有人們所希望的那樣完善的文件，很容
+   易遺漏一些東西。本文作者就曾見過有人發布一個完整的驅動程式，卻與一個新作者
+   不知道的既有驅動程式重複。重新發明輪子的程式碼不僅浪費，而且也不會被主線核
+   心接受。
 
- - 建議的解決方案中可能有一些要素不適合併入主線。在編寫代碼之前，最好先了解
-   這樣的問題。
+ - 建議的解決方案中可能有一些要素無法被接受合併到主線。在編寫程式碼之前，最好
+   先發現這類問題。
 
  - 其他開發人員完全有可能考慮過這個問題；他們可能有更好的解決方案的想法，並且
-   可能願意幫助創建這個解決方案。
+   可能願意幫助實作這個解決方案。
 
-在內核開發社區的多年經驗給了我們一個明確的教訓：閉門設計和開發的內核代碼總是
-有一些問題，這些問題只有在代碼發佈到社區中時纔會被發現。有時這些問題很嚴重，
-需要數月或數年的努力才能使代碼達到內核社區的標準。例如：
+與核心開發社群多年來的經驗給了我們一個明確的教訓：閉門設計和開發的核心程式碼
+總是有一些問題，這些問題只有在程式碼發布到社群中時才會被發現。有時這些問題很
+嚴重，需要數月或數年的努力才能使程式碼達到核心社群的標準。例如：
 
- - 設計並實現了單處理器系統的DeviceScape網絡棧。只有使其適合於多處理器系統，
-   才能將其合併到主線中。在代碼中修改鎖等等是一項困難的任務；因此，這段代碼
-   （現在稱爲mac80211）的合併被推遲了一年多。
+ - Devicescape網路堆疊是針對單處理器系統設計和實作的。在使其適用於多處理器系
+   統之前，它無法合併到主線中。事後為程式碼加上鎖等機制是一項困難的任務；因
+   此，這段程式碼（現在稱為mac80211）的合併被推遲了一年多。
 
- - Reiser4文件系統包含許多功能，核心內核開發人員認爲這些功能應該在虛擬文件
-   系統層中實現。它還包括一些特性，這些特性在不將系統暴露於用戶引起的死鎖的
-   情況下是不容易實現的。這些問題過遲發現——以及拒絕處理其中一些問題——已經
-   導致Reiser4置身主線內核之外。
+ - Reiser4檔案系統包含許多功能，而核心的主要開發人員認為這些功能應該在虛擬檔
+   案系統層中實作。它還包括一些特性，這些特性很難在不讓系統面臨使用者引起的死
+   鎖的情況下實作。這些問題過晚才被揭露——以及拒絕處理其中一些問題——導致
+   Reiser4一直被排除在主線核心之外。
 
- - Apparmor安全模塊以被認爲不安全和不可靠的方式使用內部虛擬文件系統數據結構。
-   這種擔心（包括其他）使Apparmor多年來無法進入主線。
+ - AppArmor安全模組使用內部虛擬檔案系統資料結構的方式，被認為不安全且不可靠。
+   這個顧慮（以及其他顧慮）使AppArmor多年來無法進入主線。
 
-在這些情況下，與內核開發人員的早期討論，可以避免大量的痛苦和額外的工作。
+在這些情況下，只要及早與核心開發人員討論，就可以避免大量的痛苦和額外的工作。
 
 找誰交流？
 ----------
 
-當開發人員決定公開他們的計劃時，下一個問題是：我們從哪裏開始？答案是找到正確
-的郵件列表和正確的維護者。對於郵件列表，最好的方法是在維護者(MAINTAINERS)文件
-中查找要發佈的相關位置。如果有一個合適的子系統列表，那麼其上發佈通常比在
-linux-kernel上發佈更可取；您更有可能接觸到在相關子系統中具有專業知識的開發
-人員，並且環境可能具支持性。
+當開發人員決定公開他們的計畫時，下一個問題是：我們從哪裡開始？答案是找到正確
+的郵件列表和正確的維護者。對於郵件列表，最好的方法是在MAINTAINERS檔案中尋找
+適合發表的相關位置。如果有一個合適的子系統郵件列表，那麼在那裡發表通常比在
+linux-kernel上發表更好；您更有可能接觸到在相關子系統中具有專業知識的開發人
+員，而且那裡的環境可能更友善。
 
-找到維護人員可能會有點困難。同樣，維護者文件是開始的地方。但是，該文件往往不
-是最新的，並且並非所有子系統都在那裏顯示。實際上，維護者文件中列出的人員可能
-不是當前實際擔任該角色的人員。因此，當對聯繫誰有疑問時，一個有用的技巧是使用
-git（尤其是“git-log”）查看感興趣的子系統中當前活動的用戶。看看誰在寫補丁、
-誰會在這些補丁上加上Signed-off-by行簽名（如有）。這些人將是幫助新開發項目的
-最佳人選。
+找到維護者可能會比較困難一些。同樣，MAINTAINERS檔案是開始的地方。但是，該檔
+案往往不一定是最新的，並且並非所有子系統都列在那裡。實際上，MAINTAINERS檔案
+中列出的人員可能不是目前實際擔任該角色的人員。因此，當不確定要聯繫誰時，一個
+有用的技巧是使用Git（尤其是「git log」）查看感興趣的子系統中目前有誰在活動。
+看看誰在寫修補程式，以及有誰（如果有的話）在這些修補程式上加上Signed-off-by
+行。這些人將是幫助新開發專案的最佳人選。
 
-找到合適的維護者有時是非常具有挑戰性的，以至於內核開發人員添加了一個腳本來
-簡化這個過程：
+找到合適的維護者有時相當具有挑戰性，以至於核心開發人員加入了一個腳本來簡化
+這個過程：
 
 ::
 
 	.../scripts/get_maintainer.pl
 
-當給定“-f”選項時，此腳本將返回指定文件或目錄的當前維護者。如果在命令行上
-給出了一個補丁，它將列出可能接收補丁副本的維護人員。有許多選項可以調節
-get_maintainer.pl搜索維護者的嚴格程度；請小心使用更激進的選項，因爲最終結果
-可能會包括對您正在修改的代碼沒有真正興趣的開發人員。
+當給定「-f」選項時，此腳本將回傳指定檔案或目錄目前的維護者。如果在命令列上
+傳入一個修補程式，它將列出可能應該收到該修補程式副本的維護者。這是取得修補
+程式Cc名單的建議方式（而不是使用「-f」選項）。有許多選項可以調整
+get_maintainer.pl搜尋維護者的積極程度；請小心使用較激進的選項，因為最終可能
+會包括對您正在修改的程式碼沒有真正興趣的開發人員。
 
-如果所有其他方法都失敗了，那麼與Andrew Morton交流是跟蹤特定代碼段維護人員
-的一種有效方法。
+如果所有其他方法都失敗了，那麼與Andrew Morton交流是找出特定程式碼維護者的一
+種有效方法。
 
-何時郵寄？
+何時發表？
 ----------
 
-如果可能的話，在早期階段發佈你的計劃只會更有幫助。描述正在解決的問題以及已經
-制定的關於如何實施的任何計劃。您可以提供的任何信息都可以幫助開發社區爲項目
-提供有用的輸入。
+如果可能的話，在早期階段發表您的計畫只會有幫助。描述正在解決的問題，以及已經
+擬定的實作計畫。您所能提供的任何資訊都可以幫助開發社群對專案提供有用的意見。
 
-在這個階段可能發生的一件令人沮喪的事情不是得到反對意見，而是很少或根本沒有
-反饋。令人傷心的事實是：（1）內核開發人員往往很忙；（2）不缺少有宏偉計劃但
-代碼（甚至代碼設想）很少的人去支持他們；（3）沒有人有義務審查或評論別人發表
-的想法。除此之外，高層級的設計常常隱藏着一些問題，這些問題只有在有人真正嘗試
-實現這些設計時纔會被發現；因此，內核開發人員寧願看到代碼。
+在這個階段可能發生的一件令人沮喪的事情不是得到敵意的反應，而是很少或根本沒有
+反應。令人傷心的事實是：（1）核心開發人員往往很忙；（2）有宏大計畫卻只有很少
+程式碼（甚至連寫出程式碼的指望都沒有）支撐的人並不少見；（3）沒有人有義務審
+查或評論別人發表的想法。除此之外，高層次的設計常常隱藏著一些問題，這些問題只
+有在有人真正嘗試實作這些設計時才會被發現；因此，核心開發人員寧願看到程式碼。
 
-如果發佈請求評論（RFC）並沒得到什麼有用的評論，不要以爲這意味着無人對此項目
-有興趣，同時你也不能假設你的想法沒有問題。在這種情況下，最好的做法是繼續進
-行，把你的進展隨時通知社區。
+如果發表徵求意見（RFC）並沒得到什麼回應，不要以為這意味著無人對此專案有興
+趣。不幸的是，您也不能假設您的想法沒有問題。在這種情況下，最好的做法是繼續
+進行，並隨時讓社群知道您的進展。
 
 獲得官方認可
 -----------------------
 
-如果您的工作是在公司環境中完成的，就像大多數Linux內核工作一樣；顯然，在您將
-公司的計劃或代碼發佈到公共郵件列表之前，必須獲得有適當權利經理的許可。發佈
-不確定是否兼容GPL的代碼尤其會帶來問題；公司的管理層和法律人員越早能夠就發佈
-內核開發項目達成一致，對參與的每個人都越好。
+如果您的工作是在公司環境中完成的——就像大多數Linux核心工作一樣——那麼顯然，
+在您將公司的計畫或程式碼發表到公開郵件列表之前，必須獲得有適當權限的主管許
+可。發表尚未獲准以GPL相容授權發布的程式碼尤其會帶來問題；公司的管理層和法務
+人員越早能夠就發表核心開發專案達成一致，對參與的每個人都越好。
 
-一些讀者可能會認爲他們的核心工作是爲了支持還沒有正式承認存在的產品。將僱主
-的計劃公佈在公共郵件列表上可能不是一個可行的選擇。在這種情況下，有必要考慮
-保密是否真的是必要的；通常不需要把開發計劃關在門內。
+一些讀者此時可能會認為，他們的核心工作是為了支援一個尚未正式公開的產品。將
+雇主的計畫公開在公開郵件列表上可能不是一個可行的選擇。在這種情況下，值得考
+慮保密是否真的有必要；通常並沒有真正的必要把開發計畫關在門後。
 
-的確，有些情況下一家公司在開發過程的早期無法合法地披露其計劃。擁有經驗豐富
-的內核開發人員的公司可能選擇以開環的方式進行開發，前提是他們以後能夠避免
-嚴重的集成問題。對於沒有這種內部專業知識的公司，最好的選擇往往是聘請外部
-開發者根據保密協議審查計劃。Linux基金會運行了一個NDA程序，旨在幫助解決這種
-情況；更多信息參見：
+話雖如此，也確實有些情況是公司有正當理由無法在開發過程的早期公開其計畫。擁
+有經驗豐富的核心開發人員的公司，可能會選擇以開環的方式進行開發，前提是他們
+以後能夠避免嚴重的整合問題。對於沒有這種內部專業知識的公司，最好的選擇往往
+是聘請外部開發者在保密協定下審查計畫。Linux基金會運作了一個NDA計畫，旨在幫
+助處理這類情況；更多資訊參見：
 
-    http://www.linuxfoundation.org/nda/
-
-這種審查通常足以避免以後出現嚴重問題，而無需公開披露項目。
+    https://www.linuxfoundation.org/nda/
 
+這種審查通常足以避免以後出現嚴重問題，而無需公開披露專案。
-- 
2.43.0

