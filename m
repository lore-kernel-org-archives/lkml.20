Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E7F50B406
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667725; cv=none; b=TxDXfVuOzWCwsCIrb9YDwV1royfWTTkVAMDlv90aIxKfWWXSwcCchvx2JDUBijgGfhGOFVKIrB3nq4PP07GlFjRGrWDy+wO24FQKnaoHvBE/sgBVSjUs47eTUYOvN5+xetk2V+tRbiClQ3gomdCg0u30LarDk5qKLp7Wtfeubuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667725; c=relaxed/simple;
	bh=uRyBjqqvSFltweei6Uy/M5gNvkY89BEG9UdA/vDzq/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0siB7KRp/QvN/179uILVmgFL+4ixgXNM6o+dQ2ljlWZLgCbAyqR0iXZe/h+dmzbbiT+1XZxh1TYXZUsJ2sL42+qVjfXv1jrwtVCNllM5y42re+7iB9DlhMvDE57dH28itGl3ywUV2+WwhLmV8DT3Y+q0WpxvCac3FM5sx0w7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTVG7GJK; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTVG7GJK"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd478cso569242fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667722; x=1790272522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epD9LhruE07/QoJcSKVg/dbrndAnrXPsihPLPnVDq64=;
        b=TTVG7GJK4HHKfBSr8WICY2kdXInOy5Pil6m97mVABhnlpNfFaqYi6ew0UfoTd0Qf+w
         8eVlPT8rP887WJSBkoRTOi9xTo3z02hjCd74TwnGWqHVS+bqQc/FSFYgKvnpas/r+8j5
         K2/pmtQoXWuf9GzZ60j6Ok4OMNiTUUhhCCzgzknjLAkUbHeSofsxkNYADc22fVnIUVeT
         KHUV90rrzLXJ79v136J9RLpG4U5b8h9ThcSEms9eIs3mTCfc5avAxUcqSEkIEeoIAUxe
         bB14wDv84DFlF0Ix+cHII/l9MAy09C2rsHr+oL1xay9uPBfOnz+JTlqu4p7L8kUy9muk
         iYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667722; x=1790272522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epD9LhruE07/QoJcSKVg/dbrndAnrXPsihPLPnVDq64=;
        b=Tfsih8CGHPFI49cDVr7l/623fN0vWuKkuAs4DzDqm0ZOMFGN50cTy1qzsikZmO0394
         8K8nmxNj8rEmGzHkw0YCmA9rIFWblHa76G0yrLfVXaQq7O4T5Njfhzax6KY8qXO5Xi9j
         P0EHdmlBphq2W5yEPdgmR2W4myijMCGrHRFcPk8J2BShYUmxQOYT23XWBz+I8n3AJnZS
         vB6EBbweAxza4fTmOJVMyj1RAUz0LZlp2dNf7NWUIZ0+Mm1AyG0zhN46UrnoEHv6WWQl
         nNe0wvSk+FZPW3rYuhKXzs6jV2xYbUH/oX3Y3fZpHEGCNVbjv0/OdkaimL1Fg5YlFHnb
         IVFg==
X-Forwarded-Encrypted: i=1; AKwUvBwevl2KoMMwsTiFgesdaq5XtpDLdD+o9XQieMqnzVd+PGpwxjTtR63oyuKLHjR82fUObWH5HkU5Cz1DeQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lNANL0nhgoKP+xhdrYbFZBI9aCfncFzExuk9gFTGKjY+uJlOS3
	fI9RyqhhNnu1KlkAcxHmWkwse9fBY5YearYrM0+/En5yzdB23JzR+7ry
X-Gm-Gg: AYBFou2/3KQ8L0CwPnGIdX4RZxY+Ncg0+Oa3CoNoDJt2/t58LpmVkmyXoS9g86fRrdv
	g/TM+fVsXu/VFA3px5TCw4Hnt3q7hZiRap5nRyvq7R6lL/GNYLGWuq22aG16Et035NY/rBPkrxk
	ZHtjI0CBNXPONWPGEIAXcWs1+P2Zud+h2vtX2fvTo+kYIY74cPVakiqImL8Xj8G8vsKjtRWe/8Y
	Pk8bObMUvZ6oDoTtYeeankPp5huWM9S6fRCNBjIwtzXw32973y0Pert9oHM6zkcJvuQz5uvY6oB
	CJcOn5QwTJpngwzfwXQ7Y7B2cFA/k/AciZsWO/kWP0kejDXryQy/rAVH83bAraHZ+D2v1E/FJ5i
	I250V0qIdR6TrEB2IAY106Hm1L4C3Gi8r4+YaFPMB22BmpLw23XkXGAGiVUQ7O+ZFUKpgQISOhP
	wtPEcRQ+fbmcanGGwky+De8Z01IlmivulTA02uDFOqdvODFpbVgkghCpU1qnE33T5W8cyLaAPiq
	5maNHqV3bIiAu9dd2+cp8hT5bI0XOQqjqDCzPFMENr+ikMBFmb5HjT38dcjwYOZO9z3BZ1X6ak1
	2QZtd7XpXRQD3ftV/58wqsGvdGA40uHKqMJ429Z0dFYGOPLaF1jZFYCTh/W3B1w5Tng3OdJuWo+
	SXg3jtlvT/fxrRAgdQxQrtuMk+FeAO6zX
X-Received: by 2002:a05:6870:224b:b0:475:e0a7:9f27 with SMTP id 586e51a60fabf-48476e837dcmr7230581fac.21.1789667722195;
        Thu, 17 Sep 2026 10:55:22 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:12 -0600
Subject: [PATCH net-next v3 1/3] net: stmmac: sun8i: reset the MAC after
 PHY initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-1-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The MAC software reset needs a running receive clock from the PHY.
Resetting the MAC at the end of probe therefore fails when the PHY driver
has not been loaded or its probe has deferred on a missing supplier. The
failure removes the MAC and its MDIO bus, so loading the missing driver
later cannot recover the interface without reprobing the MAC.

Perform the software reset in the DMA reset callback instead. The stmmac
core calls it during hardware setup after attaching and initializing the
PHY, and resumes a suspended PHY before reopening or resuming the MAC.
Keep the existing register clearing after a successful reset and return
reset errors through the normal hardware-setup error path.

Remove the unconditional reset from probe. Keep the separate H3 MDIO-mux
reset after switching the mux and powering the selected PHY, since it is
needed to latch the selected interface before MDIO accesses.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 50 +++++++++++------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..4523a14f5e0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -269,11 +269,32 @@ static const struct emac_variant emac_variant_h6 = {
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
+static int sun8i_dwmac_reset(void __iomem *ioaddr)
+{
+	u32 v;
+
+	v = readl(ioaddr + EMAC_BASIC_CTL1);
+	writel(v | 0x01, ioaddr + EMAC_BASIC_CTL1);
+
+	/* The timeout was previously set to 10ms, but some board (OrangePI0)
+	 * need more if no cable plugged. 100ms seems OK
+	 */
+	return readl_poll_timeout(ioaddr + EMAC_BASIC_CTL1, v,
+				  !(v & 0x01), 100, 100000);
+}
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
 static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
 {
+	int ret;
+
+	/* The PHY receive clock must be running for the reset to complete. */
+	ret = sun8i_dwmac_reset(ioaddr);
+	if (ret)
+		return ret;
+
 	writel(0, ioaddr + EMAC_RX_CTL1);
 	writel(0, ioaddr + EMAC_TX_CTL1);
 	writel(0, ioaddr + EMAC_RX_FRM_FLT);
@@ -738,27 +759,6 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_TX_FLOW_CTL);
 }
 
-static int sun8i_dwmac_reset(struct stmmac_priv *priv)
-{
-	u32 v;
-	int err;
-
-	v = readl(priv->ioaddr + EMAC_BASIC_CTL1);
-	writel(v | 0x01, priv->ioaddr + EMAC_BASIC_CTL1);
-
-	/* The timeout was previously set to 10ms, but some board (OrangePI0)
-	 * need more if no cable plugged. 100ms seems OK
-	 */
-	err = readl_poll_timeout(priv->ioaddr + EMAC_BASIC_CTL1, v,
-				 !(v & 0x01), 100, 100000);
-
-	if (err) {
-		dev_err(priv->device, "EMAC reset timeout\n");
-		return err;
-	}
-	return 0;
-}
-
 /* Search in mdio-mux node for internal PHY node and get its clk/reset */
 static int get_ephy_nodes(struct stmmac_priv *priv)
 {
@@ -895,7 +895,9 @@ static int mdio_mux_syscon_switch_fn(int current_child, int desired_child,
 		/* After changing syscon value, the MAC need reset or it will
 		 * use the last value (and so the last PHY set).
 		 */
-		ret = sun8i_dwmac_reset(priv);
+		ret = sun8i_dwmac_reset(priv->ioaddr);
+		if (ret)
+			dev_err(priv->device, "EMAC reset timeout\n");
 	}
 	return ret;
 }
@@ -1217,10 +1219,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to register mux\n");
 			goto dwmac_mux;
 		}
-	} else {
-		ret = sun8i_dwmac_reset(priv);
-		if (ret)
-			goto dwmac_remove;
 	}
 
 	pm_runtime_put(&pdev->dev);

-- 
2.53.0

