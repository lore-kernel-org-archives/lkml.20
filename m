Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296540;
	b=5CDkpeLYuPmuP4V5InEYpxrNJDrd6HEmG/9pwep1wBxSYsyAVCkR0lXr1QZx2U6gflaY
	 TlMwnpFoiPXcBPnhGzDqSvOXFeObqIMCac42sWwYFkF6+95uG8KehbhqrB5yFy9aFA4wW
	 8a2hwBr/84urs3dYYsGAaCNxbqUEi0tGvJIKi6Hbpwgdds/FjqhtrIkZdJaqQY/EojSZN
	 +H2DHXhV+Sadiv+VIOs9B0Ohqo/WrT3OtqZ+vrTLwbS1txtklCPWWn7Auvp70EXPhOrlV
	 P6Ryrdp+g36/HoFoAEBQFmHXUHZUIQ630UWrYxnqmEVK7UQXZ5IpbGTjWGC+km86AXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8cM/p2K3K2tPOM9+U7FKmROE+HQamkMu7RKKZe0hh5U=;
	b=LHutrESMOfrP3z3SXiwpdJvKXb2Zg+63vs5x98O1r/w+B9HSGMVuZkvWuA6EIVZfymE1
	 nHfRSFP0/V2NVHKewhJGeumQxp1lC65Ed4b6WckTsfYYlxYXL+HSx1rdBrRu36XEGbvKc
	 +9e3a9aQ5lqYSemL6KOOlhWssO3ldtk2hlq4ZMv9vLRtsQ6SAa9NykHpZDiGElDRDqfy0
	 nyjLNfXHV9ynb0fyiF/xLw7kNlJLQ/d2+FOlhhqRA4JKqyYus5X/hjg/tOq7c2NEuRrFv
	 lbx6lfLIgv2x516MZeJgXmjsgraVOJlaJXA9imczo/ZW3fe8hoysQStNcyfYdea3x/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ovix1tNS;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D812B606A330
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D812B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ovix1tNS
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-19305bcb72cso2333163c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793296539; x=1793901339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cM/p2K3K2tPOM9+U7FKmROE+HQamkMu7RKKZe0hh5U=;
        b=Ovix1tNSn8hCX5YIXLiItWNSEnanw+QFnNUMhzt6oz/zDXhi7DkFfa66BybD02277n
         ihwh+m81VvLCFpe3HUjbUzE5W6yKuei5r4+xdQvGguQwjkI4S9ukTJPv6e/ufepbyB47
         dCMDEjEX8jAsgDfj0s71uO4E/Dg5UVS9pHxm9I00WmeJSwA1fanYvJZgNX8Ak9iV7iEi
         xr0Bpd3TK/ZcNVC4L+UvPQ0Oj2NPmOzA+CnCHEtOxxRrvmmc76urIMFVUcX+hN8Kodsv
         YE4763Xc0vyNT5FqP26WW7KhAAPZnIEAcVYpGRnvVxZc8gsGUqXUGYRGh81NR4fJwWJr
         I9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296539; x=1793901339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cM/p2K3K2tPOM9+U7FKmROE+HQamkMu7RKKZe0hh5U=;
        b=YK7FY9HOMexhReFrf5mC0/WQXA1+qRE5TFDl0LcfrgUMUQ7kxbOLa5YQiG8Mep54Ww
         vjAOZRLbYIO8qwbrroprsRv4QTsazyRd5NTsub6ySDdSCCo/RE9LIS7IpsHwYQ4U5i9j
         hHYyQDwLSoIFcpn//rN1CrQsk4tQiW6B7AF0VJgN/GIQQ44aWuSTRqTpHvhFy3n/EpqI
         us3ZCZW578gaDI1xyFgX2dZhOidI9dICZDBahXyomZok2++qfN1TCFZZ5hq57Ra/Da6j
         3t9Ux0OuJ494n8fegPvgscLdRN+9kCXQQo34iRCM5C8CcavcNjMAcs5LtE0naMdzWLGu
         oNlw==
X-Forwarded-Encrypted: i=1; AKwUvBxydQhHf1CIR9pHfUBpjR11a8fNdI04lSzX4sitCGGBeFxPd8cwWe2fCKIMxDRXQigUXEqZWd71YwCDGo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl5b41Mey2eGaN1FmhndFabch3Ly/1CpkkxnZCYPbGhh1jImDe
	0OQFTH30DuahzxQK2t9aQTpk1hfA+mhtel2Ccm7+k6544aqHVpIwJeUc
X-Gm-Gg: AYBFou3uwJT4Shw1bFnn6cDagMX8VnoCYn+8OacqchpuqVvBWzlOCgGSpyzgTAWg2DI
	xDr3sCOTFnXTNhZJMyhvBxxh2VIFEe6aaRu5M6/ZBsyezQ8oylgHK/I6U1E1foJOjb6RNWifhh4
	wk19CwFS4IIP+u1EdVxJrudjLIqamzJWObWi0YjapexbVi2t9Gd3JRXBp67mCmewhyUKCJQovL+
	1VPYzpxLhDacHeeNTTgVtnIJ2Q0SsWtxNvw+GbJbyFiR9i3ZPBzX37lJ+JbFPSOMnV7w4OHiLSe
	iXd05XQZoG60hcXZZF4ReRW5wkwgaUQfF9oF+OIS53BrYPWfxvPQ/v6m77pP7R5dUz4glHqEtgH
	FK910c5+TOX3e/wi4RaqhIb0Yn4WE9EdTEqgmv32bjTe4M41Wc/ejk59urm9hc8gKVAetaMSJsc
	kzC7uQ4wiq3qyD5m/9LAn0OVMDiIoYaNb9Yc5Xuh6ndAbHUh3wblf/2OQ4GNokUwwA+WIbfiaKq
	tE6qJ4A7urvVsqhBJl2NF12z1StqjFJ36gD5m+gTe+XQU2++E7RitkdfMzB4zmBCStpbgHdnVfk
	TPOr72HYiKPyoRMYFjmcpyxenABXeErqu1SHGQs+hZXNneBUPBc=
X-Received: by 2002:a05:7022:b903:b0:199:4f68:7710 with SMTP id a92af1059eb24-1a6c86c607bmr7367119c88.2.1793296538669;
        Thu, 29 Oct 2026 10:55:38 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm392417c88.0.2026.10.29.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:55:38 -0700 (PDT)
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
Subject: [PATCH v2] PCI: exynos: Handle PCIe PHY initialization errors
Date: Thu, 29 Oct 2026 17:54:39 +0000
Message-ID: <20261029175439.8490-1-sreekuttan2156239@gmail.com>
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
resume and abort the resume sequence if initialization fails,
disabling the regulators before returning the error.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
- Track PHY initialization and power state to prevent duplicate cleanup.
- Handle host initialization failures during resume.

 drivers/pci/controller/dwc/pci-exynos.c | 77 ++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..f6b87c26ab36 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -55,6 +55,8 @@ struct exynos_pcie {
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
+	bool phy_initialized;
+	bool phy_powered;
 };
 
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
@@ -225,13 +227,23 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
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
@@ -323,7 +335,16 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 fail_probe:
-	phy_exit(ep->phy);
+	if (ep->phy_powered) {
+		phy_power_off(ep->phy);
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		phy_exit(ep->phy);
+		ep->phy_initialized = false;
+	}
+
 	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
 
 	return ret;
@@ -335,8 +356,17 @@ static void exynos_pcie_remove(struct platform_device *pdev)
 
 	dw_pcie_host_deinit(&ep->pci.pp);
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
+
+	if (ep->phy_powered) {
+		phy_power_off(ep->phy);
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		phy_exit(ep->phy);
+		ep->phy_initialized = false;
+	}
+
 	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
 }
 
@@ -345,8 +375,17 @@ static int exynos_pcie_suspend_noirq(struct device *dev)
 	struct exynos_pcie *ep = dev_get_drvdata(dev);
 
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
+
+	if (ep->phy_powered) {
+		phy_power_off(ep->phy);
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		phy_exit(ep->phy);
+		ep->phy_initialized = false;
+	}
+
 	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
 
 	return 0;
@@ -364,10 +403,30 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 		return ret;
 
 	/* exynos_pcie_host_init controls ep->phy */
-	exynos_pcie_host_init(pp);
+	ret = exynos_pcie_host_init(pp);
+	if (ret)
+		goto err_cleanup;
+
 	dw_pcie_setup_rc(pp);
 	exynos_pcie_start_link(pci);
-	return dw_pcie_wait_for_link(pci);
+	ret = dw_pcie_wait_for_link(pci);
+	if (ret)
+		goto err_cleanup;
+
+	return 0;
+
+err_cleanup:
+	if (ep->phy_powered) {
+		phy_power_off(ep->phy);
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		phy_exit(ep->phy);
+		ep->phy_initialized = false;
+	}
+	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	return ret;
 }
 
 static const struct dev_pm_ops exynos_pcie_pm_ops = {
-- 
2.55.0

