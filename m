Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442417;
	b=Z8O2FoptGBaPiRdcPdKJJSszB7yCA4+uj4cxZmZnGv6bQfPI7Dzf4Etg+aT2VHFIfpQo
	 LArWDtKTTrFCY8PLSq8WC/ewgc6jZgrqtM+PgRa++ED6aSbtqIst1yTWiiwdbu5gHg0t5
	 LmvL4RfGsiHNVG4p3nu/EJGBkVgdM79/tsr6Q7a92xCy2/r4fSrBtyj5ia9MnIkQgVKD4
	 tW4GUXym7uAYWmhTDja4xvSnfcKNcAv72hrSFzgWsjDzM/XRbW8+KHYzUwu6R2G4lEAAV
	 pP55XZH4IP/18RwMWBKHbPn72VmMpUel3MkSNR6iMloYWIxp+OuVa243I7XrXgqoHxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
	b=JX1ve8YsLULpVudNPZNX/bcesTr+PaxcCipcbpgezJ2xVLQlZKO2v3vb982gYasFjYil
	 bVRe984qQWh9UXEv3aOzKL/tcucH8I1ymEUmFI+sCiEm9oSc4PVeqVHxucVfSCduTroz3
	 G0DfLLo9RcXuCMDM2WmMOogUHHns9k75vvTh3pQJfyDOVuVFqE1DzWKWkPzTbfFg8IdQr
	 3P7JNJiqrVKVJPDo5jFje+BZfgFIsqcn5SJzBH/tatf5BuSR0PEQp18YxWDjCgcd3SoEY
	 cJYZwGTn+CbSHK980wLvqKhaN2r+xG8RD+eCouCNIx7+MXXxqv8k7Dlznvg3vm4DLog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFegw1xf;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFCB606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFCB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFegw1xf
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so9145215e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442410; x=1794047210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=ZFegw1xfAnTYk17r8T5nZe/VR9U/zw4z84x87wQkQ+N5WinMdMfT0ywnApQKiyGDA7
         kk7N4TAgVxEfmYQPKTHouV+tSdaW/C4mc5XoQtUU1uFYQgtXDao0WIGzg0o7Rjl5CCNU
         JNNIzclWERxspx9QsxTUKsAZO+iQgWJQfnz7SYIHBaBANlz0KYe7xMmjEQX0J2wMiIed
         aJkKzNWZHTJJdTtdBMrcLTqp1/dCMyxRjm1bCFcYkYxHx12gksgyTppx+CWL/hTH4x9x
         Ri+85EmO05puhR2zwIHG/CPzkBR4wcB1HhNAk+dzAD9PJDz3Pw+zq2Ul3tGrSi/JCxpH
         WJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442410; x=1794047210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=t5fcQdv9y3fQhg47ZtQcH85qfAqwVjOZFeI8IVRR9mvJKxglVC5+hEWVMi1dSoeoNE
         Dq/Nklku7xq9xTMkEJdfPCYVgEoqcyhZKaB7Un18mu9bewW24TT5yCLOKPkZNuaU8X1i
         DFA/e7ksgjUEMhSUoDkwiIQ+Se5mVRXMGb6lpGjzasQbgXxDnjHn3xEd8vvr8KD7PloT
         D1NnZfnnbQA0fB/TSEPjvUFKqBiCJEd4ES7gDtcbnEZMLEi/y7/dgQX5ai5zOiEk7dne
         pG47ikgYaHcCSV6XohbmuviIympoYIIj4NrtX4EByyNVguOOoGJyWWYnWVuE8wPzBI5J
         rBvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdmWRfgmsSs5IDwVyn+wEVhuDS3q9O/xqfyX0gucUFsFyXWr8iQv5HaQYR110nXejCShXV/NiKgvwkN8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhLCFxNY7GNVNYfd9n6JMEA7/FOGRX6Ct9k59i5vv02cg5V0+L
	gd51REQYgdEAjqN1ARCPU9MDeY/xjk6MaYXt5hTlU1EDlKeDstoqS5ep
X-Gm-Gg: AYBFou31yJ/vsW63eI3M06TgXVVYOtBvOYzahY0uYSdGqmmtdUYqieCqGoYZJx5aKeX
	LVhyimTLeW2G4jOs2oiSjcvg0lhYftC0HmOxKdMKW6IG4hNTOtT15rnwFUGeDF5KWnVAq7OX7lc
	+wrm7sBjuh0W6ro6o1q2veRNC3I6dkooxmUiTSNyVMz3jtjrEGYwEQgANgarUEV1gOJRBsrNeR9
	FIGnMIPG4CqsGlqEHzd1qSdOMWHCjtH3AxQSRemRb7OmHoP7HiuiW9lRRR2BSdpL0KWEym1mFsZ
	CEQd8DpkBS6E+73eTE27iAPOiiKs49EWMH1CGtfuhgrxM6Ni1I9toymjbjwGeL40z9Xu5KLm2jP
	nf1aFoZapmfeIs0yFovMyuW32Hzdbn2V9WI22+SkqANfpPuhQX7xZtBxTb7jJM42+hyeClh9uHB
	4vlfo4CSTApHWsm6vD/LdZMioWyM1LqA6ChAnbsOa0io120rOEEpn8HNucf/LCR3l04TiMlGdDB
	rc16UgDusj86/tAC+6EzPNu/bKKh8PL8PCZf4PqpGq6QmGs9i9zEtFLoRW4284xxhmu1iBEubis
	3DOBk7XbsmzYESaoubjQU8YubN0VQP7TAvACAQs7vwRwdDzIzUf0trcGyj2sxIN2CsQ8Ec0YUtZ
	bxeHl3ytZX5zTTw==
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr110005305e9.24.1793442409529;
        Sat, 31 Oct 2026 03:26:49 -0700 (PDT)
Received: from Ansuel-XPS24 ([2a0d:3344:54ec:1210:f1b7:9ece:c6e2:5df8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm90903535e9.2.2026.10.31.03.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:26:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Sat, 31 Oct 2026 11:26:40 +0100
Message-ID: <20261031102641.12649-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031102641.12649-1-ansuelsmth@gmail.com>
References: <20261031102641.12649-1-ansuelsmth@gmail.com>
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

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
Mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Use match data for storage

 drivers/i2c/busses/i2c-mt7621.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..fa1f32d4f046 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -57,9 +57,14 @@
 /* timeout waiting for I2C devices to respond */
 #define TIMEOUT_MS		1000
 
+struct mtk_i2c_data {
+	bool have_scl_stretch;
+};
+
 struct mtk_i2c {
 	void __iomem *base;
 	struct device *dev;
+	const struct mtk_i2c_data *data;
 	struct i2c_adapter adap;
 	u32 bus_freq;
 	u32 clk_div;
@@ -83,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -93,8 +99,11 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	if (i2c->data->have_scl_stretch)
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -247,8 +256,17 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 	.functionality = mtk_i2c_func,
 };
 
+static const struct mtk_i2c_data i2c_mt7621_data = {
+	.have_scl_stretch = true,
+};
+
+static const struct mtk_i2c_data i2c_an7581_data = {
+	.have_scl_stretch = false,
+};
+
 static const struct of_device_id i2c_mtk_dt_ids[] = {
-	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "mediatek,mt7621-i2c", .data = &i2c_mt7621_data },
+	{ .compatible = "airoha,an7581-i2c", .data = &i2c_an7581_data },
 	{ /* sentinel */ }
 };
 
@@ -286,6 +304,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	}
 
 	i2c->dev = &pdev->dev;
+	i2c->data = device_get_match_data(&pdev->dev);
 
 	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				 &i2c->bus_freq))
-- 
2.55.0

