Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898786;
	b=SMP1TOmUqtfiHxM0Qss86Ih8LEqqpxMF+Rc0BAfQVvd2EeMza55xIdnRAvD9KrfVWOPm
	 fotVQbewo16P0zLzuXcDGJmstzWtKBw9m+X0M/J6yHrI7NG+6ttLD9LZex9ohQC3LSd9t
	 LpvrCMfj0/5QRl1Tad6U8Z0ifVp6SRvJXmE1+hhCYtIag0CpIqbuUwfHmKvey3MuBUzPo
	 Px233oi8TM562PuMIeUC4o7uedzm1WO2oFqDM7PX7TqVDPsCcoP7t05dJ2DvCSYGHg9jL
	 zE33HE14DKbVzpR9p5bRiWXUfseOKG69OBn8SDMZNtlgwC1n5qO106r7g1h/cOCfw0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898786;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=FXIDIhqGUu1xBX3WbOi+XdfAuCLW4ljHhiqr3VGReV8=;
	b=Bh/lVrfWOWF5Z879e8G8QT0kYHEI1Z8tn7373N2EASO8atheAbgGUr4qf6w+yWRw0opa
	 YGYuHzjRXiHJSQNrfoT34JHQev062z9QOgrfNicSCXlF2HYqBEDMwz6GtvxrE1TWSeBfl
	 oAyII0JBmMMtEHuZbrRScCgDq4UPUkpiyPY2IFTf9eMZMb8nKSZBZjIHPmyaQZYBmR+yw
	 wPHUy0OtlND7mmk+VQOVxl7Jm+PjxEE4ex0aA99zJgBym8TrKRFP7TQyCDU6cBIGnZd4w
	 kPNvxktGU6zybg5/6G1X8AzsaxyEo/ERYipJdANqX/OqZB1Q7W/CFSLleLEThqqXnuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P+Pp4GZ9;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A2606D831
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65A2606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P+Pp4GZ9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 650E01A0DA6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CE8D5FF43;
	Thu,  5 Nov 2026 17:13:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5812510329258;
	Thu,  5 Nov 2026 18:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898783; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FXIDIhqGUu1xBX3WbOi+XdfAuCLW4ljHhiqr3VGReV8=;
	b=P+Pp4GZ9MUGYPnrE+jSjz55sh2HLfPEUgOkG79/wF/2TOtzV7lLt/PGQbI8TlSYKW/cK+L
	pTD6Q8Xpd41YVnDxvnPoXPQYHYRkGHIFtlk9Wf6z0Wl5IPKtFGhc+LrkM+a2uDQThchbEo
	6CwV5H2BoobQzjiNuxSBFYWFHC/7Z3w6QJu7PVppTAjoyQ/iBq6U1B1WqKmCglrRYDpm38
	LOiNeSwoSGGC84JqXfcmXcXU+PW74m8Uvk4/ur1arEmTS32DPl5lQNM+i8FVE8wCK3YCAb
	yk5pWYKPbnDuYays4eKvJcGigySgTSawJ1w0MMJAnroD/Q4+KCklO77p2VHjEg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH 11/12] mtd: rawnand: r852: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:57 +0100
Message-ID: <20261105171158.399247-12-paul.cercueil@bootlin.com>
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>

 drivers/mtd/nand/raw/r852.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..c145eb8ac29d 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -1013,7 +1013,6 @@ static void r852_shutdown(struct pci_dev *pci_dev)
 	pci_disable_device(pci_dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int r852_suspend(struct device *device)
 {
 	struct r852_device *dev = dev_get_drvdata(device);
@@ -1066,7 +1065,6 @@ static int r852_resume(struct device *device)
 	r852_update_card_detect(dev);
 	return 0;
 }
-#endif
 
 static const struct pci_device_id r852_pci_id_tbl[] = {
 
@@ -1076,7 +1074,7 @@ static const struct pci_device_id r852_pci_id_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, r852_pci_id_tbl);
 
-static SIMPLE_DEV_PM_OPS(r852_pm_ops, r852_suspend, r852_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(r852_pm_ops, r852_suspend, r852_resume);
 
 static struct pci_driver r852_pci_driver = {
 	.name		= DRV_NAME,
@@ -1084,7 +1082,7 @@ static struct pci_driver r852_pci_driver = {
 	.probe		= r852_probe,
 	.remove		= r852_remove,
 	.shutdown	= r852_shutdown,
-	.driver.pm	= &r852_pm_ops,
+	.driver.pm	= pm_sleep_ptr(&r852_pm_ops),
 };
 
 module_pci_driver(r852_pci_driver);
-- 
2.47.3

