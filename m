Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938268;
	b=e6xSDSgAN00eqU3fXxJUlcCwfOstaJepMQW8sKtca40yI3HM9flBCK7QGHSfws6FShPG
	 cCwCdrSD249CLRejV+b8HbWpLQ6oNjbGWSQcUQ2HBD4fzSbSLvxZJDvTjn+jFsa7XQXxT
	 jPKI9qAY9pPwgQ8LseYJO5Pllpz+0SPXbPYZEtC+cadAV6IsQVjD0rbKZWWQvgq+BInQy
	 W2r4X/phg0NX3I/X5VPMFPrqn1xQavXnloetltQ1twNu8U51R1qVrMTs0WtXZ/kG/LwIt
	 VNHZ0x4nW8xtQr43ZbY2y+S7hkj+uXxh7LAaFOWRvthYaT/zU4OCm8HL7RaesDKolLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
	b=ynyC13dhwuWjsVV7OxtyANiwnQcemds0hphOjY6AUnmj77+Fu1nGLbwETXmR9hlrTi2X
	 2cYKP+ojsdqEZXcbtZkPF0Wc/s8TDD0P5u2PijXsxeH5xVkmxFcH+VfpOdYLb2swJCQHW
	 H3DPIAjn+En57tC54+SyPv+ik8xaMjlK6Oe0Tm9eZ4sn7xDCUWM34ZrcNiDae1X7AS1Kz
	 l7R9iIPuc10gwSUlG+ro/jIYLtlC/Eux30k27fGTyVUrHD8GT90leVXYHtWZDOOsA3gjt
	 FEwss+YGNUvQvh38s1N0NNrT1qNEXMIZBnCYBVPDK8YgxIx1CqqAaL1WMKf2r93L2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Epi+zHdY;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A310C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A310C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Epi+zHdY
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4962325e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938266; x=1793543066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
        b=Epi+zHdY9uj5Qh4GmbLn0c9fG1qLVwmMUJekFur6AVybVXQVMo2vkfpiotMjNeCVNy
         uEQTmmGcnyNjpmO9kgXtrDSoh//Au/VIroZxIhPfd9mBXmVK1WXFmx4YppPKlBArakAC
         F0aGVWzGKySrvqzRDZT0OiqA8ohorStD05hnqtlHCuP5LVEkL6sO2HuflsKm7+zXe4oZ
         xOJOVi5g20kNBerWoG6+BHmVJNFsN+Li98bki5uVncwKUWvmFHBeH2tEqCXbGYxippzr
         B4gUcUX0J8ON0NR9z/5f1vd5CfN0gK7iXS9Axp+6XdzNj4zBi9lD//SGjCjUv3jlYDkj
         Y9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938266; x=1793543066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
        b=QtN+LAWBCTHUXADAJV+mOOc3r8A/fZ9EoVoIPLMN+4O/9AhRLrxYOxvkUNu5S+zKLU
         pBm5vKm/2wax28wQJJCGNEQ3k7KeVVgkqF4y+9ZY/Qy8DQiaK2XdLQpYLiaV5sdo3LoH
         kqqw8PM20/ogy4gBzbI2IQ/mHtJgw+hwx0Y6RjV0PkMSpVJZf9b6OWHWsXAd2InQCIRc
         Rb3Y94NRMIWskFedBYnNsZmaRc/JAU/k3vv34FSbYSPsoSQGoFJgOYatBWRWNFad2oHk
         mbYTDmTmDO3t0ZL9e56szxXz+sGLpHuJSsdW3O2M4dcpI2OhNOGYpkpCjs2bQfBNmRHM
         Fv8A==
X-Forwarded-Encrypted: i=1; AKwUvBzqXC6NhBjkl/PkGIw++0vKaGfSSvNzTB5W9bGp3jX9CYKpjjs/BPxdN+0Jm4JQVRHSJbGOFBkhM+C8+4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFswG8hWFEuK9VCGAF/a3ftU8wI/H+Je7SGFpo93G2wsBUgLoX
	K1VwVyI0x7i4dV6XdaJuq+SPn5ZJhrdF2FGb2bGNg06hs9W2zHZEPFmY
X-Gm-Gg: AYBFou1EGWrn+QseeE/RxzljEfAEH/dtoRzxrUI0b5hktTA/y5P7kgsXVsFWusUZoVG
	d7UZB+JEgDE/a1oM1RduRYJpkXL01ViT6HSLussghRKM+0uwAsJ1T7d9zSFArFrV7Syvq4AfOtN
	0pxQqyacx7HlE+43UcVRqkJWUFQCgusY3+ng5nkSnSvmkS68bMmuSOEQ/V1+NrU30vlP4oKhXb9
	zPBmZuf6PvoDeP7jUXWBqxd3SuTcYdgjvhMS1HCdK+/gKYQ6F82bH+wkw20XFhTmH0IWNFJPj7G
	oGUr8kV947HZ8SabatyVnnV2vsaXMv4HNm41z3z39CDgi2xBkULMI/sNmcGUNUMDqpEnytV1XMe
	eveFcEXobdN9ZJTXYxI9ETM+VClS6XsQkBaD2i72yCBLWEI91ku0d8i7inclv7dQnBN/OCGwnQg
	ryvk3Ilg/b+R8iYjSk1wzh4pWSNDOQsK8DRD9a7qoRedJqgxSrvJYphnJdOFSt040omgjCL9LGY
	17fmcwQFRU5HIu8i2orTuK/xTt8pSbBPLUiWjB+2sW4+dHJIsLhQfGipLKjtg0yn0zwakc3e8yp
	OG68c0kXfPM71Q==
X-Received: by 2002:a05:600c:5307:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a35acc41a6mr66595165e9.35.1792938265782;
        Sun, 25 Oct 2026 07:24:25 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:25 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:10 +0000
Message-ID: <20261025142412.112216-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
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

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. Apply the map to the A733 register
layout too, which so far ignored it. This also fixes PK on both, which
was numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 801f62abc93d..940942bf6f95 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..9c5eb21a86a5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index d09467ed437a..57a1e5e48f35 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -248,12 +248,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
+
 	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
-		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
 		       A733_IRQ_REGS_OFFSET;
 
-	return IRQ_REGS_OFFSET +
-	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
+	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
-- 
2.52.0

