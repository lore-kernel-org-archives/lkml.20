Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440189;
	b=Awd4Ijt2e/LJXQ7N1lTwRIJ7bDodyr+b2AQenWJU7L7JmUzG6rWuvgPAAfvElOiT41Dx
	 vwZT4NCMhNmzFfwiRuFVIG2Uou0LJlsCPRosmkmY/3e8Vt5k3xjKbJGuVhOAvRSWr1DDv
	 0xXnFqpzKfNO2S/xTfJnlaqVeM6SkYJpEMdFb0fFbdtnMQe9OunNiv1xkA57RFXSFZksq
	 OoR4oHNF7GHkv0JZDvyFwWMOBz0BAA54xZh6N91gNCrF7PxLCGGuEVcl2M/gTNs7ZQ2xL
	 9Z1AI6fmmjZNRBuDhIZRya7a9RAwdDv9nHNB7aBByKbjhdSysvEoJtyRpUSY6TlD/yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YHFAYRGh5wjlOU/3KkfepJZ4w5BkAhXZY3CTz6dsIzI=;
	b=qvrVChwwZt1AAB4LR6BzgRycbNcFPfasvmwvXV43BoMtEKU7UKbIHWx8Q2AY2n3RdRc5
	 KqI4tEKMmORV1wc4+Qb7RP1XiDe2hK4qD0XrstCnqIsOTuDioS+vhLp/0AsYnBvY/zGKH
	 I9nMfkB+U/YxfXtYZcZfS9MCoyYA1aWe2qfdBSfvRe91ZTBv8UTN0VTQzYkkhZAbmIk+C
	 vujBxbQQCcGpcGTbyNszLovqgmQaaVkASqbb0wk22l4F/EKK+bt3i4VT/SRuIa6kvZDUO
	 +95rFR89j/0YrFWFnmlWGbcKtQQY2ay61toaMBQ7EfC7ZGufZ/611zL4uMmYqgrbtQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ulj48aW+;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BDF606A324
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BDF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ulj48aW+
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a1947498bso1439005eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440188; x=1794044988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHFAYRGh5wjlOU/3KkfepJZ4w5BkAhXZY3CTz6dsIzI=;
        b=Ulj48aW+sjqzOxGR0k1os05gbP71vGFgwcpZsRIPh0qeqyYI5g0Io0vKm3hFQgFSTG
         /jhsDXG6iQckdP9GAeWiTuf1/NOPbnd4+4PwcLNHSd6iV/4kkVarSpvC4GwKCmSffDle
         6K6J/l+beelnG2LjmFM7GpPqlZudEe3S/LBqiQboJLlAj+5Sl0hQIO5PGQg/CrmTKCEX
         /mfcrZOfZba+H/TLxTudhI8NWNif+HbnOZjjy/bMCbhevdiVkKywuEx5jrO3mGO5UzTR
         uSv3L0eT34f6tfeYCHjvf6ldjpk7T1rn98KaK5/kSb0N/TUu81UfIbMVh8QwIZj+HAbf
         5WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440188; x=1794044988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHFAYRGh5wjlOU/3KkfepJZ4w5BkAhXZY3CTz6dsIzI=;
        b=JcAoHQDFEmJ0iVPfz0OMePZDiVqitC0Kh97g4Cpgh9/UQeyUQlmXcwigF7PFCRD1v/
         Kzj7cEAOO+ceMmGiLMFrCKsopWKOwp/3Ob+bnLxckEolsNMd60y5AwN6iH3yYCIbz4cp
         ZK/k/G8ZYowUr6zpaAxi2HePQk1X7UJBcAeEaOWkdjfndlHgkPAWctL24zhLmVQrnYzp
         O9pHF3mE+UM4RMggMQpRmAJgbmBmdZv8Jtf1gxHGM5ARPYm/gfjIkSGOlYfGow2HZYSX
         KlLq5jr+z0+7i3E047zXmnfIzbYFOgT8MigMoFi9afZ2Y2CmC2R4gFNtSp2lalGmDPK9
         mLRg==
X-Forwarded-Encrypted: i=1; AKwUvBxNbAbKrHKwI52SI4j49DucDmy6RaI8RrpZEz7yJbJYtU9r3m7aalZWA4kk+1qm9pEzBp2x43L8JLPzbDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgDP6tCSFP/OMVyeYa6k2P0US+bbsqMcb3EFkjECRTIu+5R+7M
	hyY3/fSRBF/2ajQyO8af186Uh5shzrVtsNtLoj7mukjzg3uSIfRna7Z3
X-Gm-Gg: AYBFou1zo5QhEwUXtA0KgO+hUTTYSMw13zk9pLoe70ARgV9G+GghHqdxs07pk2JApIf
	Joz++nHOlv1J8lk94Q8J12aYsYWpRnnHw6S1KRQQOg8LT6lng/NCGiKF3I1TKQHLTBuWbxndP2X
	vohs5aSLJkLZGVH5KH5rE8HTbCJiz0+PC7q3c632RPxVX/2/cvu7F/cSXQBPFJxP2DPlaPHTOVF
	IrumSCvnmehdjKMylRfocOZUArzAz4+bbHnUiA8ds4rh41RmpV2nELv2176rLb4HIA4i/uHB9dO
	YHY8cM1WVdj0PnjnSWnmowuHS3xmbECUd8zMJB7jACMop1vP3U8t4TrLECrD0rZ5XrVhTFGipYM
	isfgUucYmE9dE+ub7iJRB9J6JrdPm5wFKwB65pCuOhISqMCORNYdiLELxlzqfhHS5z1BEiHdOBG
	QPexh3jaoLL43vfAwxzjR5zkIx/UDHdrVd0ScPbF3xeIGoN5KjBYBlDXJY7l3Sdzt0Ji+0oB9dd
	k9DaIz3MXEyvVVnTeOyMLZR9MhlvOMm2WI2b0+KjBpEolFgeWHHjwi+Zw2gEokF7uDgT5QALuBs
	axpaNQ3EkBz15EQqMDRZb6c58OHJK9OQ2T1DDNqDrdxoEGxD+1gOQT6KsErSyRXzB2yx6zA=
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr7023547eec.3.1793440187660;
        Sat, 31 Oct 2026 02:49:47 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm20975811eec.16.2026.10.31.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:49:47 -0700 (PDT)
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
Subject: [PATCH v9] PCI: exynos: Handle PCIe PHY initialization errors
Date: Sat, 31 Oct 2026 09:49:11 +0000
Message-ID: <20261031094911.3304-1-sreekuttan2156239@gmail.com>
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

Check the return values of phy_init() and phy_power_on() to avoid
continuing PCIe host initialization when PHY setup fails.

Track PHY initialization, PHY power, and regulator enable state
across probe, remove, suspend, and resume to ensure cleanup is
performed only when appropriate and to prevent unbalanced
reference counts.

Assert core reset on probe failure after PHY initialization has
been reached, and handle cleanup errors during teardown and
suspend.

Also check the return value of exynos_pcie_host_init() during
resume and abort the resume sequence if PHY initialization fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v9:
 - Fix regulator state tracking in exynos_pcie_suspend_noirq() by updating 
   ep->supplies_enabled only when regulator_bulk_disable() succeeds, preventing 
   reference count leaks on failure.
v8:
 - Fix state desynchronization in exynos_pcie_phy_exit() by returning
   early if phy_power_off() fails, preventing calls to phy_exit() on a
   still-powered PHY
 - Prevent PM core desynchronization and orphaned controller states
   during suspend-abort sequences in exynos_pcie_suspend_noirq() by
   logging teardown errors and returning 0 instead of aborting system
   suspend
v7:
 - Guard PHY initialization and power-on against duplicate calls
 - Guard regulator enable against duplicate calls during resume
 - Preserve PHY and regulator state when cleanup operations fail
 - Update commit message to describe regulator tracking and core
  reset handling
v6:
 - Prevent state/reference count desynchronization in exynos_pcie_phy_exit()
   by ensuring both phy_power_off() and phy_exit() attempt cleanup even if one
 fails
 - Assert core reset on post-init probe failures in fail_probe if PHY/host
   initialization was reached
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

 drivers/pci/controller/dwc/pci-exynos.c | 126 +++++++++++++++++++++---
 1 file changed, 112 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..857814cd107e 100644
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
@@ -225,13 +252,27 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	int ret;
 
 	pp->bridge->ops = &exynos_pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
-	phy_init(ep->phy);
-	phy_power_on(ep->phy);
+	if (!ep->phy_initialized) {
+		ret = phy_init(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_initialized = true;
+	}
+
+	if (!ep->phy_powered) {
+		ret = phy_power_on(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_powered = true;
+	}
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
@@ -314,6 +355,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
 	platform_set_drvdata(pdev, ep);
 
 	ret = exynos_add_pcie_port(ep, pdev);
@@ -323,8 +365,22 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 fail_probe:
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	if (ep->phy_initialized || ep->phy_powered)
+		exynos_pcie_assert_core_reset(ep);
+
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
@@ -332,22 +388,42 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
@@ -358,13 +434,35 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 	struct dw_pcie *pci = &ep->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
+	int err;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
-	if (ret)
-		return ret;
+	if (!ep->supplies_enabled) {
+		ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			return ret;
+
+		ep->supplies_enabled = true;
+	}
 
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

