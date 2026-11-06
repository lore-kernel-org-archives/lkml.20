Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964735;
	b=EU5RVQwugeC4KCqzcMsCxlmIfk3CejmO9hgOELNurocUR4xif0c0bhn1QJzvRHZ2I9zf
	 7UXOB4c+RHSHmChYf8/GKsrwjm8XlkegdpcjH34QTgWelogWHYTaI3niPOEyycFYCQrlP
	 F+CMkV4q04R1x2P4WofsC32C/mrvbPZlv9373Xabi1Jt2Ynizyh05nFVTp/6zhptyhow5
	 PE5XLC39PS2RB543qvQ0i6aGXhPs5VUToW2r/vJbsj/AHiQMg2WvI8ZM6Rf90WV2QCdWn
	 gWPjNRVvQ/q693xY2bMlPh9Y7l5I1iU7/wSTSeyhYr7aVlVnFuYjqFkYNOlOol9gMUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ey27Z005P0nP9/Be/Ht5BVJh577+gs2FglMSPN4FLG4=;
	b=VxhF2BnF6Cu1R+zF6AulhJRD9A+VduS8WFK+Qa/1bhfKAGPEqaA/MUryWFCqYSvdX8Pb
	 zEWNyyP1ep1JLTUfj/TqH3cH9ovdDkWB3xEyYPUE7KJY/BWpFGcGariCZOfZPZ0FoHoDk
	 cUs2uqc/tLule2Z/VbHUzGTORzesA31xwKgBQIGsE0/gkcXbfPYCCOtBmrhnHm2VpUM22
	 z5crljbjtTL7zUhK/EjGQcTJp/6cvDnueGoKz7PlNQHvzKXrWyrMFmJyHYxPQbKUN/RTi
	 oUFb+J39RkZ4Wh+aVgtcaHXCzteO6Nm8JxBj/NiQ81JB0sSjFnUBuqra4loENHEP2gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Pi/zeJOf";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F626083637
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F626083637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pi/zeJOf
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso41912a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964734; x=1794569534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ey27Z005P0nP9/Be/Ht5BVJh577+gs2FglMSPN4FLG4=;
        b=Pi/zeJOfwFI/5huYsbVlFx0ltcJD50moT8rctigSQ3AuRNtb6pfo7HuoFcRnESs3IA
         rqNwaVIV89A8NIFqs8uYDKQIcDNIPMpEERhX4Cd25Zy02AWhJObrO5HiGgj/hnHHarUc
         zL+7v8Tb0YIwYoTQ4g35P9BG9j5FtwjvQUKr2pLu5oO49kR8XV/bY60W9fZ9r+pAKRxw
         hjjKjx5pP3YIPsNSYP5mfV7T5QItxq0KV1TVywiQynBf/0YEsLNuopyfhAtW056Ds1Zz
         C89wTeZmRLcXDKH73EMqOQFGN10fcLB1YgUolCnyBc+FK7Oo6ofJ+srhgg39R6kiZKcD
         avgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964734; x=1794569534;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ey27Z005P0nP9/Be/Ht5BVJh577+gs2FglMSPN4FLG4=;
        b=K9KZ3k/o2lMHwa0b+QpVDpqnk9d80QWBe5WFb2WGqOFvjocra7x+o+f+1mcNry1Mo7
         SekokPyL3s0HQ1ywpqcGci3rsaCKpDZQnMBigepIavQJCR5AMUn3imqFfhWGwjotz9aZ
         j78iCU8yyKhWoslSjrHcTfsyVNoSzSLSjF17IGflLnCNtnpgHHHXbhlV4hFmhknFC1Df
         VGPjklBNyS2QdSLYfCmVXfo1BW6eK61tAk/xVwDSHwk74fiox3wa0II3fb9FQD/K+h6G
         /ZZ4hPbBANYI2EpRogF2p3y1yy+uk03WcK62FJfHWF+AgLxr55NQ2vgvw0kDpwxztVju
         IOAQ==
X-Forwarded-Encrypted: i=1; AL+hErEpNPvPTHsGcbxv4eBPMMhsyNZFJq3UhcbKp3HVdoSdDNldvRTxYZvTWi6MndxMf8e+/E8cAvsG0mof/14=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0fDRMLBToklP6EjTvd1wmMIFhkkcQ7YKR0Q1obypxGnVNeRWd
	2Q7lbfn/3L6ffY8KlakwlnqyBXN155NV1cw+KCpOjc/koduqFo5qFzh0
X-Gm-Gg: AYBFou3hqYi5oRYNdF73mjZ0wwxuLId4kX3Ux4OloSeubK5kjeWTKusIHJQpwp/eN+m
	EvoJGZr5WubabLINZEpvLwZiA0hUnVfQthMLh9dHcTpbHcIDHDHgymKbUx3WNt8ows8kS0k1nQV
	n4pjaMHTh7j3nMZNkiM1q+QehauDZqP3O73+lKmG3vEqBM9ZzgOMaR6tPArdaT1Ty55Fn/UN85l
	b4/yyeRJoNFXPOh4EITAESJ1IQSOxHhsfqnplwrUtOFRqUWV4pzQCu4inm42qtfQa7pNzP+dvWW
	eFVimzXsiTjdEYyRzxlmsHvihNMI3laKh/cPcwvIjPgIkPmxxdJMIM2eETiyFUeZPXr0myEvT2G
	L04So5Dt0b8zoMZkRn4gxI4JSEnJhhBUxn5RBKR0aqZjcbUzVXtK0w8pGNe1CpUnRzlU1wreMlM
	M2PBA+V9J3MeQfPucFqU9r3ZaYLnaMTG75fYb73wzs2GBvJFJyLaXinyx58TnUdOGb4cDstwY5Z
	FlImBEpQb5lhKyixUQ7Vdo3uu5E7DUB3KvY5r4vpBA623L8lSOb+kbuXJ7H3ZSND89QXwOL5GwA
	rp0VgOSqIfn/OFzKFiFGxachpN3nZXSE7AzIlLWBMXeHpwFJx7brKxD61U/xWg5RMhlaGMlFX3P
	TU7iv0z7HsxOtLtuu3iuN9W0CwXH8+dfa5u7u1MQknrxJ2w==
X-Received: by 2002:a17:90b:3c0a:b0:3b0:9e2c:9b55 with SMTP id 98e67ed59e1d1-3b0db60d73cmr3368784a91.2.1793964734187;
        Fri, 06 Nov 2026 03:32:14 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:13 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 07/25] docs/zh_TW: process: sync 8.Conclusion.rst with the English original
Date: Fri,  6 Nov 2026 19:31:22 +0800
Message-ID: <20261106113142.706783-8-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker.  Its first
paragraph still followed the wording from before
commit 9db370de2780 ("docs: process: remove outdated
submitting-drivers.rst"): it called howto.rst "an important starting
point" and described submitting-patches.rst as "something which all
kernel developers should read", while the English text now simply says
to start with howto.rst and also read submitting-patches.rst.  A
section-by-section comparison against the current English text brings it
in line with the full current original:

- retranslate the opening paragraph to match the current wording, and
  write TeX as in the original
- retranslate the sentence on why the kernel has progressed as quickly
  and as well as it has, which had been rendered as "as fast as before"
- wrap the :Original: line, the cross-references and the LDD3 entry to
  keep them within 80 columns, as in 7.AdvancedTopics.rst and
  5.Posting.rst

update to commit 9db370de2780 ("docs: process: remove outdated
submitting-drivers.rst")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/8.Conclusion.rst            | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index 2436263c6506..fdba290d0eba 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -2,7 +2,8 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
+:Original: :ref:`Documentation/process/8.Conclusion.rst
+           <development_conclusion>`
 
 .. _tw_development_conclusion:
 
@@ -10,13 +11,13 @@
 ========
 
 關於Linux核心開發和相關主題的資訊來源很多。首先是在核心原始碼分發中找到的
-文件目錄。頂級
-:ref:`Documentation/translations/zh_TW/process/howto.rst <tw_process_howto>`
-文件是一個重要的起點；
-:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
-也是所有核心開發人員都應該閱讀的內容。許多內部核心API都是使用kerneldoc機制
-記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式產生這些文件
-（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文件）。
+文件目錄。請從頂層的
+:ref:`Documentation/process/howto.rst <tw_process_howto>`
+開始；也請閱讀
+:ref:`Documentation/process/submitting-patches.rst <tw_submittingpatches>`。
+許多內部核心 API 都是使用 kerneldoc 機制記錄的；“make htmldocs”或“make pdfdocs”
+可用於以 HTML 或 PDF 格式產生這些文件（儘管某些發行版提供的 TeX 版本會遇到內部
+限制，無法正確處理文件）。
 
 不同的網站在各個細節層次上討論核心開發。本文作者想謙虛地建議用 https://lwn.net/
 作為來源；有關許多特定核心主題的資訊可以透過以下網址的 LWN 核心索引找到：
@@ -31,8 +32,8 @@
 
 關於核心開發有很多書：
 
-  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah-Hartman）
-  線上版本在 https://lwn.net/Kernel/LDD3/
+  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和
+  Greg Kroah-Hartman）。線上版本在 https://lwn.net/Kernel/LDD3/ 。
 
   《Linux核心設計與實現》（Robert Love）
 
@@ -54,9 +55,9 @@
 以及您如何參與這個過程。
 
 最後，重要的是參與。任何開源軟體專案都不會超過其貢獻者投入其中的總和。Linux
-核心的發展速度和以前一樣快，因為它得到了大量開發人員的幫助，他們都在努力使它
-變得更好。核心是一個最成功的例子，說明了當成千上萬的人為了一個共同的目標一起
-工作時，可以做出什麼。
+核心之所以能發展得如此迅速、如此良好，是因為有一大群人數驚人的開發人員協助，
+他們都在努力使它變得更好。核心是一個最成功的例子，說明了當成千上萬的人為了一個
+共同的目標一起工作時，可以做出什麼。
 
 不過，核心總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
 重要的是，Linux生態系統中的大多數其他參與者可以透過為核心做出貢獻而受益。
-- 
2.43.0

