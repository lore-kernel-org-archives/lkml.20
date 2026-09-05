Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D153318EC7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788642970; cv=none; b=kqqy1LC/SHqFFsb13ALV73kMME2PX4zD0xqXz7d0gqXxL8uFbZW6DjgcXopop/tfuFmKUB5jUhT1HiF1QRKz1mNXlTRmW2k3nAH1wVjz3ZtHHD7u4l7sP1YZ0QTO9srCFuTJ+0fLYB6TXTHA0RLUcoKsk8cQ8Z1x3FETbjSR/oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788642970; c=relaxed/simple;
	bh=jqRhGy7efJmObkdpxb4H8/kUs2ksy+nEB5wWPEvSvls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgMsT/IpLJ5PqZrbG63gPvRsvKU9xMb7M4btrW7X5q0yPOxTmfFCZPMZqZKxQw6OovOHCa7pakWADq89Pdgo1f17Gh8vCLmSvz8Q9RM4scsXdjalxZgMMoSXfAQIjriRQ+h/VXh6Jb83G0XedoNmBmHsZQ5DrKeouJaqGVI5A84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=O/b68k5S; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="O/b68k5S"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so19229495e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788642967; x=1789247767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tu5iJEo6nOs2XgpyoZ9iLxBXAex16zJHHTE4sswtndw=;
        b=O/b68k5SdKo0mmzflaNJti44D9VE/8UKLNWMI+J+JmzWON+TcOSs2uZmoHyNdv/LYY
         PM+faMsB41qF4YnOJ4LidZGOSOpQ+bvtT5PK+AegW33JLfLRhw0+8gc47dgUjeUWeTDX
         qzxZOQtmwr+04kCfr8JLZFSrx1ghghzQGVuwkv9wEJjbrnJdZ931/5ywgKCnj6kY4Vmd
         N4kU0Yhxti6obqpaBljFHq4KtdLjcvQLHX5+SJnn6sCCrv5+qqeUt6ZoNrh3hDpAG9x7
         X3cwWmNFxEAPv7UiRXj9C78uslzFmrPja4IM9vG2JGZzvH/1ftp7Y4bswrMidNarjkra
         +K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788642967; x=1789247767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tu5iJEo6nOs2XgpyoZ9iLxBXAex16zJHHTE4sswtndw=;
        b=aoWc53lg7aVFPcdoSpJlL311UcAgpg/jWF9TdNB3OSxX3NwvQUuYINxL2v25fyeM+j
         BNrnF2+WVM+JLDiUvtG3rQeaMCGlJAsHk1cLmLptzjyLmka+4f+nJx2yNEY8Z9xDaDNF
         V1oCrl3exW8lCoKfjt0GI+SQ+OkQxypp0KopYYozI/TU50rAlBbdHjvH7wS/p+8B+Vp7
         Ro0YYdAKhHnktJbR/VdwNA9WddnSOys8RM0JbhWeGxu+9JbhG4/pwGVpD4klo2xUcFZZ
         Y7xtuqkWj3rhs+EroiVIcZgZdCjYKRE7mAOXhPKlngEGdYpffqH4edT3ZCQXtsHMblZG
         JjWA==
X-Forwarded-Encrypted: i=1; AKwUvBxPdKw64ygmy/ZKrLvvrz3DrAvqA4BVbYT1Tkw464F1E+Y0OeEdnus0ytAgKMpJn+QC/ttFuA2wP8D34as=@vger.kernel.org
X-Gm-Message-State: AFuF++n3RXs4Ko9tJ6PAaBzKjS/O0z7nToVyUmPrkWMv7IJWsmDc1RZd
	IAuR1YS+i8kQYAhj6bO+7NibSDPWdTk0YYN+ppCfKopwBApfxaoEGkL2jPVerORH93c=
X-Gm-Gg: AYBFou0eoi0uHShqcFBr9yT8uLRwCjxxKtW8ZrLmiKn4KUjkdVFCuk8FKZNNROIW7jY
	Zzn86NOgCJhB86WOqn8VaDoxw5G91irOJQuZ/0VlP/QyUVjcZOt6JgVoorx/SZqelECfvmVFfAx
	LAKqKXfwGi87yClgZKYeZ1kDkaS+gX5F/1mjrk3Hpa0qEBqPsFlSvNW9HV/DBBAU9HVnFWDI5z5
	QPHjck/tQdHghHrP4O40ypIm9pQsT5Et6RIdjqjEBmPm/Iv3KpDfpYW8zUv3IqTT+n8D/L2PIyg
	xHLq9W/Q4XRXW1oDOTE56Ll18z3lEbHcqOePLdtjrLB3jalwXF0z8ZKnPzI852avQ4hf63ai8eE
	WCiqZMuqAZcrWWgxheohHGDJsQviV6/OVWhe4wv/ijerdyRF984rly7DTJ3Td9tWmA9F206ozGA
	zj5cCn1NX9u22lxuqZkFmeiW2LtTSRncziMLIb3QqhbWffTy6aNU/v0xGT2jW0sTYhyyRqJpcj9
	SDRa45H4VQ0kLvP4L/H9AnpVYrT+BPxT00Mo1AcYKc=
X-Received: by 2002:a05:600c:1c24:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49cf824894cmr159819725e9.8.1788642967596;
        Sat, 05 Sep 2026 14:16:07 -0700 (PDT)
Received: from localtoast.fritz.box (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm261416695e9.3.2026.09.05.14.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:16:07 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	rogerq@ti.com
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v3 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
Date: Sat,  5 Sep 2026 23:15:55 +0200
Message-ID: <20260905211555.15944-3-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
References: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the PCIe PHYs, read the property from the device tree and
update the RX/TX mode selection bits in the specified syscon
register.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 drivers/phy/ti/phy-ti-pipe3.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
index b5543b5c674c..bc02010dadb7 100644
--- a/drivers/phy/ti/phy-ti-pipe3.c
+++ b/drivers/phy/ti/phy-ti-pipe3.c
@@ -115,6 +115,9 @@
 #define MEM_CDR_LOS_SOURCE_MASK		GENMASK(10, 9)
 #define MEM_CDR_LOS_SOURCE_SHIFT	9
 
+#define PCIE_TX_RX_CTRL_MASK		GENMASK(17, 16)
+#define PCIE_TX_RX_CTRL_SHIFT		16
+
 /*
  * This is an Empirical value that works, need to confirm the actual
  * value required for the PIPE3PHY_PLL_CONFIGURATION2.PLL_IDLE status
@@ -785,6 +788,24 @@ static int ti_pipe3_get_pll_base(struct ti_pipe3 *phy)
 	return PTR_ERR_OR_ZERO(phy->pll_ctrl_base);
 }
 
+static int ti_pipe3_acspcie_tx_rx_mode(struct ti_pipe3 *phy)
+{
+	struct device_node *np = phy->dev->of_node;
+	struct regmap *regmap;
+	unsigned int args[2];
+
+	regmap = syscon_regmap_lookup_by_phandle_args(np,
+						      "ti,syscon-acspcie-tx-rx",
+						      2, args);
+	if (IS_ERR(regmap)) {
+		dev_warn(phy->dev, "can't get ti,syscon-acspcie-tx-rx\n");
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, args[0], PCIE_TX_RX_CTRL_MASK,
+				  args[1] << PCIE_TX_RX_CTRL_SHIFT);
+}
+
 static int ti_pipe3_probe(struct platform_device *pdev)
 {
 	struct ti_pipe3 *phy;
@@ -807,6 +828,12 @@ static int ti_pipe3_probe(struct platform_device *pdev)
 	phy->dpll_map = data->dpll_map;
 	phy->settings = data->settings;
 
+	if (phy->mode == PIPE3_MODE_PCIE) {
+		ret = ti_pipe3_acspcie_tx_rx_mode(phy);
+		if (ret)
+			dev_warn(dev, "failed to set ACSPCIe TX/RX mode\n");
+	}
+
 	ret = ti_pipe3_get_pll_base(phy);
 	if (ret)
 		return ret;
-- 
2.55.0

