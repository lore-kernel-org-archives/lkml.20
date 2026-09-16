Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F511519936
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569427; cv=none; b=ZutOJCsKcC8Hw7RqSC2fnnbYK3FmgYaIlaBj+fkIuMCQdeKcHqI06gAq7/iviOpsf+xagQKOnLgwsVyg/j4IIrPZLJzxz3tWOHQWotqaGrm1Kr3dVYwoImrCaVssjDCvpaM65pCy/sfZNCtMaLt3AqX550pV3FGaycsLShqYhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569427; c=relaxed/simple;
	bh=Plcq2owhNg0Sj/G/B7MmlGcqYnIdbvu/V2UiRRh0xc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIr4sJkypnAcqTQJBL4rhmKbpzvgzz3Xqy4AHb//kCn3uQwJ9eMkGlMk15BiCS3LNwsC6RN+XNNtsWsQ8Ss7hS39Lkm1SZaM82xLBo+ftPEe0UdJ52zM/iRnv3WtesXWYjioWo/okPFNi4qRjXjIc5g8UwcZxFsv6ETNRFNTiUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WftWF/hD; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WftWF/hD"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1303732e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569422; x=1790174222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmw0ERx25M/EqcNmLRr7smyny30OD8/FRmvQ0lL93qY=;
        b=WftWF/hDJyrGCLVp6x+H2tYELk/M98Y4329UStfIbIIIMUYB2pD0umRXBHZtIAUBtP
         1NofKYsS+T6qRHHXNkajPdUx/YXqJ5p/xC5s4Q8j825Q/FrPphgMUNLXGeLFuuJhHiyQ
         hewuYUNTwU0lvgtLjsgbUnVQSeeUPzA0I0eZ+Ih1X+HgtSjXkq+OBd+qgasV3YQRqp0M
         DiZ/X2487vXkFYMg/CbpsZVGE6AMfNf8zq3ZVCnu9BcMSyfovplyOEId4S/LGKPk2zOJ
         8dbROs4zzfF1uH6FGdE0m9SRtWWF8TVC5kI0Zi10el2VsjtRpWc6220nB3XqFaYu6fiR
         UnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569422; x=1790174222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmw0ERx25M/EqcNmLRr7smyny30OD8/FRmvQ0lL93qY=;
        b=2aRKtnsmoVnaH0it9ApOnqPr0ThuwyxFDwPZSQ+oj1GczCjzFa34eAFue5Z8bMJ7iH
         sxL0bRMn9pNzF1yQ2BcBWaZee1EHkv5dOT95GtGlXRrA8S0guStWljt33iHB7OFSBdve
         KLSBGebwWbZUr+405Must6J27A3yFHUvqEgf4FR+AhRPXjkkUAziJ741y0OZVZX+bzz4
         SZ0V5aYZlev9hvPfXHQsHj2UcWcg1cyFg74YRSPj4Uy3It+hkTYb3HzzMlpnSAZADPYH
         pZFIioPqro/WRgv57QYqk+y+KaUQk4cyoO8QY6AILdF8eCx1ivlDLfjjkM29x9SOv7YF
         pxnw==
X-Forwarded-Encrypted: i=1; AKwUvBzwgBuxb76qHVoiqBxuXHmMUIqky8GlP4nHI8jeC6TDYT3D2s1HPgNkDHgkoRNUmtmsFqHKuKuqs8QJfpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lpb8+AwppApSa0mDi1C4EkwjYqvCEKdUIKy0Wn597ijk+vgdWB
	TecQlitBnZKk05ucHGG+clLHc2v1Gul2UNs5+BkX22JawknHOJ5UUyc=
X-Gm-Gg: AYBFou1MjxsIdKe9y98kS6dtW7X/gHID6PoF7Ab8fWSTBU7kvwkw33EttkAXapECBy/
	aEMNqjiV9nPcnVsV3kjAp8IOM3Kw5ZS5t1bNo0z9usz/iGMWhBEXt+Yrt9Qb5Xo42/eS2TWkKNa
	oWhWXm7hVaVjEaUfo7U+fMhhx9R2Ixek7G2qzqCdP8IcnnQzAh5qBW37dmL5A6S1dpGR4eBwKPi
	qqIZn5XzVQ6A/SQO1QDnAqF0Fdiztl834bLXWBStHwsT2a8DdO21aiZYdGAqCHj0agiCUBENjFA
	BXIMZFej2WKft1cn1DXHJISAzzbxdeQqAvgs5nOmcHfPHyDg5Ssj7sUI1k5/orvJXVIgFsMGh9y
	SqU00lBcVUC/nrBl3IExPfaa+F8PqFkzzrGSejpM1S1PJU0+ChVMxFVKvwdfHYc3wEF9bx45LvD
	knLbSxTCQeUcvODUSJRW6kJrra3V7ajH4Ql321RMLYUZarsvFN9DgN2IttfBgaySo40IZVjFrx0
	K+psPEt8XhjH2uX/XmYO28QDA==
X-Received: by 2002:a05:6512:6cf:b0:5b6:1a7c:28 with SMTP id 2adb3069b0e04-5b8b6649eefmr816014e87.43.1789569422105;
        Wed, 16 Sep 2026 07:37:02 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:01 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 19:36:42 +0500
Subject: [PATCH v6 4/4] mfd: intel-lpss: Switch to debugfs_remove()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v6-4-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=Plcq2owhNg0Sj/G/B7MmlGcqYnIdbvu/V2UiRRh0xc0=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmIhbltBtihMGq/M3BExEHj+gmJXlfOt0sEL
 5ye5ii2QNOJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqpiAAKCRAT637qmaOf
 omcoD/kBF3WXjeuCpjqW3XLz6MXZGZWv0ilitCt5mDR63fcZFXitPP4p+PiduKXI+vB2OVRVkpv
 816SWIAoIPBYVqqVs7pYPesWbkhBc1sXWc7z47xDJMmFrv5162mfISLSYUj1lVEvTCdffaO/l/W
 aVTGA7G9x/hHfU1pEkMTC9vqdpTJQQN8Ta0KEqAVfGM5hxKyjDYDIZ5LR3QcK9pc1cOYyw2kWFO
 d1XhVflQQJYkq2Xdcw2tKEgNAO9xRf3lYr28r15AENBiP5s4BAKe/LdzUXvi1MCELQUcd3JiL07
 tPpGWpahtZEbHqdkH39+VcYAr9Rdvf/0ItM4FYS7kDqiQP00qax8DEs08+C+w4bi0fk3LLjmBqL
 hG0KJFVpf5Krvt8z7224CiB5lQ44XYXKMC9fhC7A/b4tcJ3UXqiQcWscfcZlivM2UfsH5RyIhE7
 nbdFaP4p8biHj4rTGEfBeXC+m9wiOW/5U3CpQD/ubQ2XEhs5xOQkGajkGrSwwXwA+K6qEb/qtQm
 seXCn2VzSoZ0N8tF5G3FzsTGRGsx0W37ya8qAdSzjr0A0YGZDpM+jYValWsrSOZjR5tPFrUDDdd
 qm/yWICgh38i+ycs0blPeiCp+m39MyLqlCh3HhrMCxPmXX3BAZ8v5zPKC0F+0vXs+/IBTQMeYB3
 ooAHXWWv6f07IxQ==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

debugfs_remove_recursive() is deprecated and has become
a macro for debugfs_remove(), replace it with the direct
debugfs_remove() call instead.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index f1a8feb0fdf2042a3b6a8422400cb8f9511b4876..beb01252f9021bbf40b293c81181b29e9b61bf56 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -160,7 +160,7 @@ static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
 {
-	debugfs_remove_recursive(lpss->debugfs);
+	debugfs_remove(lpss->debugfs);
 }
 
 static void intel_lpss_ltr_set(struct device *dev, s32 val)

-- 
2.47.3

