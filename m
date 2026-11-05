Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898775;
	b=0lemIVizvUA6ApDTTzsFc9w8pvn1x1TldQ0lpE/oKpvHrOYYx5rpf7P2z93oYzXO8Jl8
	 nQEDRCXw0tLFu5diuPMiIQy9ZqOehFDX7HZlpIJMzktLjE9M6kqF8CC8/vrPnzHDwmopO
	 LxHJ0OAWrfDdhKYLQqjg6ZMX7+53V7yhHF3BcQIvp4AJxB9VX2EH2HCnQHHfeh3566A3y
	 VV6gcVBFzckj9TIXTaJ1zn0NVieiQGdQDfvys0F+Kpo+hPO5sht5ER0EqlZ98hKv/D5Eh
	 WSoEFCjOze2ny36VExQXgafpNSoCQM6/H/Bivq9hW/btrkIzg/a7X3NAK7ZDznjYWtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898775;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=wmNMQ1rsb0YZf0K3Hhzn76ME2eJ3SKH3TWsuBCeSig8=;
	b=Q6jUUam/TxDv88VPJDkoR8Q/HxIqO9OIGwdSMwNW/VNjgDAj3Ex5Jt6zAMAYf08YY8KK
	 ImWpNA7xDJO8pAuihwq5gD/v2BuJQ9xhfo/iWli5mCed4Yx19NW2wrNZiIFf9HA8S8KDg
	 agXlMsNa+8TQJxI+W+J2W5qJhlH+6FMpJFdqEGJzT8Jm4UmZcs6CMTmPDDOWfQazi7PUs
	 NaRAgmS4jvY7dY7I62nayoMfMNgOt6xSX/MzhC9p0CgIbc1oi5RfYJwklpgI1p8Bf8VQh
	 LgrDqwLQhEwuV2Su19vL8KS9sWKyQkzhXOieAej+xmUS968j0dYUEPaxh0pynu2lHxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0XyN17E0;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2E3606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC2E3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0XyN17E0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 73F9E1A0C8F;
	Thu,  5 Nov 2026 17:12:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4993E5FF43;
	Thu,  5 Nov 2026 17:12:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFF0B10329289;
	Thu,  5 Nov 2026 18:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898771; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wmNMQ1rsb0YZf0K3Hhzn76ME2eJ3SKH3TWsuBCeSig8=;
	b=0XyN17E0E3NvcPkfm4vUhi25oAb9yH+bibcMS006lPYpFR9IjKkb9MpRhgvXvCXjtcruyY
	mDJpZsP04iqtArI0dPfgdiLDpkWH8mPofNIHy2WRFIZHJvYc8Wv7tlfWsOWYWQ/E47LBbE
	mDDkxX7xd7UJH2ViD8rlc7Wy0D6zvPR875tApglMIOdj+M1Rz1qoDWetIFEFMhPlfhozfZ
	As0eE8VN5BEQa6R1XGMwdHC1J8mtJ6p3K6rPU/PlcVo9v0TJz80SxozWRSqdY0K1+vq6Dg
	m/lisCEGCVcWEJa724ZfrvxUi2r27KGt5OcQrPLX/RV+CltBfYp+SWPmzvQWqw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH 02/12] mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:48 +0100
Message-ID: <20261105171158.399247-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
Cc: Stefan Agner <stefan@agner.ch>

 drivers/mtd/nand/raw/vf610_nfc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..d785c3d28e51 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -906,7 +906,6 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int vf610_nfc_suspend(struct device *dev)
 {
 	struct vf610_nfc *nfc = dev_get_drvdata(dev);
@@ -928,15 +927,14 @@ static int vf610_nfc_resume(struct device *dev)
 	vf610_nfc_init_controller(nfc);
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend, vf610_nfc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend, vf610_nfc_resume);
 
 static struct platform_driver vf610_nfc_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
 		.of_match_table = vf610_nfc_dt_ids,
-		.pm	= &vf610_nfc_pm_ops,
+		.pm	= pm_sleep_ptr(&vf610_nfc_pm_ops),
 	},
 	.probe		= vf610_nfc_probe,
 	.remove		= vf610_nfc_remove,
-- 
2.47.3

