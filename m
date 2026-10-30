Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373494;
	b=dQyDdcapuL9s8dnlqLSXhguxzywgnuRMgSyEUVR9PmZX/IsX93OkW3ya5xlYdgw7nJ6l
	 HOYdUgcIDRqOudBkYmbuXTfex4KuX/10Hig2W+76G2MmjAwjr9DQjgN//wOn9UxVZzho4
	 z4kI2STBkUfycEx4/EJCQjiorLgL2TQTOv/0IlK7Tb7CFWcdRMQQCob5oxVlishtZevyI
	 haTMv2f65dhYMgLrvMapS/kH3TIpcHQthT8DcFUqcAQ/EQ0KIHAC9/jj4cSZwZQTSkv+N
	 FTQljRAHENWsT5Ts4N/Ldv0e3/bESuxR4r11uMg9heVGiS0FAQwlFV/0NUk3LT6YNug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=;
	b=Ne887PXS4WGGx5pVnXdr9Bmq+GowCXfK3GJWzte8tFaNzle/NSLouY0etmgYg57nis+P
	 sxBFA4ibfzE5QIjNwjwKY7/Vg5tVMFwrHkrXKdrsCzapeGDxK2R2IOrgMJeMZz4eEhBaz
	 FCOlQ6EbXcep01lC4bD6EA6ZccnfJOxFW4CbxjyJhGfxBFADvsmDRQOfZYQz/Aqu/kl7k
	 +NZ1Fn4NMH4AgP62MyJXe8rXvKQQ6ZYwfban2DzZ7LQT3IYtj1qc+JCfI2AsVfw46hqN1
	 sKSxx1ZUCUKqjOo/vQPDIS/k0eVvevZXjz+tk0U9jxekbXFfxXP195blam/kClwIoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DemTJL0U;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE62606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE62606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DemTJL0U
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so743399c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373493; x=1793978293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=;
        b=DemTJL0UIFQ3Jev4fKVmWAptvN6wwU0fQLGaV6NLWjUFBgh8nlbnQq0VtsKvwBBQ72
         U+MKdlEaRB3clpUIhhyEDYAwosf443/2sgkdwk/pcKCk4wk9X70FNQBvwsev3aq54u8m
         3k6mAKo7zIcIBXAbxMXSNB3Bwjq8uj98IgjSWSkxImssaaexN3DeDQwzD0y3bckUmSB3
         /EjZOuyWctUZ1dwDcB1MDpQ4TUlnjO1ZpKIof3tUsEJN45oTV0GrSMkN1+tt6dKq59OT
         IdoEoEce014J55+SpqKFy1W85BfvOehWA0pPmJkrLO6zDdYyNjPs++8xbwlzlyv8hNvT
         d8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373493; x=1793978293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=;
        b=1bZSoPpeIF0NiQes/A/E6oNxt2ol7evMyXahYo1gdwq87rYYzQwiPQ9EwIcG3Kp8bZ
         7BFUoc6L4OGHea/v5fs2LdMYDws5C/m5/1epR8bERKScvOkHHJv3FT7oGUjjsSHta6V/
         K6CBLDbNMvuSyPD6vqej7o9JtTfRiAKsHsgrB2BjFzMEAoMHWzRBT6oeRqwPlaKNg73Y
         vzsLx4rlqpPbU8W6X9hwWFGcMok3bSnvBRviogAHfujEzot4OtKsEafn0x1ynYzmzxl8
         GBWuB8LkC28KEBtvxalJDX4qW8clFqt/SuLzr6FDYm/bd8bOlhFajY3omaFd84118ZYT
         pfng==
X-Forwarded-Encrypted: i=1; AKwUvByOxgp7oG+Jc4XrjU+9pL6X8VVZZF40x4EeN98tcI3Fi818N7GeBODCJBNxsXv0S99vyonDxrka3isVdUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDkm7Wb92To7lUNgSOdnvof3DpgP01XtTwOzmeTje1SqUvAo9V
	UVAV8JAONZdeuXGSEAMugappufkFLpuQzM7N0RSHK/MgUYJlH9YvPAQC
X-Gm-Gg: AYBFou0Nmmq8II3ejc3ch8Pz+1iWffy57znk0vg9vbSiJWL+ucP6WfovjVE9AaNaDf1
	mGHgWPn0ZWxwxmP2cgN81jb0JMawVQZA3N1W/ks1tXY9R2iN5hTNUfBuDEifstS9Sng16kGUr6P
	bS1T4cljFzwshlX44/Mr/11+ZGgfKg/yIHji6IqOllAV/9UEwWAxYbZCK2c2Kp4+VF3UW0fZk43
	VY8yHMVxH9N6gIS/8KVMcr6GqOc396ebWZLa5RHGy2guwbBzra/fBbwJD+tZpz4s3G7G7MomapY
	wmt8bncJiJ1h16qjAO6k4ijm5U1ZvDvNrkmoNlXSyit6/cKjK6zir3UZ63avk+Se14mGfMXXjuf
	QfegMAokjvG0dYfHgQMmy2yJLoXC/oBTHPp08X+Ng4JOeI1ltu3Glf3WUn/zQC882crJhYEi3B2
	pWZHGyj+noO2Za3ctveyCcnWcRu9cu4zJMlyIYg3GQRcoi1LaK0+Xovuoyrxwo+hIbAylW2ggM+
	/pYeLQFWw/vwqlsxtV3KPAcu3S9HbwScLqzBoX4CHT6EoYYrtAmTWsseBJ3zBj/fUC09P3zh8Ag
	Uos+Xp8xBXzr1oD7qJqEEwLRKB+Z93hC8v3WdSc6LJqe4WVDoUpkK52G0qftnUKD9AWHPVs=
X-Received: by 2002:a05:7022:ef07:b0:1a5:8f40:6cb4 with SMTP id a92af1059eb24-1ac5fb18dddmr4578115c88.34.1793373492682;
        Fri, 30 Oct 2026 08:18:12 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm7581645c88.14.2026.10.30.08.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:12 -0700 (PDT)
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
Subject: [PATCH v3] PCI: exynos: Handle PCIe PHY initialization errors
Date: Fri, 30 Oct 2026 15:17:01 +0000
Message-ID: <20261030151701.3100-1-sreekuttan2156239@gmail.com>
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
v3:
 - Address review feedback on PHY and regulator state tracking
 - Avoid powering down the controller when link detection fails

v2:
 - Track PHY initialization and power state to prevent duplicate cleanup
 - Handle host initialization failures during resume

 drivers/pci/controller/dwc/pci-exynos.c | 111 +++++++++++++++++++++---
 1 file changed, 100 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..d7504b0e5d96 100644
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
+		return ret;
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
+		return ret;
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			return ret;
+
+		ep->supplies_enabled = false;
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
+			return err;
+
+		if (ep->supplies_enabled) {
+			err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+			if (err)
+				return err;
+
+			ep->supplies_enabled = false;
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

