Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572330;
	b=RQK/C9esfE5G4DskY7RCMR0nRF6zwWp8falUCcRTgyVDo4A5sv1tP3DbOKN82/z9hBeH
	 H1dH5R4j41jA1rMDtQNHofFb4cCdghyPIv/XBAU1xTWCo0vdo0hIQI/YrxGoqEnZzvanV
	 uGN69CjW1XqenSbAOu1cJG85LwEphtxMxKLdWpcUdNFHzXvu4e8m1M+mtFIcJf4w2RI0k
	 mxYDOPBgI0JySDHsdnGP8erQHWkWj4/geLMvaXMLjDGDXnpBLySnJcxlktgFeBQyJj//O
	 //h4dOqwS9cjB0lRiQrJgZBesWFBiyVpSjN2N/RGw5qtVbiVq9O1fDG4VWjPHoaMjQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QoUYqEEH+0gU4KmqZ9aJ26sC/GFx+iLxZx0WIWpJHDM=;
	b=TVtGoSr5dg0yLNDJQoc2ovUj/l6VEI7RYbVLTuniz+ViimmNitbtM0LHPidhfiwEHcG6
	 Wa6nWyz+PMhL41o9Eq+c4JRC6HwQl1l5+tzyFDNHKiAtLFWXjLygy2g8xpWesy040+los
	 emxW8Ftrnry/aGJYlrFxCLAxQlvh9pKZz3Mcrq/naK5K9t32Scey+oMN0CXL/p3lonDPj
	 d+mmiG1raQPE0ZtJozY5m+z779FGDbMS0vBa369uPquVU0gTSp+18+Z0w0KWmBd8RgTCT
	 tsmmb62XpSp7902+wI32o1v2eCXcN2jjBwVw5g2w0mnIRtGmn0bKYJ0GQokCcvYfDZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LORef+lV;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F56606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F56606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LORef+lV
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1778586f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572328; x=1794177128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoUYqEEH+0gU4KmqZ9aJ26sC/GFx+iLxZx0WIWpJHDM=;
        b=LORef+lV5mk1U4euf1yzPpEn7oB8+4KqJfSV/RBDbkW+rvlhcsC1KxXILM/vK7KXh3
         C6FKF+kORwBWrM34y3OL1ffTVFZDw8r6Kv/UlTvdAyvXzRaDsoJ3SmpkkefksbidvdEQ
         a6RvURikXnfg6782vg/XzzQCemx2JPirM6jaGSSbV8Z1FYMnTwI4+h3torMphDoL+SWo
         1i9VHtomeM97GEhQDaNSpcdWNTLnaCTLORqh5dDFPiJZ10d2v130Y5FsKwPNOn2/7QPH
         WOKPju30Ptb8urZVLCm+4jc2pdkfpCYdkJlP5DkeV0ONXCrRy77D1+DN9K70qa+jM4EW
         IxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572328; x=1794177128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoUYqEEH+0gU4KmqZ9aJ26sC/GFx+iLxZx0WIWpJHDM=;
        b=mZ7fAYDus2pQr1udNPdrVZqxQ1IajCkKKHpIjnU9bDLnIpOzQAXPpBoKvxeW4gUNJn
         bjfzMWZKBCThqwomCmRJJe49LN9Cfe/3aBqEfB09R3Vxnvjpyr5uSI3ih5wT42sruCHt
         c1N1cVt0LdyYktINVibLxiqnUrn5IHWJFpCWdA+L+Kpf500luy+rxAhAPmR7TKjmF1FF
         8fWq1LHqPy3cm3eESaS8kmJFr3vanF5EU9OU2EnqX+J2OcFTQGcWozh5OkUreSa/Ocwy
         q2Ic+N+Gk6TZPaTHaQJFygt/yqnhpdLT4jxYCX6K/NAAAzzLGRlzIaFmdXN60r8z3/sQ
         L2pA==
X-Forwarded-Encrypted: i=1; AKwUvBxp/3YDlUGp+GUybefOZLwVTuFS1VkRXnvnpCda6dUkiHyOHJQJ+wuOOFSJsHHlUfYQrf/HuW4oaqmwtdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UhDzsW40L8QFRJNcmBgHjlcsqcrdhKBD/kgp5eNOmFohLCIOG
	4xUkS1sqMENN7Snyg98iYRLNZM29G5m3H80DECIM7mB7szUB4tN68Uq7
X-Gm-Gg: AYBFou0Lvg1IDyXL/vvvIWE9Y3RPFjyTcZ6aOS+RWRz7WnOZ7iKFs3RN4/7rB0il+Bt
	GOeD9X0yR2kYbwtPYk5vAK9cUJBHvWJJUzp9J/602Kq6EfNQTVMgPiq+IZ2LdoQ/UL2KUXG3Z6Y
	hw9jjy6xwoxqgmLh0r/7HXFaPgq4whslB5fX/gIfqgT2x0ToWbCS0hJ1+pF/MkAquDycOcGad/I
	50rc0CmmLO8aLceFimlMi7InqALZWgwOi6eD+INZoh1v1HQrgcBbaPPL0Uj8AkL8R5dgae66F+I
	6KT9gfCHpdBh8fIj9GqdbhqcYLU5KYmMh2wak2QlIUPqDRuUOzq41BlNx94EijUZ0/pmVTw1Ea8
	S3jyrIYhoPq0VA4GMnxdoPhT1MeI918I5vA98bmamqBtpqNrkx3Git+LW5RZwEXJq3/hkcriI1a
	iDwLRV5qR3GuH6mtTIX2P6TplqsXI7d4C5W5LNMw/SAe29AMohTUhiLNBEYP60g/vuZ5zDR1maE
	Qsnk/EmX9pp0VEmKMtCga6+xtOyZ9vJxA/GgRbsFrJ46CtLcRfkFEc5buynkiiXNYK55E97vcS8
	RG85iws7nUZHxEEJj45x+n+ha0vn9SsrraT852MBcU7ALXNz8jLzEDVG9itr3nQ=
X-Received: by 2002:a5d:5f03:0:b0:48e:1b11:7ee6 with SMTP id ffacd0b85a97d-48e6e27eb97mr19584699f8f.2.1793572328063;
        Sun, 01 Nov 2026 14:32:08 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:06 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Alistair Francis <alistair@alistair23.me>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] regulator: sy7636a: add VCOM voltage control
Date: Sun,  1 Nov 2026 22:31:20 +0000
Message-ID: <20261101223125.302001-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
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

VCOM is panel specific, so let boards set it in the devicetree. Switch
to the selector ops and add the write side.

Per the datasheet, VCOM bit 8 is bit 7 of register 0x02, not bit 0.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/regulator/sy7636a-regulator.c | 31 +++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 015227cb113e..382bab017784 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -24,7 +24,7 @@ struct sy7636a_data {
 	struct gpio_desc *vcom_en_gpio;
 };
 
-static int sy7636a_get_vcom_voltage_op(struct regulator_dev *rdev)
+static int sy7636a_get_vcom_voltage_sel(struct regulator_dev *rdev)
 {
 	int ret;
 	unsigned int val, val_h;
@@ -37,9 +37,20 @@ static int sy7636a_get_vcom_voltage_op(struct regulator_dev *rdev)
 	if (ret)
 		return ret;
 
-	val |= (val_h << VCOM_ADJUST_CTRL_SHIFT);
+	/* VCOM[8] is bit 7 of register 0x02 */
+	return val | (val_h & BIT(7)) << 1;
+}
 
-	return (val & VCOM_ADJUST_CTRL_MASK) * VCOM_ADJUST_CTRL_SCAL;
+static int sy7636a_set_vcom_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
+{
+	int ret;
+
+	ret = regmap_write(rdev->regmap, SY7636A_REG_VCOM_ADJUST_CTRL_L, sel & 0xff);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(rdev->regmap, SY7636A_REG_VCOM_ADJUST_CTRL_H, BIT(7),
+				  (sel & BIT(8)) >> 1);
 }
 
 static int sy7636a_get_status(struct regulator_dev *rdev)
@@ -55,19 +66,31 @@ static int sy7636a_get_status(struct regulator_dev *rdev)
 }
 
 static const struct regulator_ops sy7636a_vcom_volt_ops = {
-	.get_voltage = sy7636a_get_vcom_voltage_op,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.get_voltage_sel = sy7636a_get_vcom_voltage_sel,
+	.set_voltage_sel = sy7636a_set_vcom_voltage_sel,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
 	.is_enabled = regulator_is_enabled_regmap,
 	.get_status = sy7636a_get_status,
 };
 
+/* 10 mV steps up to 5 V, higher codes also give 5 V */
+static const struct linear_range sy7636a_vcom_ranges[] = {
+	REGULATOR_LINEAR_RANGE(0, 0x000, 0x1f4, VCOM_ADJUST_CTRL_SCAL),
+	REGULATOR_LINEAR_RANGE(5000000, 0x1f5, 0x1ff, 0),
+};
+
 static const struct regulator_desc desc = {
 	.name = "vcom",
 	.id = 0,
 	.ops = &sy7636a_vcom_volt_ops,
 	.type = REGULATOR_VOLTAGE,
 	.owner = THIS_MODULE,
+	.n_voltages = VCOM_ADJUST_CTRL_MASK + 1,
+	.linear_ranges = sy7636a_vcom_ranges,
+	.n_linear_ranges = ARRAY_SIZE(sy7636a_vcom_ranges),
 	.enable_reg = SY7636A_REG_OPERATION_MODE_CRL,
 	.enable_mask = SY7636A_OPERATION_MODE_CRL_ONOFF,
 	.regulators_node = of_match_ptr("regulators"),
-- 
2.52.0

