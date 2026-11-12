Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482342;
	b=yrIWx2zB9T/QIYaTDwAePwKbAHTTiaEzw9hp4x0XS8YmiUfWZufsuxxae21Ha+3hbLEA
	 tuJZF2FR4EZsR8/FAeotQVsjAJct24iLTOQGn5diMYlQYaHp860DBrxgBtxPRAiJTeZCE
	 nVxMPgt+Psn/UseDBzM3WEP6pyhWe+RubMnJXyK12PRfEQiMpbbdjJWyNBm87XDW+3eNG
	 sI6o8Bj+w2LFIPO17Lhl+BvypDGhw5v81+LyUOwVMfDCDVHlFtVu6CmFsf4uZX9SlUO9t
	 gcSb20D0NlvLIuAAlW/hn+bfcwhjH4YAOrSb6R+0NUo40lCuXtKe0CcIw0UktRxd1nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482342;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=J8kZ5mHWAEF4Q9MNL04JoTrDY4DRK49OnzPJtnM7hFs=;
	b=QMENXwj37eHkKug8vL29Gf2xPenoJ23450TTx7ZK+cDNCXD51k2UITKAkgO4ZY3+hlHy
	 nwsJoF1zMF4CYptR84O3eBm6rkXvLw8xw1/LnBIUoPw3Jsh7CvRBAzj3tFFsahhoGwDmq
	 vfPKjaolI/byquf9w9uyi4+YGq2a9dA6WUYQVxnJ1aCh6iA/4lRW/KAaYx4ER2unn5mWU
	 QyLJbTLUBz7jSq+eS3fcz677hBJZJOes+zA6yMGZRNd+qxKCGm8r9h2hydt47bLTaFRnp
	 mtrh0CwhV2SGwbd/7lpfKVKKLbAXyzTpPlS46MakUPx6tzF4Mw5FqDR3yFhjK/6FFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=l9SLFHo4;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC21C606A89B;
	Thu, 12 Nov 2026 11:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC21C606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=l9SLFHo4
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32F4333D;
	Thu, 12 Nov 2026 12:16:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482196;
	bh=9sTnIDhO75CSQfGHhJyHPnsOH/91apCfP7O0Mis4EWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l9SLFHo4mJzuRhleT/rypJeMDEYzigOpHf0U3/BIsuhsXS+vscV4Z9jBvJ/3EhD7P
	 rsj87ZSUWrDhqMteLIO9z9VmnUxpSlueZ0BlYW3JqxwLdM/FHsmdqiNPfznFCfRl9W
	 6zSdB5FIg1N8VyL4t7zO/qyqLfoGGVDYjJdjul/A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:04 +0530
Subject: [PATCH v5 06/11] platform/raspberrypi: vchiq: Register vc-sm-cma
 as a platform driver
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
Message-Id: <20261112-b4-vc-sm-cma-v5-6-d25e3b687e71@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=jmL2C9ZT4ymW/6uMtp071mlFSwkY2dVi+zbShm6aLoM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB53pORKP1sMzNVCp6H1GhsUgh3D1hQlBqjP
 qKguhxtq/mJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgeQAKCRBD3pH5JJpx
 RUhmD/9hfgA5whlF2OZWg58i2YBPVQ8dl0xEGPOxbzMCu5pBTgSzrlp1sw/xReawZqemdOqVJ1U
 qlEfnlRlK1pJtQjj3eJg5IscoVzd671BoAKxocT8GN2pklC9bXFIQ/uMlXOtYOxXirF6RTU9I1Q
 9zo2mG6JSOwmPeTjKMKeq/9NCnmP/Lnc1CeGj9yUna7cTBaFXnN/cNg9B+duJj4QHw5wTDpePY8
 zjyY4zQ480Q2oqjcH3vjkEa21VLJdR+gaAgx61luFJYl3llaw650pAX8tEaiQg7zBkxBcq1nyaP
 aq0pkpSyMo8kgeOdNsFGYvRBPjBY5PlA1Yyp/Fp0s0cWoFft3E3pk+jP2g2NfTTnlACE7kmuZa4
 qlEseM/65tP07RYVYuNGAvpjYsexh45isWzgO9PNFxF21crub5KYAEfqI9h0oHEb7NVCkMRpxQG
 LckW0L8b2vxO4EWAo/TOClHv4eQ4hyOKFTC59F8rojKFSXbK48Dx6yuqrwtCvo91sS4IhxGB90U
 wYizWwUMQJBUggrUDueIAxg3BI941fO1E8N96+rO3J0t1XOx7euGReKOfQ61Ap27ts82PDrMWxL
 Q/zD93XQX9nWAnK2LhCWtzMc3fN9QobxeoA8E4rv08wwKp7D3afxMTaR8R4VjBWWZE7plNavEun
 hzdq/xTc1a4C4hg==
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
2.56.0

