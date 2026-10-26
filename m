Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039372;
	b=HApdBeaRvcms71lZwAUL51sjk5uhhe5jeiqFtIs0JP5u+ePHzYG1Pr9Oy5uWh9xraAn5
	 +IpPqYvfneSfUp+RdqKByBhjUzyAcyDUJpYRfBvce/wlkJmlYrlKny9JXQ5e65JwG+ciY
	 Xv0YzXMOhh62wDncZoZA44CoLdxlyoz9ahUl/gyp4GVYD54X1NaWRXwT/SDwXpRVX6q/F
	 zqKwG+EXwf+PXaccaUeDlhgE+XB04HJSsXsZP2/THScdwP763yrL9FH3umC99xGn0Nf/O
	 Yr/oVZipIUEpx+1z5//gwlidnPwHkD6k28poSEnFJn2uwXRjwhrdpVbJP9BOogANsuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=;
	b=UUUjgnSb5kpcjbPc2EIphG8zLLCqhCriLVrYsVfw3+OOtZdTfdvzIpaqmasWzDksZB7E
	 Pi684Yg4oXZ8Uy7XLIvTk5wwOSW0PHbl6oteCbu3Tjw2UjTunvystVy+fJLlk6HlePXL+
	 xD7mXHbXZKH/3vegMn3ZFZzwtSewOawSvByox73jV8g8587YOAgDj5IjwQFdfEtA8Mtuq
	 PqyLsWYo5PO4DMbhyFxtr/wH7ml+XdMXHpH3Eb02EAzSMEpDbLcJzR+dZrV7FNwjqqOfp
	 yeMFUZulEW3y/QQROZ7AxfhG22pHJnyz6FamShuYZ1+gPN2nyWoueXHbCPtIHI95JbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LIOJVQOW;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDD606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61BDD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LIOJVQOW
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ab41538192so2462832a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039372; x=1793644172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=;
        b=BTpriBXlodFcersFr/Dad+q+mCTe7+bypfGbJjpPhMDi2wT8L5Pon/MY/WgogzBM6o
         gkfI4rmGqdVYRJOw3FvBSooAn1aMbk54qqBmK2+oo2ltioFTK/H7P7mR9l2E7JRwsBoS
         8N2LPC093LhewBbdjYr3QCbT1rIk2X+x8v8l+oljmn36A1KjKJJV2OzBfL6HSEOgc8sl
         p140Kf4JAofrWnik1NekD15S2BXlJrxaTczwrJSretnvZGrZzJjbE8ZBiAVHZtXNxfiC
         BA/1606o3d10uF5vRZKSnXyszFqEw0ZZ0vxdCAs5S6bMDmo7OCLzZ3o5etMSGkxUtDgc
         xrWA==
X-Gm-Message-State: AFq9FYKwtayFWPA7h/Awgf1AzGZFpdrkqk7ieDpLZuNaysulR6FTKPWF
	tlhXOnyirNdV6cckPet9HzQwGXcviNBijO9eEVfWKHAeRsNfK7KZLYOjD4RMzEGaL+/mMCGS+Z7
	o+ALxBOKDqZysgcUx5ZOLrbWhtmsvRzj+C0F7jGmHKB88Bw1E1DXPp9hT9ewrSIS4vsb1M1d5zk
	88ppmg9tpCPDW/DVJ7Igylph20nvsXjbidwnD7PDvBeYrcb+VW/bHLeBJZOPz/DVKak4GCEaEcD
	W/ywJlUSoBeH8LFBh+8//h2
X-Gm-Gg: AYBFou3ftUCzC0jJhF5iZQEluySNJcAmL0x99WIJtlJ5diYSq1KfLF4xe/fUam/lkRo
	hWwEZyBh7gwC4KL4O6rOjHlnW6ZkWfe4E80L13JF/nyc2o0gzSYtfkFSZ51DQJvURu6UVQ0rx/8
	Tw3qABJSdq5l5RW6GLH8z+vvNuvLkpe5txOq0gNHveB3I6A8j4v6Sl2DTP91TIAPxa1pAWHjZeQ
	Chr3mEKFMoPJgqM9+UQzoxg93WVeqnYjjk/I7pLVsL8+Uf4h/9tEpeCnZqtx+J8i0J/wGGxuNJc
	GJGYQHoGs9jybR9B13vseMRPpG4WUbgYCOd50/+o+T8bmtgE1JOeQ7YF2e+LfYVtpooviWBUdGe
	XvQvROiL0PZ0WEH2Yx9FtspePS3ZNVXLyg2SPEYvIpxPG4FCkerCo2b8yJizmFZt7vEokhQiNHE
	5ywhARKH37N2gFauoVByKxJ05Vv1vOB5AwYzaqt6oJ
X-Received: by 2002:a17:90b:3c41:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3adeb123844mr6687999a91.58.1793039371694;
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adeba6ac8fsm3433944a91.2.2026.10.26.11.29.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so5741740eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039370; x=1793644170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=;
        b=LIOJVQOWEm+yBjrPuVXalbtBdskNsAKvaNT5yoKyNwbTpn+54ucSCM8hMN+E727FAZ
         eNjzVHvY8XO/SyJfAcM6yqUY3P12srdSQG0Y3tGf345Hth/6mHpJAdP0Lhg4/kNPxru5
         xNbzYX35LbfCHfPBkSQlkUjPrby9yXmyK2WRM=
X-Received: by 2002:a05:7301:1525:b0:369:a113:756f with SMTP id 5a478bee46e88-369e850d487mr10690528eec.34.1793039369757;
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1525:b0:369:a113:756f with SMTP id 5a478bee46e88-369e850d487mr10690462eec.34.1793039368795;
        Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
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
Subject: [PATCH v2 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Mon, 26 Oct 2026 11:28:53 -0700
Message-ID: <20261026182856.3168686-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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
 drivers/ata/ahci_brcm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf0..2ed60806b671 100644
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
+	/* Enable the interface clock before taking the SATA core out of reset. */
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
@@ -369,6 +391,8 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
 	struct brcm_ahci_priv *priv = hpriv->plat_data;
 	int ret = 0;
 
+	brcm_sata_init_idm(priv);
+
 	ret = reset_control_deassert(priv->rcdev_ahci);
 	if (ret)
 		return ret;
@@ -453,6 +477,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
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
@@ -493,6 +525,8 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	brcm_sata_init_idm(priv);
+
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
 		goto out_reset;
-- 
2.53.0

