Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908304;
	b=j3HKxmb2NRQUHs/9dmy9rQsJXS4nmMYLdEkGWQBgngI2xtT2qDekOwcj3L3ia1YzwMsX
	 uJ0oiBoIgVB5kHXk9lyl1VvplTH8TA+jN7EMZL4i8mAAKWXDMKCjIAHF688u3qRYciCZp
	 aINg1xmmhs45aPM+mUQg92bbvIViPUXXtDSTt3M/mhtWmvjdgojbNr1r+7yqC0wHStF3A
	 8ABsOAcUspGFuFm0O6/f1PgwgW+yiVYn0rw9L5gt0aU2Sd7YA+NXjbnwB2+doH6LWMbUM
	 UdcJR3zvTW09PG1OeaT+zGvIgZojKDC7JDtxr9tsfDOorJARZ8MxtbBnrtD4/IyV1BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908304;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=sf9xmRkRphyVToFoOZV9OHW8g4eV4+0BZB1/eN8sGwk=;
	b=eFtcVfL8P82VAXU5fN1zh/CraoCXlUl5HnOjuxMwtv4xPl2UxaeYnIazW5NzZ85adioa
	 uLmAm8MhZtfZEETYwCyl3Sl6bZdgSQvFxASNIp/MFaBsbosS+TPfg8lOk37s4zGCHYV00
	 bLVLE/4qZEgPJsdidoFIOKm+Xia6E52cKSWjfXG7kpXlcV5N8BWNIp1n0anqqvYuBpmFr
	 5GuOSqd57Q12RQz7WuKMUAAP4U3ARJERRtINCiV8EIAib38w5dbBe57XiAJBY3NmG96Lu
	 v5gb90g5D3Bc4CnsdOQc5hbpCayJnbMksNtwv/5BuxiB/w8eQg0K4U7VHfxuXMDqT0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BSoJTKhP;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD65606A888
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD65606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BSoJTKhP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2011C4EDB9;
	Tue, 17 Nov 2026 09:38:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3B145FC81;
	Tue, 17 Nov 2026 09:38:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F04211BC1143;
	Tue, 17 Nov 2026 10:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908301; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sf9xmRkRphyVToFoOZV9OHW8g4eV4+0BZB1/eN8sGwk=;
	b=BSoJTKhPyCewKlL26koS2r0po1IAPc+dRY83uAh5CDRJGlN4RkwnQUqglKKIV32mW48dhZ
	hBCb/yVSzOzWbX1Vd+2iyuBDoOtvnqzpE5ojTdPdgPSfloGPcUnFM6XEka0m6obmXjpl8O
	1bmXcVTtug61TSqqlwQTn8Rm4w6Fm8v2TbgdiN5ct9d6mb4L6vDHsv39/aPoZctiG+Ev5Z
	DQMpqkVw3hSO7GNFoGXyYy73B2sK3tM9cxRP9knwGTL1BcbwkEaW497OtiKpPnnvmOmArg
	3yGd2A5vFIIQGz2Ms2K2hoMdEvuD3x/d0VeCtIogKqtWU94E5Kk2GepNlJ0rBA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH v2 11/12] mtd: rawnand: r852: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:49 +0100
Message-ID: <20261117093751.14988-12-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
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

v2: No change
---
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

