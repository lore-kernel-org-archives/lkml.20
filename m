Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964738;
	b=lpGko4eSWpEhSbClwDOrwWcW/kO9CN01gOrUgXif5i5DWjOB5WwQn8w5kRb/olrsCuEJ
	 17vcTFQRWvKgii/LzOWRDyqHAc8Qcn4gYSBfXn3xLG/FVrtYELzV7e2cK43bsYOTBljLp
	 aAwqcl9/0HhwhV1vC8qR0F9yCH/NqIa1JO7ht4MGXL1RmClkHgv6JMH8I9XeSiYAzfTJO
	 gO5fjNekdMjURKV/Pq+93TOeh1ZWROwJb+OXJmzakP8FB9EL9P3jyjuKY7OoB+nTIPbhQ
	 yLZQEhrYqvixev4XrqRyyvDmokDNwfV4kKZy18dseUS4t9sL3ydMXxpfQYK+OCfhsXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
	b=F5OlA0yOkH4RDOMiZJkrXM+i9qSYWkIFIoY5xb1xefTXnTKKJrkbrT1E8LSiUm0Qvff1
	 /eMr+2jC+dCQppX97g0M2HII0YbYpBNrUnhh8bRh5HGSzpmthf9dNaTDpaCQwPBX9b8jv
	 tF9Snn0zIYEr04DW5TRQnSeSD+AxiTtcqLIEpNcU7mOA3Os+FnBZNtYvKK7AcOuJm8DpM
	 Ul1PR1ffGBq1oFR9HXfNP0OiWlPY9AaJBBrLOLhWZSwyavKa/trUZyYjpTKVpyjO1S/oM
	 /JGnBtq7tmL9y5TdC8GpfNRFeuI5dRoxR5tmSlcTHIKQzPckf5JkMwr8cdfHNpMvZJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kJwoZu+H;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D636606EE8F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D636606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kJwoZu+H
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so61390a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964738; x=1794569538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
        b=kJwoZu+HjDkBSacJhC05iltJrEUk/f8ZNmb0ceH/zJjavAvC0Hhe9E7s1uLcjxCA0n
         PwAB0ru3iX5/wJT5XI9Xbe7DCvN9zhQS1wwWhu0fgXXday23ozgkAhBv2JfeDZa9Ov7f
         1osPZQADPvBX57HN34uUtXXisnG+Nv3N5n8Pc0bhHqjYRRcPD9PBP7R0+shRKvD5Gd8w
         yozVFZJc/4M7XoaHgt47JXt4Hfkl+Fc05I7r26U7yOaGukRxtrIbGeC67yq0YBDk/Faq
         SulorIHZbtXnoqqYiti/duDB8WkxPi3qdAfQoAlkPksQiqbXCWcEm0+4EGzGGK71G/Uh
         sWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964738; x=1794569538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
        b=tEtHDtvNbZhnuTn6FgLLDDR8KGVUHFTxhBszsW2TWuMkRpTITaI84AuR9CdPJ4ry9z
         9law5s1VBBtuZFHwoey/L5frZOX/YhLvnsRvAyBbSmAe0SLWm5D/9fvan19F2L24kl8D
         ifNfmm7QtlLQlXVsC6iCaVBlYUKA3/gc3Q/EdAqZTCD7fYgi6YKg6yNk+YntJ/05Qfwh
         xIqX2oH3wljbIYmvv4t8FEQeiDRyv7sJJKU5hRQGgypvkCjl51wlDl5Ih3kRLH2tQUAM
         vZzUYEvNrdwXmFrtgZLy0L6YdsCmoRbllu1LU52Jk8MUbQrjBBtSNGjzV6Mvz6BrV+qC
         R8nA==
X-Forwarded-Encrypted: i=1; AL+hErEvuBRXSCOPyy6YIjs4nqcyzbwKwVFHai197VihX60yGN8AubNocD4mSLLCmYyvJxz3cBUEVUpuHWYvak4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/viFwhdbT9bWY6FaaXvsIjJFn3gAjh+spNJrwSflVCxwOkusu7
	CF23lMy91CdmyF28QBso4yMejt0vXJHobq+7GQyLODJwNkUfxsqmOwl8
X-Gm-Gg: AYBFou15a8AcWUIV9DVEbM8oCkwwUWbvdpsZj89RRYBGW2mn/9peFSBsnYhFsrzVOPm
	OOyPcYeP/ejHpWpnxQY33StObu0MdYfMnyAj9cc5ppOAa0gXGgxQLlCIAP9HTR64OG3tCamwpZS
	o0tRlGhjHjJtySrg+4TQjQMzfOAquZAOq8jwkSwE99cj0EymlYd2zibGNdesFlR8a193tDuwtpL
	7E74drlz/pWl5zcC9esN0MKpiXTJ9x6p+5Vdu0Tc9h2nmdlBOMPaJ2KrwV9CqRLQhCTHgD5xbdO
	W8xoTX+lXYgwt06Pmx3t0wOig4MtwCN7U3rxbRWq5o/cmPNMgmyf5+W4yKPJkfO2VyYKqKZjRKJ
	b8j19tO3ZpkfGiHa6fHknAclHIRFsl5tQBM0Ee/+uUBUxZdvCtdI1KTfbaJZvfXAFJjb+rFg7li
	XofS8yRov4bV2oxpuPxhni9iezmV3qJqBv2EXA85tSWGi1NM6o2YDsWH4S0VGIMD/ATEA05epd4
	i+CEUdsduHRf5YmJjgEmtCRFEns7IzWiXnoaZi6TsVKLYZcKfude8+WM1W/AlAj0Rj3pZ94CSkK
	gy1ECIIQyFcfeagPwXfxFhBuZQbui26tMrmZwiN3u878t1YZX1cJWwnjSQNGWZGGWH6Bktv0QTK
	IGqkd5lApeXjElO2kd2NVVYuS
X-Received: by 2002:a17:90b:264d:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b0db61aefcmr3382279a91.1.1793964737623;
        Fri, 06 Nov 2026 03:32:17 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:16 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 08/25] docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the English original
Date: Fri,  6 Nov 2026 19:31:23 +0800
Message-ID: <20261106113142.706783-9-chenyou910331@gmail.com>
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

The previous update claimed to track
commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB role in
enforcement decisions"), but the conflict mediator contact was still the
one from before commit 5fddf8962b42 ("docs: update mediator contact
information in CoC doc") and commit 8bfdfa0d6b92 ("docs: update mediator
information in CoC docs").  Update it to Joanna Lee
<jlee@linuxfoundation.org>.

While at it, translate "file" in the Maintainers and Scope sections as
檔案 and keep the MAINTAINERS file name untranslated, matching the rest
of process/, and rewrap lines that exceeded 80 columns.

update to commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB
role in enforcement decisions")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/code-of-conduct-interpretation.rst   | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
index 4fc568409198..6f87b104a96d 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
@@ -2,16 +2,18 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
+:Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst
+           <code_of_conduct_interpretation>`
 
 .. _tw_code_of_conduct_interpretation:
 
 Linux核心貢獻者契約行為準則解釋
 ===============================
 
-:ref:`tw_code_of_conduct` 準則是一個通用文件，旨在為幾乎所有開源社群提供一套規則。
-每個開源社群都是獨一無二的，Linux核心也不例外。因此，本文描述了Linux核心社群中
-如何解釋它。我們也不希望這種解釋隨著時間的推移是靜態的，並將根據需要進行調整。
+:ref:`tw_code_of_conduct` 準則是一個通用文件，旨在為幾乎所有開源社群提供一套
+規則。每個開源社群都是獨一無二的，Linux核心也不例外。因此，本文描述了Linux核心
+社群中如何解釋它。我們也不希望這種解釋隨著時間的推移是靜態的，並將根據需要
+進行調整。
 
 與開發軟體的“傳統”方法相比，Linux核心開發工作是一個非常個人化的過程。你的貢獻
 和背後的想法將被仔細審查，往往導致批判和批評。審查將幾乎總是需要改進，材料才
@@ -23,7 +25,7 @@ Linux核心貢獻者契約行為準則解釋
 ------
 
 行為準則多次使用“維護者”一詞。在核心社群中，“維護者”是負責子系統、驅動程式或
-文件的任何人，並在核心原始程式碼樹的維護者文件中列出。
+檔案的任何人，並在核心原始程式碼樹的 MAINTAINERS 檔案中列出。
 
 責任
 ----
@@ -39,7 +41,7 @@ Linux核心貢獻者契約行為準則解釋
 維護人員應該願意在出現問題時提供幫助，並在需要時與社群中的其他人合作。如果您
 不確定如何處理出現的情況，請不要害怕聯繫技術諮詢委員會（TAB）或其他維護人員。
 除非您願意，否則不會將其視為違規報告。如果您不確定是否該聯繫TAB 或任何其他維
-護人員，請聯繫我們的衝突調解人 Mishi Choudhary <mishi@linux.com>。
+護人員，請聯繫我們的衝突調解人 Joanna Lee <jlee@linuxfoundation.org>。
 
 最後，“善待對方”才是每個人的最終目標。我們知道每個人都是人，有時我們都會失敗，
 但我們所有人的首要目標應該是努力友好地解決問題。執行行為準則將是最後的選擇。
@@ -64,7 +66,7 @@ Linux核心貢獻者契約行為準則解釋
 
 Linux核心社群主要在一組公共電子郵件列表上進行交互，這些列表分佈在由多個不同
 公司或個人控制的多個不同伺服器上。所有這些列表都在核心原始程式碼樹中的
-MAINTAINERS 文件中定義。發送到這些郵件列表的任何電子郵件都被視為包含在行為
+MAINTAINERS 檔案中定義。發送到這些郵件列表的任何電子郵件都被視為包含在行為
 準則中。
 
 使用 kernel.org bugzilla和其他子系統bugzilla 或bug追蹤工具的開發人員應該遵循
-- 
2.43.0

