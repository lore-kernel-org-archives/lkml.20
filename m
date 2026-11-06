Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964722;
	b=zAFA6N8/QlOa/RinNvi2e4OjbcXnrWmHK88+G1/TUOB0sqd4oPJf49Kwd3scmb7SpPC/
	 SJJsJq6uY0iuqqXR30WFVyhK0qEA3LSO+IPaNiDkIDk8j3L7Kjwi9Cau+Cz+diXv9mtLk
	 CWbsJkc3s1PxoqBvqaZgDFyvz58Fs1xYGjZTPI96P9VKDqQdGP3o0vrZJKncI1qq8qBV6
	 DHPzOjsxSuhPkdnDmFtbOjKoJrhNADaeeRdNIxRqL4BZJwXM7mHVJY0asm8dTctkXJLYE
	 WTGkFk6mpzTk79JPY0hEt7H8FgIOt4cymrkWsvr6JfqXNcjvXk3jSMPdDixKJGqluRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GxnqUynbHCGbEjodNA/yE6NipAYfCCZdbNdoLhD1qwY=;
	b=AIbbbVpx7tsA3jrcogAGi3+BzOSLYV7NG+8kQ6vwPe8M/Zg2nFbucF8bJCjgOuGhjJ+p
	 C9o6ANspD1hdSjUavilLN7fRY14KYSfldX7gVGnUZUkH9F/p2xrTybr+UAy7yTWtMnKNQ
	 KTKZrIq93W9GcdtNJAA1x4/BiXVWWSBfP08R1+cqWm6dcLr5TtgokGlAUc4W+SNCBr3G3
	 K5XkStdInq63L+TaM+eEFfQuTHH7IukqEq0rhb/3woS6usZO6XMGZ0Knhzqdg4NjmNORU
	 gAJPJWO4PjKe2gsA6tYnniovql05nkLGcSTi75qSzlkpAgUD9/tXTIik0glxoAyJvog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwY2ksPj;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A7B606EEAF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A7B606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwY2ksPj
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso41894a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964720; x=1794569520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GxnqUynbHCGbEjodNA/yE6NipAYfCCZdbNdoLhD1qwY=;
        b=BwY2ksPjSWM8AIbv6yQzxVCCtJuj0OSv09Jjp7jPxbQqJeYXj3wreIHT556/SBoV2n
         pYvyiHKb19Yw3j0IIfap3RFSgkcgbl0hHVa44ys03JUVYYA5pdfb4taVDpXr7BxmtAr+
         ACc021N0GK9ouBuMkP4h/xdHr4r6n73kJnStVXg03mvlAG9nZ26CGi7s2PbrKOTza6I8
         k2vNv4q4f96kXk9tnNL55PEiFbDYyPyxg9pOFGBWdkhlSCAbuN9QI5lDusC3wuD85UCI
         mIXzanxKLhNqXTQWmoaIdAehWNo8Ze6lnsyFUKWA+d7lzv0GFYYJVgMqvdQCGsPHlIqf
         11Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964720; x=1794569520;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxnqUynbHCGbEjodNA/yE6NipAYfCCZdbNdoLhD1qwY=;
        b=hQ2L8ybx9HbpvgI1q73ua/0UOj1JliwywIU7M4/FcGdrErA47waHFnc05DZdiFSPvW
         Epr41mpAzQTYDKblvU9mUv4n3ewy4vPVpyYYxqeHJS+zvVS5KJziKAZ6O0GPZzbdkAp8
         Baj0Gv1HIUozT/3HJbozqBYBAAe4GGNuTeUpomTg6hYo2Qsz6Ac8keWLIwniIJ2EszmQ
         tGx1yQqZ6XSiDySsnpiDzbsUMDbOhWi89roPx+UireOnk7AbJRf4AZtUrSHy853hFIXU
         +F1zT4mvJ3cVf8moJGnsrqrEa8zv1qjhzw5yScnpyyLDN66GqicORCAUOuOMgF4Ygc0l
         Vx2A==
X-Forwarded-Encrypted: i=1; AL+hErE0RohFNuG1j6lTK9mtViaQESKCs1ADU8tBt+jIyDUoooZTGRncrG/xfvto2wnhaz1mG6XHpA+VjHcOUfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z90vn9FVEoaMe3WOBNzn4cc9TzPTWEFSkcXIky7Hoz6sor8WMPY
	7JB/S3iAPhYobIGNbw6K3BFgTbiotKCAzepUn6oLfpqYX+sx/5HhCDWq
X-Gm-Gg: AYBFou2WAWxFsQ4MnKyI+P8oQFh3qfZIQVUmK9Pt2I++sW7ZSjB7J7FQXT7oMQD0aFN
	rHsqiJGqf5RvQgcANv4pBrVyNt2AQS02vFYviYni0h81eNqD5QdQBaCAiceq6moZwwmLXudHeNS
	fNd/h5yQDavsEjR8ipnVV/apDYHW4p16J39xPtNhbQNXHJxB4N9xWuoVxnmdykIlj4QD4gs7iKf
	10jNCIr3oWufvXYRZpqe4jST78UqAKFTKPz9KFWGsYXFkS/7VWA9gciKbxpUc8xTlVAIM5r0ai4
	Sz4Lf31XIHMAgf6uAEGaqQYEIzW68iZeYHgOOqtU/luXR3rYsNvFLf7c1MI1zSpNaop7FMiSn6u
	iJjDWm8Gfr4+QfV/vLl7D3W3eb6ssWmUqVwv3fIvwljPs6XYQMBj7FQAKwwsQSy5UEiSjs1TVC4
	cZhbGAj6zVMwZyAvxZjJ8+daV0AVWwYy/SPnLfMdwhnh3f1a4cerOiPL18Kkj0KGSxKbMDu0fmd
	ncq4ZCDFuvtyNMc3ZEiEZhflojLWgxn8hDkhohRADTgk7hUjDF6H46yn7SMnQu6IM6eUV+JJxjs
	4jjZUS9B0SdpGzPEuj2e5p4OE7YWfbTJY501PELe3y49qyejUnUk7OnpWborfsQoZDPbYUm1SGs
	WIiw0UM23NbzutkNmEjNbux5bBw==
X-Received: by 2002:a17:90b:4cc8:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3b0db5f221bmr3870832a91.1.1793964719954;
        Fri, 06 Nov 2026 03:31:59 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:31:58 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the English original
Date: Fri,  6 Nov 2026 19:31:18 +0800
Message-ID: <20261106113142.706783-4-chenyou910331@gmail.com>
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
current English text shows it never picked up several changes and
mistranslated a number of sentences.  Bring it in line with the full
current original:

- add the missing paragraph on EditorConfig
- add the missing "There are, of course, some catches." sentence in
  the internal API section
- replace the Coccinelle :ref: that pointed a URL at the coccinelle.rst
  label with the plain project URL, as in the original
- fix the sparse and LWN URLs, and the coding-style.rst reference that
  displayed a zh_CN path
- keep Linus's quote verbatim in its literal block and add the
  translation after it
- retranslate sentences whose meaning had drifted (the always-zero
  argument, driver abstraction layers, multiple evaluation of macro
  arguments, the inline function temptation, Devicescape being offered
  for inclusion, failure recovery paths, fault injection percentages,
  distributors, compiler warnings that should not appear, documentation
  being the exception, rare deadlocks)
- spell Devicescape and Coccinelle correctly, and fix the *why*
  emphasis that was not rendered
- replace mainland terms with Taiwanese usage (內核, 代碼, 內存, 線程,
  函數, 接口, 文檔, 信息, ...) and the 爲/着/啓 conversion artifacts
- expand tabs in the literal block

update to commit 5adb3698bbe8 ("coccinelle: update Coccinelle website URL")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/4.Coding.rst   | 414 +++++++++---------
 1 file changed, 216 insertions(+), 198 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/4.Coding.rst b/Documentation/translations/zh_TW/process/4.Coding.rst
index 423d51f4b3de..288c42dbede1 100644
--- a/Documentation/translations/zh_TW/process/4.Coding.rst
+++ b/Documentation/translations/zh_TW/process/4.Coding.rst
@@ -6,283 +6,301 @@
 
 .. _tw_development_coding:
 
-使代碼正確
+讓程式碼正確
 ======================
 
-雖然一個堅實的、面向社區的設計過程有很多值得說道的，但是任何內核開發項目工作
-的證明都反映在代碼中。它是將由其他開發人員檢查併合並（或不合並）到主線樹中
-的代碼。所以這段代碼的質量決定了項目的最終成功。
+雖然一個堅實的、以社群為導向的設計過程有很多值得說道的，但是任何核心開發專案
+的成果最終都體現在程式碼中。程式碼才是其他開發人員要檢查、並合併（或不合併）
+到主線樹中的東西。所以這些程式碼的品質決定了專案的最終成功。
 
-本節將檢查編碼過程。我們將從內核開發人員常犯的幾種錯誤開始。然後重點將轉移
-到正確的做法和相關有用的工具上。
+本節將探討撰寫程式碼的過程。我們將從核心開發人員常犯的幾種錯誤開始。然後重點
+將轉移到正確的做法和相關有用的工具上。
 
 陷阱
 ----
 
-代碼風格
-********
+程式碼風格
+**********
 
-內核長期以來都有其標準的代碼風格，如
-:ref:`Documentation/translations/zh_CN/process/coding-style.rst <tw_codingstyle>`
-中所述。在多數時候，該文檔中描述的準則至多被認爲是建議性的。因此，內核中存在
-大量不符合代碼風格準則的代碼。這種代碼的存在會給內核開發人員帶來兩方面的危害。
+核心長期以來都有其標準的程式碼風格，如
+:ref:`Documentation/process/coding-style.rst <tw_codingstyle>` 中所述。在其中
+大部分時間裡，該文件中描述的準則至多被認為是建議性的。因此，核心中存在大量不
+符合程式碼風格準則的程式碼。這種程式碼的存在會給核心開發人員帶來兩方面的危害。
 
-首先，相信內核代碼標準並不重要，也不強制執行。但事實上，如果沒有按照標準
-編寫代碼，那麼新代碼將很難加入到內核中；許多開發人員甚至會在審查代碼之前要求
-對代碼進行重新格式化。一個像內核這麼大的代碼庫需要一些統一格式的代碼，以使
-開發人員能夠快速理解其中的任何部分。所以再也經不起奇怪格式的代碼的折騰了。
+第一種危害是認為核心程式碼標準並不重要，也不會強制執行。但事實上，如果沒有按
+照標準編寫程式碼，那麼新程式碼將很難加入到核心中；許多開發人員甚至會在審查程
+式碼之前要求對程式碼進行重新格式化。一個像核心這麼大的程式碼庫需要一定程度的
+一致性，以使開發人員能夠快速理解其中的任何部分。所以格式怪異的程式碼已經沒有
+容身之地了。
 
-內核的代碼風格偶爾會與僱主的強制風格發生衝突。在這種情況下，必須在代碼合併
-之前遵從內核代碼風格。將代碼放入內核意味着以多種方式放棄一定程度的控制權——
-包括控制代碼樣式。
+核心的程式碼風格偶爾會與雇主的強制風格發生衝突。在這種情況下，必須在程式碼合
+併之前遵從核心程式碼風格。將程式碼放入核心意味著以多種方式放棄一定程度的控制
+權——包括控制程式碼的格式。
 
-另一個危害是認爲已經在內核中的代碼迫切需要修復代碼樣式。開發者可能會開始編寫
-重新格式化補丁，作爲熟悉開發過程的一種方式，或者作爲將其名字寫入內核變更日誌
-的一種方式，或者兩者兼而有之。但是純代碼風格的修復被開發社區視爲噪音，它們往
-往受到冷遇。因此，最好避免編寫這種類型的補丁。在由於其他原因處理一段代碼的
-同時順帶修復其樣式是很自然的，但是不應該僅爲了更改代碼樣式而更改之。
+另一個陷阱是認為已經在核心中的程式碼迫切需要修正程式碼風格。開發者可能會開始
+編寫重新格式化的補丁，作為熟悉開發流程的一種方式，或者作為將其名字寫入核心變
+更日誌的一種方式，或者兩者兼而有之。但是純粹修正程式碼風格的補丁被開發社群視
+為噪音，它們往往受到冷遇。因此，最好避免編寫這種類型的補丁。在由於其他原因處
+理一段程式碼的同時順帶修正其風格是很自然的，但是不應該僅為了更改程式碼風格而
+更改之。
 
-代碼風格文檔也不應該被視爲絕對不可違反的規則。如果有一個足夠的理由反對這種
-樣式（例如爲了80列限制拆分行會導致可讀性大大降低），那麼就這樣做吧。
+程式碼風格文件也不應該被視為絕對不可違反的規則。如果有充分的理由違反這種風格
+（例如為了符合80欄的限制而拆分某一行，會導致可讀性大大降低），那麼就這樣做吧。
 
 注意您還可以使用 ``clang-format`` 工具來幫助您處理這些規則，快速自動重新格式
-化部分代碼，和審閱完整的文件以發現代碼樣式錯誤、拼寫錯誤和可能的改進。它還
-可以方便地排序 ``#includes`` 、對齊變量/宏、重排文本和其他類似任務。有關詳細
-信息，請參閱文檔 :ref:`Documentation/dev-tools/clang-format.rst <clangformat>`
+化部分程式碼，和審閱完整的檔案以發現程式碼風格錯誤、拼寫錯誤和可能的改進。它
+還可以方便地排序 ``#includes`` 、對齊變數/巨集、重排文字和其他類似任務。有關
+詳細資訊，請參閱
+:ref:`Documentation/dev-tools/clang-format.rst <clangformat>` 。
+
+如果您使用的編輯器相容於 EditorConfig，一些基本的編輯器設定（例如縮排和行尾字
+元）將會自動設定。更多資訊請參閱 EditorConfig 官方網站：
+https://editorconfig.org/
 
 抽象層
 ******
 
-計算機科學教授教學生以靈活性和信息隱藏的名義廣泛使用抽象層。當然，內核廣泛
-地使用了抽象；任何涉及數百萬行代碼的項目都必須做到這一點以存續下來。但經驗
-表明，過度或過早的抽象可能和過早的優化一樣有害。抽象應用在適當層級，
-不要過度。
-
-簡單點，先考慮一個調用時始終只有一個參數且總爲零的函數。我們可以保留這個參數，
-以在需要使用它時提供的額外靈活性。不過，在那時實現了這個額外參數的代碼很有
-可能以某種從未被注意到的微妙方式被破壞——因爲它從未被使用過。或者當需要額外
-的靈活性時，它並未以符合程序員當初期望的方式來實現。內核開發人員通常會提交
-補丁來刪除未使用的參數；一般來說，一開始就不應該添加這些參數。
-
-隱藏硬件訪問的抽象層——通常爲了允許大量的驅動程序兼容多個操作系統——尤其不受
-歡迎。這樣的層使代碼變得模糊，可能會造成性能損失；它們不屬於Linux內核。
-
-另一方面，如果您發現自己從另一個內核子系統複製了大量的代碼，那麼是時候
-瞭解一下：是否需要將這些代碼中的部分提取到單獨的庫中，或者在更高的層次上
-實現這些功能。在整個內核中複製相同的代碼沒有價值。
-
-#ifdef 和預處理
-***************
-
-C預處理器似乎給一些C程序員帶來了強大的誘惑，他們認爲它是一種將大量靈活性加入
-源代碼中的方法。但是預處理器不是C，大量使用它會導致代碼對其他人來說更難閱讀，
-對編譯器來說更難檢查正確性。使用了大量預處理器幾乎總是代碼需要一些
-清理工作的標誌。
-
-使用#ifdef的條件編譯實際上是一個強大的功能，它在內核中使用。但是很少有人希望
-看到代碼被鋪滿#ifdef塊。一般規定，ifdef的使用應儘可能限制在頭文件中。條件
-編譯代碼可以限制函數，如果代碼不存在，這些函數就直接變成空的。然後編譯器將
-悄悄地優化對空函數的調用。使得代碼更加清晰，更容易理解。
-
-C預處理器宏存在許多危險性，包括可能對具有副作用且沒有類型安全的表達式進行多
-重評估。如果您試圖定義宏，請考慮創建一個內聯函數替代。結果相同的代碼，內聯
-函數更容易閱讀，不會多次計算其參數，並且允許編譯器對參數和返回值執行類型檢查。
-
-內聯函數
+電腦科學教授教導學生以靈活性和資訊隱藏的名義廣泛使用抽象層。當然，核心廣泛
+地使用了抽象；任何涉及數百萬行程式碼的專案若不這樣做，都無法存續下來。但經驗
+表明，過度或過早的抽象可能和過早的最佳化一樣有害。抽象只應該用到所需的程度，
+不要更多。
+
+簡單來說，考慮一個函式，它的某個參數被所有呼叫者傳入的值都是零。我們可以保留
+這個參數，以防將來有人需要使用它所提供的額外靈活性。不過，到了那個時候，實作
+這個額外參數的程式碼很有可能已經以某種從未被注意到的微妙方式被破壞——因為它從
+未被使用過。或者當需要額外的靈活性時，需求出現的方式並不符合程式設計師當初的
+預期。核心開發人員通常會提交補丁來刪除未使用的參數；一般來說，一開始就不應該
+加入這些參數。
+
+隱藏硬體存取的抽象層——通常是為了讓驅動程式的大部分程式碼能用於多個作業系統
+——尤其不受歡迎。這樣的層使程式碼變得晦澀，可能會造成效能損失；它們不屬於
+Linux核心。
+
+另一方面，如果您發現自己從另一個核心子系統複製了大量的程式碼，那麼是時候問問
+自己：是否應該將這些程式碼中的部分提取到單獨的函式庫中，或者在更高的層次上實
+作這些功能。在整個核心中複製相同的程式碼沒有價值。
+
+#ifdef 和前置處理器的一般使用
+*****************************
+
+C前置處理器似乎給一些C程式設計師帶來了強大的誘惑，他們認為它是一種在原始檔中
+有效率地編入大量靈活性的方法。但是前置處理器不是C，大量使用它會導致程式碼對其
+他人來說更難閱讀，對編譯器來說更難檢查正確性。大量使用前置處理器幾乎總是程式
+碼需要一些清理工作的標誌。
+
+使用#ifdef的條件編譯確實是一個強大的功能，核心中也有使用。但是很少有人希望看
+到程式碼裡到處散布著#ifdef區塊。一般來說，#ifdef的使用應儘可能限制在標頭檔中。
+條件編譯的程式碼可以限制在函式之中，若該程式碼不需要存在，這些函式就直接變成
+空的。然後編譯器將悄悄地把對空函式的呼叫最佳化掉。這樣會使程式碼更加清晰，更
+容易理解。
+
+C前置處理器巨集存在許多危險性，包括對具有副作用的表達式可能進行多次求值，以及
+沒有型別安全。如果您想要定義巨集，請考慮改為建立一個行內函式。產生的程式碼是
+相同的，但行內函式更容易閱讀，不會多次對其參數求值，並且允許編譯器對參數和回
+傳值執行型別檢查。
+
+行內函式
 ********
 
-不過，內聯函數本身也存在風險。程序員可以傾心於避免函數調用和用內聯函數填充源
-文件所固有的效率。然而，這些功能實際上會降低性能。因爲它們的代碼在每個調用站
-點都被複制一遍，所以最終會增加編譯內核的大小。此外，這也對處理器的內存緩存
-造成壓力，從而大大降低執行速度。通常內聯函數應該非常小，而且相對較少。畢竟
-函數調用的成本並不高；大量創建內聯函數是過早優化的典型例子。
+不過，行內函式本身也存在風險。程式設計師可能會迷戀於避免函式呼叫所帶來的效率，
+而在原始檔中塞滿行內函式。然而，這些函式實際上可能會降低效能。因為它們的程式
+碼在每個呼叫處都被複製一遍，所以最終會增加編譯後核心的大小。此外，這也對處理
+器的記憶體快取造成壓力，從而大大降低執行速度。通常行內函式應該非常小，而且相
+對較少。畢竟函式呼叫的成本並不高；大量建立行內函式是過早最佳化的典型例子。
 
-一般來說，內核程序員會自冒風險忽略緩存效果。在數據結構課程開頭中的經典
-時間/空間權衡通常不適用於當代硬件。空間 *就是* 時間，因爲一個大的程序比一個
-更緊湊的程序運行得慢。
+一般來說，核心程式設計師若忽略快取效應，後果自負。資料結構入門課程中教授的經
+典時間/空間權衡通常不適用於當代硬體。空間 *就是* 時間，因為一個較大的程式會比
+一個更緊湊的程式執行得慢。
 
-較新的編譯器越來越激進地決定一個給定函數是否應該內聯。因此，隨意放置使用
-“inline”關鍵字可能不僅僅是過度的，也可能是無用的。
+較新的編譯器越來越積極地參與決定一個給定函式是否真的應該被行內展開。因此，隨
+意放置“inline”關鍵字可能不僅僅是過度的，也可能是無關緊要的。
 
 鎖
-**
+****
 
-2006年5月，“deviceescape”網絡堆棧在前呼後擁下以GPL發佈，並被納入主線內核。
-這是一個受歡迎的消息；Linux中對無線網絡的支持充其量被認爲是不合格的，而
-Deviceescape堆棧承諾修復這種情況。然而直到2007年6月（2.6.22），這段代碼才真
+2006年5月，“Devicescape”網路堆疊在大張旗鼓下以GPL發布，並提供給主線核心收錄。
+這是一個受歡迎的消息；Linux中對無線網路的支援充其量被認為是不合格的，而
+Devicescape堆疊承諾修復這種情況。然而直到2007年6月（2.6.22），這段程式碼才真
 正進入主線。發生了什麼？
 
-這段代碼出現了許多閉門造車的跡象。但一個大麻煩是，它並不是爲多處理器系統而
-設計。在合併這個網絡堆棧（現在稱爲mac80211）之前，需要對其進行一個鎖方案的
-改造。
+這段程式碼出現了許多在公司內部閉門開發的跡象。但其中一個特別大的問題是，它並
+不是為多處理器系統而設計的。在合併這個網路堆疊（現在稱為mac80211）之前，需要
+為它補上一套鎖定機制。
 
-曾經，Linux內核代碼可以在不考慮多處理器系統所帶來的併發性問題的情況下進行
-開發。然而現在，這個文檔就是在雙核筆記本電腦上寫的。即使在單處理器系統上，
-爲提高響應能力所做的工作也會提高內核內的併發性水平。編寫內核代碼而不考慮鎖
-的日子早已遠去。
+曾經，Linux核心程式碼可以在不考慮多處理器系統所帶來的並行性問題的情況下進行
+開發。然而現在，這個文件就是在雙核筆記型電腦上寫的。即使在單處理器系統上，為
+提高回應能力所做的工作也會提高核心內的並行性水準。編寫核心程式碼而不考慮鎖的
+日子早已遠去。
 
-可以由多個線程併發訪問的任何資源（數據結構、硬件寄存器等）必須由鎖保護。新
-的代碼應該謹記這一要求；事後修改鎖是一項相當困難的任務。內核開發人員應該花
-時間充分了解可用的鎖原語，以便爲工作選擇正確的工具。對併發性缺乏關注的代碼
-很難進入主線。
+可以由多個執行緒並行存取的任何資源（資料結構、硬體暫存器等）必須由鎖保護。新
+的程式碼應該謹記這一要求；事後再補上鎖定是一項相當困難的任務。核心開發人員應
+該花時間充分了解可用的鎖原語，以便為工作選擇正確的工具。對並行性缺乏關注的程
+式碼很難進入主線。
 
 迴歸
 ****
 
-最後一個值得一提的危險是迴歸：它可能會引起導致現有用戶的某些東西中斷的改變
-（這也可能會帶來很大的改進）。這種變化被稱爲“迴歸”，迴歸已經成爲主線內核
-最不受歡迎的問題。除了少數例外情況，如果迴歸不能及時修正，會導致迴歸的修改
-將被取消。最好首先避免迴歸發生。
+最後一個值得一提的危險是：做出一個會讓現有使用者的某些東西壞掉的變更（這種變
+更也可能帶來很大的改進）是很誘人的。這種變更被稱為“迴歸”，迴歸已經成為主線核
+心最不受歡迎的問題。除了少數例外情況，如果迴歸不能及時修正，導致迴歸的變更將
+被撤回。最好一開始就避免迴歸發生。
 
-人們常常爭論，如果迴歸帶來的功能遠超過產生的問題，那麼迴歸是否爲可接受的。
-如果它破壞了一個系統卻爲十個系統帶來新的功能，爲何不改改態度呢？2007年7月，
-Linus對這個問題給出了最佳答案:
+人們常常爭論，如果一項變更讓更多人的東西能正常運作，而產生問題的人較少，那麼
+這種迴歸就是合理的。如果一項變更每破壞一個系統，就能為十個系統帶來新的功能，
+為何不做呢？2007年7月，Linus對這個問題給出了最佳答案:
 
 ::
 
-	所以我們不會通過引入新問題來修復錯誤。這種方式是靠不住的，沒人知道
-	是否真的有進展。是前進兩步、後退一步，還是前進一步、後退兩步？
+        So we don't fix bugs by introducing new problems.  That way lies
+        madness, and nobody ever knows if you actually make any real
+        progress at all. Is it two steps forwards, one step back, or one
+        step forward and two steps back?
 
-（http://lwn.net/Articles/243460/）
+（中譯：所以我們不會透過引入新問題來修復錯誤。那樣做會讓人發瘋，而且沒人知道
+是否真的有任何實際的進展。是前進兩步、後退一步，還是前進一步、後退兩步？）
 
-特別不受歡迎的一種迴歸類型是用戶空間ABI的任何變化。一旦接口被導出到用戶空間，
-就必須無限期地支持它。這一事實使得用戶空間接口的創建特別具有挑戰性：因爲它們
-不能以不兼容的方式進行更改，所以必須一次就對。因此，用戶空間接口總是需要大量
-的思考、清晰的文檔和廣泛的審查。
+(https://lwn.net/Articles/243460/)。
 
+特別不受歡迎的一種迴歸類型是使用者空間ABI的任何變化。一旦介面被匯出到使用者
+空間，就必須無限期地支援它。這一事實使得使用者空間介面的建立特別具有挑戰性：
+因為它們不能以不相容的方式進行更改，所以必須一次就做對。因此，使用者空間介面
+總是需要大量的思考、清晰的文件和廣泛的審查。
 
-代碼檢查工具
-------------
 
-至少目前，編寫無錯誤代碼仍然是我們中很少人能達到的理想狀態。不過，我們希望做
-的是，在代碼進入主線內核之前，儘可能多地捕獲並修復這些錯誤。爲此，內核開發人
-員已經提供了一系列令人印象深刻的工具，可以自動捕獲各種各樣的隱藏問題。計算機
-發現的任何問題都是一個以後不會困擾用戶的問題，因此，只要有可能，就應該使用
-自動化工具。
+程式碼檢查工具
+--------------
+
+至少目前，編寫無錯誤程式碼仍然是我們中很少人能達到的理想狀態。不過，我們希望
+做到的是，在程式碼進入主線核心之前，儘可能多地捕獲並修復這些錯誤。為此，核心
+開發人員已經彙集了一系列令人印象深刻的工具，可以自動捕獲各種各樣難以察覺的問
+題。電腦發現的任何問題都是一個以後不會困擾使用者的問題，因此，只要有可能，就
+應該使用自動化工具。
 
 第一步是注意編譯器產生的警告。當前版本的GCC可以檢測（並警告）大量潛在錯誤。
-通常，這些警告都指向真正的問題。提交以供審閱的代碼一般不會產生任何編譯器警告。
-在消除警告時，注意瞭解真正的原因，並儘量避免僅“修復”使警告消失而不解決其原因。
+通常，這些警告都指向真正的問題。提交以供審閱的程式碼一般不應產生任何編譯器警
+告。在消除警告時，注意了解真正的原因，並儘量避免僅“修復”使警告消失而不解決其
+原因。
 
-請注意，並非所有編譯器警告都默認啓用。使用“make KCFLAGS=-W”構建內核以
+請注意，並非所有編譯器警告都預設啟用。使用“make KCFLAGS=-W”建置核心以
 獲得完整集合。
 
-內核提供了幾個配置選項，可以打開調試功能；大多數配置選項位於“kernel hacking”
-子菜單中。對於任何用於開發或測試目的的內核，都應該啓用其中幾個選項。特別是，
+核心提供了幾個配置選項，可以打開除錯功能；大多數配置選項位於“kernel hacking”
+子選單中。對於任何用於開發或測試目的的核心，都應該啟用其中幾個選項。特別是，
 您應該打開：
 
- - FRAME_WARN 獲取大於給定數量的堆棧幀的警告。
-   這些警告生成的輸出可能比較冗長，但您不必擔心來自內核其他部分的警告。
+ - FRAME_WARN 對大於給定大小的堆疊框架發出警告。
+   這些警告生成的輸出可能比較冗長，但您不必擔心來自核心其他部分的警告。
 
- - DEBUG_OBJECTS 將添加代碼以跟蹤內核創建的各種對象的生命週期，並在出現問題
-   時發出警告。如果你要添加創建（和導出）關於其自己的複雜對象的子系統，請
-   考慮打開對象調試基礎結構的支持。
+ - DEBUG_OBJECTS 將加入程式碼以追蹤核心建立的各種物件的生命週期，並在操作順序
+   出錯時發出警告。如果您要加入一個會建立（並匯出）自己的複雜物件的子系統，請
+   考慮為物件除錯基礎設施加入支援。
 
- - DEBUG_SLAB 可以發現各種內存分配和使用錯誤；它應該用於大多數開發內核。
+ - DEBUG_SLAB 可以發現各種記憶體配置和使用錯誤；它應該用於大多數開發核心。
 
  - DEBUG_SPINLOCK, DEBUG_ATOMIC_SLEEP 和 DEBUG_MUTEXES 會發現許多常見的
    鎖錯誤。
 
-還有很多其他調試選項，其中一些將在下面討論。其中一些有顯著的性能影響，不應
-一直使用。在學習可用選項上花費一些時間，可能會在短期內得到許多回報。
-
-其中一個較重的調試工具是鎖檢查器或“lockdep”。該工具將跟蹤系統中每個鎖
-（spinlock或mutex）的獲取和釋放、獲取鎖的相對順序、當前中斷環境等等。然後，
-它可以確保總是以相同的順序獲取鎖，相同的中斷假設適用於所有情況等等。換句話
-說，lockdep可以找到許多導致系統死鎖的場景。在部署的系統中，這種問題可能會
-很痛苦（對於開發人員和用戶而言）；LockDep允許提前以自動方式發現問題。具有
-任何類型的非普通鎖的代碼在提交合並前應在啓用lockdep的情況下運行測試。
-
-作爲一個勤奮的內核程序員，毫無疑問，您將檢查任何可能失敗的操作（如內存分配）
-的返回狀態。然而，事實上，最終的故障復現路徑可能完全沒有經過測試。未測試的
-代碼往往會出問題；如果所有這些錯誤處理路徑都被執行了幾次，那麼您可能對代碼
-更有信心。
-
-內核提供了一個可以做到這一點的錯誤注入框架，特別是在涉及內存分配的情況下。
-啓用故障注入後，內存分配的可配置失敗的百分比；這些失敗可以限定在特定的代碼
-範圍內。在啓用了故障注入的情況下運行，程序員可以看到當情況惡化時代碼如何響
-應。有關如何使用此工具的詳細信息，請參閱
+還有很多其他除錯選項，其中一些將在下面討論。其中一些有顯著的效能影響，不應
+一直使用。在學習可用選項上花費一些時間，很可能在短時間內就得到數倍的回報。
+
+其中一個較重的除錯工具是鎖檢查器或“lockdep”。該工具將追蹤系統中每個鎖
+（spinlock或mutex）的取得和釋放、取得鎖的相對順序、當前中斷環境等等。然後，
+它可以確保總是以相同的順序取得鎖，相同的中斷假設適用於所有情況等等。換句話
+說，lockdep可以找到許多在極少數情況下可能導致系統死鎖的場景。在已部署的系統
+中，這種問題可能會很痛苦（對於開發人員和使用者而言）；lockdep允許提前以自動
+方式發現問題。具有任何非簡單鎖定的程式碼在提交合併前應在啟用lockdep的情況下
+執行測試。
+
+作為一個勤奮的核心程式設計師，毫無疑問，您將檢查任何可能失敗的操作（如記憶體
+配置）的回傳狀態。然而，事實上，由此產生的失敗復原路徑可能完全沒有經過測試。
+未測試的程式碼往往會出問題；如果所有這些錯誤處理路徑都被執行過幾次，那麼您對
+程式碼會更有信心。
+
+核心提供了一個可以做到這一點的故障注入框架，特別是在涉及記憶體配置的情況下。
+啟用故障注入後，可設定比例的記憶體配置會被刻意設為失敗；這些失敗可以限定在特
+定的程式碼範圍內。在啟用了故障注入的情況下執行，程式設計師可以看到當情況惡化
+時程式碼如何回應。有關如何使用此工具的詳細資訊，請參閱
 Documentation/fault-injection/fault-injection.rst。
 
-“sparse”靜態分析工具可以發現其他類型的錯誤。sparse可以警告程序員用戶空間
-和內核空間地址之間的混淆、大端序與小端序的混淆、在需要一組位標誌的地方傳遞
-整數值等等。sparse必須單獨安裝(如果您的分發服務器沒有將其打包，
-可以在 https://sparse.wiki.kernel.org/index.php/Main_page 找到）,
-然後可以通過在make命令中添加“C=1”在代碼上運行它。
-
-“Coccinelle”工具 :ref:`https://coccinelle.gitlabpages.inria.fr/website/ <devtools_coccinelle>`
-能夠發現各種潛在的編碼問題；它還可以爲這些問題提出修復方案。在
-scripts/coccinelle目錄下已經打包了相當多的內核“語義補丁”；運行
-“make coccicheck”將運行這些語義補丁並報告發現的任何問題。有關詳細信息，請參閱
-:ref:`Documentation/dev-tools/coccinelle.rst <devtools_coccinelle>`
+“sparse”靜態分析工具可以發現其他類型的錯誤。sparse可以警告程式設計師使用者空
+間和核心空間位址之間的混淆、大端序與小端序數值的混用、在需要一組位元旗標的地
+方傳遞整數值等等。sparse必須單獨安裝（如果您的發行版沒有將其打包，
+可以在 https://sparse.wiki.kernel.org/index.php/Main_Page 找到），
+然後可以透過在make命令中加入“C=1”在程式碼上執行它。
 
+“Coccinelle”工具
+(https://coccinelle.gitlabpages.inria.fr/website)
+能夠發現各種潛在的編碼問題；它還可以為這些問題提出修復方案。在
+scripts/coccinelle目錄下已經打包了相當多的核心“語義補丁”；執行
+“make coccicheck”將執行這些語義補丁並報告發現的任何問題。有關詳細資訊，請參閱
+:ref:`Documentation/dev-tools/coccinelle.rst <devtools_coccinelle>` 。
 
-其他類型的可移植性錯誤最好通過爲其他體系結構編譯代碼來發現。如果沒有S/390系統
-或Blackfin開發板，您仍然可以執行編譯步驟。可以在以下位置找到一大堆用於x86系統的
-交叉編譯器：
+其他類型的可移植性錯誤最好透過為其他架構編譯程式碼來發現。如果您手邊沒有S/390
+系統或Blackfin開發板，您仍然可以執行編譯步驟。可以在以下位置找到一大套用於x86
+系統的交叉編譯器：
 
         https://www.kernel.org/pub/tools/crosstool/
 
 花一些時間安裝和使用這些編譯器將有助於避免以後的尷尬。
 
-文檔
+文件
 ----
 
-文檔通常比內核開發規則更爲例外。即便如此，足夠的文檔將有助於簡化將新代碼合併
-到內核中的過程，使其他開發人員的生活更輕鬆，並對您的用戶有所幫助。在許多情況
-下，添加文檔已基本上是強制性的。
+在核心開發中，文件往往是例外而非常態。即便如此，足夠的文件將有助於簡化將新程
+式碼合併到核心中的過程，使其他開發人員的生活更輕鬆，並對您的使用者有所幫助。
+在許多情況下，加入文件已基本上是強制性的。
 
-任何補丁的第一個文檔是其關聯的變更日誌。日誌條目應該描述正在解決的問題、解決
-方案的形式、處理補丁的人員、對性能的任何相關影響，以及理解補丁可能需要的任何
-其他內容。確保變更日誌說明了*爲什麼*補丁值得應用；大量開發者未能提供這些信息。
+任何補丁的第一份文件是其關聯的變更日誌。日誌條目應該描述正在解決的問題、解決
+方案的形式、參與補丁工作的人員、對效能的任何相關影響，以及理解補丁可能需要的
+任何其他內容。確保變更日誌說明了 *為什麼* 補丁值得應用；令人驚訝的是，有相當
+多的開發者沒有提供這項資訊。
 
-任何添加新用戶空間接口的代碼——包括新的sysfs或/proc文件——都應該包含該接口
-的文檔，該文檔使用戶空間開發人員能夠知道他們在使用什麼。請參閱
-Documentation/ABI/README，瞭解如何此文檔格式以及需要提供哪些信息。
+任何加入新使用者空間介面的程式碼——包括新的sysfs或/proc檔案——都應該包含該介面
+的文件，讓使用者空間開發人員能夠知道他們在使用什麼。請參閱
+Documentation/ABI/README，了解此文件應如何格式化以及需要提供哪些資訊。
 
-文檔 :ref:`Documentation/admin-guide/kernel-parameters.rst <kernelparameters>`
-描述了內核的所有引導時間參數。任何添加新參數的補丁都應該向該文檔添加適當的
-條目。
+檔案 :ref:`Documentation/admin-guide/kernel-parameters.rst <kernelparameters>`
+描述了核心的所有開機參數。任何加入新參數的補丁都應該向該檔案加入適當的條目。
 
-任何新的配置選項都必須附有幫助文本，幫助文本需清楚地解釋這些選項以及用戶可能
-希望何時使用它們。
+任何新的配置選項都必須附有說明文字，清楚地解釋這些選項以及使用者可能希望何時
+選用它們。
 
-許多子系統的內部API信息通過專門格式化的註釋進行記錄；這些註釋可以通過
-“kernel-doc”腳本以多種方式提取和格式化。如果您在具有kerneldoc註釋的子系統中
-工作，則應該維護它們，並根據需要爲外部可用的功能添加它們。即使在沒有如此記錄
-的領域中，爲將來添加kerneldoc註釋也沒有壞處；實際上，這對於剛開始開發內核的人
-來說是一個有用的活動。這些註釋的格式以及如何創建kerneldoc模板的一些信息可以在
+許多子系統的內部API資訊透過特殊格式的註解進行記錄；這些註解可以透過
+“kernel-doc”腳本以多種方式提取和格式化。如果您在具有kerneldoc註解的子系統中
+工作，則應該維護它們，並根據需要為外部可用的函式加入註解。即使在尚未如此記錄
+的領域中，為將來加入kerneldoc註解也沒有壞處；實際上，這對於剛開始開發核心的人
+來說是一個有用的活動。這些註解的格式以及如何建立kerneldoc模板的一些資訊可以在
 :ref:`Documentation/doc-guide/ <doc_guide>` 上找到。
 
-任何閱讀大量現有內核代碼的人都會注意到，註釋的缺失往往是最值得注意的。同時，
-對新代碼的要求比過去更高；合併未註釋的代碼將更加困難。這就是說，人們並不期望
-詳細註釋的代碼。代碼本身應該是自解釋的，註釋闡釋了更微妙的方面。
+任何閱讀大量現有核心程式碼的人都會注意到，註解的缺失往往是最顯眼的。再次強調，
+對新程式碼的要求比過去更高；合併未加註解的程式碼將更加困難。話雖如此，人們也
+不希望看到註解過度冗長的程式碼。程式碼本身應該是易讀的，註解則用來闡釋較微妙
+的部分。
 
-某些事情應該總是被註釋。使用內存屏障時，應附上一行文字，解釋爲什麼需要設置內存
-屏障。數據結構的鎖規則通常需要在某個地方解釋。一般來說，主要數據結構需要全面
-的文檔。應該指出代碼中分立的位之間不明顯的依賴性。任何可能誘使代碼管理人進行
-錯誤的“清理”的事情都需要一個註釋來說明爲什麼要這樣做。等等。
+某些事情應該總是加上註解。使用記憶體屏障時，應附上一行文字，解釋為什麼需要該
+屏障。資料結構的鎖規則通常需要在某個地方解釋。一般來說，主要資料結構需要全面
+的文件。不同程式碼片段之間不明顯的相依性應該指出來。任何可能誘使程式碼清理者
+進行錯誤“清理”的地方，都需要一個註解來說明為什麼要這樣做。等等。
 
 
 內部API更改
 -----------
 
-內核提供給用戶空間的二進制接口不能被破壞，除非逼不得已。而內核的內部編程接口
-是高度流動的，當需要時可以更改。如果你發現自己不得不處理一個內核API，或者僅
-僅因爲它不滿足你的需求導致無法使用特定的功能，這可能是API需要改變的一個標誌。
-作爲內核開發人員，您有權進行此類更改。
-
-的確可以進行API更改，但更改必須是合理的。因此任何進行內部API更改的補丁都應該
-附帶關於更改內容和必要原因的描述。這種變化也應該拆分成一個單獨的補丁，而不是
-埋在一個更大的補丁中。
+核心提供給使用者空間的二進位介面不能被破壞，除非逼不得已。而核心的內部程式設
+計介面是高度流動的，當需要時可以更改。如果您發現自己不得不繞過一個核心API，
+或者僅僅因為它不滿足您的需求而不使用某個特定功能，這可能是API需要改變的一個
+標誌。作為核心開發人員，您有權進行此類更改。
 
-另一個要點是，更改內部API的開發人員通常要負責修復內核樹中被更改破壞的任何代碼。
-對於一個廣泛使用的函數，這個責任可以導致成百上千的變化，其中許多變化可能與其他
-開發人員正在做的工作相沖突。不用說，這可能是一項大工程，所以最好確保理由是
-可靠的。請注意，coccinelle工具可以幫助進行廣泛的API更改。
+當然，這其中有一些需要注意的地方。API可以更改，但更改必須有充分的理由。因此任
+何進行內部API更改的補丁都應該附帶關於更改內容和必要原因的描述。這種變化也應
+該拆分成一個單獨的補丁，而不是埋在一個更大的補丁中。
 
-在進行不兼容的API更改時，應儘可能確保編譯器捕獲未更新的代碼。這將幫助您確保找
-到該接口的樹內用處。它還將警告開發人員樹外代碼存在他們需要響應的更改。支持樹外
-代碼不是內核開發人員需要擔心的事情，但是我們也不必使樹外開發人員的生活有不必要
-的困難。
+另一個要點是，更改內部API的開發人員通常要負責修復核心樹中被該更改破壞的任何
+程式碼。對於一個廣泛使用的函式，這個責任可能導致成百上千的變化，其中許多變化
+可能與其他開發人員正在做的工作相衝突。不用說，這可能是一項大工程，所以最好確
+保理由是可靠的。請注意，Coccinelle工具可以幫助進行大範圍的API更改。
 
+在進行不相容的API更改時，應儘可能確保未更新的程式碼會被編譯器捕獲。這將幫助
+您確保找到該介面在樹內的所有使用處。它還會提醒樹外程式碼的開發人員，有一項他
+們需要回應的更改。支援樹外程式碼不是核心開發人員需要擔心的事情，但是我們也不
+必讓樹外開發人員的生活比必要的更困難。
-- 
2.43.0

