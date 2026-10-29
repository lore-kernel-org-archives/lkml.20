Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309136;
	b=pT5kROJ5fycEbEUAyRo7S915TXB9Ai4GoGBiCKuLjkR0NxF6VRTUWQv+huJDsNrZTcOM
	 vVR4D0FG03JMeHG8urTpbBwJWMu654zjRibqH0Lbk/FURD2ijAynHgGyrOxuDcwkA31jy
	 BjZ/OnrMBVSkikbGHGkz3DZurHCL2i/hRSsEHYIj7Jn2kqhSYPS5JD4wqr+gqPOaICowX
	 ecsZuM37innJ3MTg12dt3h+hcvyTvCzUMU/0Kq8N0tpKYkRf+Dn2JfSfhbe3J8CQcl9h7
	 Saa9klqUtGp0XaFKaMnYd6o2LsEY0PaOvsrs2OWacH0LQwrD9QnpvxlE9dqM/ozk59g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309136;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
	b=C72nWmAnWYy1Buee/2iJLerqkkcUTZtXMwEd6q2Uuh8Rw8n1DkJNr8Ce2GARYC1YtpX5
	 +QC+5SoViHNcAhKYIROsGifIdUM1vsXSpDUl9VITOUz0LBORxFNMQgjcvNNIAJktCcDk+
	 WOSOcN6sa9Q8UDkwChZ1hQG9WMRmEieK1rld/pR+/jOdWSgUOcz4j74CUPnbz48y28k7b
	 Jx/n9aG/AxqrED67PDxwMy3bagH0M+aVofpsxOhfz+YYkP6sHaP1238XZJysBhhuFF9t7
	 cVX2M9OdH5dN98IhbCvMzzHj9yf5JP021SIZL5Vqx0HpXrc9rzpWSMDi/nFC70wG3eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LqgpgvPg;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8731606A335
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8731606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LqgpgvPg
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-36a1947498bso14490eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309135; x=1793913935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=XToIsyBXPYvoavRjOLZZHUnboEz22aXbNMFVa6VYLPuDTKUIKp/OjB0EVXwtV/FTkz
         Q+X6kw+2IN7YqQZ2fFgdzmrRENNZNCNtBNzW5+yh2NN9sBP29Zr1/wf+rWq3SYPebmY0
         9WquZMat/OGuS3SyxgBV0o1GAVwrX+NM3BDbbWKXxjYRe9dq0mwRnf1MKDDD56C8VAJx
         xiUxQTL8WTp7RR4zF+9AKBgCNLuBpyqLrenXDTfjispaPHT6muXShojMakaTGfdFocye
         09IpMTaWbnTNlX4Nfz7VC1niJury5OzIJU4Nb2tsflqUNZx69g+k2m+PH3pvU5fOF8ve
         XmVg==
X-Gm-Message-State: AFq9FYITirPJvcQnn9+Q1T+Blzg8JoPme90U0d4LJ5jqTy88ExT/c6dj
	jEvgfHEbvIoOn/FI9a8MytD7FnY3SgYPMae+H16mAqcDb5BszXaD6/4S8RxjRpAo53dS88QNwGn
	vmlaZufKW1EHS4xPHOX7mTHxlnQwG6ouX1NGVjO8sNOi9gG0q26f5ng6fl21tFtf+3nK/RywjVk
	Ya3b2W5oqCCPTMzYhgRgyl+32Cyf9aNufb7JoDDq+ZXdnA1JWmHI3/0hh+H+ahtGNHulyGNdbH9
	F5VvnsoRCiq+FDMMc11+wtf54c=
X-Gm-Gg: AYBFou12akcUaYBwOXThTnv1RW1Nkw0KWTl+tLtRZN97ftqepmIj4ctC0ptQYA2Bm4H
	RfEHiVCGYocoGCpqG4Ph/Snog7NLWXBH9mwut0UoiJJGd4mo+20gpYvtJDgCvRTQ2xDioeLSULd
	D/14Jp6/lcR/inQLEHIZnVUp4U+a1hxVvfe5OFjuJtjQXtQxCZachswz8dwQ6ezbxkTKusjO03c
	MeiSudJf1SXBsCzPu32cPQqImfzeh+bj1YaYAt029Ev7deaiN/AVe8HS+C9cnEgnPbuJgIqg75D
	K96Fswj49unJzeyM+5ORi66E1XIFGsTHd66wwpmdbUbz4bQqBoP90tX+XlRlbWIkoPp+oTNbPAk
	pKYG+uotucmEUdyx7hW1M8wSmutsYek3bkYMVMwJt6TjaU8lH5FIGxxf7hWekPU4oEQYEHdd2/J
	7R9UA9Y4wiychmrkSUVeKgUA/uocBO2GaMO0yqLk9A
X-Received: by 2002:a05:7301:2710:b0:351:207d:bff4 with SMTP id 5a478bee46e88-36a42203e2bmr825068eec.4.1793309134572;
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-36a42834601sm6029eec.6.2026.10.29.14.25.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c861b562eso2225976d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309133; x=1793913933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=LqgpgvPgIyNpeL6HdQ7ov2NdCk69YlkDF331RJho5aooiN5Z8gzKRiDt3DPJvwyMwp
         GTWJlcFO/eje9HH2f/3fTSVkVc+l6yzc+hgZLGibBRQmnPu93AvXGvZe1T3IyE8gJrzq
         mbiMKzpxAeKlCt6qluEeJAmMS3BZmot815Mu4=
X-Received: by 2002:a05:6214:45a0:b0:91c:7a0e:3385 with SMTP id 6a1803df08f44-91ca4b7973dmr3564186d6.49.1793309132892;
        Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
X-Received: by 2002:a05:6214:45a0:b0:91c:7a0e:3385 with SMTP id 6a1803df08f44-91ca4b7973dmr3563736d6.49.1793309132301;
        Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:31 -0700 (PDT)
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
Subject: [PATCH v4 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Thu, 29 Oct 2026 14:25:10 -0700
Message-ID: <20261029212513.4126083-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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

