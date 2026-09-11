Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D6417D97
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169762; cv=none; b=ksBADcJgibH7G3N4S+SK0qWZi22/F03+4QXkLWk1ZbDHBGVSYC7EFDAVPt6J8xzSdasR4MkgNcX/ejfzXq6tuA47E8ObWuVyhZ8d8f3f24WEdsvEdFRM3HSogXcoS1cJoKOnPAon5ajrGeeOLRbTIRZ74OmnuImRZ6MZUKNJHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169762; c=relaxed/simple;
	bh=NwQuhCJMs+MGn9FpjpyCblI4ToMl/sX+03cL9s9/s/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DOVvBPEywQWpppxjK9hmnMP9IfM7doiF+/18uqs5YYZbxc9GSuDg05Xj1hANps/3LPWkaZQvPe6hQe4wCT31uzlXiGjlxKYhLoPYp3+fSnK8HoGmMkgFFQfOhNJ0WVftlgInrfwf9Q8wLZGztoYlngyW/zXsLvGmOP3k0z44Bek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VhkWK0a2; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VhkWK0a2"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-86a686c0fdaso526013b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169761; x=1789774561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxRFCrZ4tEYGl9pgNTMvFraV93EKM855ZrrXiCcwOi4=;
        b=kprzpChMlF3c7zBGABM1I/rq5Kwqsm/ReY3wNiwUg7aPMTHn/1Ex5cWH1HdqRw+KDD
         i+etQr7DcAeZkkVDnSPXYNqIC7u6xU8jeKAVPHkBCISLCt2cDfDbo99psVYqCBO0dmaz
         B5e30/vqQY/LZ9MxY3KsRE64OeCrjVlOn92Sgwf+y6ZPnLJG9rnKuqN4U11HWCwi8L0w
         f/6fi1mKjzNutUDtgYhVwItdmrOwrpEigGGJXtOKjq0gL6AUnSXtAKTqa6FlocbuWqHM
         XFJ+LBSmMKNkYIOuu9KPIRmdUApFb54aFRVTydT4JoMAOEcaL9uMQDUhyIQolApyik1R
         IqPw==
X-Forwarded-Encrypted: i=1; AKwUvBzaBhuKX3rYONoKkxaMjNnoxsrfU9m+Tt5rKn1p5/gxRqnM58irdRQgojct4NUATGaY+NZTs8kILwnL8Xo=@vger.kernel.org
X-Gm-Message-State: AFuF++noGzUoA6xoGs3+JtfkkbfgzPBrkcE4c8eJTLndQp+eNK1chetK
	PG2RyXa6tg7lmyu4TescxjSKrbRMtpDOXIdfvmao0RuvHcEkHTsUvdXFDMR51lYg+xOQE6i69Xh
	MWy1zOijov7Yh9OWgQo9+7jXX34krYRLeqLAR4ESx3kEXGOTSs5thCpxJiFVeGMSkSwB9NZoIK1
	VHaM17MSvnL9oEeq8qrzuWn9p/bXYn/Vyu47QUk86rKuls1m4z7SLAUTJIHhCVX8vkGhrD9ZoPL
	Ifltp3Jq5ILz2kHBfdF
X-Gm-Gg: AYBFou3/a2A2haxAA6dDG9DnBBnuBI9zEbI8A3Icg+2vbmGdSOWu6yg/3P/EY0FziHY
	FKPI13NXiaVQkXGBPx0uUYSBQVO60mKoQpEInSPvNqR2OjpIasDWUl7jJow1mmWxyZGDtmpqx3D
	vBqrsBEDaCb+g3nuCDExF0HivQRgPqQnv7KOh5rsev5u9Wz2ItUEmHZnDKawlqE3m/dX0tU8M/I
	8yBzc3YAfzVCDMRQJGpqgd1x9COJ0W4I+ZrLn/xOTrGYBMl6RtU9ohyEv197J3n9+Hl8XVR7DE7
	V85njmHIpBEg9XWVIwlsQkIXqpERFFl+ioFJuI7FQNHJflYUFK997d0182X3vrrfL3ks/Sc8HKY
	kLysbPcbj8kZU4zqp6iD23v1Gl7+svvWihPeR4c/lQKdcg1VsMCcepMf3bFx7Bl5Zq+Qs0Mm3W9
	Q962RnNOAuPLB6rRHmR9uVwhDgNXgl53Epscne
X-Received: by 2002:a05:6a00:448c:b0:86a:5a9b:32a with SMTP id d2e1a72fcca58-86b31706dbemr11401556b3a.9.1789169760911;
        Fri, 11 Sep 2026 16:36:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86b4256fe0fsm1089608b3a.3.2026.09.11.16.36.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e98e74535so25187146d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169759; x=1789774559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxRFCrZ4tEYGl9pgNTMvFraV93EKM855ZrrXiCcwOi4=;
        b=VhkWK0a2D7E3JOUR+xUK0QWyobk3J6n08lpm+CKzCTAmu6AVcDPtvgyEIEzFvigDVI
         xfQqorHDI8zZdOGHtnR6XHiCCqeHAxovU0BCfCKtDf4tPszFB4/G+P/A842cKyVkv+Ro
         IgBPF5lUWl5XB+wwnrgxkTzXpJHmg0HEYgr2w=
X-Forwarded-Encrypted: i=1; AKwUvBzs5MQL/16myZAe6awQhRwPYoCzw5azbSH4zQlhJUvnN1gXyqZ+H8ino9iupp5Wk8qzyxyAWO4G0Pn3HeM=@vger.kernel.org
X-Received: by 2002:a05:6214:3012:b0:910:a402:eaf with SMTP id 6a1803df08f44-9121211d5c3mr93244226d6.35.1789169759455;
        Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
X-Received: by 2002:a05:6214:3012:b0:910:a402:eaf with SMTP id 6a1803df08f44-9121211d5c3mr93243826d6.35.1789169758991;
        Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
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
Subject: [PATCH 07/13] PCI: brcmstb: Declare and assign quirk 32BIT_PCI_OPS
Date: Fri, 11 Sep 2026 19:35:32 -0400
Message-Id: <20260911233541.1650895-8-james.quinlan@broadcom.com>
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

Declare a new quirk that indicates SoCs where the config-space accesses are
restricted to 32bit R/W.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8927d1d97f4a..be414d346855 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -292,6 +292,8 @@ struct inbound_win {
 #define CFG_QUIRK_OB_WIN_32BIT_ADDR		BIT(1)
 /* Each of the outbound windows size must be <= SZ_128M */
 #define CFG_QUIRK_OB_WIN_MAXSZ_128MB		BIT(2)
+/* PCIe HW can only access config space with 32bit R/W */
+#define CFG_QUIRK_32BIT_PCI_OPS			BIT(3)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1996,7 +1998,7 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
-		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
+		| CFG_QUIRK_OB_WIN_MAXSZ_128MB | CFG_QUIRK_32BIT_PCI_OPS,
 	.flags		= CFG_FLG_IS_BMIPS,
 };
 
@@ -2050,7 +2052,7 @@ static struct pci_ops brcm_pcie_ops = {
 	.remove_bus = brcm_pcie_remove_bus,
 };
 
-static struct pci_ops brcm7425_pcie_ops = {
+static struct pci_ops brcm_pcie_ops32 = {
 	.map_bus = brcm7425_pcie_map_bus,
 	.read = pci_generic_config_read32,
 	.write = pci_generic_config_write32,
@@ -2180,8 +2182,8 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		}
 	}
 
-	bridge->ops = pcie->cfg->soc_base == BCM7425 ?
-				&brcm7425_pcie_ops : &brcm_pcie_ops;
+	bridge->ops = BQUIRK(pcie, 32BIT_PCI_OPS)
+		? &brcm_pcie_ops32 : &brcm_pcie_ops;
 	bridge->sysdata = pcie;
 
 	platform_set_drvdata(pdev, pcie);
-- 
2.34.1

