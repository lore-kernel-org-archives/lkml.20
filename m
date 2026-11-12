Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482835;
	b=R/iV6NoFrYclp7WDnhPMK2mJgvHChf18/Hy/oZ0fjLsHNl1EAygWvx9uGe7StEWVWED7
	 VLYjLOrqU0lzNoiXz3VEKGVJjOdTO1WQ2nFcIicpZO2S60UyIbcoP7Y/i+rZs5afa5kfm
	 DFYUkHQmm4JClchhHqtK/gRPfVB5uo6/JyxVXTGElbTdp7LIOIuQz5bjrMAyLY+iqAlaV
	 4/ozXM0g0lC+zjbGiBZc1bgmRnBAkpPYXkLZxuHgDu7muvtS5oW7Cs6c/rUwSVETTMOmd
	 mrW0+GLkkVFhkyP8AjG8AFgAgbR+TJocRmnDig5q1oL3jNy/g9DhwN3GEBN2X3iNwqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482835;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zPrI4dvsVw/+t9ULutPovtzpIsQOq291JIs4t5ai2jg=;
	b=mf/Q+zwMKWpsYBzQSeMp1NZgiCDREgjMUdh7JqB0rihlveNIGi7Ng/o7SLrSK8b6DEYJ
	 C7bYLUu59U9O2taQR/6Cq6YDQepqI9+W4ulVjUElbV7mldHRfY3opoWo2MeyLriMvrMlE
	 y9/WYYOO8cfJrmXz0V4HZCSK9jX8ddAfU9V97p7j+ZGiZKXACPT+cDTx1074miFTSfnHf
	 axbhF3reG8QZGe5Chw5HrjXJkLgAti8H7adoH/lHN0etUWRhrK/Lw9WCS/c7s8iN5im9F
	 qLEfWKtCPS11GFsJOfFO84TBiJTMo5FzaogGYwC0s4QVd5vumWbyxlNcafTtiZ5bucQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UCDce4x3;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D54606B356;
	Thu, 12 Nov 2026 11:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D54606B356
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UCDce4x3
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1C9D1552;
	Thu, 12 Nov 2026 12:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482690;
	bh=ms3PCuSrnI9+C32o6Wzh1BRJIZUol0LHORntoI5HwFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UCDce4x3tAavFOuhf8ArUHPk45Q9Adtwy8QpCMioo2XbHs1wfKvCK3C/dwBaU+e07
	 ARz27dUZ0XNtLXBTstG1gFQFeUaZIbZ7DdmAARscj6kkNa7DJnddWLyalENpi1A8N4
	 imaIsIHVuBjdYUGcNT33EEdwgkRQT93gOjMdTqgo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:56:33 +0530
Subject: [PATCH v6 5/5] platform/raspberrypi: vchiq: Load bcm2835_isp
 driver from vchiq
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
Message-Id: <20261112-b4-vchiq-isp-v6-5-711b48378367@ideasonboard.com>
References: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
In-Reply-To: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=LawGpoDpIsT4XigouVhGEr1vmXiXiOdrQJ9R/tQC5wM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aJs5zEducJpj2nvb2FspxSG+6lRvD/f36OVC
 TX9VDTHGAyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWibAAKCRBD3pH5JJpx
 RUKZEACU2G8TnCFID7K5PdtkUcDBrBKxCnqsVNzcL9VY0dmhQom6H2wI/1dbbaTPS4YKnhM+3A0
 2eaqBdCp0aBseAjTcG7kBshQT4Y0C1yaMSrtBd1pVX90HyfEvKSZtUDB7mEDyGdxfbrFOyKZLWy
 61v+PW0BySbyKDU9yF+CPUsjuCjniJCOLw2Q+w4xswwTAbLp2nqTobs6OLmHZv4hNq61JLU4Ncx
 m0eZSI1pfzCf8zIxtKrsk0HKM2aWd0ATC7jmlq7vFFzBgPP0fLtM3hSJ1M5RuglLqxq0db3dqbW
 MepT7f2MVAjfqJRAphk8zG75jeEn4NINl+b+9WYxpGFGwAOwY12R7iaaTVzxCiwID9+zm/Mv4i6
 5SrRMZU6lva+lxaR7jkNISejsp2bhShv4ynJV/8fTztRs+3vWYeu5rX65/Uj3yRrl95zMFyn37w
 Z+yqE5y0T0Kdfg7zKSqPpiBxOu5GQJVhmaCY8TaTP52u84HFPljKCR9mix1FR/IeZvHAIFcama9
 PgT313qncrWP5tN03jsNDQpTBRxRa70GpzIYrCcLc6+Q0yDu7oMWrTcYW2UBYFFMA6lWzq7gD/3
 iMsIhpGe+OloGNUuDUfBLGW4OinAm4Ud4l2fdympwQW27pewEouh7tjgUrCS2SLdtdv2t0Y4Fzm
 Zl4yVgmYTZr5SGQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Naushir Patuck <naush@raspberrypi.com>

Broadcom BCM2835 ISP driver is managed through the VCHIQ interface, so
register it to the VCHIQ driver, similar to the audio and shared memory
drivers.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index ec951ab19d67..f35b40bdd963 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1415,6 +1415,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
+	mgmt->isp_dev = vchiq_device_register(&pdev->dev, "bcm2835-isp");
 
 	return 0;
 }
@@ -1423,6 +1424,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->isp_dev);
 	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index d59837eaaa8c..ea1bd419e471 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -63,6 +63,7 @@ struct vchiq_drv_mgmt {
 	 */
 	struct vchiq_device *audio_dev;
 	struct vchiq_device *vcsm_cma_dev;
+	struct vchiq_device *isp_dev;
 };
 
 struct user_service {

-- 
2.56.0

