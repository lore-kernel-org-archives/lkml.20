Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793CF524AF9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687487; cv=none; b=djwKG0c9VLl2kEAAAMQo3XplqgSuPMT5kzCTWHe2lXx0hc6oD5fu55M4EZ8mCJgbD6Dyy5y4SMDHe4kj4UCQ1xkCLRsIkoo7fwqZgO8tU6e/Efvi7YlawXw0l6ucbv9Mk+Ymm1gbUTj2Z5mXVFmOzeHKZnpfQ3rLx6KEt5Y/jyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687487; c=relaxed/simple;
	bh=qg7JvCQ7Lp2g4ihbdP2BU6i1hl4RHIdz/ERMyp0vdZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mLBpnLTxfAvbgxX93PQczPX2K8gV11Tr6JypL1ITPRbF/KEyLwUDsQSpctljnhwoU7CqUOpi8rsYKVnGQBljj3Hy1v2xq0HVHBJuetAYvoTbtAUpy1YfYlSSqftfGHEMjjqGpwUtmC2dv0+9gIG9TfK1Y8P6WxjPa9sw0TLS2Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0uQjddI; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0uQjddI"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e1330155aeso1936545ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687479; x=1791292279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0kXjkp6HSFZRA4d+c+i8MoQ8BTZz90gw2T67fJhAF4=;
        b=D0uQjddI5f7MV0WosKRwXRhuNcalmJkRSJjIcPBo8I5Q+LlRAMS9qEegMlEZ9pUbaR
         oJ/+JDBICEMT1GXZ+dil3gE4c4zxcMtAgJ6qjpHWEe0AliKkZvnmSJa8UqCAv7gax3N4
         OQEwajrA0Uyq18nQ2rkIjIAJ3tzsyg10rIYWIMQK57ftdMwMSY6TqxNO1qMu9DizP63b
         hb3DvQxi6bqqMvjvTCWMtLM3BSBb3EkkWB9sg0P7GpRoUoWw+oj/++Kg93eLUU7EliHy
         +Lt05OZ5JQxC+loZxdoygYpGPAasHAYXBW+qLHA1T65n633IhUcCje4wzFVPuL6IT5BG
         PY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687479; x=1791292279;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0kXjkp6HSFZRA4d+c+i8MoQ8BTZz90gw2T67fJhAF4=;
        b=CNcsEKlGsJXu8b37XdxFkSaDds2yuzv9XeNUywVBiaoydB5H1S6FDgSs7YgMW4W2Sc
         D1hgLCrAOk+dW7lInWrn/2WBrPOK+Et3ylhtAO4BgnnDTmN3nf7IrXks2EiB/GBNO21c
         KVanrayjImU/1E0ypS+W0wU94asOULV3K9e+CwJRFHqROHe5pJbU3EcaylxPrQ9XiYUK
         A+3N563H/PR0D80I7bMkBknJanyc4dGtqwHB4ZhMl5QnY0ayjfPnn4KvKvAj3ecmXnb9
         9y8u9CedmXVEu4SnQRfhTKrWD4c+EhtqENZthCYifLlV26iCf3pn5g73G8CUcy00iQNq
         +B5g==
X-Forwarded-Encrypted: i=1; AKwUvBzwc7/xumJ3Yl56kX3mZKV579lmHK/M9g78iQxaqKXoKXkWcog8qj+oDP2gQmacm6cgCzu1flEQp8cvtc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeX8lxYbuvHCCjU2nRANoatxdyUwKiOk2wUeCK5CffAJ6taIT2
	ERgJOKT8Ms5JmAtALp506FduETqvaygnJntnNUx0jdv9wdrXPxqJrXXe
X-Gm-Gg: AYBFou3H432SLKPGWdthqCsXy7e8WfBINrykCV+Gp3SXSmkuWEVJsYVnH35x/FzfT3V
	o5AtP+Ysii0l2XWVBmjrzRCDUQJ9wPcobTyJGToZPD5Csf/KL0WQuK271+kYwVAQge88vGtID9F
	/tcRWauEuZfZMjgItPvL0XUegWZ+l++RYcHsHH32Bn9MaJAaux3N7JeTKsdShmgr7wp+G6PN51m
	rjkCKYEn6ArDJ4ghs0edGzdLbRH2gKb5Qia1ipfAmEugx8brTJ/gZkiaxxcFlgXeAB9clkyM2sD
	oqa0E0O5XJPma1fkuNexVsg5DRAG0XFpfCY1mPLFiJYj8ax7YKh1Dd3NgdLOpuASA0s02fwA5hC
	7LubvP6LzGKGcNGNYp9TXWKMaHtklzGhsdS/vU0YWbi+BUvEjMfYIt5HTErSOp5slslnLyfEFEa
	7xoCsaBmBtVV8RHfIceQcweoM8V078Ra9XrhAFhfA1P6jPLoUS1zWbKT0eVKTe9SylpDhkJiIxT
	BISsR9PLL0flPH6I7VkZQ2omWunh3ecAdl/3L1uCIpb13R06bhhlYxMPw==
X-Received: by 2002:a17:902:e550:b0:2df:8909:f719 with SMTP id d9443c01a7336-2df8e71a14amr176937465ad.3.1790687478298;
        Tue, 29 Sep 2026 06:11:18 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2d8c1329fsm499815ad.39.2026.09.29.06.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:17 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] docs/zh_TW: remove the unreachable plain-text translations
Date: Tue, 29 Sep 2026 21:11:07 +0800
Message-ID: <20260929131109.266535-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These nine files predate the move of the documentation to
reStructuredText.  Sphinx only reads .rst sources, so none of them is
part of the built documentation, and nothing in the zh_TW tree refers to
them; they can only be found by browsing the source tree.

  zh_TW file                          English original
  IRQ.txt                             core-api/irq/index.rst
  io_ordering.txt                     driver-api/io_ordering.rst
  arch/arm/Booting                    arch/arm/booting.rst
  arch/arm/kernel_user_helpers.txt    arch/arm/kernel_user_helpers.rst
  arch/arm64/booting.txt              arch/arm64/booting.rst
  arch/arm64/legacy_instructions.txt  arch/arm64/legacy_instructions.rst
  arch/arm64/memory.txt               arch/arm64/memory.rst
  arch/arm64/silicon-errata.txt       arch/arm64/silicon-errata.rst
  arch/arm64/tagged-pointers.txt      arch/arm64/tagged-pointers.rst

Beyond the format, two of them no longer line up with the English tree
at all: core-api/irq/index.rst is now only a toctree, the prose IRQ.txt
translates having moved to core-api/irq/concepts.rst, and
io_ordering.txt sits at the top level although its original lives under
driver-api/.

As proposed in the zh_TW scope discussion and agreed there, remove them
rather than convert them.  arch/arm/Booting was also listed in the
proposal as a translation whose original had moved; being one of these
files, it is removed rather than relocated.

Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
Link: https://lore.kernel.org/linux-doc/ap5xEtMdwXS8Pvcf@wyuan.org/
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
This applies on top of v2 of the contact-block cleanup:
  https://lore.kernel.org/linux-doc/20260929115956.229610-1-chenyou910331@gmail.com/

That series still edits IRQ.txt, io_ordering.txt and the arch/arm{,64}
plain-text files (3/7 and 7/7) so that it stands on its own; once this
patch lands those hunks are moot.  That also answers Jon's question on
v1 7/7 about handling the old files together with the wider update:
they are removed here instead.

 Documentation/translations/zh_TW/IRQ.txt      |  33 ---
 .../translations/zh_TW/arch/arm/Booting       | 169 -----------
 .../zh_TW/arch/arm/kernel_user_helpers.txt    | 275 ------------------
 .../translations/zh_TW/arch/arm64/booting.txt | 243 ----------------
 .../zh_TW/arch/arm64/legacy_instructions.txt  |  66 -----
 .../translations/zh_TW/arch/arm64/memory.txt  | 110 -------
 .../zh_TW/arch/arm64/silicon-errata.txt       |  71 -----
 .../zh_TW/arch/arm64/tagged-pointers.txt      |  48 ---
 .../translations/zh_TW/io_ordering.txt        |  62 ----
 9 files changed, 1077 deletions(-)
 delete mode 100644 Documentation/translations/zh_TW/IRQ.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm/Booting
 delete mode 100644 Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/booting.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/memory.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
 delete mode 100644 Documentation/translations/zh_TW/io_ordering.txt

diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
deleted file mode 100644
index b9a3e18495d2..000000000000
--- a/Documentation/translations/zh_TW/IRQ.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Chinese translated version of Documentation/core-api/irq/index.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
----------------------------------------------------------------------
-Documentation/core-api/irq/index.rst 的繁體中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
-者翻譯存在問題，請聯繫繁體中文版維護者。
-
-以下爲正文
----------------------------------------------------------------------
-何爲 IRQ?
-
-一個 IRQ 是來自某個設備的一個中斷請求。目前，它們可以來自一個硬體引腳，
-或來自一個數據包。多個設備可能連接到同個硬體引腳，從而共享一個 IRQ。
-
-一個 IRQ 編號是用於告知硬體中斷源的內核標識。通常情況下，這是一個
-全局 irq_desc 數組的索引，但是除了在 linux/interrupt.h 中的實現，
-具體的細節是體系結構特定的。
-
-一個 IRQ 編號是設備上某個可能的中斷源的枚舉。通常情況下，枚舉的編號是
-該引腳在系統內中斷控制器的所有輸入引腳中的編號。對於 ISA 總線中的情況，
-枚舉的是在兩個 i8259 中斷控制器中 16 個輸入引腳。
-
-架構可以對 IRQ 編號指定額外的含義，在硬體涉及任何手工配置的情況下，
-是被提倡的。ISA 的 IRQ 是一個分配這類額外含義的典型例子。
-
diff --git a/Documentation/translations/zh_TW/arch/arm/Booting b/Documentation/translations/zh_TW/arch/arm/Booting
deleted file mode 100644
index 4d60be5401c1..000000000000
--- a/Documentation/translations/zh_TW/arch/arm/Booting
+++ /dev/null
@@ -1,169 +0,0 @@
-Chinese translated version of Documentation/arch/arm/booting.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
----------------------------------------------------------------------
-Documentation/arch/arm/booting.rst 的中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者。
-
-以下爲正文
----------------------------------------------------------------------
-
-			啓動 ARM Linux
-			==============
-
-作者：Russell King
-日期：2002年5月18日
-
-以下文檔適用於 2.4.18-rmk6 及以上版本。
-
-爲了啓動 ARM Linux，你需要一個引導裝載程序（boot loader），
-它是一個在主內核啓動前運行的一個小程序。引導裝載程序需要初始化各種
-設備，並最終調用 Linux 內核，將信息傳遞給內核。
-
-從本質上講，引導裝載程序應提供（至少）以下功能：
-
-1、設置和初始化 RAM。
-2、初始化一個串口。
-3、檢測機器的類型（machine type）。
-4、設置內核標籤列表（tagged list）。
-5、調用內核映像。
-
-
-1、設置和初始化 RAM
--------------------
-
-現有的引導加載程序:		強制
-新開發的引導加載程序:		強制
-
-引導裝載程序應該找到並初始化系統中所有內核用於保持系統變量數據的 RAM。
-這個操作的執行是設備依賴的。（它可能使用內部算法來自動定位和計算所有
-RAM，或可能使用對這個設備已知的 RAM 信息，還可能使用任何引導裝載程序
-設計者想到的匹配方法。）
-
-
-2、初始化一個串口
------------------------------
-
-現有的引導加載程序:		可選、建議
-新開發的引導加載程序:		可選、建議
-
-引導加載程序應該初始化並使能一個目標板上的串口。這允許內核串口驅動
-自動檢測哪個串口用於內核控制檯。(一般用於調試或與目標板通信。)
-
-作爲替代方案，引導加載程序也可以通過標籤列表傳遞相關的'console='
-選項給內核以指定某個串口，而串口數據格式的選項在以下文檔中描述：
-
-       Documentation/admin-guide/kernel-parameters.rst。
-
-
-3、檢測機器類型
---------------------------
-
-現有的引導加載程序:		可選
-新開發的引導加載程序:		強制
-
-引導加載程序應該通過某些方式檢測自身所處的機器類型。這是一個硬件
-代碼或通過查看所連接的硬件用某些算法得到，這些超出了本文檔的範圍。
-引導加載程序最終必須能提供一個 MACH_TYPE_xxx 值給內核。
-(詳見 linux/arch/arm/tools/mach-types )。
-
-4、設置啓動數據
-------------------
-
-現有的引導加載程序:		可選、強烈建議
-新開發的引導加載程序:		強制
-
-引導加載程序必須提供標籤列表或者 dtb 映像以傳遞配置數據給內核。啓動
-數據的物理地址通過寄存器 r2 傳遞給內核。
-
-4a、設置內核標籤列表
---------------------------------
-
-bootloader 必須創建和初始化內核標籤列表。一個有效的標籤列表以
-ATAG_CORE 標籤開始，並以 ATAG_NONE 標籤結束。ATAG_CORE 標籤可以是
-空的，也可以是非空。一個空 ATAG_CORE 標籤其 size 域設置爲
-‘2’(0x00000002)。ATAG_NONE 標籤的 size 域必須設置爲零。
-
-在列表中可以保存任意數量的標籤。對於一個重複的標籤是追加到之前標籤
-所攜帶的信息之後，還是會覆蓋原來的信息，是未定義的。某些標籤的行爲
-是前者，其他是後者。
-
-bootloader 必須傳遞一個系統內存的位置和最小值，以及根文件系統位置。
-因此，最小的標籤列表如下所示：
-
-		+-----------+
-基地址 ->	| ATAG_CORE |  |
-		+-----------+  |
-		| ATAG_MEM  |  | 地址增長方向
-		+-----------+  |
-		| ATAG_NONE |  |
-		+-----------+  v
-
-標籤列表應該保存在系統的 RAM 中。
-
-標籤列表必須置於內核自解壓和 initrd'bootp' 程序都不會覆蓋的內存區。
-建議放在 RAM 的頭 16KiB 中。
-
-4b、設置設備樹
--------------------------
-
-bootloader 必須以 64bit 地址對齊的形式加載一個設備樹映像(dtb)到系統
-RAM 中，並用啓動數據初始化它。dtb 格式在文檔
-https://www.devicetree.org/specifications/ 中。內核將會在
-dtb 物理地址處查找 dtb 魔數值（0xd00dfeed），以確定 dtb 是否已經代替
-標籤列表被傳遞進來。
-
-bootloader 必須傳遞一個系統內存的位置和最小值，以及根文件系統位置。
-dtb 必須置於內核自解壓不會覆蓋的內存區。建議將其放置於 RAM 的頭 16KiB
-中。但是不可將其放置於“0”物理地址處，因爲內核認爲：r2 中爲 0，意味着
-沒有標籤列表和 dtb 傳遞過來。
-
-5、調用內核映像
----------------------------
-
-現有的引導加載程序:		強制
-新開發的引導加載程序:		強制
-
-調用內核映像 zImage 有兩個選擇。如果 zImge 保存在 flash 中，且是爲了
-在 flash 中直接運行而被正確鏈接的。這樣引導加載程序就可以在 flash 中
-直接調用 zImage。
-
-zImage 也可以被放在系統 RAM（任意位置）中被調用。注意：內核使用映像
-基地址的前 16KB RAM 空間來保存頁表。建議將映像置於 RAM 的 32KB 處。
-
-對於以上任意一種情況，都必須符合以下啓動狀態：
-
-- 停止所有 DMA 設備，這樣內存數據就不會因爲虛假網絡包或磁盤數據而被破壞。
-  這可能可以節省你許多的調試時間。
-
-- CPU 寄存器配置
-  r0 = 0，
-  r1 = （在上面 3 中獲取的）機器類型碼。
-  r2 = 標籤列表在系統 RAM 中的物理地址，或
-       設備樹塊(dtb)在系統 RAM 中的物理地址
-
-- CPU 模式
-  所有形式的中斷必須被禁止 (IRQs 和 FIQs)
-  CPU 必須處於 SVC 模式。(對於 Angel 調試有特例存在)
-
-- 緩存，MMUs
-  MMU 必須關閉。
-  指令緩存開啓或關閉都可以。
-  數據緩存必須關閉。
-
-- 引導加載程序應該通過直接跳轉到內核映像的第一條指令來調用內核映像。
-
-  對於支持 ARM 指令集的 CPU，跳入內核入口時必須處在 ARM 狀態，即使
-  對於 Thumb-2 內核也是如此。
-
-  對於僅支持 Thumb 指令集的 CPU，比如 Cortex-M 系列的 CPU，跳入
-  內核入口時必須處於 Thumb 狀態。
-
diff --git a/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt b/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
deleted file mode 100644
index fd7fcc361d23..000000000000
--- a/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
+++ /dev/null
@@ -1,275 +0,0 @@
-Chinese translated version of Documentation/arch/arm/kernel_user_helpers.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
----------------------------------------------------------------------
-Documentation/arch/arm/kernel_user_helpers.rst 的中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者。
-
-以下爲正文
----------------------------------------------------------------------
-內核提供的用戶空間輔助代碼
-=========================
-
-在內核內存空間的固定地址處，有一個由內核提供並可從用戶空間訪問的代碼
-段。它用於向用戶空間提供因在許多 ARM CPU 中未實現的特性和/或指令而需
-內核提供幫助的某些操作。這些代碼直接在用戶模式下執行的想法是爲了獲得
-最佳效率，但那些與內核計數器聯繫過於緊密的部分，則被留給了用戶庫實現。
-事實上，此代碼甚至可能因不同的 CPU 而異，這取決於其可用的指令集或它
-是否爲 SMP 系統。換句話說，內核保留在不作出警告的情況下根據需要更改
-這些代碼的權利。只有本文檔描述的入口及其結果是保證穩定的。
-
-這與完全成熟的 VDSO 實現不同（但兩者並不衝突），儘管如此，VDSO 可阻止
-某些通過常量高效跳轉到那些代碼段的彙編技巧。且由於那些代碼段在返回用戶
-代碼前僅使用少量的代碼週期，則一個 VDSO 間接遠程調用將會在這些簡單的
-操作上增加一個可測量的開銷。
-
-在對那些擁有原生支持的新型處理器進行代碼優化時，僅在已爲其他操作使用
-了類似的新增指令，而導致二進制結果已與早期 ARM 處理器不兼容的情況下，
-用戶空間才應繞過這些輔助代碼，並在內聯函數中實現這些操作（無論是通過
-編譯器在代碼中直接放置，還是作爲庫函數調用實現的一部分）。也就是說，
-如果你編譯的代碼不會爲了其他目的使用新指令，則不要僅爲了避免使用這些
-內核輔助代碼，導致二進制程序無法在早期處理器上運行。
-
-新的輔助代碼可能隨着時間的推移而增加，所以新內核中的某些輔助代碼在舊
-內核中可能不存在。因此，程序必須在對任何輔助代碼調用假設是安全之前，
-檢測 __kuser_helper_version 的值（見下文）。理想情況下，這種檢測應該
-只在進程啓動時執行一次；如果內核版本不支持所需輔助代碼，則該進程可儘早
-中止執行。
-
-kuser_helper_version
---------------------
-
-位置:	0xffff0ffc
-
-參考聲明:
-
-  extern int32_t __kuser_helper_version;
-
-定義:
-
-  這個區域包含了當前運行內核實現的輔助代碼版本號。用戶空間可以通過讀
-  取此版本號以確定特定的輔助代碼是否存在。
-
-使用範例:
-
-#define __kuser_helper_version (*(int32_t *)0xffff0ffc)
-
-void check_kuser_version(void)
-{
-	if (__kuser_helper_version < 2) {
-		fprintf(stderr, "can't do atomic operations, kernel too old\n");
-		abort();
-	}
-}
-
-注意:
-
-  用戶空間可以假設這個域的值不會在任何單個進程的生存期內改變。也就
-  是說，這個域可以僅在庫的初始化階段或進程啓動階段讀取一次。
-
-kuser_get_tls
--------------
-
-位置:	0xffff0fe0
-
-參考原型:
-
-  void * __kuser_get_tls(void);
-
-輸入:
-
-  lr = 返回地址
-
-輸出:
-
-  r0 = TLS 值
-
-被篡改的寄存器:
-
-  無
-
-定義:
-
-  獲取之前通過 __ARM_NR_set_tls 系統調用設置的 TLS 值。
-
-使用範例:
-
-typedef void * (__kuser_get_tls_t)(void);
-#define __kuser_get_tls (*(__kuser_get_tls_t *)0xffff0fe0)
-
-void foo()
-{
-	void *tls = __kuser_get_tls();
-	printf("TLS = %p\n", tls);
-}
-
-注意:
-
-  - 僅在 __kuser_helper_version >= 1 時，此輔助代碼存在
-    （從內核版本 2.6.12 開始）。
-
-kuser_cmpxchg
--------------
-
-位置:	0xffff0fc0
-
-參考原型:
-
-  int __kuser_cmpxchg(int32_t oldval, int32_t newval, volatile int32_t *ptr);
-
-輸入:
-
-  r0 = oldval
-  r1 = newval
-  r2 = ptr
-  lr = 返回地址
-
-輸出:
-
-  r0 = 成功代碼 (零或非零)
-  C flag = 如果 r0 == 0 則置 1，如果 r0 != 0 則清零。
-
-被篡改的寄存器:
-
-  r3, ip, flags
-
-定義:
-
-  僅在 *ptr 爲 oldval 時原子保存 newval 於 *ptr 中。
-  如果 *ptr 被改變，則返回值爲零，否則爲非零值。
-  如果 *ptr 被改變，則 C flag 也會被置 1，以實現調用代碼中的彙編
-  優化。
-
-使用範例:
-
-typedef int (__kuser_cmpxchg_t)(int oldval, int newval, volatile int *ptr);
-#define __kuser_cmpxchg (*(__kuser_cmpxchg_t *)0xffff0fc0)
-
-int atomic_add(volatile int *ptr, int val)
-{
-	int old, new;
-
-	do {
-		old = *ptr;
-		new = old + val;
-	} while(__kuser_cmpxchg(old, new, ptr));
-
-	return new;
-}
-
-注意:
-
-  - 這個例程已根據需要包含了內存屏障。
-
-  - 僅在 __kuser_helper_version >= 2 時，此輔助代碼存在
-    （從內核版本 2.6.12 開始）。
-
-kuser_memory_barrier
---------------------
-
-位置:	0xffff0fa0
-
-參考原型:
-
-  void __kuser_memory_barrier(void);
-
-輸入:
-
-  lr = 返回地址
-
-輸出:
-
-  無
-
-被篡改的寄存器:
-
-  無
-
-定義:
-
-  應用於任何需要內存屏障以防止手動數據修改帶來的一致性問題，以及
-  __kuser_cmpxchg 中。
-
-使用範例:
-
-typedef void (__kuser_dmb_t)(void);
-#define __kuser_dmb (*(__kuser_dmb_t *)0xffff0fa0)
-
-注意:
-
-  - 僅在 __kuser_helper_version >= 3 時，此輔助代碼存在
-    （從內核版本 2.6.15 開始）。
-
-kuser_cmpxchg64
----------------
-
-位置:	0xffff0f60
-
-參考原型:
-
-  int __kuser_cmpxchg64(const int64_t *oldval,
-                        const int64_t *newval,
-                        volatile int64_t *ptr);
-
-輸入:
-
-  r0 = 指向 oldval
-  r1 = 指向 newval
-  r2 = 指向目標值
-  lr = 返回地址
-
-輸出:
-
-  r0 = 成功代碼 (零或非零)
-  C flag = 如果 r0 == 0 則置 1，如果 r0 != 0 則清零。
-
-被篡改的寄存器:
-
-  r3, lr, flags
-
-定義:
-
-  僅在 *ptr 等於 *oldval 指向的 64 位值時，原子保存 *newval
-  指向的 64 位值於 *ptr 中。如果 *ptr 被改變，則返回值爲零，
-  否則爲非零值。
-
-  如果 *ptr 被改變，則 C flag 也會被置 1，以實現調用代碼中的彙編
-  優化。
-
-使用範例:
-
-typedef int (__kuser_cmpxchg64_t)(const int64_t *oldval,
-                                  const int64_t *newval,
-                                  volatile int64_t *ptr);
-#define __kuser_cmpxchg64 (*(__kuser_cmpxchg64_t *)0xffff0f60)
-
-int64_t atomic_add64(volatile int64_t *ptr, int64_t val)
-{
-	int64_t old, new;
-
-	do {
-		old = *ptr;
-		new = old + val;
-	} while(__kuser_cmpxchg64(&old, &new, ptr));
-
-	return new;
-}
-
-注意:
-
-  - 這個例程已根據需要包含了內存屏障。
-
-  - 由於這個過程的代碼長度（此輔助代碼跨越 2 個常規的 kuser “槽”），
-    因此 0xffff0f80 不被作爲有效的入口點。
-
-  - 僅在 __kuser_helper_version >= 5 時，此輔助代碼存在
-    （從內核版本 3.1 開始）。
-
diff --git a/Documentation/translations/zh_TW/arch/arm64/booting.txt b/Documentation/translations/zh_TW/arch/arm64/booting.txt
deleted file mode 100644
index 2972d10562db..000000000000
--- a/Documentation/translations/zh_TW/arch/arm64/booting.txt
+++ /dev/null
@@ -1,243 +0,0 @@
-SPDX-License-Identifier: GPL-2.0
-
-Chinese translated version of Documentation/arch/arm64/booting.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
-C:	55f058e7574c3615dea4615573a19bdb258696c6
----------------------------------------------------------------------
-Documentation/arch/arm64/booting.rst 的中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者。
-
-本文翻譯提交時的 Git 檢出點爲： 55f058e7574c3615dea4615573a19bdb258696c6
-
-以下爲正文
----------------------------------------------------------------------
-			啓動 AArch64 Linux
-			==================
-
-作者: Will Deacon <will.deacon@arm.com>
-日期: 2012 年 09 月 07 日
-
-本文檔基於 Russell King 的 ARM 啓動文檔，且適用於所有公開發布的
-AArch64 Linux 內核代碼。
-
-AArch64 異常模型由多個異常級（EL0 - EL3）組成，對於 EL0 和 EL1 異常級
-有對應的安全和非安全模式。EL2 是系統管理級，且僅存在於非安全模式下。
-EL3 是最高特權級，且僅存在於安全模式下。
-
-基於本文檔的目的，我們將簡單地使用‘引導裝載程序’（‘boot loader’）
-這個術語來定義在將控制權交給 Linux 內核前 CPU 上執行的所有軟件。
-這可能包含安全監控和系統管理代碼，或者它可能只是一些用於準備最小啓動
-環境的指令。
-
-基本上，引導裝載程序（至少）應實現以下操作：
-
-1、設置和初始化 RAM
-2、設置設備樹數據
-3、解壓內核映像
-4、調用內核映像
-
-
-1、設置和初始化 RAM
------------------
-
-必要性: 強制
-
-引導裝載程序應該找到並初始化系統中所有內核用於保持系統變量數據的 RAM。
-這個操作的執行方式因設備而異。（它可能使用內部算法來自動定位和計算所有
-RAM，或可能使用對這個設備已知的 RAM 信息，還可能是引導裝載程序設計者
-想到的任何合適的方法。）
-
-
-2、設置設備樹數據
----------------
-
-必要性: 強制
-
-設備樹數據塊（dtb）必須 8 字節對齊，且大小不能超過 2MB。由於設備樹
-數據塊將在使能緩存的情況下以 2MB 粒度被映射，故其不能被置於必須以特定
-屬性映射的2M區域內。
-
-注： v4.2 之前的版本同時要求設備樹數據塊被置於從內核映像以下
-text_offset 字節處算起第一個 512MB 內。
-
-3、解壓內核映像
--------------
-
-必要性: 可選
-
-AArch64 內核當前沒有提供自解壓代碼，因此如果使用了壓縮內核映像文件
-（比如 Image.gz），則需要通過引導裝載程序（使用 gzip 等）來進行解壓。
-若引導裝載程序沒有實現這個功能，就要使用非壓縮內核映像文件。
-
-
-4、調用內核映像
--------------
-
-必要性: 強制
-
-已解壓的內核映像包含一個 64 字節的頭，內容如下：
-
-  u32 code0;			/* 可執行代碼 */
-  u32 code1;			/* 可執行代碼 */
-  u64 text_offset;		/* 映像裝載偏移，小端模式 */
-  u64 image_size;		/* 映像實際大小, 小端模式 */
-  u64 flags;			/* 內核旗標, 小端模式 *
-  u64 res2	= 0;		/* 保留 */
-  u64 res3	= 0;		/* 保留 */
-  u64 res4	= 0;		/* 保留 */
-  u32 magic	= 0x644d5241;	/* 魔數, 小端, "ARM\x64" */
-  u32 res5;			/* 保留 （用於 PE COFF 偏移） */
-
-
-映像頭註釋：
-
-- 自 v3.17 起，除非另有說明，所有域都是小端模式。
-
-- code0/code1 負責跳轉到 stext.
-
-- 當通過 EFI 啓動時， 最初 code0/code1 被跳過。
-  res5 是到 PE 文件頭的偏移，而 PE 文件頭含有 EFI 的啓動入口點
-  （efi_stub_entry）。當 stub 代碼完成了它的使命，它會跳轉到 code0
-  繼續正常的啓動流程。
-
-- v3.17 之前，未明確指定 text_offset 的字節序。此時，image_size 爲零，
-  且 text_offset 依照內核字節序爲 0x80000。
-  當 image_size 非零，text_offset 爲小端模式且是有效值，應被引導加載
-  程序使用。當 image_size 爲零，text_offset 可假定爲 0x80000。
-
-- flags 域 (v3.17 引入) 爲 64 位小端模式，其編碼如下：
-  位 0: 	內核字節序。 1 表示大端模式，0 表示小端模式。
-  位 1-2:	內核頁大小。
-			0 - 未指定。
-			1 - 4K
-			2 - 16K
-			3 - 64K
-  位 3:		內核物理位置
-			0 - 2MB 對齊基址應儘量靠近內存起始處，因爲
-			    其基址以下的內存無法通過線性映射訪問
-			1 - 2MB 對齊基址可以在物理內存的任意位置
-  位 4-63:	保留。
-
-- 當 image_size 爲零時，引導裝載程序應試圖在內核映像末尾之後儘可能
-  多地保留空閒內存供內核直接使用。對內存空間的需求量因所選定的內核
-  特性而異, 並無實際限制。
-
-內核映像必須被放置在任意一個可用系統內存 2MB 對齊基址的 text_offset
-字節處，並從該處被調用。2MB 對齊基址和內核映像起始地址之間的區域對於
-內核來說沒有特殊意義，且可能被用於其他目的。
-從映像起始地址算起，最少必須準備 image_size 字節的空閒內存供內核使用。
-注： v4.6 之前的版本無法使用內核映像物理偏移以下的內存，所以當時建議
-將映像儘量放置在靠近系統內存起始的地方。
-
-任何提供給內核的內存（甚至在映像起始地址之前），若未從內核中標記爲保留
-(如在設備樹（dtb）的 memreserve 區域），都將被認爲對內核是可用。
-
-在跳轉入內核前，必須符合以下狀態：
-
-- 停止所有 DMA 設備，這樣內存數據就不會因爲虛假網絡包或磁盤數據而
-  被破壞。這可能可以節省你許多的調試時間。
-
-- 主 CPU 通用寄存器設置
-  x0 = 系統 RAM 中設備樹數據塊（dtb）的物理地址。
-  x1 = 0 (保留，將來可能使用)
-  x2 = 0 (保留，將來可能使用)
-  x3 = 0 (保留，將來可能使用)
-
-- CPU 模式
-  所有形式的中斷必須在 PSTATE.DAIF 中被屏蔽（Debug、SError、IRQ
-  和 FIQ）。
-  CPU 必須處於 EL2（推薦，可訪問虛擬化擴展）或非安全 EL1 模式下。
-
-- 高速緩存、MMU
-  MMU 必須關閉。
-  指令緩存開啓或關閉皆可。
-  已載入的內核映像的相應內存區必須被清理，以達到緩存一致性點（PoC）。
-  當存在系統緩存或其他使能緩存的一致性主控器時，通常需使用虛擬地址
-  維護其緩存，而非 set/way 操作。
-  遵從通過虛擬地址操作維護構架緩存的系統緩存必須被配置，並可以被使能。
-  而不通過虛擬地址操作維護構架緩存的系統緩存（不推薦），必須被配置且
-  禁用。
-
-  *譯者注：對於 PoC 以及緩存相關內容，請參考 ARMv8 構架參考手冊
-   ARM DDI 0487A
-
-- 架構計時器
-  CNTFRQ 必須設定爲計時器的頻率，且 CNTVOFF 必須設定爲對所有 CPU
-  都一致的值。如果在 EL1 模式下進入內核，則 CNTHCTL_EL2 中的
-  EL1PCTEN (bit 0) 必須置位。
-
-- 一致性
-  通過內核啓動的所有 CPU 在內核入口地址上必須處於相同的一致性域中。
-  這可能要根據具體實現來定義初始化過程，以使能每個CPU上對維護操作的
-  接收。
-
-- 系統寄存器
-  在進入內核映像的異常級中，所有構架中可寫的系統寄存器必須通過軟件
-  在一個更高的異常級別下初始化，以防止在 未知 狀態下運行。
-
-  對於擁有 GICv3 中斷控制器並以 v3 模式運行的系統：
-  - 如果 EL3 存在：
-    ICC_SRE_EL3.Enable (位 3) 必須初始化爲 0b1。
-    ICC_SRE_EL3.SRE (位 0) 必須初始化爲 0b1。
-  - 若內核運行在 EL1：
-    ICC_SRE_EL2.Enable (位 3) 必須初始化爲 0b1。
-    ICC_SRE_EL2.SRE (位 0) 必須初始化爲 0b1。
-  - 設備樹（DT）或 ACPI 表必須描述一個 GICv3 中斷控制器。
-
-  對於擁有 GICv3 中斷控制器並以兼容（v2）模式運行的系統：
-  - 如果 EL3 存在：
-    ICC_SRE_EL3.SRE (位 0) 必須初始化爲 0b0。
-  - 若內核運行在 EL1：
-    ICC_SRE_EL2.SRE (位 0) 必須初始化爲 0b0。
-  - 設備樹（DT）或 ACPI 表必須描述一個 GICv2 中斷控制器。
-
-以上對於 CPU 模式、高速緩存、MMU、架構計時器、一致性、系統寄存器的
-必要條件描述適用於所有 CPU。所有 CPU 必須在同一異常級別跳入內核。
-
-引導裝載程序必須在每個 CPU 處於以下狀態時跳入內核入口：
-
-- 主 CPU 必須直接跳入內核映像的第一條指令。通過此 CPU 傳遞的設備樹
-  數據塊必須在每個 CPU 節點中包含一個 ‘enable-method’ 屬性，所
-  支持的 enable-method 請見下文。
-
-  引導裝載程序必須生成這些設備樹屬性，並在跳入內核入口之前將其插入
-  數據塊。
-
-- enable-method 爲 “spin-table” 的 CPU 必須在它們的 CPU
-  節點中包含一個 ‘cpu-release-addr’ 屬性。這個屬性標識了一個
-  64 位自然對齊且初始化爲零的內存位置。
-
-  這些 CPU 必須在內存保留區（通過設備樹中的 /memreserve/ 域傳遞
-  給內核）中自旋於內核之外，輪詢它們的 cpu-release-addr 位置（必須
-  包含在保留區中）。可通過插入 wfe 指令來降低忙循環開銷，而主 CPU 將
-  發出 sev 指令。當對 cpu-release-addr 所指位置的讀取操作返回非零值
-  時，CPU 必須跳入此值所指向的地址。此值爲一個單獨的 64 位小端值，
-  因此 CPU 須在跳轉前將所讀取的值轉換爲其本身的端模式。
-
-- enable-method 爲 “psci” 的 CPU 保持在內核外（比如，在
-  memory 節點中描述爲內核空間的內存區外，或在通過設備樹 /memreserve/
-  域中描述爲內核保留區的空間中）。內核將會發起在 ARM 文檔（編號
-  ARM DEN 0022A：用於 ARM 上的電源狀態協調接口系統軟件）中描述的
-  CPU_ON 調用來將 CPU 帶入內核。
-
-  *譯者注: ARM DEN 0022A 已更新到 ARM DEN 0022C。
-
-  設備樹必須包含一個 ‘psci’ 節點，請參考以下文檔：
-  Documentation/devicetree/bindings/arm/psci.yaml
-
-
-- 輔助 CPU 通用寄存器設置
-  x0 = 0 (保留，將來可能使用)
-  x1 = 0 (保留，將來可能使用)
-  x2 = 0 (保留，將來可能使用)
-  x3 = 0 (保留，將來可能使用)
-
diff --git a/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt b/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
deleted file mode 100644
index 722205848431..000000000000
--- a/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-SPDX-License-Identifier: GPL-2.0
-
-Chinese translated version of Documentation/arch/arm64/legacy_instructions.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
----------------------------------------------------------------------
-Documentation/arch/arm64/legacy_instructions.rst 的中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者。
-
-本文翻譯提交時的 Git 檢出點爲： bc465aa9d045feb0e13b4a8f32cc33c1943f62d6
-
-以下爲正文
----------------------------------------------------------------------
-Linux 內核在 arm64 上的移植提供了一個基礎框架，以支持構架中正在被淘汰或已廢棄指令的模擬執行。
-這個基礎框架的代碼使用未定義指令鉤子（hooks）來支持模擬。如果指令存在，它也允許在硬件中啓用該指令。
-
-模擬模式可通過寫 sysctl 節點（/proc/sys/abi）來控制。
-不同的執行方式及 sysctl 節點的相應值，解釋如下：
-
-* Undef（未定義）
-  值： 0
-  產生未定義指令終止異常。它是那些構架中已廢棄的指令，如 SWP，的默認處理方式。
-
-* Emulate（模擬）
-  值： 1
-  使用軟件模擬方式。爲解決軟件遷移問題，這種模擬指令模式的使用是被跟蹤的，並會發出速率限制警告。
-  它是那些構架中正在被淘汰的指令，如 CP15 barriers（隔離指令），的默認處理方式。
-
-* Hardware Execution（硬件執行）
-  值： 2
-  雖然標記爲正在被淘汰，但一些實現可能提供硬件執行這些指令的使能/禁用操作。
-  使用硬件執行一般會有更好的性能，但將無法收集運行時對正被淘汰指令的使用統計數據。
-
-默認執行模式依賴於指令在構架中狀態。正在被淘汰的指令應該以模擬（Emulate）作爲默認模式，
-而已廢棄的指令必須默認使用未定義（Undef）模式
-
-注意：指令模擬可能無法應對所有情況。更多詳情請參考單獨的指令註釋。
-
-受支持的遺留指令
--------------
-* SWP{B}
-節點: /proc/sys/abi/swp
-狀態: 已廢棄
-默認執行方式: Undef (0)
-
-* CP15 Barriers
-節點: /proc/sys/abi/cp15_barrier
-狀態: 正被淘汰，不推薦使用
-默認執行方式: Emulate (1)
-
-* SETEND
-節點: /proc/sys/abi/setend
-狀態: 正被淘汰，不推薦使用
-默認執行方式: Emulate (1)*
-注：爲了使能這個特性，系統中的所有 CPU 必須在 EL0 支持混合字節序。
-如果一個新的 CPU （不支持混合字節序） 在使能這個特性後被熱插入系統，
-在應用中可能會出現不可預期的結果。
-
diff --git a/Documentation/translations/zh_TW/arch/arm64/memory.txt b/Documentation/translations/zh_TW/arch/arm64/memory.txt
deleted file mode 100644
index a606f856bcee..000000000000
--- a/Documentation/translations/zh_TW/arch/arm64/memory.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-SPDX-License-Identifier: GPL-2.0
-
-Chinese translated version of Documentation/arch/arm64/memory.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
----------------------------------------------------------------------
-Documentation/arch/arm64/memory.rst 的中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者。
-
-本文翻譯提交時的 Git 檢出點爲： bc465aa9d045feb0e13b4a8f32cc33c1943f62d6
-
-以下爲正文
----------------------------------------------------------------------
-		     Linux 在 AArch64 中的內存佈局
-		     ===========================
-
-作者: Catalin Marinas <catalin.marinas@arm.com>
-
-本文檔描述 AArch64 Linux 內核所使用的虛擬內存佈局。此構架可以實現
-頁大小爲 4KB 的 4 級轉換表和頁大小爲 64KB 的 3 級轉換表。
-
-AArch64 Linux 使用 3 級或 4 級轉換表，其頁大小配置爲 4KB，對於用戶和內核
-分別都有 39-bit (512GB) 或 48-bit (256TB) 的虛擬地址空間。
-對於頁大小爲 64KB的配置，僅使用 2 級轉換表，有 42-bit (4TB) 的虛擬地址空間，但內存佈局相同。
-
-用戶地址空間的 63:48 位爲 0，而內核地址空間的相應位爲 1。TTBRx 的
-選擇由虛擬地址的 63 位給出。swapper_pg_dir 僅包含內核（全局）映射，
-而用戶 pgd 僅包含用戶（非全局）映射。swapper_pg_dir 地址被寫入
-TTBR1 中，且從不寫入 TTBR0。
-
-
-AArch64 Linux 在頁大小爲 4KB，並使用 3 級轉換表時的內存佈局：
-
-起始地址			結束地址			大小		用途
------------------------------------------------------------------------
-0000000000000000	0000007fffffffff	 512GB		用戶空間
-ffffff8000000000	ffffffffffffffff	 512GB		內核空間
-
-
-AArch64 Linux 在頁大小爲 4KB，並使用 4 級轉換表時的內存佈局：
-
-起始地址			結束地址			大小		用途
------------------------------------------------------------------------
-0000000000000000	0000ffffffffffff	 256TB		用戶空間
-ffff000000000000	ffffffffffffffff	 256TB		內核空間
-
-
-AArch64 Linux 在頁大小爲 64KB，並使用 2 級轉換表時的內存佈局：
-
-起始地址			結束地址			大小		用途
------------------------------------------------------------------------
-0000000000000000	000003ffffffffff	   4TB		用戶空間
-fffffc0000000000	ffffffffffffffff	   4TB		內核空間
-
-
-AArch64 Linux 在頁大小爲 64KB，並使用 3 級轉換表時的內存佈局：
-
-起始地址			結束地址			大小		用途
------------------------------------------------------------------------
-0000000000000000	0000ffffffffffff	 256TB		用戶空間
-ffff000000000000	ffffffffffffffff	 256TB		內核空間
-
-
-更詳細的內核虛擬內存佈局，請參閱內核啓動信息。
-
-
-4KB 頁大小的轉換表查找：
-
-+--------+--------+--------+--------+--------+--------+--------+--------+
-|63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
-+--------+--------+--------+--------+--------+--------+--------+--------+
- |                 |         |         |         |         |
- |                 |         |         |         |         v
- |                 |         |         |         |   [11:0]  頁內偏移
- |                 |         |         |         +-> [20:12] L3 索引
- |                 |         |         +-----------> [29:21] L2 索引
- |                 |         +---------------------> [38:30] L1 索引
- |                 +-------------------------------> [47:39] L0 索引
- +-------------------------------------------------> [63] TTBR0/1
-
-
-64KB 頁大小的轉換表查找：
-
-+--------+--------+--------+--------+--------+--------+--------+--------+
-|63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
-+--------+--------+--------+--------+--------+--------+--------+--------+
- |                 |    |               |              |
- |                 |    |               |              v
- |                 |    |               |            [15:0]  頁內偏移
- |                 |    |               +----------> [28:16] L3 索引
- |                 |    +--------------------------> [41:29] L2 索引
- |                 +-------------------------------> [47:42] L1 索引
- +-------------------------------------------------> [63] TTBR0/1
-
-
-當使用 KVM 時, 管理程序（hypervisor）在 EL2 中通過相對內核虛擬地址的
-一個固定偏移來映射內核頁（內核虛擬地址的高 24 位設爲零）:
-
-起始地址			結束地址			大小		用途
------------------------------------------------------------------------
-0000004000000000	0000007fffffffff	 256GB		在 HYP 中映射的內核對象
-
diff --git a/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt b/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
deleted file mode 100644
index 4b1c9cb8e019..000000000000
--- a/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-SPDX-License-Identifier: GPL-2.0
-
-Chinese translated version of Documentation/arch/arm64/silicon-errata.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
-C:	1926e54f115725a9248d0c4c65c22acaf94de4c4
----------------------------------------------------------------------
-Documentation/arch/arm64/silicon-errata.rst 的中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者。
-
-本文翻譯提交時的 Git 檢出點爲： 1926e54f115725a9248d0c4c65c22acaf94de4c4
-
-以下爲正文
----------------------------------------------------------------------
-                芯片勘誤和軟件補救措施
-                ==================
-
-作者: Will Deacon <will.deacon@arm.com>
-日期: 2015年11月27日
-
-一個不幸的現實：硬件經常帶有一些所謂的“瑕疵（errata）”，導致其在
-某些特定情況下會違背構架定義的行爲。就基於 ARM 的硬件而言，這些瑕疵
-大體可分爲以下幾類：
-
-  A 類：無可行補救措施的嚴重缺陷。
-  B 類：有可接受的補救措施的重大或嚴重缺陷。
-  C 類：在正常操作中不會顯現的小瑕疵。
-
-更多資訊，請在 infocenter.arm.com （需註冊）中查閱“軟件開發者勘誤
-筆記”（“Software Developers Errata Notice”）文檔。
-
-對於 Linux 而言，B 類缺陷可能需要操作系統的某些特別處理。例如，避免
-一個特殊的代碼序列，或是以一種特定的方式配置處理器。在某種不太常見的
-情況下，爲將 A 類缺陷當作 C 類處理，可能需要用類似的手段。這些手段被
-統稱爲“軟件補救措施”，且僅在少數情況需要（例如，那些需要一個運行在
-非安全異常級的補救措施 *並且* 能被 Linux 觸發的情況）。
-
-對於尚在討論中的可能對未受瑕疵影響的系統產生干擾的軟件補救措施，有一個
-相應的內核配置（Kconfig）選項被加在 “內核特性（Kernel Features）”->
-“基於可選方法框架的 ARM 瑕疵補救措施（ARM errata workarounds via
-the alternatives framework）"。這些選項被默認開啓，若探測到受影響的CPU，
-補丁將在運行時被使用。至於對系統運行影響較小的補救措施，內核配置選項
-並不存在，且代碼以某種規避瑕疵的方式被構造（帶註釋爲宜）。
-
-這種做法對於在任意內核源代碼樹中準確地判斷出哪個瑕疵已被軟件方法所補救
-稍微有點麻煩，所以在 Linux 內核中此文件作爲軟件補救措施的註冊表，
-並將在新的軟件補救措施被提交和向後移植（backported）到穩定內核時被更新。
-
-| 實現者         | 受影響的組件    | 勘誤編號        | 內核配置                |
-+----------------+-----------------+-----------------+-------------------------+
-| ARM            | Cortex-A53      | #826319         | ARM64_ERRATUM_826319    |
-| ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_827319    |
-| ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_824069    |
-| ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_819472    |
-| ARM            | Cortex-A53      | #845719         | ARM64_ERRATUM_845719    |
-| ARM            | Cortex-A53      | #843419         | ARM64_ERRATUM_843419    |
-| ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_832075    |
-| ARM            | Cortex-A57      | #852523         | N/A                     |
-| ARM            | Cortex-A57      | #834220         | ARM64_ERRATUM_834220    |
-|                |                 |                 |                         |
-| Cavium         | ThunderX ITS    | #22375, #24313  | CAVIUM_ERRATUM_22375    |
-| Cavium         | ThunderX GICv3  | #23154          | CAVIUM_ERRATUM_23154    |
-
diff --git a/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt b/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
deleted file mode 100644
index 3779858b065f..000000000000
--- a/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-SPDX-License-Identifier: GPL-2.0
-
-Chinese translated version of Documentation/arch/arm64/tagged-pointers.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
----------------------------------------------------------------------
-Documentation/arch/arm64/tagged-pointers.rst 的中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者。
-
-以下爲正文
----------------------------------------------------------------------
-		Linux 在 AArch64 中帶標記的虛擬地址
-		=================================
-
-作者: Will Deacon <will.deacon@arm.com>
-日期: 2013 年 06 月 12 日
-
-本文檔簡述了在 AArch64 地址轉換系統中提供的帶標記的虛擬地址及其在
-AArch64 Linux 中的潛在用途。
-
-內核提供的地址轉換表配置使通過 TTBR0 完成的虛擬地址轉換（即用戶空間
-映射），其虛擬地址的最高 8 位（63:56）會被轉換硬件所忽略。這種機制
-讓這些位可供應用程序自由使用，其注意事項如下：
-
-	(1) 內核要求所有傳遞到 EL1 的用戶空間地址帶有 0x00 標記。
-	    這意味着任何攜帶用戶空間虛擬地址的系統調用（syscall）
-	    參數 *必須* 在陷入內核前使它們的最高字節被清零。
-
-	(2) 非零標記在傳遞信號時不被保存。這意味着在應用程序中利用了
-	    標記的信號處理函數無法依賴 siginfo_t 的用戶空間虛擬
-	    地址所攜帶的包含其內部域信息的標記。此規則的一個例外是
-	    當信號是在調試觀察點的異常處理程序中產生的，此時標記的
-	    信息將被保存。
-
-	(3) 當使用帶標記的指針時需特別留心，因爲僅對兩個虛擬地址
-	    的高字節，C 編譯器很可能無法判斷它們是不同的。
-
-此構架會阻止對帶標記的 PC 指針的利用，因此在異常返回時，其高字節
-將被設置成一個爲 “55” 的擴展符。
-
diff --git a/Documentation/translations/zh_TW/io_ordering.txt b/Documentation/translations/zh_TW/io_ordering.txt
deleted file mode 100644
index 8ced3f08e69d..000000000000
--- a/Documentation/translations/zh_TW/io_ordering.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-Chinese translated version of Documentation/driver-api/io_ordering.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
----------------------------------------------------------------------
-Documentation/driver-api/io_ordering.rst 的繁體中文翻譯
-
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
-者翻譯存在問題，請聯繫繁體中文版維護者。
-
-以下爲正文
----------------------------------------------------------------------
-
-在某些平台上，所謂的內存映射I/O是弱順序。在這些平台上，驅動開發者有責任
-保證I/O內存映射地址的寫操作按程序圖意的順序達到設備。通常讀取一個「安全」
-設備寄存器或橋寄存器，觸發IO晶片清刷未處理的寫操作到達設備後才處理讀操作，
-而達到保證目的。驅動程序通常在spinlock保護的臨界區退出之前使用這種技術。
-這也可以保證後面的寫操作只在前面的寫操作之後到達設備（這非常類似於內存
-屏障操作，mb()，不過僅適用於I/O）。
-
-假設一個設備驅動程的具體例子：
-
-        ...
-CPU A:  spin_lock_irqsave(&dev_lock, flags)
-CPU A:  val = readl(my_status);
-CPU A:  ...
-CPU A:  writel(newval, ring_ptr);
-CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
-CPU B:  spin_lock_irqsave(&dev_lock, flags)
-CPU B:  val = readl(my_status);
-CPU B:  ...
-CPU B:  writel(newval2, ring_ptr);
-CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
-
-上述例子中，設備可能會先接收到newval2的值，然後接收到newval的值，問題就
-發生了。不過很容易通過下面方法來修復：
-
-        ...
-CPU A:  spin_lock_irqsave(&dev_lock, flags)
-CPU A:  val = readl(my_status);
-CPU A:  ...
-CPU A:  writel(newval, ring_ptr);
-CPU A:  (void)readl(safe_register); /* 配置寄存器？*/
-CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
-CPU B:  spin_lock_irqsave(&dev_lock, flags)
-CPU B:  val = readl(my_status);
-CPU B:  ...
-CPU B:  writel(newval2, ring_ptr);
-CPU B:  (void)readl(safe_register); /* 配置寄存器？*/
-CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
-
-在解決方案中，讀取safe_register寄存器，觸發IO晶片清刷未處理的寫操作，
-再處理後面的讀操作，防止引發數據不一致問題。
-
-- 
2.43.0

