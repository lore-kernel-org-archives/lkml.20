Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298716;
	b=jcHYcG1mkds97PJ19pWUORE/Ww7ZaKDyBmxzCGoGKDRu2VvY/yxjTZwPtmWqShPf5NDN
	 eNHCorRHAe1VkFNAn3AoKWhgyG7pCMqPmqJoCNqlQTPUe2CxhYt5u4SbYKXxGHPetujdL
	 DNiZqHkZS0Hjpz0ZInKsYwD8QV4t24Nf9cOwZjN0gyAc+QIJuGtORs+kyHYWMxlDffFjI
	 mNU5eJEuy49pULj/gU1jNnX2uS4y8Ct4wgcmkU+JpPR+fs+8lGt4TmC1/jz2Vup9IvWop
	 bBbM4pI1XDy0LSiSzq9vFVF0vH48sEUG+ZxOwmUnT/AM3DXz1rpw22yr4xDFTkmPSJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=;
	b=DT4JpmcC+u9nicbUzxmiTsHBVwyH87EU//KjDl9XSoyTlQwCYRb3JTGpQJyIGyGF88Vz
	 PyCG7uy7JpSEQMkZPMGc/iKmukhiyntlG0VtqlV6qa0+Q7OPOQXx1KcYtFhdSbP0xo9On
	 iPswPIwEzMhiLi+dHh+YdxrrbpAdq9MSc7d3NBTWl5ZF/4tqDl8F33zXkNYa5imFI6Kuh
	 0QUAuuKqfutC00F2mPY/97KmwGL+MipVanew7yXC/uobQI7Pw5bcBvhzPJuCeH8qyZ8yP
	 XyxsyD1ikg5Sr+X05hthVjP9Ty84AIvzSrOHvp6osqQNerMJ0JLHWHESmf3gV9PxFig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X555yNbB;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9F3606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD9F3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X555yNbB
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1abaaf33a56so51883c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298715; x=1794903515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=;
        b=X555yNbBFCpYDWbq9ryGy7Fqx2egoQOUnyrC/iElbU6wg8tYYnSZbX7MdhTPu2C3Qv
         Z7G/7T1VxeuHAl+rl/PqKDFzFKkIsQJW5nrW+sAop4nZYiwkzD/OFw/tyKYZWFBip8zf
         xx8FGwoyzSK7SfLFQi2UPTWyVfjwmSklAeXn5vdmkcB3vneE7b8jYtxDs9vgqRNCKAWK
         1qjvzBaMkJ1jmRSidUL2g+cC2r6PoieY6PDeBzD2OxonDidgqEVS7IaVTzX+TP2v3xHw
         cUe7JxW3tpgBryvzmKuFA85X6EdjyZKi657TLDXtXgZj2safHVj79SLE2wj6wM80aV8I
         m2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298715; x=1794903515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=;
        b=N+wbBccDdJW7QVu7uvKtLW49ZCLSo6Ub4v2uw/1jGJbj2p5jLv7Kd3rrF9wlQjyKfA
         eS2zJJzp607sQtSJo5VPMGO9w2jiW4H38cq77UJI1I8D7v0lYsy3+krgZElQFlGTJOKE
         TRgNOtY15ddI1rQ+JHxQPRlSh1SxJ9DrDAwQLI7sHflWBBoW1MfebiWJvjP2FtH3Tsh9
         2AMEhkyGVfq05ArKgV5roxmxF46zLI4xSSOh9nmp9tltA3PEiXClAMRmRpYEgI4lN5Sj
         2KMfcUQ+aY0GJRiddP74pdXX4LnwLhrk2GTphfGq3VZ2JHF86tYrv0XqRRYB9IvzvuyT
         BUEA==
X-Forwarded-Encrypted: i=1; AL+hErFZbflyizA/t4M+pMr07p8JWcHxgwxt8VnyFjsBTaUvmN6ZJle9USVsNNYekt+TL2u87YJZK+LhVqE1u9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ICDknX4X4al+9s8tBojxlX8a/fHtgZvdvcbBEzhzl4Q+bqIlW
	JSYZzvkRw1W4+0HyopYAW32zrxzffPW399+G1lKEFjLAU0YZYGDsHJSn
X-Gm-Gg: AYBFou20TOh32EdCuWqtSoRZDQOcYQ2hv/NX2qZWvU0ANkTGjns3s1t72OJzL2ALKrx
	tuk17euFWRYW82y5cOThsZTsyeJv4DM4jVaNBVhcGX2huGcgyioiZISXZRJ/nCg40udU3vpXDZs
	7q66unJuX9uLBwdVbHTf7FR1Scaz0ybyg9AwvL4+6zPL61rQhHU/MSDDy7lgrtNbV91bhAfZICe
	ncxr6qJnugjErTpk39nvk7LbUVv2lJrDf2xAypqLu7JooXrKTpdbC9erAsJ1Ig+UMCMlB5JuvTg
	LgH4qiWjwQa3rrz4yw4EtI//RfS5WxrHWj8UjVNnHivvGg+BkinG4slmM499XZytj1+jzoiWxRi
	Tb2sdb6YicVUuD030x4ZYeYGxf+NO0Av9cl49WWnyrMQn40CUbeObpkzRhFxtWwMvtyhOWS0bXg
	fxWekojEjXlbigdnbcmGlorhLr4ZRzn0RGkkXaAEFno/Sg3zDw6Z2cBf+YIWhERzrkIGdqRwHXc
	w2lI+L008VULRV0PiKWqWHMgxNQplh5AVJItm9GdDr7Gmp+/Ksy7jMs8gCHCyJIjqxaInCYOUaF
	lZjGJvwnWA2AfdQbzXOeH2+A1YXm8nskbTpgz9wjCHEYc/054EprfYw/wgTVDR2mes3kwYTK9QQ
	mIzo/6g==
X-Received: by 2002:a05:701b:290a:b0:16b:4f52:a08 with SMTP id a92af1059eb24-1b3b5bc5b75mr3383821c88.0.1794298714350;
        Tue, 10 Nov 2026 00:18:34 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:32 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:07 +0800
Subject: [PATCH v6 4/9] phy: rockchip-samsung-dcphy: Always write the
 rate-dependent registers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-4-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=2619;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=LIh1d9RdBI9/gBSpmLf2Ww3xecRtR289gfN7TNiw1rk=;
 b=vh7WtesJEslT9LQa1QgtXchs2lhrai6pBKF9E8aFtdAdpc8JEMUwWFHoiWRWDV5rnQJfNXII2
 CyvmkFGqTM0Cpv/XpwfG7MNyurBRtigfnqqPGRKy5yIICDDKwRT+Ojn
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The lane timing init functions write DPHY_MC_ANA_CON1, the four data
lane ANA_CON1 registers and DPHY_MC_DESKEW_CON0 only above a data
rate threshold, and the registers have to be zero below it [1].

Today the APB reset at the start of every power_on provides the zero.

A later change moves that reset to runtime resume, so a power_on at a
lower rate after a higher one would keep the old values.

Write the registers on every power_on, with zero below the threshold.

[1] RK3588 TRM: sections 22.4.2 (reset values) and 22.4.3
    (DPHY_MC_ANA_CON1, DPHY_MC_DESKEW_CON0)

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 24 +++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index ce1bc62497c5..7a009d87a665 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1228,7 +1228,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MC_ANA_CON0, val);
 
 	if (lane_hs_rate >= 4500)
-		regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, 0x0001);
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, val);
 
 	val = 0;
 	/*
@@ -1259,7 +1262,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	 * under 1.5Gbps or equal to 1.5Gbps.
 	 */
 	if (lane_hs_rate > 1500)
-		regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, 0x9cb1);
+		val = 0x9cb1;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, val);
 }
 
 static void
@@ -1284,12 +1290,14 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON0, val);
 	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON0, val);
 
-	if (lane_hs_rate >= 4500) {
-		regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, 0x0001);
-	}
+	if (lane_hs_rate >= 4500)
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, val);
+	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, val);
 
 	val = 0;
 	/*

-- 
2.43.0

