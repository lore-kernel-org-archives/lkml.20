Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298728;
	b=N97tV9PKW66jBghI8nN6QpKYKNxowrXqAz4G7RNUSd7+yi3iAAah9KZ957c8Wh4dJQfZ
	 Dnbtff0YQ3xPNY8ohF8CiO5D6NCqbbjEqm26HQNT1WVft/aHC8CplCuBKUAe1OVGwRnQa
	 WLwNDBsqzj47kfrOKHgot0PhnyRXc3pFPEGPXZiUEtAjocAe9W24zz063vmbOuSxTtxWD
	 UloTI56heC8q3jjVc+DUnC36zwdWFuxoRITB5fFuonDouk45AWkbYsXcHEJ+ZCi/lR3pY
	 LDkKkROUgC5j7QVZI2HA73Egfet/oCH2tfCSxVg3kLy0TjKPqrMx71/kDO/qE2P1VFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=;
	b=N/EQK226SOKLOglS2PxhCVTcD/iXzAqWoT6woPMWHv5oAr6R/i4okHBcnUUnDYwpVt9z
	 xQJL4ZpMRC0MUy/WwzmB9YHhxfaHMkcw7oUnH+CuBtwicdpjQiDHSXZDESGStnViFj0NT
	 xDRf19Gpo5nkup1BldNAFIgiWBIJazgkFukFgBlw/lCsuMf8UU6W0EgMkxp4LjmVAFNrl
	 Rnzm7/RTj3Jq9+/D514mkkRDqesgzeONEz6UWZ/3nCm0EB+ZGWVtOaxfr3ldppyU+Xeep
	 cAlSYyE9mGB8hygAHmAXhwzp0tqabfH8Rx/9LoWt4c9S00CM9pM/LCkjbk2snsKXAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJYEtkEi;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D160A3810
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93D160A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJYEtkEi
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3ae17c535so44838c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298727; x=1794903527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=;
        b=QJYEtkEiKtmq2GEeZvBTGRWBvgjLbbOWmlitgLMK12B50B4dxaiK47EndQlLbxv+6y
         bIMXCLP2rAxXFmhc+18bPCoLbIYG/5RmmJh5IDb5hyVFI+ev2yoDuFKuompGSZJka8NR
         0C3ltVQlyjafi8hUGqUF5E7DiuYOwC/e/c6EUA7DnuwPpY6GCBpy286NoflMeHbYfb+4
         ioRcwGjxFvTqFp8JBN6L12rEbLHgpIxYLKlWnzQHlwmWPjPhHqAQzqVyxGUML3Er4lc9
         aRvWC5v11c937ulccLPkWpMAsnOXTRmT1J3DV5QsxBG6dQ7zE3vMJK5Jm1avXzvt2DlY
         7WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298727; x=1794903527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=;
        b=NU/eoHmQa5ccGkVI2qakAfgl95XkIpvHtXReyBkmYRYbUCPAN98viDKqrk0dhq4efN
         ZHOpgk9PEvxFW6ZvxDnviMWfLn1AcLrKob+TB5DvD2t6YOThpvnpkRlSsPBqfkP5bRNm
         TtycdBvhksFEys2Zj3b+yfq0Qx6jgC63yacQYJGPo+R3E71RmfcENYR31v02l3Q+I8W0
         BjAwuU4jRzyauFP/R/aZQDfw1ur4DF+91p6oojHPD9oSR9w1WXYP0kO6UGxrTgdV+baa
         CyP2ekDVxZEYrg3eDop5jLhoQ1AbnK3mGq3r97w+wKkA+6WO45A8QUfIn3rDYbDizM8f
         UqBQ==
X-Forwarded-Encrypted: i=1; AL+hErGlNvbIqXBniMcJML1DTs7Y+9GZNiZB2EWJqF1K22JAID5YMfVGXGjni0xjvSgdidxbR4J+AVvkxsWMT7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d79R7+fZ3aNxyWYBIwuZ/5/fGZKJEjL9iys5Lzn7W0fOYls38
	c9fBUNQabH90ygCKRpejTAyFGhAguSxB0dAFehzlMe718+wyjUia+0nA
X-Gm-Gg: AYBFou3tqTQwepjv+u0199lgv4aBe1/MNvKjL8vXRdPKr8qkY2pd+YJ+aoAhrtbmIbC
	lPK9Ea45vSKxIJVfx7aj1YG6oOdRKM6DfRhWaKyRMOSPHqge4khRA7TZtAGiY6UjnS9gdPIMXX0
	VZonygJkYqNE2SRa7Znt9FtC3q0uHNC28BTiY3rMnz4oBMfNLoksyFM+mgucxtbw7f2SowCtIwK
	GDnZItx37Ar1jrN99tDa+Bdh3dE1zD+QrocddyK9dOHZp/iJO78qG4uR4NdsbpImd4hChBSRmdw
	VDvi3aNSgPvUYoeuU2pOZnpm+XOY+2NrAV5983N5qYDBXitRADnUMwnujng/mt7WgAdR1uznNLe
	7kJ1MAG0Lrikwlc+t+pYkDiXnlgQJuUGRq4K0IYelJbyRHGKd4S+ljvAOLhx82kwwCM8IKuTHmE
	YIbDVhmz6Re5qUe4zMOthoOqRWASAUmakm61zr23CAHOA4kQRS+D6ihnTarFRPW4ouqu53ERIY2
	jh6DW6agwXMlVlZSnkqcutM77qFijNE72s6M+u/cKe83ufdAcZt9NoUIb9+Flw4MQ97Wk+eqD+3
	TXEA78hfS5QmUBZbiiGGwjG7Cj7i/kv9z1g1gKztFwwygvurIy5Aea9mT6Dl
X-Received: by 2002:a05:7022:f502:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1b3b5fbb37bmr3714465c88.1.1794298726441;
        Tue, 10 Nov 2026 00:18:46 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:45 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:10 +0800
Subject: [PATCH v6 7/9] phy: rockchip-samsung-dcphy: Support the new
 phy-type and direction binding
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
Message-Id: <20261110-dcphy-rx-v1-v6-7-d681ba20b36a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298692; l=3244;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=MPlZcYdBOTjm8N+T+zD2aiKGVlTXPixFaSZAXRG0uQg=;
 b=XVX/t4VGDXdsU4HAGnmDCJBr3P5Q0oy9IN4FMcahsrkLVyV+WADTyFODqoZvgPE50AThjSsY1
 ikf+XRGvmjbDHUXbklTj1jfDUcwtwaj85cfRiGe8zNBMKCeJSDQxIOb
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The binding now selects the PHY with the cell and the mode of the block
with the phy-type property of the provider. Read phy-type in probe,
D-PHY by default.

of_xlate() returns the transmitter for PHY_DIRECTION_TX. The deprecated
PHY_TYPE_DPHY and PHY_TYPE_CPHY select the transmitter as today, so
existing DTs are unaffected.

A phy-type other than D-PHY or C-PHY fails probe. A deprecated cell
value that does not match phy-type gets a warning, and the transmitter
then refuses to power on, as in C-PHY mode today.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index c40c84791eca..e8e229fc4856 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -297,6 +297,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
 	u8 type;
+	bool legacy_mismatch;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
 	struct {
@@ -1376,6 +1377,9 @@ static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
+	if (samsung->legacy_mismatch)
+		return -EOPNOTSUPP;
+
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_tx_power_on(samsung);
@@ -1549,13 +1553,21 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
-		dev_warn(dev, "phy type select %d overwriting type %d\n",
-			 args->args[0], samsung->type);
-
-	samsung->type = args->args[0];
-
-	return samsung->tx.phy;
+	switch (args->args[0]) {
+	case PHY_DIRECTION_TX:
+		return samsung->tx.phy;
+	case PHY_TYPE_DPHY:
+	case PHY_TYPE_CPHY:
+		if (args->args[0] != samsung->type) {
+			dev_warn(dev, "unsupported phy cell %u with phy-type %u\n",
+				 args->args[0], samsung->type);
+			samsung->legacy_mismatch = true;
+		}
+		return samsung->tx.phy;
+	default:
+		dev_err(dev, "invalid phy cell %u\n", args->args[0]);
+		return ERR_PTR(-EINVAL);
+	}
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1566,6 +1578,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct resource *res;
 	void __iomem *regs;
+	u32 type = PHY_TYPE_DPHY;
 	int ret;
 
 	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
@@ -1620,6 +1633,11 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
 				     "Failed to get system grf_apb_rst control\n");
 
+	of_property_read_u32(np, "phy-type", &type);
+	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY)
+		return dev_err_probe(dev, -EINVAL, "unsupported phy-type %u\n", type);
+	samsung->type = type;
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");

-- 
2.43.0

