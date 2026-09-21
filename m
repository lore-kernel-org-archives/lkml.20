Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CCF49E5F8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000522; cv=none; b=NDzIbAd2hahR6Lp+E3NOw1h6ZHNeNfoqKRjdLD7Ih1dkXcm3789WCW/qvdoGi0mQ6tMexZWGFKw4/sN+aEvTJ9h8iV/kAt5HbXdw9s3nkeGABxUoyEfvngnb8piHPmZhLJbwzhynt4bV/pAp/cuWyiIzWOfMp59V0t0aERYbFEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000522; c=relaxed/simple;
	bh=lyIz+1l5b3G3/JlMz/Ffg83kJuwv+dOtA5fodcHyDDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OEG4ZQpLBhWrtrTA/SyCQ2HLigbKs0RR7jPPfkAdHzUMYt2EAA4IthHkmJHqeWvu+YHxrkJS6evEtntnslYoWELKbo+lGJ7CseB3u3n8SygTQ9Hf1hKTeEUdIpo0toFqUFTqBe1VgFLNZHHuLbTnL72oFbbzPehs/+kQpsPFT8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGpj+Uw2; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGpj+Uw2"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d9004a1ac0so19617145ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790000520; x=1790605320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qptzRTLzEX4ORnvKTYYJwd+9jdXwoH4m16aZtajA1I=;
        b=NGpj+Uw2uMlKIAfFtyVX3rF35jjGJS+jT/ZC5VD29xJEW5OLs+7894zJeac/GJ8GNs
         InpD5kSLqJVOaHwZ4iDBePUwO100C2uAhh72nR5RuVuyMf2YxIH54R8tqjyZJnIz+rn0
         Tgw+qhPFcqS2yiC++khpSay+pcoDubw3F84OtJppeD+fF/vW8GL3EzQR5OkRZObjQQIr
         77nS8kkOwEOIDXEbJFQsxTlVy4kk8oHGUA9xofxjf9BjvSx+4wE9SJtusI0EzUDsv1wJ
         TwGYrPGXyy97OMLiK5WBj2nOjKEy6Rave7sOLsW7Q5fNwKXM4N4S0pNd7RbQ5iHCfquz
         NpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000520; x=1790605320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qptzRTLzEX4ORnvKTYYJwd+9jdXwoH4m16aZtajA1I=;
        b=Y1f0pu9h5dd9B9L96Vkmx+aGSlq5eqKDHEeOxstnkPtnz8/Te4mDz4iRkV0JzhiAw/
         HyEUBNabJ4+bQjsNa4OyuQUsldSmqUWTTyHUAdg7Fs6c3wDFW3oQSOeDArw+KeJWfgeM
         HwLK1fHKJg6XpEFzIiErBHR8tM9Z00GxecxscXVHE8Y4a2fbx8RsinfQ8QFU2KJ2hd5S
         nOYEj4wBI9wVF6oXUN6thpcSvwb0HN9nxWk8ahYDe7Bdd9rxyno8sUUwx3mGTxu8j0Rx
         zxAzqtOcfsqg7Nh3k+HiEhwdBv+pxRMH8i+Dex/VT5o9HVzTdMd2VU5jRBhJUrjkAVoV
         RU0A==
X-Forwarded-Encrypted: i=1; AKwUvByfBm2JjulzQ8cEMApFVXsE2LVDBMHd7yp28fWYdAG8yg0AfNbxXwmBXqRo7jU8h0rLRhYkLgtdLZFEUH8=@vger.kernel.org
X-Gm-Message-State: AFuF++mJb2cMIoxZVhvoOkXPuteh1MM77I9Iz/Fm9jCMkoh+NQuso/nK
	vt5KMTJPRI5YecKG2tk4v35zw+pNojcXuRAZDD7iL8Who5RZZo9UfV0K
X-Gm-Gg: AYBFou3Ra5N04Z5rFqL3Va2DuNbKe6CvRvO3w+r0pGog156cIQXD+nATghjOdcNc8P/
	kMGibb7FQpDGDqTc3pgTBMkBM1vurxzQIr6bsCMNyBpAb39+rAHqN8PWOPYykmjW8hzsZ6i7tgN
	qAfcsR1EvePmXCTYKPJYlr3oHkhRcFgHfAg0SiYH08a+L+vLPlxZPhEVuSvADq3yLKnjBdq3J9s
	/uPKeAfqpUHOV6CFHitcDFo5qQhe6ZL9xz84FTJmdgUNu6DVZHqEGoFRANqet5cl6QcPlLrX0Xw
	nVKcA5DoWpquffWuz+ByyiJ9FsTiWe2RJz1PmjNkEcUQJr176jQJcR8Cnsv/05gbo8tmJ9wY4+K
	ERGFawLwMsxw6j68uNfc2zehDHLpopIYhzPAIh78UgKwvpM0cz2qAfRf3ErCZlp/67CfEs/Caan
	0XHlWhXi375vV9/aikC3NL7shnDxFix1407PMybGf2XfeqA0SydYyLPz3fz/fnl+LH
X-Received: by 2002:a17:903:13d0:b0:2dd:c100:80bd with SMTP id d9443c01a7336-2ddc10081cdmr113240275ad.56.1790000519755;
        Mon, 21 Sep 2026 07:21:59 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dbd5sm35130485ad.39.2026.09.21.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:21:58 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Koichiro Den <den@valinux.co.jp>,
	Yuho Choi <dbgh9129@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] PCI: keystone: fix endpoint teardown on remove
Date: Mon, 21 Sep 2026 22:21:47 +0800
Message-ID: <20260921142147.435953-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ks_pcie_probe() initializes the DesignWare PCIe endpoint with
dw_pcie_ep_init() and notifies the endpoint framework after the
endpoint registers have been initialized. However, the remove path
does not perform the corresponding endpoint teardown.

This leaves the EPC initialization state and resources allocated by
the DesignWare endpoint core active after the driver is removed.

Make dw_pcie_ep_deinit() notify the endpoint framework when endpoint
initialization has completed, so controller drivers do not need to
duplicate the notification before endpoint teardown. Keep the
notification conditional since dw_pcie_ep_deinit() is also used on
error paths before pci_epc_init_notify() has been called.

Remove the now redundant explicit notification from the STM32 endpoint
driver.

Cache the controller mode in struct keystone_pcie and use it during
removal to deinitialize the endpoint before runtime PM and the PHYs are
disabled.

Fixes: 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x Platforms")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Cache the PCIe mode in struct keystone_pcie instead of looking up the
    match data again during removal.
  - Move pci_epc_deinit_notify() into dw_pcie_ep_deinit() to avoid
    duplicating the notification in controller drivers.
  - Remove the now redundant explicit deinit notification from the STM32
    endpoint driver.

 drivers/pci/controller/dwc/pci-keystone.c       | 6 ++++++
 drivers/pci/controller/dwc/pcie-designware-ep.c | 3 +++
 drivers/pci/controller/dwc/pcie-stm32-ep.c      | 1 -
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 602516239a57..59f7b2e152a2 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -121,6 +121,7 @@ struct ks_pcie_of_data {
 
 struct keystone_pcie {
 	struct dw_pcie		*pci;
+	enum dw_pcie_device_mode mode;
 	/* PCI Device ID */
 	u32			device_id;
 	int			intx_host_irqs[PCI_NUM_INTX];
@@ -1226,6 +1227,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
 
 	ks_pcie->np = np;
 	ks_pcie->pci = pci;
+	ks_pcie->mode = mode;
 	ks_pcie->link = link;
 	ks_pcie->num_lanes = num_lanes;
 	ks_pcie->phy = phy;
@@ -1349,9 +1351,13 @@ static void ks_pcie_remove(struct platform_device *pdev)
 {
 	struct keystone_pcie *ks_pcie = platform_get_drvdata(pdev);
 	struct device_link **link = ks_pcie->link;
+	struct dw_pcie *pci = ks_pcie->pci;
 	int num_lanes = ks_pcie->num_lanes;
 	struct device *dev = &pdev->dev;
 
+	if (ks_pcie->mode == DW_PCIE_EP_TYPE)
+		dw_pcie_ep_deinit(&pci->ep);
+
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 	ks_pcie_disable_phy(ks_pcie);
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index de8ee3db4360..b785e098f759 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1188,6 +1188,9 @@ void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
 
+	if (epc->init_complete)
+		pci_epc_deinit_notify(epc);
+
 	dw_pcie_ep_cleanup(ep);
 
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index a7988dff1045..1cb31bd76da5 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -304,7 +304,6 @@ static void stm32_pcie_remove(struct platform_device *pdev)
 
 	dw_pcie_stop_link(pci);
 
-	pci_epc_deinit_notify(ep->epc);
 	dw_pcie_ep_deinit(ep);
 
 	stm32_pcie_disable_resources(stm32_pcie);
-- 
2.43.0

