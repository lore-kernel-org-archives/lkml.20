Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964784;
	b=ugPx9LDJvRQLAwkEcaqR1kGv8yDGaNMmNod7dqCaoW/sJdU+aN9caMnx+Lb7MRsDxzg+
	 MqZKNWmMm/YwLFu38JgVyDRHOhdE+8DUm6etT14DTJP1HAuZE1AwQMzBb1k5HyJ68gfjD
	 IW34KYiyaQ8i0MiF2/jdz7kNgKlX8DsL5qWR5P2dsXMjMZKKH4P5hDDn1QI4Ei082HwJO
	 IahUcEHKiluhAHsfxaC2TRUgMGTz/1h7a3IUZdVhtMhgTsqLHXa3F80PB9wmmk4dzngiq
	 sG9qnaGz2b82LlDuye/APp4NIxrEWTdn/ZkI3DkfTM8C50NwQK14yvWHXpNVGHaD3eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sGxQMhreNpJZXCRi33dCNvWyL0pHBrE/F0jfngcCQpM=;
	b=YAMYXp/2xfUT/GzboeQDDQyDH4vO4SIfWvPj0g31FXJUVGsEPXGAWJYNIG7WmBRll0ex
	 jiPyIFJ626A19/ILF3+4F6RtM6no5uUImdqpjx9zGYMNe2bS6OlSOcHIq9DTBd0RryzbL
	 tO0XJ3FFXcKTdcEScWW7BNsPfgiRp91aQFw/blx9jaRgMSoPsmqsY6tPlM0+tZLTMRZTx
	 ve2vb3nKW0+enVa3TjvGHzuO7/UQAupjkXCnZthdioTpGsJadiYrWKR2RnG5RJODs4beb
	 1DGG9sDAnBHtctzL1WSJ66IM6VVmseNqcxyx5qbZAPOkTRIn/kZNYNz8n+UZrxp8ohg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrfe4bqQ;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67130606F8F2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67130606F8F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrfe4bqQ
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso87824a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964784; x=1794569584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sGxQMhreNpJZXCRi33dCNvWyL0pHBrE/F0jfngcCQpM=;
        b=nrfe4bqQVKLPo36jgDEwzCobuNbdk2zIP76VPk0vSnCd59glgDta4utnEAXajELtTd
         jfKipN7E0YDVw7PaTmxkt8W+F8D5RwwNaI4TU9H+vuHRpLETptgans9Nxh0LX2dS05Gf
         uXqIBzqOSr3nMeIxtLLntSHxNJ/cvbJicoKa1du5KiEsbKVwL+Xs3T5Mln06UvhKWuLl
         hYmcotexXjfCp1e0WAJIOhb2gvJh0oeFiwYxzoKq8u6GoMYhbSCPhdj7jRTECwCXroiB
         znNNQfP+vDbz1+MWbJTz5e0mZPFkorsM2pFamCWB+9v2hyRMvpI2Y9ZIHbXGat5YnZXZ
         b4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964784; x=1794569584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGxQMhreNpJZXCRi33dCNvWyL0pHBrE/F0jfngcCQpM=;
        b=VhSYuj1cjdLvkSBl3utURynmTOSxkGJpLlwDZO1eULOql0VdkTr3vLjk+EvoUBJqvw
         brxFDPEykvWGtH2/dm3KMv5NuSoCk4+xKGyl8fPmMz36gVuf+J3Rtvr7RW3e/yYbDMnZ
         /XBve8VVC8zh/R8kjJsPfW8Yo2ls6W3UQ4z/VvVGDma3sYhVI+i7fxIyui7Q6FYdWuMr
         NzHd3KcFuTY585bTFrjlJN61k+o8r7yK5oGfsTsHhF/jBYebTtXZ5+ueShecHJc0EOG5
         SzH6rmJQa0UlukZIITwyR4lh4XBTyEby9Y8l871sX8/1AxiJjNp3UWCQ2Fye6gyKZK/0
         1SsA==
X-Forwarded-Encrypted: i=1; AL+hErGmtn0fkZtKHAV2PM1EuhKbM1jHi4f7a/KeaI5a5RJ07+WtqOVmR1y0elVgZe6YKDnEibaDWSUohHtXqYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RRS2rEIH4ZhUwfOWataNbNmWVQ/ZhGZqkf2F/HZKycq26tCEX
	/taglXgmNtjvmQVOSPAJeJFDeFH4ukxkTqCrkZxQ2OiV1RiItl5EzZKy
X-Gm-Gg: AYBFou3aQq8ikt9Ddij1ndGGxjGMu0amy/ay6WJS/l4RWtNSzOGXSBxOJtRa5UMv8ng
	rKfuPogWpMJy8rhSEFMLEG9aPSwlM5KD0xkEYFn2H7RySsQZ6vnEuX0ba8GsdHBbGe5HSX+ksth
	RZxTxpqZitLziXq3+xY0NzWomaPzuBu0XnXKnNzKEKNR8sulaFPKUXHqFGiTrZV4OS9/Vr023Dn
	ERwrEmMjmn9yX4G13zTwRjxHAwl4aeASep6Rdz+N2EF1dVTd4nuQrtCM+f10bzobyW9/Vnepf+Z
	7sw7LjOTnDhMAZoEu7CbGZUPPR8wq9dhqx6gPlO/dBQeOP14+cx3Z7AFzlNhuWjWj5Wp0Vg2Roi
	RtD0PadMHsw3HcZu7zLHAr9FDvmkCl9DkCJhGxkSiiMnSSiua22L2he03/AeZhuj3ju95jkpj8H
	cy62bEwJTl7TtBOWkLq8gSF7PjyzcsWQXpu153zgGHKPLZPRcoKRXcai6t8qV22JCJIkZw50tnU
	0vrzsBQ50ZNtRFQoCWpNue7yZkGHVMzGZiCgQbV0e1w9n4hAY+6Nqw40Qt4a8z6nlURT2FBfkUu
	00ae7GUwSwVN2WlB5H+6fbxud9Mm3hPFVgiHzD42ttEo8QPqRNGdX/urR0VxMBI7jrgqFKsjmJO
	gKdsNdFbfJ/a/tIlesit4RgjO2Ur7o6W9sGTEyUSZWhgDaQ==
X-Received: by 2002:a17:90b:4a12:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b0db038327mr3607404a91.0.1793964783534;
        Fri, 06 Nov 2026 03:33:03 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:33:01 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 22/25] docs/zh_TW: process: sync license-rules.rst with the English original
Date: Fri,  6 Nov 2026 19:31:37 +0800
Message-ID: <20261106113142.706783-23-chenyou910331@gmail.com>
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

The previous update was marked as synced to
commit ebf1bafd0907 ("LICENSES: Explicitly allow
SPDX-FileCopyrightText"), but the content still predated several earlier
English changes.  Bring the translation in line with the current English
text:

- point the deprecated licenses at LICENSES/deprecated/ and use ISC and
  GPL-1.0 as the examples, following commit 6132c37ca543 ("docs: Don't
  reference the ZLib license in license-rules.rst") and
  commit 62be257e986d ("LICENSES: Rename other to deprecated")
- add the missing "Dual Licensing Only" section from
  commit 8ea8814fcdcb ("LICENSES: Clearly mark dual license only
  licenses") and renumber the exceptions section
- restore the Linux-syscall-note example and the "/\* \*/" literal
- fix the mistranslated purpose of the MODULE_LICENSE() tag and the
  numbered list markup of the "Placement" item

Also localize a few remaining mainland terms (表達式→表示式,
通信→通訊, 擴展→擴充, 行業→產業, 當前→目前, 導入→匯入).

update to commit ebf1bafd0907 ("LICENSES: Explicitly allow
SPDX-FileCopyrightText")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/license-rules.rst           | 86 ++++++++++++++-----
 1 file changed, 65 insertions(+), 21 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/license-rules.rst b/Documentation/translations/zh_TW/process/license-rules.rst
index 0a4558b7fc76..abc1f7e40d32 100644
--- a/Documentation/translations/zh_TW/process/license-rules.rst
+++ b/Documentation/translations/zh_TW/process/license-rules.rst
@@ -31,7 +31,7 @@ MIT等許可。
 
 使用者空間API（UAPI）標頭檔描述了使用者空間程式與核心的介面，這是一種特殊
 情況。根據核心COPYING檔案中的註解，syscall介面是一個明確的邊界，它不會將
-GPL要求擴展到任何使用它與核心通信的軟體。由於UAPI標頭檔必須包含在建立在
+GPL要求擴充到任何使用它與核心通訊的軟體。由於UAPI標頭檔必須包含在建立在
 Linux核心上執行的可執行檔案的任何原始檔中，因此此例外必須記錄在特別的許可
 證表述中。
 
@@ -41,7 +41,7 @@ Linux核心上執行的可執行檔案的任何原始檔中，因此此例外必
 
 樣板文本的替代方法是在每個原始檔中使用軟體套件資料交換（SPDX）許可證識別碼。
 SPDX許可證識別碼是機器可解析的，並且是用於提供檔案內容的許可證的精確縮寫。
-SPDX許可證識別碼由Linux 基金會的SPDX 工作組管理，並得到了整個行業，工具
+SPDX許可證識別碼由Linux 基金會的SPDX 工作組管理，並得到了整個產業，工具
 供應商和法律團隊的合作夥伴的一致同意。有關詳細資訊，請參閱
 https://spdx.org/
 
@@ -53,7 +53,7 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 許可識別碼語法
 --------------
 
-1.安置:
+1. 安置:
 
    核心檔案中的SPDX許可證識別碼應添加到可包含註解的檔案中的第一行。對於大多
    數檔案，這是第一行，除了那些在第一行中需要'#!PATH_TO_INTERPRETER'的腳本。
@@ -76,7 +76,7 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
       .dts{i}:	// SPDX-License-Identifier: <SPDX License Expression>
 
    如果特定工具無法處理標準註解樣式，則應使用工具接受的相應註解機制。這是在
-   C 標頭檔中使用“/\*\*/”樣式註解的原因。過去在使用產生的.lds檔案中觀察到
+   C 標頭檔中使用「/\* \*/」樣式註解的原因。過去在使用產生的.lds檔案中觀察到
    建置被破壞，其中'ld'無法解析C++註解。現在已經解決了這個問題，但仍然有較
    舊的組譯器工具無法處理C++樣式的註解。
 
@@ -84,9 +84,9 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
 3. 句法:
 
-   <SPDX許可證表達式>是SPDX許可證列表中的SPDX短格式許可證識別碼，或者在許可
+   <SPDX許可證表示式>是SPDX許可證列表中的SPDX短格式許可證識別碼，或者在許可
    證例外適用時由“WITH”分隔的兩個SPDX短格式許可證識別碼的組合。當應用多個許
-   可證時，表達式由分隔子表達式的關鍵字“AND”，“OR”組成，並由“（”，“）”包圍。
+   可證時，表示式由分隔子表示式的關鍵字“AND”，“OR”組成，並由“（”，“）”包圍。
 
    帶有“或更高”選項的[L]GPL等許可證的許可證識別碼透過使用“+”來表示“或更高”
    選項來建置。::
@@ -94,7 +94,7 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
       // SPDX-License-Identifier: GPL-2.0+
       // SPDX-License-Identifier: LGPL-2.1+
 
-   當需要修正的許可證時，應使用WITH。 例如，linux核心UAPI檔案使用表達式::
+   當需要修正的許可證時，應使用WITH。 例如，linux核心UAPI檔案使用表示式::
 
       // SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
       // SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note
@@ -112,7 +112,7 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
       // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 
-   核心中雙許可檔案中許可表達式的範例::
+   核心中雙許可檔案中許可表示式的範例::
 
       // SPDX-License-Identifier: GPL-2.0 OR MIT
       // SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
@@ -134,7 +134,7 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 許可識別碼
 ----------
 
-當前使用的許可證以及添加到核心的程式碼許可證可以分解為：
+目前使用的許可證以及添加到核心的程式碼許可證可以分解為：
 
 1. _`優先許可`:
 
@@ -209,24 +209,25 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
 |
 
-2. 不推薦的許可證:
+2. 已棄用的許可證:
 
-   這些許可證只應用於現有程式碼或從其他專案導入程式碼。這些許可證在核心目錄::
+   這些許可證只應用於現有程式碼或從其他專案匯入程式碼。這些許可證位於核心
+   原始程式碼樹的目錄::
 
-      LICENSES/other/
+      LICENSES/deprecated/
 
    此目錄中的檔案包含完整的許可證文本和 `元標記`_ 。檔名與SPDX許可證識別碼
    相同，後者應用於原始檔中的許可證。
 
    例如::
 
-      LICENSES/other/ISC
+      LICENSES/deprecated/ISC
 
-   包含國際系統聯合許可文本和所需的元標籤::
+   包含 Internet Systems Consortium 許可證文本和所需的元標籤::
 
-      LICENSES/other/ZLib
+      LICENSES/deprecated/GPL-1.0
 
-   包含ZLIB許可文本和所需的元標籤.
+   包含 GPL 版本 1 許可證文本和所需的元標籤。
 
    元標籤:
 
@@ -249,7 +250,49 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
 |
 
-3. _`例外`:
+3. 僅限雙重許可
+
+   這些許可證只應用於對程式碼進行雙重許可，作為優先許可之外的另一個許可證。
+   這些許可證位於核心原始程式碼樹的目錄::
+
+      LICENSES/dual/
+
+   此目錄中的檔案包含完整的許可證文本和 `元標記`_ 。檔名與 SPDX 許可證識別碼
+   相同，後者應用於原始檔中的許可證。
+
+   例如::
+
+      LICENSES/dual/MPL-1.1
+
+   包含 Mozilla Public License 版本 1.1 許可證文本和所需的元標籤::
+
+      LICENSES/dual/Apache-2.0
+
+   包含 Apache License 版本 2.0 許可證文本和所需的元標籤。
+
+   元標籤:
+
+   「其他」許可證的元標籤要求與 `優先許可`_ 的要求相同。
+
+   檔案格式範例::
+
+      Valid-License-Identifier: MPL-1.1
+      SPDX-URL: https://spdx.org/licenses/MPL-1.1.html
+      Usage-Guide:
+        Do NOT use. The MPL-1.1 is not GPL2 compatible. It may only be used for
+        dual-licensed files where the other license is GPL2 compatible.
+        If you end up using this it MUST be used together with a GPL2 compatible
+        license using "OR".
+        To use the Mozilla Public License version 1.1 put the following SPDX
+        tag/value pair into a comment according to the placement guidelines in
+        the licensing rules documentation:
+      SPDX-License-Identifier: MPL-1.1
+      License-Text:
+        Full license text
+
+|
+
+4. _`例外`:
 
    某些許可證可以修改，並允許原始許可證不具有的某些例外權利。這些例外在
    核心目錄::
@@ -262,8 +305,9 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
       LICENSES/exceptions/Linux-syscall-note
 
-   包含Linux核心的COPYING檔案中記錄的Linux系統呼叫例外，該檔案用於UAPI
-   標頭檔。例如::
+   包含Linux核心的COPYING檔案中記錄的Linux系統呼叫例外，該例外用於 UAPI
+   標頭檔。例如
+   /\* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note \*/::
 
       LICENSES/exceptions/GCC-exception-2.0
 
@@ -337,8 +381,8 @@ _`模組許可`
    許可證資訊（SPDX-License-Identifier），也不以任何方式表示或確定提供模組
    原始程式碼的確切許可證。
 
-   此標記的唯一目的是提供足夠的資訊，該模組是否是自由軟體或者是核心模組加
-   載器和使用者空間工具的專有模組。
+   此標記的唯一目的是為核心模組載入器和使用者空間工具提供足夠的資訊，以判斷
+   該模組是自由軟體還是專有軟體。
 
    MODULE_LICENSE（）的有效許可證字串是:
 
-- 
2.43.0

