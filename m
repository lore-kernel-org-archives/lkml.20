Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268410;
	b=rE8gUTb/+6Vr66Fjd3kExBsR1IB4kS9VSNPYCIBVgGvkEMYJHFsAdZtSZPgaR02BkB0F
	 Pj3T1iXuCBrrgXQNoA8ufDJlfmMHrBcJmy7tdFazQk2oeNsytCMfdSqgVx/F4nmHLwVQU
	 9e03kjgrQq9kC1hNiLNz1LCw7ZaezqcppPkfP6115U+n5BWGqJUPFHSxqJwaMmRpUSzWH
	 vGoiOvP1BsTndmTGl6varyGxmAC0b80X9F2gsktsQjz1E80HILIXDNPy838bKN7FT/dUk
	 OrYl0ofD6LhM5TtCobc+twyf71m8WkNvTitTkd5SYG61VYnnFK+yN7/qc5lSgWAib7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=;
	b=1r5pMk/7ZEafQbDxkNe1ASs9lR8nEUOPuiBxHnARemeL0kYiifCkTBbzc2NQVLqVHsYG
	 4UCimC1IlWgKAnwnBgEq24kzjk3zyHFJbmy6Lj3mkj6k+znQzqHAHp8Ia+jb/7NTtZUou
	 olJlKe047t8chcSrxJTgOZKo1F7R+3/Qoo8+7TOhI9Yv8e8hg3Jwa1VZ1n2gYRUJZrnW+
	 iQXgk+LdR+fymlLqQR3woh9fTL6/Q850BInlIEo2Hcjrbfu0Fxwk8mC93XqLfD3yMgEQI
	 xrOmPLaom4eylez34xyPPOFyF+WRRJ8fMFN+iFiNnSTPimRndQGPRaRe7wWrTnzN2Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szocTkCB;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90245606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90245606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szocTkCB
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso20042405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268409; x=1793873209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=;
        b=szocTkCBE7oOYlOgAnfB9taJGXNBjNX9zcXzpd0wS/9gRFlbmIQAsiPN9Okg54uQDG
         llCfgrEqY/JVWpzkz++b9QrLHfS25kOn09NJ1KGtKeY1KA1KFO23/3V2tGleKePIhNeX
         kE/SvLJei/zv/V7i73ARnuETTVDiHtgVudnm2epwrDUfeQtWM/Z2zmHVlIw6p8IS85mF
         46pFBrtjXtKyhz1vQz/YFJCYxeJbCo6QCH9h7QA4nCinUykNgFxZVtjsQw7bFTwa4dKR
         WadBPTwajaGI8BAIPVOA15AZ8rth4IWRCl11KxIFbnDAS4e+vAQxNKDropxb3yz6cAe3
         zPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268409; x=1793873209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=;
        b=Or/TnVFOFfSmk+fjV2i8zMyDQPAFbMdtEZVXJNfZ7u1rJCNIE9RX4SH/TbVHSAkCqF
         CMEA4mt+hdc7JUUgp0B2qVCzBw35VczCxB2NqyfAtcugCkRmxSDfeY0N9WT5GHezYNjy
         dGqqmeV/zFG+TNrxeMUbJTd6ufxIBBMBOwbeeJWADmAFmW0uOBGV1uDzhjmbH5/Sda+N
         pPyJkx+zswkDGl9QrGOyaRWesGp9wxAcJUJe55aVBHuaUeVQZ3zwoU/bC0CcDG0rujPQ
         BBpup1Pc6v3+4gYlLvxx2RCC1YqMf694j1rPbV57/58O39k5cz5OJco4xrwcnoV5hnRC
         SlWA==
X-Forwarded-Encrypted: i=1; AKwUvBzuxIkoZOJOiaAt3owhQ4ERmYi4npIxMk9z838HqnKHeoHwJj+Jd4VdM7O0sFjych5gpwawxwZBNeFVpOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXBywnJYycz0dr19/u4XAUTssHby3dZt8Co/guRmqS7ZMEWChG
	o4rX//j8ZRHE6HGjflYaTlkDuy9YSStBhfrbwDUQBs2lQFFtvGavBEfP
X-Gm-Gg: AYBFou0slJRwv46DPOX5BjzEM9+Ci36wvW+2ya/XgNVvARC8Lkdnv2UNRDA01v3/5i5
	77Bo++2gUcIB1elDOUCQQiQUmt78tn61d9dNzCvt+cBUgPyXiFkZZF3uGxeiIwwH5GFJo1bx8MM
	zZalQUnhSonNRIlMpi1Y03p+b0dIT3V0rfcsHLNULDv4Ke46X67oP7tSg0SJ2bQFFdKH6s+F69D
	wcfENfrmAzapD3l4IMDfnt2aPMJ+8EpltDaNY2lE6/JSCtTNIzwu8uLRkIHqJtnJnnKH8ZDF4ys
	WThqHWycbQXjT5QQaT81vtL6+7wUFHasUpgeRcIchoHx69n/Z9mUDHbRdjXhcQcZMvUMFIp5gmV
	f7aoQle/OvgrcdqpX26qxEnuHA6XEXoYcoJPVKSf1MiO5Zdw6yzuvITrll8W/RqDgWiFBrGv2up
	oOxMbHrip3pGis4HuI7hB4LTsRTQkqdXt2g884OiY6Xbuzc+S5R/J5f/VA07UaiXRDFT6um112E
	CJilbTmZst3aiYbmgjd4SIF9+8NLJODQUP4EwnTqLGelFGHJAWkEFlWDbpJDfXRCchm4s3EgH40
	gxDwx73Nz7CY3Prr+wyIIThQScN4PbOZbnXkK3w52P887qk9ZMcJ1j9dZomd8fb3qXP23XnRUAO
	NweWLKJT6
X-Received: by 2002:a05:600c:5246:b0:4a2:14af:1ead with SMTP id 5b1f17b1804b1-4a9676d1514mr113081845e9.25.1793268408743;
        Thu, 29 Oct 2026 03:06:48 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:48 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:23 +0100
Subject: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt
 during system suspend
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=3230;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=3qBapWKlE9gnNc1OkRIJoQ7rj2z5kJO1plv4vMvRaIE=;
 b=Gax9ATA7YcEykEZRoU8HuTbsJxxf2tMvfTF8fzq4d1vXJVAPuOzgirPI7o+V26V3EhSkl5nP5
 acS+c8VRtbJBrDNorA6RDsnaahLsnJ730MdZY7glDerfZxdequzJfBG
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

The driver marks the device as wakeup capable, but never enables the
power key interrupt as a wakeup interrupt. As a consequence, the PMIC
interrupt line is masked during system suspend and the power key cannot
wake up the system, e.g. from suspend-to-ram on RK3588 with an RK806.

Enable the interrupt as wakeup interrupt in the suspend callback if the
device may wake up the system, and disable it again on resume.

This is done in the regular suspend phase on purpose, rather than with
dev_pm_set_wake_irq(), which arms the wakeup in the noirq phase: there,
enabling it updates the PMIC's interrupt registers through regmap-irq,
which fails when the PMIC is connected via SPI:

  spi_master spi2: Failed to power device: -13
  rk8xx-spi spi2.0: Failed to sync masks in 7a

Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
---
 drivers/input/misc/rk805-pwrkey.c | 42 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/rk805-pwrkey.c b/drivers/input/misc/rk805-pwrkey.c
index 76873aa005b41..9b64ec7463c62 100644
--- a/drivers/input/misc/rk805-pwrkey.c
+++ b/drivers/input/misc/rk805-pwrkey.c
@@ -15,6 +15,10 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+struct rk805_pwrkey {
+	int irq;
+};
+
 static irqreturn_t pwrkey_fall_irq(int irq, void *_pwr)
 {
 	struct input_dev *pwr = _pwr;
@@ -37,10 +41,15 @@ static irqreturn_t pwrkey_rise_irq(int irq, void *_pwr)
 
 static int rk805_pwrkey_probe(struct platform_device *pdev)
 {
+	struct rk805_pwrkey *priv;
 	struct input_dev *pwr;
 	int fall_irq, rise_irq;
 	int err;
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
 	pwr = devm_input_allocate_device(&pdev->dev);
 	if (!pwr) {
 		dev_err(&pdev->dev, "Can't allocate power button\n");
@@ -84,16 +93,47 @@ static int rk805_pwrkey_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, pwr);
+	priv->irq = fall_irq;
+	platform_set_drvdata(pdev, priv);
 	device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 }
 
+/*
+ * Arm the wakeup in the regular suspend phase rather than with
+ * dev_pm_set_wake_irq(), which does it in the noirq phase: enabling the
+ * wakeup updates the PMIC's interrupt registers, which is no longer
+ * possible once the bus to the PMIC (e.g. SPI on RK806) is suspended.
+ */
+static int rk805_pwrkey_suspend(struct device *dev)
+{
+	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(priv->irq);
+
+	return 0;
+}
+
+static int rk805_pwrkey_resume(struct device *dev)
+{
+	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(priv->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rk805_pwrkey_pm_ops, rk805_pwrkey_suspend,
+				rk805_pwrkey_resume);
+
 static struct platform_driver rk805_pwrkey_driver = {
 	.probe	= rk805_pwrkey_probe,
 	.driver	= {
 		.name = "rk805-pwrkey",
+		.pm = pm_sleep_ptr(&rk805_pwrkey_pm_ops),
 	},
 };
 module_platform_driver(rk805_pwrkey_driver);

-- 
2.47.3

