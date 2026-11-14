Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699451;
	b=FtUQDLd6sWJNTj6U/YgImKjRGy4Mz6CjJFYlBI9oTIBMpLbd3RbEtYEcRfN4uG2ZbXB4
	 /F5U+qtM14Cn4Io15wA0DXpxnO3ogOAx+cofpav1f+M4xFmUkqqy8szkJYyHAIjg5vYB5
	 hrP4eaEqs/lJuuiC/xx0M1T3rma+RLICFEJ7dvYyYS3zkhZsp5dOGaN3WpbWa5La/K2V8
	 MA3cZT0gDJFZ04J0iCXstoftH0PLgUXUG16hLy7+CwMR2NH9AHGRpYixBJ+uuKgYOJiLN
	 BpbrC5o/hRjfl0ubzawqEftpYXjAJ5CwD5ITVyZrU7qzZoPMsHF9uSKxElNf8u1mLMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
	b=suon4dCaC6ZNBSNa8b+djSAqogmF7LczgxFT5VsGgNNnQY7d/ySgmvMPtvfl9AyHwNf2
	 +CypCbeR/Z4j+FsKV31HVoJgC6HxBu5FCyS1ULBdjaK4qr1M17fq/3VIC702qFnRxOAYu
	 HcMMM3ThRBkuT/R0rISevEbU575EKkip4n0Pf6HhWDkSL/mX42teS63E2iCAsDJkw8zHA
	 LIMAr+El1LA1F0QmMlVOLAwu+YGVL5VEbS4zBteIKNfxYWUH/7NPygSlrcZ+E3aWCXB+W
	 jzamzLYNIFvXqr3sSmN1IDgOPDrSqYnTxRXgWLDE6fM+tC8QSCb82pOobrw2Ds3gUcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGGj8G39;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33CD606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D33CD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGGj8G39
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso2410765b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699450; x=1795304250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
        b=sGGj8G399ZF31uILhnt5fqpBTS93oUlFlXCu9ne5PNel6hESS6eCg5Cx7fn3ZCBlFe
         oxdxc4STyzHOiUpheFiC2TsLQ/nQFezbJ1bVf98u+8/TdF8CZ4oolWnvdTaOjrpMgC9O
         mX+erfavcN+ALosfLrNvHxOUVX5hDGRCxrf2DYFN5vlwSqM6bz/bibjBYxVL4O9FO7Os
         kQqE/sTCymdhbLvav1w58eVJwr1Ak+cV4ilPGNYlgYUkVbt/72MvEq71q0AQ2uU5qKVQ
         bzJCsunwS+EYxAF4OdP66Q7clln3J7cD6t7FaUmp4sPiEadxRjJ7+PT1YCpvPhgNxRhs
         AWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699450; x=1795304250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/wS6Yxk7+tECj0s54STfUWVzey+C0tieK8m7kinAtY=;
        b=nlJgHqolMiMhG2feNNPBRgj4Svc2SWmAEgUbr48GajJS+adQRW6d878IO0bLaAhtu+
         14ZQk08HPHg5wgKDd4dvOVbRBTSbq22RnqajnFdMpVfb3oGjEOze+Uwj/uqMyVune7GS
         36mDs7Z14ia7m0jpS5pMdFQg48ilITBDT33yubzx58s8Op7Pt1I+swTHpIjr6Z2XL9gN
         L5BWWdVCn0Hfc/iZ3B2NbF4rnVOrcuQzIjV+NLAqXeS7GNiF0GGzaTE177Ez+bym3DMw
         2FR5LMBc8G9NBXmzDdm4mlu8NxOaqsTbOeMM9Fgp3WAeSEr8qfpsP/RAQhAnBNcBFU6L
         vR7g==
X-Forwarded-Encrypted: i=1; AL+hErFW24Uv4rPc6ZVfTurpV2tjkUi05Xqa6JEIx0enIN6x1nE+E9SvI5i1vj9ftnHvqXQ9FsJX8dSFwmLGrto=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EZerpwMUc8dz4E7/0fsDHBGhSrON/qZ22BedglynFOm/iv4HR
	dZQxv5iobevsAGP95EXyAQPaseQlA8xzHQ4Efl8H8AeTYW6tGmCgMYJ/
X-Gm-Gg: AYBFou1GCMxUPfN8CyvbNPTDhDHvHo4Q5B03S7/hmGbfO8zoGbE+s3yyZlV4C8apoR4
	wWjlcjOse9w9m2pW/wzDT9aKBgangveic+BO5HozhINZcK2EYPBQa7sXRceVVi4U9zh/2BWUIgF
	kzW6nSGKnAKcOhmUAeHKE2jcYY9RE0tB4yxFTpx37qUCWJHcMvUvN5oEXsyTXPcumFyTEe8m4A1
	VpzQbodWVmuALBDJd8HTJDhyVzSUknDdXEToq4/holgUYNviZNQqJNGn4OJVyaP3a0SpGOO6YtS
	Kauk5P1PYtMDS7Hj9zmOn3Pyl7O4VsUTe5UE/LKk0esaJatHHCt3QrSGsfump2c9HTAHgpCqI76
	4D0Zgdq/lbis52KQRR++/SZJB0GqOUTovtpVsYk6h5itUfc1sIUoga6KqKvcb2m/BacA9yqSQnk
	OKh5hFB60TtZI+Eyo6BBZAiUpinPvz7fvGV0N2Bg/HnMj72qUi2n1MiuHJoId+ezkUYxkvasdbo
	UMLx6i6sa88hl2E/jY5TPdrjmy28g8fst51VP7sGvxMWPhzPkKKGj4JAlnD8334v2tdk80AFRtk
	G5oMXJAkMiMQ2GHD3MjzSAGYX7NpMsBj4z730XwQIEJUYZUUcpVyIFBwLdzM6TniKBWVA+BU4EF
	3N2oQDvm6JOdjv1KjvoAImVZyKp3sYC39G4jAZxrA7NNff4xHxkh7/GVk6Ymp6o9YtvN5gFO6+d
	UkKg==
X-Received: by 2002:a05:6a00:2c95:b0:878:34d7:697b with SMTP id d2e1a72fcca58-8beb7d1cca2mr6147034b3a.41.1794699450161;
        Sat, 14 Nov 2026 15:37:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:28 -0800 (PST)
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
Subject: [PATCH v2 2/4] irqchip/ath79-misc: map the performance counter interrupt on demand
Date: Sat, 14 Nov 2026 15:37:16 -0800
Message-ID: <20261114233718.86520-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114233718.86520-1-rosenp@gmail.com>
References: <20261114233718.86520-1-rosenp@gmail.com>
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

