Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833687;
	b=zKiW9C+l7KCEBvPAFOToSe1HWFFRz+/TJWJMfJsWZWNp8/1LvtxQ2n7nIXSdGDgw4vfR
	 S3vyUzITkWEDyyJrF0Cvz8qCp/eZ5dOsK6k3bAcUwGUULP9ho9iDrxXv28VMQZXJVoPWb
	 Y2izcK3zTmRC9lAIHrgTx6A4JHN0fcw0rUPbh+7BbUZMLiY1AxJ/TXQqV77TbwqJJXTzB
	 /DqWaV7eWll8k+/+/IKryakT48JKWU6On9AiATG+k5j4UzMWx/Qvv8Ql6jNWQiwOPdFmQ
	 Wps91aDA6nXHDnRhjYJsK/OLsb5SEMiaKIvLCZRl5Hh7JITrWEGERc5pPv6yLYg6QWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833687;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uzequ7u04c7zvTxs5TC7dHbAyubOrWFz3bgZTquTipU=;
	b=Z8+7wRIO4D66dBGVeZSQDqlQNSD1m1W7+k5p8bop+EIp+gWao6OOkdvJYp/NnXP6BPkN
	 XHm31m/8mFNZReh89YVJ2Off9H01K+hTc2FULp8ItwsIs7A7Km2l/PiUqyjGuSWh5vHVx
	 9WT1r4s3eT4CxzMNr25DGRvtVojo48uN79b0bP3h0SoiZKbawyLP5g/m9T7ONNZIVUERY
	 /nfTRD4kFeytDvf8UxXl7ME1i3pUggvXhjCsJ4THqbSUkkFkU0kM6cbOIDgHUF9wA+rRV
	 2rgntamiu6CFJgipInXEB2yshiWReCMHPhwkNgKOHUmwC1qweCj01wUbnDU2s5VZAnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="YZT/nQ4v";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C463606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C463606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YZT/nQ4v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YZT/nQ4v1gyi8Z6mtVBUmC3+KietQShgOVaVssbv5Yvue/oEaCsHUZpj5hzAgkfdp
	 hoguJ/BBI2DHDIe+dKhV8QpNvOkKhKmFE9u+drrLFXJnhNWM92ew9X/8RfzCQREfP0
	 BYb22g7f/FSZn45CVN49UeRSbD6EdGgOkuNCmTwT6l+4DbFnJH9iCLFGrm7X5d1r6S
	 DjQ+dNURm8oM8+xWY5X4mBFmIvFSe+K11ab6ZCTc9R0EQafPNu4tq7V9x73GyM2nlk
	 V2OqX7tlSYz4Bb8mY5ORN3G/9F3sm4vBYkePuLuuwQpwiEoroZky58VCZaQe2vzLBU
	 S6dmqI6QDj4zA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96BBE17E0CE8;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5882D480029; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:07:57 +0100
Subject: [PATCH v3 1/4] phy: rockchip: inno-usb2: simplify and unify PHY op
 debug messages
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
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-1-b20608c08b94@collabora.com>
References: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
In-Reply-To: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutUbh9IY5cnv682AX8XX0t3vUjOvK8LHq
 BDCNIU5Dap7pIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qa0PUP/0EfAg63VdePvgZE4PteYOgoRD/CUvjR/9lFi2uMH+FhWbHtAQJH9AUBOlbFfVj26ld
 Ksb+woS0FhgMDHmHpPZP22cPU7D8WlC1gwxPwbVY83HYn33XTAHsdIIlZ9zqVeiH52Ulg0nMn0O
 05OSMTwHVzn3PUNeZtnp0s7DcX8369dfIEfnxuRAq4EaVo6OSHx77W8+EPgeXSQqh0xoj8AI2+b
 V8hsDRpGWgAC91h6dWcSfxbMTTYpRsHUXz6WB2h4cBoRhd4KSnTIwXTFDoGpXTPyyVKdmREKbBM
 Umt1H9de0PiJRuFCMU80HxvltaLrDRToPuTmAAJmlQbTp9G6NVSMfG+76Z6OlJHPuR/0Bh/Hf/j
 5JA6sxPwRd+9pOTI4uG1iz4hHut8dCkF1XMK3manGF0+blHl0Rzx/1BBwywO4jHSE2V5EtjPVSc
 HSBHZEnifOR4TDjs7BJmZyLrCkIaYcYa/FPCw7r5oKRL2FsPs/31/4pZNNL5rtDGI1MWdMduS1V
 Qi9RNqlmlPlL87RMrqmLB1vOu3j8loBlnAXgenrabwh++PSO8ccwDuGsVyBpRSAbVPOQtZ2zcll
 m+LUihTXaNt4iszDZ72/Ddk9vgHJhkU3lS5iRz7G7c2r4JBRq4zHPZbwR1KudUMOi32mgl39Otj
 U924whOP6r2Wd1HfbL7o0Ug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add debug message for init/exit in addition to power_on/power_off and
avoid the useless extra dereference in the existing power_on/power_off
to make the prints consistent.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index e47b89015586..0b61f152eb3f 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -508,6 +508,8 @@ static int rockchip_usb2phy_init(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret = 0;
 
+	dev_dbg(&phy->dev, "phy port init\n");
+
 	mutex_lock(&rport->mutex);
 
 	if (rport->port_id == USB2PHY_PORT_OTG) {
@@ -592,7 +594,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power on\n");
+	dev_dbg(&phy->dev, "port power on\n");
 
 	if (!rport->suspended)
 		return 0;
@@ -632,7 +634,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power off\n");
+	dev_dbg(&phy->dev, "port power off\n");
 
 	if (rport->suspended)
 		return 0;
@@ -651,6 +653,8 @@ static int rockchip_usb2phy_exit(struct phy *phy)
 {
 	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
 
+	dev_dbg(&phy->dev, "phy port exit\n");
+
 	if (rport->port_id == USB2PHY_PORT_OTG &&
 	    rport->mode != USB_DR_MODE_HOST &&
 	    rport->mode != USB_DR_MODE_UNKNOWN) {

-- 
2.53.0

