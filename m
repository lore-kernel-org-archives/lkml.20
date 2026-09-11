Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE440E8CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169754; cv=none; b=L7MmUX3C6q8MziELfOMnFVF2OiRONu90EnzA7/HIXuCdm2UdGPGTWy1YuU10DMZ0+cK0QIxiLwHS/N2GPDCTvORMsprdGcQB7xESyWbhO3H0s96CXk5i1NtBibHFGdH59imJY4okWgIK1/6h03iLkA6xchyMZFLGHsKg6W0qU5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169754; c=relaxed/simple;
	bh=//3ALQS3wymbFPv6KJPwmFP6Ogw6mcd5PsWWglFfL6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ibSt+uQE0PvyGzfGpKl8woHQX76RCTouBQcVpFRkSNqKRy96QroMnupVxw89FUi4Th1d1xH43lVgpqHLqsBGSlVuRHEu65OJuFBlERVw6Pu2r/nJZA7VLi9CcZdPvddVuy7vgs6ewKaUW1/9t9Mus3j4ELi4GDkn+PWZy7VsJbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WPMO/+ms; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WPMO/+ms"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2d6efd73032so25475335ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169752; x=1789774552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY9ozb5KV1VBJo3Z3p+RlJyXkFICluMij+wCeI97mXA=;
        b=JebI7vS6u9FtnD2L8qagugQGWly95qAEBmf5pOx3m1SZwurelmNhwvFzme9zDdtyjR
         MthQwTuhlgJLwLmi+o7S6fVTneiWMr/DrusbUFpy58IqbIk2U7SS0d2Y0m3bry49WtE4
         VlzKAYe8LI0WkwHndCnn7zQY+cWmyypJlZ8/lI/sciBrgJJgk8bU2iHmDKqTxGu2kiVd
         4UCe5o7sPWbrG2QqTvx6/0HSW/0HkjB8MJmcy/rV75mEpGB4srA8DY54go6SlXVEmFmz
         +1vsyvt/cr80nNTaONEn//OGamH6xKvRhOkm5G0/aplcdP/Bn7iYsW+jDwtQIjZ1eJxJ
         qG8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzldzncFFGNfcWBot3WE1ItZ68tjdosVFm75I53VIHC3/R1565J5AlYUqG8dJaaQaQg/CLGcpJsMrhooO4=@vger.kernel.org
X-Gm-Message-State: AFuF++nSf7RE0wmj1Dr9YPYZpM058e7rha/7t1U1UwXGv4xraFp8IyHE
	kpiXnVYb2m/YW8540AP5afb+ndeleeEX3yhLAqTKIo9Wq4A71tcAxz68jkEsWwwBd/7ZMD9+L8c
	1O63JMfHnmErbN6XrgfWM41rrZWXsiajkw3HWtyaZDJAZNUw8O3zA2KM444lMcSvVg6IYEPc7+7
	/4s+KuFXUTnhcXc+RhCfwxwixucl/fh/F8S2XyrHrlZQ2NGZKo5NSvLR2HkmaScDcCx3pGWtQPq
	0Mca1b8tngEC4XHiZam
X-Gm-Gg: AYBFou0vz5CCm5aZ1eoQXvOfsa2lMSWIGWlXUn2YmR3M2BmipkaWpx6DGLmh4Umgf9l
	XdQJoMIpVdVtgBuFIEJJNns++AWggrHz3HbxSvcjGGOCTFLx/PGMEZIEX6V2+5qCYM2w6hjdYw0
	+wrQC8uQw2X0EatdmcajqyckQWav8R2orxwT0OLe7qnOQ4lIpBZBrSSGsBYHyfRaIcguwPV+hrH
	isUEZ8anCqR0poWAoHT+4c16zEherY7WW8D9W+1srFfAt7g5noxmoSCrdNK8FSDFvZzRv+UmskN
	C0w5l+Vwq+IjoQgBf2RZc5VCJUZDgejopFxedUrPelLEZKXH/USf0XMDBYTQx2YF8HQ6jvQqF4o
	NsrKltV8tI7s7vkmtUYdYxCqFNmlwFOP+jtT1dGvEy8WfIPyspb7pxrmob2b9kPAuf5xgmfFkvB
	jQsbkIVSO6wUDLHdnilG8omJ4T1gQbZqLRFCDn
X-Received: by 2002:a17:90b:35c7:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39d97eeba04mr5843076a91.6.1789169752275;
        Fri, 11 Sep 2026 16:35:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39daa7a9f85sm1140335a91.8.2026.09.11.16.35.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91055aae7f4so47615046d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169750; x=1789774550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dY9ozb5KV1VBJo3Z3p+RlJyXkFICluMij+wCeI97mXA=;
        b=WPMO/+ms+I+7rbiJZOfRQ8IyMJPpdiGcJccvrfGEqXa5ERsKR9tNTr34MmSY50gm0d
         61PgVL/BitWRlY9Pu2HGtMTN7sI+4dbN+8A0J5jUyN7+PaIVJFm7HAAPYFx0m9/qNLUi
         /bJvbSOOf35K5lNV9thX0LVeaYFaClixglyXc=
X-Forwarded-Encrypted: i=1; AKwUvBxL1J+hfFcGlqJH/APBt1y79/4YGH4q9rsMGY3i8zqY3I7kwP2fk4pHFFOAxF6yqdgf4MQiW0kJTYQAjBk=@vger.kernel.org
X-Received: by 2002:ad4:5965:0:b0:910:42f3:958e with SMTP id 6a1803df08f44-912029a2a01mr144987276d6.27.1789169749959;
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
X-Received: by 2002:ad4:5965:0:b0:910:42f3:958e with SMTP id 6a1803df08f44-912029a2a01mr144987016d6.27.1789169749543;
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
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
Subject: [PATCH 02/13] PCI: brcmstb: Use flags u32 instead of bools
Date: Fri, 11 Sep 2026 19:35:27 -0400
Message-Id: <20260911233541.1650895-3-james.quinlan@broadcom.com>
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

Instead of having separate 'bool' fields for each SoC configuration, use a
small bitvector (u32).  Doing this uses less memory and provides a uniform
method to assign flags for a specific SoC.  The expectation is that more
flags will be added as we replace conditions like "if (chipA || chipB)"
with "if (behavior_X)".

A helper macro "BFLAG()" is used to shorten the determination of the flag
value.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 89aaa19d508a..47862569937e 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -286,16 +286,24 @@ struct inbound_win {
  */
 #define CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN		BIT(0)
 
+/* FLAGS */
+#define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
+
+/* The PCIe HW registers have phy control of a "RESCAL" reset block */
+#define CFG_FLG_HAS_PHY				BIT(0)
+/* The SoC PCIe HW can dump to the console PCIe error info */
+#define CFG_FLG_HAS_ERR_REPORT			BIT(1)
+
+
 struct pcie_cfg_data {
 	const int *offsets;
 	enum pcie_soc_base soc_base;
-	bool has_phy;
+	u32 flags;
 	u32 quirks;
 	u8 num_inbound_wins;
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
 	int (*post_setup)(struct brcm_pcie *pcie);
-	bool has_err_report;
 };
 
 struct subdev_regulators {
@@ -356,14 +364,14 @@ static int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)
 	unsigned long flags;
 	int ret;
 
-	if (pcie->cfg->has_err_report)
+	if (BFLAG(pcie, HAS_ERR_REPORT))
 		spin_lock_irqsave(&pcie->bridge_lock, flags);
 
 	ret = pcie->cfg->bridge_sw_init_set(pcie, val);
 	/* If we fail, assume the bridge is in reset (off) */
 	pcie->bridge_in_reset = ret ? true : val;
 
-	if (pcie->cfg->has_err_report)
+	if (BFLAG(pcie, HAS_ERR_REPORT))
 		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
 
 	return ret;
@@ -1589,12 +1597,12 @@ static int brcm_phy_cntl(struct brcm_pcie *pcie, const int start)
 
 static inline int brcm_phy_start(struct brcm_pcie *pcie)
 {
-	return pcie->cfg->has_phy ? brcm_phy_cntl(pcie, 1) : 0;
+	return BFLAG(pcie, HAS_PHY) ? brcm_phy_cntl(pcie, 1) : 0;
 }
 
 static inline int brcm_phy_stop(struct brcm_pcie *pcie)
 {
-	return pcie->cfg->has_phy ? brcm_phy_cntl(pcie, 0) : 0;
+	return BFLAG(pcie, HAS_PHY) ? brcm_phy_cntl(pcie, 0) : 0;
 }
 
 static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
@@ -1898,7 +1906,7 @@ static void brcm_pcie_remove(struct platform_device *pdev)
 	pci_stop_root_bus(bridge->bus);
 	pci_remove_root_bus(bridge->bus);
 	pci_unlock_rescan_remove();
-	if (pcie->cfg->has_err_report)
+	if (BFLAG(pcie, HAS_ERR_REPORT))
 		brcm_unregister_die_notifiers(pcie);
 
 	__brcm_pcie_remove(pcie);
@@ -1999,9 +2007,8 @@ static const struct pcie_cfg_data bcm7216_cfg = {
 	.soc_base	= BCM7278,
 	.perst_set	= brcm_pcie_perst_set_7278,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_7278,
-	.has_phy	= true,
+	.flags		= CFG_FLG_HAS_PHY | CFG_FLG_HAS_ERR_REPORT,
 	.num_inbound_wins = 3,
-	.has_err_report = true,
 };
 
 static const struct pcie_cfg_data bcm7712_cfg = {
@@ -2179,7 +2186,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (pcie->cfg->has_err_report) {
+	if (BFLAG(pcie, HAS_ERR_REPORT)) {
 		spin_lock_init(&pcie->bridge_lock);
 		brcm_register_die_notifiers(pcie);
 	}
-- 
2.34.1

