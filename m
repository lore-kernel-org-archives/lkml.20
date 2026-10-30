Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381091;
	b=mMgzwoZjhMbwOu9sP3K2Y9C2ewN6a8e93MA8V1P8mx0mXKJIsIO2yE+czKIRa/II3ayQ
	 BjF0/s4rg+ycsSjRoQowftp7mB+YwloTafNS2XtyCvRJ17BU1n9A6v909COpukwGnU4Mm
	 +5WTyg5CC3KvKdZeIwrs1oNwqDsQlUelq6c85XOHz8iwlnU64GVRG6Wt0PsfSoUn0TqJp
	 6RiWPHAp5jWgsZgTIUM4KNzavlrQaj9GuPR/jKP9Hk5jZ4kIYdFZcHGQvoYzBNlvJi6BA
	 l9NjizEN7gSpMAaDlcnJrS1mZ4RSLsr9CfC2qzMrZTedRysXoeDkNARmyAFDk9lHkIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hcKqjCTq0DJH38P6NIRF0JVakJV4MgJlFw7OcfaJQp0=;
	b=17Dw43BJlvudy4Z3l+SJLOS6H4u4Fz8r/hzEmYQ0ts4xwlbuDZ/S1fMc1DfOzbU9z+fH
	 Z1EDBblpPfCbUCL2TGaEUJh1+e/79g17zaYslK75kfeK0ZpW7ikhDX9v/xkGuRAxrlBaY
	 88wMJSuol571bjFuL7OhQVMGmhE0USlZVdSPpL8hXh5FJyk1Q4ZanWSLgGXWHNgiXPSlU
	 JKG/OqoU5cceITvbow5G33jsiSTF96rdKIfOS0zPjEdRicCWssx2p1WsCMPGCHyavyUD5
	 ShdUIhb90hMxrsJsZLBq0ybnQM6dQxmmcBe0Fz6K9p/M6sO7eP/jsbF8XAeSqKnSCEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7VZ5hUe;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548F0606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 548F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7VZ5hUe
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so1444552c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381090; x=1793985890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcKqjCTq0DJH38P6NIRF0JVakJV4MgJlFw7OcfaJQp0=;
        b=L7VZ5hUeHT/COIuMC1fXHEZVV2cfpe3m+2Q+eR5JmKHaltAe4tdJZGUCfAlApu1Sg6
         t+qNw80aX6Vh7xJ3Z11DvRyovT/uws97TIVyDpEwHVjK/9lrtmDPG5hrtWWxlExcbijG
         5wqRvuTzLlMODE/Tu0HmwRbvK/jwhbVieCypRfswSR2D1nMJzYiewCsa1KGKua7D3xzO
         +XsaO4lQR7e1Rm+RxiPoTbhcmt93Y3lpLsztEYuAe6nObV9LM9nZMc/68uI3qWF4D9vh
         yrCcGb8p/ea5Bt5BD2LKsVH7YD7OC4Td/2NsZHdD26mjcT+mMc4PYhRnzdyjYc5KUVnX
         cVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381090; x=1793985890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcKqjCTq0DJH38P6NIRF0JVakJV4MgJlFw7OcfaJQp0=;
        b=bSePw2T4pCPkiSxMlwPeeYi9wV893N5mW7YxArtdI87bqWyaB2mI5mGBbO0S3OHf4B
         2WKE0NjMMdiCe14un59sHq3DPiJS9nxRcqa/eUNZ92lO8xxXzJ1/l4+6vGfVNqabNLmO
         mIt5CeDhlXBjNV5Al1ur1QynmzUHXZG5vkfSZqQLyBOnEE1ovBz2A6C0i5XX1ILxbUOJ
         Tip7biNq5zUD2qSQGtZMamLfcX/NH/bfcFIjsC/DudgRCK1zP9yo7XOSkoO1rkCievAG
         OcbXmndjY8AEqCzWsI3y4GxatoUXpI6x8HE/bDMaJ08WwR7ZO+GNdslcMWYeQNVl2w2W
         I5ag==
X-Forwarded-Encrypted: i=1; AKwUvBxFihXaKksW2Nr7O4PWsoIIiFSSCEKdQtmKe+BH65CcBfHb+R5/rMjkeRisfMU/r7aKRCSKp2F4MPmfoXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYILXgfkvBiITLCvWlUvo/DZWBUeYbk+4Mi8hbQQ3NCdGdpKoqG8
	oS4QRcomUtsWbJrey1Nvl2J4u8+b/QkCuT/adaXvEVqzuWB35RDIkP3x
X-Gm-Gg: AYBFou2cvxXqxodV/E50QRK95hp4c1dB7JbsD3s/7pvjRW97Vph4OtJ58a9njjEoqs+
	A9P41MEI7xlyDoUgWlx9rVeTWmg6dDdG/ccjBa8orJw+OZppADdkVGCy0uP+GtXkMTWua/P0JyL
	pMqFNXMyz57Tqo2Im9Yya6cFonAAYXR+N8mjpMPbxazWi33iiNNdf6Dr1emTj5TrPGfGKq/iQYX
	m/3hhy2AC8yeMqnq2SooNa8ctReudykb2tVY0hnUJQLSEuF5kXwB3AmWVCT5jRF4uw7yuVxzObE
	GuoQPGJJlnymtFoiJXFbelDZtKxeFJRATORXDNb83sIwEfsASdCvBobKlevLmvzjTRV+6kGSVOc
	BGxFDdWwWzo/8czAfc7Wu4h8JkqqNpahKupNWqCJXPaudGKrJw/oa32ZtQKnKGbQj8ltyCaAUYY
	CedvgXzgtpBYDQsn7vcKoCuYMOVS8P1PRwx6bt65gN+YDT2L4AteGf0dKHK3DbRc1d/FOq6Ghi2
	pHfZCbOdSpqq+C/1lq5eBRBkqQiJcKzDPI5XFLgu90YUBoQLsRhtLiGc8oiLyE2DcpzYPA/Q35c
	l3xo6TpRfT2ruEuXZoYUpJenyYhnNDZPGD+gJVycdOyTsTGnhg==
X-Received: by 2002:a05:701b:4502:10b0:18d:96e8:b913 with SMTP id a92af1059eb24-1ac5f64afcbmr3801453c88.47.1793381090306;
        Fri, 30 Oct 2026 10:24:50 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm8709248eec.6.2026.10.30.10.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:24:49 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: alim.akhtar@samsung.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	krzk@kernel.org,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org
Subject: [PATCH v5] PCI: exynos: Handle PCIe PHY initialization errors
Date: Fri, 30 Oct 2026 17:23:50 +0000
Message-ID: <20261030172350.2624-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
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

Check the return values of "phy_init()" and "phy_power_on()" to
avoid continuing PCIe host initialization when PHY setup fails.

Track the PHY initialization and power state to ensure cleanup is
performed only when appropriate, avoiding double calls to
"phy_exit()" on probe failure.

Also check the return value of "exynos_pcie_host_init()" during
resume and abort the resume sequence if PHY initialization fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v5:
 - Avoid PM core state desynchronization in exynos_pcie_suspend_noirq()
 by logging teardown errors and returning 0 instead of aborting suspend
 on teardown failure
v4:
 - Fix invalid return in void exynos_pcie_remove() and ensure regulator cleanup
 - Add core reset deassertion on error in exynos_pcie_suspend_noirq()
 - Prevent regulator leaks in exynos_pcie_resume_noirq() error recovery path
v3:
 - Address review feedback on PHY and regulator state tracking
 - Avoid powering down the controller when link detection fails
v2:
 - Track PHY initialization and power state to prevent duplicate cleanup
 - Handle host initialization failures during resume

 drivers/pci/controller/dwc/pci-exynos.c | 111 +++++++++++++++++++++---
 1 file changed, 100 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..d82bdfea1f17 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -55,8 +56,34 @@ struct exynos_pcie {
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
+	bool phy_initialized;
+	bool phy_powered;
+	bool supplies_enabled;
 };
 
+static int exynos_pcie_phy_exit(struct exynos_pcie *ep)
+{
+	int ret;
+
+	if (ep->phy_powered) {
+		ret = phy_power_off(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		ret = phy_exit(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_initialized = false;
+	}
+
+	return 0;
+}
+
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
 {
 	writel(val, base + reg);
@@ -225,13 +252,23 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	int ret;
 
 	pp->bridge->ops = &exynos_pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
-	phy_init(ep->phy);
-	phy_power_on(ep->phy);
+	ret = phy_init(ep->phy);
+	if (ret)
+		return ret;
+
+	ep->phy_initialized = true;
+
+	ret = phy_power_on(ep->phy);
+	if (ret)
+		return ret;
+
+	ep->phy_powered = true;
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
@@ -314,6 +351,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
 	platform_set_drvdata(pdev, ep);
 
 	ret = exynos_add_pcie_port(ep, pdev);
@@ -323,8 +361,19 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 fail_probe:
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	if (exynos_pcie_phy_exit(ep))
+		dev_err(&pdev->dev, "failed to exit PCIe PHY\n");
+
+	if (ep->supplies_enabled) {
+		int err;
+
+		err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (err)
+			dev_err(&pdev->dev, "failed to disable regulators: %d\n", err);
+		else
+			ep->supplies_enabled = false;
+
+	}
 
 	return ret;
 }
@@ -332,22 +381,42 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 static void exynos_pcie_remove(struct platform_device *pdev)
 {
 	struct exynos_pcie *ep = platform_get_drvdata(pdev);
+	int ret;
 
 	dw_pcie_host_deinit(&ep->pci.pp);
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+
+	ret = exynos_pcie_phy_exit(ep);
+	if (ret)
+		dev_err(&pdev->dev, "failed to exit PCIe PHY: %d\n", ret);
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			dev_err(&pdev->dev, "failed to disable regulators: %d\n", ret);
+		else
+			ep->supplies_enabled = false;
+	}
 }
 
 static int exynos_pcie_suspend_noirq(struct device *dev)
 {
 	struct exynos_pcie *ep = dev_get_drvdata(dev);
+	int ret;
 
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+
+	ret = exynos_pcie_phy_exit(ep);
+	if (ret)
+		dev_err(dev, "failed to exit PCIe PHY during suspend: %d\n", ret);
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			dev_err(dev, "failed to disable regulators during suspend: %d\n", ret);
+		else
+			ep->supplies_enabled = false;
+	}
 
 	return 0;
 }
@@ -358,13 +427,33 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 	struct dw_pcie *pci = &ep->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
+	int err;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
+
 	/* exynos_pcie_host_init controls ep->phy */
-	exynos_pcie_host_init(pp);
+	ret = exynos_pcie_host_init(pp);
+	if (ret) {
+		err = exynos_pcie_phy_exit(ep);
+		if (err)
+			dev_err(dev, "failed to exit PCIe PHY during resume error: %d\n", err);
+
+		if (ep->supplies_enabled) {
+			err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+			if (err)
+				dev_err(dev, "failed to disable regulators: %d\n", err);
+			else
+				ep->supplies_enabled = false;
+		}
+
+		return ret;
+
+	}
+
 	dw_pcie_setup_rc(pp);
 	exynos_pcie_start_link(pci);
 	return dw_pcie_wait_for_link(pci);
-- 
2.55.0

