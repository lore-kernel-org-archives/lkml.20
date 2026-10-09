Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10063ACEEC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540316; cv=none; b=jYe8KVpNVPK8Ej9ARAxfrRNFGaR74MAb0xqmV8gFya/bWAtqJUpToiv1wzdBFwtwtoTvsm1S25h9HqYfWg3jH6z54fdejS8Ym8rqUpzOpfj59jjHoevEyfXA1oXXJqVQLdiMk4AWQJyJAbCXBWXStNByGq7GR7lQEr+bFS1GAHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540316; c=relaxed/simple;
	bh=RZray3oJqs6iu+WWyXzCOTRJh5DbgG8TtJOF8TmlTe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVEDc8vPqxLoS2VotinbTaBZ/UXzesta84s4Q0KMwz4veXWeOSYtFuao1SAiz/TDs+NVsyva5LbvaVyCWJg59thXdgqbL8u4XTSn4ozn4igejzb14+QacxhcSh3kRSkn3rMQlmKtACpsk53e8MXZQRw0ODJz2JiwjTE/s2uRZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ch/Qr3SG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ch/Qr3SG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49e6b771d06so5650545e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791540308; x=1792145108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sBDRTUWahyo0mraFa8UYS8kzP9oMwACR+6zs0XdZS4=;
        b=Ch/Qr3SGt4tg0H6Ae5YOF1+Q8lk9+Wkw6ecA4oMwzbGDwL7OvZyH9h0hzcX0VZn1hD
         4YV1GEGlnT5364RQ2cKBQAMOzst1RnKk7cMHVDFzHyI4vzaQb+4g/mF1tTVfFNexjBd9
         2WVDonBdhV5jhe2dkHhOirlU9FPTrfbrk6MYIoJhYJx8BG4rfnbFMZ3T8qj1lcYTh8Ba
         4cbx87IMPWRnd05cfxySi9e6K2DhGZcaw7480UFSoZC0l2cVyNk0TkeElKTKmVKIGOcv
         KW4W5MvwTBCcCf56/Cl5MwnYtEd6Y6pCxiT8SGBGKFeqNfkzxS5hcXSyJErRsRzg9mWo
         pT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540308; x=1792145108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5sBDRTUWahyo0mraFa8UYS8kzP9oMwACR+6zs0XdZS4=;
        b=G41QHwVNwIO6BUT9sZokxESyE881Sd22T4jdmgTIDwDemWVxn1Krd8xnsN+ZhyO7CO
         zIz+TNu72GV/rzwjo7rZmSO3xcfJ94e9YZ6D0UuUl4alOcNtAnNiRQxHqLZ4pkwxkS+f
         piRAvfYxN9mz+vMZuKZ10hqH2ZSMktRH0VYNndC5e5bMjdkPg1gpnMyiPOYoA0Zf79f2
         7XxE8iPhTvhxt1WoQxA7H0w15Ad3nYR/bmnNiiYmM7ZXM+TOfGTDKE1HBCVddTIA1cS3
         nLIJQXkHgjf8ZZn7ZQXowJgYZOsibGl1fzt1B5uU2uPwbUpGD/90qupqDyFQemxnIaXw
         +8hA==
X-Gm-Message-State: AFuF++lBTuNQU+K4XhEMllmC21jGqr5Lu+FhXVhbKp+klVaS1t66WhnA
	LWfFYPvVz7D+R46JobbSFcF5TtErzCCHG23buyWzTxSUbcWD1HqGXDtdXjk+igVmc0U=
X-Gm-Gg: AYBFou2DeRrFyEsyDBv0eMavAn0fFxzbkj29IWB0hNjq8rzQXP+wzcPZMp3S4yLHwe3
	PEri3I7Wv+PuAP/+ZjXeIbLLwBnI/U+lNFagLuBnHg3LH8yeRlYBzdrLoJ5YIehpQuh/ZwUfHUs
	Hd1AQUNEvyX8BI/L6fQU1Z+K6wXKg1dxjOeEKd+M0iMSjMeSFVBOjpRUifevTQmyZeGm8Qvc2cA
	3055SUTl4q7+LDcjBz6FVobPzG6GwgbSk0Rh9krSFMBxDHjyBs/KS+IqZedC7cWQeDqnLl2d27t
	dGERGju+d1Q4zMH/xPnmhj3D4E8dkF4XVj/hGTMgLAZ1Ef9hOIbh8JWgwpVoe18zDcpy7mSN/q2
	kjOxm1OUdIdmUSh1h203JZ3WRLMYVasJ0CkCMVq3Ax2kmXTZh3d2oI3oud7p6P/NlDu7jiucTU1
	n0sTOUpxuF33Z9dk2Dm6WPvTOKZvSysL7TxuVkVww12zJwCzg75BRLMq/hrWtjRjhR98s=
X-Received: by 2002:a05:600c:3b29:b0:4a1:813f:2a5a with SMTP id 5b1f17b1804b1-4a18e477757mr24884165e9.2.1791540307861;
        Fri, 09 Oct 2026 03:05:07 -0700 (PDT)
Received: from localhost ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm42162365e9.5.2026.10.09.03.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:05:07 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 3/3] x86/tsc: Use TSC_CALIBRATE_MULT for the TSC multiplier
Date: Fri,  9 Oct 2026 12:04:36 +0200
Message-ID: <20261009100436.1133518-4-ptesarik@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009100436.1133518-1-ptesarik@suse.com>
References: <20261009100436.1133518-1-ptesarik@suse.com>
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
index 8b905c4dbefe2..b241b9da82dd3 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -341,6 +341,7 @@ __setup("tsc=", tsc_setup);
 
 #define MAX_RETRIES		5
 #define TSC_DEFAULT_THRESHOLD	0x20000
+#define TSC_CALIBRATE_MULT	1000000LL
 
 /*
  * Read TSC and the reference counters. Take care of any disturbances
@@ -375,7 +376,7 @@ static unsigned long calc_hpet_ref(u64 deltatsc, u64 hpet1, u64 hpet2)
 		hpet2 += 0x100000000ULL;
 	hpet2 -= hpet1;
 	tmp = ((u64)hpet2 * hpet_readl(HPET_PERIOD));
-	do_div(tmp, 1000000);
+	do_div(tmp, FSEC_PER_SEC / HZ_PER_KHZ / TSC_CALIBRATE_MULT);
 	deltatsc = div64_u64(deltatsc, tmp);
 
 	return (unsigned long) deltatsc;
@@ -394,7 +395,7 @@ static unsigned long calc_pmtimer_ref(u64 deltatsc, u64 pm1, u64 pm2)
 	if (pm2 < pm1)
 		pm2 += (u64)ACPI_PM_OVRRUN;
 	pm2 -= pm1;
-	tmp = pm2 * 1000000LL * HZ_PER_KHZ;
+	tmp = pm2 * TSC_CALIBRATE_MULT * HZ_PER_KHZ;
 	do_div(tmp, PMTMR_TICKS_PER_SEC);
 	do_div(deltatsc, tmp);
 
@@ -808,7 +809,7 @@ static unsigned long pit_hpet_ptimer_calibrate_cpu(void)
 		if (tsc1 == ULLONG_MAX || tsc2 == ULLONG_MAX)
 			continue;
 
-		tsc2 = (tsc2 - tsc1) * 1000000LL;
+		tsc2 = (tsc2 - tsc1) * TSC_CALIBRATE_MULT;
 		if (hpet)
 			tsc2 = calc_hpet_ref(tsc2, ref1, ref2);
 		else
@@ -1336,7 +1337,7 @@ static void tsc_refine_calibration_work(struct work_struct *work)
 		goto restart;
 
 	delta = tsc_stop - tsc_start;
-	delta *= 1000000LL;
+	delta *= TSC_CALIBRATE_MULT;
 	if (hpet)
 		freq = calc_hpet_ref(delta, ref_start, ref_stop);
 	else
-- 
2.55.0

