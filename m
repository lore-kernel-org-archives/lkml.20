Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D41930D41F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263010; cv=none; b=qznkByZwkvAospE8Sq8+hHlZCnd8muAMFGZl+YR3D0fG+oFwe4hMcTG/ULzoG+5AqJbLk7nT1jtzxM8wijJqN5Fq4aIwc+OpBh8Z6rUoPwa2KPyTLxHMeLAx7lEZ93gEmeDJrbUIwoyjeFADzgLr3WaXrVQ1bDiGdT4jqzATDeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263010; c=relaxed/simple;
	bh=1uJAt4wQPmIzBJv34V4aLu8zX0+/alOO1XYGdRyKYoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c3BbHGmBLcbcXvBVEcd1YV8EJC4643NnzmQNoGNzZOcLnEwRXB9ZZvGi2fXriUYtc3ZlwkeMDYAWSw6G927UA0mol0Za6ZqBcoR/rk7oKKP/lP6JzP3o75Fvi9fm9ChgHZWjqM032WIfy/jex0Ji6dPdS8a8pjE86QuD6C2goSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYw0qplu; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYw0qplu"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9106f4c3a4dso27439776d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789263008; x=1789867808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIz8W3XWQuQCmfLKcI01vhlNgiPsUi971VDJOXuNLRo=;
        b=KYw0qpluHBew0aOdOyFGn7DH31MfZUJ27Vd2PjQUpMzXccg5QOPrDU3O7QZ/MCy1kJ
         TNLed3zxUf5+HqmwwRPEvTPZIOtWZq9pPJplfmtRg3sqVdhUs5UcYv+1dBdRM5Bb48jP
         RrvdytzW6iSigZ0vUI04Gf6uL0sDDXcRZLXOoLB6yRhdApFmLhp9IwhCWvCeNiLUmc4V
         ZX8TbL5/Ici3KE7+Kbl3Bv0lyEZ8YH5IdznhOzZLGEAnEfUYNo7nLJIisXN2VuKZwO6/
         insIZJIrYetmMrqKGQxzlTaeGDeLVHx8jpK/vaAfgl2gZAgJFapMBmSNNdcRDDEjCQIt
         E7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789263008; x=1789867808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIz8W3XWQuQCmfLKcI01vhlNgiPsUi971VDJOXuNLRo=;
        b=CEJfe+S2xKYb2xkDgIyYRNDDQ5LGyfB0Jqxt1238W1OsrHmYcZZ3gx+d65wuddYsnc
         49UjrLYC5QU8wBNztRVmlLxV4JajvxSGj9+JUrKpXRmHtfuxDf3n+E8Kp1XeLzjnJcO+
         i8sjyxjXMfNmzpG2wtrjAHcu4p+4lHdoncLqIH2k1SZ7H9MHBwLa4l4d9wfsjvsbCw6X
         9q04NUbGkDMYOMJYkyvl06kV6pww7aID4lWVPlL145NvHo4MSCBJL6fEeNEW8OHpUqJP
         LzrqHqs7+EQumcOrdFsMxQEvJZXQbSOzstOOHHTJSohi1CkUC1Wqzvtpvp51B/s3WNe4
         YDIA==
X-Forwarded-Encrypted: i=1; AKwUvBzEJZAFsOB1fGdHRPdQzfno2+ZGJJMoG2H/ipqHr7gN+aAAIMGUd04BtLAgz/ZJjevqlIVGGiC8/9SuMWc=@vger.kernel.org
X-Gm-Message-State: AFuF++l0/RpS2unD679zDMS+5eeugGwAkh31d2p/RE5hhp4p0OKosCqg
	Rk/quqGaOKyhgVESszowcd+Xh4t/ojEYujt0MZFJTJJ7OUo3puSuPE0=
X-Gm-Gg: AYBFou1hSM9Q4oayXvQK0UL7BLcbdJQwv50eC73C4sV6xhRzGuZpBeEcIpqd0UfXBDv
	pSjGXcckBtSh9S/4MVE3mytpHEiskydLOmX1N81SQ5Fg72NLLSOw+SudDIBtab9+2OH5SPU6n1d
	o8vxxME8Hklv5pSRslNdq9D9vgfWMgMtc9jEwROvgyBrRb7akVPmEmLvi6Ye9qPeOWMFIup+Ewg
	LJP4FccpVOO0NzR8kqYgffrr2pb9yBdDpQLbqsRpFpqu7CKTdXY+cVd1zGks/cYJoA8owDk7j5Y
	oH7NtqBFJBuBBkVapmgvWQ8+RBs0rohl2BPofwMgnn5PNMl/1Bgwgrp4JU1a6yehwU5S6M7q5Z4
	1iuyoCFMIQV/X5ymUb4+L4jBVajYDs528g4VmpcY/wVEmeZ2BwzunOy0OTMfVutcI+DrPQu9jej
	NuDr456WdUYIsjk5MAXzB0czFTz1eESAVQtGJhZjelxU26CPfyywO4nu+2vBSMjlrT5Uy/tfb7y
	4Y2XCj1uaJok8Y1H0xPCs6NJCeBTIMJFqoajPInHk+pcYjwYQ3sDLBcMIJnpUzhNInDtnP4cG0d
	oAZUuiUeN9pexime/hB7qYCkFPX/Ucp4sw==
X-Received: by 2002:a05:6214:5d8d:b0:910:345c:b7e5 with SMTP id 6a1803df08f44-91212116f7fmr164517656d6.36.1789263007716;
        Sat, 12 Sep 2026 18:30:07 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49444bsm58549556d6.29.2026.09.12.18.30.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:30:06 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Justin Chen <justin.chen@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] phy: broadcom: brcm-usb: unwind clocks on probe failure
Date: Sat, 12 Sep 2026 21:29:56 -0400
Message-ID: <20260913012956.16443-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcm_usb_phy_dvr_init() enables the optional USB2 and USB3 clocks before
creating all PHYs and acquiring the remaining probe resources.  Several
later failures return without disabling clocks that were already enabled,
and deferred probe retries can keep increasing their enable counts.

Track each successful clock enable and unwind only those clocks, in reverse
order, when initialization fails.  Keep the existing successful probe path
unchanged.  This is limited to the BCM4908 and Broadcom STB USB PHY driver.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 49859e55e364 ("phy: usb: phy-brcm-usb: Add Broadcom STB USB phy driver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/phy/broadcom/phy-brcm-usb.c | 48 +++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-usb.c b/drivers/phy/broadcom/phy-brcm-usb.c
index 59d756a10..273f7b586 100644
--- a/drivers/phy/broadcom/phy-brcm-usb.c
+++ b/drivers/phy/broadcom/phy-brcm-usb.c
@@ -404,6 +404,8 @@ static int brcm_usb_phy_dvr_init(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct phy *gphy = NULL;
+	bool usb_20_clk_enabled = false;
+	bool usb_30_clk_enabled = false;
 	int err;
 
 	priv->usb_20_clk = of_clk_get_by_name(dn, "sw_usb");
@@ -413,15 +415,19 @@ static int brcm_usb_phy_dvr_init(struct platform_device *pdev,
 		dev_info(dev, "Clock not found in Device Tree\n");
 		priv->usb_20_clk = NULL;
 	}
-	err = clk_prepare_enable(priv->usb_20_clk);
-	if (err)
-		return err;
+	if (priv->usb_20_clk) {
+		err = clk_prepare_enable(priv->usb_20_clk);
+		if (err)
+			return err;
+		usb_20_clk_enabled = true;
+	}
 
 	if (priv->has_eohci) {
 		gphy = devm_phy_create(dev, NULL, &brcm_usb_phy_ops);
 		if (IS_ERR(gphy)) {
 			dev_err(dev, "failed to create EHCI/OHCI PHY\n");
-			return PTR_ERR(gphy);
+			err = PTR_ERR(gphy);
+			goto err_disable_clks;
 		}
 		priv->phys[BRCM_USB_PHY_2_0].phy = gphy;
 		priv->phys[BRCM_USB_PHY_2_0].id = BRCM_USB_PHY_2_0;
@@ -432,7 +438,8 @@ static int brcm_usb_phy_dvr_init(struct platform_device *pdev,
 		gphy = devm_phy_create(dev, NULL, &brcm_usb_phy_ops);
 		if (IS_ERR(gphy)) {
 			dev_err(dev, "failed to create XHCI PHY\n");
-			return PTR_ERR(gphy);
+			err = PTR_ERR(gphy);
+			goto err_disable_clks;
 		}
 		priv->phys[BRCM_USB_PHY_3_0].phy = gphy;
 		priv->phys[BRCM_USB_PHY_3_0].id = BRCM_USB_PHY_3_0;
@@ -440,21 +447,28 @@ static int brcm_usb_phy_dvr_init(struct platform_device *pdev,
 
 		priv->usb_30_clk = of_clk_get_by_name(dn, "sw_usb3");
 		if (IS_ERR(priv->usb_30_clk)) {
-			if (PTR_ERR(priv->usb_30_clk) == -EPROBE_DEFER)
-				return -EPROBE_DEFER;
+			if (PTR_ERR(priv->usb_30_clk) == -EPROBE_DEFER) {
+				err = -EPROBE_DEFER;
+				goto err_disable_clks;
+			}
 			dev_info(dev,
 				 "USB3.0 clock not found in Device Tree\n");
 			priv->usb_30_clk = NULL;
 		}
-		err = clk_prepare_enable(priv->usb_30_clk);
-		if (err)
-			return err;
+		if (priv->usb_30_clk) {
+			err = clk_prepare_enable(priv->usb_30_clk);
+			if (err)
+				goto err_disable_clks;
+			usb_30_clk_enabled = true;
+		}
 	}
 
 	priv->suspend_clk = clk_get(dev, "usb0_freerun");
 	if (IS_ERR(priv->suspend_clk)) {
-		if (PTR_ERR(priv->suspend_clk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
+		if (PTR_ERR(priv->suspend_clk) == -EPROBE_DEFER) {
+			err = -EPROBE_DEFER;
+			goto err_disable_clks;
+		}
 		dev_err(dev, "Suspend Clock not found in Device Tree\n");
 		priv->suspend_clk = NULL;
 	}
@@ -467,7 +481,7 @@ static int brcm_usb_phy_dvr_init(struct platform_device *pdev,
 				       brcm_usb_phy_wake_isr, 0,
 				       dev_name(dev), dev);
 		if (err < 0)
-			return err;
+			goto err_disable_clks;
 		device_set_wakeup_capable(dev, 1);
 	} else {
 		dev_info(dev,
@@ -475,6 +489,14 @@ static int brcm_usb_phy_dvr_init(struct platform_device *pdev,
 	}
 
 	return 0;
+
+err_disable_clks:
+	if (usb_30_clk_enabled)
+		clk_disable_unprepare(priv->usb_30_clk);
+	if (usb_20_clk_enabled)
+		clk_disable_unprepare(priv->usb_20_clk);
+
+	return err;
 }
 
 static int brcm_usb_phy_probe(struct platform_device *pdev)
-- 
2.47.1

