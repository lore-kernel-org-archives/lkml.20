Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482320;
	b=l7l2Ja2js8bvIiLXPXyedZzhf3YR7e4RWtUtO2xa8qMom1SUgNHKT9BiP+fSBqI1oZEf
	 L1qyNTQpUq4Xf0xwDqBIpkTzIzZaAYD1tf+ge+HbaDfVQI98zljLRkGrmJnA72A/NvFcq
	 LfFdXl1G0olZ8F1j5rWjyCggS/5qxWjOrWlljlGhpbRh3jWK+AqjdQvF4yGdwfr3GV6Gn
	 WwRv8sZlX9lYK5hGKbGBaBiYc3//G/dFCqQLtaBq7pUBFAoRvCMAKlIoQ4JOrv9CE7VPK
	 wUiNk+jcShoozds8k8QxvzrNxAf2+zjRyQm3qL8HEnkQBs9V8hJY8lYnS61Fqbbfx6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482320;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YGGoHU9dAOYShEGvkU6XZ0apYU57vGD6UOS9pNC23i0=;
	b=Hkgu6TGy+vMdoGIT2lO4SSDc8NnqgWfRky2PgTavO6VGebTKbkaSoS9DI3peyaieVcWo
	 KqEHrmStEgUuQdjwTrv0pHMzoyq/2r0fGbKSYJDK/KImk/o/Gngcf3cu0NbmesA8VTl4I
	 abSjrGpWZJhODKWrjL7MO0tkvJVo0lV2TDzBbIsC9qoRsCRpCc6cCM/aItTp3SYlxBGBM
	 mKWHmvP0ZqZoAnZH0srvgpRHcXrQA8S1thuF5We69t1CMwrIMcgCqGnFTvWodPH8an/w1
	 QTAwkaLyy0GdkpfJgfOp7L6tB8SN7i9wcdVYdHADaFmf+3Bi+xaR7VYca6AdXeHaiNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=IYXjIa3O;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D8606A31C;
	Thu, 12 Nov 2026 11:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 418D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=IYXjIa3O
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE72033D;
	Thu, 12 Nov 2026 12:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482175;
	bh=OsOQIJiVax+Tbfla0Bdcfl3qYG8+xVaw1F8Q9ccnoLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IYXjIa3Oi+ji3VSlmuRALBBsvJXeGMidFeO2e2QG/YuzGotRoogtbxnG7fsMm8rM/
	 JSFaRisrBgLhe/Zrq9d1E33zeJuFbSx31bYgcsd+VCUk4ij0K4oqc/bjEGDbD8P3Pk
	 /yr7yFtqQpRlJUG/Xo7ONira9amC5zKKRxHeLt3M=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:00 +0530
Subject: [PATCH v5 02/11] platform/raspberrypi: vchiq: Store audio device
 in driver management struct
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
Message-Id: <20261112-b4-vc-sm-cma-v5-2-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2827;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=OsOQIJiVax+Tbfla0Bdcfl3qYG8+xVaw1F8Q9ccnoLo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB1PgDWWJJQr5w0diuN4G+eVvYuNkQXYxZ+5
 lcllLXzJyqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgdQAKCRBD3pH5JJpx
 RZ7dD/9otiVv+jaxm6xZFK5V3TQ9979pvEkpYFOoD+40G3amFhrpPrSUFXX0gloXGms0MIABdpL
 /3tdXrMk/nqRjvFypAe/xpGm8n9ymx4GYKfKkoQYYvQXRhRLM1WgRQj96wWcLiaL/wUVxxKn4E4
 r4nrg6nzPaZTbEkSrIyRK3iR90haMOdCeN17cFDkufn7G7Uw2kqh+zW1yLsUuM3FeoYuPon0Dbq
 gow1QRBubqx+eekJR1TFDLgZQg8M74gYhFllAxcsu+nuEj+S3DjFDcphlRFclYHLbYG0WKo+GCR
 y6oCEX2xQLDNuAGZJvHIHV7qWuPjl0Cx7TqJaHu7YdOE902a5TPeIMS6487Rm23OxPrCAZ7bZ0f
 jREaalcT/RlVIS10har2BcI25Jxb5udIlFDcKfXrOABb+QA0XWTBNI9QILqbrJTj+m/J8zWKBbT
 duoHpwO7xkhwcL9aYIQEZLV0WvZ882qj6RObTetpAFBhsFsTpe+RWNax4agWvJ3osUeg8hpNVBW
 Q3gG7rCpwnoW+FURckL5kiPT6TY2cfuh/YANfjyb88+SHS1K+AjALVJsLH7iW+XsR1ZZz3nPRtT
 FbhhBzFnm5YgrhD/mM66LrG5QLN1dOHAM959MWGZGYLAwSBDx704hHACp5NSL5YZ5lvNzqaI95Q
 1B6ZSkfEcLU5zvQ==
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
2.56.0

