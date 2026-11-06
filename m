Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964775;
	b=TalyvqRWeFE623BT6M3uOSDGg6BlyoCkrsfIA1w7a0uN8LsmKfrAUWZxe7c3+vdAhZ5Y
	 iOhIXWgG7YlUesQk1i/YkPOfonMbVXdiPwKDvml4HDBQNBOydidy/lLgUiUfvgmdxQPql
	 U9YVHNkafa46Y86E3Cu7J/om7HyzBlD4Uuvc8FxnJ1J9sNRl/qCo2G2hJjT2z2p9pCaLZ
	 inUqp6+/aRxd9RoEy8Bs62BuvTVk0byLSM6YmprTZh+Ox3L/99u4YXb6BdFJ0w0LLmsjN
	 Icj5u7bs6WspyhSNTR7mB4CeAZRXcuiJ5j5NfG8MQw//7tEBEzsaXWvyq3UKSe1oEFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OTbm/Ps+3ciyKW3mfs97e9UO4ngoC6DP/HzUbO98aVU=;
	b=a8laYm4IUXobwo3O8ufxg0Wk3sBQEDyFsFsVe4hVFxn7V0zPwvJOZGbnZslKbf3sIMyl
	 eLw6e5w4amKxnAPCDXwcBx/n4SZbDQHz62QnExfh+1Ch+kk33R2USHkNimVTayJBMnGhU
	 a3Gv+IAB/YUnIqJ0AsgQsWUrPo8tywp1ZHz+vdeOKMyCl//L6SzBbmJVLHEHQMjKFtNZA
	 fTgv0U67bYxzsJeDs0Lb0Lwiex9EIf+xZxROf0RbV3qciSEhBr7rwdHQPn0rlEpIQqATl
	 ToWaGmbAcw1yYa5OzVtmISzGOpAILz2VBey5KfGyG2i9m8gu7Xzw9AAHkuxsRMRawvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnWl+hoa;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58127606C7FB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58127606C7FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnWl+hoa
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso87796a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964774; x=1794569574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OTbm/Ps+3ciyKW3mfs97e9UO4ngoC6DP/HzUbO98aVU=;
        b=hnWl+hoaK4bUwO4EkwqzWxFZRwBVBpK/YAiLR+/cMgmhSQlYAigGVtZpCoP921p/mQ
         KUg3i4gcU2aTN/NMZlNAdgdTe1Uis57VTSQO0vdx/bdis9O2EAR9mOWuX58ko7xWxON5
         tgi04iV+whD/wbTqSDiim0XA6XFc4Mn1YMVn2Y45zTE7PUOOqpdBAS7ZLwo3iwazFGN8
         VViNySPyJfY/AXERaJ0sRnyDcnWQbLSgxQvLCBH6nemejgFkUMAnSyhTJ4WX0SpX2xZB
         wQY1/LnR1QB3SLlE2Gukums8DDsPC2YeIoeNqkmAzMxF4a6U/ZR1H9zrBOZjDBJ0FkqV
         bqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964774; x=1794569574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTbm/Ps+3ciyKW3mfs97e9UO4ngoC6DP/HzUbO98aVU=;
        b=Ni8G9OSR7zqYa1DOlmnZQD//QlkWCSDL0YwkjXEAuTCFgt1QRZPvYb8+lz6EnwgxET
         wpWoLvlipphzINFKNPM9WOWunbM90bum2dV0FxnCR1OMAVAOeyrA1+w70mnz+ZFxTBrf
         n1q5o6Kcrf59sLAkJnNcZbyHGzU3O2yLf2f2BXvi6eqLyqDeddK9ri8UwfuhoB3hu6i1
         KRFaLNCZJfqRzcMn2MWQX9qTsME8MZfQ6Vj3Uvqp7XCRBt/dVvd6lVtfpAyZefxpg73O
         xa6c9DoOyfqG/MYykIeO2FMDdB4w32NMI9REoLGAe3HlC1pOOpRd6lGtY3FX7Ax4J3SV
         tpew==
X-Forwarded-Encrypted: i=1; AL+hErExLuxxRxkEOv/waf0WDTDY4Y+yT/kMlzBtrKweLHFr2c9lDIKfemFe/AU5xy6Nf6WZz/3ZGpKkBf74w08=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qEURZP7dXMRF9KowcjF/PWFyWmampqw3YYcYpAijrtHavEuH7
	r8lniCgjfwjEsxPXmuzauB4nG2JjkovNTyhx6KYf9XaULL+h8gROgk3FAjR39bVa
X-Gm-Gg: AYBFou0QHyo6TA92fwpb8sLewfRLrcHVafVH18jFsq/IkAzIn2u9SSD4q/oQ+89LiHi
	U7znEkMlZFUmuObCC2gkar5p6QE3UoByrx5OYVa77iHHIsS9iwFACshe1pYnBSB6s3iAogUF75M
	OmS6Je2akc+oOaecica9OT1gYf/NyJj+fl7++bP6sBAb3LsYQ+QXGVQpWJ1AiVKJNEANGKV1Qzu
	liBxzCrxrYENnYPMl+ImzGiO1wAqRolHSJMJeLbWt005xDvjYhqbuiLphsX9CwYkUV3b+9DgGx3
	r41AN341uTngXVlr0OTb9g8u4xnTW2dJBliKnfh1foOvsYXcI3gwjl69sgCsUOMwbDjaVpaC9mB
	7Y5PWsYrpo1n+IukCb2F5+de/iFy6HDNvv4+Bvj5r7EcN5N4B1/NaCRnANXKo8THYVJHRguWAwq
	c5zpXQtxrgPB4xjU8mSpI3fnB7ojsrU09FYGvi4q2819qOZ1x3Hvk5edLcfLs8orx3TBPYiNXTm
	+YWcrAVcFJyu1rYFJbWxEorOuQLAP3Z9IFuxAHT8Dpjbf4eW1qxcZxan+vVAxKci8KPpFArBS9z
	HaOPqZsyciwbLRMPhm8kLjmABfxJqFXGGPeyXEySesF89bXjkova5CcmIKxcSbgatgLjM7XQcK1
	yh8VPaT6dfMuxpFcLu9Us3MzT
X-Received: by 2002:a17:90b:3b42:b0:3a7:fef3:8561 with SMTP id 98e67ed59e1d1-3b0db6f44efmr3141618a91.5.1793964772947;
        Fri, 06 Nov 2026 03:32:52 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:52 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 19/25] docs/zh_TW: process: sync coding-style.rst with the English original
Date: Fri,  6 Nov 2026 19:31:34 +0800
Message-ID: <20261106113142.706783-20-chenyou910331@gmail.com>
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
commit 323fa4b9608b ("Documentation: Fix syntax of kmalloc_objs example
in coding style doc")", but that commit only touched the memory
allocation examples.  A comparison against the current English text
shows the rest of the file never picked up a number of earlier changes:

- add the loop braces example from
  commit 1dbba2cf30c9 ("Documentation/CodingStyle: Add an example for
  braces")
- add the 80-column wording from
  commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column
  warning") and drop the old "strongly preferred" sentence
- add the boilerplate kernel-doc paragraph from
  commit e5880f95a979 ("docs: process: discourage pointless boilerplate
  kdoc") and use the doc_guide reference and tools/docs/kernel-doc as in
  the original
- drop the net/ comment style removed by commit 82b8000c28b5 ("net: drop
  special comment style")
- add the EditorConfig paragraph from commit 5a602de99797 ("Add
  .editorconfig file for basic formatting") and the clangformat
  reference from commit e3b10a02ca2f ("Docs: Move clang-format from
  process/ to dev-tools/")
- add the function-like macro guidance from
  commit 6813216bbdba ("Documentation: coding-style: ask function-like
  macros to evaluate parameters")
- use <linux/dev_printk.h> as in commit c04639a7d2fb ("coding-style.rst:
  trivial: fix location of driver model macros") and add the dev_dbg
  guidance from commit 5c7944ca7b13 ("coding-style: Add guidance to
  prefer dev_dbg")
- point to array_size.h, stddef.h and minmax.h instead of kernel.h as in
  commit 197bbebd2581 ("docs: Update documentation to avoid mentioning
  of kernel.h")
- translate section 22 "Do not crash the kernel" from
  commit 1cfd9d7e43d5 ("coding-style.rst: document BUG() and WARN()
  rules ("do not crash the kernel")")")
- use the talk title "Kernel CodingStyle" from
  commit 775a445d9a63 ("coding-style: fix title of Greg K-H's talk")
- remove a duplicated overflow sentence in section 14, link
  memory-allocation.rst through its label instead of the zh_CN path,
  and render "zeroed array" correctly
- retranslate sentences whose meaning had drifted: the "deliberately
  broken" example, the trailing whitespace and patch series note,
  accessor functions, dev_dbg()/VERBOSE_DEBUG, the inline maintenance
  trade-off and the "!!" construction for bool
- restore the English inline literals (double-indenting, help
  readability, one err bugs, classes, ...) and the English convention
  block in section 16, each followed by a Chinese rendering
- fix cntusr(), GW-BASIC and Dennis M. Ritchie
- localize terminology (屏幕→螢幕, 嵌套→巢狀, 操作符→運算子, 補丁→修補程式,
  協議→協定, 設備→裝置, 分配→配置, 優先級→優先順序, 體系結構→架構, ...)

update to commit 323fa4b9608b ("Documentation: Fix syntax of
kmalloc_objs example in coding style doc")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/coding-style.rst            | 286 +++++++++++-------
 1 file changed, 185 insertions(+), 101 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index 5778b707503f..c900506a17d3 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -27,17 +27,17 @@ Linux 核心程式碼風格
 2！) 字元深，這幾乎相當於嘗試將圓周率的值定義為 3。
 
 理由：縮排的全部意義就在於清楚的定義一個控制塊起止於何處。尤其是當你盯著你的
-屏幕連續看了 20 小時之後，你將會發現大一點的縮排會使你更容易分辨縮排。
+螢幕連續看了 20 小時之後，你將會發現大一點的縮排會使你更容易分辨縮排。
 
 現在，有些人會抱怨 8 個字元的縮排會使程式碼向右邊移動的太遠，在 80 個字元
-的終端屏幕上就很難讀這樣的程式碼。這個問題的答案是，如果你需要 3 級以上的
-縮排，不管用何種方式你的程式碼已經有問題了，應該修正你的程式。
+的終端機螢幕上就很難讀這樣的程式碼。這個問題的答案是，如果你需要 3 級以上
+的縮排，不管用何種方式你的程式碼已經有問題了，應該修正你的程式。
 
-簡而言之，8 個字元的縮排可以讓程式碼更容易閱讀，還有一個好處是當你的函式嵌套太
+簡而言之，8 個字元的縮排可以讓程式碼更容易閱讀，還有一個好處是當你的函式巢狀太
 深的時候可以給你警告。留心這個警告。
 
 在 switch 語句中消除多級縮排的首選的方式是讓 ``switch`` 和從屬於它的 ``case``
-標籤對齊於同一列，而不要 ``兩次縮排`` ``case`` 標籤。比如：
+標籤對齊於同一列，而不要把 ``case`` 標籤 ``double-indenting`` (兩次縮排)。比如：
 
 .. code-block:: c
 
@@ -84,8 +84,7 @@ Linux 核心程式碼風格
 也不要在一行裡放多個賦值語句。核心程式碼風格超級簡單。就是避免可能導致別人誤讀
 的表達式。
 
-除了註解、文件和 Kconfig 之外，不要使用空格來縮排，前面的例子是例外，是有意為
-之。
+除了註解、文件和 Kconfig 之外，絕不使用空格來縮排，前面的例子是故意寫錯的。
 
 選用一個好的編輯器，不要在行尾留空格。
 
@@ -95,7 +94,7 @@ Linux 核心程式碼風格
 
 程式碼風格的意義就在於使用平常使用的工具來維持程式碼的可讀性和可維護性。
 
-每一行的長度的限制是 80 列，我們強烈建議您遵守這個慣例。
+單行長度的首選上限是 80 列。
 
 長於 80 列的語句要打散成有意義的片段。除非超過 80 列能顯著增加可讀性，並且不
 會隱藏資訊。
@@ -148,7 +147,7 @@ C 語言風格中另外一個常見問題是大括號的放置。和縮排大小
 
 全世界的異端可能會抱怨這個不一致性是……呃……不一致，不過所有思維健全的人
 都知道 (a) K&R 是 **正確的** 並且 (b) K&R 是正確的。此外，不管怎樣函式都是特
-殊的 (C 函式是不能嵌套的)。
+殊的 (C 函式是不能巢狀定義的)。
 
 注意結束大括號獨自佔據一行，除非它後面跟著同一個語句的剩餘部分，也就是 do 語
 句中的 ``while`` 或者 if 語句中的 ``else`` ，像這樣：
@@ -174,8 +173,8 @@ C 語言風格中另外一個常見問題是大括號的放置。和縮排大小
 理由：K&R。
 
 也請注意這種大括號的放置方式也能使空 (或者差不多空的) 行的數量最小化，同時不
-失可讀性。因此，由於你的屏幕上的新行是不可再生資源 (想想 25 行的終端屏幕)，你
-將會有更多的空行來放置註解。
+失可讀性。因此，由於你的螢幕上的新行是不可再生資源 (想想 25 行的終端機螢幕)，
+你將會有更多的空行來放置註解。
 
 當只有一個單獨的語句的時候，不用加不必要的大括號。
 
@@ -204,6 +203,15 @@ C 語言風格中另外一個常見問題是大括號的放置。和縮排大小
 		otherwise();
 	}
 
+此外，當迴圈內含有不只一個簡單語句時，也要使用大括號：
+
+.. code-block:: c
+
+	while (condition) {
+		if (test)
+			do_something();
+	}
+
 3.1) 空格
 *********
 
@@ -239,32 +247,32 @@ Linux 核心的空格使用方式 (主要) 取決於它是用於函式還是關
 	unsigned long long memparse(char *ptr, char **retptr);
 	char *match_strdup(substring_t *s);
 
-在大多數二元和三元操作符兩側使用一個空格，例如下面所有這些操作符::
+在大多數二元和三元運算子兩側使用一個空格，例如下面所有這些運算子::
 
 	=  +  -  <  >  *  /  %  |  &  ^  <=  >=  ==  !=  ?  :
 
-但是一元操作符後不要加空格::
+但是一元運算子後不要加空格::
 
 	&  *  +  -  ~  !  sizeof  typeof  alignof  __attribute__  defined
 
-後綴自加和自減一元操作符前不加空格::
+後置遞增和遞減一元運算子前不加空格::
 
 	++  --
 
-前綴自加和自減一元操作符後不加空格::
+前置遞增和遞減一元運算子後不加空格::
 
 	++  --
 
-``.`` 和 ``->`` 結構體成員操作符前後不加空格。
+``.`` 和 ``->`` 結構體成員運算子前後不加空格。
 
-不要在行尾留空白。有些可以自動縮排的編輯器會在新行的行首加入適量的空白，然
-後你就可以直接在那一行輸入程式碼。不過假如你最後沒有在那一行輸入程式碼，有
-些編輯器就不會移除已經加入的空白，就像你故意留下一個只有空白的行。包含行尾
-空白的行就這樣產生了。
+不要在行尾留空白。有些具備 ``smart`` 縮排功能的編輯器會在新行的行首加入適量
+的空白，然後你就可以直接在那一行輸入程式碼。不過假如你最後沒有在那一行輸入
+程式碼，有些編輯器就不會移除已經加入的空白，就像你故意留下一個只有空白的行。
+包含行尾空白的行就這樣產生了。
 
-當 git 發現補丁包含了行尾空白的時候會警告你，並且可以應你的要求去掉行尾空白；
-不過如果你是正在打一系列補丁，這樣做會導致後面的補丁失敗，因為你改變了補丁的
-上下文。
+當 Git 發現修補程式引入了行尾空白時會警告你，並且可以應你的要求去掉行尾空白；
+不過如果你正在套用一系列修補程式，這樣做可能會改變它們的上下文行，導致該系列
+中後面的修補程式套用失敗。
 
 
 4) 命名
@@ -279,7 +287,7 @@ C 程式員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
 
 全域變數 (只有當你 **真正** 需要它們的時候再用它) 需要有一個具描述性的名字，就
 像全域函式。如果你有一個可以計算活動使用者數量的函式，你應該叫它
-``count_active_users()`` 或者類似的名字，你不應該叫它 ``cntuser()`` 。
+``count_active_users()`` 或者類似的名字，你不應該叫它 ``cntusr()`` 。
 
 在函式名中包含函式類型 (所謂的匈牙利命名法) 是腦子出了問題——編譯器知道那些類
 型而且能夠檢查那些類型，這樣做只能把程式員弄糊塗了。
@@ -306,7 +314,7 @@ C 程式員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
     'blocklist/passlist'
 
 引入新用法的例外情況是：維護使用者空間ABI/API，或更新現有（截至2020年）硬體或
-協議規範的程式碼時要求這些術語。對於新規範，儘可能將術語的規範用法轉換為核心
+協定規範的程式碼時要求這些術語。對於新規範，儘可能將術語的規範用法轉換為核心
 編碼標準。
 
 .. warning::
@@ -333,7 +341,8 @@ C 程式員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
 
 你就知道 ``a`` 是什麼了。
 
-很多人認為 typedef ``能提高可讀性`` 。實際不是這樣的。它們只在下列情況下有用：
+很多人認為 typedef ``help readability`` (能提高可讀性)。實際不是這樣的。它們只
+在下列情況下有用：
 
  (a) 完全不透明的物件 (這種情況下要主動使用 typedef 來 **隱藏** 這個物件實際上
      是什麼)。
@@ -342,8 +351,9 @@ C 程式員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
 
      .. note::
 
-       不透明性和“存取函式”本身是不好的。我們使用 pte_t 等類型的原因在於真
-       的是完全沒有任何共用的可存取資訊。
+       不透明性和 ``accessor functions`` (存取函式) 本身並不是好東西。我們對
+       pte_t 等類型使用它們的原因在於，那裡真的是完全 **沒有** 任何可移植的可存
+       取資訊。
 
  (b) 清楚的整數類型，如此，這層抽象就可以 **幫助** 消除到底是 ``int`` 還是
      ``long`` 的混淆。
@@ -370,8 +380,8 @@ C 程式員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
      因此，Linux 特有的等同於標準類型的 ``u8/u16/u32/u64`` 類型和它們的有符號
      類型是被允許的——儘管在你自己的新程式碼中，它們不是強制要求要使用的。
 
-     當編輯已經使用了某個類型集的已有程式碼時，你應該遵循那些程式碼中已經做出的選
-     擇。
+     當編輯已經使用了某個類型集的已有程式碼時，你應該遵循那些程式碼中已經做出
+     的選擇。
 
  (e) 可以在使用者空間安全使用的類型。
 
@@ -390,7 +400,7 @@ C 程式員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
 -------
 
 函式應該簡短而漂亮，並且只完成一件事情。函式應該可以一屏或者兩屏顯示完 (我們
-都知道 ISO/ANSI 屏幕大小是 80x24)，只做一件事情，而且把它做好。
+都知道 ISO/ANSI 螢幕大小是 80x24)，只做一件事情，而且把它做好。
 
 一個函式的最大長度是和該函式的複雜度和縮排級數成反比的。所以，如果你有一個理
 論上很簡單的只有一個很長 (但是簡單) 的 case 語句的函式，而且你需要在每個 case
@@ -467,13 +477,13 @@ Linux 裡這是提倡的做法，因為這樣可以很簡單的給讀者提供
 
 選擇一個能夠說明 goto 行為或它為何存在的標籤名。如果 goto 要釋放 ``buffer``,
 一個不錯的名字可以是 ``out_free_buffer:`` 。別去使用像 ``err1:`` 和 ``err2:``
-這樣的GW_BASIC 名稱，因為一旦你添加或刪除了 (函式的) 退出路徑，你就必須對它們
+這樣的 GW-BASIC 名稱，因為一旦你添加或刪除了 (函式的) 退出路徑，你就必須對它們
 重新編號，這樣會難以去檢驗正確性。
 
 使用 goto 的理由是：
 
 - 無條件語句容易理解和追蹤
-- 嵌套程度減小
+- 巢狀層數減少
 - 可以避免由於修改時忘記更新個別的退出點而導致錯誤
 - 讓編譯器省去刪除冗餘程式碼的工作 ;)
 
@@ -501,7 +511,8 @@ Linux 裡這是提倡的做法，因為這樣可以很簡單的給讀者提供
 		return result;
 	}
 
-一個需要注意的常見錯誤是 ``單 err 錯誤`` ，就像這樣：
+一個需要注意的常見錯誤是 ``one err bugs`` (只用一個 err 標籤造成的錯誤)，就像
+這樣：
 
 .. code-block:: c
 
@@ -537,8 +548,9 @@ Linux 裡這是提倡的做法，因為這樣可以很簡單的給讀者提供
 也可以加上它做這些事情的原因。
 
 當註解核心 API 函式時，請使用 kernel-doc 格式。詳見
-Documentation/translations/zh_CN/doc-guide/index.rst 和
-tools/docs/kernel-doc 。
+:ref:`Documentation/doc-guide/ <doc_guide>` 裡的檔案和
+``tools/docs/kernel-doc``。請注意，過度註解的危險同樣適用於 kernel-doc 註解。
+不要加入只是重複函式簽名中顯而易見的資訊的樣板 kernel-doc。
 
 長 (多行) 註解的首選風格是：
 
@@ -553,17 +565,6 @@ tools/docs/kernel-doc 。
 	 * with beginning and ending almost-blank lines.
 	 */
 
-對於在 net/ 和 drivers/net/ 的檔案，首選的長 (多行) 註解風格有些不同。
-
-.. code-block:: c
-
-	/* The preferred comment style for files in net/ and drivers/net
-	 * looks like this.
-	 *
-	 * It is nearly the same as the generally preferred comment style,
-	 * but there is no initial almost-blank line.
-	 */
-
 註解資料也是很重要的，不管是基本類型還是衍生類型。為了方便實作這一點，每一行
 應只宣告一個資料 (不要使用逗號來一次宣告多個資料)。這樣你就有空間來為每個資料
 寫一段小註解來解釋它們的用途了。
@@ -572,7 +573,7 @@ tools/docs/kernel-doc 。
 9) 你已經把事情弄糟了
 ---------------------
 
-這沒什麼，我們都是這樣。可能你長期使用 Unix 的朋友已經告訴你``GNU emacs``
+這沒什麼，我們都是這樣。可能你長期使用 Unix 的朋友已經告訴你 ``GNU emacs``
 能自動幫你格式化 C 原始程式碼，而且你也注意到了，確實是這樣，不過它所使用
 的預設值和我們想要的相去甚遠 (實際上，甚至比隨機打的還要差——無數個猴子在
 GNU emacs 裡打字永遠不會創造出一個好程式)
@@ -638,7 +639,8 @@ GNU emacs 裡打字永遠不會創造出一個好程式)
 不過，GNU indent 也有和 GNU emacs 一樣有問題的設定，所以你需要給它一些命令選
 項。不過，這還不算太糟糕，因為就算是 GNU indent 的作者也認同 K&R 的權威性
 (GNU 的人並不是壞人，他們只是在這個問題上被嚴重的誤導了)，所以你只要給 indent
-指定選項 ``-kr -i8`` (代表 ``K&R，8 字元縮排``)，或使用 ``scripts/Lindent``
+指定選項 ``-kr -i8`` (代表 ``K&R, 8 character indents``，即 K&R 風格、8 字元
+縮排)，或使用 ``scripts/Lindent``
 這樣就可以以最時髦的方式縮排原始程式碼。
 
 ``indent`` 有很多選項，特別是重新格式化註解的時候，你可能需要看一下它的手冊。
@@ -646,14 +648,18 @@ GNU emacs 裡打字永遠不會創造出一個好程式)
 
 請注意，您還可以使用 ``clang-format`` 工具幫助您處理這些規則，快速自動重新
 格式化部分程式碼，並審閱整個檔案以發現程式碼風格錯誤、打字錯誤和可能的改進。
-它還可以方便地排序 ``#include`` ，對齊變數/巨集，重排文字和其他類似任務。
-詳見 Documentation/dev-tools/clang-format.rst 。
+它還可以方便地排序 ``#includes``，對齊變數/巨集，重排文字和其他類似任務。
+詳見 :ref:`Documentation/dev-tools/clang-format.rst <clangformat>`。
+
+如果你使用的編輯器相容於 EditorConfig，一些基本的編輯器設定，例如縮排和行尾
+字元，會自動設定好。更多資訊請參閱 EditorConfig 官方網站：
+https://editorconfig.org/
 
 
 10) Kconfig 設定檔
 --------------------
 
-對於遍佈源碼樹的所有 Kconfig* 設定文件來說，它們縮排方式有所不同。緊挨著
+對於遍佈原始碼樹的所有 Kconfig* 設定檔來說，它們縮排方式有所不同。緊挨著
 ``config`` 定義的行，用一個製表符縮排，然而 help 資訊的縮排則額外增加 2 個空
 格。舉個例子::
 
@@ -674,7 +680,7 @@ GNU emacs 裡打字永遠不會創造出一個好程式)
 	depends on ADFS_FS
 	...
 
-要查看設定文件的完整文件，請看 Documentation/kbuild/kconfig-language.rst 。
+要查看設定檔的完整文件，請看 Documentation/kbuild/kconfig-language.rst 。
 
 
 11) 資料結構
@@ -691,12 +697,12 @@ GNU emacs 裡打字永遠不會創造出一個好程式)
 注意上鎖 **不能** 取代引用計數。上鎖是為了保持資料結構的一致性，而引用計數是一
 個記憶體管理技巧。通常二者都需要，不要把兩個搞混了。
 
-很多資料結構實際上有 2 級引用計數，它們通常有不同 ``類`` 的使用者。子類計
-數器統計子類使用者的數量，每當子類計數器減至零時，全域計數器減一。
+很多資料結構實際上有 2 級引用計數，它們通常有不同 ``classes`` (類別) 的使用者。
+子類別計數器統計子類別使用者的數量，每當子類別計數器減至零時，全域計數器減一。
 
-這種 ``多級引用計數`` 的例子可以在記憶體管理 (``struct mm_struct``:
-mm_users 和mm_count)，和檔案系統 (``struct super_block``: s_count 和
-s_active) 中找到。
+這種 ``multi-level-reference-counting`` (多級引用計數) 的例子可以在記憶體管理
+(``struct mm_struct``: mm_users 和 mm_count) 和檔案系統 (``struct super_block``:
+s_count 和 s_active) 中找到。
 
 記住：如果另一個執行線索可以找到你的資料結構，但這個資料結構沒有引用計數器，
 這裡幾乎肯定是一個 bug。
@@ -727,6 +733,27 @@ s_active) 中找到。
 				do_this(b, c);		\
 		} while (0)
 
+帶有未使用參數的類函式巨集應該改寫成 static inline 函式，以避免未使用變數的
+問題：
+
+.. code-block:: c
+
+	static inline void fun(struct foo *foo)
+	{
+	}
+
+由於歷史慣例，許多檔案仍然採用「轉型為 (void)」的方式來對參數求值，但並不建議
+這樣做。行內函式可以解決「有副作用的表達式被求值不只一次」的問題，避開未使用
+變數的問題，而且不知為何通常也比巨集有更好的文件說明。
+
+.. code-block:: c
+
+	/*
+	 * Avoid doing this whenever possible and instead opt for static
+	 * inline functions
+	 */
+	#define macrofun(foo) do { (void) (foo); } while (0)
+
 使用巨集的時候應避免的事情：
 
 1) 影響控制流程的巨集：
@@ -739,8 +766,8 @@ s_active) 中找到。
 				return -EBUGGERED;	\
 		} while (0)
 
-**非常** 不好。它看起來像一個函式，不過卻能導致 ``呼叫`` 它的函式退出；不要打
-亂讀者大腦裡的語法分析器。
+**非常** 不好。它看起來像一個函式呼叫，不過卻能導致 ``calling`` (呼叫它的) 函
+式退出；不要打亂讀者大腦裡的語法分析器。
 
 2) 依賴於一個固定名字的本地變數的巨集：
 
@@ -754,8 +781,8 @@ s_active) 中找到。
 3) 作為左值的帶參數的巨集： FOO(x) = y；如果有人把 FOO 變成一個行內函式的話，這
    種用法就會出錯了。
 
-4) 忘記了優先級：使用表達式定義常數的巨集必須將表達式置於一對小括號之內。帶參數
-   的巨集也要注意此類問題。
+4) 忘記了優先順序：使用表達式定義常數的巨集必須將表達式置於一對小括號之內。帶
+   參數的巨集也要注意此類問題。
 
 .. code-block:: c
 
@@ -790,29 +817,31 @@ cpp 手冊對巨集的講解很詳細。gcc internals 手冊也詳細講解了 R
 
 在小括號裡列印數字 (%d) 沒有任何價值，應該避免這樣做。
 
-<linux/device.h> 裡有一些驅動模型診斷巨集，你應該使用它們，以確保資訊對應
-於正確的設備和驅動，並且被標記了正確的訊息級別。這些巨集有：dev_err(),
-dev_warn(),dev_info() 等等。對於那些不和某個特定設備相關連的資訊，
+<linux/dev_printk.h> 裡有一些驅動模型診斷巨集，你應該使用它們，以確保資訊對
+應於正確的裝置和驅動，並且被標記了正確的訊息級別。這些巨集有：dev_err(),
+dev_warn(),dev_info() 等等。對於那些不和某個特定裝置相關連的資訊，
 <linux/printk.h> 定義了 pr_notice(), pr_info(), pr_warn(), pr_err() 和其他。
+驅動程式正常運作時應該保持安靜，所以除非出了問題，否則優先使用
+dev_dbg/pr_debug。
 
 寫出好的除錯資訊可以是一個很大的挑戰；一旦你寫出後，這些資訊在遠端除錯時能提
 供極大的幫助。然而列印除錯資訊的處理方式同列印非除錯資訊不同。其他 pr_XXX()
 函式能無條件地列印，pr_debug() 卻不；預設情況下它不會被編譯，除非定義了 DEBUG
-或設定了 CONFIG_DYNAMIC_DEBUG。實際這同樣是為了 dev_dbg()，一個相關約定是在一
-個已經開啟了 DEBUG 時，使用 VERBOSE_DEBUG 來添加 dev_vdbg()。
+或設定了 CONFIG_DYNAMIC_DEBUG。dev_dbg() 也是如此；另一個相關的慣例是使用
+VERBOSE_DEBUG，在 DEBUG 已開啟的訊息之外再加上 dev_vdbg() 訊息。
 
 許多子系統擁有 Kconfig 除錯選項來開啟對應 Makefile 裡面的 -DDEBUG；在其他
 情況下，特定檔案使用 #define DEBUG。當一條除錯資訊需要被無條件列印時，例如，
 如果已經包含一個除錯相關的 #ifdef 條件，printk(KERN_DEBUG ...) 就可被使用。
 
 
-14) 分配記憶體
+14) 配置記憶體
 --------------
 
-核心提供了下面的一般用途的記憶體分配函式：
+核心提供了下面的一般用途的記憶體配置函式：
 kmalloc(), kzalloc(), kmalloc_objs(), kzalloc_objs(), vmalloc() 和 vzalloc()。
 請參考 API 文件以獲取有關它們的詳細資訊：
-Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
+:ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
 
 傳遞結構體大小的首選形式是這樣的：
 
@@ -820,71 +849,72 @@ Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
 
 	p = kmalloc_obj(*p, ...);
 
-另外一種傳遞方式中，sizeof 的操作數是結構體的名字，這樣會降低可讀性，並且可能
-會引入 bug。有可能指標變數類型被改變時，而對應的傳遞給記憶體分配函式的 sizeof
-的結果不變。
+另外一種寫法是直接寫出結構體的名字，這樣會降低可讀性，並且可能引入 bug：指標
+變數的類型被改變了，但傳遞給記憶體配置函式的對應 sizeof 卻沒有跟著改。
 
 強制轉換一個 void 指標回傳值是多餘的。C 語言本身保證了從 void 指標到其他任何
 指標類型的轉換是沒有問題的。
 
-分配一個陣列的首選形式是這樣的：
+配置一個陣列的首選形式是這樣的：
 
 .. code-block:: c
 
 	p = kmalloc_objs(*p, n, ...);
 
-分配一個零長陣列的首選形式是這樣的：
+配置一個清零的陣列的首選形式是這樣的：
 
 .. code-block:: c
 
 	p = kzalloc_objs(*p, n, ...);
 
-這兩種形式都會檢查分配大小 n * sizeof(...) 是否溢位，如果發生溢位則回傳
+這兩種形式都會檢查配置大小 n * sizeof(...) 是否溢位，如果發生溢位則回傳
 NULL。
 
-兩種形式都會檢查分配 n * sizeof(...) 大小時記憶體的溢出，如果溢出返回 NULL。
-
-在沒有 __GFP_NOWARN 的情況下使用時，這些通用分配函式都會在失敗時發起堆疊轉儲，
+在沒有 __GFP_NOWARN 的情況下使用時，這些通用配置函式都會在失敗時發起堆疊轉儲，
 因此當返回NULL時，沒有必要發出額外的失敗訊息。
 
 15) 行內弊病
 ------------
 
-有一個常見的誤解是 ``行內`` 是 gcc 提供的可以讓程式碼執行更快的一個選項。
+有一個常見的誤解是 ``inline`` 是 gcc 提供的可以讓程式碼執行更快的一個選項。
 雖然使用行內函式有時候是恰當的 (比如作為一種替代巨集的方式，請看第十二章)，
 不過很多情況下不是這樣。inline 的過度使用會使核心變大，從而使整個系統執行
 速度變慢。因為體積大核心會佔用更多的指令高速快取，而且會導致 pagecache 的
-可用記憶體減少。想象一下，一次 pagecache 未命中就會導致一次磁碟尋址，將耗
+可用記憶體減少。想象一下，一次 pagecache 未命中就會導致一次磁碟尋軌，將耗
 時 5 毫秒。5 毫秒的時間內 CPU 能執行很多很多指令。
 
 一個基本的原則是如果一個函式有 3 行以上，就不要把它變成行內函式。這個原則的一
-個例外是，如果你知道某個參數是一個編譯時常數，而且因為這個常數你確定編譯器在
-編譯時能最佳化掉你的函式的大部分程式碼，那仍然可以給它加上 inline 關鍵字。
+個例外是，如果你知道某個參數是一個編譯時期常數，而且因為這個常數你確定編譯器
+在編譯時期能最佳化掉你的函式的大部分程式碼，那仍然可以給它加上 inline 關鍵字。
 kmalloc() 行內函式就是一個很好的例子。
 
 人們經常主張給 static 的而且只用了一次的函式加上 inline，如此不會有任何損失，
 因為沒有什麼好權衡的。雖然從技術上說這是正確的，但是實際上這種情況下即使不加
-inline gcc 也可以自動使其行內。而且其他使用者可能會要求移除 inline，由此而來的
-爭論會抵消 inline 自身的潛在價值，得不償失。
+inline gcc 也可以自動使其行內。而且一旦出現第二個呼叫者，就得把 inline 移除，
+這項維護負擔的代價，超過了「提示 gcc 去做它本來就會做的事」可能帶來的價值。
 
 
 16) 函式回傳值及命名
 --------------------
 
 函式可以返回多種不同類型的值，最常見的一種是表明函式執行成功或者失敗的值。這樣
-的一個值可以表示為一個錯誤程式碼整數 (-Exxx＝失敗，0＝成功) 或者一個 ``成功``
-布林值 (0＝失敗，非0＝成功)。
+的一個值可以表示為一個錯誤碼整數 (-Exxx＝失敗，0＝成功) 或者一個 ``succeeded``
+(成功) 布林值 (0＝失敗，非0＝成功)。
 
 混合使用這兩種表達方式是難於發現的 bug 的來源。如果 C 語言本身嚴格區分整形和
 布林型變數，那麼編譯器就能夠幫我們發現這些錯誤... 不過 C 語言不區分。為了避免
 產生這種 bug，請遵循下面的慣例::
 
-	如果函式的名字是一個動作或者強制性的命令，那麼這個函式應該返回錯誤代
-	碼整數。如果是一個判斷，那麼函式應該返回一個“成功”布林值。
+	If the name of a function is an action or an imperative command,
+	the function should return an error-code integer.  If the name
+	is a predicate, the function should return a "succeeded" boolean.
+
+也就是說，如果函式的名字是一個動作或者強制性的命令，那麼這個函式應該返回錯誤
+碼整數。如果是一個判斷，那麼函式應該返回一個「成功」布林值。
 
 比如， ``add work`` 是一個命令，所以 add_work() 在成功時返回 0，在失敗時返回
 -EBUSY。類似的，因為 ``PCI device present`` 是一個判斷，所以 pci_dev_present()
-在成功找到一個匹配的設備時應該返回 1，如果找不到時應該返回 0。
+在成功找到一個匹配的裝置時應該返回 1，如果找不到時應該返回 0。
 
 所有 EXPORTed 函式都必須遵守這個慣例，所有的公共函式也都應該如此。私有
 (static) 函式不需要如此，但是我們也推薦這樣做。
@@ -897,8 +927,8 @@ inline gcc 也可以自動使其行內。而且其他使用者可能會要求移
 ----------------
 
 Linux核心布林（bool）類型是C99 _Bool類型的別名。布林值只能為0或1，而對布林的
-隱式或顯式轉換將自動將值轉換為true或false。在使用布林類型時 **不需要** 構造，
-它會消除一類錯誤。
+隱式或顯式轉換將自動將值轉換為true或false。使用 bool 類型時不需要 !! 這種寫
+法，這消除了一類錯誤。
 
 使用布林值時，應使用true和false定義，而不是1和0。
 
@@ -906,7 +936,7 @@ Linux核心布林（bool）類型是C99 _Bool類型的別名。布林值只能
 並且布林值在儲存時通常比“int”更好。
 
 如果快取行佈局或值的大小很重要，請不要使用布林，因為其大小和對齊方式根據編譯
-的體系結構而不同。針對對齊和大小進行最佳化的結構體不應使用布林。
+的架構而不同。針對對齊和大小進行最佳化的結構體不應使用布林。
 
 如果一個結構體有多個true/false值，請考慮將它們合併為具有1比特成員的位域，或使
 用適當的固定寬度類型，如u8。
@@ -919,22 +949,26 @@ Linux核心布林（bool）類型是C99 _Bool類型的別名。布林值只能
 18) 不要重新發明核心巨集
 ------------------------
 
-標頭檔 include/linux/kernel.h 包含了一些巨集，你應該使用它們，而不要自己寫一些
-它們的變種。比如，如果你需要計算一個陣列的長度，使用這個巨集
+include/linux/ 裡有許多標頭檔包含了一些巨集，你應該使用它們，而不要自己寫一
+些它們的變種。比如，如果你需要計算一個陣列的長度，使用這個巨集
 
 .. code-block:: c
 
 	#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
+它定義在 array_size.h 中。
+
 類似的，如果你要計算某結構體成員的大小，使用
 
 .. code-block:: c
 
 	#define sizeof_field(t, f) (sizeof(((t*)0)->f))
 
-還有可以做嚴格的類型檢查的 min() 和 max() 巨集，如果你需要可以使用它們。你可以
-自己看看那個標頭檔裡還定義了什麼你可以拿來用的東西，如果有定義的話，你就不應
-在你的程式碼裡自己重新定義。
+它定義在 stddef.h 中。
+
+minmax.h 裡還定義了可以做嚴格的類型檢查的 min() 和 max() 巨集，如果你需要可以
+使用它們。你可以自己看看這些標頭檔裡還定義了什麼你可以拿來用的東西，如果有定
+義的話，你就不應在你的程式碼裡自己重新定義。
 
 
 19) 編輯器模式行和其他需要羅嗦的事情
@@ -1036,11 +1070,62 @@ Vim 能夠解析這樣的標記：
 	#endif /* CONFIG_SOMETHING */
 
 
+22) 不要讓核心崩潰
+------------------
+
+一般來說，決定是否讓核心崩潰的權力屬於使用者，而不是核心開發者。
+
+避免 panic()
+************
+
+panic() 應該謹慎使用，原則上只在系統開機期間使用。例如，在開機期間記憶體耗盡
+而無法繼續時，使用 panic() 是可以接受的。
+
+使用 WARN() 而非 BUG()
+**********************
+
+不要加入使用任何 BUG() 變體的新程式碼，例如 BUG()、BUG_ON() 或 VM_BUG_ON()。
+請改用 WARN*() 變體，最好是 WARN_ON_ONCE()，並且盡可能加上復原程式碼。如果沒有
+合理的方式可以至少部分復原，就不需要復原程式碼。
+
+「我懶得做錯誤處理」不是使用 BUG() 的藉口。對於無法繼續執行的重大內部損毀，仍
+然可以使用 BUG()，但需要有充分的理由。
+
+使用 WARN_ON_ONCE() 而非 WARN() 或 WARN_ON()
+********************************************
+
+通常應優先使用 WARN_ON_ONCE()，而不是 WARN() 或 WARN_ON()，因為某個警告條件一
+旦發生，往往會發生很多次。這可能會塞滿核心日誌並使其循環覆寫，甚至可能讓系統
+變慢到過量的日誌本身變成另一個問題。
+
+不要輕易 WARN
+*************
+
+WARN*() 是為了意料之外、不應該發生的情況而設計的。WARN*() 巨集不可用於任何在
+正常運作期間預期會發生的事情。例如，它們不是前置條件或後置條件的斷言。再強調
+一次：WARN*() 不可用於預期很容易觸發的條件，例如由使用者空間的操作觸發的條件。
+如果你需要通知使用者某個問題，pr_warn_once() 是一個可能的替代方案。
+
+不必擔心 panic_on_warn 使用者
+*****************************
+
+關於 panic_on_warn 再多說幾句：請記住 ``panic_on_warn`` 是一個可用的核心選項，
+而且很多使用者會設定這個選項。這就是上面有「不要輕易 WARN」這一節的原因。然
+而，panic_on_warn 使用者的存在並不是避免審慎使用 WARN*() 的正當理由。因為任何
+啟用 panic_on_warn 的人都已經明確要求核心在 WARN*() 觸發時崩潰，這些使用者必
+須準備好承擔系統較容易崩潰的後果。
+
+使用 BUILD_BUG_ON() 做編譯時期斷言
+**********************************
+
+使用 BUILD_BUG_ON() 是可以接受而且受到鼓勵的，因為它是編譯時期斷言，在執行時期
+不會有任何影響。
+
 附錄 I) 參考資料
 ----------------
 
 The C Programming Language, 2nd Edition
-作者：Brian W. Kernighan 和 Denni M. Ritchie.
+作者：Brian W. Kernighan 和 Dennis M. Ritchie.
 Prentice Hall, Inc., 1988.
 ISBN 0-13-110362-8 (平裝), 0-13-110370-9 (精裝).
 
@@ -1075,7 +1160,6 @@ GNU 手冊 - 遵循 K&R 標準和此文字 - cpp, gcc, gcc internals and indent,
 
 WG14 是 C 語言的國際標準化工作組，URL: http://www.open-std.org/JTC1/SC22/WG14/
 
-核心文件 Documentation/process/coding-style.rst，
-作者 greg@kroah.com 發表於 OLS 2002：
+Kernel CodingStyle，作者 greg@kroah.com，發表於 OLS 2002：
 http://www.kroah.com/linux/talks/ols_2002_kernel_codingstyle_talk/html/
 
-- 
2.43.0

