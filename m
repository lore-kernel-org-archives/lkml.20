Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908298;
	b=N1vf/NCL1n89YjvJcv18e3Yfmpy4g/P9r1XJibhIRqO4SzfXIFfM1qZD/26N5MAiXX1g
	 SVK38fHZDqq5x6bdPFQ198A0KZbRI7PuaD5Mmbg3XyGm+oFEN26xR3jlhUx2FOw3EAcOx
	 XBJ6kruUeHw8BByxw5RbUP/YpGdZyhiQYt6LxX6EOa6UQ3h0He+8wDwrRhL4598W/QIg8
	 uQAPUMZQonyK3jdf2/upuI7c9AiwBWyBvcUxxSge9lB+VGmM+mwZhxpvhxkudpRweqsis
	 HD7su/2GCcqMOEfRA+xk9c4w+bTqJUZVPAaVMvGMYIPdPhOT8pj7mL6UGv4V6PAzhOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908298;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=G7ZGUNKDKBiHHSlHeQ8b7D1bEj8qPHL+frKQT5rOdyY=;
	b=jd7ukAO8FTtrNf8uUO1hwRyDyXGs5fSTllrnJMNtXbbT4cYIIPTZSWeqh8T6etniOlSb
	 7b55E97S8XV4HupjlK5zHUb0fa0eA+7jV7gIoXg1ljDbQS/UqX4y5Ajxuz9nicMes/oWA
	 ezOGjhhZGiqHjYHio4tj6tNKqo/1TiwN6OvK8HO33aWxw07am2cf+4togZm1hB2jWHKN1
	 s9ES/70JJrR/1MIEeq26H+QDZIoVXhJdE6hgR54HzIFlhgFpb20+y6RMuldge5RHJ5LIt
	 y9C+gwLRQhy2yf0yWHHHS9pUuSJX4P3aycrUI3XFGDOcf9kdj4PhS953lRV1GUgf9Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lcbRxdJZ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC5606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFC5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lcbRxdJZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 849EE1A159D;
	Tue, 17 Nov 2026 09:38:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 545475FC81;
	Tue, 17 Nov 2026 09:38:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1F6C11BC0DE4;
	Tue, 17 Nov 2026 10:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908295; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=G7ZGUNKDKBiHHSlHeQ8b7D1bEj8qPHL+frKQT5rOdyY=;
	b=lcbRxdJZk7QgZUQrOcUg2TNdNWHo8QpPQTTSOA+dGllOz0LefxrY63/FKfPcdCuwddcyBO
	tSjLG32FwGYiPMdmzUKPBXWqvJyf9lxnS4/zQmJIGThHFfFYze483/j8CKcZCnJ4sKB8V7
	CSsOKohuA4FfqOVX3ojxkOKY3q14mYEOell7FimRKbsQvlGU3EI18rvbgIrsRY3RnAB9OZ
	FuPO32nwywkoszk9VY3PHtVUczj6tYbnXDLVJhTPMAJe4EPvi7CHMq4r0CHm7nJqPgnoIj
	iVSBjrq6nGmBpPjJKuaq6u0tg9BUBbwJUwh9hLI5JIajk7Qw9DquqSHeqEbrSw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 08/12] mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:46 +0100
Message-ID: <20261117093751.14988-9-paul.cercueil@bootlin.com>
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
 drivers/mtd/nand/raw/hisi504_nand.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..511d133ea936 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -809,7 +809,6 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int hisi_nfc_suspend(struct device *dev)
 {
 	struct hinfc_host *host = dev_get_drvdata(dev);
@@ -842,8 +841,8 @@ static int hisi_nfc_resume(struct device *dev)
 
 	return 0;
 }
-#endif
-static SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);
 
 static const struct of_device_id nfc_id_table[] = {
 	{ .compatible = "hisilicon,504-nfc" },
@@ -855,7 +854,7 @@ static struct platform_driver hisi_nfc_driver = {
 	.driver = {
 		.name  = "hisi_nand",
 		.of_match_table = nfc_id_table,
-		.pm = &hisi_nfc_pm_ops,
+		.pm = pm_sleep_ptr(&hisi_nfc_pm_ops),
 	},
 	.probe		= hisi_nfc_probe,
 	.remove		= hisi_nfc_remove,
-- 
2.47.3

