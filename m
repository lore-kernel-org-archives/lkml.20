Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964781;
	b=U4W+kbAVB+5j+CftVTtyy3E9PXajkm3RAxK8Qk9oIVWRgSFHvKY0mBIz5Q/lRQTEwSd5
	 85xg+JhbG0DlKZ4/PVyMhPCgpunN+mLM5IvQGMofBiToweJpeun0hFKMa8D/uhr/z9EnV
	 A7o3u8A81W86psOS5Jt+5dsWM26LeYTNFO475bUfwmue8CLUNdVfy1eThcM6rZJhTaNk+
	 D4WWnCfj5+HdsXpNqVS3fJyyFvdkoO5TkPGnTZJcCHTJjbROYvLl/ZOQ9Eh6Y/YyTKf9u
	 xTbksLIvAHO/pHSYrTmS9eV67vk+uCLkk4pbtK3kaTBc/V0dq7ZJpVy8KHQwBYFCXow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vFDbG0uMkUCOTGA8G7Tr1hVMeMDxrzZtfO3WzHA9KZo=;
	b=ehUhJicBU6S91/S6ssdoHX4ENU51SlktTvKgijHB1S5NeOBhA2eElZxrujuMXmnpB7T2
	 ycpWOt6a9nxx+CBq+I+A3iD0i6UJcTcaKIlO3IlWiTMZ/zaLA18zFrWCPxXlf+AYMOFZ2
	 cmECjiT8a5CJguP2lmGemCGrTBAyhqIgBonhaDJ7iHODly5yWlcAxMkjDn42CF755Y14B
	 aoFk79hQ+lZRM2sI2NIJKsMdzWW+nqT3ypAWu1DrYSEyWsQV3n0y6oGxrYCV/0KZbFtq9
	 5UIAB6FT2CpxJ7RcxmOKI4kdes9oAj7X7ul0XJZnkmbUHApEMur4uB8MH3bfkiQhLTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDm8tC1D;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805D1606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 805D1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDm8tC1D
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso91100a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964780; x=1794569580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFDbG0uMkUCOTGA8G7Tr1hVMeMDxrzZtfO3WzHA9KZo=;
        b=EDm8tC1DhtmXMlHbcbFkrCmGQ+HB36DxdE52k5WO2xiAXxxbrnH52C4Qf6zEYo/Ayg
         +Sa/AmDLctT+n58qvGVGbSAjiWesCzo1rqwMdge7Tk8fkfSqQTtYSFCXhhuQI+B6gvtJ
         1YfMcZll7pesnzSymEA+gI1p/uWlzlYVsMjxitr41GPGDYTVt9Km+n5gdDXay+fxcv3X
         fOS8OErFyBt4qGs0bKO1FtVfMKdUaZrDbR+HdBduo4mPPQ3EG9QTdBwRYdoQAFeiyfjz
         zvaoxQbqRNJ2+gM2ykwRQhECVGE1RG5O6iE1t7ScBdF9YKt+g9GNyFe8dGL/PhafsGpp
         rcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964780; x=1794569580;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFDbG0uMkUCOTGA8G7Tr1hVMeMDxrzZtfO3WzHA9KZo=;
        b=ojlu0qgWiYzJXTJylsQlKgEupQj9XgVCV1kCQjhqRkOxvwYi9WfXpDxln7SB+ZtSgn
         olQRHP+hFLAiFwMsSt/mT9x/TmTv03MQoGS++zbptUWREGeAuDSwRX7IdZ54Llsex16D
         qRGgEWQ0KyqGzkzaHJpsMJLXFelsvbEfylNpFE6+0D19moNjFS0rb8XzWIaIVHh6bYTD
         P4mBo4u3Rjlqfhm5FOfUWEEotF1R3vNrsfcaFgwdIGKoihGN+Fw/ZHs0/0TcvFcM2Ycl
         vZsVRwRLszYoGA6yMM81GAg+WJCDd6OC91Tdk+88FUTNpJPV6RHM2AvrGMTjgm1n/Pi6
         OxrQ==
X-Forwarded-Encrypted: i=1; AL+hErGFKOP+yz+gjcXp2ebDQK2r5mcfDW+JnVIX4JaiZ5Sdl3QPCcnVMU79wa+0nC/eQZ2EJtMioyeXMgvLY1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ihmmqBknaobnLjMkzGmpIU7JdkaDgSxwjm7BUzqP20D5zkJP8
	dr27uxP8WSdbhGl/7LpyUoNv/Qugs67dFZQkUCDiUWArbj9ZLW7+DhZq
X-Gm-Gg: AYBFou3B9gFzyuwnX8rBByV7zDQ09pg/omMzHEjGHJg4nA2XLeJlNocoHBD9M92mF0/
	L7ZdYHV9b9LYH4V5yZ5co206LwjAw9heLFX1ocT0iMSltVE9+I66tTE+Wd5XXvZPDo86RfIQi/F
	R9Ufi5+a8LnW0jz2KPEjEe1eOfVsDwxBRkl8hS80O0VUmSCp/bLXFrnO26R6yLAGDtZV7pqTsyE
	nqeEKg3Sx9A79WS/ns2infSvGCM7mX97f56umaW2PKSEOg2ng669TeYuiY6KYVEF71Uzjqh9lPH
	mSKT1scWK7VQNJN3uUkZWdD5XQIozEg6NuSDotSM6JgC5ODLY8ueHf0XapvC6JAocpYUTnOG7PZ
	CINTg7NZomPUKt88MAtrG/KDnLyqssuO2oU7GQHc57enGz/PN+eC6WyygGe5DXQgu0i7/5NjpPW
	kYftTpBzVLI41B8LE/ivPZ+AWnfJ3+25M5W7PCYNGpwY2MO4wg/kfr6SbwgMY7b3xKuahh+1ATd
	KG1glXSZY70aNBmNgxITopnXbfQpN4pm7ldzjfw4b8vMa8ZSV6uHYMZz8P+c2UogdkpaeTYUGwk
	Z1i9l/trbTcGFERg8+1PRtFQSmkNFl7NiIgxhfLgRLdRfWlrtumfBBIR2t+M1hPDzkTbd2Z6zdc
	KrwLknCPPyYUnbJB/0rXS0Afl
X-Received: by 2002:a17:90b:1e4f:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b0db62690dmr3758183a91.2.1793964779427;
        Fri, 06 Nov 2026 03:32:59 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:58 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 21/25] docs/zh_TW: process: sync howto.rst with the English original
Date: Fri,  6 Nov 2026 19:31:36 +0800
Message-ID: <20261106113142.706783-22-chenyou910331@gmail.com>
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

The translation is marked "update to
commit 413e775efaec ("Documentation: fix links to mailing list
services")", but that commit only changed the mailing list links.  A
comparison against the current English text shows the rest of the file
never picked up a number of earlier changes:

- CC linux-api@vger.kernel.org on user-space interface changes
- submitting-patches.rst is now a single document, not two
- the merge window takes patches from linux-next instead of -mm, and
  after -rc1 the focus is on fixing regressions
- move the stable trees section back after the mainline tree, make the
  development process sections subsections as in the original, and add
  the version numbering and release cadence sentences
- replace the obsolete bugzilla and reporting-bugs.rst text in "Bug
  Reporting" and "Managing bug reports" with the current
  reporting-issues.rst and MAINTAINERS guidance
- add the missing "I've been working on this for 6 months..." item
- use the LWN link in the acknowledgements and drop the section title
  that the original does not have

Also retranslate sentences whose meaning had drifted: patches reviewed
"on their technical merits and those alone", the "a bit cheesy"
etiquette link, and patchwork rendered as "the tool patch".  Fix the
SPDX hyperlink, the "2)" list item and the closing quote of the Al Viro
quotation, and localize terminology (設備→裝置, 體系結構→架構,
擴展→擴充, 反饋→回饋, 源碼→原始碼, 計劃→計畫, 補丁→修補程式 in the
changed text, ...).

update to commit fdd100ee60a0 ("docs: process: use gender-neutral
pronouns")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/howto.rst      | 182 +++++++++---------
 1 file changed, 95 insertions(+), 87 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
index 1ffc076ce26c..8dcf6b9231bf 100644
--- a/Documentation/translations/zh_TW/process/howto.rst
+++ b/Documentation/translations/zh_TW/process/howto.rst
@@ -19,14 +19,14 @@
 入門
 ----
 
-你想了解如何成為一名Linux核心開發者？或者老闆吩咐你「給這個設備寫個Linux
+你想了解如何成為一名Linux核心開發者？或者老闆吩咐你「給這個裝置寫個Linux
 驅動程式」？這篇文章的目的就是教會你達成這些目標的全部訣竅，它將描述你需
 要經過的流程以及給出如何同核心社群合作的一些提示。它還將試圖解釋核心社群
 為何這樣運作。
 
-Linux核心大部分是由C語言寫成的，一些體系結構相關的程式碼用到了組譯語言。要
+Linux核心大部分是由C語言寫成的，一些架構相關的程式碼用到了組譯語言。要
 參與核心開發，你必須精通C語言。除非你想為某個架構開發底層程式碼，否則你並
-不需要了解（任何體系結構的）組譯語言。下面列舉的書籍雖然不能替代紮實的C
+不需要了解（任何架構的）組譯語言。下面列舉的書籍雖然不能替代紮實的C
 語言教育和多年的開發經驗，但如果需要的話，做為參考還是不錯的：
 
  - "The C Programming Language" by Kernighan and Ritchie [Prentice Hall]
@@ -37,9 +37,9 @@ Linux核心大部分是由C語言寫成的，一些體系結構相關的程式
    《C語言參考手冊（原書第5版）》（邱仲潘 等譯）[機械工業出版社]
 
 Linux核心使用GNU C和GNU工具鏈開發。雖然它遵循ISO C11標準，但也用到了一些
-標準中沒有定義的擴展。核心是自給自足的C環境，不依賴於標準C庫的支援，所以
+標準中沒有定義的擴充。核心是自給自足的C環境，不依賴於標準C庫的支援，所以
 並不支援C標準中的部分定義。比如long long類型的大數除法和浮點運算就不允許
-使用。有時候確實很難弄清楚核心對工具鏈的要求和它所使用的擴展，不幸的是目
+使用。有時候確實很難弄清楚核心對工具鏈的要求和它所使用的擴充，不幸的是目
 前還沒有明確的參考資料可以解釋它們。請查閱gcc資訊頁（使用「info gcc」命令
 顯示）獲得一些這方面資訊。
 
@@ -52,14 +52,15 @@ Linux核心使用GNU C和GNU工具鏈開發。雖然它遵循ISO C11標準，但
 法律問題
 --------
 
-Linux核心原始碼都是在GPL（通用公共許可證）的保護下發布的。要了解這種許可
+Linux核心原始碼都是在GPL（通用公共授權條款）的保護下發布的。要了解這種許可
 的細節請查看原始碼主目錄下的COPYING檔案。Linux核心許可準則和如何使用
-`SPDX <https://spdx.org/>` 標誌符說明在這個文件中
+`SPDX <https://spdx.org/>`_ 標誌符說明在這個文件中
 :ref:`Documentation/translations/zh_TW/process/license-rules.rst <tw_kernel_licensing>`
 如果你對它還有更深入問題請聯繫律師，而不要在Linux核心郵件組上提問。因為
 郵件組裡的人並不是律師，不要期望他們的話有法律效力。
 
 對於GPL的常見問題和解答，請造訪以下連結：
+
 	https://www.gnu.org/licenses/gpl-faq.html
 
 
@@ -67,12 +68,13 @@ Linux核心原始碼都是在GPL（通用公共許可證）的保護下發布的
 ----
 
 Linux核心程式碼中包含有大量的文件。這些文件對於學習如何與核心社群互動有著
-不可估量的價值。當一個新的功能被加入核心，最好把解釋如何使用這個功能的文
-檔也放進核心。當核心的改動導致面向使用者空間的介面發生變化時，最好將相關信
-息或手冊頁(manpages)的補丁發到alx@kernel.org，以向手冊頁(manpages)
-的維護者解釋這些變化。
+不可估量的價值。當一個新的功能被加入核心，最好也一併加入說明如何使用這個
+功能的文件。當核心的改動導致核心向使用者空間提供的介面發生變化時，最好將
+相關資訊或手冊頁（manpages）的修補程式發送給手冊頁維護者 alx@kernel.org
+來說明這項變化，並副本（CC）給 linux-api@vger.kernel.org 郵件列表。
 
 以下是核心程式碼中需要閱讀的文件：
+
   :ref:`Documentation/admin-guide/README.rst <readme>`
     文件簡要介紹了Linux核心的背景，並且描述了如何設定和編譯核心。核心的
     新使用者應該從這裡開始。
@@ -88,7 +90,9 @@ Linux核心程式碼中包含有大量的文件。這些文件對於學習如何
 
   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
 
-    這兩份文件明確描述如何建立和發送補丁，其中包括（但不僅限於)：
+    這份文件明確詳細地描述如何成功建立和發送修補程式，其中包括（但不僅限
+    於）：
+
        - 郵件內容
        - 郵件格式
        - 選擇收件人
@@ -151,25 +155,25 @@ ReST格式的文件會產生在 Documentation/output. 目錄中。
 
 如何成為核心開發者
 ------------------
-如果你對Linux核心開發一無所知，你應該造訪「Linux核心新手」計劃：
+如果你對Linux核心開發一無所知，你應該造訪「Linux核心新手」計畫：
 
 	https://kernelnewbies.org
 
 它擁有一個可以問各種最基本的核心開發問題的郵件列表（在提問之前一定要記得
-查找已往的郵件，確認是否有人已經回答過相同的問題）。它還擁有一個可以獲得
-實時反饋的IRC聊天頻道，以及大量對於學習Linux核心開發相當有幫助的文件。
+搜尋以往的郵件，確認是否有人已經回答過相同的問題）。它還擁有一個可以獲得
+即時回饋的IRC聊天頻道，以及大量對於學習Linux核心開發相當有幫助的文件。
 
 網站簡要介紹了原始碼組織結構、子系統劃分以及目前正在進行的專案（包括核心
 中的和單獨維護的）。它還提供了一些基本的幫助資訊，比如如何編譯核心和打補丁
 。
 
 如果你想加入核心開發社群並協助完成一些任務，卻找不到從哪裡開始，可以造訪
-「Linux核心房管員」計劃：
+「Linux核心房管員」計畫：
 
 	https://kernelnewbies.org/KernelJanitors
 
 這是極佳的起點。它提供一個相對簡單的任務列表，列出核心程式碼中需要被重新
-整理或者改正的地方。透過和負責這個計劃的開發者們一同工作，你會學到將補丁
+整理或者改正的地方。透過和負責這個計畫的開發者們一同工作，你會學到將補丁
 整合進核心的基本原理。如果還沒有決定下一步要做什麼的話，你還可能會得到方
 向性的指點。
 
@@ -177,7 +181,7 @@ ReST格式的文件會產生在 Documentation/output. 目錄中。
 目的，沒什麼辦法比直接讀程式碼更有效了（大多數花招都會有相應的註解），而且
 一些特製的工具還可以提供幫助。例如，「Linux程式碼交叉引用」專案就是一個值得
 特別推薦的幫助工具，它將原始碼顯示在有編目和索引的網頁上。其中一個更新及
-時的核心源碼庫，可以透過以下地址造訪：
+時的核心原始碼庫，可以透過以下地址造訪：
 
         https://elixir.bootlin.com/
 
@@ -188,29 +192,30 @@ ReST格式的文件會產生在 Documentation/output. 目錄中。
 目前Linux核心開發流程包括幾個「主核心分支」和很多子系統相關的核心分支。這
 些分支包括：
 
-  - Linus 的核心源碼樹
+  - Linus 的核心原始碼樹
   - 多個主要版本的穩定版核心樹
   - 子系統相關的核心樹
   - linux-next 整合測試樹
 
 
 主線樹
-------
-主線樹是由Linus Torvalds 維護的。你可以在https://kernel.org 網站或者程式碼
-庫中下找到它。它的開發遵循以下步驟：
-
-  - 每當一個新版本的核心被發布，為期兩周的整合視窗將被開啟。在這段時間裡
-    維護者可以向Linus提交大段的修改，通常這些修改已經被放到-mm核心中幾個
-    星期了。提交大量修改的首選方式是使用git工具（核心的程式碼版本管理工具
-    ，更多的資訊可以在 https://git-scm.com/ 獲取），不過使用普通補丁也是
-    可以的。
-  - 兩個星期以後-rc1版本核心發布。之後只有不包含可能影響整個核心穩定性的
-    新功能的補丁才可能被接受。請注意一個全新的驅動程式（或者檔案系統）有
-    可能在-rc1後被接受是因為這樣的修改完全獨立，不會影響其他的程式碼，所以
-    沒有造成核心退步的風險。在-rc1以後也可以用git向Linus提交補丁，不過所
-    有的補丁需要同時被發送到相應的公衆郵件列表以徵詢意見。
-  - 當Linus認為當前的git源碼樹已經達到一個合理健全的狀態足以發布供人測試
-    時，一個新的-rc版本就會被發布。計劃是每周都發布新的-rc版本。
+~~~~~~
+
+主線樹是由 Linus Torvalds 維護的，可以在 https://kernel.org 或儲存庫中找到。
+它的開發遵循以下步驟：
+
+  - 每當一個新版本的核心發布後，就會開啟為期兩週的視窗。在這段期間，維護
+    者可以向 Linus 提交大量的修改，通常是已經在 linux-next 中放了幾個星期的
+    修補程式。提交大量修改的首選方式是使用 git（核心的原始碼管理工具，更多
+    資訊可以在 https://git-scm.com/ 找到），不過使用普通的修補程式也完全可以。
+  - 兩週後 -rc1 版核心發布，此時的重點是讓新核心盡可能穩固。這個階段的大
+    多數修補程式應該是修正迴歸（regression）。一直存在的 bug 不算迴歸，所以
+    只有在這類修正很重要時才推送。請注意，一個全新的驅動程式（或檔案系統）
+    可能在 -rc1 之後被接受，因為只要這樣的修改是獨立的、不影響新增程式碼以
+    外的區域，就沒有造成迴歸的風險。-rc1 發布後也可以用 git 向 Linus 發送
+    修補程式，不過這些修補程式也需要發送到公開的郵件列表以供審查。
+  - 當Linus認為目前的git原始碼樹已經達到一個合理健全的狀態足以發布供人測
+    試時，一個新的-rc版本就會被發布。目標是每週都發布新的-rc版本。
   - 這個過程一直持續下去直到核心被認為達到足夠穩定的狀態，持續時間大概是
     6個星期。
 
@@ -218,26 +223,44 @@ ReST格式的文件會產生在 Documentation/output. 目錄中。
 	「沒有人知道新核心何時會被發布，因為發布是根據已知bug的情況來決定
 	的，而不是根據一個事先制定好的時間表。」
 
+多個主要版本的穩定版核心樹
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+版本號由三個部分組成的核心是 -stable 核心。它們包含相對較小且至關重要的修
+正，針對在某個主線主要版本中發現的安全性問題或嚴重迴歸。同一個主要穩定版
+系列的每次發布都會遞增版本號的第三個部分，前兩個部分則保持不變。
+
+這種版本的核心適用於那些期望獲得最新的穩定版核心並且不想參與測試開發版或
+者實驗版的使用者。
+
+穩定版核心樹由「穩定版」小組（<stable@vger.kernel.org>）維護，並視需要發布。
+一般的發布週期大約是兩週，但如果沒有急迫的問題，也可能更久。相反地，與安全
+相關的問題可能會讓新版本幾乎立即發布。
+
+核心原始碼中的
+:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
+文件具體描述了可被穩定版核心接受的修改類型以及發布的流程。
+
 子系統特定樹
-------------
+~~~~~~~~~~~~
 
 各種核心子系統的維護者——以及許多核心子系統開發人員——在原始碼庫中公開了他們
-當前的開發狀態。這樣，其他人就可以看到核心的不同區域發生了什麼。在開發速度
+目前的開發狀態。這樣，其他人就可以看到核心的不同區域發生了什麼。在開發速度
 很快的領域，可能會要求開發人員將提交的內容建立在這樣的子系統核心樹上，這樣
 就避免了提交與其他已經進行的工作之間的衝突。
 
 這些儲存庫中的大多數都是Git樹，但是也有其他的scm在使用，或者補丁佇列被發布
 為Quilt系列。這些子系統儲存庫的地址列在MAINTAINERS檔案中。其中許多可以在
-https://git.kernel.org/上瀏覽。
+https://git.kernel.org/ 上瀏覽。
 
-在將一個建議的補丁提交到這樣的子系統樹之前，需要對它進行審查，審查主要發生
-在郵件列表上（請參見下面相應的部分）。對於幾個核心子系統，這個審查過程是通
-過工具補丁追蹤的。Patchwork提供了一個Web介面，顯示補丁發布、對補丁的任何評
-論或修訂，維護人員可以將補丁標記為正在審查、接受或拒絕。大多數補丁網站都列
-在 https://patchwork.kernel.org/
+在一個提議的修補程式被提交到這樣的子系統樹之前，需要先經過審查，審查主要
+在郵件列表上進行（請參見下面相應的章節）。有幾個核心子系統會使用 patchwork
+工具來追蹤這個審查過程。Patchwork 提供一個網頁介面，顯示發布的修補程式、
+對修補程式的任何評論或修訂，維護者也可以將修補程式標記為正在審查、已接受
+或已拒絕。大多數 patchwork 網站都列在 https://patchwork.kernel.org/ 。
 
-Linux-next 整合測試樹
----------------------
+linux-next 整合測試樹
+~~~~~~~~~~~~~~~~~~~~~
 
 在將子系統樹的更新合併到主線樹之前，需要對它們進行整合測試。為此，存在一個
 特殊的測試儲存庫，其中幾乎每天都會提取所有子系統樹：
@@ -247,36 +270,16 @@ Linux-next 整合測試樹
 透過這種方式，Linux-next 對下一個合併階段將進入主線核心的內容給出了一個概要
 展望。非常歡迎冒險的測試者對linux-next進行執行時測試。
 
-多個主要版本的穩定版核心樹
------------------------------------
-由3個數字組成的核心版本號說明此核心是-stable版本。它們包含核心的相對較小且
-至關重要的修補，這些修補針對安全性問題或者嚴重的核心退步。
-
-這種版本的核心適用於那些期望獲得最新的穩定版核心並且不想參與測試開發版或
-者實驗版的使用者。
-
-穩定版核心樹版本由「穩定版」小組（郵件地址<stable@vger.kernel.org>）維護，一般
-隔周發布新版本。
-
-核心源碼中的
-:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
-文件具體描述了可被穩定版核心接受的修改類型以及發布的流程。
-
 
 報告bug
 -------
 
-bugzilla.kernel.org是Linux核心開發者們用來追蹤核心Bug的網站。我們鼓勵用
-戶在這個工具中報告找到的所有bug。如何使用核心bugzilla的細節請造訪：
-
-	http://test.kernel.org/bugzilla/faq.html
+核心原始碼主目錄中的 Documentation/admin-guide/reporting-issues.rst 文件
+描述了如何報告可能的核心 bug，並詳細說明核心開發者需要哪些資訊來幫助追查
+問題。
 
-核心源碼主目錄中的:ref:`admin-guide/reporting-bugs.rst <reportingbugs>`
-文件裡有一個很好的模板。它指導使用者如何報告可能的核心bug以及需要提供哪些資訊
-來幫助核心開發者們找到問題的根源。
 
-
-利用bug報告
+處理bug報告
 -----------
 
 練習核心開發技能的最好辦法就是修改其他人報告的bug。你不光可以幫助核心變
@@ -284,7 +287,11 @@ bugzilla.kernel.org是Linux核心開發者們用來追蹤核心Bug的網站。
 者感受到你的存在。修改bug是贏得其他開發者讚譽的最好辦法，因為並不是很多
 人都喜歡浪費時間去修改別人報告的bug。
 
-要嘗試修改已知的bug，請造訪 http://bugzilla.kernel.org 網址。
+要處理已經回報的 bug，請先找到一個你感興趣的子系統。查看 MAINTAINERS 檔案
+中該子系統的 bug 要回報到哪裡；通常是郵件列表，很少是 bug 追蹤系統。在該處
+的存檔中搜尋最近的報告，並在你認為合適的地方提供幫助。你也可以到
+https://bugzilla.kernel.org 查看 bug 報告；只有少數核心子系統會積極使用它來
+回報或追蹤問題，不過整個核心的 bug 都會被提交到那裡。
 
 
 郵件列表
@@ -310,8 +317,8 @@ MAINTAINERS檔案中可以找到不同話題對應的郵件列表。
 
 	https://subspace.kernel.org
 
-在使用這些郵件列表時，請記住保持良好的行為習慣。下面的連結提供了與這些列
-表（或任何其它郵件列表）交流的一些簡單規則，雖然內容有點濫竽充數。
+在使用這些郵件列表時，請記住保持良好的行為習慣。下面的連結雖然有點老套，
+但提供了與這些列表（或任何其他郵件列表）交流的一些簡單規則：
 
 	https://subspace.kernel.org/etiquette.html
 
@@ -337,8 +344,8 @@ MAINTAINERS檔案中可以找到不同話題對應的郵件列表。
 同核心社群合作
 ----------------
 
-核心社群的目標就是提供盡善盡美的核心。所以當你提交補丁期望被接受進核心的
-時候，它的技術價值以及其他方面都將被評審。那麼你可能會得到什麼呢？
+核心社群的目標就是提供盡善盡美的核心。所以當你提交修補程式期望被接受進核
+心的時候，它只會依據技術價值接受評審。那麼你可能會得到什麼呢？
 
   - 批評
   - 評論
@@ -377,7 +384,7 @@ MAINTAINERS檔案中可以找到不同話題對應的郵件列表。
     - 它同時解決了多個問題
     - 它刪除了2000行程式碼
     - 這是補丁，它已經解釋了我想要說明的
-    - 我在5種不同的體系結構上測試過它……
+    - 我在5種不同的架構上測試過它……
     - 這是一系列小補丁用來……
     - 這個修改提高了普通機器的效能……
 
@@ -388,6 +395,7 @@ MAINTAINERS檔案中可以找到不同話題對應的郵件列表。
     - 為了我們公司賺錢考慮必須這麼做
     - 這是我們的企業產品線所需要的
     - 這裡是描述我觀點的1000頁設計文件
+    - 我已經在這上面花了 6 個月……
     - 這是一個5000行的補丁用來……
     - 我重寫了現在亂七八糟的程式碼，這就是……
     - 我被規定了最後期限，所以這個補丁需要立刻被接受
@@ -395,7 +403,7 @@ MAINTAINERS檔案中可以找到不同話題對應的郵件列表。
 另外一個核心社群與大部分傳統公司的軟體開發隊伍不同的地方是無法面對面地交
 流。使用電子郵件和IRC聊天工具做為主要溝通工具的一個好處是性別和種族歧視
 將會更少。Linux核心的工作環境更能接受婦女和少數族羣，因為每個人在別人眼
-里只是一個郵件地址。國際化也幫助了公平的實作，因為你無法透過姓名來判斷人
+裡只是一個郵件地址。國際化也幫助了公平的實作，因為你無法透過姓名來判斷人
 的性別。男人有可能叫李麗，女人也有可能叫王剛。大多數在Linux核心上工作過
 並表達過看法的女性對在linux上工作的經歷都給出了正面的評價。
 
@@ -409,7 +417,7 @@ MAINTAINERS檔案中可以找到不同話題對應的郵件列表。
 
 Linux核心社群並不喜歡一下接收大段的程式碼。修改需要被恰當地介紹、討論並且
 拆分成獨立的小段。這幾乎完全和公司中的習慣背道而馳。你的想法應該在開發最
-開始的階段就讓大家知道，這樣你就可以及時獲得對你正在進行的開發的反饋。這
+開始的階段就讓大家知道，這樣你就可以及時獲得對你正在進行的開發的回饋。這
 樣也會讓社群覺得你是在和他們協作，而不是僅僅把他們當作傾銷新功能的物件。
 無論如何，你不要一次性地向郵件列表發送50封信，你的補丁序列應該永遠用不到
 這麼多。
@@ -423,19 +431,19 @@ Linux核心社群並不喜歡一下接收大段的程式碼。修改需要被恰
    當出了問題的時候，小的補丁也會讓除錯變得非常容易。一個一個補丁地回溯
    將會比仔細剖析一個被打上的大補丁（這個補丁破壞了其他東西）容易得多。
 
-2）不光發送小的補丁很重要，在提交之前重新編排、化簡（或者僅僅重新排列）
-   補丁也是很重要的。
+2) 不光發送小的修補程式很重要，在提交之前重新編排、化簡（或者僅僅重新排
+   列）修補程式也是很重要的。
 
 這裡有核心開發者Al Viro打的一個比方：
 	「想像一個老師正在給學生批改數學作業。老師並不希望看到學生為了得
-	到正確解法所進行的嘗試和產生的錯誤。他希望看到的是最乾淨最優雅的
-	解答。好學生了解這點，絕不會把最終解決之前的中間方案提交上去。」
+        到正確解法所進行的嘗試和產生的錯誤。老師希望看到的是最乾淨最優雅的
+        解答。好學生了解這點，絕不會把最終解決之前的中間方案提交上去。
 
 	核心開發也是這樣。維護者和評審者不希望看到一個人在解決問題時的思
-	考過程。他們只希望看到簡單和優雅的解決方案。
+        考過程。他們只希望看到簡單和優雅的解決方案。」
 
 直接給出一流的解決方案，和社群一起協作討論尚未完成的工作，這兩者之間似乎
-很難找到一個平衡點。所以最好儘早開始收集有利於你進行改進的反饋；同時也要
+很難找到一個平衡點。所以最好儘早開始收集有利於你進行改進的回饋；同時也要
 保證修改分成很多小塊，這樣在整個專案都準備好被包含進核心之前，其中的一部
 分可能會先被接收。
 
@@ -471,10 +479,10 @@ Linux核心社群並不喜歡一下接收大段的程式碼。修改需要被恰
 很多人已經做到了，而他們都曾經和現在的你站在同樣的起點上。
 
 
-感謝
-----
-感謝Paolo Ciarrocchi允許「開發流程」部分基於他所寫的文章
-(http://www.kerneltravel.net/newbie/2.6-development_process)，感謝Randy
+----------
+
+感謝 Paolo Ciarrocchi 允許「開發流程」部分基於他所寫的文章
+（https://lwn.net/Articles/94386/ ），感謝Randy
 Dunlap和Gerrit Huizenga完善了應該說和不該說的列表。感謝Pat Mochel, Hanna
 Linder, Randy Dunlap, Kay Sievers, Vojtech Pavlik, Jan Kara, Josh Boyer,
 Kees Cook, Andrew Morton, Andi Kleen, Vadim Lobanov, Jesper Juhl, Adrian
-- 
2.43.0

