Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF038E5DC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849509; cv=none; b=IomtFm3hAp8AuKeUdXf2JSWKIMkAHnry9FAtuwel/fiEjIF5UcccAY3MJXDbGBoY2CM//yzCwXl05NNhCuNJ589eIRQZcITi3XeRsbzCDZSkhLuoroLZqX0V9W9blm0ytn+hdkwZSsGsewpQuhH5euBsn5D1VpI8UcyCNJdR2l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849509; c=relaxed/simple;
	bh=Cv42epPoNORB5PcqX0k0Mx2zGd1B1jSGrLyDLj5cWzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sr84kb3rdsJ7hd+klzAmdZwxRRTN7S0TMrKjFkIG1kRQTRm/+IJx0KSRsvffKEW0oFl27i4FJVlYr2WCk3CHwXuVwr+qbIG75bvs1A5KCsGRaVf4tvu1dZSE2MzE6BR2F3JrTj6FCilmtkP/GEaPRyfR08wtp7h91gcVnxEBUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UPmiKO5t; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UPmiKO5t"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so12491955e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787849500; x=1788454300; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=UPmiKO5tjCBgg9Veof5q78GmapElJC/DKhi9U7xlb78/iVwe+eRPB9jz+4hozV3pFu
         NwClMPn/fdvaA/Ft3eVHeKzIJrTGeCDFj2y10eiPtfufr7Rxqgz7iJCR6TsySmWmic90
         JRc9lyixKDzgEXxOpkgkkpCtWSMhXWFMxW5R7lWD9r1I/2h/msNzeacDSvNa56mXD4mA
         eV52zd5g3sNm1+3T2PT18RM34RNXE95uBOBFYHAibAo4oFMMkgUYDdONxgD80SxssHO0
         9D7eayx8udJ8n4qUEL5wCjfsgLcTZkef3rv1qYK2EgQm6EOzH87oETH7srpONoJdGysb
         164w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849500; x=1788454300;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=QvZmxRmOyKwWr2DGxzTJhfFW8tRqiE2h00Kz4+x/3/BnurXQNU/qX7dS6SYkVMRhHD
         16Saw/eF4wp6WRbqOf9RrG6wPkBxZkQx6ffJ5UyDMu4wKDfSTfQGgQYWSmV9aKFllxw2
         5Wy+nWGrsQQP2ZCEsB6FCcfxRiY1x3GTftN5b4/Vhvk853M3tqUUG7sYuiTMhdscNx64
         eVkUb2rQ4/ilOc9eZkv+EdgfhkTo4ZVvlA2dw01LKzVKZDrfgOODNF/SPkvFHhEZS7XL
         IxvQlxNBxM+Tvyuu6idzGWEtB+tEc/IUg2g+3WiF33GUZfTTf7EWiUXX1ccmW5Godela
         eN9g==
X-Forwarded-Encrypted: i=1; AHgh+Rp3qk1p7S3qEO4/GUWkJxb0pJ4oRuJYClinvHHMFx4zRT3YkwpbaYUB/Mwl4q8VFyohId/9D1Fkp0hhEnI=@vger.kernel.org
X-Gm-Message-State: AFuF++mEzTiBTwkgQV+Gcpv+p0BwHOGUJmN480q8k1Z1e7j9HgqA58hi
	+SCXzCB0OtZBifdBOKRktTVpzOTPs1iuZXTrZXEd/kkaUCf8c49H3RpkMsKvdsbpdg==
X-Gm-Gg: AR+sD13g30fa3sug2LoPjZx67g2DxteZfjX7erXK+esqO+Tqi2S4RjHzg/ZprXuYu0u
	3uYjERE+rG5+R09sMMI1h4YUMc6es/7iEtpDvNlumBbBAbSJx9dvL4pUf/oaQRT80nqyn6dnD4C
	e8J/yVa+6J4xTpGBdDyjY1rHY3cCAv0NhRduvJNGU4IAUUOUswO8UO4KoOyzF0QRYXakDYwjUq/
	+/1FjRJQLPaXPBEDZw7zU/5sv3e0MjMYPSKkDaeSi+R9EWk0rBwy2wvCL84HBa1bHMSYGkURgmQ
	YXVqsYSX3ks7Mmlq35skulUKgdGp/c/NfxBv4HVfhLtYYK0udblBIn8RZVOZU8LyZj5mV9FoEjY
	KNtCu5e0q9Bgg1MfVB20iW+M0HVQ3xOHb1TvFUKiZ/tKO0w4GZ9++Ti1/klDqZi+pGwvKAmRLEJ
	0ai/egLNL+iRLreW9n5dCdZCXoG5zsJd1l1BdeLQ9lQyns6yUkUgMvtmzpXRTjtvUd4Cxk
X-Received: by 2002:a05:600c:8581:b0:499:a760:722f with SMTP id 5b1f17b1804b1-49b91c47bf8mr3744675e9.13.1787849500201;
        Thu, 27 Aug 2026 09:51:40 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56826bsm78234015e9.4.2026.08.27.09.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:51:39 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Thu, 27 Aug 2026 18:51:00 +0200
Subject: [PATCH RESEND v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161;
 i=michal.gorlas@9elements.com; h=from:subject:message-id;
 bh=Cv42epPoNORB5PcqX0k0Mx2zGd1B1jSGrLyDLj5cWzY=;
 b=owEBbQKS/ZANAwAKAWKaksyA3pPLAcsmYgBqkGsXl1XXO7CczlDW42hMAd4AcZI7L/miM5XQi
 4HNMYkWKaiJAjMEAAEKAB0WIQTgoC0bQQLz7jVH2W9impLMgN6TywUCapBrFwAKCRBimpLMgN6T
 y4SzD/wJXnY4K3bTVEqMPYGKOQB6IFLjmxS3tCQvn8h7h8t5zTdtMDxOFbhTcZmNtsMWFM2KZ3b
 hGFQ41UMlczcyAe1IoHiRfx16B6MehkVhQYZaTR9Xc4yIhY4YPDHqMWll3BcRup8lRQDdeeU0z6
 bcPDaS0n9KjobxN5WwaVucD/5Bz423OQstjwCKLJcDCiGTVKIfMZF7uD420M1SBbMJIvwLiZi/A
 j8d8OYr9+QTsNKsU6HWf86ylOYXSwl2dH1fzh5rWkfmJitWKAqq7keIyhA3kbrCyVA9fsivsWQ2
 hOlnFLaXj7zbuKnsYSP1XJ3dlO5XtQ/Wnwt1/ZybSlFY5lVslsBm6Mssdn6ho8xejaRYHnH2/i7
 bC5g08hPvdLX+E0VkiN07CNG2LIdmYK6gW7+ckVek5T+ddG3i6+Cb/YBB71y4wlqS6o0g++uKzE
 +HK4CPkHupuSyC2MapHS1fDejhDh8/ab/nETLOz+uZ7SEMXlnCoHuXeCbEuhK0pzeY7VSFVje6V
 JyHtOsXDPTxO7JTcbhWO4v6rdu6+HAlbkJ/Bl/56rJmxXQqP9g8eK+zd+tIBoqkr+rRZgA37Aa7
 O0C3NOOnOWAKdeAMraI9QgkEix0O6xybs4nEcQSkUDsa33YGklAhit7mq0u2jBNjiK7Sa3NvDZz
 NwUnFbNbJkBgepw==
X-Developer-Key: i=michal.gorlas@9elements.com; a=openpgp;
 fpr=B4EB74EA41969D1140A4D1791596726986433F8C

Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
states for devicetree platforms"), ASPM states are force enabled
on all devicetree platforms. This causes PCI devices on some i.MX SoCs
(for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
though CLKREQ# is not supported (and consequently supports-clkreq is
not set in pcie controller node of their DT), which causes the device to
never wake up from L1.

Hence, disable L1 capability in the LNKCAP register if supports-clkreq
is not set in the DT explicitly. For devices that set
IMX_PCIE_FLAG_BROKEN_SUSPEND, disable L1 on resume as well, as these
skip imx_pcie_host_init().

Note, the logic here is very similar to 613f3255a35a, only difference
is that leaving L0s enabled does not cause issues (at least
I never encountered them myself when testing on the device) as its
not dependent on CLKREQ# being physically there.
Since there is already a way of specifying its presence in the DT,
the driver should be aware and disable L1.

Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
---
Changes in v2:
- disable L1 unconditionally on resume for platforms advertising
IMX_PCIE_FLAG_BROKEN_SUSPEND (Sashiko)
- typos in the commit message
- Link to v1: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com
---
 drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 98e1db751132..1fdcbcd2422e 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
 	}
 }
 
+static void imx_pcie_disable_l1(struct dw_pcie *pci)
+{
+	u32 val;
+	u8 offset;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 
 	imx_setup_phy_mpll(imx_pcie);
 
+	if (!imx_pcie->supports_clkreq)
+		imx_pcie_disable_l1(pci);
+
 	return 0;
 
 err_phy_off:
@@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *dev)
 			return ret;
 		imx_pcie_deassert_core_reset(imx_pcie);
 		imx_pcie_assert_perst(imx_pcie, false);
+		imx_pcie_disable_l1(imx_pcie->pci);
 
 		/*
 		 * Using PCIE_TEST_PD seems to disable MSI and powers down the

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260713-l1-conditional-imx-c2bfd20ae085

Best regards,
-- 
Michal Gorlas <michal.gorlas@9elements.com>

