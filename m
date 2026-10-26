Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042293;
	b=XuF6VxcmfZ9yOWnk4chSvrOfjXPByU9Va2H3XnjnKXs2OQL+gZMYM8BPxq5oy8UaTDgQ
	 l8AwueO/aEUsmiTY9xZhYSmlDrvbls2gD7Y5wDwIAXeT3OjXVPp53ahx/cfqQH+EJaWT7
	 6z0Bvb57BqVQFwJzJKv+aNASXaWTC05qDwBepksMt+BJCd3sE4ri9Fw8TeXHRFH/yL47n
	 5e+uF+keuSeF2bqtWWx/IsK0sz7JhAStgjGlItUK1F7QkzL2HciNLNGC00xgOXf1RD+uC
	 uuKcZBnN1VHYyB50osxc9PbxCDPkgfSYk2zeCbSqDP/0FsWuEnVhIjG8U7mK2Apo+YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042293;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
	b=OUng8lFVWA5InzXi8cSA7A40efFkEDInT+34quW/QDPlzg5aXWlfkqTKqVmE/nb7y5tB
	 tmI/+x+iAjz8vtUgwNJBxXQOYhaM7DdMKgZ6OMF5zejRtYdQNTpiyQrkpY2Mnw2ZQBeal
	 iHwkFPht2Bat++wh3hVKSE7SxQnVNzVhbQ+WhKIWT1zAosoQP/U/aWW0eCzqHb2lsL2wf
	 EqG6xcb17LwtBKVTX4baHxQxlzfMHNiipiBNJunaeNZx4C8iUH+4f/Kuc/r/JdsUDu9QY
	 fpiqvErOV9w5+5xmcxxQ0N2fkFNbo/GQG811WvG8MDrwtCw+eAfnOkN5jH+B/W5E0sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="H0/Y/cJN";
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268C4606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268C4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=H0/Y/cJN
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2dd76b1361dso20543715ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042292; x=1793647092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=QmtfIazILhHvaV4C2yicEw9IS6Gz93dNzh849EwqhOqC7dK1aZdBU94JfBk14ubQqX
         671iO6AmTj2CLtNEcn4qLmmb1ctVdwJwB/WgLIzGg5UXequ5uwGeBQYgKnDAR8GlNfFU
         NuNBR4mY6Gjr9QUsX6cEAeT7sjuGPUTHXW7ZHc/6p8+4JramD2ebV4jOrv1SX7SZGb+r
         WFUzCCSg0OrYtj5qnjkHCE7VP8W5SdoGGyQn/3OMeTDwz/JQFhaAz4SCz2wWvx5N+OF2
         HdCB1n/E9jmxo5uHcblcx+9ljYi06z0kwYJFgndCdM0CNw6i2/EKF1qdWAkio7XXzov0
         cgKA==
X-Gm-Message-State: AFq9FYIe+Hs17cD/X5rKH5pKFIU4g9n8py8n8ptOV2jYUSjAy0bP4a+8
	uuIFUM10/UoWIFBRmIyACKIkeZ4+iWjKPFxmIo0EGTYuGltg0jXYaMQE48iVCwaPmtU69SOpKI3
	+zxp0sBfDVzaivC75dkWDF906PzRVHw8QNsqMCsEgq7XTqz/RdgPZvVHX7e9tm427GU7s2fCCL7
	IYJRBm2pIlwetLEfgzfOU/wpYorcqnf06oSPMgB0Bp52HrHgoRaGnrgziPRyQDaSfKp924LoYn5
	EyZU1sy0c8gpTqm1/F9BeaRZRA=
X-Gm-Gg: AYBFou2QsXg84ZrlpL56+mNXGQzne91I1ubbTKaV/uUbGdvP1jFucWd9Ey0CQCqDP7q
	CjlNxxaYX2SFLCxDIe/l0M/Yh5z+sVjNb1DARjF8WmX6dqTUPZoJSQYn9i7n2O6FnYira1/9yG+
	d6upqf6eKdj6mPOYMQzYG7UOxjuUQQJTcHPYXHpFGUjw6PKvtOasFt2xcfUxZlyWKkU3nPDFzIu
	kzSf9sW0bEvUvxu21+P5VaHH3CvlQ9rOlM2pKJy84f0Ttm1vdLMAieEEPTiCf5Pt9ZAUZNK1CbY
	bn0avwjwKxQxXgomwDFRfKQcGKDmYkKLAGkxTciQkMthwgbS4AigUqyL8TlpYlw8UBE7Y5hAn/J
	ksIw3MgelBmwsnkPAW8YhWQt5mIbirCPZ+bVxS/cAPbgyQpIffFANrOpokiTMy2pw9J3afMrE4Q
	c3epumAda6H+wQ1B4nMhkX1lUTJ1pkqaFIbComOtG6
X-Received: by 2002:a17:902:e946:b0:2e9:a090:dd69 with SMTP id d9443c01a7336-2ea9c80170dmr62391055ad.39.1793042292485;
        Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eae6b4f343sm30695ad.15.2026.10.26.12.18.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b8306ba68so87834206d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042290; x=1793647090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=H0/Y/cJN7a7qauIF7IdrLCml7qvQ06gT9GI2jIst243tn4hvmjbpGyj0KfD4TmTkhj
         ZZ98Z2ZGRJDRfojvzaC9e0Vf5+ZbvD+a1irJ5vgjfMP8MZ+I0wKX3ibADwAKEq4VvJjZ
         03+AfNWRUeTih2PLMBYeDViIEub4amKWjOWhA=
X-Received: by 2002:ad4:5d42:0:b0:91c:6d30:7c2c with SMTP id 6a1803df08f44-91c6d307d76mr12445366d6.52.1793042290025;
        Mon, 26 Oct 2026 12:18:10 -0700 (PDT)
X-Received: by 2002:ad4:5d42:0:b0:91c:6d30:7c2c with SMTP id 6a1803df08f44-91c6d307d76mr12444746d6.52.1793042289436;
        Mon, 26 Oct 2026 12:18:09 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Mon, 26 Oct 2026 12:16:15 -0700
Message-ID: <20261026191618.3178830-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The NSP probe path assumes firmware has enabled the SATA IDM interface
clock and released the core reset. The downstream iProc config_AHCI()
sequence explicitly performs both operations before accessing AHCI.
Without that setup, a cold boot can access an inactive controller.

Map the optional NSP IDM register region and enable the interface clock
before releasing reset, retaining the downstream settling intervals.
Perform the sequence at probe and resume before reconfiguring SATA.

Keep the resource optional so older device trees continue to rely on
firmware initialization.

Fixes: 3ee2e6dcaa35 ("ata: ahci_brcm: Add support for Broadcom NSP SoC")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/ata/ahci_brcm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf0..3b6ed56f3e95 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/ahci_platform.h>
+#include <linux/bcma/bcma_regs.h>
 #include <linux/compiler.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -83,6 +85,7 @@ enum brcm_ahci_quirks {
 struct brcm_ahci_priv {
 	struct device *dev;
 	void __iomem *top_ctrl;
+	void __iomem *idm;
 	u32 port_mask;
 	u32 quirks;
 	enum brcm_ahci_version version;
@@ -230,6 +233,25 @@ static u32 brcm_ahci_get_portmask(struct ahci_host_priv *hpriv,
 	return impl;
 }
 
+static void brcm_sata_init_idm(struct brcm_ahci_priv *priv)
+{
+	u32 data;
+
+	if (!priv->idm)
+		return;
+
+	/* Enable the interface clock before releasing the SATA core reset. */
+	data = readl(priv->idm + BCMA_IOCTL);
+	writel(data | BCMA_IOCTL_CLK, priv->idm + BCMA_IOCTL);
+	readl(priv->idm + BCMA_IOCTL);
+	usleep_range(1000, 2000);
+
+	data = readl(priv->idm + BCMA_RESET_CTL);
+	writel(data & ~BCMA_RESET_CTL_RESET, priv->idm + BCMA_RESET_CTL);
+	readl(priv->idm + BCMA_RESET_CTL);
+	usleep_range(1000, 2000);
+}
+
 static void brcm_sata_init(struct brcm_ahci_priv *priv)
 {
 	void __iomem *ctrl = priv->top_ctrl + SATA_TOP_CTRL_BUS_CTRL;
@@ -376,6 +398,9 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Initialize the IDM before enabling the controller clocks. */
+	brcm_sata_init_idm(priv);
+
 	/* Make sure clocks are turned on before re-configuration */
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
@@ -453,6 +478,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	priv->version = (unsigned long)of_id->data;
 	priv->dev = dev;
 
+	/* Older NSP device trees rely on firmware to initialize the IDM. */
+	if (priv->version == BRCM_SATA_NSP &&
+	    platform_get_resource_byname(pdev, IORESOURCE_MEM, "idm")) {
+		priv->idm = devm_platform_ioremap_resource_byname(pdev, "idm");
+		if (IS_ERR(priv->idm))
+			return PTR_ERR(priv->idm);
+	}
+
 	priv->top_ctrl = devm_platform_ioremap_resource_byname(pdev, "top-ctrl");
 	if (IS_ERR(priv->top_ctrl))
 		return PTR_ERR(priv->top_ctrl);
@@ -493,6 +526,9 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Initialize the IDM before enabling the controller clocks. */
+	brcm_sata_init_idm(priv);
+
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
 		goto out_reset;
-- 
2.53.0

