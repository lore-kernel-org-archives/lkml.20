Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964717;
	b=nOt2fpIeGi8YMbMgvM1ApslFRNotrDP0G05kGMj0ISKmaZrz0iEJeN1G4WDGdX+lev4k
	 p1mIfdeAppFd63g8saoOPmHZgdYkPBdDKdqLTCIfEVWOS4Z+8lzLdNBGnTlvZbyWCfdc3
	 M7OHbYl2YlL8RfSvUisVHw+BiviE9Ijy5CpShki5fx4Q0FONd4AkgsVRPYeeTPBjg9Eow
	 fssdAPZBdM8cnmQjikPIsj44gU93TU/WUapjp/cLh6oxejVSwLSKEVO/k5Jq14XwCsCr1
	 koDGAFMh+wOkESe21g61SKdmeSPMQffyScUh+IgfuB+qur98HWcSDefnMIPk1lWEd/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dzQ9gTuXzSoIJ5Zbrixd2Zg87drHfbGt+Gdppirbv28=;
	b=wq65nscAhOyrKYXpS8GktMcINr/d2LrXtUJmEIt+91YwEHzA9YuHzXhCIv7UWDv9dl3f
	 /zjT+5HbuOY6tCway8eJ4Sj0VXYRJUNtHd6qBbIpHqf0+hPcAGu+c35PaBLxadiFkAQKS
	 ealpYNjl3bnn4WeIFaKeyvCNJm8D4tmAu97Ib6OqpoHVGOxhy3HdaXEiqenj545x7f85Y
	 HZS7hwWXsWOL+DRWsEiiEKs1Bg7nDol9GM01FpqlW69x70/rJproSnt540KiVVxgurMhU
	 n4eSYxavrt7A2tt6AaxanheIoff3Tcvj6sHzf1uysnVEhXgTA7fN1aFJ7t7zEhzlPuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czAoc4Bs;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298E0606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298E0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czAoc4Bs
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso73816a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964716; x=1794569516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzQ9gTuXzSoIJ5Zbrixd2Zg87drHfbGt+Gdppirbv28=;
        b=czAoc4BsXnO5LQ5INf1y8i4zleOAXJiHestDBBCdLnfcPAnPWPf3ZYnbCAInTqp5c/
         bY3iElu5OewZe+51rd5GcZu0aqndcH7GpOfJgqX3j4RB5Cq/aFLmVBZUHM7u+PgOWV5v
         qL8nkcDqYvehXzaBBn1CYKH9VstSkhZ1YgJowe2wUgaUseD6ujeQCEoCstDKA1TDpUKH
         PaThmv30ULoXsHotp7ShGn5I7jzSsa2mtwPj+pmqhgFY0xi4ccjv+0Amfve7I4AnqT34
         DvpCIxQvZ69cJ/OCZntix24frFiShZbtUbqMlgJoevuwuxZqX7j2/8lNVBYmIw4yJu2N
         5Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964716; x=1794569516;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzQ9gTuXzSoIJ5Zbrixd2Zg87drHfbGt+Gdppirbv28=;
        b=xJo4fE/+8dhef+6fz+ts4FccN8ZAdHxT/RldCGf1TecgeAMR3AXIi9n3RP0uJKSCOl
         CYS2O1OL1zj2MUsO0VwlpY703GSJmCrx0KrcIUgXoYlsf1YdzWnYV43R/aLbTIN/09df
         bRjFiZzxdUYMWhngcnjvcBRI75gHgpCYnrn2oRcYTIcoSVTm/fwlGCP298NPxuf0PYwq
         WzLb1PK0BtxGoboU+naCjcwpxo48pKTA8lg7V6GBx1n9KV0x96toXP2ydHtr7PrJZDJO
         BMyb8deVvID9u1+B9dspRnpv8lXFMEq6VVGjC3FgXgkpBLSHSJ/oFlW26IirEcpPnHQu
         nUJQ==
X-Forwarded-Encrypted: i=1; AL+hErG8X7LTmXu1XEERqS+w24rHr7Y2903+aCUFkXevr2s+6PQYkZnnMY5l3u52Y66awGBSQbqqEraFXolaRPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2TmFJC5jE786TXa8pXocPoaaL8AaeVoKorkWVREtDqxhG1x3e
	/+SaYhUHBGPXodwWvLZldvxJEzwUj4gu/7Ki6Xt9f5MSI3eFu1dgbjxr
X-Gm-Gg: AYBFou0TA4CJLujU5R04CKYIZRBSCGt4AJCAuqOTSXHfD/Jc60YwB1WVGuKhot8/CC6
	TEg5cJo3qjaCDhGghe9c5nu1fiAoNmiD4OFaJlv8ZiUdajr6CGEwFfJ/eASmh6jhW5DVU/VGEbs
	9HJ2nLs5djp5VampldaszGRqAOjjdcZ+7P/rf1V1fbOZV5hvJYzqQZs6yCcjgMpaOgnz2ji/UTD
	7BOLIvtluv2eq33VYugAoPCoQaTi68chBiX/4Zy7vIZDkaUwwZLkuyhSh7o6hGInZ4NQCZP6vVN
	Rmp77LQrhsDx/yRx6EXW/wpxjjGEY3LLSai6mLoCYk/5PO6Yd3oGABrtgwfGSXi/dFaxIR5ustE
	9XfR/DHEG7bCi+xy2zxs0YneeUrUr/lkBIjLcQT8gd5cdXs9AU1hGJ1WEqMuGxgrccp+Yae74Ra
	qFXeaBykMDf58US0I1J4jmSahJz3jgPf1AJhUHaRYSFmRCWoBmjJEgnaqBHaAqu9FTaL9Ej1VDJ
	jb7qTjGFvNKNOYl7P4i4Sdt9pzJT1ObSSe8yqMI5I+9CcL0kgyjFJt6oDcDY22dWJhVanPMCSHr
	gOjzRHJYlOdbn33xz555JwK0IESk1JgBh2JMeLJRiKFDYVW8C/4vfe9HkVv2nSgKQEljrFDikzc
	a4Iw9a89VP0TBiqJELOLkldy0oQ==
X-Received: by 2002:a17:90b:4a12:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b0db038327mr3603588a91.0.1793964716046;
        Fri, 06 Nov 2026 03:31:56 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:31:55 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 02/25] docs/zh_TW: process: sync 2.Process.rst with the English original
Date: Fri,  6 Nov 2026 19:31:17 +0800
Message-ID: <20261106113142.706783-3-chenyou910331@gmail.com>
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

The last update claimed to follow commit 46298375477b ("linux-next:
update maintainer info."), but a section-by-section comparison against
the current English text shows it never picked up several earlier and
later changes.  Bring it in line with the full current original:

- add the missing sentence that no upcoming release has known plans
  for long-term support
- rewrite the top-posting hint to recommend interleaved replies and
  link to the corresponding section of submitting-patches.rst
- capitalize Git and Quilt consistently, and replace "他或她" with a
  gender-neutral wording
- fix the 5.2.1 date in the 5.2 table, the Mercurial and Quilt URLs,
  the LWN URL and the drivers/staging/ path
- keep Andrew Morton's quote verbatim in its literal block and add the
  translation after it
- retranslate sentences whose meaning had drifted (delaying the final
  release, "when the process works", the TODO file, distributors, how
  well the process works without tools, bringing in-house developers up
  to speed, linux-next as an expected snapshot)
- fix leftover mainland terms and conversion artifacts (內核, 視頻,
  搜索, 回復, 被髮布, 一箇)
- expand tabs in the tables and literal blocks

update to commit fdd100ee60a0 ("docs: process: use gender-neutral
pronouns")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/2.Process.rst  | 176 +++++++++---------
 1 file changed, 93 insertions(+), 83 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/2.Process.rst b/Documentation/translations/zh_TW/process/2.Process.rst
index cf9bd1b1444a..72a0cc1f7652 100644
--- a/Documentation/translations/zh_TW/process/2.Process.rst
+++ b/Documentation/translations/zh_TW/process/2.Process.rst
@@ -29,8 +29,8 @@ Linux核心使用一種鬆散的、基於時間的滾動發布開發模式。每
        認為足夠大時才會遞增9（例如，Linux 5.0是繼Linux 4.20之後發布的）。
 
 對於每個版本的補丁合併，遵循一個相對簡單的規則。在每個開發週期的開頭，“合併
-視窗”被開啟。這時，被認為足夠穩定（並且被開發社群接受）的程式碼被合併到主線內
-核中。在這段時間內，新開發週期的大部分變更（以及所有主要變更）將以接近每天
+視窗”被開啟。這時，被認為足夠穩定（並且被開發社群接受）的程式碼被合併到主線核
+心中。在這段時間內，新開發週期的大部分變更（以及所有主要變更）將以接近每天
 1000次變更（“補丁”或“變更集”）的速度合併。
 
 （順便說一句，值得注意的是，合併視窗期間整合的更改並不是憑空產生的；它們是經
@@ -41,7 +41,7 @@ Linux核心使用一種鬆散的、基於時間的滾動發布開發模式。每
 將被稱為9.x-rc1。-rc1 版本是一個信號，表示合併新特性的時間已經過去，穩定下一
 個核心的時間已經到來。
 
-在接下來的6到10周內，只有修復問題的補丁才應該提交給主線。有時會允許更大的
+在接下來的6到10週內，只有修復問題的補丁才應該提交給主線。有時會允許更大的
 更改，但這種情況很少發生；試圖在合併視窗外合併新功能的開發人員往往受不到
 友好的接待。一般來說，如果您錯過了給定特性的合併視窗，最好的做法是等待下一
 個開發週期。（偶爾會對未支援硬體的驅動程式進行例外；如果它們不改變已有程式碼，
@@ -53,60 +53,63 @@ Linux核心使用一種鬆散的、基於時間的滾動發布開發模式。每
 
 例如，這裡是5.4的開發週期進行情況（2019年）:
 
-	==============  ==============================
-	九月 15         5.3 穩定版發布
-	九月 30         5.4-rc1 合併視窗關閉
-	十月 6          5.4-rc2
-	十月 13         5.4-rc3
-	十月 20         5.4-rc4
-	十月 27         5.4-rc5
-	十一月 3        5.4-rc6
-	十一月 10       5.4-rc7
-	十一月 17       5.4-rc8
-	十一月 24       5.4 穩定版發布
-	==============  ==============================
+        ==============  ===============================
+        九月 15         5.3 穩定版發布
+        九月 30         5.4-rc1 合併視窗關閉
+        十月 6          5.4-rc2
+        十月 13         5.4-rc3
+        十月 20         5.4-rc4
+        十月 27         5.4-rc5
+        十一月 3        5.4-rc6
+        十一月 10       5.4-rc7
+        十一月 17       5.4-rc8
+        十一月 24       5.4 穩定版發布
+        ==============  ===============================
 
 開發人員如何決定何時結束開發週期並建立穩定版本？最重要的指標是以前版本的
 迴歸列表。不歡迎出現任何錯誤，但是那些破壞了以前能工作的系統的錯誤被認為是
 特別嚴重的。因此，導致迴歸的補丁是不受歡迎的，很可能在穩定期內刪除。
 
 開發人員的目標是在穩定發布之前修復所有已知的迴歸。在現實世界中，這種完美是
-很難實作的；在這種規模的專案中，變數太多了。需要說明的是，延遲最終版本只會
+很難實作的；在這種規模的專案中，變數太多了。到了某個時候，再延遲最終版本只會
 使問題變得更糟；等待下一個合併視窗的更改將變多，導致下次出現更多的迴歸錯誤。
 因此，大多數核心版本都有一些已知的迴歸錯誤，不過，希望沒有一個是嚴重的。
 
 一旦一個穩定的版本發布，它的持續維護工作就被移交給“穩定團隊”，目前由Greg
 Kroah-Hartman和Sasha Levin組成。穩定團隊將使用9.x.y編號方案不定期地發布穩
-定版本的更新。要合入更新版本，補丁必須（1）修復一個重要的缺陷，且（2）已經
-合併到下一個開發版本主線中。核心通常會在其初始版本後的一個以上的開發週期內
-收到穩定版更新。例如，5.2核心的歷史如下（2019年）：
-
-	==============  ===============================
-        七月 7 	        5.2 穩定版發布
-	七月 13	        5.2.1
-	七月 21	        5.2.2
-	七月 26	        5.2.3
-	七月 28	        5.2.4
-	七月 31	        5.2.5
-	...	        ...
-	十月 11         5.2.21
-	==============  ===============================
+定版本的更新。
+
+要合入更新版本，補丁必須（1）修復一個重要的缺陷，且（2）已經合併到下一個開
+發版本主線中。核心通常會在其初始版本後的一個以上的開發週期內收到穩定版更新。
+例如，5.2核心的歷史如下（2019年）：
+
+        ==============  ===============================
+        七月 7          5.2 穩定版發布
+        七月 14         5.2.1
+        七月 21         5.2.2
+        七月 26         5.2.3
+        七月 28         5.2.4
+        七月 31         5.2.5
+        ...             ...
+        十月 11         5.2.21
+        ==============  ===============================
 
 5.2.21是5.2版本的最終穩定更新。
 
 有些核心被指定為“長期”核心；它們將得到更長時間的支援。當前的長期核心
 版本及其維護者的列表，請參考以下連結：
 
-	https://www.kernel.org/category/releases.html
+        https://www.kernel.org/category/releases.html
 
-長期支援核心的選擇純粹是維護人員是否有需求和時間來維護該版本的問題。
+長期支援核心的選擇純粹是維護人員是否有需求和時間來維護該版本的問題。目前
+沒有已知的計畫要為任何即將推出的特定版本提供長期支援。
 
 補丁的生命週期
 --------------
 
-補丁不會直接從開發人員的鍵盤進入主線核心。相反，有一個稍微複雜（如果有些非
+補丁不會直接從開發人員的鍵盤進入主線核心。相反，有一個稍微複雜（儘管有些非
 正式）的過程，旨在確保對每個補丁進行品質審查，並確保每個補丁實作了一個在主
-線中需要的更改。對於小的修復，這個過程可能會很快完成，，而對於較大或有爭議
+線中需要的更改。對於小的修復，這個過程可能會很快完成，而對於較大或有爭議
 的變更，可能會持續數年。許多開發人員的沮喪來自於對這個過程缺乏理解或者試圖
 繞過它。
 
@@ -119,12 +122,12 @@ Kroah-Hartman和Sasha Levin組成。穩定團隊將使用9.x.y編號方案不定
   是在不涉及社群的情況下完成的，但是如果可能的話，最好是在公開的情況下完成
   這項工作；這樣可以節省很多稍後再重新設計的時間。
 
-- 早期評審。補丁被髮布到相關的郵件列表中，列表中的開發人員會回覆他們可能有
+- 早期評審。補丁被發布到相關的郵件列表中，列表中的開發人員會回覆他們可能有
   的任何評論。如果一切順利的話，這個過程應該會發現補丁的任何主要問題。
 
 - 更廣泛的評審。當補丁接近準備好納入主線時，它應該被相關的子系統維護人員
   接受——儘管這種接受並不能保證補丁會一直延伸到主線。補丁將出現在維護人員的
-  子系統樹中，並進入 -next 樹（如下所述）。當流程進行時，此步驟將會對補丁
+  子系統樹中，並進入 -next 樹（如下所述）。當流程運作順利時，此步驟將會對補丁
   進行更廣泛的審查，並發現由於將此補丁與其他人所做的工作合併而導致的任何
   問題。
 
@@ -157,14 +160,14 @@ Kroah-Hartman和Sasha Levin組成。穩定團隊將使用9.x.y編號方案不定
 補丁的規模。核心開發人員處理這種增長的方式是使用圍繞信任鏈建置的助理系統。
 
 核心程式碼庫在邏輯上被分解為一組子系統：網路、特定體系結構支援、記憶體管理、視
-頻設備等。大多數子系統都有一個指定的維護人員，其總體負責該子系統中的程式碼。
+訊設備等。大多數子系統都有一個指定的維護人員，其總體負責該子系統中的程式碼。
 這些子系統維護者（鬆散地）是他們所管理的核心部分的“守門員”；他們（通常）
 會接受一個補丁以包含到主線核心中。
 
 子系統維護人員每個人都管理著自己版本的核心原始程式碼樹，通常（並非總是）使
 用Git。Git等工具（以及Quilt或Mercurial等相關工具）允許維護人員追蹤補丁列表，
-包括作者資訊和其他元資料。在任何給定的時間，維護人員都可以確定他或她的儲存
-庫中的哪些補丁在主線中找不到。
+包括作者資訊和其他元資料。在任何給定的時間，維護人員都可以確定其儲存庫中的
+哪些補丁在主線中找不到。
 
 當合併視窗開啟時，頂級維護人員將要求Linus從儲存庫中“拉出”他們為合併選擇
 的補丁。如果Linus同意，補丁流將流向他的儲存庫，成為主線核心的一部分。
@@ -172,9 +175,9 @@ Linus對拉取中接收到的特定補丁的關注程度各不相同。很明顯
 關注。但是一般來說，Linus相信子系統維護人員不會向上遊發送壞補丁。
 
 子系統維護人員反過來也可以從其他維護人員那裡獲取補丁。例如，網路樹是由首先
-在專用於網路設備驅動程式、無線網路等的樹中積累的補丁建置的。此儲存鏈可以
-任意長，但很少超過兩個或三個連結。由於鏈中的每個維護者都信任那些管理較低
-級別樹的維護者，所以這個過程稱為“信任鏈”。
+在專用於網路設備驅動程式、無線網路等的樹中積累的補丁建置的。這條儲存庫鏈可
+以任意長，但很少超過兩三個環節。由於鏈中的每個維護者都信任那些管理較低級別
+樹的維護者，所以這個過程稱為“信任鏈”。
 
 顯然，在這樣的系統中，獲取核心補丁取決於找到正確的維護者。直接向Linus發送
 補丁通常不是正確的方法。
@@ -184,17 +187,17 @@ Next 樹
 
 子系統樹鏈引導補丁流到核心，但它也提出了一個有趣的問題：如果有人想查看為
 下一個合併視窗準備的所有補丁怎麼辦？開發人員將感興趣的是，還有什麼其他的
-更改有待解決，以瞭解是否存在需要擔心的衝突；例如，更改核心核心函式原型的
-修補程式將與使用該函式舊形式的任何其他修補程式衝突。審查人員和測試人員希望
-在所有這些變更到達主線核心之前，能夠存取它們的整合形式的變更。您可以從所有
-相關的子系統樹中提取更改，但這將是一項複雜且容易出錯的工作。
+更改有待解決，以瞭解是否存在需要擔心的衝突；例如，一個修改核心中核心函式原型
+的補丁，將與所有使用該函式舊形式的其他補丁衝突。審查人員和測試人員希望在所有
+這些變更到達主線核心之前，能夠存取它們的整合形式的變更。您可以從所有相關的子
+系統樹中提取更改，但這將是一項龐大且容易出錯的工作。
 
 解決方案以-next樹的形式出現，在這裡子系統樹被收集以供測試和審查。這些樹中
 由Andrew Morton維護的較老的一個，被稱為“-mm”（用於記憶體管理，建立時為此）。
 -mm 樹整合了一長串子系統樹中的補丁；它還包含一些旨在幫助除錯的補丁。
 
 除此之外，-mm 還包含大量由Andrew直接選擇的補丁。這些補丁可能已經發布在郵件
-列表上，或者它們可能應用於核心中未指定子系統樹的部分。同時，-mm 作為最後
+列表上，或者它們可能應用於核心中未指定子系統樹的部分。因此，-mm 作為最後
 手段的子系統樹；如果沒有其他明顯的路徑可以讓補丁進入主線，那麼它很可能最
 終選擇-mm 樹。累積在-mm 中的各種補丁最終將被轉發到適當的子系統樹，或者直接
 發送到Linus。在典型的開發週期中，大約5-10%的補丁透過-mm 進入主線。
@@ -205,9 +208,9 @@ Next 樹
 
 然而，使用MMOTM樹可能會十分令人頭疼；它甚至可能無法編譯。
 
-下一個週期補丁合併的主要樹是linux-next，由Mark Brown維護。根據設計
-linux-next 是下一個合併視窗關閉後主線的快照。linux-next樹在Linux-kernel 和
-Linux-next 郵件列表中發布，可從以下位置下載：
+下一個週期補丁合併的主要樹是linux-next，由Mark Brown維護。按照設計，
+linux-next樹是主線在下一個合併視窗關閉後預期樣貌的快照。linux-next樹組建完
+成後，會在linux-kernel和linux-next郵件列表中公告，可從以下位置下載：
 
         https://www.kernel.org/pub/linux/kernel/next/
 
@@ -218,29 +221,29 @@ Staging 樹
 ----------
 
 核心原始程式碼樹包含drivers/staging/目錄，其中有許多驅動程式或檔案系統的子目錄
-正在被添加到核心樹中。它們在仍然需要更多的修正的時候可以保留在driver/staging/
+正在被添加到核心樹中。它們在仍然需要更多的修正的時候可以保留在drivers/staging/
 目錄中；一旦完成，就可以將它們移到核心中。這是一種追蹤不符合Linux核心編碼或
 品質標準的驅動程式的方法，人們可能希望使用它們並追蹤開發。
 
 Greg Kroah-Hartman 目前負責維護staging樹。仍需要修正的驅動程式將發送給他，
 每個驅動程式在drivers/staging/中都有自己的子目錄。除了驅動程式原始檔之外，
-目錄中還應該有一個TODO檔案。TODO檔案列出了驅動程式需要接受的暫停的工作，
-以及驅動程式的任何補丁都應該抄送的人員列表。當前的規則要求，staging的驅動
-程式必須至少正確編譯。
+目錄中還應該有一個TODO檔案。TODO檔案列出了驅動程式被正式納入核心前尚待完成
+的工作，以及驅動程式的任何補丁都應該抄送的人員列表。當前的規則要求，staging
+的驅動程式必須至少正確編譯。
 
-Staging 是一種讓新的驅動程式進入主線的相對容易的方法，它們會幸運地引起其他
-開發人員的注意，並迅速改進。然而，進入staging並不是故事的結尾；staging中
-沒有看到常規進展的程式碼最終將被刪除。經銷商也傾向於相對不願意使用staging驅動
-程式。因此，在成為一個合適的主線驅動的路上，staging 僅是一箇中轉站。
+Staging 是一種讓新的驅動程式進入主線的相對容易的方法，運氣好的話，它們會引
+起其他開發人員的注意並迅速改進。然而，進入staging並不是故事的結尾；staging
+中沒有看到常規進展的程式碼最終將被刪除。發行版廠商也往往不太願意啟用staging
+驅動程式。因此，staging充其量只是成為合適主線驅動程式之路上的一個中轉站。
 
 工具
 ----
 
 從上面的文字可以看出，核心開發過程在很大程度上依賴於在不同方向上聚集補丁的
-能力。如果沒有適當強大的工具，整個系統將無法在任何地方正常工作。關於如何使用
-這些工具的教程遠遠超出了本文件的範圍，但還是用一點篇幅介紹一些關鍵點。
+能力。如果沒有適當強大的工具，整個系統遠不可能運作得像現在這樣好。關於如何
+使用這些工具的教程遠遠超出了本文件的範圍，但還是用一點篇幅介紹一些關鍵點。
 
-到目前為止，核心社群使用的主要原始程式碼管理系統是git。Git是在自由軟體社群
+到目前為止，核心社群使用的主要原始程式碼管理系統是Git。Git是在自由軟體社群
 中開發的許多分散式版本控制系統之一。它非常適合核心開發，因為它在處理大型儲
 存庫和大量補丁時效能非常好。它也以難以學習和使用而著稱，儘管隨著時間的推移
 它變得更好了。對於核心開發人員來說，對Git的某種熟悉幾乎是一種要求；即使他
@@ -253,20 +256,20 @@ Staging 是一種讓新的驅動程式進入主線的相對容易的方法，它
 
 此頁面包含了文件和教程的連結。
 
-在不使用git的核心開發人員中，最流行的選擇幾乎肯定是Mercurial：
+在不使用Git的核心開發人員中，最流行的選擇幾乎肯定是Mercurial：
 
-        http://www.seleric.com/mercurial/
+        https://www.selenic.com/mercurial/
 
 Mercurial與Git共享許多特性，但它提供了一個介面，許多人覺得它更易於使用。
 
 另一個值得了解的工具是Quilt:
 
-        https://savannah.nongnu.org/projects/quilt
+        https://savannah.nongnu.org/projects/quilt/
 
 Quilt 是一個補丁管理系統，而不是原始程式碼管理系統。它不會隨著時間的推移追
 蹤歷史；相反，它面向根據不斷發展的程式碼庫追蹤一組特定的更改。一些主要的子
 系統維護人員使用Quilt來管理打算向上遊移動的補丁。對於某些樹的管理（例如-mm），
-quilt 是最好的工具。
+Quilt 是最好的工具。
 
 郵件列表
 --------
@@ -284,7 +287,7 @@ quilt 是最好的工具。
 列表。
 
 當然，核心開發的核心郵件列表是linux-kernel。這個列表是一個令人生畏的地方：
-每天的資訊量可以達到500條，噪音很高，談話技術性很強，且參與者並不總是表現出
+每天的郵件量可以達到500封，噪音很高，談話技術性很強，且參與者並不總是表現出
 高度的禮貌。但是，沒有其他地方可以讓核心開發社群作為一個整體聚集在一起；
 不使用此列表的開發人員將錯過重要資訊。
 
@@ -295,25 +298,26 @@ quilt 是最好的工具。
 - 不要試圖跟上每一次談話——沒人會這樣。重要的是要篩選感興趣的主題（但請注意
   長時間的對話可能會偏離原來的主題，儘管未改變電子郵件的主題）和參與的人。
 
-- 不要回復挑事的人。如果有人試圖激起憤怒，請忽略他們。
+- 不要回覆挑事的人。如果有人試圖激起憤怒，請忽略他們。
 
 - 當回覆Linux核心電子郵件（或其他列表上的電子郵件）時，請為所有相關人員保留
   Cc: 抄送頭。如果沒有確實的理由（如明確的請求），則不應刪除收件人。一定要
-  確保你要回復的人在抄送列表中。這個慣例也使你不必在回覆郵件時明確要求被抄送。
+  確保你要回覆的人在抄送列表中。這個慣例也使你不必在回覆郵件時明確要求被抄送。
 
-- 在提出問題之前，搜索列表存檔（和整個網路）。有些開發人員可能會對那些顯然
+- 在提出問題之前，搜尋列表存檔（和整個網路）。有些開發人員可能會對那些顯然
   沒有完成家庭作業的人感到不耐煩。
 
-- 避免頂部回覆（把你的答案放在你要回復的引文上面的做法）。這會讓你的回答更難
-  理解，印象也很差。
+- 使用交錯式（“行內”）回覆，這會讓你的回覆更容易閱讀。（也就是避免置頂回覆，
+  即把你的答案放在你要回覆的引文上面的做法。）更多細節請參閱
+  :ref:`Documentation/process/submitting-patches.rst <tw_interleaved_replies>`。
 
 - 在正確的郵件列表發問。linux-kernel 可能是通用的討論場所，但它不是尋找所有
   子系統開發人員的最佳場所。
 
-最後一點——找到正確的郵件列表——是開發人員常出錯的地方。在linux-kernel上提出
-與網路相關的問題的人幾乎肯定會收到一個禮貌的建議，轉到netdev列表上提出，因
-為這是大多數網路開發人員經常出現的列表。還有其他列表可用於scsi、
-video4linux、ide、filesystem等子系統。查找郵件列表的最佳位置是與核心原始程
+最後一點——找到正確的郵件列表——是新手開發人員常出錯的地方。在linux-kernel上
+提出與網路相關的問題的人幾乎肯定會收到一個禮貌的建議，轉到netdev列表上提出，
+因為這是大多數網路開發人員經常出現的列表。還有其他列表可用於SCSI、
+video4linux、IDE、filesystem等子系統。查找郵件列表的最佳位置是與核心原始程
 式碼一起打包的MAINTAINERS檔案。
 
 開始核心開發
@@ -323,10 +327,10 @@ video4linux、ide、filesystem等子系統。查找郵件列表的最佳位置
 使得關係的開始比本應的更困難。
 
 公司通常希望聘請知名的開發人員來啟動開發團隊。實際上，這是一種有效的技術。
-但它也往往是昂貴的，而且對增加有經驗的核心開發人員的數量沒有多大幫助。考
-慮到時間投入，可以讓內部開發人員加快Linux核心的開發速度。利用這段時間可以
-讓僱主擁有一批既瞭解核心又瞭解公司的開發人員，還可以幫助培訓其他人。從中期
-來看，這通常是更有利可圖的方法。
+但它也往往是昂貴的，而且對增加有經驗的核心開發人員的數量沒有多大幫助。只要投
+入一些時間，就可以讓內部開發人員熟悉Linux核心開發。利用這段時間可以讓僱主擁
+有一批既瞭解核心又瞭解公司的開發人員，還可以幫助培訓其他人。從中期來看，這通
+常是更有利可圖的方法。
 
 可以理解的是，單個開發人員往往對起步感到茫然。從一個大型專案開始可能會很
 嚇人；人們往往想先用一些較小的東西來試試水。由此，一些開發人員開始建立修補
@@ -338,11 +342,17 @@ Andrew Morton 為有抱負的核心開發人員提供了如下建議
 
 ::
 
-	所有核心開發者的第一個專案肯定應該是“確保核心在您可以操作的所有
-	機器上始終完美執行”。通常的方法是和其他人一起解決問題（這可能需
-	要堅持！），但就是如此——這是核心開發的一部分。
+        The #1 project for all kernel beginners should surely be "make sure
+        that the kernel runs perfectly at all times on all machines which
+        you can lay your hands on".  Usually the way to do this is to work
+        with others on getting things fixed up (this can require
+        persistence!) but that's fine - it's a part of kernel development.
 
-(http://lwn.net/Articles/283982/)
+（中譯：所有核心初學者的第一個專案肯定應該是“確保核心在您能接觸到的所有機器
+上始終完美執行”。通常的方法是和其他人一起把問題修好（這可能需要堅持！），
+但這沒關係——這是核心開發的一部分。）
+
+(https://lwn.net/Articles/283982/)。
 
 在沒有明顯問題需要解決的情況下，通常建議開發人員查看當前的迴歸和開放缺陷
 列表。從來都不缺少需要解決的問題；透過解決這些問題，開發人員將從該過程獲得
-- 
2.43.0

