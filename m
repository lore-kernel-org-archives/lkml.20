Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964795;
	b=hTiZEzeUBzHxzmXRA15BNazPy3IFc4jWAHSEQdDgPkZreyIGNh+4cjyn/SYsItQI7RbO
	 PxoGFJQvyIAin8h+81wvtZTWDxMbyYYhnzPmFYj4pBZZN7CE7JuW4ldmkF5XUMCAXCPM3
	 oZ9tVFag0JfAYRZTUcE2FnfIXv0tQcDo7nDTEEKacs+AnrVOXB/AB2Whr5GWSdC+vXXJy
	 sbOj701coByiGsriAWYIl+NUppTgVyhEqvh1CbRAJ6ksCrNPGlQ/oJYLsQniMsdXT0y4a
	 UrEH6I8oNDLFsKV9CKVWJepmrAevLa7RDNmelkeNVXlx8SfKT2LDLDfxnfP1iZq2wLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=omqprazAfFVI5X2pE4M1zlGTvnAphBinDxhLQBiEKKg=;
	b=a5gBqrV1E4erHL9oK6HjfgiIMlPBsNe9UDNsNDnNuR8Y+oAghkyiYg/+8abhLF8IYujM
	 dLfot6ICzrSUOBu4JRuxvKrNJSfMKdJQpQ82aqDINh60gGURjC+4mN8N3QE6k1ShW5E0L
	 JG0Bkaq88ZKAnqSg/Wx3g4py+BMThyiAVxBVgBSkCCL3WOLvcAO1cYlfiUexheSQZS5yn
	 QBov8/deN6EC84wQjGO7I0zPVFZUIgMMSPLfSMfw3drr8jWTNfM7N6sMUO43H9zigCw1b
	 cTMfyRSYom655YfDQmPK1pVRwN+We/eYwvG0u5tDIRg+UL+kEVlcYM5KpNvkFFrAm8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q/ivhzI8";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFE606D80D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FFE606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q/ivhzI8
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0d09fc934so82098a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964794; x=1794569594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=omqprazAfFVI5X2pE4M1zlGTvnAphBinDxhLQBiEKKg=;
        b=Q/ivhzI8T+z3ks3ammdSdh4i6hvYIlFd778wJdS7xDp4RpVpHCtvuUFFbDBeyhHfF4
         8fR6IGyqtAQHxGmTlKSL/HSxInzvCKSZ7Tz/x4iH4GEr5o1lLEAdrntLDPd3oJfQT9Vg
         Lv4EWvuZKy1VFk5AmPmMr7+Xdv9cFH2GDXV3SQtDjJ1YyLtlqmWtoJEeynfDDKsh0NzI
         N+h8Q23Hu9O0soZpREwYICup9bB+POv69RvOyhu7epy0wp5JYA9B06WaQmVP/sh/lhKi
         EW4sXwyAqHrlIQXwapU5HiITMQmPNExb9GTnPlxW7GmSeN1XxfIpXN9LsVgB3nx8HDlL
         r06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964794; x=1794569594;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omqprazAfFVI5X2pE4M1zlGTvnAphBinDxhLQBiEKKg=;
        b=kkxXfWmxUsbR4Wf8VoADaMaV0SNhtuvcUCDZpD/a0Ogxg1q3s3Pi3eeU9nyQ7dT+VG
         TIsd2kr6qF5dG4bS1rdAFzio3YKfATTc7lnUyq1zlOcySan/vYGiEuo1VFrOv9ynhcVz
         LwLi6cJSM4zKow8zjqDg7a6B6Tgf2HdG3h6dlGmc4Cro2bDrClWuJGWwrXTlrld7JieT
         ltFGX60lheZNwFT6cMMDI+4EImDeYdmEEMpUiLJfkiypnYJYE+5SYVRRIGknlj4jzEI2
         rWaA+ynuYUjdsMO76D56JmJTBwNa4x/+xnTwX6h9DWglchRegbQG1Ss+8F9aIjjNh8zH
         SGyg==
X-Forwarded-Encrypted: i=1; AL+hErE4vQV6S2mnhc7h3B6ZNvFv2ZKpE8vwQk1buk904NQQoIf0Kq6I2mW0yP3g2xxhTBCXc9p0lDJvoFFIQWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C0wD9CdAY54QeLXdbGrQ/vfoRanVCv0CDe4XKsy3EXOpovSra
	q5XF/c5aBjRoWLHu0ywqRkmK7kDcsMBIWX1KpC+1FKzz/8DXPfgxOnED
X-Gm-Gg: AYBFou3GVhHdIrkTAdqHhPnKkty+3bBISKQ94wnC0Y0PQspYEue2AgAXZiGbGQc5t1/
	ZIwPOfSY95EjAHZX3IeoQC4ZvI+Vn85Zh4FyCsOJzeuS71KiPNuLdv/rk1+56oq7WbiR25BnlE2
	LNabwevujFbeE2Ro4N4799GL2KovCn0pUAGjopj/Jt952ODjtoDkU2rjy6Unsx+mffS0HuBiTyn
	Hk2Xy9JRCYjSS/r5/XAyY6ONh84vozTBUvQOZY1YHxQDYHBBPa7sktncrKVsWPvXy/KMhlafP80
	73e29TVlWA9JN/3+OVIi09dqeCO+ep+HYsM04XcCt72CaTQ/q8DYQHC+KneQ3r7vEX6pX6O/LaI
	5Ke1V5OwjpiXHg3Y5vdzwf4cl4N/hVAqlyPAUrdQJVBTlFRKWDMJwHpxYnjhS19Ng0QD1GxMkOe
	vPfret2ny0X6pKN1Dz7eePuAZ2yGD8A/hSPEkeWT8XdSHa5hz4z0TC3ZNqEm0fLxFjnLwCAlwVf
	vzQpDlZ4dH//82I6v4qUKVl7Jqg5NDpqWJw5JFD6BNQMq8fevR5L8hgcK9vm0xLHIAVRS4l5Ozi
	np4jcxX4+ywZvgJW2PxUwE4xVgueSUnWh2xk+Z4f2xJuGmrV5c0vX9zqhnE4KmOpx9SmgBwQ6uF
	nKybIe+e0XtBJgh6OaTuuQ+E8og==
X-Received: by 2002:a17:90b:4a89:b0:3b0:975b:2256 with SMTP id 98e67ed59e1d1-3b0db6f8e05mr3198603a91.4.1793964793268;
        Fri, 06 Nov 2026 03:33:13 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:33:12 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 25/25] docs/zh_TW: process: sync submitting-patches.rst with the English original
Date: Fri,  6 Nov 2026 19:31:40 +0800
Message-ID: <20261106113142.706783-26-chenyou910331@gmail.com>
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

The translation is marked "update to commit 48c3876a6a6f ("docs:
submitting-patches: Clarify that "reviewer" is a person")", but several
parts of it still follow text that the English original changed well
before that commit.  Compare it again against the current English text
and bring it in line:

- add the "Closes:" tag paragraphs and drop the old sentence that used
  "Link:" for bug reports; say that "Reported-by:" should be followed by
  "Closes:", or by "Link:" for a partial fix
- copy the list(s) as well as the maintainers, pass patch paths to
  get_maintainer.pl, send to linux-kernel@vger.kernel.org by default
  rather than "pick at least one list", and note that very few patches
  go through Linus directly
- add the paragraphs on CC-ing earlier commenters on new versions and
  on email-clients.rst, and wait "a few weeks (typically 2-3)" instead
  of "about a week"
- use "a known identity" instead of "your real name" for sign-offs
- turn the Developer's Certificate of Origin and the Reviewer's
  statement of oversight into literal blocks instead of subsections,
  following commit 83f71fbc66fb ("docs: submitting-patches: Fix section
  structure around DCO"); keep the English text verbatim and give the
  Chinese translation as a separate, reference-only literal block
- use "they" for the signer, following commit fdd100ee60a0 ("docs:
  process: use gender-neutral pronouns")
- restore the ``subsystem``, ``summary phrase``, ``patch series``,
  ``patch changelogs`` and ``from`` literals and the English Subject:
  example, and say that version tags "might" be included rather than
  "must"
- add the diffstat "-p 1 -w 70" condition, the base tree reasons
  (number of maintainer trees, the T: entry, CI) and the paragraph on
  using an official base commit
- turn the "Fixes:" note back into a plain paragraph, keep the checker
  level list attached to its paragraph as in the original, and fix the
  "In-Reply_To" typo

Also fix mistranslations: "Quantify" was rendered as "quality" and
"heuristics" as "exploratory work"; "Co-developed-by:" had the order of
the "Signed-off-by:" reversed; a single change to many files was
described as one change split into many patches.  Replace mainland terms
in the file (設備→裝置, 源碼→原始程式碼, 當前→目前, 客戶端→用戶端,
交互式→互動式, 教程→教學, 後綴→字尾, 重定向→重新導向, 哈希→雜湊值, ...)
and use 修補程式 for "patch" in new and rewritten text.

update to commit fdd100ee60a0 ("docs: process: use gender-neutral
pronouns")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/submitting-patches.rst      | 338 +++++++++++-------
 1 file changed, 208 insertions(+), 130 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/submitting-patches.rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
index 514903daae25..b747cfd76c26 100644
--- a/Documentation/translations/zh_TW/process/submitting-patches.rst
+++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
@@ -16,7 +16,7 @@
 本文件以較為簡潔的行文給出了大量建議。關於核心開發流程如何進行的詳細資訊，
 參見： Documentation/translations/zh_TW/process/development-process.rst 。
 Documentation/translations/zh_TW/process/submit-checklist.rst 給出了一系列
-提交補丁之前要檢查的事項。設備樹相關的補丁，請參閱
+提交補丁之前要檢查的事項。裝置樹相關的補丁，請參閱
 Documentation/devicetree/bindings/submitting-patches.rst 。
 
 本文件假設您正在使用 ``git`` 準備你的補丁。如果您不熟悉 ``git`` ，最好學習
@@ -25,26 +25,26 @@ Documentation/devicetree/bindings/submitting-patches.rst 。
 部分子系統和維護人員的樹有一些關於其工作流程和要求的額外資訊，請參閱
 Documentation/process/maintainer-handbooks.rst 。
 
-獲取當前源碼樹
---------------
+獲取目前的原始程式碼樹
+----------------------
 
-如果您手頭沒有當前核心原始程式碼的儲存庫，請使用 ``git`` 獲取一份。您需要先獲取
+如果您手頭沒有目前核心原始程式碼的儲存庫，請使用 ``git`` 獲取一份。您需要先獲取
 主線儲存庫，它可以透過以下命令拉取::
 
     git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 
 但是，請注意，您可能不想直接針對主線樹進行開發。大多數子系統維護人員運
 行自己的樹，並希望看到針對這些樹準備的補丁。請參見MAINTAINERS檔案中子系
-統的 **T:** 項以查找該樹，或者直接詢問維護者該樹是否未在其中列出。
+統的 **T:** 項以尋找該樹，或者直接詢問維護者該樹是否未在其中列出。
 
 .. _tw_describe_changes:
 
 描述你的改動
 ------------
 
-描述你的問題。無論您的補丁是一行錯誤修復還是5000行新功能，都必須有一個潛在
-的問題激勵您完成這項工作。說服審閱者相信有一個問題值得解決，讓他們讀完第一段
-後就能明白這一點。
+描述你的問題。無論您的修補程式是一行錯誤修復還是 5000 行新功能，都必須有一個
+潛在的問題激勵您完成這項工作。說服審閱者相信確實有一個值得解決的問題，而且值得
+他們在讀完第一段之後繼續讀下去。
 
 描述使用者可見的影響。直接崩潰和鎖定是相當有說服力的，但並不是所有的錯誤都
 那麼明目張膽。即使在程式碼審閱期間發現了這個問題，也要描述一下您認為它可能
@@ -53,11 +53,11 @@ Documentation/process/maintainer-handbooks.rst 。
 定位到下游的內容：觸發的場景、DMESG的摘錄、崩潰描述、效能迴歸、延遲尖峯、
 鎖定等。
 
-品質最佳化和權衡。如果您聲稱在效能、記憶體消耗、堆疊佔用空間或二進位大小方
-面有所改進，請包括支援它們的資料。但也要描述不明顯的成本。最佳化通常不是零
-成本的，而是在CPU、記憶體和可讀性之間進行權衡；或者，做探索性的工作，在不
-同的工作負載之間進行權衡。請描述最佳化的預期缺點，以便審閱者可以權衡成本和
-收益。
+量化最佳化和權衡。如果您聲稱在效能、記憶體消耗、堆疊佔用空間或二進位大小方
+面有所改進，請附上支持這些說法的資料。但也要描述不明顯的成本。最佳化通常不是
+零成本的，而是在 CPU、記憶體和可讀性之間進行權衡；或者，在啟發式演算法方面，
+是在不同的工作負載之間進行權衡。請描述最佳化的預期缺點，以便審閱者可以權衡
+成本和收益。
 
 提出問題之後，就要詳細地描述一下您實際在做的技術細節。對於審閱者來說，用簡練的
 英語描述程式碼的變化是很重要的，以驗證程式碼的行為是否符合您的意圖。
@@ -90,9 +90,8 @@ xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令
 發生衝突的可能性很大。記住，即使現在不會與您的六個字元ID發生衝突，這種情況
 也可能在五年後改變。
 
-如果該變更的相關討論或背景資訊可以在網上查閱，請加上“Link:”標籤指向它。例如
-你的補丁修復了一個缺陷，需要添加一個帶有URL的標籤指向郵件列表存檔或缺陷追蹤器
-的相關報告；如果該補丁是由一些早先郵件列表討論或網路上的記錄引起的，請指向它。
+如果該變更的相關討論或其他背景資訊可以在網上查閱，請加上「Link:」標籤指向它。
+如果該修補程式源自一些早先的郵件列表討論或網路上記錄的內容，請指向它。
 
 當連結到郵件列表存檔時，請首選lore.kernel.org郵件存檔服務。用郵件中的
 ``Message-ID`` 頭（去掉尖括號）可以建立連結URL。例如::
@@ -104,13 +103,22 @@ xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令
 不過，在沒有外部資源的情況下，也要儘量讓你的解釋可理解。除了提供郵件列表存檔或
 缺陷的URL之外，還要需要總結該補丁的相關討論要點。
 
+如果你的修補程式修復了一個錯誤，請使用「Closes:」標籤，並附上指向郵件列表存檔
+或公開缺陷追蹤器中該報告的 URL。例如::
+
+	Closes: https://example.com/issues/1234
+
+有些缺陷追蹤器能夠在套用帶有此標籤的提交時自動關閉問題。有些監看郵件列表的
+機器人也可以追蹤這類標籤並採取特定動作。禁止使用私有缺陷追蹤器和無效的 URL。
+
 如果補丁修復了特定提交中的錯誤，例如使用 ``git bisect`` 發現了一個問題，請使用
 帶有至少前12個字元SHA-1 ID的“Fixes:”標籤和單行摘要。為了簡化解析腳本，不要將該
 標籤拆分為多行，標籤不受“75列換行”規則的限制。例如::
 
   Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
 
-下列 ``git config`` 設定可以讓 ``git log``, ``git show`` 增加上述風格的顯示格式::
+下列 ``git config`` 設定可以讓 ``git log``、``git show`` 指令增加輸出上述風格
+的格式::
 
 	[core]
 		abbrev = 12
@@ -133,11 +141,11 @@ xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令
 者更多的補丁檔案中。如果你的改動包含對API的修改，並且增加了一個使用該新API
 的驅動，那麼把這些修改分成兩個補丁。
 
-另一方面，如果你將一個單獨的改動做成多個補丁檔案，那麼將它們合併成一個
-單獨的補丁檔案。這樣一個邏輯上單獨的改動只被包含在一個補丁檔案裡。
+另一方面，如果你對許多檔案做了同一個改動，那麼把這些改動合併成一個修補程式。
+這樣一個邏輯上單獨的改動只被包含在一個修補程式裡。
 
-需要記住的一點是，每個補丁的更改都應易於理解，以便審閱者驗證。每個補丁都應該
-對其價值進行闡述。
+需要記住的一點是，每個修補程式的更改都應易於理解，以便審閱者驗證。每個修補程式
+本身都應該有成立的理由。
 
 如果有一個補丁依賴另外一個補丁來完成它的改動，那沒問題。直接在你的補丁
 描述裡指出 **“這個補丁依賴某補丁”** 就好了。
@@ -152,7 +160,7 @@ xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令
 檢查你的更改風格
 ----------------
 
-檢查您的補丁是否違反了基本樣式規定，詳細資訊參見
+檢查您的修補程式是否違反了基本樣式規定，詳細資訊可在
 Documentation/translations/zh_TW/process/coding-style.rst
 中找到。如果不這樣做，只會浪費審閱者的時間，並且會導致你的補丁被拒絕，甚至
 可能沒有被閱讀。
@@ -167,34 +175,32 @@ Documentation/translations/zh_TW/process/coding-style.rst
 的程式碼看起來更好，但有違規行為，那麼最好別管它。
 
 檢查者報告三個級別：
-
  - ERROR：很可能出錯的事情
  - WARNING：需要仔細審閱的事項
  - CHECK：需要思考的事情
 
-您應該能夠判斷您的補丁中存在的所有違規行為。
+您應該能夠說明您的修補程式中仍然存在的所有違規行為的理由。
 
 選擇補丁收件人
 --------------
 
-您應該總是知會任何補丁相應程式碼的子系統維護人員；查看
-MAINTAINERS檔案和原始程式碼修訂歷史記錄，以瞭解這些維護人員是誰。腳本
-scripts/get_maintainer.pl在這個步驟中非常有用。如果您找不到正在工作的子系統
-的維護人員，那麼Andrew Morton（akpm@linux-foundation.org）將充當最後的維護
+對於任何修改程式碼的修補程式，您都應該抄送給維護該程式碼的子系統維護人員及
+郵件列表；查閱 MAINTAINERS 檔案和原始程式碼修訂歷史記錄，以瞭解這些維護人員
+是誰。腳本 scripts/get_maintainer.pl 在這個步驟中非常有用（把你的修補程式的
+路徑作為參數傳給 scripts/get_maintainer.pl）。如果您找不到正在工作的子系統的
+維護人員，那麼 Andrew Morton（akpm@linux-foundation.org）將充當最後的維護
 人員。
 
-您通常還應該選擇至少一個郵件列表來接收補丁集的副本。linux-kernel@
-vger.kernel.org是所有補丁的預設列表，但是這個列表的流量已經導致了許多開發
-人員不再看它。在MAINTAINERS檔案中查找子系統特定的列表；您的補丁可能會在那
-裡得到更多的關注。不過，請不要發送垃圾郵件到無關的列表。
+所有修補程式預設都應發送到 linux-kernel@vger.kernel.org，但這個列表的流量已經
+導致了許多開發人員不再看它。不過，請不要向無關的列表和無關的人發送垃圾郵件。
 
 許多與核心相關的列表託管在kernel.org上；您可以在
 https://subspace.kernel.org 上找到它們的列表。不過，也有與核心相關
 的列表託管在其他地方。
 
 Linus Torvalds是決定改動能否進入 Linux 核心的最終裁決者。他的郵件地址是
-torvalds@linux-foundation.org 。他收到的郵件很多，所以一般來說最好 **別**
-給他發郵件。
+<torvalds@linux-foundation.org>。他收到的郵件很多，而且目前很少有修補程式
+直接經由 Linus 合入，所以一般來說你應該盡量 **避免** 寄信給他。
 
 如果您有修復可利用安全漏洞的補丁，請將該補丁發送到 security@kernel.org 。
 對於嚴重的bug，可以考慮短期禁令以允許分銷商（有時間）向使用者發布補丁；在
@@ -223,13 +229,13 @@ Linus 和其他的核心開發者需要閱讀和評論你提交的改動。對
 
 因為這個原因，所有的提交的補丁都是郵件中“內嵌”的。最簡單（和推薦）的方法就
 是使用 ``git send-email`` 。https://git-send-email.io 有 ``git send-email``
-的交互式教程。
+的互動式教學。
 
 如果你選擇不用 ``git send-email`` ：
 
 .. warning::
 
-  如果你使用剪切-貼上你的補丁，小心你的編輯器的自動換行功能破壞你的補丁
+  如果你使用剪下-貼上你的補丁，小心你的編輯器的自動換行功能破壞你的補丁
 
 不要將補丁作為MIME編碼的附件，不管是否壓縮。很多流行的郵件軟體不
 是任何時候都將MIME編碼的附件當作純文字發送的，這會使得別人無法在你的
@@ -239,7 +245,7 @@ Linus 和其他的核心開發者需要閱讀和評論你提交的改動。對
 例外：如果你的郵路損壞了補丁，那麼有人可能會要求你使用MIME重新發送補丁。
 
 請參閱 Documentation/translations/zh_TW/process/email-clients.rst
-以獲取有關設定電子郵件客戶端以使其不受影響地發送補丁的提示。
+以獲取有關設定電子郵件用戶端以使其不受影響地發送補丁的提示。
 
 回覆審閱意見
 ------------
@@ -253,6 +259,11 @@ Linus 和其他的核心開發者需要閱讀和評論你提交的改動。對
 過程，審閱者有時會變得暴躁。即使在這種情況下，也要禮貌地回應並解決他們指出的
 問題。當發送下一版時，在封面郵件或獨立補丁里加上 ``patch changelog`` 說明與
 前一版本的不同之處（參見 :ref:`tw_the_canonical_patch_format` ）。
+發布新版本時，請把曾對你的修補程式提出意見的人加進修補程式的 CC 列表，讓他們
+知道有新版本。
+
+關於電子郵件用戶端的建議和郵件列表禮儀，請參閱
+Documentation/translations/zh_TW/process/email-clients.rst 。
 
 .. _tw_interleaved_replies:
 
@@ -272,7 +283,7 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
   A: Top-posting.
   Q: What is the most annoying thing in e-mail?
 
-同樣，請裁剪掉所有與你的回覆無關的引文。這使回覆更容易查找，並節省時間和
+同樣，請裁剪掉所有與你的回覆無關的引文。這使回覆更容易尋找，並節省時間和
 空間。更多細節參見： http://daringfireball.net/2007/07/on_top ::
 
   A: No.
@@ -286,9 +297,9 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
 提交更改後，請耐心等待。審閱者是大忙人，可能無法立即審閱您的補丁。
 
 曾幾何時，補丁曾在沒收到評論的情況下消失在虛空中，但現在開發過程應該更加順
-利了。您應該在一週左右的時間內收到評論；如果沒有收到評論，請確保您已將補丁
-發送到正確的位置。在重新提交或聯繫審閱者之前至少等待一週——在諸如合併視窗之
-類的繁忙時間可能更長。
+利了。您應該在幾週內（通常是 2-3 週）收到評論；如果沒有收到評論，請確保您已
+將修補程式發送到正確的位置。在重新提交或聯繫審閱者之前至少等待一週——在諸如
+合併視窗之類的繁忙時間可能更長。
 
 在等了幾個星期後，用帶RESEND的主題重發補丁也是可以的::
 
@@ -301,7 +312,7 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
 ----------------
 
 由於到Linus和linux-kernel的電子郵件流量很高，通常會在主題行前面加上[PATCH]
-前綴。這使Linus和其他核心開發人員更容易將補丁與其他電子郵件討論區分開。
+字首。這使Linus和其他核心開發人員更容易將補丁與其他電子郵件討論區分開。
 
 ``git send-email`` 會自動為你加上。
 
@@ -311,34 +322,61 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
 為了加強對誰做了何事的追蹤，尤其是對那些透過好幾層維護者才最終到達的補丁，我
 們在透過郵件發送的補丁上引入了“簽署（sign-off）”流程。
 
-“簽署”是在補丁註解最後的一行簡單文字，認證你編寫了它或者其他
-人有權力將它作為開放原始程式碼的補丁傳遞。規則很簡單：如果你能認證如下資訊:
+「簽署」是在修補程式說明最後的一行簡單文字，認證你編寫了它，或者你有權將它
+作為開放原始碼修補程式傳遞下去。規則很簡單：如果你能認證以下內容::
+
+        Developer's Certificate of Origin 1.1
+
+        By making a contribution to this project, I certify that:
+
+        (a) The contribution was created in whole or in part by me and I
+            have the right to submit it under the open source license
+            indicated in the file; or
+
+        (b) The contribution is based upon previous work that, to the best
+            of my knowledge, is covered under an appropriate open source
+            license and I have the right under that license to submit that
+            work with modifications, whether created in whole or in part
+            by me, under the same open source license (unless I am
+            permitted to submit under a different license), as indicated
+            in the file; or
+
+        (c) The contribution was provided directly to me by some other
+            person who certified (a), (b) or (c) and I have not modified
+            it.
+
+        (d) I understand and agree that this project and the contribution
+            are public and that a record of the contribution (including all
+            personal information I submit with it, including my sign-off) is
+            maintained indefinitely and may be redistributed consistent with
+            this project or the open source license(s) involved.
+
+以下中文譯文僅供參考，以上方英文原文為準::
 
-開發者來源認證 1.1
-^^^^^^^^^^^^^^^^^^
+        開發者來源認證 1.1
 
-對於本專案的貢獻，我認證如下資訊：
+        對於本專案的貢獻，我認證如下資訊：
 
-       (a) 這些貢獻是完全或者部分的由我建立，我有權利以文件中指出
-           的開放原始程式碼許可證提交它；或者
+        (a) 這些貢獻是完全或者部分的由我建立，我有權利以檔案中指出
+            的開放原始碼許可證提交它；或者
 
-       (b) 這些貢獻基於以前的工作，據我所知，這些以前的工作受恰當的開放
-           原始程式碼許可證保護，而且，根據文件中指出的許可證，我有權提交修改後的貢獻，
-           無論是完全還是部分由我創造，這些貢獻都使用同一個開放原始程式碼許可證
-           （除非我被允許用其它的許可證）；或者
+        (b) 這些貢獻基於以前的工作，據我所知，這些以前的工作受恰當的
+            開放原始碼許可證保護，而且我有權依據該許可證，以檔案中指出
+            的同一個開放原始碼許可證（除非我被允許用其他的許可證）提交
+            修改後的作品，無論修改是完全還是部分由我創造；或者
 
-       (c) 這些貢獻由認證（a），（b）或者（c）的人直接提供給我，而
-           且我沒有修改它。
+        (c) 這些貢獻由認證（a）、（b）或者（c）的人直接提供給我，而
+            且我沒有修改它。
 
-       (d) 我理解並同意這個專案和貢獻是公開的，貢獻的記錄（包括我
-           一起提交的個人記錄，包括sign-off）被永久維護並且可以和這個專案
-           或者開放原始程式碼的許可證同步地再發行。
+        (d) 我理解並同意這個專案和貢獻是公開的，貢獻的記錄（包括我
+            一起提交的所有個人資訊，包括我的 sign-off）會被無限期保存，
+            並且可以依照這個專案或相關的開放原始碼許可證再次散布。
 
 那麼加入這樣一行::
 
   Signed-off-by: Random J Developer <random@developer.example.org>
 
-使用你的真名（抱歉，不能使用假名或者匿名。）如果使用 ``git commit -s`` 的話
+使用已知的身分（抱歉，不接受匿名貢獻。）如果使用 ``git commit -s`` 的話
 將會自動完成。撤銷也應當包含“Signed-off-by”， ``git revert -s`` 會幫你搞定。
 
 有些人會在最後加上額外的標籤。現在這些東西會被忽略，但是你可以這樣做，來標記
@@ -351,17 +389,18 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
 何時使用Acked-by:，Cc:，和Co-developed-by:
 ------------------------------------------
 
-Signed-off-by: 標籤表示簽名者參與了補丁的開發，或者他/她在補丁的傳遞路徑中。
+Signed-off-by: 標籤表示簽名者參與了修補程式的開發，或者他們在修補程式的傳遞
+路徑中。
 
 如果一個人沒有直接參與補丁的準備或處理，但希望表示並記錄他們對補丁的批准/
-贊成，那麼他們可以要求在補丁的變更日誌中添加一個Acked-by:。
+贊成，那麼他們可以要求在補丁的變更日誌中新增一個Acked-by:。
 
 Acked-by: 供以某種方式對受影響程式碼負責或與之相關的人使用。最常見的情況是，
-當維護者既沒有貢獻也沒有轉發補丁時，由該維護者使用。
+當維護者既沒有貢獻也沒有轉寄補丁時，由該維護者使用。
 
 Acked-by: 也可以由其他利益相關者使用，例如具有領域知識的人（例如被修改程式
 碼的原作者）、核心uAPI補丁的使用者空間側審閱者，或某項功能的關鍵使用者。在
-這些情況下，可以視需要加上一個“# 後綴”以澄清其含義::
+這些情況下，可以視需要加上一個“# 字尾”以澄清其含義::
 
 	Acked-by: The Stakeholder <stakeholder@example.org> # As primary user
 
@@ -377,7 +416,7 @@ Acked-by: 也不如 Reviewed-by: 正式。例如，維護者可以用它表示
 Acked-by：不一定表示對整個補丁的確認。例如，如果一個補丁影響多個子系統，並
 且有一個來自某個子系統維護者的Acked-By:，那麼這通常表示只確認影響維護者程
 式碼的部分。這裡應該仔細判斷。如有疑問，應參考郵件列表存檔中的原始討論。在
-這種情況下也可以使用“# 後綴”來澄清。
+這種情況下也可以使用“# 字尾”來澄清。
 
 如果某人本應有機會對補丁進行評論，但沒有提供此類評論，您可以選擇在補丁中添加
 ``Cc:`` 標籤。此標籤記錄了討論中包含的潛在利益相關方。注意，這是僅有的三個
@@ -386,7 +425,8 @@ Acked-by：不一定表示對整個補丁的確認。例如，如果一個補丁
 
 Co-developed-by: 聲明補丁是由多個開發人員共同建立的；當幾個人在一個補丁上工
 作時，它用於給出共同作者（除了From:所給出的作者之外）。因為Co-developed-by:
-表示作者身份，所以每個Co-developed-by:必須緊跟在相關合作作者的簽署之後。標準
+表示作者身份，所以每個 Co-developed-by: 後面必須緊跟著相關共同作者的
+Signed-off-by:。標準
 簽署程式要求Signed-off-by:標籤的順序應儘可能反映補丁的時間歷史，無論作者是通
 過From:還是Co-developed-by:表明。值得注意的是，最後一個Signed-off-by:必須是
 提交補丁的開發人員。
@@ -419,35 +459,60 @@ Co-developed-by: 聲明補丁是由多個開發人員共同建立的；當幾個
 使用Reported-by:、Tested-by:、Reviewed-by:、Suggested-by:和Fixes:
 -----------------------------------------------------------------
 
-Reported-by: 給那些發現錯誤並報告錯誤的人致謝，它希望激勵他們在將來再次幫助
-我們。注意，Reported-by標籤是僅有的三個可以在未經被指名者明確許可的情況下
-使用的標籤之一（詳見下面的“標記他人需要許可”）。此標籤是為Bug設計的；請不要
-將其用於感謝功能請求。
+Reported-by 標籤給那些發現錯誤並報告錯誤的人致謝，並希望激勵他們在將來再次
+幫助我們。此標籤是為錯誤設計的；請不要將其用於感謝功能請求。除非該報告無法在
+網上查閱，否則此標籤後面應接著一個指向該報告的 Closes: 標籤。如果修補程式只
+修復了所報告問題的一部分，可以用 Link: 標籤取代 Closes:。注意，Reported-by
+標籤是僅有的三個可以在未經被指名者明確許可的情況下使用的標籤之一（詳見下面的
+「標記他人需要許可」）。
 
 Tested-by: 標籤表示補丁已由指定的人（在某些環境中）成功測試。這個標籤通知
 維護人員已經執行了一些測試，為將來的補丁提供了一種定位測試人員的方法，並彰
 顯測試人員的功勞。
 
-Reviewed-by：根據審閱者的監督聲明，表明該補丁已被審閱並被認為是可接受的：
+而 Reviewed-by: 則表示，根據 Reviewer's Statement，該修補程式已被審閱並被
+認為是可接受的::
 
+	Reviewer's statement of oversight
 
-審閱者的監督聲明
-^^^^^^^^^^^^^^^^
+	By offering my Reviewed-by: tag, I state that:
 
-透過提供我的Reviewed-by:標籤，我聲明：
+	 (a) I have carried out a technical review of this patch to
+	     evaluate its appropriateness and readiness for inclusion into
+	     the mainline kernel.
 
-        (a) 我已經對這個補丁進行了一次技術審閱，以評估它是否適合被包含到
-            主線核心中。
+	 (b) Any problems, concerns, or questions relating to the patch
+	     have been communicated back to the submitter.  I am satisfied
+	     with the submitter's response to my comments.
 
-        (b) 與補丁相關的任何問題、顧慮或問題都已反饋給提交者。我對提交者對
-            我的評論的回應感到滿意。
+	 (c) While there may be things that could be improved with this
+	     submission, I believe that it is, at this time, (1) a
+	     worthwhile modification to the kernel, and (2) free of known
+	     issues which would argue against its inclusion.
 
-        (c) 雖然這一提交可能仍可被改進，但我相信，此時，（1）對核心
-            進行了有價值的修改，（2）沒有包含爭論中涉及的已知問題。
+	 (d) While I have reviewed the patch and believe it to be sound, I
+	     do not (unless explicitly stated elsewhere) make any
+	     warranties or guarantees that it will achieve its stated
+	     purpose or function properly in any given situation.
 
-        (d) 雖然我已經審閱了補丁並認為它是健全的，但我不會（除非另有明確
-            說明）作出任何保證或擔保它會在任何給定情況下實作其規定的目的
-            或正常執行。
+以下中文譯文僅供參考，以上方英文原文為準::
+
+	審閱者的監督聲明
+
+	透過提供我的 Reviewed-by: 標籤，我聲明：
+
+	 (a) 我已經對這個修補程式進行了一次技術審閱，以評估它是否適合
+	     被包含到主線核心中，以及是否已準備就緒。
+
+	 (b) 與修補程式相關的任何問題、顧慮或疑問都已回饋給提交者。我對
+	     提交者對我的評論的回應感到滿意。
+
+	 (c) 雖然這一提交可能仍有可改進之處，但我相信，此時，（1）它是
+	     對核心有價值的修改，（2）沒有會反對將其納入的已知問題。
+
+	 (d) 雖然我已經審閱了修補程式並認為它是健全的，但我不會（除非另
+	     有明確說明）作出任何保證或擔保它會在任何給定情況下達成其所
+	     述目的或正常運作。
 
 Reviewed-by是一種觀點聲明，即補丁是對核心的適當修改，沒有任何遺留的嚴重技
 術問題。任何感興趣的審閱者（完成了審閱工作且具有已知身分的人）都可以為一個
@@ -456,7 +521,7 @@ Reviewed-by是一種觀點聲明，即補丁是對核心的適當修改，沒有
 時，通常會增加補丁進入核心的可能性。
 
 一旦從測試人員或審閱者的“Tested-by”和“Reviewed-by”標籤出現在郵件列表中，作
-者應在發送下一個版本時將其添加到適用的補丁中。但是，如果補丁在以下版本中發
+者應在發送下一個版本時將其添加到適用的補丁中。但是，如果補丁在後續版本中發
 生了實質性更改，這些標籤可能不再適用，因此應該刪除。通常，刪除某人的
 Acked-by、Tested-by或Reviewed-by標籤時，應在補丁更改日誌中（在 ``---`` 分
 隔符之後）提及並附上解釋。
@@ -470,11 +535,9 @@ Fixes: 指示補丁修復了之前提交中的一個缺陷。它可以便於確
 檢查錯誤修復。這個標籤還幫助穩定核心團隊確定應該接收修復的穩定核心版本。這是
 指示補丁修復的錯誤的首選方法。請參閱 :ref:`tw_describe_changes` 瞭解更多資訊。
 
-.. note::
-
-  附加Fixes:標籤不會改變穩定核心規則流程，也不改變所有穩定版補丁抄送
-  stable@vger.kernel.org的要求。有關更多資訊，請閱讀
-  Documentation/translations/zh_TW/process/stable-kernel-rules.rst 。
+注意：附加 Fixes: 標籤並不會繞過穩定核心規則流程，也不會取代所有穩定版候選
+修補程式都要抄送 stable@vger.kernel.org 的要求。有關更多資訊，請閱讀
+Documentation/translations/zh_TW/process/stable-kernel-rules.rst 。
 
 最後，雖然提供標籤是受歡迎的且通常非常受讚賞，但請注意，簽署者（即提交者和
 維護者）可以自行斟酌是否採用所提供的標籤。
@@ -503,7 +566,7 @@ Fixes: 指示補丁修復了之前提交中的一個缺陷。它可以便於確
 標準補丁格式
 ------------
 
-本節描述如何格式化補丁本身。請注意，如果您的補丁儲存在 ``Git`` 儲存庫中，則
+本節描述如何格式化補丁本身。請注意，如果您的補丁儲存在 ``git`` 儲存庫中，則
 可以使用 ``git format-patch`` 進行正確的補丁格式化。但是，這些工具無法建立
 必要的文字，因此請務必閱讀下面的說明。
 
@@ -512,7 +575,7 @@ Fixes: 指示補丁修復了之前提交中的一個缺陷。它可以便於確
 
 標準的補丁標題行是::
 
-    Subject: [PATCH 001/123] 子系統:一句話概述
+    Subject: [PATCH 001/123] subsystem: summary phrase
 
 標準補丁的信體包含如下部分：
 
@@ -531,30 +594,35 @@ Fixes: 指示補丁修復了之前提交中的一個缺陷。它可以便於確
 
   - 實際補丁（ ``diff`` 輸出）。
 
-標題行的格式，使得對標題行按字母序排序非常的容易——很多郵件客戶端都
+標題行的格式，使得對標題行按字母序排序非常的容易——很多郵件用戶端都
 可以支援——因為序列號是用零填充的，所以按數字排序和按字母排序是一樣的。
 
-郵件標題中的“子系統”標識哪個核心子系統將被打補丁。
+郵件標題中的 ``subsystem`` （子系統）應標明這個修補程式修改的是核心的哪個區域
+或子系統。
 
-郵件標題中的“一句話概述”扼要的描述郵件中的補丁。“一句話概述”
-不應該是一個檔名。對於一個補丁系列（“補丁系列”指一系列的多個相關補丁
-），不要對每個補丁都使用同樣的“一句話概述”。
+郵件標題中的 ``summary phrase`` （一句話概述）應扼要地描述該郵件所含的修補
+程式。``summary phrase`` 不應該是一個檔名。對於一整個修補程式系列
+（``patch series`` 指一系列有順序的多個相關修補程式），不要對每個修補程式都
+使用同樣的 ``summary phrase``。
 
-記住郵件的“一句話概述”會成為該補丁的全域唯一標識。它會進入 ``git``
-的改動記錄裡。然後“一句話概述”會被用在開發者的討論裡，用來指代這個補丁
-。使用者將希望透過搜索引擎搜索“一句話概述”來找到那些討論這個補丁的文
-章。當人們在兩三個月後使用諸如 ``gitk`` 或 ``git log --oneline`` 之類
-的工具查看數千個補丁時，也會很快看到它。
+記住郵件的 ``summary phrase`` 會成為該修補程式的全域唯一標識。它會一路進入
+``git`` 的改動記錄裡。之後 ``summary phrase`` 可能會被用在開發者的討論裡，用來
+指代這個修補程式。人們會想用搜尋引擎搜尋 ``summary phrase`` 來閱讀關於這個
+修補程式的討論。當人們在兩三個月後使用諸如 ``gitk`` 或 ``git log --oneline``
+之類的工具瀏覽可能數以千計的修補程式時，它也會是人們唯一能快速看到的內容。
 
-出於這些原因，概述必須不超過70-75個字元，並且必須描述補丁的更改以及為
-什麼需要補丁。既要簡潔又要描述性很有挑戰性，但寫得好的概述應該這樣。
+出於這些原因，``summary`` 必須不超過 70-75 個字元，並且必須既描述修補程式改了
+什麼，也描述為什麼需要這個修補程式。既要簡潔又要具描述性很有挑戰性，但寫得好
+的概述就應該做到這一點。
 
-概述的前綴可以用方括號括起來：“Subject: [PATCH <tag>...] <概述>”。標記
-不被視為概述的一部分，而是描述應該如何處理補丁。如果補丁的多個版本已發
-送出來以響應評審（即“v1，v2，v3”）則必須包含版本號，或包含“RFC”以指示
-評審請求。如果一個補丁系列中有四個補丁，那麼各個補丁可以這樣編號：1/4、2/4、
-3/4、4/4。這可以確保開發人員瞭解補丁應用的順序，且
-已經查看或應用了補丁系列中的所有補丁。
+``summary phrase`` 的前面可以加上用中括號括起來的標記：「Subject: [PATCH
+<tag>...] <summary phrase>」。這些標記不被視為概述的一部分，而是描述應該如何
+處理修補程式。常見的標記可能包括版本號碼（如果修補程式為了回應評論而發送了多個
+版本，即「v1, v2, v3」），或用「RFC」表示徵求意見（request for comments）。
+
+如果一個修補程式系列中有四個修補程式，那麼各個修補程式可以這樣編號：1/4、2/4、
+3/4、4/4。這可以確保開發人員瞭解修補程式應套用的順序，並確認他們已經審閱或
+套用了修補程式系列中的所有修補程式。
 
 一些標題的例子::
 
@@ -566,11 +634,11 @@ Fixes: 指示補丁修復了之前提交中的一個缺陷。它可以便於確
 From行
 ^^^^^^
 
-``From`` 行必須是信體裡的最上面一行，具有如下格式::
+``from`` 行必須是信體裡的最上面一行，具有如下格式：
 
         From: Patch Author <author@example.com>
 
-``From`` 行指明在永久改動日誌裡，誰會被確認為作者。如果沒有 ``From`` 行，那
+``from`` 行指明在永久改動日誌裡，誰會被確認為作者。如果沒有 ``from`` 行，那
 麼郵件頭裡的 ``From:`` 行會被用來決定改動日誌中的作者。
 
 作者可以透過在 ``from`` 行和 ``SoB`` 行中加上組織名稱，來表明其所屬單位
@@ -581,14 +649,15 @@ From行
 說明主體
 ^^^^^^^^
 
-說明文字將會被提交到永久的原始程式碼改動日誌裡，因此應針對那些早已經不記得和這
-個補丁相關的討論細節的讀者。包括補丁處理的故障症狀（核心日誌訊息、oops訊息
-等），這對於可能正在搜索提交日誌以查找適用補丁的人特別有用。文字應該寫得如
-此詳細，以便在數週、數月甚至數年後閱讀時，能夠為讀者提供所需的細節資訊，以
-掌握建立補丁的 **原因** 。
+說明文字將會被提交到永久的原始程式碼改動日誌裡，因此應讓那些早已忘記可能促成
+這個修補程式的討論細節、但具備相關能力的讀者也能理解。包括修補程式所處理的
+故障症狀（核心日誌訊息、oops 訊息等），這對於可能正在搜尋提交日誌以尋找適用
+修補程式的人特別有用。文字應該寫得如此詳細，以便在數週、數月甚至數年後閱讀
+時，能夠為讀者提供所需的細節資訊，以掌握建立補丁的 **原因** 。
 
-如果一個補丁修復了一個編譯失敗，那麼可能不需要包含 *所有* 編譯失敗；
-只要足夠讓搜索補丁的人能夠找到它就行了。與概述一樣，既要簡潔又要描述性。
+如果一個修補程式修復了一個編譯失敗，那麼可能不需要包含 *所有* 編譯失敗；
+只要足夠讓搜尋該修補程式的人能夠找到它就行了。與 ``summary phrase`` 一樣，
+既要簡潔又要具描述性。
 
 
 .. _tw_backtraces:
@@ -618,12 +687,14 @@ From行
 
 對於 ``---`` 標記之後的額外註解，一個好的用途就是用來寫 ``diffstat`` ，用
 來顯示修改了什麼檔案和每個檔案都增加和刪除了多少行。 ``diffstat`` 對於比較
-大的補丁特別有用。使用 ``diffstat`` 的選項 ``-p 1 -w 70`` 這樣檔名就會從核
-心原始程式碼樹的目錄開始，不會佔用太寬的空間（很容易適合80列的寬度，也許會
-有一些縮排。）（ ``git`` 預設會產生合適的diffstat。）
+大的補丁特別有用。如果你要在 ``---`` 標記之後附上 ``diffstat``，請使用
+``diffstat`` 的選項 ``-p 1 -w 70``，這樣檔名就會從核心原始程式碼樹的頂層開始
+列出，不會佔用太寬的空間（很容易放進 80 列的寬度，也許還能有一些縮排）。
+（ ``git`` 預設會產生合適的 diffstat。）
 
 其餘那些只適用於當時或者與維護者相關的註解，不合適放到永久的改動日誌裡的，也
-應該放這裡。較好的例子就是 ``補丁更改記錄`` ，記錄了v1和v2版本補丁之間的差異。
+應該放這裡。較好的例子就是 ``patch changelogs`` （修補程式變更記錄），記錄了 v1
+和 v2 版本修補程式之間的差異。
 
 請將此資訊放在將變更日誌與補丁的其餘部分分隔開的 ``---`` 行 **之後** 。版本
 資訊不是提交到git樹的變更日誌的一部分。只是供審閱人員使用的附加資訊。如果將
@@ -652,19 +723,23 @@ lore.kernel.org存檔連結），以幫助審閱者::
 明確回覆郵件頭（In-Reply-To）
 -----------------------------
 
-手動添加回復補丁的的郵件頭（In-Reply_To:）是有用的（例如，使用 ``git send-email`` ），
-可以將補丁與以前的相關討論關聯起來，例如，將bug補丁連結到電子郵件和bug報告。
-但是，對於多補丁系列，最好避免在回覆時使用連結到該系列的舊版本。這樣，
-補丁的多個版本就不會成為電子郵件客戶端中無法管理的引用樹。如果連結有用，
-可以使用 https://lore.kernel.org/ 重定向器（例如，在封面電子郵件文字中）
+手動為修補程式添加 In-Reply-To: 郵件頭（例如在使用 ``git send-email`` 時）
+可能會有幫助，可以將修補程式與以前的相關討論關聯起來，例如將錯誤修復連結到
+包含錯誤報告的郵件。但是，對於多修補程式系列，通常最好避免使用 In-Reply-To:
+連結到該系列的舊版本。這樣，
+補丁的多個版本就不會成為電子郵件用戶端中無法管理的引用樹。如果連結有用，
+可以使用 https://lore.kernel.org/ 重新導向器（例如，在封面電子郵件文字中）
 連結到補丁系列的早期版本。
 
 給出基礎樹資訊
 --------------
 
-當其他開發人員收到您的補丁並開始審閱時，知道應該將您的工作放到程式碼樹歷史記錄
-中的什麼位置通常很有用。這對於自動化持續整合流水（CI）特別有用，這些流水線試
-圖執行一系列測試，以便在維護人員開始審閱之前確定提交的品質。
+當其他開發人員收到您的修補程式並開始審閱時，考慮到如今維護者樹的數量之多，他們
+絕對有必要知道您的工作是基於哪個基礎提交或分支。請再次留意前面說明過的
+MAINTAINERS 檔案中的 **T:** 項。
+
+這對於自動化的持續整合（CI）流程更加重要，這些流程會嘗試執行一系列測試，以便
+在維護人員開始審閱之前確定您所提交內容的品質。
 
 如果您使用 ``git format-patch`` 產生補丁，則可以透過 ``--base`` 標誌在提交中
 自動包含基礎樹資訊。使用此選項最簡單、最方便的方法是配合主題分支::
@@ -697,9 +772,12 @@ lore.kernel.org存檔連結），以幫助審閱者::
     ``--base`` 功能是在2.9.0版git中引入的。
 
 如果您不使用git格式化補丁，仍然可以包含相同的 ``base-commit`` 尾註，以指示您
-的工作所基於的樹的提交哈希。你應該在封面郵件或系列的第一個補丁中添加它，它應
+的工作所基於的樹的提交雜湊值。你應該在封面郵件或系列的第一個補丁中添加它，它應
 該放在 ``---`` 行的下面或所有其他內容之後，即只在你的電子郵件簽名之前。
 
+請確認該基礎提交位於官方的維護者樹或主線樹中，而不是某個只有你能存取的內部
+樹，否則它將毫無用處。
+
 工具
 ----
 
-- 
2.43.0

