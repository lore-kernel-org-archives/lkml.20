Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908290;
	b=Ogaffyqb3Nnodf29FRANxVDKliKnNIwHzbhJe852xWx+nu9VgyL+RVZlr38VAacVG9Xq
	 1Mo1XoJszQI6ZjcX9SJICRISvaE9TJMhTFqDdVkJJZrDT5+KhhelDGzWfuiQOsruynU10
	 QcSesIleqZXPv1du+8BKW/LTjbvAV1ybsw8HcoYWdymsLHEsyELApKUcRkU0CEmBQvDr9
	 UT0jlIi+3ycePc8ADYK9k48CeupwW4QHu1LxWSTV+Iozem6UN4akxk5s4w8QNN+FesBhp
	 QvSZwvu/x9LsKVME4Bbwqm93SMqG7e3ZTgnuJcdDOcVsRpEeh6P73GYZZqKRhFVxunw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908290;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=zt+L2zvrl0xsIKg55Fyi5rBt8i3afRguaaN6st9GaVQ=;
	b=YLfXiBaUFQd6j7X/wfhaZLmD43Ny+bSdtLc/dZCNFpK45SodmedmqgcY/qpKAWZeab55
	 X7iOrhQ7Ec3hwOybkzrHsJZxREgZ1devIhhEh93+DW8GRRb6rhVYpwDYM3uNTr8mZ093S
	 vkQQpNBozySs4MJwT3Hlnqbb6Aom3em9upGp9tTfqgNLfZr1R8JR5/BaOXPtSK7Fq1lis
	 FZEHaV455eDZ/qbpiuY/cMZK3+JT52JZhYPmBmvr+HoJVkgkl6WjHxlsuRZ6n8Psu87z7
	 0NHFk9kWMpzonGsnP/Dv/Zaf7D+RNz9zdfMtrMvbaxdEKG2RppBN98t+Qjg9ReNbvrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kDnrmD3W;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995A606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4995A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kDnrmD3W
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 44B6AC4EDB9;
	Tue, 17 Nov 2026 09:38:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAB575FC81;
	Tue, 17 Nov 2026 09:38:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6674C11BC0DE4;
	Tue, 17 Nov 2026 10:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908288; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zt+L2zvrl0xsIKg55Fyi5rBt8i3afRguaaN6st9GaVQ=;
	b=kDnrmD3W+x2ewQ0EuCfxmSl7xRpGAc6G1HGyGvbRVetx3Kvjr8rO1qPEbb/08NorPNFDb/
	JemkhKkqFRxOi67XXT0C7uW1dabk0Crm3ith2qtdXt3XCBMmQUyFKskzO2R5C6gtFFUF7n
	83G6Qeg2n4G/HISngDN+rs/H5ZTNKDhBHMUcFhv5xO6K5FMab2kPi5LE2wm+EgYEbR2Dh5
	YLCeGpR/pnW6kf5kGvDdzN+JKPtCSL1GSqhtrTtbOSplGsKMulqjy70WG/n8545aywvrfR
	u2a2HrTCyOp29vFJpzVpx2LxOWFX+88pXdWiKaRbcX1/7vfzh8ArSe4E2WORAg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 03/12] mtd: spear_smi: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:41 +0100
Message-ID: <20261117093751.14988-4-paul.cercueil@bootlin.com>
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

v2: No change
---
 drivers/mtd/devices/spear_smi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index f02f96bff450..689141e525c0 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1050,7 +1050,6 @@ static void spear_smi_remove(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int spear_smi_suspend(struct device *dev)
 {
 	struct spear_smi *sdev = dev_get_drvdata(dev);
@@ -1073,9 +1072,8 @@ static int spear_smi_resume(struct device *dev)
 		spear_smi_hw_init(sdev);
 	return ret;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(spear_smi_pm_ops, spear_smi_suspend, spear_smi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(spear_smi_pm_ops, spear_smi_suspend, spear_smi_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id spear_smi_id_table[] = {
@@ -1090,7 +1088,7 @@ static struct platform_driver spear_smi_driver = {
 		.name = "smi",
 		.bus = &platform_bus_type,
 		.of_match_table = of_match_ptr(spear_smi_id_table),
-		.pm = &spear_smi_pm_ops,
+		.pm = pm_sleep_ptr(&spear_smi_pm_ops),
 	},
 	.probe = spear_smi_probe,
 	.remove = spear_smi_remove,
-- 
2.47.3

