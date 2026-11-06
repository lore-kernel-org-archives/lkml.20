Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964986;
	b=SRNa63n5oCglT3LOF1PWmJX7xHUAq1kiLsJrjFC/+nG3heyoavSSwGcKE9mEVeDOq+LH
	 zz331j+wNa+lEMHfy2d5dY2/OAvykT3ihncfxXySiwt5jEUlkkLzr++lfV+mbECeoG+TZ
	 SX9WyibN+Q0ASD9yMNzfYiuHmG/a8iVXcZN/s2wyO7uvVT7Np36FgSsYNzbG9f3Ca7js9
	 rV1YZkJAR5WCyOVWL2eQxXbK4GMX1VnHsT810TmqpFw7ic4UAcZtmG4MEn/X9Bn6e312v
	 sHvPkAOUthm3Ss/MuB9+0aAoiss/q9LynG5E27no5t10AAnD6ipbayJ4tuw5kMyDT6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ICa14Hc4PS3c7X/NUUurURbAo12e4LiPmOA/n1L6P0I=;
	b=bZH1fXf3ey6qkYkmx3MVTSWQ2z5HLCH22AQOmuTrJOLJmvmq+mp6NfK+VHZPAHZiUjvB
	 a69FC11LGnCzBP3bhNoQlAVch9/cduDNxdFvhTTFCG/YwJN5J07BAhWMPLH9EnHthnjWc
	 i5Ykmk/8BoCdsw6tVTJ2fhVOYh3+S64ewaRQp8DxpI16FDHrsiMb3jxkEM6lWx7uRqxD2
	 PnFvzIyEDvsKd8kBYAxOQblKICOP0EJUsz56nBc+DJFgK1yYUof4mV5cwv5vPjAy2MtjY
	 m+Vyax/w55G1pNEz4C+dIvT0p3lnjS1qC/XDDEtoAtx5aipFH8jGnYk0f28BPCbvvcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHjsT3HO;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60960A5BD0
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F60960A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHjsT3HO
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0b6cae44aso107439a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964985; x=1794569785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ICa14Hc4PS3c7X/NUUurURbAo12e4LiPmOA/n1L6P0I=;
        b=GHjsT3HOrrbZgTTsyJsSoDmP4xHYBDk8MNGNR/8wgQs8QQt4lrgi0u1Awm5qe1FnDp
         IrGITAn8Uzdc/XUjp3OXuAkpyK31uc45ODNtnOgL5GKqxzKraZS9L/k7QUmM0lb3abwD
         mNhCD81BUZ/QAJdGXL/RN83+t73E9KH6St3iDSF7bIx63NVyvB5pfrUCFaHP8D8f4F8I
         nI0gpR4mZGGspqDoHOpxwoWeUOiEfin6O9OpC2PfwsGcXsdAe9AukyE81zWi1s3ypVRB
         /LJ5MMQbm1zr80pdLiUD1a807ZT5+x8uRsT7MsaHFjvVfb4AUBV9r6JnGBjDDnQrpCtQ
         qlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964985; x=1794569785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ICa14Hc4PS3c7X/NUUurURbAo12e4LiPmOA/n1L6P0I=;
        b=Jy0q3Kuoi5t+5/YFayGO+UecOP54f7Ghku1h6tWPO9cVhhzEUXLlTTHQ2j9Ud+GizW
         c0wYmXqgeiFRNbqJ/LozjjmziD+gS2GbfphpIm5A5BUriGckVxQmq8atLSPBPee1djAT
         7/0yLAodGo8wnzF4GxSbC+jsQVShs23waYVA87qNp/AmFQY9/wx6RbOoZimwK5U/EeyF
         gKfD8g7qB2kmCrBlqqafR49uvqV0JHOE0lyuiL2bUoMaSeiQvyny6+pJbwk100dU8rHN
         o7lhDHfz7PQ4jV76TuVIFXCPQC0bRRep9xgu/loGkUnbmrFtk18B3GgyetB1TUEZaXk/
         XQRg==
X-Forwarded-Encrypted: i=1; AL+hErGz0cdDHB8UvPJthOXrw8PP31ztJ0Wz1HYAEV4BxmzR9WPMuhPYapnG84O2aC4mivIP2O9HnpgsfI6VK7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z91TyYKKRHZd/qnC6slkGf3rRzB79acz8Hx3rXwxDe19J+ukKNz
	hszBhhtFR/QoaWVrAcMMsr37g7KVFDrZcNsIw7FopDYF5QTgDSMYyCyn
X-Gm-Gg: AYBFou2ImEtXvOv/OwK92LkRZ2kD7gdjKCqBefB6MTACzom/hhixrGjzuHfilGuJWtn
	Hbu3dHQPDJvV+WTWtLxufDLlx5KuqOZgRHJmLfF+ti+9UWWGWcPJwR55xqCrbUzgsRTFTG8Ujc8
	1/PXiqiP0mkHxsY8z7AS3SxMHhBVIArT8hr7U4MltIbYovITyoxKDNKR/Os8BL4v1DeqWcajQVH
	UrK+Ob2VFxBzdPJ9aTILEtfm9OIjMDtd+UM7IGGKE5IGIkxBYv6CkXy+jZNkzu4DezcJriZd5uy
	yVSYCqqpo6172WP7EcqvkaGDqUEvqkXbkjme5Nh2G7JtuUTBRQo1NbXiLSvK5/MznNL+NinnuWM
	zCD3o5nA98oWqZqmSV4DcfqR16IenRP8lg/1i+5tGSSaOAG8Zp+Dvo/VvwA2Q3Fthipa3JLNXh+
	DDJuMkcL33bvA9i8UjzpDJWpRMzLo9fvMH99Q/Hj2JIoX+6EngCawlK/G0AcTQ0SvmNnqnglI/o
	kCk3kMckkLxFXrFWzavihe8K6J6R6UFLUx5uVHbR57+Zq2lbOeSscmlPjI2wK++IXt6Tzrx6GRq
	+cDPLfh6As/L5fGAGxh5Dkgzz3rBIvP/cGRBXcUXk+sQ9aFLA5WsSacv0WfMBtwxgwGA9U849Je
	gKCcbPbhWmlPyoIfkC9XwhHyo
X-Received: by 2002:a17:90b:224e:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3b0db62ffb8mr3312377a91.2.1793964984504;
        Fri, 06 Nov 2026 03:36:24 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:23 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 08/13] docs/zh_TW: process: add kernel-docs.rst translation
Date: Fri,  6 Nov 2026 19:35:39 +0800
Message-ID: <20261106113545.708896-9-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
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

Translate Documentation/process/kernel-docs.rst into Traditional
Chinese from the current English text, including the Rust section and
The Linux Memory Manager entry.  Book, site and talk titles are kept
in English, and the long book titles are wrapped to fit in 80 columns.
There is no zh_CN translation of this file to consult.

List the new file in the toctree of process/index.rst, before
deprecated as in the English index, and drop it from the TODOList.

update to commit 57937eac1f78 ("kernel-docs: Add book to
process/kernel-docs.rst")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/index.rst      |   5 +-
 .../zh_TW/process/kernel-docs.rst             | 355 ++++++++++++++++++
 2 files changed, 356 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/process/kernel-docs.rst

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index d7d947d33cf5..8c558bbf30e4 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -116,12 +116,9 @@ TODOList:
 .. toctree::
    :maxdepth: 1
 
+   kernel-docs
    deprecated
 
-TODOList:
-
-* kernel-docs
-
 .. only::  subproject and html
 
    目錄
diff --git a/Documentation/translations/zh_TW/process/kernel-docs.rst b/Documentation/translations/zh_TW/process/kernel-docs.rst
new file mode 100644
index 000000000000..633a08f30c44
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/kernel-docs.rst
@@ -0,0 +1,355 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/kernel-docs.rst
+
+.. _tw_kernel_docs:
+
+其他核心文件索引
+================
+
+之所以需要這樣一份文件，是因為在 linux-kernel 郵件列表上，同樣的問題、
+同樣詢問資料出處的請求一再出現。
+
+幸運的是，隨著越來越多人接觸 GNU/Linux，也有越來越多人對核心產生興趣。
+但光是閱讀原始程式碼並不總是足夠。看懂程式碼很容易，卻可能錯過這些
+程式碼背後的概念、理念和設計決策。
+
+不幸的是，可供初學者入門的文件並不多。而且即使有，也沒有一個「眾所周知」
+的地方來收錄它們。這份文件試圖彌補這個缺口。
+
+如果你知道任何這裡沒有列出的文章，或者寫了新的文件，請務必依照核心的
+修補程式提交流程，在這裡加上它的參考資料。也歡迎任何更正、想法或意見。
+
+所有文件都以下列欄位編目：文件的「標題」、「作者」、可以找到該文件的
+「URL」、有助於搜尋特定主題的一些「關鍵字」，以及文件的簡短「說明」。
+
+.. note::
+
+   本文件各節中的文件依出版日期排序，由新到舊。維護者應定期淘汰已經
+   過時或不再適用的資源；但基礎書籍除外。
+
+Linux 核心原始程式碼樹中的文件
+------------------------------
+
+Sphinx 書籍應以 ``make {htmldocs | pdfdocs | epubdocs}`` 建置。
+
+    * 名稱：**linux/Documentation**
+
+      :作者: 許多人。
+      :位置: Documentation/
+      :關鍵字: 文字檔、Sphinx。
+      :說明: 隨核心原始程式碼一起提供、位於 Documentation 目錄中的
+        文件。本文件中的一些頁面（包括本文件本身）已經移到那裡，可能比
+        網頁版本更新。
+
+線上文件
+--------
+
+    * 標題：**Linux Kernel Mailing List Glossary**
+
+      :作者: 多人
+      :URL: https://kernelnewbies.org/KernelGlossary
+      :日期: 持續更新的版本
+      :關鍵字: 詞彙表、術語、linux-kernel。
+      :說明: 引言中寫道：「這份詞彙表旨在簡要說明你在討論 Linux 核心時
+        可能會聽到的一些縮寫和術語」。
+
+    * 標題：**The Linux Kernel Module Programming Guide**
+
+      :作者: Peter Jay Salzman, Michael Burian, Ori Pomerantz, Bob Mottram,
+        Jim Huang.
+      :URL: https://sysprog21.github.io/lkmpg/
+      :日期: 2021
+      :關鍵字: 模組、GPL 書籍、/proc、ioctl、系統呼叫、中斷處理常式。
+      :說明: 一本非常好的 GPL 書籍，主題是模組程式設計，附有大量範例。
+        新版本目前在 https://github.com/sysprog21/lkmpg 積極維護中。
+
+已出版的書籍
+------------
+
+    * 標題：**The Linux Memory Manager**
+
+      :作者: Lorenzo Stoakes
+      :出版社: No Starch Press
+      :日期: 2025 年 2 月
+      :頁數: 1300
+      :ISBN: 978-1718504462
+      :備註: 記憶體管理。完整草稿可透過預購搶先閱讀，正式版預計於
+              2025 年秋季發行。詳情請見
+              https://nostarch.com/linux-memory-manager 。
+
+    * 標題：**Practical Linux System Administration: A Guide to Installation,
+      Configuration, and Management, 1st Edition**
+
+      :作者: Kenneth Hess
+      :出版社: O'Reilly Media
+      :日期: 2023 年 5 月
+      :頁數: 246
+      :ISBN: 978-1098109035
+      :備註: 系統管理
+
+    * 標題：**Linux Kernel Debugging: Leverage proven tools and advanced
+      techniques to effectively debug Linux kernels and kernel modules**
+
+      :作者: Kaiwan N Billimoria
+      :出版社: Packt Publishing Ltd
+      :日期: 2022 年 8 月
+      :頁數: 638
+      :ISBN: 978-1801075039
+      :備註: 除錯書籍
+
+    * 標題：**Linux Kernel Programming: A Comprehensive Guide to Kernel
+      Internals, Writing Kernel Modules, and Kernel Synchronization**
+
+      :作者: Kaiwan N Billimoria
+      :出版社: Packt Publishing Ltd
+      :日期: 2021 年 3 月（第二版於 2024 年出版）
+      :頁數: 754
+      :ISBN: 978-1789953435（第二版 ISBN 為 978-1803232225）
+
+    * 標題：**Linux Kernel Programming Part 2 - Char Device Drivers and
+      Kernel Synchronization: Create user-kernel interfaces, work with
+      peripheral I/O, and handle hardware interrupts**
+
+      :作者: Kaiwan N Billimoria
+      :出版社: Packt Publishing Ltd
+      :日期: 2021 年 3 月
+      :頁數: 452
+      :ISBN: 978-1801079518
+
+    * 標題：**Linux System Programming: Talking Directly to the Kernel and C
+      Library**
+
+      :作者: Robert Love
+      :出版社: O'Reilly Media
+      :日期: 2013 年 6 月
+      :頁數: 456
+      :ISBN: 978-1449339531
+      :備註: 基礎書籍
+
+    * 標題：**Linux Kernel Development, 3rd Edition**
+
+      :作者: Robert Love
+      :出版社: Addison-Wesley
+      :日期: 2010 年 7 月
+      :頁數: 440
+      :ISBN: 978-0672329463
+      :備註: 基礎書籍
+
+.. _tw_ldd3_published:
+
+    * 標題：**Linux Device Drivers, 3rd Edition**
+
+      :作者: Jonathan Corbet, Alessandro Rubini, and Greg Kroah-Hartman
+      :出版社: O'Reilly & Associates
+      :日期: 2005
+      :頁數: 636
+      :ISBN: 0-596-00590-3
+      :備註: 基礎書籍。更多資訊請見
+        http://www.oreilly.com/catalog/linuxdrive3/
+        PDF 格式的 URL：https://lwn.net/Kernel/LDD3/
+
+    * 標題：**The Design of the UNIX Operating System**
+
+      :作者: Maurice J. Bach
+      :出版社: Prentice Hall
+      :日期: 1986
+      :頁數: 471
+      :ISBN: 0-13-201757-1
+      :備註: 基礎書籍
+
+其他
+----
+
+    * 名稱：**Cross-Referencing Linux**
+
+      :URL: https://elixir.bootlin.com/
+      :關鍵字: 瀏覽原始程式碼。
+      :說明: 另一個網頁版的 Linux 核心原始程式碼瀏覽器。提供大量變數與
+        函式的交叉參照，可以看到它們在哪裡定義、在哪裡使用。
+
+    * 名稱：**Linux Weekly News**
+
+      :URL: https://lwn.net
+      :關鍵字: 最新核心新聞。
+      :說明: 標題已經說明了一切。其中有固定的核心專欄，彙整每週開發者的
+        工作、錯誤修正、新功能以及推出的版本。
+
+    * 名稱：**The home page of Linux-MM**
+
+      :作者: Linux-MM 團隊。
+      :URL: https://linux-mm.org/
+      :關鍵字: 記憶體管理、Linux-MM、mm 修補程式、TODO、文件、郵件列表。
+      :說明: 專門介紹 Linux 記憶體管理開發的網站。有記憶體相關的修補程式、
+        HOWTO、連結、mm 開發者……如果你對記憶體管理開發有興趣，千萬別
+        錯過！
+
+    * 名稱：**Kernel Newbies IRC Channel and Website**
+
+      :URL: https://www.kernelnewbies.org
+      :關鍵字: IRC、新手、頻道、提問。
+      :說明: irc.oftc.net 上的 #kernelnewbies。
+        #kernelnewbies 是專為「新手」核心駭客設立的 IRC 網路。參與者
+        大多是正在學習核心的人、正在進行核心專案的人，或是願意幫助較
+        沒經驗的核心開發者的專業核心駭客。
+        #kernelnewbies 位於 OFTC IRC 網路。
+        請以 irc.oftc.net 作為伺服器，然後 /join #kernelnewbies。
+        kernelnewbies 網站上也有文章、文件、FAQ……
+
+    * 名稱：**linux-kernel mailing list archives and search engines**
+
+      :URL: https://subspace.kernel.org
+      :URL: https://lore.kernel.org
+      :關鍵字: linux-kernel、封存、搜尋。
+      :說明: 一些 linux-kernel 郵件列表的封存站。如果你知道更好的或
+        其他的，請告訴我。
+
+    * 名稱：**The Linux Foundation YouTube channel**
+
+      :URL: https://www.youtube.com/user/thelinuxfoundation
+      :關鍵字: linux、影片、linux-foundation、youtube。
+      :說明: Linux 基金會會上傳其協作活動、Linux 研討會（包括 LinuxCon）
+        的影片，以及其他與 Linux 和軟體開發相關的原創研究與內容。
+
+Rust
+----
+
+    * 標題：**Rust for Linux**
+
+      :作者: 多人
+      :URL: https://rust-for-linux.com/
+      :日期: 持續更新的版本
+      :關鍵字: 詞彙表、術語、linux-kernel、rust。
+      :說明: 網站上寫道：「Rust for Linux 是為 Linux 核心加入 Rust 語言
+        支援的專案。這個網站旨在彙集與此專案相關的連結、文件和資源」。
+
+    * 標題：**Learn Rust the Dangerous Way**
+
+      :作者: Cliff L. Biffle
+      :URL: https://cliffle.com/p/dangerust/
+      :日期: 2024 年 9 月 11 日存取
+      :關鍵字: rust、部落格。
+      :說明: 網站上寫道：「LRtDW 是一系列文章，為可能沒有正式資訊科學
+        背景的低階 C 程式設計師，把 Rust 的特性放在實際情境中說明——也就是
+        從事韌體、遊戲引擎、作業系統核心之類工作的人。基本上，就是像我
+        這樣的人。」。它逐行示範如何把 C 轉換成 Rust。
+
+    * 標題：**The Rust Book**
+
+      :作者: Steve Klabnik 和 Carol Nichols，以及 Rust 社群的貢獻者
+      :URL: https://doc.rust-lang.org/book/
+      :日期: 2024 年 9 月 11 日存取
+      :關鍵字: rust、書籍。
+      :說明: 網站上寫道：「本書充分發揮 Rust 賦予使用者能力的潛力。這是
+        一份友善、平易近人的文字，不只要幫助你提升 Rust 知識，也要提升你
+        身為程式設計師整體的能力範圍與信心。那就一頭栽進來，準備好學習——
+        歡迎加入 Rust 社群！」。
+
+    * 標題：**Rust for the Polyglot Programmer**
+
+      :作者: Ian Jackson
+      :URL: https://www.chiark.greenend.org.uk/~ianmdlvl/rust-polyglot/index.html
+      :日期: 2022 年 12 月
+      :關鍵字: rust、部落格、工具。
+      :說明: 網站上寫道：「Rust 的指南和入門介紹有很多。這一份有些不同：
+        它是寫給已經懂得許多其他程式語言的資深程式設計師。我試著寫得夠
+        全面，可以作為 Rust 任何領域的起點，但除了與你預期不同的地方之外，
+        盡量不深入細節。此外，這份指南並非完全不帶個人觀點，其中包括對
+        函式庫（crate）、工具等的推薦。」。
+
+    * 標題：**Fasterthanli.me**
+
+      :作者: Amos Wenger
+      :URL: https://fasterthanli.me/
+      :日期: 2024 年 9 月 11 日存取
+      :關鍵字: rust、部落格、新聞。
+      :說明: 網站上寫道：「我製作關於電腦如何運作的文章和影片。我的內容
+        篇幅很長、具教學性且富探索性——而且常常是教 Rust 的藉口！」。
+
+    * 標題：**Comprehensive Rust**
+
+      :作者: Google 的 Android 團隊
+      :URL: https://google.github.io/comprehensive-rust/
+      :日期: 2024 年 9 月 13 日存取
+      :關鍵字: rust、部落格。
+      :說明: 網站上寫道：「本課程涵蓋 Rust 的全部範圍，從基本語法到泛型
+        和錯誤處理等進階主題」。
+
+    * 標題：**The Embedded Rust Book**
+
+      :作者: 多位貢獻者，主要是 Jorge Aparicio
+      :URL: https://docs.rust-embedded.org/book/
+      :日期: 2024 年 9 月 13 日存取
+      :關鍵字: rust、部落格。
+      :說明: 網站上寫道：「一本介紹如何在『裸機』嵌入式系統（例如微控制器）
+        上使用 Rust 程式語言的入門書」。
+
+   * 標題：**Experiment: Improving the Rust Book**
+
+      :作者: Brown University 的 Cognitive Engineering Lab
+      :URL: https://rust-book.cs.brown.edu/
+      :日期: 2024 年 9 月 22 日存取
+      :關鍵字: rust、部落格。
+      :說明: 網站上寫道：「這個實驗的目標是評估並改進 Rust Book 的內容，
+        幫助大家更有效地學習 Rust。」。
+
+   * 標題：**New Rustacean** （podcast）
+
+      :作者: Chris Krycho
+      :URL: https://newrustacean.com/
+      :日期: 2024 年 9 月 22 日存取
+      :關鍵字: rust、podcast。
+      :說明: 網站上寫道：「這是一個從零開始學習 Rust 程式語言的
+        podcast！除了這個漂亮的登陸頁面之外，網站的所有內容都是用 Rust
+        自己的文件工具建置的。」。
+
+   * 標題：**Opsem-team** （儲存庫）
+
+      :作者: Operational semantics team
+      :URL: https://github.com/rust-lang/opsem-team/tree/main
+      :日期: 2024 年 9 月 22 日存取
+      :關鍵字: rust、儲存庫。
+      :說明: README 中寫道：「opsem 團隊是 unsafe-code-guidelines 工作
+        小組的後繼者，負責回答許多關於 unsafe Rust 語意的困難問題」。
+
+    * 標題：**You Can't Spell Trust Without Rust**
+
+      :作者: Alexis Beingessner
+      :URL: https://repository.library.carleton.ca/downloads/1j92g820w?locale=en
+      :日期: 2015
+      :關鍵字: rust、碩士、論文。
+      :說明: 這篇論文聚焦於 Rust 的所有權系統，它透過控制資料的操作與
+        生命週期來確保記憶體安全；論文也指出了它的限制，並將它與 Cyclone
+        和 C++ 中的類似系統做比較。
+
+    * 名稱：**Linux Plumbers (LPC) 2024 Rust presentations**
+
+      :講題: Rust microconference
+      :URL: https://lpc.events/event/18/sessions/186/#20240918
+      :講題: Rust for Linux
+      :URL: https://lpc.events/event/18/contributions/1912/
+      :講題: Journey of a C kernel engineer starting a Rust driver project
+      :URL: https://lpc.events/event/18/contributions/1911/
+      :講題: Crafting a Linux kernel scheduler that runs in user-space
+        using Rust
+      :URL: https://lpc.events/event/18/contributions/1723/
+      :講題: openHCL: A Linux and Rust based paravisor
+      :URL: https://lpc.events/event/18/contributions/1956/
+      :關鍵字: rust、lpc、演講。
+      :說明: 一些與 Rust 相關的 LPC 演講。
+
+    * 名稱：**The Rustacean Station Podcast**
+
+      :URL: https://rustacean-station.org/
+      :關鍵字: rust、podcast。
+      :說明: 為 Rust 程式語言製作 podcast 內容的社群專案。
+
+-------
+
+本文件最初基於：
+
+ https://www.dit.upm.es/~jmseyas/linux/kernel/hackers-docs.html
+
+由 Juan-Mariano de Goyeneche 撰寫
-- 
2.43.0

