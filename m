Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378253;
	b=vgvnXZNINUevvzspli8t2aET5PMudjTDz9HoBYQDyv16dOYlfIMsDXj8Rgwb0McHC/1V
	 580U7cSXip2Q4cPMKgWeXAO2r33YAQOGqXM1sGgEOKSnTIYFW9KqG+4dK+ouWZ3LdBPAP
	 SQctsJ5O1zTios+iRsKkgRgmgmAHCmZCZNgZxHvxGxBZZbadAfEe9Rd8gZUVT80X7lH1v
	 jBJANjlkjqSrw0Gw7x9XBg7Go1uCaVHiJti1Aa8MbG0p8G/myj1tsLrRr7uORsNTMVQEq
	 VdrCNwIZQQoK6ee6AUnW8MUOf9/NC7LpoVzQ+NLUAMQLFwVXGVvvTzd+/DZoNDHN5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=;
	b=ta6T2pZWkzk/QnLVM7j3Ew2dAD/D8OcYjPZoSRXf5Y5s7rUDq0E9bjBtG2v8640OVOuF
	 xhFtsQeLIEhWRPKRhRu5SKELJopxviB4r5wftMtPqeFOPN7U+Y45nwir2BtfCqw397WXD
	 OKnLMIAlIc74+W2wqQ8u5EyA0ke4mYpTxzgX/f/oa280LdLik4tnC6efWtWNbVv2usEYl
	 Vr097dwIiBUEc5AERfIR58Uo9NShE15V08KTaL7MGqtrXHVAZ9qvmOZzn/zjy6Qm/3D5h
	 7bAfJ75pb21s22T281DKMJD8OcD1vAwawAHejUFqM6/h1auoWZNFeIM2MaK3LdSIlHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDTIGh6t;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEEB606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DEEB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDTIGh6t
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so1478646eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378253; x=1793983053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=;
        b=EDTIGh6t3kgeWK6ADWnUzoLCmhtmB9/PL04H+WPsDvVHeo1HknTrMTUYkoAW1mQTQT
         p698ah5LqbJiQY1Rc8Q22G5bo5pWUaPrBs+eYXQ4Xr5MtRfzeDQqJ5+oR940dKjS1OWk
         0iIfu1Pau7DmBW/IJVoADYLGOdzwUZOd3k2fI8P5TPiBf7xHsbrC4ag0CqphbLB8FUZQ
         lgzuDLUttlJkp2dzun+dgTa7sbgoBnuyL+DTGkfjs0eSW4bpF6Tnj8Em97MHXxAe7LK2
         QXMqCJem/1yEYcL5Xj5QQdGSQLj/He0fZWjp9R8U2Q2gmSb44qDhsPR+VN3WnpQo8GBy
         QBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378253; x=1793983053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=;
        b=ur/8R+KICrpVZ2eIyddEEqOnYRK/HmaCKXLl31HxEBacy+3DS3X2lD5nCs4F17EI3g
         1scJqXacakzi8c00QPoZ5lqNHpeMFc5zx/bFe97NuR6LHpn1E1pXXRocXxCTeFfCAzeM
         zE6btlBpuUuDyJxM5jzu4GSooBLp0vjX2Ehuf6VPCqZCFA48zbXJyeLPlfpe0MmW6y47
         FVXPDHWZGw42b1zgSRZkD39Eq9WDmbjG9HTLtJSfu0Jf+NiUT9SHufjp1dEagv4U43y7
         euhZheurEhL+qtENOH8wYHwTT3DOD+5xG+qlAV9AJMkdyqwBUT/lTL7+QvjvAC/42fcw
         SPEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4rKOv6/OcmFOpOpzTeLsX+1uzb8jtssAJ4yJegHsZN8zfQWielrAHnMOQMT+TdF/3OB9mTECLu48G8Lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFdGGUfoAbBZfzW813AS5w7DwuBdWQnRmk6y+2Dy90k4xGsXOV
	BtdFIGuNKNIM29gEymevkhhxOh+X/GYmavwk4xwt0IWitkJmEywvvHro
X-Gm-Gg: AYBFou1FCyi6T3JDrDgFtXlBZGM+hWApN0QYB81PZ0aOMvQs8nJTnGr+jfi6F39RhBt
	pTVLuETHQLXc7d/16ScrYeWaHbM7jhZZJHdYKaykeQ8+XhnQe/ihAZCKz21rkiY5oBIIv9AEZPj
	wiABcYEi9NJlA9NR6bIv0bzwSDBdzDYOBA+25GMTd121R43SmVduCrps8QIUrDLa0a9SAvpyCGX
	idv02T+O0svBMu1LzcwFCKFZmAgAwcuL2tM4hErYmq8G7nP4OfJq7HVtZUZ0XZKP1B4MLaRjo07
	fpg5wJV/vMv+C6DTYuRJFh4ACoMSY4xfcADUqUr1bsHHmlMU5lx/IlZd9jI2rrDV7Qvrl/ON8eK
	9mMUFjzKD6TaPe/sPRwrlwx/rMg5ovWXBUW8gPlKPPbaTdah4yZ/3hmWkCIAmMxO2Qru95iqhIR
	2CXkEwTRcC4F2yAh86goRQ/+Ey0zyL+ikkZujlvoEBIIcmEQ9yqdFOLG8ioR3d/QeG7LHDxC1mW
	r+9xyG75RfCcmHKZk/4E8JsWk4F6vus3EwGIf7ns0wBO7wyJoEAprabj3tMUbUw14dknFo+p/Gh
	upG08+z7lMXiRGt/0LnZH8i8Sbt1zgHXqTKO9fSOucIaBdEZQw==
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr3906559eec.7.1793378252415;
        Fri, 30 Oct 2026 09:37:32 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8458708eec.18.2026.10.30.09.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:37:31 -0700 (PDT)
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
Subject: [PATCH v4] PCI: exynos: Handle PCIe PHY initialization errors
Date: Fri, 30 Oct 2026 16:36:54 +0000
Message-ID: <20261030163654.2733-1-sreekuttan2156239@gmail.com>
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

 drivers/pci/controller/dwc/pci-exynos.c | 115 +++++++++++++++++++++---
 1 file changed, 104 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..5b8d8f1ce8dc 100644
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
@@ -332,24 +381,48 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
+		goto err_deassert_reset;
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			goto err_deassert_reset;
+
+		ep->supplies_enabled = false;
+	}
 
 	return 0;
+
+err_deassert_reset:
+	exynos_pcie_deassert_core_reset(ep);
+	return ret;
 }
 
 static int exynos_pcie_resume_noirq(struct device *dev)
@@ -358,13 +431,33 @@ static int exynos_pcie_resume_noirq(struct device *dev)
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

