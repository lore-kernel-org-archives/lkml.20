Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908302;
	b=W00A9CqVnVXJosBfJ37kfJZSWS1Cm6CTKiMOupH3Oyue3MocjjrJdMKw6kfghCBFDYoe
	 nzi3efDb7l1yIhKtspasWwIIx3hollaXQG3RnM+YL4TRyK+DRE9mXKOuD5tprHdTkUrW8
	 G/64AbEF1qZ1vvhCrb7Py4ov1MnngW4jpaVK5Qa2iqeY0ocjnNPFN5JmTQCBiK1VjCLlV
	 HyzVTx30TDVxqQKUf4y3hzhQJu14P/FhmoL44nzqAHewjbSP7hGvoLA0aq0QJCBYwFwd4
	 t3NH6aUEo/hract6ctOXkhozecI8yaL8GbcMBh88AwWq3bYOBtVuQkb6Sfa6749b0lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908302;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=mkZMJlvFsdTPHRfq55Zs9n/rcb6WsZ4+FI+m4sk8u6c=;
	b=RhA5Wk85osZ3qHwOVjLjhLA2kwMZ4JVkQwE7kSEfWSZJuW+6TJEY2glY4fJAbDEr7oYu
	 UBJuCh99qcMUyRlMO4NCoOSqq7Gct8GgdLAU7PgNTMDP7mAiHsPX+3Z1QUhrkGE54Dnq3
	 9HRelGaEOtR8bYQPNiYIxw2R2Pa27xI/Hnhz84VV8gxRi60HuAFvx7AE+OlzNp/m7OWrK
	 lVVj1uUFhxEZEvPusKIThnP19Now/HNowkQRIP4MisfsKDCzwiWC8mWx7E7T8bS33cdwY
	 mvory6Cb2lc4LJO1uUHoNeaC5uz4Aqt4X4mtjE5ZNVvTrjrGB06wNxOElsgjNQiOKJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNz1zWnR;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E212606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E212606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNz1zWnR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C8014E41146;
	Tue, 17 Nov 2026 09:38:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0B2B5FC81;
	Tue, 17 Nov 2026 09:38:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A94BF11BC0493;
	Tue, 17 Nov 2026 10:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908299; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mkZMJlvFsdTPHRfq55Zs9n/rcb6WsZ4+FI+m4sk8u6c=;
	b=lNz1zWnRE4JSNSZLC26MP50YP+jWpa1WLSxjtb0fqA3RPZvECe35jhudwj70niVx9ySB8A
	I26rIhF56dORH1f+mQkvQq+2iXY90gHh57PlT7uwySLwXkTMCloraE2Mp1EZdUqkwsevrk
	m6Yjd7uJi3aeu1F9Ftk2SVCWWEBv5Pr8rR1/iEdcaKqU5ELRPQSDmCYG37mOe+t5hpiNXW
	Q/VtRIrpc06Ctcrw9qU3/1O6A7v7RxABiCvLPMJA8oL+tZFViSQfEDJiVa+ANSgPWEtNLq
	Ykswoj/OWcgM9UhPK+6pJ40ZMm/gW3yCRm9+Mccflpufa8KFCdJuCkHSedTFNA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 10/12] mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:48 +0100
Message-ID: <20261117093751.14988-11-paul.cercueil@bootlin.com>
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
 drivers/mtd/nand/raw/omap_elm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index c1d19b8e6715..2e8ab20d8edb 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -428,7 +428,6 @@ static void elm_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * elm_context_save
  * saves ELM configurations to preserve them across Hardware powered-down
@@ -540,9 +539,8 @@ static int elm_resume(struct device *dev)
 	elm_context_restore(info);
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id elm_of_match[] = {
@@ -557,7 +555,7 @@ static struct platform_driver elm_driver = {
 	.driver	= {
 		.name	= DRIVER_NAME,
 		.of_match_table = of_match_ptr(elm_of_match),
-		.pm	= &elm_pm_ops,
+		.pm	= pm_sleep_ptr(&elm_pm_ops),
 	},
 	.probe	= elm_probe,
 	.remove = elm_remove,
-- 
2.47.3

