Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964983;
	b=lJxKT0ODc/uXc+GLu6MRqm+NlQ94yI1s4B72BCc/QxzIluBUKBu3OTAU4AhwH6LUD8Y9
	 vG2B80Y84RNY9iiAh+cBX7UIFaCzkgSu0i8FGA6ekjpg3yOodwlnnedPizzophzibfvAD
	 xHiDeKor/wZ7QNkoON4RApL23fQG/kbQ4cfxSZ3sTI50ojb7z+w2WadnsZEajYy3+KNz2
	 KhCB+RP9/RdOROTnu8tva7iNUwMpBW9YR4YjL8oAFlxMQb2rmCpxuX3g6Jvoi2WsY2ti7
	 Mz1yaMM339D00+zOPlkTuWzZS8UHgFKIcRGJM/7LbNaMIWGG8BGo2nKGkVTQsgj73kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZYxQSy8dLCKYWceK3MqyY+vv/0VurjYeK94bOEbIJSA=;
	b=nIMR0FUpzY2R5mdBtEIVGb3PRtlfFz1f1jsnHZvlTJ5IdFbWLmr9pUuI4qDux1Avfk7N
	 aZI9CFEaKiwR9ihhMTst44Hl5QqfAV0qtpXGDeA4mY64TPSuR1c7Djc0TIv6z80Z2BAjw
	 m2Tr3c/jAkz4PskNP6EhgTvTMC895i0gH5Dqvy1l1YgUIrTw60VoeNpOFc19P4Wq/27Cr
	 txLCMveM5Gl5LmPrnyGbr3dq4J5N7dWBVFWN/v3NOKoCCLyZs/u7KGGc+Cwn3ERfqfzLi
	 AgQoaN/tsl7pb1iUFs0oG0qqi+PLaTJtwJA33X6VDotYAq61KDEG+DNgtT10BiZLKLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z1KmrsWR;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2E60A5BC4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C2E60A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z1KmrsWR
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso42246a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964981; x=1794569781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYxQSy8dLCKYWceK3MqyY+vv/0VurjYeK94bOEbIJSA=;
        b=z1KmrsWR68iGrKH9Z6PUvX0OBHp6HuhLHN3M9EBO/NTyq9Gd2LhHTjHnGVbTSr/xbN
         8GmrCedRFKAwsGczEzrug5Z6FHWLEIFaK2IwZ6TAZadzBYtYx/FJmJN6orQ/xOQtL7PH
         Spe81/e/NEQqOsMLSXSV3Eii91kC5b9Fa2z2hCZTj7nDFTFCSMtspjfe3nF+vs82j7Xm
         4oQcjip8ywvJj+TrCnv/jT24shqUnO/LLpne7lFZcrdyjJQ5A3eYo8XAe/MWSuAWvAG5
         bROYTg7SBnEN9ZDeWBW1k2niXennJI1FMs6zw8ttGhi2084UHtjPjO463ejt9FsOn6mB
         aQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964981; x=1794569781;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYxQSy8dLCKYWceK3MqyY+vv/0VurjYeK94bOEbIJSA=;
        b=dYw1G3dpTw7bL3noALsndrWRZnPrbj/ULgtP7E253xFT52VF8/5oV4DPHvx2uGCA2l
         LRS0gx7TSJz8YUud4OrY24A5ijXDe3hFkZdzUiKZV1O8XHFzDr2ffsjNtITwzaAue6wk
         4fDVN4BmOVY5l6tQiPFABjuty1PHJTxRt3ZZk14PokJb59MlhzXkRLeYq8kIFaK19MNX
         4LDiXG4A59VNjNZ6WM70HCgu+nyLfaXIbXZSvcg8WnwldGGIwUyGdTZZeLReIULO1VGN
         iv2aoMUNk3svidmk8OX95yeUnSGTn1MSYG8zWp8zSqGb/mOc19h/hBdvKs/IDNtGn7Ek
         QWgg==
X-Forwarded-Encrypted: i=1; AL+hErFtQW5AIXZLeZMOiDMxJRizPoVfUgi9ODBoxUVixtPd3Q/+UU04vRDwyHWvnI9A9tf21hXm2UQOqsdXAcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ueBbTCaDp3JZVQIfg0376A+CcgBN50ItbyI9UpDKygE+Oo7b+
	ISKKqEMu7UtEGKrB46fMcV+3g9OH8u9QvpcNGOUHf7AaISFvkpIYTntm
X-Gm-Gg: AYBFou1eAd07anmJxpiXr9YUYpslBtMtDeRkJ2bCbzFr3QQgyjAMnJ2NG/oTXGEwFhH
	YBD/b/qRINpBb7LGfeERmHcvjEF9c1t1cJqSHnrABe6igEaRtYKW4SeJtGIglxBH4ZcJnCeKioZ
	5BN9dVKrSGYb2z/KuF4GjSVeOarZMwhShWEjIxSZwShdVkIKmFU7zRXAMceeCL/RQf+GbdA0Wab
	rcihZmo1k8N0u2syhJrXXfsUjQ1liIr2A8F09Pf0uFBnV14AZ/uCiD66YGRazVv7DUCcWI+WD5b
	kSChHc38J7mHl8YOfi8F9oL/8vlhDKFD2b6A+biKnAoWK0VvB2KQH3+ELyOWpQ4PtNwMsy+yjyr
	1eF1/GE4ALa5dXiflFqipWj9k3OQ1gLoaSVsaMXHPLPnSrT84MYDgF7WthkJifg65Bw8Ro4jyRo
	K+xJBcLp4j5Gb9Bfi4Xc+bMCB0qEF6iYiYvdLRS6bUr62lZHd5Cob/2mM2r1lABpwsgVyi+fSEj
	o+9Q5WY0p5sv9obPhecpbvoDiUS3jdD5hmLfn8rc3gnaNrpl5kNRxKHhLKLcmE+XLAtBskiM0Za
	rJ4MVs87sVDlD/3Ebnk9OAmPyGVzvmyfalAW55cO1LL0fZwb0iz4LCl5VcKKWFnFs911q96nB71
	UE4WsuwCj9bc/lSHrHzo/nh+G
X-Received: by 2002:a17:90b:388d:b0:3a8:9db2:a59 with SMTP id 98e67ed59e1d1-3b0db013fbamr3325222a91.0.1793964981081;
        Fri, 06 Nov 2026 03:36:21 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:19 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 07/13] docs/zh_TW: process: add deprecated.rst translation
Date: Fri,  6 Nov 2026 19:35:38 +0800
Message-ID: <20261106113545.708896-8-chenyou910331@gmail.com>
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

Translate Documentation/process/deprecated.rst into Traditional Chinese
from the current English text, including the kmalloc_obj() family
section and the rewritten strncpy() section that lists its
replacements.  There is no zh_CN translation of this file to consult.

The note in the allocator section links to the "Zero-length and
one-element arrays" section by its HTML anchor; since the translated
heading no longer produces that anchor, add an explicit
zero-length-and-one-element-arrays target before the section.

List the new file in the toctree of process/index.rst, under "Other
material" as in the English index, and drop it from the TODOList.

update to commit 079a028d6327 ("string: Remove strncpy() from the
kernel")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/deprecated.rst | 363 ++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |   6 +-
 2 files changed, 368 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/deprecated.rst

diff --git a/Documentation/translations/zh_TW/process/deprecated.rst b/Documentation/translations/zh_TW/process/deprecated.rst
new file mode 100644
index 000000000000..7a5e42a12041
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/deprecated.rst
@@ -0,0 +1,363 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/deprecated.rst
+
+.. _tw_deprecated:
+
+======================================
+已棄用的介面、語言特性、屬性與慣例
+======================================
+
+在理想的世界裡，我們可以在單一開發週期內，把某個已棄用 API 的所有使用處
+都轉換成新的 API，並完全移除舊的 API。然而，由於核心的規模、維護者的層級
+架構以及時程等因素，這類轉換並不總是能一次完成。這表示在移除舊用法的同時，
+新的用法可能會偷偷混進核心，只會讓移除該 API 的工作量越來越大。為了讓開發者
+了解哪些東西已被棄用以及原因，我們建立了這份清單；當有人提議把已棄用的東西
+納入核心時，可以引用這份清單。
+
+__deprecated
+------------
+雖然這個屬性確實會在視覺上把介面標示為已棄用，但它 `在建置時已不再產生警告
+<https://git.kernel.org/linus/771c035372a036f83353eef46dbb829780330234>`_，
+因為核心的長期目標之一是在建置時不產生任何警告，而且實際上也沒有人在著手
+移除這些已棄用的介面。雖然在標頭檔中使用 `__deprecated` 來標註舊的 API
+是不錯的做法，但這並不是完整的解決方案。這類介面必須從核心中完全移除，
+或者加入這份檔案，以勸阻其他人未來再使用它們。
+
+BUG() 和 BUG_ON()
+-----------------
+請改用 WARN() 和 WARN_ON()，並盡可能妥善地處理這種「不可能發生」的錯誤
+狀況。雖然 BUG() 系列 API 最初是設計成「不可能發生的情況」的斷言，並「安全
+地」終止核心執行緒，但事實證明它們的風險實在太高。（例如：「鎖需要以什麼
+順序釋放？各種狀態都已經恢復了嗎？」）使用 BUG() 經常會讓系統變得不穩定或
+完全崩潰，使得除錯甚至取得可用的當機報告都變得不可能。Linus 對此有 `非常強烈
+<https://lore.kernel.org/lkml/CA+55aFy6jNLsywVYdGp83AMrXBo_P-pkjkphPGrO=82SPKCpLQ@mail.gmail.com/>`_
+的 `看法
+<https://lore.kernel.org/lkml/CAHk-=whDHsbK3HTOpTF=ue_o04onRwTEaK_ZoJp_fjbqq4+=Jw@mail.gmail.com/>`_。
+
+請注意，WARN() 系列只應該用於「預期不會執行到」的情況。如果要對「可能執行
+到但不希望發生」的情況發出警告，請使用 pr_warn() 系列函式。系統擁有者可能
+設定了 *panic_on_warn* sysctl，以確保系統在遇到「不可能執行到」的狀況時不會
+繼續執行。（例如，請參考 `這個
+<https://git.kernel.org/linus/d4689846881d160a4d12a514e991a740bcb5d65a>`_
+之類的 commit。）
+
+在配置函式的參數中直接進行算術運算
+----------------------------------
+動態的大小計算（尤其是乘法）不應該在記憶體配置函式（或類似函式）的參數中
+進行，因為有溢位的風險。這可能導致數值繞回（wrap around），使實際配置的
+空間比呼叫者預期的還小。使用這些配置出來的空間，可能導致堆積（heap）記憶體
+的線性溢位以及其他異常行為。（一個例外是字面常數值，此時編譯器可以在可能
+溢位時發出警告。不過在這些情況下，比較好的做法仍然是依照下面的建議重構程式
+碼，以避免直接進行算術運算。）
+
+例如，不要像這樣使用 ``count * size`` 作為參數::
+
+	foo = kmalloc(count * size, GFP_KERNEL);
+
+而應該使用配置函式的雙因子形式::
+
+	foo = kmalloc_array(count, size, GFP_KERNEL);
+
+具體來說，kmalloc() 可以換成 kmalloc_array()，kzalloc() 可以換成
+kcalloc()。
+
+如果沒有可用的雙因子形式，就應該使用溢位時會飽和（saturate-on-overflow）的
+輔助函式::
+
+	bar = dma_alloc_coherent(dev, array_size(count, size), &dma, GFP_KERNEL);
+
+另一個應避免的常見情況，是計算尾端帶有其他結構陣列的結構大小，例如::
+
+	header = kzalloc(sizeof(*header) + count * sizeof(*header->item),
+			 GFP_KERNEL);
+
+請改用輔助函式::
+
+	header = kzalloc(struct_size(header, item, count), GFP_KERNEL);
+
+.. note:: 如果你在尾端陣列成員為零長度陣列或單元素陣列的結構上使用
+        struct_size()，請重構這類陣列的用法，改用 `彈性陣列成員
+        <#zero-length-and-one-element-arrays>`_。
+
+其他計算請組合使用 size_mul()、size_add() 和 size_sub() 輔助函式。例如
+以下這種情況::
+
+	foo = krealloc(current_size + chunk_size * (count - 3), GFP_KERNEL);
+
+請改用輔助函式::
+
+	foo = krealloc(size_add(current_size,
+				size_mul(chunk_size,
+					 size_sub(count, 3))), GFP_KERNEL);
+
+更多細節請參考 array3_size() 和 flex_array_size()，以及相關的
+check_mul_overflow()、check_add_overflow()、check_sub_overflow() 和
+check_shl_overflow() 系列函式。
+
+simple_strtol()、simple_strtoll()、simple_strtoul()、simple_strtoull()
+----------------------------------------------------------------------
+simple_strtol()、simple_strtoll()、simple_strtoul() 和 simple_strtoull()
+函式會刻意忽略溢位，這可能讓呼叫者得到預期之外的結果。對應的 kstrtol()、
+kstrtoll()、kstrtoul() 和 kstrtoull() 函式通常是正確的替代品，但請注意，
+它們要求字串必須以 NUL 或換行字元結尾。
+
+strcpy()
+--------
+strcpy() 不會對目的緩衝區做任何邊界檢查。這可能導致超出緩衝區結尾的線性溢位，
+進而造成各種異常行為。雖然 `CONFIG_FORTIFY_SOURCE=y` 和各種編譯器旗標有助於
+降低使用這個函式的風險，但沒有任何好理由再新增這個函式的用法。安全的替代品
+是 strscpy()，但凡是用到 strcpy() 回傳值的地方都必須小心處理，因為 strscpy()
+回傳的不是指向目的緩衝區的指標，而是複製的非 NUL 位元組數（截斷時則回傳負的
+errno）。
+
+strncpy()
+---------
+strncpy() 已經從核心中移除。所有原本的呼叫者都已改用更安全的替代函式。
+
+strncpy() 不保證目的緩衝區會以 NUL 結尾，因而導致線性讀取溢位和其他異常行為。
+它也會無條件地以 NUL 填補目的緩衝區，對只使用以 NUL 結尾字串的呼叫者來說，
+這是不必要的效能損失。由於它具有多種不同的行為，從這個 API 很難判斷作者進行
+複製時的真正意圖。
+
+strncpy() 的替代函式如下：
+
+- strscpy()：目的緩衝區必須以 NUL 結尾時使用。
+- strscpy_pad()：目的緩衝區必須以 NUL 結尾並以零填補時使用（例如跨越權限
+  邊界的結構）。
+- memtostr()：來源是不以 NUL 結尾的固定寬度資料、目的緩衝區需以 NUL 結尾時
+  使用（來源需加上 `__nonstring` 屬性）。
+- memtostr_pad()：同上，但另外以零填補。
+- strtomem()：目的是不以 NUL 結尾的固定寬度緩衝區時使用，目的緩衝區需加上
+  `__nonstring` 屬性。
+- strtomem_pad()：目的緩衝區不以 NUL 結尾且也需要以零填補時使用。
+- memcpy_and_pad()：從可能沒有結尾字元的來源進行有界複製，且目的緩衝區大小
+  是執行期數值時使用。
+
+strlcpy()
+---------
+strlcpy() 會先讀取整個來源緩衝區（因為它的回傳值應該與 strlen() 的回傳值
+相同）。這次讀取可能會超出目的緩衝區的大小限制。這既沒有效率，而且當來源
+字串不以 NUL 結尾時，還可能導致線性讀取溢位。安全的替代品是 strscpy()，但
+凡是用到 strlcpy() 回傳值的地方都必須小心處理，因為 strscpy() 在截斷時會
+回傳負的 errno 值。
+
+%p 格式指定符
+-------------
+傳統上，在格式字串中使用 "%p" 經常會造成位址在 dmesg、proc、sysfs 等處外洩
+的漏洞。為了避免這些漏洞被利用，核心中所有 "%p" 的用法現在都會印出雜湊值，
+使其無法用於定址。不應該在核心中新增 "%p" 的用法。對於程式碼（text）位址，
+使用 "%pS" 可能比較好，因為它會改為印出更有用的符號名稱。至於幾乎其他所有
+情況，就乾脆不要加入 "%p"。
+
+轉述 Linus 目前的 `指導原則 <https://lore.kernel.org/lkml/CA+55aFwQEd_d40g4mUCSsVRZzrFPUJt74vc6PPpb675hYNXcKw@mail.gmail.com/>`_：
+
+- 如果雜湊過的 "%p" 值沒有意義，請先問問自己指標本身是否重要。也許應該把它
+  整個移除？
+- 如果你真的認為真實的指標值很重要，那麼為什麼某些系統狀態或使用者權限等級
+  會被視為「特殊」？如果你認為自己能（在註解和 commit 日誌中）提出足以經得起
+  Linus 檢驗的理由，也許可以使用 "%px"，同時確保權限設定合理。
+
+如果你在除錯時遇到 "%p" 雜湊造成的問題，可以暫時以除錯旗標
+"`no_hash_pointers
+<https://git.kernel.org/linus/5ead723a20e0447bc7db33dc3070b420e5f80aa6>`_"
+開機。
+
+可變長度陣列（VLA）
+-------------------
+使用堆疊上的 VLA 所產生的機器碼，比靜態大小的堆疊陣列差得多。雖然這些不容
+忽視的 `效能問題 <https://git.kernel.org/linus/02361bc77888>`_ 已足以成為
+消除 VLA 的理由，但它們同時也是安全風險。堆疊陣列的動態成長可能超出堆疊區段
+中剩餘的記憶體。這可能導致當機，可能覆寫堆疊尾端的敏感內容（在沒有啟用
+`CONFIG_THREAD_INFO_IN_TASK=y` 建置時），或覆寫與堆疊相鄰的記憶體（在沒有
+啟用 `CONFIG_VMAP_STACK=y` 建置時）。
+
+隱式的 switch case 貫穿（fall-through）
+---------------------------------------
+C 語言允許在某個 case 結尾缺少 "break" 敘述時，貫穿到下一個 case。然而這會
+讓程式碼產生歧義，因為缺少 break 究竟是刻意的還是 bug，並不總是那麼清楚。
+例如，光看程式碼並無法明顯看出 `STATE_ONE` 是否刻意設計成貫穿到
+`STATE_TWO`::
+
+	switch (value) {
+	case STATE_ONE:
+		do_something();
+	case STATE_TWO:
+		do_other();
+		break;
+	default:
+		WARN("unknown state");
+	}
+
+由於已經出現過一長串 `因缺少 "break" 敘述而造成的缺陷
+<https://cwe.mitre.org/data/definitions/484.html>`_，我們不再允許隱式貫穿。
+為了標示刻意的貫穿情況，我們採用了一個名為 "fallthrough" 的偽關鍵字巨集，
+它會展開成 gcc 的擴充語法 `__attribute__((__fallthrough__))
+<https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html>`_。
+（等到 C17/C18 的 `[[fallthrough]]` 語法普遍獲得 C 編譯器、靜態分析器和
+IDE 支援時，我們就可以改用該語法來實作這個巨集偽關鍵字。）
+
+所有 switch/case 區塊都必須以下列其中之一結尾：
+
+* break;
+* fallthrough;
+* continue;
+* goto <label>;
+* return [expression];
+
+.. _zero-length-and-one-element-arrays:
+
+零長度與單元素陣列
+------------------
+核心中經常需要一種方式，來宣告結構尾端帶有一組大小動態決定的元素。在這些
+情況下，核心程式碼應該一律使用 `「彈性陣列成員」（flexible array members）
+<https://en.wikipedia.org/wiki/Flexible_array_member>`_。不應該再使用舊式的
+單元素或零長度陣列。
+
+在較舊的 C 程式碼中，大小動態決定的尾端元素是透過在結構結尾宣告一個單元素
+陣列來實作的::
+
+        struct something {
+                size_t count;
+                struct foo items[1];
+        };
+
+這導致透過 sizeof() 計算大小時很容易出錯（必須扣掉那一個尾端元素的大小，
+才能得到「標頭」的正確大小）。為了避免這類大小問題，後來引入了一個
+`GNU C 擴充 <https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html>`_，
+允許使用零長度陣列::
+
+        struct something {
+                size_t count;
+                struct foo items[0];
+        };
+
+但這又導致了其他問題，而且並未解決兩種寫法共有的一些問題，例如無法偵測到
+這種陣列被意外地 _沒有_ 放在結構的結尾（這可能直接發生，也可能在這種結構
+位於 union、結構中的結構等情況下發生）。
+
+C99 引入了「彈性陣列成員」，它的陣列宣告完全不帶數字大小::
+
+        struct something {
+                size_t count;
+                struct foo items[];
+        };
+
+這就是核心預期宣告大小動態決定的尾端元素的方式。它讓編譯器能在彈性陣列不是
+結構中最後一個成員時產生錯誤，有助於防止某些 `未定義行為
+<https://git.kernel.org/linus/76497732932f15e7323dc805e8ea8dc11bb587cf>`_
+的缺陷被不小心引入程式碼庫。它也讓編譯器能正確分析陣列大小（透過 sizeof()、
+`CONFIG_FORTIFY_SOURCE` 和 `CONFIG_UBSAN_BOUNDS`）。舉例來說，沒有任何機制
+會警告我們，以下對零長度陣列套用 sizeof() 運算子的結果永遠是零::
+
+        struct something {
+                size_t count;
+                struct foo items[0];
+        };
+
+        struct something *instance;
+
+        instance = kmalloc(struct_size(instance, items, count), GFP_KERNEL);
+        instance->count = count;
+
+        size = sizeof(instance->items) * instance->count;
+        memcpy(instance->items, source, size);
+
+在上面程式碼的最後一行，``size`` 的值結果是 ``zero``，但有人可能以為它代表
+剛剛為尾端陣列 ``items`` 配置的動態記憶體的總位元組數。以下是這個問題的幾個
+例子：`連結 1
+<https://git.kernel.org/linus/f2cd32a443da694ac4e28fbf4ac6f9d5cc63a539>`_、
+`連結 2
+<https://git.kernel.org/linus/ab91c2a89f86be2898cee208d492816ec238b2cf>`_。
+相對地，`彈性陣列成員屬於不完整型別，因此不能套用 sizeof() 運算子
+<https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html>`_，所以任何對這類運算子
+的誤用都會在建置時立刻被發現。
+
+至於單元素陣列，必須特別留意 `這種陣列佔用的空間至少與該型別的單一物件相同
+<https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html>`_，
+因此它們會計入外層結構的大小。每當有人要為含有這種陣列成員的結構計算需要
+配置的動態記憶體總大小時，就很容易出錯::
+
+        struct something {
+                size_t count;
+                struct foo items[1];
+        };
+
+        struct something *instance;
+
+        instance = kmalloc(struct_size(instance, items, count - 1), GFP_KERNEL);
+        instance->count = count;
+
+        size = sizeof(instance->items) * instance->count;
+        memcpy(instance->items, source, size);
+
+在上面的例子中，使用 struct_size() 輔助函式時必須記得計算 ``count - 1``，
+否則就會——不小心地——多配置一個 ``items`` 物件的記憶體。最乾淨、最不容易
+出錯的實作方式，是使用 `彈性陣列成員`，並搭配 struct_size() 和
+flex_array_size() 輔助函式::
+
+        struct something {
+                size_t count;
+                struct foo items[];
+        };
+
+        struct something *instance;
+
+        instance = kmalloc(struct_size(instance, items, count), GFP_KERNEL);
+        instance->count = count;
+
+        memcpy(instance->items, source, flex_array_size(instance, items, instance->count));
+
+有兩種特殊的替換情況必須使用 DECLARE_FLEX_ARRAY() 輔助巨集。（請注意，在
+UAPI 標頭檔中使用時，它的名稱是 __DECLARE_FLEX_ARRAY()。）這兩種情況是：
+彈性陣列單獨存在於結構中，或是 union 的一部分。C99 規格不允許這兩種用法，
+但並沒有技術上的理由（從這類陣列在這些地方的既有用法，以及
+DECLARE_FLEX_ARRAY() 所用的變通方法都可以看出來）。例如，要轉換以下程式碼::
+
+	struct something {
+		...
+		union {
+			struct type1 one[0];
+			struct type2 two[0];
+		};
+	};
+
+就必須使用這個輔助巨集::
+
+	struct something {
+		...
+		union {
+			DECLARE_FLEX_ARRAY(struct type1, one);
+			DECLARE_FLEX_ARRAY(struct type2, two);
+		};
+	};
+
+直接撰寫的結構物件 kmalloc 指派
+-------------------------------
+直接撰寫 kmalloc() 系列的配置指派，會讓核心（以及編譯器）無法檢查被指派
+變數的型別，因而限制了相關的自我檢查（introspection），而這些檢查原本可能
+有助於對齊、繞回（wrap-around）或額外的強化措施。kmalloc_obj() 系列巨集
+提供了這種自我檢查，可用於單一物件、陣列和彈性物件配置的常見程式碼模式。
+例如，下列直接撰寫的指派::
+
+	ptr = kmalloc(sizeof(*ptr), gfp);
+	ptr = kzalloc(sizeof(*ptr), gfp);
+	ptr = kmalloc_array(count, sizeof(*ptr), gfp);
+	ptr = kcalloc(count, sizeof(*ptr), gfp);
+	ptr = kmalloc(struct_size(ptr, flex_member, count), gfp);
+	ptr = kmalloc(sizeof(struct foo), gfp);
+
+分別改寫成::
+
+	ptr = kmalloc_obj(*ptr [, gfp] );
+	ptr = kzalloc_obj(*ptr [, gfp] );
+	ptr = kmalloc_objs(*ptr, count [, gfp] );
+	ptr = kzalloc_objs(*ptr, count [, gfp] );
+	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
+	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
+
+gfp 參數是可選的，預設值為 GFP_KERNEL。如果 `ptr->flex_member` 有以
+__counted_by() 標註，那麼當 `count` 大於與 `flex_member` 相關聯的計數器
+成員所能儲存的最大值時，配置就會自動失敗。
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index e73d78362315..d7d947d33cf5 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -113,10 +113,14 @@ TODOList:
 
 這裡是一些大多數開發者會感興趣的其他社群指南：
 
+.. toctree::
+   :maxdepth: 1
+
+   deprecated
+
 TODOList:
 
 * kernel-docs
-* deprecated
 
 .. only::  subproject and html
 
-- 
2.43.0

