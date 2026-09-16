Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA20521209;
	Wed, 16 Sep 2026 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568791; cv=none; b=uFcrF0u+tanbDkL5CILA15KFQud+EDVgaAhFZHMC/immpR1XrQf49yG75HPE7mV+24iINLSPM42whYKW8omAuSewl/j4h+yCCW5uChtm2bWXeQw6lJmf1EJCEvZyJLAmspV5uzTqRdTZvpPytgFr/U2mcRfC1LG9NM86tXRTLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568791; c=relaxed/simple;
	bh=GRo5Rpd7fq4Kf9n2BeLURQagh4yqnYCAIchRa+iiDVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yi35SuvIJ1xbLEf1lrnDJAOZOVNDe21WIcbza9pbJmqqdyC+mSqOY7Mm5MpOdjt2dka0YEc/qreKavIk+HxmY2h9MJ4p0tiv1G6yvOJFM+yB/0bgsDw1tUGBv4StKQItotNHyJmJ7u50c/y4CxTfW/iLV0XLl4ZjCBbHmzhlR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NcW/LVk+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NcW/LVk+"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09AB558;
	Wed, 16 Sep 2026 16:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789568685;
	bh=GRo5Rpd7fq4Kf9n2BeLURQagh4yqnYCAIchRa+iiDVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NcW/LVk+IkOH8U3LzFD+7oVPSJpjmxQlOrFWcNMoLDKRuuvCT9so2+67J2wufRgX0
	 5M0PkxtpIhZQi+17n+yXawd8VpkpYjESfaLzobqgvfKLiMVwUQDSGc74whrA7OxMEO
	 +Uk+oWdO0XyXmorhznI+qGLzKagyNkBvi4zFeePU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 19:55:32 +0530
Subject: [PATCH v4 2/6] platform/raspberrypi: vchiq: Store audio device in
 driver management struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vc-sm-cma-v4-2-476d1142b5df@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2827;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=GRo5Rpd7fq4Kf9n2BeLURQagh4yqnYCAIchRa+iiDVo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqb9VTmiOj9+jvb7zupDS6s7vFSA6hV3rnGJr
 CAFUuC9NpeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqm/QAKCRBD3pH5JJpx
 RUKuEACSesiJDODv/1eqiZ8PRp9YjGNnK8mqJpQYK44TkJURz9snMH52plxW5g0pDrgrtBTwVEi
 A7q9CP+gVb+kmhBSwPEVfPk+xflPsh8WBMUILXRKpGnTKS5OmdXSFfpKautHH0KTf7N+Q+h3C4V
 CgvNoqP1HxUr0RVFpD2o4s5LMMIzgGZNzuDvPOqqmDdsSzl6+aSTFwhpoXwev/UtrgTzixcl3gJ
 k+DQV804SCKenokmmgr7NKDT9NKa+QitxZhwpu7+qT4807FjXSJUwdBxpZ5HpJwTdaEdMMO/6Pb
 kEMw353FCtmWO87nGwpw8Oa7YwthoK3rXewi8TmbDFKk1FnMFwfB24O82MFWiLmfNBnK7zFMYKH
 HXzxxB900wfhsxrgYWo2TA+z342QVI19le5/7v4pBWhyZ0bqjMwK4YmNd40sIa368ULZ2rMaPql
 rsl/KNNHCwrEDU0YfyG87Hxr8qyYCvoghJmihjTc+EKxb+T65kQiPriFS15ZWcgh1erhLqA1q4C
 P20wlv4/lJjdP5an+2Di12ckUQzy1hZMo82pMRd/Ba7txXTB4j2OSUukNv4Y0NcnI5HDRrlJhOj
 BaWTKIAQZHz/ZrX07WN6R1RRD9U6mf8wV4Szu2my8vJTHdvmV4VvWfsBPxJ6tybx2eTFLDWxb1D
 hihzHaBXC8vJiDw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The VCHIQ firmware devices are not discoverable, so they must be tracked
manually by the driver. Previously, the bcm2835 audio device was stored
in a static global pointer.

Move the audio device pointer into struct vchiq_drv_mgmt instead, so it
is properly associated with the driver instance and lifecycle. This
avoids global state and makes device registration and removal follow the
platform device more cleanly.

No functional change intended.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 11 ++---------
 include/linux/raspberrypi/vchiq_arm.h                    |  8 ++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d5a25033a261 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -57,13 +57,6 @@
 #define KEEPALIVE_VER 1
 #define KEEPALIVE_VER_MIN KEEPALIVE_VER
 
-/*
- * The devices implemented in the VCHIQ firmware are not discoverable,
- * so we need to maintain a list of them in order to register them with
- * the interface.
- */
-static struct vchiq_device *bcm2835_audio;
-
 static const struct vchiq_platform_info bcm2835_info = {
 	.cache_line_size = 32,
 };
@@ -1420,7 +1413,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init(&mgmt->state);
 
-	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 
 	return 0;
 }
@@ -1429,7 +1422,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
-	vchiq_device_unregister(bcm2835_audio);
+	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 	vchiq_platform_uninit(mgmt);
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index e32b02f99024..541b4efd64d9 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/atomic.h>
+#include "vchiq_bus.h"
 #include "vchiq_core.h"
 #include "vchiq_debugfs.h"
 
@@ -54,6 +55,13 @@ struct vchiq_drv_mgmt {
 	void __iomem *regs;
 
 	struct vchiq_state state;
+
+	/*
+	 * The devices implemented in the VCHIQ firmware are not discoverable,
+	 * so we need to maintain a list of them in order to register them with
+	 * the interface.
+	 */
+	struct vchiq_device *audio_dev;
 };
 
 struct user_service {

-- 
2.55.0

