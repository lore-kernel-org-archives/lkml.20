Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523512;
	b=m20KU+edifY/rMJ0B/UKZygbYaQEZiynaeqJXiEq5wM96bYMIDNsopshb55PLf+pTV6d
	 OJwXf1viIItWu4k3GAWGF47NZ1Bz0Y1HUP2WxQAgL4gT1qfgVzzKajazEENrB4Hxb6g/n
	 YBLVAA3uTaSxkDdLBDpoAn94xXdbFkfmYQMc21CBAu0HhPLFjKCp4BFFuaI4Q27eCEmEO
	 zBVQ0ADA2dj1CbJfKHTs6xR28EshSpUkNhErZ6X5COPZSeLoTZHOyVji0kRbb0zMDpMlQ
	 cqwJE58vfFZKoVrfOTO1cvMvSLRIk+W6HPalqBFxYpcGcdYhBfNXjYKhpav1PHaiUKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
	b=fuN+7AhnpkfAV2RfDycFR2q2o/4WZO785RW/LLPX4++E0Z1Nqm/8HVnEl55dYJ9zoflZ
	 6o9ISJNXJ0EJwUgZG5EajfCpKUTMJcK2IUYoP1lQt5nnoEvghL7rTaYNYc+Sqg+e5LEKb
	 kK24rjskl96ZnczTLPqhqeiYlEuaGSA9tRGaA9YwCzY4mKyrx36IKyz5V9amgyF1/OX4z
	 oK/hNR/fEOEmwQqQtQCbdKXMq50kXq05JCvu7FKCWJ+RCyR10yykGiLH+eqpHlyo9YNmQ
	 f5cxG7G9UUNu4GWRKcmnyq9BA0l6da1/CBTLmRVVzhaXeuxC8qoLTmfbrLgHNsHhy7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quIDXCH7;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C34606A89E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C34606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quIDXCH7
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb9f760337so743105a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523511; x=1795128311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
        b=quIDXCH71r8kXBO4zdmT6LlbhiXdMtjp+QUt18lWxGcKuvXZl0oapAUh+5CbIZgcEM
         eza9piKdYYEMXGeQX1lAOkfvajpigt6BwFfJnhk5WQqSleQPoJ79KpXVeFnwCrpfqhm5
         87SyjImHW5l9njGveuPp0mszSohcMwz4FGBradmm6xHemQg6a3CYs2U0yDk1dpdbvjEg
         AAZhhd3QfurDN/KeTmh/vEGjoLTFPqwROznszY42kem+2D4touGKyC1KIcB94OzwjGAI
         FK6giG2TtiPTot7bWkFF71XJvy64c0wwPcyA8SrckymUwNa5ysC0P7+8qVXCKkDny5AQ
         wHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523511; x=1795128311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
        b=mzjTseTlnmt/lWiag6dp6OztGELg7JBeleMyYvBQt0cXZMc17SttaKG4/113LRLY5Y
         EVdn2vvkTaq07dSFdi+y6NlMIvkc6EDurdSqh6pX84zqT60SqZVTt++c5doBAtAa6wbL
         FBtcUlqDl9o1x8NWHB76xMbvku6Mhd3UxgOfzPKQ1tTVYIejrUoUs4ol2Osmh8aEFCnV
         etfE588z5eOWeoq1ZVQ1XHfGFeOd8iqYIyJD2AavBDVZAe+RokOc7frLsTDRv6Jzzn8g
         9wt/suM4cY7YKJMTlWMN2gpf5ztBSzKvvABvYE53htmNHUtt9PqkDKtQ15NErOKX5dH7
         z7jw==
X-Forwarded-Encrypted: i=1; AL+hErFXfpW+CidfKQKwWBOSIVGSeExcmKWXp6qj21wniYGI2LlMTGZR8dQmMkYV5NE4y3I7J8zCARRc+GIDeVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rypb1oFBRuEdhqY09AeRugMbcqjFNRbvkpySIzzYsaVA3oPn8
	W8SQr22U2SqqqXp9/FnGdCQu4XEWathM7Nmv6BxkiMi/EuwHpeqwbrx8
X-Gm-Gg: AYBFou357XI8NMEoFJI9Z/1UIdFn6KR3jMC6H3BhvrRXiwBuY17E9bOPl32u01o/WvQ
	nKGvLsDhFp7x5v9KoeQ6QDs8a64FNpetjZRyRvijIAK7slQye3hJNo+312q1mfkETKkUvK62PQQ
	UR2fEt4tPvboCMw1qgvTAE0sNzmFPV0e2eg0fbrGm/r3rOahBn8nrZi9ehFZfbetU1SggQWtu+v
	N1sljvc5uWJmqV0dDToX4JGXab6Q4rNgxKKl2yESi1qs4wOFL+8KQaEAo0Yp0oI5M1DBwe+eNWy
	2qaYt8Vmp/M7Va/G8KliLe+4kOaZCLdFNomLgzZU4sxUt1Lug1pzv/k63KELYY0YFsaZrGQGgZ+
	S3OZTPWQR0JrVbLJ8F8uIEHJlkda3Oozs4efmf9Dr7Ri7mRkrvZy+OJYNeIZBDA8rx6v/rlfDyq
	9cRbZq6+/nE4yl34reoQU1UCAwXilw3wgB0qR/Vr9lbYtsJV3m3y3m6AdSPGUrMHbFvBSPnZSap
	oYrYVSaz9lB/4y4/4rmc1C+GEXI52xpdY+4bvJWFgI7NWc6+3VwfJZ8BuW237f0h4T9i6eFQKia
	qDzcMD2/g926R096ikD3nXtFlJjZqoIl+DuK6P9wS//CNCF8gLyEJRC5fymjy7LeZCZtXDsDQE2
	ZlUyM5S/52rlFyyvfsR/0VMY4H6D8+E6A7C92enQgyVGtcvOvdKFlqkix0itn1RiH4MBuxn1fYm
	Qd0w0UOsxcquWAo8Kbz/2ryx8=
X-Received: by 2002:a17:90b:4a84:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3b1b087c2f3mr285721a91.4.1794523510994;
        Thu, 12 Nov 2026 14:45:10 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm37073a91.4.2026.11.12.14.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:45:10 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Radu Rendec <radu@rendec.net>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 2/4] irqchip/ath79-misc: map the performance counter interrupt on demand
Date: Thu, 12 Nov 2026 14:44:43 -0800
Message-ID: <20261112224445.213324-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112224445.213324-1-rosenp@gmail.com>
References: <20261112224445.213324-1-rosenp@gmail.com>
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

The MIPS perf code now asks for the counter overflow interrupt when the
first event is created, instead of from an early_initcall. Create the
mapping in get_c0_perfcount_int() then, instead of when the controller
is initialized, so that the controller no longer has to be ready before
the early initcalls.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-ath79-misc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 258b8e9a2d57..5cedea5234e0 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -23,11 +23,19 @@
 #define ATH79_MISC_IRQ_COUNT			32
 #define ATH79_MISC_PERF_IRQ			5
 
-static int ath79_perfcount_irq;
+static struct irq_domain *ath79_misc_domain;
 
+/* Called by the MIPS perf code when the first event is created. */
 int get_c0_perfcount_int(void)
 {
-	return ath79_perfcount_irq;
+	unsigned int irq;
+
+	if (!ath79_misc_domain)
+		return -1;
+
+	irq = irq_create_mapping(ath79_misc_domain, ATH79_MISC_PERF_IRQ);
+
+	return irq ? irq : -1;
 }
 EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
 
@@ -121,8 +129,6 @@ static void __init ath79_misc_intc_domain_init(
 {
 	void __iomem *base = domain->host_data;
 
-	ath79_perfcount_irq = irq_create_mapping(domain, ATH79_MISC_PERF_IRQ);
-
 	/* Disable and clear all interrupts */
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
@@ -157,6 +163,7 @@ static int __init ath79_misc_intc_of_init(
 	}
 
 	ath79_misc_intc_domain_init(domain, irq);
+	ath79_misc_domain = domain;
 	return 0;
 }
 
-- 
2.56.1

