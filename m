Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D63852ED53;
	Wed, 16 Sep 2026 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568813; cv=none; b=OZqw5rf3VgikUJxh8TeLDCetXrSVewMGA8N5dGAlbNVqTdEYMskxZm+9eeaPa8Bd/C0jZ2KdNYJs26U5nlULUvE9NLjSkuu4YjRZf2jdHl9YHxemcMWkKdUB+MFVb3gYUXUpUYas2mQe2gJ/YWRknheUc1uaAPJpbBEA2kZArsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568813; c=relaxed/simple;
	bh=KdHne8JVWl00C76d/vQ/deohl8aXPm/dOynE+3pXqa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uosxSqBGU1XKH6bqoc0OFZRmZPGcJ4aRNar/Z7swbesVVD5lW0PKI1EogUUjUGpMdh48SRNfIsxyT31HwjDDKfwrWchgNPDyFsXwlqK7IkvOUmwDPhKRBTxas/7Qu/RYm3spnqVhJaOeteZ2ibLFgnf+F9FCdRZtExzATof/87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cPX5g+pi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cPX5g+pi"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5C781D9D;
	Wed, 16 Sep 2026 16:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789568709;
	bh=KdHne8JVWl00C76d/vQ/deohl8aXPm/dOynE+3pXqa4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cPX5g+piqUc/DkzohvliUcjGHPQC1qfekEToOOQL4CN3R/c8QfGq6JNtGN8U2THC0
	 gPvXzXxlFoZU0Fu+e6AJkbYdEpvqdywKLKH44qB7UhcOxiEnZvOeUy9NzFN9amRh/x
	 rzhx3S4yp4icmRzhh+iDZxM/P6FwiL/DRQkmRahA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 19:55:36 +0530
Subject: [PATCH v4 6/6] platform/raspberrypi: vchiq: Register vc-sm-cma as
 a platform driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vc-sm-cma-v4-6-476d1142b5df@ideasonboard.com>
References: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
In-Reply-To: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=5ezLzp30SU9AON3EIsJ/DU9IOTPIGbTZONyPk3ksxLs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqcBDk6V1seiAyxqg7E6I4IbgwOcvEAQPAqr+
 IfBQMggEoGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqnAQAKCRBD3pH5JJpx
 RTtxD/4oxIaT/c2vR2R4zKvJsx9C5/OzoeW+0x35u2KOLw1ES0VNz7jyCkAJWyECgCL55vsxYKr
 8CXVrcUAbEVV2s7f5bOg35jEdb45+ykmXP/EMpYdrLMKkyAtDvfDfedl9T5Ox+ZnhVsrwaCKvw5
 xT61fFFGGPlJ21Wzlv4jSmXvgiDrk+3xEgEkupqXVwY2TUSw/I7lP4P90ZyXrtWM3iELdSb/jJt
 GQT8p0CCJKcFOpYCau4s/4gqMwptzaNLwbmOi9bHADj/qScY2dq4AL266ADVPPXNW6d5nHzAJ7m
 J1JOnab5NfTeTiGZ4s5Jcnp8G75xyMH6B3SMLKGY7GsrXonZpFJop92zcUyPQpw3JmyNazEOwn5
 u8gfyBCGxOLmISBlusqAlxSr4pJxqblMpBBcCgKhHjBYLx8AjVcK3BOORQ9hfjq5F67M0SYg3bC
 a/MYj6cd/jOw2lFP/8Y06fK6+MthPfz7owh/QPBzepcaZNqwklvkXO6TvJVeV0ORaTBA0HuCQ6Y
 D1XpqIYPXpTQh128VjUfVw5OtRK13Grv7cWQD2AjO0qTHwRfbthQPvfxVTl+W8CDXxzUQk9RWcG
 A8pCZMHmGsXOeStPkFX9DVcoPhuSbW7JKUed46GK4Va4gbiHqJNROSeFpFiaSEExyusZZQjQ6oo
 KCDz4g7hzYTAVOA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Register the vc-sm-cma driver as a platform driver under vchiq.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index d5a25033a261..ec951ab19d67 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1414,6 +1414,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	vchiq_debugfs_init(&mgmt->state);
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
 
 	return 0;
 }
@@ -1422,6 +1423,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index 541b4efd64d9..d59837eaaa8c 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -62,6 +62,7 @@ struct vchiq_drv_mgmt {
 	 * the interface.
 	 */
 	struct vchiq_device *audio_dev;
+	struct vchiq_device *vcsm_cma_dev;
 };
 
 struct user_service {

-- 
2.55.0

