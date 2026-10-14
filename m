Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A30C5221D2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984595; cv=none; b=kVJHYi+SHLAboI6BM+b1wFCJS5UGhOWWAWi1C9ozcZOho/BbmyaKF9tgm3g1Uiw6cJ0YExTwuF0/aCJnWnVTq+VsN8qJk/tGibrQgu9DeNo9X+JwOKgRMn9tC2oU6o4KiQRhjvBcKeZijkxXd3nN/jE/Z/CO+YYnHNCQytfo8iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984595; c=relaxed/simple;
	bh=DTuogrC0MmgPnPiOj6X0jndc3vH4rmMZreMpKLTo4+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBgd1eW69sWQ2sQJZ1buk6Rw7zvk3HPoVt+HolBKGIxdbriwG4pOeNwxTgLZktAqExnjAE5Qm5zVCRg2dZQnqx9Whz6CrLnh8TbCIr+0lYfyolhD4NbBkeDk7CF/h15pTXir57sQdnoeT3wtvfvw3+MUQkR3SBJZkDGlX75d9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P6eDx3sa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P6eDx3sa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1810f8855so2504145e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791984583; x=1792589383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOqfIQkUtLocoWm4GjQwg3XTJaw51CuYlR5SOgYz1t8=;
        b=P6eDx3sa/7zeGlEiBIFt5u4BFwj3cEEz0vQscVGpDTacxrmxBb3fYN9WsBnkqLlTn4
         55vJ0v/QQmbWRWKUiYb+MgnNk+ATXbtDK0W7bdg3+8F6oXpDzgSgXjbvjvOK3IFmnIpz
         +LtI5gVUeFOirnnEswylLX9VCwARGJVQN5Id8IihR0IDmhbv3c4i1i13/2uAxHjtQrmk
         WwW2uln/PVXmy3T8b64beEiwgNbhb7SnSv5kcU0x7ZNKr0ePYrN7kZPh0Lm/w8mgZv8E
         X8f0Q/poiHpcNaJ2NJ6cx4P0bM8gBHGnQX7Rx7uj7oXrWkRra8hPDE0jMil5xoC5RQwH
         hgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984583; x=1792589383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOqfIQkUtLocoWm4GjQwg3XTJaw51CuYlR5SOgYz1t8=;
        b=tagh1cDjJhVQ8zWSAXvxUWuSE5BQfT8jFElCWkDcwwzvd5I8YA+03t9fuGE8qCPOIl
         bwgLO52Y21eTc7t3Zk+zDu6uetHAYo6IZTWG1KgI9N8yt2gXvqO5Vho/Lgl3mKwG+ovB
         Tom7QPpHHbXj8IEeTitIeZx5Fjk5eAPj16c4lUj7GxM5jeUgduMfPExnTXocFSvkjCnu
         FXd/w3jxMdjygKDG1KUYiuIez1Xv4liVe86k0K1R61sHqS/I26mjqn05RxNHmicKWaFV
         +wRDfN9PwI88UeiAPGwCXnRGHobmx/znRTcc76WxQa8RwhiM+NGrQvOu6nEQzW7gaSou
         H1jA==
X-Gm-Message-State: AFq9FYKeBShq2ceN4VRIwaCHnHrGiFZPOjB8ejAaNPWc4XQxm/3CMkfs
	5BjiBMY9mtHn7zd7nH7Rslcpm89nkr37uzF99HOGoHoR7BexMT9qGC0Dj9hirL7/CGY=
X-Gm-Gg: AYBFou1Ctp/L74BGkHARJtVt9aoWG7Q1KCpdRcGzgn6LGS8VYyW/jTU9sLWidrZ73n1
	UCLWfFR7UVloeTOHdGH4B8NctEW8hUntCyx09wvy32MZLLte5Ty37wfj434gvwci0hTbzOgBb2O
	ZtPztGbGQXM2d1/t0+x4gVs1N7wnsrwzdmKl/OqWcyDsT3zgcd6vLs8QxCmWpYN2pczK/nm9Rbn
	I9B8MVBSpKcF7xOs6R/4qOHuos8+cx/trIqwspU27T9sxMFM4uyl6caxy8veozorJ/eiVH4tSDF
	Z7bsp+2s2YwCzip5vHwPQTVVfXaEnPpyuPdU+KPwPiEVJ5gcWxvXR9CxTGEAK9bVqzb7E78HnRk
	dSApXeDlO9oB/oYIdq5FemonxU+7NiEpxtd9Gcd5hwt6/EA6betrtYGrB/YR6N+BkaGrQ7MegP1
	2thzSq/rh+ALh3cyJ5rcw7PmLPVqbGxCDGpn7R8m+sX3JaY5+BHpWBaQED4H/knXCqTVk=
X-Received: by 2002:a05:600c:4e45:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a18e47e330mr298610605e9.2.1791984582793;
        Wed, 14 Oct 2026 06:29:42 -0700 (PDT)
Received: from localhost ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd04e81bsm360895e9.6.2026.10.14.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:29:42 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Blum <blum@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 3/3] x86/tsc: Use TSC_CALIBRATE_MULT for the TSC multiplier
Date: Wed, 14 Oct 2026 15:29:32 +0200
Message-ID: <20261014132932.1495303-4-ptesarik@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014132932.1495303-1-ptesarik@suse.com>
References: <20261014132932.1495303-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TSC delta is multiplied by one million to improve precision. This
multiplication is later undone in calc_hpet_ref() and calc_pmtimer_ref(),
making it difficult to understand the meaning of the divisor value.

Replace the magic constants with a more descriptive macro or calculation.

No functional change intended.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 arch/x86/kernel/tsc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 7e31acad2b055..b4815fdedf1b5 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -339,6 +339,7 @@ __setup("tsc=", tsc_setup);
 
 #define MAX_RETRIES		5
 #define TSC_DEFAULT_THRESHOLD	0x20000
+#define TSC_CALIBRATE_MULT	1000000LL
 
 /*
  * Read TSC and the reference counters. Take care of any disturbances
@@ -373,7 +374,7 @@ static unsigned long calc_hpet_ref(u64 deltatsc, u64 hpet1, u64 hpet2)
 		hpet2 += 0x100000000ULL;
 	hpet2 -= hpet1;
 	tmp = ((u64)hpet2 * hpet_readl(HPET_PERIOD));
-	do_div(tmp, 1000000);
+	do_div(tmp, FSEC_PER_SEC / HZ_PER_KHZ / TSC_CALIBRATE_MULT);
 	deltatsc = div64_u64(deltatsc, tmp);
 
 	return (unsigned long) deltatsc;
@@ -392,7 +393,7 @@ static unsigned long calc_pmtimer_ref(u64 deltatsc, u64 pm1, u64 pm2)
 	if (pm2 < pm1)
 		pm2 += (u64)ACPI_PM_OVRRUN;
 	pm2 -= pm1;
-	tmp = pm2 * 1000000LL * HZ_PER_KHZ;
+	tmp = pm2 * TSC_CALIBRATE_MULT * HZ_PER_KHZ;
 	do_div(tmp, PMTMR_TICKS_PER_SEC);
 	do_div(deltatsc, tmp);
 
@@ -806,7 +807,7 @@ static unsigned long pit_hpet_ptimer_calibrate_cpu(void)
 		if (tsc1 == ULLONG_MAX || tsc2 == ULLONG_MAX)
 			continue;
 
-		tsc2 = (tsc2 - tsc1) * 1000000LL;
+		tsc2 = (tsc2 - tsc1) * TSC_CALIBRATE_MULT;
 		if (hpet)
 			tsc2 = calc_hpet_ref(tsc2, ref1, ref2);
 		else
@@ -1334,7 +1335,7 @@ static void tsc_refine_calibration_work(struct work_struct *work)
 		goto restart;
 
 	delta = tsc_stop - tsc_start;
-	delta *= 1000000LL;
+	delta *= TSC_CALIBRATE_MULT;
 	if (hpet)
 		freq = calc_hpet_ref(delta, ref_start, ref_stop);
 	else
-- 
2.55.0

