Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597204;
	b=sX3zDUbrXCncrdwJoVx5r+U7BkAHfQlPvonZi9Ki0bnw1vBMmE43n+tY6mMikklTj4LQ
	 0a1rQl1K3r5yzbY6ppzIgCl7hGF+/o73veDX3NJcCsOPT9gyVPI+XcCP6A660GwHzMHoK
	 k7lfAt8jTPHmKXkWH36DJYCH+NI0XyuEcLLy2Uhmkeh/4FIKsjQy8M8l0PLmVXn17kckR
	 Yh9uvqOxK51SNsLi+b9rNajl2J8BOhME1QzAsHzkklrVAP1XeXi0XysBCR/LlCVhIJ4fs
	 TEC4j1h0qD1qoqsDEROmQeURnteaK/kIc1NBuzRUjUkCTGrZpuGEqSA6/85vE+rib2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=;
	b=TdkLLguVj9bKD9VcR1K4LbxZOiBwB/PojF0OfsgfXLybIueYtWweZpGNuuN8agAw56YP
	 EX3ZmxCbYSPLliFFQyTWe+TzCcyrkfPgOoBMIA4EBZYvK+ufJfGZ35gJW42PXwVP90Cqc
	 JTNV0SYyBN4zwYtywKEbiWDw6ig7jJjNQLejGY4n0H9HDHbJdyIYN5fkjeN2PUl9kuHTA
	 TjFz/LnTTp89eq989JmNYBesajiC4zlXT0GWzXUniaYbJnn2kra260OGCVRHsX+j8YqvQ
	 IZ9O3gSM6hzqSz4mBJZSgIcw7iIPv50rWgcoIv4cQcGPuxPwDyZoLqNvTjbINlp/F8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeXBTAIf;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4A606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B4A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeXBTAIf
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so10246035e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597203; x=1793202003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=;
        b=UeXBTAIfPiCMuR1LAD8ORgCkAfwJvgzFVzOv5DelyEpnNtRMT829g4ht0Y9ToGZ6Er
         al9V7Xp2Ea73W67Mfiw/DYe88EYVF5T8T0CutO0NQvlf9OID2yNUPOLXXv9l+3ZcfJjG
         DM4tmDkJKbFoRonUeyHiHUoUdCaLlu4Z2Mbq0iq6FfReF8mf0Y46M/PUAC0M1dSr8xEj
         SwWRg6p3GnBb+m/o0ri4ic1Q1UKZYBh0SgqeEWkBYIhrz+jUU+jhwjykw10vxlDcz4IF
         J+0Sh7N6IdKx4fcT3GIYTGYX7gT3L521otbmiQ5xE2hnge4tl6HRP0ZvFPhjCDv8plUb
         PS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597203; x=1793202003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=;
        b=iHyU84vcL7sm3Puh8sGtjU1F3Zxi7NrT4tn89qJ4ALJBtZOu4GiPLr4vnumiRVWTTA
         YZWwQMwa0PZS9t7lYToZdwW1sw+1dhnNVNN0/vdOw0eb2XhFqeIUb8JYx06070QHPty0
         GHkTtjAu0T1Qeiq1wfheQ0H2MPthLA3teSPlvyYAKyU+o2I4ItQsJIWi1diRgqPhPYI1
         HFxPRwdSd/voZfxQLbHUtSPuzjSRrJaGPx5mSFPhzZoVaapd+jMUcXrcHD/qtNYAkBCG
         3KjRxvm8BXHkAjF6EOBWA1U5k6gwA5TYSxCS4zy6gAwaWmuzsVR9KE9TYWgEbkghnlht
         zP4A==
X-Forwarded-Encrypted: i=1; AKwUvBxfX/y15cJAM0XuKXbtC6z01X7Gv0qgDf5sPQ4SLuVVV4K1Kr0UENPfm/y52+nrGvpck8vb1gBAjhTHOnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwDZx0QkOG/NR0VztAHzHOzREm1w5xpIhQyR3KPX96Oq6cBdDA
	SZ3Zcqutg56k1VH4VYGJlzepO3FG45fIGyuJ/8RGr0Xrsq6s0EI9y8PC
X-Gm-Gg: AYBFou1r8WUaNMnw24h0ksQIf9GqFLvTNYL4bcpgKv466UHf/bGNl17Klr8/U0PXD23
	5X9BXaz+ZPWOoN0ceWY30CfLCouMXLSKz3rc3ZYFI1ZD9Z+1vHvtY8qfGyIJ+fmk0i+gA8A8t48
	Pf0gnl6XwNkSb6Il1rJs8o49lE4470EjN4cTQS3qwwmMXM3UzXO61ehbDirPHR0B6tCKFK4ZGHY
	zQ+BJwSvGrGPtNZu6I7TBX9Y5zGmlY2rpjnrm9svcGwIb55KOd4cIB4i/OMUAXAiyvjK0wtIAqT
	vyrp24mIreA0rLuB5K1oplIZLwYRxPVDtB+4cmNGavG6tBpV9a5qLdcVqso+p0xnyCPWU0D5E+U
	B5EJ0eawPpwE3NDD0UHu/u7ObkRjWJBqt6y8MJnCweaZTe7ghpTSpDEHTKP2VDgEbtp1FOUSh+n
	CxY/63x//OXwYrx9YtxvjUhmBXYtxhLSCqLdzi7QpKCA/vITIw15zxc6xKbvE/9Knbsj0eBFzWo
	eJxCfOnyFSDNKdKRFXqO1IdyRIAbv3W7DUuSXrUDF27H89WilGDgYmLYeVydBy2347RjaCnp1QV
	SUj+vVTLy8zCd5/iCwKk+4pVH6QaFuwk2kxKEDu2INHNayTBZvXnooUHtj45
X-Received: by 2002:a05:600c:3513:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a1fdd2461cmr53680805e9.13.1792597202563;
        Wed, 21 Oct 2026 08:40:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd70027sm27793675e9.0.2026.10.21.08.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:40:01 -0700 (PDT)
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
Subject: [PATCH 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Wed, 21 Oct 2026 17:39:52 +0200
Message-ID: <20261021153953.285222-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021153953.285222-1-ansuelsmth@gmail.com>
References: <20261021153953.285222-1-ansuelsmth@gmail.com>
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
 drivers/i2c/busses/i2c-mt7621.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..19dde7c4069e 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -65,6 +65,7 @@ struct mtk_i2c {
 	u32 clk_div;
 	u32 flags;
 	struct clk *clk;
+	bool have_scl_stretch;
 };
 
 static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
@@ -83,6 +84,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -93,8 +95,11 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	if (i2c->have_scl_stretch)
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -249,6 +254,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
@@ -296,6 +302,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
+		i2c->have_scl_stretch = true;
+
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
 	adap->algo = &mtk_i2c_algo;
-- 
2.55.0

