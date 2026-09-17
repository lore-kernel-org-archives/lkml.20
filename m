Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8487411FB3;
	Thu, 17 Sep 2026 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633605; cv=none; b=W7oOscgMDBEpe0GdAr/N7GG2oYwZm4K0wb4UbuiqgGOJ2H8vJc3fSA770czAGdOkQoqnAf0TtyJd2p8TtVqiXG3s39YlyPTRyqCHX6o75Yknt/1s1xrVyik4sCerWLfr0Vigi3L7/WOUv7eK3Lx130gD5gyDwl2uIpzAL24CBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633605; c=relaxed/simple;
	bh=LGXniHRbm8mD1R6DwtDTLZS75SCRRae8iTN3HxKNoVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtHqE4yn/qrXLgsvYASm80riX/XF9Z2bh9zahcvqnaAvTNh5+BtUGX9IBEbLjjhS8k71wAXUswa8dBufFi5bpQyu0kmK7eYKBX/gisg939L9sBObXeJnxYATmY0OpJqL+VtY5PB9pXuu3YrSmHqirctVtfs8JSao94ACrniz6z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=la7P5kJQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="la7P5kJQ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BC6214C2;
	Thu, 17 Sep 2026 10:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633454;
	bh=LGXniHRbm8mD1R6DwtDTLZS75SCRRae8iTN3HxKNoVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=la7P5kJQHSm3Q77aAxNlEJa9py1kWa90p91m8oqIfHth4gfM699l4USed3yGU4U14
	 ypN1QwNUMFfNTml1Ktw92y8EreHaGMAaiP2yNRZemXAO8dJ+9Aa1J9EWqJNmEJqAqc
	 brs/JbLATW/vQsWE7H3lpH+nMcdXZWcZDq4sIZK0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 17 Sep 2026 13:53:16 +0530
Subject: [PATCH v5 10/10] platform/raspberrypi: vchiq: Load bcm2835_isp
 driver from vchiq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-vchiq-isp-v5-10-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
In-Reply-To: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
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
 bh=kdcnF991dp+5AeQR5W2Z04//jeMR9O01a86oQBDiXeg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqq6PXzL+g6NWLAjXKhPxBDheb3g847mgWeBhco
 IIumjrW4uOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaquj1wAKCRBD3pH5JJpx
 RRCdEACrNzqTdkbgn0z5RI58Asm2nVfBXZaO3IdWqm5y1r2hcn3nSZuF2o/vmjRnBP3Is6zaR5x
 ibxMbeZp7KtuNt95gkJbmHbRXJlJGfYzQrO99jJl9LCJ/xfDvcB5BGetlINfeRqMq9cQuMvXzJO
 +uU5sR2uwcQa520u7QIAWUaFnqB+vhOfDmhYh+OCeFjE0B2CV2Z+WPw83ARzuc8/O9k3waocR1l
 vPHUu843ahRA3z37kYzKIE7jL/fcFiGFpAu8Lj7zJVDOn/Hhot9enK8qD3IqFL8CCyRbSOESNo2
 njDtxl406llee9VV2TU6bTjoPCtAdltrc5ZnXcP7hVwttFow0Lnj7mNyngybyJQG+2clKYWUXKU
 kMliyyCBUIyqrbmJjEIdv0zkBlEn3Zs6ww7FWGRw7CHN90RJPPdqe0gLpbha5W8JfmyB46ORlJ5
 tE8wVwe0MK3NEjToe52Sdbexk9m7plEWqDhLJ833mVeB2z7aA/AcRRyC3SqXAWLZzRr+K9MgrMg
 kmBymdfd0srJ04AysBlEwHATArmo6A+v5MoraP8ahSquInWZk+kF8xo7gRyrce4+WZdP1ZfMiTN
 WgIPlBGGILR//okgTa57trH7n7sbps4wjDn1VYC/IO3lWwUxlznPAK1Fn17Ut6/xO91ctBATeIJ
 QGaTWeoMgQ/g6yA==
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
2.55.0

