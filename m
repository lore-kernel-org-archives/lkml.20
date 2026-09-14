Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA444E673
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406058; cv=none; b=coVNvpiU6HCbWrocGYNMABr5kVanAY9ZiA0OHyAfbzJdVH7gVt89N8S5wWCUnce0sOJJNepDNHQ/D0Ix4CTRfRSmBzSH95A+bH9cK+dj+A/DoU4Xu5P7aofc2+i/fszQ1TqB257tbnnXx/CcuSjJ9757qRQq/Se8bCmwfxz62Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406058; c=relaxed/simple;
	bh=x+duut9tMSHe9M751Ne3IHM+XA1aiC7lvKFmrcwMlNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SVtGNp09bYYDYb98AMwN3pixI3qaOYi9DuUw3rDd25Q9EwLa5z/pSBoIC8d9dnRYNGjilgF2paqFI3uR0aNMPlEmlYvP/or4iEIQth65aAek+26h4DhueN9ljvSfuYlN0aAFXW4Mk7v2O2loAii0lmTCHtIF/v5fg5m1TE+H2DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGLIlWcu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGLIlWcu"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so16445295ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789406055; x=1790010855; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=chltb2wD8PD97rawmjna+iNh1esiaae/NnONMgkrsOM=;
        b=sGLIlWcuHRq07hTxqC0bxwmYS/ejM0FtuJMPMxw0yuvHisWFSvmT7uOgiOze57Ov71
         aYEmOKInT487cJnWiATDdf2b/BuWJuQFiKPspbSwKf0JtmMM9eCO5E+w+uby2mUSzRlz
         oy0S48obt/PMnWe2ZF7+3oCqpXFAHuB3G+5AaUtNHd7IseNrWvzV/ooKd5PBR5JRtIfX
         ozkmMbTvavfxAdk5sCzkd2KkGVylPcOtS/UkmNaiVo0P18FOowf3VP0mu4saoL2+xlHD
         CLhmxMMU/j/7vw3Y0uEq1segA+xtoh/6/s1uEV7W4Ms4rWWVG8l9s3eXO89CwRmEuVTT
         UJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789406055; x=1790010855;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=chltb2wD8PD97rawmjna+iNh1esiaae/NnONMgkrsOM=;
        b=fvQZNPBvvl6RMdJs2KhiZMs3OVaJFNVDbikoas3VPm2/LaRaZo1hpXCuw3hJKRVcQW
         XRfAz2CMXKMaZkiuMDiXtwP3RwJ39ifG+sersIhytGEh+TYnaEXxwNvFB0LLTZdO2dGk
         dgXI2G2meQe+rb6fXAJ3yYJtt8EUOZxf9i3yNOr0JLyNvHtLfV+SmeCXL1yFDUf9PAS1
         lOoXwApROyuC0ZYDALSBd0Kbam8cXQ4oXs53XG1AhTcnwRee8ek6gwAZLw3+DanpJj8G
         SHJpM8d/wNYZKHNPDvpXcV6X6qfB8u+PaGrqzQx2bV4Ek1nn9bjXe6HiseY9RsusDW79
         Fjdw==
X-Forwarded-Encrypted: i=1; AKwUvBzQWxH891RYfHXzioJmdeCutiDt/qdexpASft9WAC8DwhS1L4AyoODydYThZIV4p9IXfKgH+hCJz7T5zKs=@vger.kernel.org
X-Gm-Message-State: AFuF++lEECkUAw1ztPlT90G4z73fKL8etz9gO6BSN6YHy04LGlqfVEAW
	6ZR7kied7hZ/hqYXbtXUGqQu5IvcMmA+Hw/9cpRT+GMG7oDhz/wC3lPp
X-Gm-Gg: AYBFou1nUVHEoEQfUOzRR3zAsvvkbq1G/Z+TpK9G9beVWLw08bVAoFrgSMopCC4Gawa
	fAZWRfuyLONlBMQS2WX3+QM5z0kY+R8IzSsHoyZ/9V2+3eFtqFufKM0uKiIU89oorReOR1Hd0Uf
	mfAQwh0lfmOcJnUX0YANeioUudl4cKtSfXtPdTSDEzTUw55X1CfuLstiERg8/1PmmkzHdCpnBea
	IF1NP0fUHVj4Xqb3Z3ECCUVCwoBPP43NQNDhEqieCFArG0qseBG/JAjCb0v76pfmol9sAxmg8aR
	QpivHFCuIvd00kfh0YrILz8WjUkCT3dzrvL1etSl2iDip4vPIlmnBXmfp5ZaKRol2idrTQufX2K
	Ibrk3PHM2JLb5iYh71Jlw5Ljb/ORY6PDZJn0DClFtDD3EEpi8lQNYawTkECaRZPygspGL7HvcBD
	tuZ50XK7GuuM589kc94gTRxJn5WgBlKzDTd6lJSyWdBU9m6aYHzFuu5LF0qizjyOQlYwYXZ2v3Q
	+gmTe3+GioBkqmT7yNXF1YQTqbsnEm5l16zS4aIJ4VbikeiRePBWnKHiyy7lqqLXRg=
X-Received: by 2002:a17:902:fc4b:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2dd6c70df7dmr87697855ad.16.1789406054956;
        Mon, 14 Sep 2026 10:14:14 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd445de320sm42227055ad.8.2026.09.14.10.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:14:14 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 15 Sep 2026 01:14:08 +0800
Subject: [PATCH] usb: musb: mpfs: tidy up error handling in probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-mpfs-1-v1-1-a12c2fd7e0d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqAMAxF0a1IxhbaIEXdijjwk2oEPzQqgnTvV
 h0euO/dIOSZBMrkBk8nC69LhEkT6MZmGUhxHw2o0erCZGrenCijkLRFh4XBnCDGmyfH13dU1b/
 laCfq9ncNITz5pZeQagAAAA==
X-Change-ID: 20260914-mpfs-1-2e062f29128e
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, Bin Liu <b-liu@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789406049; l=2192;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=x+duut9tMSHe9M751Ne3IHM+XA1aiC7lvKFmrcwMlNo=;
 b=mawbIY5TSFJDmO2pUO7rWizxkVTG8cUkHVInrILkyMjQvw0v8fkUWH+Wy1kv/OlG+UEhSOuJB
 40xtPVYNWvXBaevGfylbceWEhrxXZwZ+2P77UWQ4T8l398KRVYCieom
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Restructure the probe error labels so each failure only tears down
what was already acquired, and stop calling
usb_phy_generic_unregister() with NULL or an ERR_PTR() on paths
where the phy was never registered.

The old error paths only worked because platform_device_del() and
platform_device_put() ignore NULL and ERR_PTR() arguments.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/musb/mpfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 587127abd30a..59625ed95656 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -276,13 +276,13 @@ static int mpfs_probe(struct platform_device *pdev)
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
 		ret = PTR_ERR(clk);
-		goto err_phy_release;
+		goto err_pdev_put;
 	}
 
 	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto err_phy_release;
+		goto err_pdev_put;
 	}
 
 	musb_pdev->dev.parent = dev;
@@ -324,29 +324,29 @@ static int mpfs_probe(struct platform_device *pdev)
 	ret = platform_device_add_resources(musb_pdev, pdev->resource, pdev->num_resources);
 	if (ret) {
 		dev_err(dev, "failed to add resources\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	ret = platform_device_add_data(musb_pdev, pdata, sizeof(*pdata));
 	if (ret) {
 		dev_err(dev, "failed to add platform_data\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	ret = platform_device_add(musb_pdev);
 	if (ret) {
 		dev_err(dev, "failed to register musb device\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	dev_info(&pdev->dev, "Registered MPFS MUSB driver\n");
 	return 0;
 
-err_clk_disable:
-	clk_disable_unprepare(clk);
-
 err_phy_release:
 	usb_phy_generic_unregister(glue->phy);
+err_clk_disable:
+	clk_disable_unprepare(clk);
+err_pdev_put:
 	platform_device_put(musb_pdev);
 	return ret;
 }

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-mpfs-1-2e062f29128e

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

