Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929378;
	b=bEJ2pxtAFT2K28eXrQajeEr2TzG24I4G0Dl08pPYtKw2bNhVBi6r2sGYHAT0Vynzcect
	 35m/CoznADXtXAfZG8f54qZyH6v4V4I6Bn5pr8AHwpcSry/X5O0b3K+fBsQxp8G14SRHP
	 xv+FOpS/Pdc69SnNN3KMl0WgTRgWtqHZ8RTezdD9vKUyHSjxDxeQarbzeb1fLG4wpVNQd
	 j5ynrWlLXwwJmEdCIQwueed5nPLB/SG5YRNScW/byOUIuZG+YpY4qD9LJioKp9gVav/Um
	 +IzNgFxVe2Rakhkl3y4HbIOUpHqzqa0bhfON14K6/6uqEiUNZSKd11MG8yM4D2F7Krw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
	b=k3vE/PoCKPn7C+RvGRSaz/CnNSPLK64R9L429y12R/Z4n2k1n9T4zwMnPeQu+RaKRcXU
	 JSN7WqzcX0nWKWtzcMwdiBZ0sa9PPuZdZLAC7/CUmAhGkSSYaZwp0JmgXT1vUtSYf5ktI
	 Q/KR0lO4Y5xtT31jHVL18PynWtNbVNZteETExGzDMQ60kTmZngl3HSCkzA/98hX8o1CoF
	 XGi+LOaJvZopHZZNEcU24KDGD75nLmInqb/GlSMhCzVFEvJp3RH3T3iR7qAqYSMHC+BXu
	 zvo+3B7r66ypEg1HF+Na443Ufpv/JHgaXXN6jSiJ2IFcMDXlM/5bCfRlFNhxYa4fNvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HaHAd0so;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F4606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HaHAd0so
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so57498a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793929377; x=1794534177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=HaHAd0soOlAW4xzktGagX/fsOKIBTHrUK2I/D74+/s6cDhxTtgZMsU9EWYTFEga3Gg
         K74l4ODs8nRIMvZtTornOwqcKn2Fd+4Xx0436T0L1zxqJtzEBWXv0eoioPjccGm0oB2F
         r9qpV36SOBqGXJS7KWxI/CnjPEO62vFusou4g5aCegr3lojny3x7JwmpEwgO+IOB0bri
         aUtiIv3gXwuVMLAkrpfp7IJsXa5BcqNGubydO8MVdUVkuCXJAzWzSEiW1QUfGD36f8yh
         RPeaiuGNUekSmSuXj5X+Io75F+S1X9oKE/gBzUfF0wWXaYaMwQWvsCEA8LsgO7CjLiVM
         XgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929377; x=1794534177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=uAvvIOKWRI9w9EDp9EcV+pVF004fZcyGIr271ZrTQVZa49ly0d9n/B71aMs7fcpJ1/
         LgwROWUWFNcepxFxUxKyfXoal/CsJH0Ux39pHxIGaHzIlNpaPI9m8v2zgeEH1Bz3yVgV
         jZYaDRc5gncvFqIccZLNnGLuc7ILT4yJvTovck9rgidpHFvqIosCrPXm496muHpChfi8
         xvnlNChcgYkiQPA3ClA3dT6fV3lObFnEk7QDHo7iDLmG7DnG2sPzKAsdSSqlsL2lRWAJ
         02GHtiKmPb2n/czdFEiSvsyYGnTNJya4sAr1mUZHAa8AQCl6qT5UYzEy2NoQm/3RJ53c
         9Gyg==
X-Forwarded-Encrypted: i=1; AL+hErELBGMwLYBKaThw9RLJV1S3VMS0e8If80d2pK2xLSyMDFdUr1anSj9Eepa+wql08XpKeXUfrT9djhRLTWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t8WNWFlEbSH6eQCvsog5vi1gKYAEabV6U56U73ophlH2fAYoz
	mbFqEkyQM2HGjczelB1cuAJa0ouG2+0+jom7xonhxmJRaZntC7JPwaC+
X-Gm-Gg: AYBFou0mlvrGC44yoLsx3eHa9jkTWtl5Q166VwJykL48Z1CxF6lWBFPDHdZAqhFiIqJ
	6AmVgcofidI5aqjYgIFOGcen30jPCaoP4RBNPTeR04JJqwxT8kCklf4XdocSNmzP4tN0qIbNGAJ
	i3//gx+noKy218wFl441eglrOyRgqKXGzjPnY6JxjZ3L0gTstR3bGU7cAa/djXV65sCOlEIt0xQ
	jLTXiKBqXATlngGSiTQL9SHz+GWEBWu8i0NtuCpOsLoCSHIkEl7tZqxH7lXAP4C2vDUos12YKcT
	uIecKfuWQnjZn5qKA6WGQ1p/6UMnJlEorwme62IKvvbsnZh3A/J0a9Xr0HPDwH04lFOYIhXQ9Ka
	A4URk9sjDhiZaWQvUjTottfUyzsXrlv/ptoJ+wccit1/KG9DgwplQ6hbR3WrLH0FxZOKZ3eIgtr
	8uH/95k2p4oh55CMfqAqjws5hYWHE5DIAVfnModwxX+HbtCCK1dNtlBGHKMGYokMmMsCyX9mHWm
	T24zOcZNfDvdX+2EEAjSqZA+kJMeoSF2oEPwIKz/JX2RD0AIwjqcfNhEbsVq1NrbmE12QSo2rXP
	avxmVdxcPzwsdLvtor9egY+aebMln6wXjJ/HOPR94+rAbxgPMLN0851qP+eS+XkGpcVaJ0gKKH3
	ootSoVngJ/YNIpk3G3oW1fU48SccfQiVfpaiwBW/jguukzojdH0VmBdvZQW8r1E4dH2xqZRia6a
	6JGA==
X-Received: by 2002:a17:90b:3b8f:b0:3b0:ad42:dcb3 with SMTP id 98e67ed59e1d1-3b0db6e4166mr802421a91.14.1793929377014;
        Thu, 05 Nov 2026 17:42:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3265a52sm5407994a91.10.2026.11.05.17.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:42:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] phy: ath79-usb: support the analog reset
Date: Thu,  5 Nov 2026 17:42:54 -0800
Message-ID: <20261106014254.544923-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From AR934x on, the analog part of the USB PHY has its own reset. The
old platform code released it after the PHY reset on AR934x, and left
it to the bootloader on QCA955x.

Take it as an optional "phy-analog" reset, release it after the PHY one
when powering on, and assert it first when powering off. This is the
reset handling OpenWrt has used on its AR934x, QCA955x and QCA956x
boards.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/qualcomm/phy-ath79-usb.c | 33 +++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/phy-ath79-usb.c
index 8e9565846b2f..1e7868fc0b5f 100644
--- a/drivers/phy/qualcomm/phy-ath79-usb.c
+++ b/drivers/phy/qualcomm/phy-ath79-usb.c
@@ -12,6 +12,7 @@
 
 struct ath79_usb_phy {
 	struct reset_control *reset;
+	struct reset_control *analog_reset;
 	/* The suspend override logic is inverted, hence the no prefix
 	 * to make the code a bit easier to understand.
 	 */
@@ -30,7 +31,19 @@ static int ath79_usb_phy_power_on(struct phy *phy)
 	}
 
 	err = reset_control_deassert(priv->reset);
-	if (err && priv->no_suspend_override)
+	if (err)
+		goto err_suspend_override;
+
+	err = reset_control_deassert(priv->analog_reset);
+	if (err) {
+		reset_control_assert(priv->reset);
+		goto err_suspend_override;
+	}
+
+	return 0;
+
+err_suspend_override:
+	if (priv->no_suspend_override)
 		reset_control_deassert(priv->no_suspend_override);
 
 	return err;
@@ -41,14 +54,22 @@ static int ath79_usb_phy_power_off(struct phy *phy)
 	struct ath79_usb_phy *priv = phy_get_drvdata(phy);
 	int err = 0;
 
-	err = reset_control_assert(priv->reset);
+	err = reset_control_assert(priv->analog_reset);
 	if (err)
 		return err;
 
+	err = reset_control_assert(priv->reset);
+	if (err) {
+		reset_control_deassert(priv->analog_reset);
+		return err;
+	}
+
 	if (priv->no_suspend_override) {
 		err = reset_control_deassert(priv->no_suspend_override);
-		if (err)
+		if (err) {
 			reset_control_deassert(priv->reset);
+			reset_control_deassert(priv->analog_reset);
+		}
 	}
 
 	return err;
@@ -78,6 +99,12 @@ static int ath79_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->no_suspend_override))
 		return PTR_ERR(priv->no_suspend_override);
 
+	/* AR934x and later also hold the analog part in reset */
+	priv->analog_reset = devm_reset_control_get_optional(&pdev->dev,
+							     "phy-analog");
+	if (IS_ERR(priv->analog_reset))
+		return PTR_ERR(priv->analog_reset);
+
 	phy = devm_phy_create(&pdev->dev, NULL, &ath79_usb_phy_ops);
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
-- 
2.56.0

