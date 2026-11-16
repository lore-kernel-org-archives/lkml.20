Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850240;
	b=vJ1TIPynJN0nax+4UKguvr/GPKcm4oNcNEFUSIEU3CHSmAlmVbZtumi28eFYm7dFfRlw
	 GyQn4egE8d1KmJdbZ8l+XBDfwc2WF/EsrV0GIqeYM/pAqTl30Zpahe1FiCCkHdF4792kU
	 lg3mbcNNga26x8oYLgTe6Dlm5RDgBkkRkQrYor860t0orsHhfwBTuMKFqXcQSR2s13bnl
	 ZiLfV5w7CRK5bEllEyPQlVeBGSPGQ03MIMLWLIzDtV1Ftx+tRUmTswrdeoArtxeYeauNQ
	 7FCtXzKi8kHMzEieZVel1Y7zH/a/L79iw/IvPlH1xkN+IDqypOIwVp9hIPfV9j53tOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KjTwaJizgiBveUNOMThYkvCK46NgUoB/gNeNnCa30Qk=;
	b=zj1Z5y17/eC00X5upRDvK2eg5EvRewvBVbVA/MjkfxLwNSlqgZYNm70wzeTuLg29YUvw
	 5u5pauPWaLOmPpG6/cG03OCiAhVDudFVOrNOEIAXUApSDQVVn0iWFK2ma3CxgqSkMi7iA
	 xyo9zKOPwbbKYvpOYJ6kGfkrrd+6DBK7Kgv6oU/QTnuBmzpGPd+Emg42KNU0OyLEZoQR4
	 pBCs64I6ZKRtN1V/cMR30ZFSFIqTNXklxFO7rA9di/26RyYLBY5qgWvi4E/3RtxriNLU6
	 drGc1Mavt46OGTsyY0RJFraSHJxV5kpHYMfG9+A7NiJ923sbhgn7r/ZNwHV59VmMYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mK5B+WyJ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE89606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mK5B+WyJ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so23128555e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850238; x=1795455038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjTwaJizgiBveUNOMThYkvCK46NgUoB/gNeNnCa30Qk=;
        b=mK5B+WyJW51/bIwosEGVY0Tmr+stxxuElIAMhv7sMeLNtWpVuPpqZgs2hEvUESsPqQ
         ClDys35uG5P2uLd9jkyau+KoVfbHLNhhfbAcY04+f0wk+aTdtSm3XPTHWmfXWsYHQYM9
         efI6k8kS7bm3icQprbvUH5PqBKKb3ewQ95ob21P9WBukbbf2LNeAi/5LXetMMODCqbOY
         Yib6XPBilYH07/i/3/E1CcV9AtIFiKX7OtmfBm6X9aK5JSWgX2R1DvJhv4maQOLDL3y1
         RvwMAjFAFRpreSA+pY4rAtsW3EiN7NoRMjvV6+PhsvhUQ9LSGIAZXM48bVrWAnEHe51O
         QNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850238; x=1795455038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjTwaJizgiBveUNOMThYkvCK46NgUoB/gNeNnCa30Qk=;
        b=G1GUp1MqMN/MeCFAdhwfcf99Q9AZpn4tysuY5ODFiQ38nl/VJEaHIeQ/VAYoRO5uMG
         8zJsxYthHUWhbZSzkCumgvS6pJKE/hzYzUjJZsCdLm3CESfnBrf8vvVd7d83tPYEurP+
         O7rU8AsJvITM6eiaqsAsz98LU9vD0KpAjeC1S1604Ijl6pyLA0+oQmoPist8aauHFSsZ
         A4oLx0aTFkbP2N4qn1nn2ObO3dSAgAR6Bp8SEQRHcgi/xNjQB6MpOaIruqnY7h9L+PnJ
         vlvJjm9l+h8AQm6QFseYRlc/yiirgpgBBXXqPzjrGjShH8djYnAUm8qUhU+95o9qhlZY
         PFaQ==
X-Gm-Message-State: APuU4Z9oggRJhjKj3SuYmNcP+Rlc34o8KqxIE5GzQjiqZJSFBrmXrPMY
	XYM/wdSd2j3qX5GR2pPtDZsMGbrwigjs0hfWOfGOf80gKLjzVIoRawZY
X-Gm-Gg: AYBFou2dwoRtCYldYm3Upe/jeJ+CtUVYzdCDJty2vmAFz1ZC4PHJP0yd7hBgYTqUP0f
	DZ/qXm5EwLhxIw9UivbZnnV6BSgvHwaSOUMH4pZBd4R8UooA5VOkT22zgdt4iBGyJWhHYgyjVjX
	NpcEVILUGR70i9ho/kZm2aQqUUqq5CFPrSt8jgzuAqrGFFe0CAo5oR76dgh5yKU5PZinpqor5M/
	HEJFp2e6pqcErGDDcaYbvt+aZw0le3D4QcqA3BPjIDN7nd8kb1pzti/0IhIGYUlQBYNutGSd7jX
	z0qjj2a3NEsxJwJDBAAJXG2i6U7WaV3X6TJCTwLhEdP5xpHHjIdiQ4eYPrf5O7V0Q8jQEDQIa2Y
	knqCKp3ObuXKizPh9qbEPz3DvO2u2xgfHsI7s0wFvElVAxdf9QH9tarLCV9zH7dX1+BqvLtgp8b
	2HguUv2nG6RGR4DhVLBxNoWi2+SH5bZAAZtJq8cDhqqoBl7ckxtS+t67CLAE7ychRmMR0dqIb7H
	RV3hWJW640Y+TjtMmQbdmr+v6Q8RrDpL2uiDHamSP2WiyGSRBr9GsVV3WJDHYWlfxoNGD1dQK77
	v6eoBPZk/nS6gKohVswMYENNfa73Q+VTcEfZvxm8miXQMQF43xI2MnIh1b2v
X-Received: by 2002:a05:600c:6096:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb5de1f26dmr180594805e9.4.1794850237851;
        Mon, 16 Nov 2026 09:30:37 -0800 (PST)
Received: from zephyr ([77.237.184.197])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49d7150529dsm17892298f8f.51.2026.11.16.09.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:30:37 -0800 (PST)
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kees@kernel.org,
	peterz@infradead.org,
	nathan@kernel.org,
	Ali Nasrollahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH] x86/cfi: mark cfi_debug as __maybe_unused
Date: Mon, 16 Nov 2026 21:00:27 +0330
Message-ID: <20261116173027.229752-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    When CONFIG_FINEIBT is disabled, cfi_debug is never read, but
    alternative_instructions() still resets it after calling
    __apply_fineibt(). Clang 23 diagnoses this as -Wunused-but-set-global
    with W=1, causing a build failure when CONFIG_WERROR=y. Mark cfi_debug
    as __maybe_unused to account for configurations without FineIBT.

Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
---
 arch/x86/kernel/alternative.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index efbc11f8c336..cc2bdca06f81 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1195,7 +1195,7 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
 #endif
 
 enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
-static bool cfi_debug __ro_after_init;
+static bool cfi_debug __ro_after_init __maybe_unused;
 
 #ifdef CONFIG_FINEIBT_BHI
 bool cfi_bhi __ro_after_init = false;
-- 
2.56.1

