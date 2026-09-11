Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E4A19DF62
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103467; cv=none; b=C3Jen21r4sipKsLBqQagHl5uAC42KwfXOlYvNS+Xn/8L4YQyQVo94jkanfvSJx6rHgM0oxf9GvDMTVCAw72IjQyCI0i/PLNY1rwBzAS0K262z5xr/ESDNaXgBWukVVxLDQ3sVLv8itF32IKr+mClirZBjQqeN1vYHhWVe9Np2YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103467; c=relaxed/simple;
	bh=op8zp3xtqZK1y+5EYbArVhH3q3yVDjwvN7ve9EQ2nqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z2U5sJe7zvPrg7m2SNc2tKfn6marI3m5xOi3AibFTj7XoLdGZtz2nxNlPVaru/OvCKgAE1V6DuuIl1UIZgABfYD17bJN8Lr6YyNZOh+rBeMsTS4QhiRGIIcOZdUgGuMB5fAK3I0+9NsNJBUfDgIep16jHzkTzditRXnjsbwt6QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXFGsnZo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXFGsnZo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso486797a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103465; x=1789708265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=;
        b=mXFGsnZoJ0WTGKnPFuk31otCAjD/QZ4ATK6pZmuH03BBWYSE8ukDhIoKI+pxcsM7jo
         yuA0KBDO+v23vqA2NQ6+83tjF1apnGZJSaJzxqMGmgi+aGxa6/42jOEjIzZgba60uY9C
         9PCZdnegjcGp3Fy9hEG9BMXyKoIIUootyUf9d6YXvfusoWg6sD1cePqnO8Ltmcrx3o01
         OA6H+oJVm6z9d/yzprDglOsQadYIovrKVuivaGkfqH4gZmPSlKEyQtlPWInTVIoLhVWg
         Zcy3Wgk+XxYSBeleHMHlvHQ+qOBgNaDbj3drGXNIu21LIO8r+6drSmvoY7R6FyLLEP0o
         l4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103465; x=1789708265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=;
        b=oEVxj9sCmkUGJVcl+vEk1O1m62mM0eJTK2ndW5GVPvPRn2bMA7yvrrKTCzr4fcu3Dv
         9oVuY2+/k04Iu3XnX36Nh4Uvqm6vtjZKPA2a7iO0YdRgiZ+Wl9KHBreqQmOio90D8Vyf
         0Xy1F1q19hYkNuegjyo6srOcm9CZNlVaGSKhTlwaFwjpxkPgWLiDwOroLG2QreK7pzoB
         SLmi1JVHvGuys/XHWMqbp95gx9jwIub4WFZYbOIZ9D10Vq8y54nGOtFqBTG49qy5CMNf
         DnjpxJxXKB+KxwpXr7FcC/MWVPPBWg4Qcx3XhLv+Mf6j2r6Oe05hPYq01SepE9PFP3rR
         naYA==
X-Forwarded-Encrypted: i=1; AKwUvByHDO637qr8T4xh5kBVFoIT6pD0qX/7++lAZcZ1Dele16pMXmy8WaLvEjuKJlNLVdMAqfFRVNDa3HoHWrk=@vger.kernel.org
X-Gm-Message-State: AFuF++l5CpBWDiLsQTf4Tc6j0idJvjTNj7y1oVLfK/D/tpYpN08Vm5iZ
	d+tVlf6QdyQu1xpNnIcTEVB2OBEWnzsN6/iepoXnMog1AKfeXw5wX7y1
X-Gm-Gg: AYBFou3V7M1V/daR67YZtVkAxf1ipVWVA3wxSCUyZ5edOgEbadaiu8QZ/OCiT572MUw
	nsFjCKBiYdFk52Gf0gZuQH24NawIBxrT+YU4Ze5grKYPUZa5UrpujQsTTsJQ+DqGsjn0BqENu1u
	RpV8wQyxSEOIMJXCiRsHjROseRpeTxspMKreT3TamKVpCnSZFIWlIeyikts5R6iTr00qO8Hv88w
	TpX/t+MxC3lstvZTOu0EK96mMfkJQH5h2H11GssysdyNRwkNofahnXxHi+aOWyfMTzin914J2C5
	anVMl/zleyc6SQOs7hmRWT9uEKb1tcxrLD3iqkeavjDynomf8ySVbR15MIenzAF0MSWZ0K+BsBl
	pyocipv4aHY4FPrs6EWBheodYzx5T82ZGG/aua9vLPfE2vBIl3aOe54dWZw8yOtuVngdpfDlfMD
	L6GLNyCW6zKSuV+X0kyDY5haHX1Iq1u5csbrxhu1wTzsGg7sfUAWbuHcB1x6emsVacrpIjx3Lco
	QnKGdDQUauqjyBxt2oJeoDXt+9eSJbUC7dfvvYLGVvOnFOMSpNrI81PyJg/qAKG/d3RbsEU/KE7
	IOdhc9fboNb3KPw=
X-Received: by 2002:a17:90b:2641:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39d9c352a63mr4011103a91.22.1789103465343;
        Thu, 10 Sep 2026 22:11:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d995a42a5sm2512810a91.17.2026.09.10.22.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:11:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v4] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Fri, 11 Sep 2026 12:10:43 +0700
Message-ID: <20260911051043.15962-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_kasprintf() can fail when allocating the wakeup IRQ name. In this
case, the probe error path should shut down the PHY before returning.

Use the phy_shutdown error path instead of err_clk so that the PHY is
properly shut down when creating the IRQ name or requesting the wakeup
IRQ fails.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2:
https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
Link v3:
https://lore.kernel.org/all/20260810093112.47807-2-phucduc.bui@gmail.com/

Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by
   Sashiko's review.
 - Add Peter Chen's Acked-by tag.
 - Add Frank Li's Reviewed-by tag.
Changes in v4:
 - Rebased on top of gregkh/usb-testing.
 - The ret assignment for dev_err_probe() is already handled by
   1db5c6b0b983 ("usb: chipidea: imx: fix missing ret assignment for
   dev_err_probe").
 - Keep this patch focused on the phy_shutdown error path.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 6a17b22047b3..edbf9df9b8f2 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -533,7 +533,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
 			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
-			goto err_clk;
+			goto phy_shutdown;
 		}
 
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
@@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						irq_name, data);
 		if (ret)
-			goto err_clk;
+			goto phy_shutdown;
 	}
 
 	ret = imx_usbmisc_init(data->usbmisc_data);
-- 
2.43.0

