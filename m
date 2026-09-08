Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496854B0487
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860449; cv=none; b=RJN/AL7dW5D/QsfcWLYIkpQNSE5kbgLS+hnKg1F8Z3JmmE2OSOasfvEBUeey2TRc1pNUfgmycmxHfcbBpjWOzULjHXh3vIaEN7fJMQ4/MkE2USvAHpbDDIL1dQ+JnvsOtVRNaCtOXEb+mhdI50f+M91ePvt0RP4klRfUnC00mMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860449; c=relaxed/simple;
	bh=QpFNHjfVXgJC/IwKsByobIapsXNmXN32X/aqquhMSYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ut0I9WwK6hdlwugurNBsJCeCVxG3I5FFclt82Iqbm88MgrtvzwieIULadwYIMoamuNjkZAUblKGjEoWH00DQ04FZNhbX6zCjRgWZ3b1GolKJJ1UebE4ZQayfpKe7ynajeNaXSOUrIKSe2KJA2pDccdS/0KSlM1clnRxE1TvgEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epx+orfx; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epx+orfx"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso5642646a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860448; x=1789465248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyeW8+b7nlSV0Lt9JCJpKIAuOzaL31bvQxWWs5y+0bM=;
        b=epx+orfxTFtDmRxNLD+OXh6Hm5OsJe6ofJb+sBm4hi6wwbP1CtIMwOblvlZOiO1fij
         m5VzFwVsvbDupvKwoUvHctlcBImMMwjxIVsURUh8ZxFUaMD/zlNh+UNjnLMVEzrqgl8u
         Zyjb1sMyHu3VVZIz4kW1ompB1Y2i9MZ6zDq/3RngNT1risvbdXUqv0mK9uYS1/iDFxKt
         ZI0S2Aiy9Rtk15lMqSmyLm9BoNHXl+voa9IlmTEh8AIMEdJBO1vC9lsjYyAZ4axnoaw6
         0DcjdDcv/8gqSXjdNkBweSBO9tnA4rHbarQNrRLJGbWKT8PUQNLzNJbZfzJRQ6HR9sin
         4fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860448; x=1789465248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yyeW8+b7nlSV0Lt9JCJpKIAuOzaL31bvQxWWs5y+0bM=;
        b=QkrB//ihOGNWG9dWP0o/0y9n9yHDrIql8oYLo3t1uCbow+WWyWbsUmQkoKXYRFLJ/0
         ry4scZO7UDCDxpLfci7m3cISkRKHq/cWgn7i7LNtCxVqyltwtrMJZAyeDHmK9qGlFHZ7
         wzkq9UlMUZjTf5rRNl15gJWwmxxTlqNiOy5f5JKeN024jn3Ve1wFtPJMsbAJcRDheIcB
         X3feyfrLbJCMQvt05OGClqQVUZ5wQH4OwN72+Mylava7lxjdVdH8/o1Mo587DcBY/8M7
         IspuXxJuciJlKT396/++wiUByInh2lxkdwiTyEWEApcFsQna4JEd9G701OYv83/3EQFe
         jhOw==
X-Forwarded-Encrypted: i=1; AKwUvBzhDMzyOkkAaioQNOVmvdSh8BwksJkhaD7DmBaqoJAzcBK7sTG8FncLA8fiJBPSyMyjvEaIdVk0imvTYWw=@vger.kernel.org
X-Gm-Message-State: AFuF++lHv2zBkZ7QXr+n4kJ0LQ42XSBmnx0+6MkDpf0oJZOr1w8SL0O2
	aA9lUfGbut4QbwNr+5jOTjM0TgL9DjFBiJbHZEQMpiz3NT4qwLy44Zxt
X-Gm-Gg: AYBFou0OdQXkF4eZ3EV3BsieCOWTj8zEh4fH9AXsxqcqKPDdyF5dm+A38zBZk9Dq1je
	5VyuZxpWYie204rU5k7vLTlsoItExexr8Ex3ceNM9/WQDusCNdBZ0Ks4R2EpbmZcdlaqrRjE8j1
	nXBDCYF46cWdcviIo17avoYliNSaZRVZKb4z3mHp30gpTftGUDHKTu94cEFIBCAvlWOmw+Q4Ux3
	gH0cwSllcEl1owA4PJybjaWyDwEfiNR+t0Ckjjm+bU3sqHlRHwK8Vtd21E5PTzk0HSsyfVpKQIQ
	moK8pzN+ozOahQ3H0aFLofpzZOIKZix41HHcoowJIjiNJ4cjJg32ylQnZAoaySZUb3FuryiaPyZ
	Zo5GMQBmkVknCyyqyAAym2ZjypXEOHhTnt7wBBbAd36CZL2plv5ETeinKLaMmxBfMVW5gku7Dph
	tRUbPbk1Yx5ugdaWOGtfURf+bvMxNrw929V74jmm2iyYxWz8Mouuyc9rv9D/KD3ydGOub78oEd/
	3JBp4gVLNwZIo7fAwbjrDk/Dfpo7BhdMj129zRcpXe33bqxrXdDTclbn2SQ+rEG9Q==
X-Received: by 2002:a17:90a:e703:b0:398:d843:cad9 with SMTP id 98e67ed59e1d1-39b26226de8mr44201364a91.19.1788860447592;
        Tue, 08 Sep 2026 02:40:47 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:47 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/6] irqchip/goldfish-pic: Use for_each_set_bit() to iterate pending IRQ
Date: Tue,  8 Sep 2026 09:40:12 +0000
Message-ID: <20260908094016.1997918-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use for_each_set_bit() instead of open-coding the loop with __fls()
in goldfish_pic_cascade() to simplify the code.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/irq-goldfish-pic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index c3c33f066140..12113ca90872 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/bitops.h>
 #include <linux/goldfish.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -35,16 +36,14 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 {
 	struct goldfish_pic_data *gfpic = irq_desc_get_handler_data(desc);
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
-	u32 pending, hwirq;
+	unsigned long pending;
+	u32 hwirq;
 
 	chained_irq_enter(host_chip, desc);
 
 	pending = gf_ioread32(gfpic->base + GFPIC_REG_IRQ_PENDING);
-	while (pending) {
-		hwirq = __fls(pending);
+	for_each_set_bit(hwirq, &pending, GFPIC_NR_IRQS)
 		generic_handle_domain_irq(gfpic->irq_domain, hwirq);
-		pending &= ~(1 << hwirq);
-	}
 
 	chained_irq_exit(host_chip, desc);
 }
-- 
2.55.0.979.g7e5102b832-goog

