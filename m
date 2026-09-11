Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F7443302
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169769; cv=none; b=IkORCG4XT1JLt+AsCv7CqIUO7Z/wMzhP9nhsYPvO/5AZTV7wIfSAEriq/St52+aAIjN5cdVoEhhXWMQYSQmTjzPwOz74imzswDXkFW2R8S6p0F+0TgeDUySdbW0huKwJ3oWRRfhE9pXPkW+4HV0AWLiXJRtlXnbM7NedPG9RHEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169769; c=relaxed/simple;
	bh=Ob42Zosz9IH+YimKe9mUfcjrJUS96ejLsgBuTTyQBA4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DXGMtIYJKmJks9mzSLC4Z0mymEX7ggTM82DjNhmnbR4NWll4ENW1Jpw+uzU/xfoj4GN6R08f/cV4sUZhntQeI/KE72JeYrEMxcctiXm4wxXvuWDnUixCHDAmjAzAf6orVE2TjK4a7cA9mqg5559z18eR619tkzsZACvMEsKBWGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MbuqxYFn; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MbuqxYFn"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2d9201076b3so6719765ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169767; x=1789774567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RexkG3EFmXpE/deY9AEDz2v/2Wt3PCylK3Bm+blW8Y0=;
        b=XLmZe67KAMJH6qQbMllugnXYE6BRymTWaYQv+RN2bzhIAutNFkhItmS+efzXaVK+5V
         gYEbZpjmoS6X9xXpJlJNtayDhI17qyNAjGFKt21iv61XlJcF0ip84FNQ2Q67Q/HHJ+DX
         ZNL/hZHLukVLhLAABZQ4ZbWtao/wkKIpSZXobzR6EMEfhDvLsOB6k8ujygaC+Ceu2ZvY
         XKLhNPyGZY15YsjbBorugPvJPo+wJ9xSoGbk0YCUJypyFKd88HbebO4ZC12eQn2hTsLa
         NRrhmwqVCgQPadhP4usZmN2XVbQ0xVoVT0L/XyUVhU8sKe7Lrd0JMDfqyR6C1MYzcVi0
         rqbw==
X-Forwarded-Encrypted: i=1; AKwUvBzFVKpMjVjuTtDKurdJf1WaSo/Tgl7Z+ryAer5W1YDZ2CK6S0NrkhfkzhOYnbD2iRYrqBnhQ8GoApWW/YY=@vger.kernel.org
X-Gm-Message-State: AFuF++nQZmDcbXi64Jk93sJJij0YwyOy5BaqVpT0jBfs0sJSfaBxn8al
	QS7ZNyrHt7AHoXudlX1wSdmYgOzsVTtTncHBla1HCFGgDvmFJFB+7gt7Mtz8UjOGINpNDdCzj+Y
	EYJaCZ9vcSN6X4r6o3UFw7Wo1xUUsNQulRNB7j0NjHfdgQL2fGqWicb7K00DB5HEuKL0Hr9puSP
	7T/B1VsYXpycD9a9mqywFmq1l6SiEmAAGm2OQdcYVSylWGRCVJ5rm90ogTPIeEyX4mIuHN5Dahf
	LB6r2cXZ82S0vcuQW/P
X-Gm-Gg: AYBFou2qjEqrU/qOKDsXoMwzwDAY8OZT4l5vIqGsy3Q1mmCRHTSxyVyt3EnxtJOJsPA
	whXQgZrL0r4PU5fsVtYR9qsO7wXc5j+46WqwHQre59uzN+18jLsGNZXOxOanqtWu2rZCbQx2n+z
	J2yxcqmEc5pctqzK14tcCxPfQAq8Ja8AMAeegpIWdXUo8XiRulCas/FKotha4aku80h1FGMH+uI
	e6iIMYVvMmtft0Y1asbQzzLKcmcO8b89Pt5sFFic1Xm4uuvWmjOV0wp+55Qjh4VQsZZVR0ZC5Ni
	Stg/u9Z2Pb4dJ6dHMdIl/+wWrHQAwfOveGbXicW731Y3wKCYyhDIBeFrNHFYGr3CZ+9gM5K/4Yt
	niHGMZfL+q+saMDNQmwLyrbL86TAIyde7lkPrBm517gfy2QWJs2UukDqsrzeunAnNaEfq4NiRUR
	i0I3pryUBGTZ3nU/SKmd6Be3p0M0fwCI9JGx9s
X-Received: by 2002:a05:6a20:5482:b0:3d3:aec2:4dcc with SMTP id adf61e73a8af0-3daed3db048mr11504699637.24.1789169767138;
        Fri, 11 Sep 2026 16:36:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4c65b1a04sm1331178a12.6.2026.09.11.16.36.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8135d7eeso23262596d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169765; x=1789774565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RexkG3EFmXpE/deY9AEDz2v/2Wt3PCylK3Bm+blW8Y0=;
        b=MbuqxYFnmYe3Te8IRrICDYE9Aqwcjv7x1MPEer0MV1y4BT5EYhJJriuGC4EvUFe/dp
         kl6l6TsDAhMvTEZRWsKmT/BBDLBAWZeWShbAoZQtPr0nSn8+k6wb0sfXQuOhJ1E5nluS
         3Pg2J0jzkoGD7e+jwcVINK4Ig4YkoCWFXjT3I=
X-Forwarded-Encrypted: i=1; AKwUvBxCKuGzYHb6LqYUb8x7vjoeZmWGIA/YeE7iWl1ARbnpgVG+njsOOrz7Y3R4fU9NuhXiGBdSRpUzuT6kwic=@vger.kernel.org
X-Received: by 2002:a05:6214:3218:b0:910:63c3:5c70 with SMTP id 6a1803df08f44-912120f1bdcmr91745236d6.19.1789169765664;
        Fri, 11 Sep 2026 16:36:05 -0700 (PDT)
X-Received: by 2002:a05:6214:3218:b0:910:63c3:5c70 with SMTP id 6a1803df08f44-912120f1bdcmr91744836d6.19.1789169765178;
        Fri, 11 Sep 2026 16:36:05 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
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
Subject: [PATCH 10/13] PCI: brcmstb: Declare and assign quirk PERST_PCIE_REV_CUTOFF
Date: Fri, 11 Sep 2026 19:35:35 -0400
Message-Id: <20260911233541.1650895-11-james.quinlan@broadcom.com>
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

The SW behavior for asserting PERST# for some SoCs only works up to a
specific PCIe HW version.  Declare this as a quirk and assign it
accordingly.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index dfd703571091..047783e33ae4 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -298,6 +298,8 @@ struct inbound_win {
 #define CFG_QUIRK_NO_RGR1_TIMER			BIT(4)
 /* PCIe PERST# must be asserted before internal bridge turned on */
 #define CFG_QUIRK_EARLY_PERST_ASSERT		BIT(5)
+/* PCIe SW PERST behavior only works up to a specific HW version */
+#define CFG_QUIRK_PERST_PCIE_REV_CUTOFF		BIT(6)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1987,6 +1989,7 @@ static const struct pcie_cfg_data bcm4908_cfg = {
 	.perst_set	= brcm_pcie_perst_set_4908,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
+	.quirks		= CFG_QUIRK_PERST_PCIE_REV_CUTOFF,
 };
 
 static const struct pcie_cfg_data bcm7278_cfg = {
@@ -2168,7 +2171,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		goto fail;
 
 	pcie->hw_rev = readl(pcie->base + PCIE_MISC_REVISION);
-	if (pcie->cfg->soc_base == BCM4908 &&
+	if (BQUIRK(pcie, PERST_PCIE_REV_CUTOFF) &&
 	    pcie->hw_rev >= BRCM_PCIE_HW_REV_3_20) {
 		dev_err(pcie->dev, "hardware revision with unsupported PERST# setup\n");
 		ret = -ENODEV;
-- 
2.34.1

