Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768469;
	b=abnhIOFTYwJxy1T3y2KTX1EeG/HS0fL+3ighEIwEiNNdQkXgStluv9UU4PZalObZDO3/
	 r2uSiZH9GgJcfjKB89gtK5nkYnBPuhgmklkl0m/xam0P64SnahEUBo8NEoJT+8UcezP6S
	 diM4ywRkWkr1PNNMuu+3LEI6986me+GEWfxmPaLmN2qRB9BvInPDD+JhkWVfd6Jmg4vvz
	 QCVSTyFKAOdtM42YW++NpBbHjrlXLTmErl7SuN4Zexm6+aJgXQeWfxkfnk5ujjPUNR3Y6
	 Bvfn+mnVGP1Aw76rjdSesIjx7kFA34yKF6RD2L6i6EEc5HqQ6yYbNQuf4knDQsGdNWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oewgzR4xn13Bd78ecEXJNLxu8ugTTEDhQUiOi/0t/MM=;
	b=eDJkkXpMNMi+crfAQLfU527kP/803mI0nmmc4PNMZGjSp2Ep4vqNEPXRC15strOetEFL
	 jrFVj4daSHzEz5vnqVNY51pUZrSIThpY1oqMf2WJNUUFdiRtZtBGY0NdMEXI+gO9ahcJk
	 I8D85Oy87Wf0SROyCaZfRLAp6YgnraazDsRCbXYRuUHlbe2Thm4QkCWfl/IMclCHseaC1
	 sulOdRv3wj1xrb68aOvLDoPAne2ZTBeLUGHlaU53socT6JQ/LQkRe+551sGwxUph9oWjs
	 IDHU2knD4+yUP1pkhNep65KiF+xXvt0FSxBOG+tijesK6x+qN4ih+sBcC3oNsyd4Xwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QcbuID4c;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC281606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC281606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QcbuID4c
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so1127992c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768468; x=1793373268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oewgzR4xn13Bd78ecEXJNLxu8ugTTEDhQUiOi/0t/MM=;
        b=QcbuID4coe6dhJKc8L6NBxn0mtS/TdsHHpghkZ5y0dMCcOkQSi1YW5d43LN7Xt520q
         /UUeg47vLAxUTeZ1I/wfBHwa/pfFPvqnTaAZm2FblFdOcwBXZWV4dPL4s1nNfK0DTuNS
         tC+0MMB+mDpjFIgXKhgd2uCAnqZRITrWgIyZdgqa4YFR17z39sFlADenU6CqhezK47le
         e0hR74YuqID3R4oAGI+woxpBsczw59gB3Q0Ega96Z5hlvarWjKs7edRmk/VWLFKMjKmh
         9gmhY9JkvvG2aXaisPMFlDHcLBWeKFmJUQn7UcPVmohO/SNqBXmxncOSDOUidholz39A
         oBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768468; x=1793373268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oewgzR4xn13Bd78ecEXJNLxu8ugTTEDhQUiOi/0t/MM=;
        b=gf+elSll0wI8W9DsE49ZBpVH+H7vb8X2eGPT4DmKvAghrVGN4BcxfjsM3p0/v5iKkx
         QIZvg3gBEYGIiKzTFFTYm/5ssGZmSTxVB5NAvaYJ069hMssAgCNAYsOX3jgiGfBgwl5d
         oPq4Dlhbem7icMxI2g2PYqPRNwAihOXGmhMv+lZWs7wt8XLPsTGNrKXe4lpaqHDZAxTN
         3hVlnhAjvZfkTNMRzFkQ3hkvUH8ywl1+b93cwlZMVnBXjd+ws76eYSPX+dHTtCeOI6cH
         XXFeNHJ+INEc/vesh1SL0sD4F3DE5OWyqcux+NnCzHjDLFeuQsnI7vRvvMts82kBK0MB
         Q3BQ==
X-Forwarded-Encrypted: i=1; AKwUvByMEZLODdM03WZJr6cbMBiL+bOETcqBhX3d4q5dyPYf2Tv+gXS57IAk/8Km3811+mhVo/42wD6BzU/xtS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWVseKCug1AVfy/corc0sCkoEqyePhS9OmJ5AoUbdy5qMbyQYN
	GcUXVHbPYNau/2U0CzpzVaVKemj08FZEbGpJpqwAak/4DFlkLSRQVswj
X-Gm-Gg: AYBFou1pKXW6Gs5PCj5EmwQ4DNQtsKOSt7Djop4Z4qEmw8JAI1Gd4lWmHMW+fpNS32+
	+aFveqJ6RT1G4dgYKnvh+ErKyRKSAxc+c+VrTqRgUE1dJAYufjwxE3DchEb/CeyeloOUqn+qkgT
	7XhoNNj+se15e91JTbDkWJxPo/FStz6Zv3Fs7unxlmSnZXXWdV+8c/FkvNmFXcrdGoMzzdpybxM
	ewk1uDLlPDynGNpNzfxiDItzg7FiISokgmJwcPbU3sY5ws/VScMlZeTLRK2ol4jNw4dHCV9pz8i
	vWAYmSf4bUYQKARpGeOxV0dVUGwNh8xT4x1bt+FdXXsKtu2G4nQ2EidWwaz7RrwoQ01u+ECmypW
	wFCd1jl1ETS8cq84u3b2VaMP67UPFiwnssqFSAl8/+TBhvfeVt5Av2JHrJMmsDUt461kxDr4Wdi
	bwCqJnRcWoo/2O4D6c4iCAN2iav5sU4l2JTuFHGSeJ1C0WfDTOuyRjBcDsJB5MeVTvaCP713H5r
	M6/+CeTD8Qq+dSpj9Pqyo/z3H608KrrgQLK9lJOEpuinLKwiF5s73Han3wenYxg7r3m/OrlU+Ju
	4AwFWeldYwt0lmiLXDw=
X-Received: by 2002:a05:701b:4212:20b0:163:a197:722d with SMTP id a92af1059eb24-195bfcb2992mr3658455c88.4.1792768467882;
        Fri, 23 Oct 2026 08:14:27 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197ec2bd112sm625721c88.16.2026.10.23.08.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:14:27 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Liang Hao <haohlliang@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpiolib: Add irq_set_affinity helper for GPIO line IRQs
Date: Fri, 23 Oct 2026 23:11:04 +0800
Message-ID: <20261023151209.58772-2-haohlliang@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023151209.58772-1-haohlliang@gmail.com>
References: <20261023151209.58772-1-haohlliang@gmail.com>
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

GPIO line IRQs need irq_chip->irq_set_affinity so user space can steer
affinity to the upstream controller. Hierarchical domains use
parent_data; chained controllers (parent_handler, no parent_data on the
line) store parent virqs in gpio_irq_chip instead.

Add gpiochip_irq_set_affinity() and GPIOCHIP_IRQ_AFFINITY_HELPERS.
Hierarchical lines delegate via irq_chip_set_affinity_parent().
Chained lines resolve the parent virq and call the parent
irq_chip->irq_set_affinity() directly. Return -EINVAL if the parent
virq cannot be resolved.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
 drivers/gpio/gpiolib.c      | 79 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h |  5 +++
 2 files changed, 84 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2987051d9904..0a4626579963 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2104,6 +2104,85 @@ void gpiochip_irq_relres(struct irq_data *d)
 }
 EXPORT_SYMBOL(gpiochip_irq_relres);
 
+static unsigned int gpiochip_chained_parent_virq(struct gpio_chip *gc,
+						 struct irq_data *d)
+{
+	struct gpio_irq_chip *girq = &gc->irq;
+	unsigned int hwirq = irqd_to_hwirq(d);
+	struct irq_desc *desc;
+
+	if (!girq->parent_handler)
+		return 0;
+
+	if (!girq->initialized || !girq->num_parents || !girq->parents)
+		return 0;
+
+	if (girq->num_parents == 1)
+		return girq->parents[0];
+
+	if (girq->map) {
+		if (!gpiochip_irqchip_irq_valid(gc, hwirq))
+			return 0;
+		return girq->map[hwirq];
+	}
+
+	desc = irq_to_desc(d->irq);
+	if (desc && desc->parent_irq)
+		return desc->parent_irq;
+
+	return 0;
+}
+
+/**
+ * gpiochip_irq_set_affinity() - irq_chip set_affinity helper for GPIO lines
+ * @d: Pointer to the GPIO line irq_data
+ * @dest: Affinity mask to set
+ * @force: True to enforce the mask without online CPU checks
+ *
+ * Hierarchical irqdomains with parent_data delegate through
+ * irq_chip_set_affinity_parent(). GPIO irqchips that use a chained parent
+ * handler resolve the parent virq and apply the mask through the parent
+ * irq_chip as described in gpiochip_chained_parent_virq().
+ *
+ * Affinity is programmed on the parent irq, not independently per line. GPIO
+ * lines that share one parent irq also share its affinity; updating one line
+ * replaces the mask for all lines on that parent.
+ *
+ * Return: IRQ_SET_MASK_* on success, or a negative errno on error.
+ */
+int gpiochip_irq_set_affinity(struct irq_data *d,
+			      const struct cpumask *dest, bool force)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct irq_data *pdata;
+	unsigned int parent;
+	int ret;
+
+	if (d->parent_data)
+		return irq_chip_set_affinity_parent(d, dest, force);
+
+	parent = gpiochip_chained_parent_virq(gc, d);
+	if (!parent)
+		return -EINVAL;
+
+	pdata = irq_get_irq_data(parent);
+	if (!pdata || !pdata->chip || !pdata->chip->irq_set_affinity)
+		return -EINVAL;
+
+	ret = pdata->chip->irq_set_affinity(pdata, dest, force);
+	switch (ret) {
+	case IRQ_SET_MASK_OK:
+	case IRQ_SET_MASK_OK_NOCOPY:
+	case IRQ_SET_MASK_OK_DONE:
+		irq_data_update_effective_affinity(d,
+			irq_data_get_effective_affinity_mask(pdata));
+		return IRQ_SET_MASK_OK;
+	default:
+		return ret;
+	}
+}
+EXPORT_SYMBOL_GPL(gpiochip_irq_set_affinity);
+
 static void gpiochip_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4077dc678cae..a772bf1707aa 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -658,12 +658,17 @@ void gpiochip_enable_irq(struct gpio_chip *gc, unsigned int offset);
 /* irq_data versions of the above */
 int gpiochip_irq_reqres(struct irq_data *data);
 void gpiochip_irq_relres(struct irq_data *data);
+int gpiochip_irq_set_affinity(struct irq_data *data,
+			      const struct cpumask *dest, bool force);
 
 /* Paste this in your irq_chip structure  */
 #define	GPIOCHIP_IRQ_RESOURCE_HELPERS					\
 		.irq_request_resources  = gpiochip_irq_reqres,		\
 		.irq_release_resources  = gpiochip_irq_relres
 
+#define GPIOCHIP_IRQ_AFFINITY_HELPERS					\
+		.irq_set_affinity = gpiochip_irq_set_affinity
+
 static inline void gpio_irq_chip_set_chip(struct gpio_irq_chip *girq,
 					  const struct irq_chip *chip)
 {
-- 
2.54.0 (Apple Git-157)

