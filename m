Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D53E49FC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540312; cv=none; b=EAaU/xe2IRWPGqExCHeu/81vFQNnKwlTmrURa+3V8LjYV4UxX0Qk9f3LolMhWDOQuH1lUoEmYeSPyTL9ByV1T7Urvnm3BC8SNkmApswqslkkAWhMAoIXmTjJyYkYlmDfFvmn/Z2jbsEbH8M/MexN0gZXReN8iNDmfSGNHNTwHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540312; c=relaxed/simple;
	bh=+B47ErvcSNFLN+cHPaY7mJ1fnh1Bd+eneDOKigYcVSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isJmGLQbw4MIm4QkqSF39pAXkTRO4uvCIvWGuDdtqcJVBXGwyhU7Udc6v73sszlbDt4vGIym8poeD5jgy6MXmloU2GI45Ij+DJoOqrXIO5IEmaJy2IboflY3bU2hUA3CRowVojFcQJAFa5hhNdPxFu6xaNWKeGtZUPqk99llSIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y0BNQ0Lu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y0BNQ0Lu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a021394aadso1677315e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791540305; x=1792145105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1p6ZaML2t3bAdKkKEKsX8YCiki6yFigFulV3oKjmNk4=;
        b=Y0BNQ0Lue/xk2wRYuu2WISN3dhVaVAQKGWQtXzRidK5Qd/k6cTniO5QrF1AYsii0G8
         LMDK8MJ7zI0WTdVwqPWbvi6+e9JeOY+lR7mxW+0iAH5N4hAJMT4SEc2Sa3iosyigNief
         cRwwHWRgOz25pg+5M0Ryx2oOgvoqIBbbQoR4DKQ3/zueOugTSGQfaFqK8jFm+oxnAFJ+
         8VFPJ7ZJBeojmX2H86Es+Huf4xsJ3Ij7T1RTQel0WSxIc8z8EokK35cbF7R+rYfkpTtE
         i+JBbhcXo9I04SUFMXEIi5IGoUQ8EbhFqPa8NYoqNl1a23eEKDQ4WvvpQ1N1l/Z7qSpH
         rQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540305; x=1792145105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1p6ZaML2t3bAdKkKEKsX8YCiki6yFigFulV3oKjmNk4=;
        b=zxR/EmMqXHrrZMwwQa5irq5SAyzFzpgqsposg51jLxnTrZvEA4Be8cCboetEHR4N6W
         4SB/ftD/4cdGje7KrYy7YqWArlpZ1oeiUf+2WqNVoWoTGS4q5+Gx3oFtCQhCJlx8KzYn
         l+Zs+vFWQyI5MWWc77R9cYBHBUKdVBFtscoXLLoP+dXH6GYWIzZtbuM0yKhwM1HQ0zO4
         SKVf/rdzr/E+SOcecpFDYnai1hwX1eIwP4LDW0No75JQ2Xx0SFUqiJuDOxTmwoZXmqjF
         Zx1lh7Jo77IX36RMtUe9ne5EpDkCoHz2PFL9v0hWkcp7XWLncEb8noSUVGlyFJMDm36k
         jkaA==
X-Gm-Message-State: AFuF++kKsqY0Hm++4m6jv/Z9Oa/QU4FhEHkTcRJN5IhNXSTyr1UvoRQR
	ogl8oSjmuidFgk9kXqhCNxAIXGIDM9yaISXGtXnA0mCIdqzf8fFASRj0Zl7G2L8guxg=
X-Gm-Gg: AYBFou0rwQy/rGATyjpt3xkjT6vU21SqVpJ4zSD+qY4dIhkQxVadnjAd2oo9s13BWne
	9Ye3X8QIAJasa9pe40VLrPOvbT7YWB2EGYgt9BoA7qCdU+bSsMuJQKJAmtTdi7dY/pHSS4fdYz2
	WO3/qQaQ+lnk/ou5Q06tahfl4RuCbYVT/bswmVVn+7jq486UytdaQkZIuIGqLQDnfRZJugBcBrS
	D/UfLsZe8phQrxtrPB3g2k5rUENw25tBZoPjTurGC5a2sNkgudL4EsqXLfSdWw8oq7fjycRUIr1
	pV07mYEqJS7BkfRXqxo6TSOi4eggCYkFvcGCtC6XJZrppJOh2ENpukUnp102hwo7NB28eAYnbm0
	6s1xrDEJJ3t8JeJguRkkIVr4Ti1Fd46XbAs6H4WsoYhA8Qap+BXADNxDET1coQb8YwmZPY4tNjY
	IO/ikheJ6ckWZ+Wjvt1U4drWYKClqtwMn1mp54Efa8z0FJPOv4ePQgTXUeQrRjfzX2ePvtpXfvq
	WcIdw==
X-Received: by 2002:a05:600c:6285:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4a18e4760demr23731775e9.1.1791540305326;
        Fri, 09 Oct 2026 03:05:05 -0700 (PDT)
Received: from localhost ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dba1be42esm3201198f8f.5.2026.10.09.03.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:05:04 -0700 (PDT)
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
Subject: [PATCH 1/3] x86/tsc: Replace magic constants with xxx_PER_SEC
Date: Fri,  9 Oct 2026 12:04:34 +0200
Message-ID: <20261009100436.1133518-2-ptesarik@suse.com>
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

Make it clear that these constants refer to the conversion between seconds
and milliseconds or nanoseconds.

No functional change intended.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 arch/x86/kernel/tsc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 723347e2cf7f8..bac81d37a90ce 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -253,7 +253,7 @@ noinstr u64 native_sched_clock(void)
 	 */
 
 	/* No locking but a rare wrong value is not a big deal: */
-	return (jiffies_64 - INITIAL_JIFFIES) * (1000000000 / HZ);
+	return (jiffies_64 - INITIAL_JIFFIES) * (NSEC_PER_SEC / HZ);
 }
 
 /*
@@ -401,11 +401,11 @@ static unsigned long calc_pmtimer_ref(u64 deltatsc, u64 pm1, u64 pm2)
 }
 
 #define CAL_MS		10
-#define CAL_LATCH	(PIT_TICK_RATE / (1000 / CAL_MS))
+#define CAL_LATCH	(PIT_TICK_RATE / (MSEC_PER_SEC / CAL_MS))
 #define CAL_PIT_LOOPS	1000
 
 #define CAL2_MS		50
-#define CAL2_LATCH	(PIT_TICK_RATE / (1000 / CAL2_MS))
+#define CAL2_LATCH	(PIT_TICK_RATE / (MSEC_PER_SEC / CAL2_MS))
 #define CAL2_PIT_LOOPS	5000
 
 
@@ -552,7 +552,7 @@ static inline int pit_expect_msb(unsigned char val, u64 *tscp, unsigned long *de
  * more than 50ms on it.
  */
 #define MAX_QUICK_PIT_MS 50
-#define MAX_QUICK_PIT_ITERATIONS (MAX_QUICK_PIT_MS * PIT_TICK_RATE / 1000 / 256)
+#define MAX_QUICK_PIT_ITERATIONS (MAX_QUICK_PIT_MS * PIT_TICK_RATE / MSEC_PER_SEC / 256)
 
 static unsigned long quick_pit_calibrate(void)
 {
-- 
2.55.0

