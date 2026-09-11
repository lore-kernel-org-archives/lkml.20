Received: from mail-oi1-f225.google.com (mail-oi1-f225.google.com [209.85.167.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA1425CF0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169776; cv=none; b=Fwj0PdZVphwfmFK1lrxvc1u19JVG7Js6eq/K8Fj3ucsnS8yIGWUGJv4uB0vLA4os4lyAAm8LNe1YfM3D6UrNs5oHUGAMJS/c+LE4UMxkjnEd2mrFApu5xeSXGns1TZKPB0EjhFtE8sS3nLEqzCfATsR2uJrN8Rfk9N2ajR+bWck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169776; c=relaxed/simple;
	bh=y3ZY0wBGgYCXfXkqzJYf85Uba7WDXKBwdPkshMcU+T4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qTmk0QYhn4c5C+oeTgu9YWu/6CKCsNlzUayb3v0N4HpbdNuiZDpTvZfj2knDNTXqGlyK+sKdIlhHjDvyQNsjGyFMwjXzsYupx4XiGOATvSMEOhSpZeskpEZAMjfbc/vFzCpAS+4KUvNDQwseGMs0CtL4keQa0acfqCWKrkTOj3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hoq3W9Ni; arc=none smtp.client-ip=209.85.167.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hoq3W9Ni"
Received: by mail-oi1-f225.google.com with SMTP id 5614622812f47-4c41bc58476so325200b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169774; x=1789774574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvxeiUifxpfQFpLPlhrwkJPg9MEHvf8vpcauDPPob84=;
        b=jysrO7mgrkPMRddy7+zQUGNOTdb7SFofUU57sEZ/ROkuGh3ZQCEKDrONtTCHEGCZCN
         yJ2Nees/Dd9A29bSgJmzuLJLgyWQ33mCpEjyCuInQso2pWJbTxe0eyPJ5yLeWDmuJ6D3
         Rt5FW3FUG1LzqSCnZBiAajMjhED8C6w3H/fgWicIgb1gfZFoibbBFlcPI9kmSSkxNK9u
         gnVtuflHWw0SxkveBxvn2u0K8A+mT0hPGwNslBzRM/KAwQ97j+MMTvnYxEqDxFsWImYl
         Hqu/MXIzpgEYOQAqdLaLi99u2pwr54+uGlpJuse4Hf1xrTSxcHe7UjCdgzjG7dYecf4p
         lCpA==
X-Forwarded-Encrypted: i=1; AKwUvBzbPfokMPrnWPuJKX4dTYc9cvLh+UVgRNA1dmLNnr49+djixJh5RKppYUkbi3D9SLRgYhT34u2fnJveCEU=@vger.kernel.org
X-Gm-Message-State: AFuF++m1c9YaY3lMaWsjQYkh/GwCIvVlNyHmr0tk1x1E80JlHyoe0ozs
	J2ShxPQjW5C4SeePTc38Ift1x9epRTzwe2fuqePIC1m43DZl0xR5yIm7ysR0nAQoZfNMFyAedzp
	U/dl2DEC/CDlcinqwsY77bMJo+ZE+lD82pWrigsANAb2YLG7cxFv3mqlliWGyLRqweT53t6Mmsg
	Uw6HUPbdcLVyUmmHnt4iJskx1igOx2kuuZFNy4Dv2839aShwECWTFdoqNR0afOGC2p+77IK3c+Q
	1Dw1RVtoHPqDV6/6sVT
X-Gm-Gg: AYBFou34KjKlUy24Bm51sPvWzN5G/GuR/qLxqdpPzZ2E8C8+ZhnBLjEHMGLyYYJdxZr
	UpUHbHp7a3R+ebwEige4wKd9+k4HKBF2ReywA1gSbyE4QFXrRPm22b3J44ifbsrDW7LsMrRe5p6
	QQiQ5WJ9R+qjLFefuw/y2RmoVxNEvOY9JLEDdPzQJpQYqtfQE+Q36w/jSi3vqQakMXarXmf5Ky4
	PobWzjz8EPPa4N9RroD/6Nx+Zcs05R+KVN9gWQ9PzkYRW0ZUBgbzREoZP6zTpNulbQSI0zgxne9
	SwA65EUwy7W1hQOL5VM+5p6SK60mh3Bh9c+Sn8Z+j3Sr1xpj2PCfePnt9Na7VAczFZJq6SG7YQM
	Tud8qBQ/S/n950UPU0g83zF36/+O9kZjn+T8qCtqDw3y3i7qP4DEK0ebJAkhikP8825fv4vrbDC
	LPp/MYx167D71LMoZVN/D6gemQz9RD+9YnV720
X-Received: by 2002:a05:6830:2e11:b0:7fa:5c68:d04f with SMTP id 46e09a7af769-805a0719251mr421681a34.25.1789169773896;
        Fri, 11 Sep 2026 16:36:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-803f56d4b3fsm1837813a34.3.2026.09.11.16.36.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ceabcd64aso27581126d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169772; x=1789774572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvxeiUifxpfQFpLPlhrwkJPg9MEHvf8vpcauDPPob84=;
        b=hoq3W9NiGhcMviPnYOAqdjmDWZWB0CK0aJunu7/QAEtToC/qJOHJBMVEckqPrMz584
         SmqDkxxI8l2kCebcaNby2584Z4H2elUur2llp5juw9sTyzDJu2cxq8KqEBU+EjY9cTqQ
         Dyv6E5GqYc6RqqWfoX38ZUtuBbQlzN0l7ea7Y=
X-Forwarded-Encrypted: i=1; AKwUvBydC7GqZAz6GTs89aUCyqBTKBeP/AKZtWLLEAlhd4Cg980AtYq+wV2DT1SXWGRcMqh3J03Z0sQnF1DLx7Q=@vger.kernel.org
X-Received: by 2002:a05:6214:3d08:b0:910:3453:505e with SMTP id 6a1803df08f44-9121dae180fmr10670866d6.32.1789169772221;
        Fri, 11 Sep 2026 16:36:12 -0700 (PDT)
X-Received: by 2002:a05:6214:3d08:b0:910:3453:505e with SMTP id 6a1803df08f44-9121dae180fmr10665916d6.32.1789169767016;
        Fri, 11 Sep 2026 16:36:07 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:06 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 11/13] PCI: brcmstb: Put max_burst_size setting in cfg_data
Date: Fri, 11 Sep 2026 19:35:36 -0400
Message-Id: <20260911233541.1650895-12-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Rather than ascertaining the max_burst_size setting by comparing different
SoC IDs, specify the setting in the config_data structure for each SoC.
Also add a comment on each SoC's encoding of this field.

Note: Previously, the max burst setting used for the 4908 Soc was 2.
However, it appears that the setting of 2 is illegal for this chip.  Set it
to 0 as (a) this is the safest (smallest) choice and (b) the 2 was probably
interpreted by the HW as a 0 anyway.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 29 ++++++++++++---------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 047783e33ae4..8bca98e6f5fa 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -317,6 +317,7 @@ struct pcie_cfg_data {
 	u32 flags;
 	u32 quirks;
 	u8 num_inbound_wins;
+	u8 burst_setting;
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
 	int (*post_setup)(struct brcm_pcie *pcie);
@@ -1153,7 +1154,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	void __iomem *base = pcie->base;
 	struct pci_host_bridge *bridge;
 	struct resource_entry *entry;
-	u32 tmp, burst, num_lanes, num_lanes_cap;
+	u32 tmp, num_lanes, num_lanes_cap;
 	u8 num_out_wins = 0;
 	int num_inbound_wins = 0;
 	int memc, ret;
@@ -1188,20 +1189,6 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	/* Wait for SerDes to be stable */
 	usleep_range(100, 200);
 
-	/*
-	 * SCB_MAX_BURST_SIZE is a two bit field.  For GENERIC chips it
-	 * is encoded as 0=128, 1=256, 2=512, 3=Rsvd, for BCM7278 it
-	 * is encoded as 0=Rsvd, 1=128, 2=256, 3=512.
-	 */
-	if (BFLAG(pcie, IS_BMIPS))
-		burst = 0x1; /* 256 bytes */
-	else if (pcie->cfg->soc_base == BCM2711)
-		burst = 0x0; /* 128 bytes */
-	else if (pcie->cfg->soc_base == BCM7278)
-		burst = 0x3; /* 512 bytes */
-	else
-		burst = 0x2; /* 512 bytes */
-
 	/*
 	 * Set SCB_MAX_BURST_SIZE, CFG_READ_UR_MODE, SCB_ACCESS_EN,
 	 * RCB_MPS_MODE, RCB_64B_MODE
@@ -1209,7 +1196,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	tmp = readl(base + PCIE_MISC_MISC_CTRL);
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_SCB_ACCESS_EN_MASK);
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_CFG_READ_UR_MODE_MASK);
-	u32p_replace_bits(&tmp, burst, PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
+	u32p_replace_bits(&tmp, pcie->cfg->burst_setting,
+			  PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK);
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK);
 	writel(tmp, base + PCIE_MISC_MISC_CTRL);
@@ -1961,6 +1949,7 @@ static const struct pcie_cfg_data generic_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
+	.burst_setting	= 0x2, /* 0=128B, 1=256B, 2=512B, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm2711_cfg = {
@@ -1970,6 +1959,7 @@ static const struct pcie_cfg_data bcm2711_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_EARLY_PERST_ASSERT,
+	.burst_setting	= 0x0, /* 0=128B, 1=256B, 2=512B, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm2712_cfg = {
@@ -1981,6 +1971,7 @@ static const struct pcie_cfg_data bcm2712_cfg = {
 	.quirks		= CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN |
 		CFG_QUIRK_NO_RGR1_TIMER,
 	.num_inbound_wins = 10,
+	.burst_setting	= 0x2, /* 0=64B, 1=128B, 2=256B, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm4908_cfg = {
@@ -1990,6 +1981,7 @@ static const struct pcie_cfg_data bcm4908_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_PERST_PCIE_REV_CUTOFF,
+	.burst_setting	= 0x0, /* 0=64B, 1=128B, 2=Rsvd, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm7278_cfg = {
@@ -1998,6 +1990,7 @@ static const struct pcie_cfg_data bcm7278_cfg = {
 	.perst_set	= brcm_pcie_perst_set_7278,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_7278,
 	.num_inbound_wins = 3,
+	.burst_setting	= 0x3, /* 0=Resv, 1=128B, 2=256B, 3=512B */
 };
 
 static const struct pcie_cfg_data bcm7425_cfg = {
@@ -2009,6 +2002,7 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB | CFG_QUIRK_32BIT_PCI_OPS,
 	.flags		= CFG_FLG_IS_BMIPS,
+	.burst_setting = 1, /* 0=128B, 1=256B, 2=Rsvd, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm7435_cfg = {
@@ -2020,6 +2014,7 @@ static const struct pcie_cfg_data bcm7435_cfg = {
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
 	.flags		= CFG_FLG_IS_BMIPS,
+	.burst_setting = 1, /* 0=128B, 1=256B, 2=Rsvd, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm7216_cfg = {
@@ -2029,6 +2024,7 @@ static const struct pcie_cfg_data bcm7216_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_7278,
 	.flags		= CFG_FLG_HAS_PHY | CFG_FLG_HAS_ERR_REPORT,
 	.num_inbound_wins = 3,
+	.burst_setting	= 0x3, /* 0=Resv, 1=128B, 2=256B, 3=512B */
 };
 
 static const struct pcie_cfg_data bcm7712_cfg = {
@@ -2038,6 +2034,7 @@ static const struct pcie_cfg_data bcm7712_cfg = {
 	.soc_base	= BCM7712,
 	.num_inbound_wins = 10,
 	.quirks		= CFG_QUIRK_NO_RGR1_TIMER,
+	.burst_setting	= 0x2, /* 0=64B, 1=128B, 2=256B, 3=Resv */
 };
 
 static const struct of_device_id brcm_pcie_match[] = {
-- 
2.34.1

