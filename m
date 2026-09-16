Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22CE4F30EE;
	Wed, 16 Sep 2026 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569359; cv=none; b=IXGTQd6+Pd0Ef8cJUsNcqjrDirr7neEmtK5EQyUfgLzfs1DbL4YbM58gDz8EeNwIf3kwVx84i9M5AEZn2EXwRAdgg+8MF3RVFD5P0J53T+YEqAtnF6KNWOj3Ipd7WyDrhyJ+eYHLYRB6tqec/xFgQgKMXl7rdtccXVf9lEGv4nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569359; c=relaxed/simple;
	bh=LGXniHRbm8mD1R6DwtDTLZS75SCRRae8iTN3HxKNoVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nBl8mRq+KAG41/MoW2ZExcCnW65xKgs622QxDEclQKgiRdFItQ+7+bOOX1awP4+aJLOfVH2Ea6q/sGV64x9bSHrWGTLtGFQCKy519Nt4TdXGsqIpHYEkYM1i7fgQy3PNcVxT/p6IDjqGPF9r23uObP6oDk75MumIKDhbt3bPWrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GE5JftkM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GE5JftkM"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1EB9558;
	Wed, 16 Sep 2026 16:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789569253;
	bh=LGXniHRbm8mD1R6DwtDTLZS75SCRRae8iTN3HxKNoVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GE5JftkMxmhhz2lRDKZIXSm0PBXhlbHIRnNdvIHHsBesYXeLmc7sWvRvHxyZP36ED
	 HNq7CwC9ByJcauqOJzZU/7M/9P3ETk9NfJV/npRRLlQFvWBkvy1LZLMEr3mdsOj01V
	 0BYXekESw3hJi7t+GDKeTCknGfoxckCgmL++0/hY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 20:03:07 +0530
Subject: [PATCH v4 10/10] platform/raspberrypi: vchiq: Load bcm2835_isp
 driver from vchiq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vchiq-isp-v4-10-f668c2017b74@ideasonboard.com>
References: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
In-Reply-To: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqkPGHKhZSGz3KkO+bqBLSpUtwSY9zj/n6CBE
 xfKPYtznaCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqpDwAKCRBD3pH5JJpx
 RR7pEACcg9dQeYGKbyZfRla+XIcK51Dnr6ZxZ46bqku4Rg8PFExwuDsZav487I0R4mYHPZimIrB
 9Y0oTvP8fkjHCFsOC1q56YtQKSjUp1IqGG7wr/J51stWPgeuRo7BcJaxiyx0GMmNzrFdhu1jvx7
 bF1zkMJFayJfKZLXO2mW0DaRqyFIKdJNt72lDJhKiBpekGbiZgyt5B0Jr3E4XfMgyrOf4+4TZ6/
 RipWhhLJAagzRt7scuE2hjc8WObBF6/kLeWv5s76Ent9uRYyXoIO65rsyvD5uKlbl0RinCk8JFi
 kL+lrA37og6Przn5bisma0+WfFHQc0S4Dn5x1cXPJmWjg9en8Qvv1VU79Z3bptENrQ7aaLTxBAF
 ephxCcSNaX/9xV4c3eo5rZIFUMuj6y+x5G2cDE+0/qHPnXj7i8qG4ZOB3/ZeDLJovj8fp1MWqso
 7E9kiolqfQubRPZbVCL+CB3pDeKEvPfQyhKl10OX16O3MgjFbnS6NfaC+W7CpADIYA2Sc3/qFXs
 5Jln9g03ouwELNA14cOWQBd1aTvmaVB2PirsfrMak4b4+nMz2eOEWShAIqcmGAlKh2GY4stjp3w
 emQpEfPS6Ic614SmLVWi0QfAMsx85OLeHhGByomVZO7M8iWUM/P2IKQsUOvVOlNePJQHeIxwn8E
 TJCF3BGCxeLoTJw==
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

