Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4B138DC7B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451445; cv=none; b=ZyFp3mCTyC4pkOezA0fgV97Gx4tCMtGGGP7pQHRbr5HV6XoqGRj3QEXUpwb17WX1ZgdYXU3jfXysle9ovgNWPkp32bEhA/g36Eom8nufj69zRqmXp/bTch88MFVuN2guOJE9KKb1e9ppy/oscn1gRRPZGAv7VadYP9T0O8853rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451445; c=relaxed/simple;
	bh=KvPeqZ5tXKYRlwDjNuXGtSeUVdNUoSnJ/Q/wobW583g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UTyKTYvVsvgs+YFQlY7vkwvzAfLEjeMbZcKeVu4018cppCcG3bRTbSSCL9KzKsGBWX35yzpKwlp78ukkg+m+98gi4gONH5PCarI+36cPS2LHaMKGoguxLq6eq/Ni217/AfQ3mhtIidkQj4p/3F/+GJy+b8KmocHArlA3eBUQpsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lin/C4Sl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lin/C4Sl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6f9e2f681so28009025ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451443; x=1789056243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=297pUGyvgajMiDzKmtW40WgWCQM+NoQo+Lf6H7vbyHA=;
        b=lin/C4Sl9fAu5Q2DB0EKsN20mEzvToajb33yG4W2i9l3ZMMm+kiBkTj7x8X3q4JNSi
         oJuddwnoldMb9BV9oHIEX810fJU75FhODqv+RZlwUqYuT7ZGnoNMmeljlWBnTHTTPq3X
         rwyAJyZkJUfpy7z1mwB/C7DVIilJ6W6hGzqNKmaD9u89BBgPgv0v41y4Gs6BznpQu0zu
         xRQZrvRnKbaTil1GXk8j8JEmPdup2nDqVblqkMaS/ywQkobFLH4ZQPMvYBjbB80pNka7
         TL6QGB8bns1nr1g5GtFPY9pqK40wkb6cFHI2RcwTlMIkBMgQy9toHMoakWuj1JLAUFCU
         MH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451443; x=1789056243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=297pUGyvgajMiDzKmtW40WgWCQM+NoQo+Lf6H7vbyHA=;
        b=hTID/EUYaIhgY+JiqY4q4UH1uOkcUzp6/ixV949zk3Vbw2e1oQp50jqnSZDTSpcajr
         NNhnfrWO4fiUIgUiEsDK049EWxoQGUPULcWAccKmwkbBeTQj3qYu/9D5MovqXv6eWbis
         k8dSsCCHs6ZwnHrUdNt1g3SngDUdfd933CthF+1MLhEZokFRj5jW6VF6i4xowOgBVMgg
         9bN/4PXZMQ9fY+EVu7Mc0D8nCPw7VRyl12l8EoMDAgFSxSVsJGuD7ggRbHbEGD8+8yyg
         /ZRN2clKoO51EbGAgqFze07SR5Lcxvs6ghf8mJAz8PrP5axXFuY2aS/iFIVhCAVnUDqL
         UKbw==
X-Forwarded-Encrypted: i=1; AKwUvBw2Lxwie/kr7R/pu4T7qoTCpEeBEIHkqrRhlsowhlRFYlvKs8U8SMLx699tWgChgEcHJizfspt0rnZ2z1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kaoafAL47ML5AZZjIL44AxsIBFruqaVYVIQWKyvxos7cmTKh9x
	Tic5Uq2c7hlxA9XoUUm4v7QAVIC6XihiguLIuz8buQRVvm88AO9t7YwO
X-Gm-Gg: AYBFou0JQAEcCk5blR5RtaJcKQXL+pFRzI9scbKDZLIMzi/6hEWNYSe6pbdotTRvdmN
	C/cYvGySCZaLPEnUG9sdXlAUPfGE4/Eqx0DlNBdugRJ8lOQe+sOj8nQMdQddiEqLixhA7T9J72M
	q6Pya/N6/UP6TWc2uJlaKmRcSBLn6k3pWKPeDAY47yjtOxL3F2nHFF5DKL/CRLLPBdcOQN4lLNw
	ddNMl555RxqITvlsut5b+tx0WC+MSYI2h591poyLMJJz7tBx1EwrJWvHpqXJwbAVvWo54ejcbjx
	GyoEiBCVxle/pEUgMigi0321QnXbCAi8/+jCbCMojCMEn6DsQdkmd4HPIZJl6jB5r80rWVsNKOw
	AfInM7XFQPTm4ItD7/zM3qIUCXUZN7XpjtgVE8A/AQC/Z2CvDwuIwiSLMxN8iPlVVD3OCz4v74b
	wpbLEuzi1dQVnh3K1zyZm2dKPvODghMZheUeGzKNVc2H1XhDPhjL4H4Y2D+dXSSFK6UWZhjriGT
	Ig3pZzPpiLCVjtPc/2PDmsiaXkgCboO1AYkXULlEggiAJWVJh+Q
X-Received: by 2002:a17:903:22d0:b0:2d8:d4ce:7e40 with SMTP id d9443c01a7336-2db12674f20mr124645ad.21.1788451442696;
        Thu, 03 Sep 2026 09:04:02 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62dbc7sm12815615ad.28.2026.09.03.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:04:02 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v6] PCI: imx6: fix resource leaks in probe error paths
Date: Fri,  4 Sep 2026 00:03:42 +0800
Message-ID: <20260903160342.3282199-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_pcie_probe() leaks both pwrctrl devices and power domains on failure:

- imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
  and adds device links to them, but nothing detaches the domains or
  removes the links on probe failure or deferral, so they leak.

- A failure of devm_pm_runtime_set_active_enabled() returns directly
  without destroying the pwrctrl devices.

- A partial failure inside imx_pcie_attach_pd() leaks the power domains
  that were already attached.

Add imx_pcie_detach_pd() to remove the device links and detach the power
domains in reverse order of acquisition and register it with
devm_add_action_or_reset() so they are released automatically on probe
failure.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v6:
- Keep the device links stateless and remove them with device_link_del()
  in imx_pcie_detach_pd() instead of using DL_FLAG_AUTOREMOVE_CONSUMER,
  which creates managed links to power-domain devices that never bind a
  driver and would trigger a WARN_ON in device_links_driver_bound()

Changes in v5:
- Register imx_pcie_detach_pd() with devm_add_action_or_reset() instead
  of calling it manually on the error paths

 drivers/pci/controller/dwc/pci-imx6.c | 58 ++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b98d..7dd22b4f826a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -180,8 +180,12 @@ struct imx_pcie {
 	struct imx_lut_data	luts[IMX95_MAX_LUT];
 	/* power domain for pcie */
 	struct device		*pd_pcie;
+	/* device link for pcie power domain */
+	struct device_link	*pd_link;
 	/* power domain for pcie phy */
 	struct device		*pd_pcie_phy;
+	/* device link for pcie phy power domain */
+	struct device_link	*pd_phy_link;
 	struct phy		*phy;
 	const struct imx_pcie_drvdata *drvdata;
 
@@ -639,10 +643,34 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 }
 #endif
 
+static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
+{
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_phy_link)) {
+		device_link_del(imx_pcie->pd_phy_link);
+		imx_pcie->pd_phy_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_link)) {
+		device_link_del(imx_pcie->pd_link);
+		imx_pcie->pd_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie_phy)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie_phy, true);
+		imx_pcie->pd_pcie_phy = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie, true);
+		imx_pcie->pd_pcie = NULL;
+	}
+}
+
+static void imx_pcie_detach_pd_action(void *data)
+{
+	imx_pcie_detach_pd(data);
+}
+
 static int imx_pcie_attach_pd(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
-	struct device_link *link;
 
 	/* Do nothing when in a single power domain */
 	if (dev->pm_domain)
@@ -654,25 +682,31 @@ static int imx_pcie_attach_pd(struct device *dev)
 	/* Do nothing when power domain missing */
 	if (!imx_pcie->pd_pcie)
 		return 0;
-	link = device_link_add(dev, imx_pcie->pd_pcie,
-			DL_FLAG_STATELESS |
+	imx_pcie->pd_link = device_link_add(dev, imx_pcie->pd_pcie,
+					    DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
 			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	if (!imx_pcie->pd_link) {
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
 	imx_pcie->pd_pcie_phy = dev_pm_domain_attach_by_name(dev, "pcie_phy");
-	if (IS_ERR(imx_pcie->pd_pcie_phy))
-		return PTR_ERR(imx_pcie->pd_pcie_phy);
+	if (IS_ERR(imx_pcie->pd_pcie_phy)) {
+		int ret = PTR_ERR(imx_pcie->pd_pcie_phy);
+
+		imx_pcie_detach_pd(imx_pcie);
+		return ret;
+	}
 
-	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
-			DL_FLAG_STATELESS |
+	imx_pcie->pd_phy_link = device_link_add(dev, imx_pcie->pd_pcie_phy,
+						DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
 			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	if (!imx_pcie->pd_phy_link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
@@ -1955,6 +1989,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, imx_pcie_detach_pd_action, imx_pcie);
+	if (ret)
+		return ret;
+
 	ret = pci_pwrctrl_create_devices(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
@@ -1975,7 +2013,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
