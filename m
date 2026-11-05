Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898776;
	b=UBQWZLOi0Ry2G4OJ68V6NLUvKD+SWuQ7fJZQhZHNBZ6QXC+b40UC5/SsLfFYHb7hWVQc
	 khG0IxIJ/rfqu7naY5LfqrWHk1lW6Yh007dVCg5CAJPVT64YkE7wrDIQNhbWvmPZ5uvUu
	 TTbtlncgr/Q1Qp3vH1qYDe16qt/pFioFGQCYOh4q/onhK7zOGRFVlk0pKDnlFlpdMkQqO
	 SWenRUrS9p/Nxu9kEac5voGJo0bK9mfPuFsMuecNLJnDwQS1BirOr9URRlSCwx+S6Lm8m
	 nyAiqbV0dpN4BpOtNxkRUxzc14GLLw/dgWALTzXi2CR0kPUW+P3QLCYsdD4Hr8FXZlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898776;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=8PIa3/LqnhRUlkjFyjWBQUOiIonW0lQDFF+oRiPf328=;
	b=jwYiNts8OrFjsu7AXYsQG2hlp5UO61xvWmoEgfT6RiFVjdvOeJqFap24SOEjQELXNQhp
	 O6xlUFV35zKQS+qLEv2u01/eCuvv+58nb9GHlP88V+/6l8rSWOgFvnz20hpmAhWBjtWM5
	 8U2LRaFqcU+VE7MPAz29xLTptrjXp4Eq0gUP5fZ4Ir9bHQj2gdPO+ZM4eKHsyRQZarDBC
	 UU45s0gM4ffcJdxIoCuWEkit9m6lhQZKM0yVe4AOPoarzIjzdhuvLqLdl87XhjcpeV418
	 lpGtPFwzG+biqe7b/nMj5/XgG3yGwjibhhD5exH/dhqYHey6xUQbayrWn5WW3ZoEM6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dsbX3SIh;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F083F606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F083F606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dsbX3SIh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0B931A0C98
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 815EB5FF43;
	Thu,  5 Nov 2026 17:12:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 000C2103292A4;
	Thu,  5 Nov 2026 18:12:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898773; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8PIa3/LqnhRUlkjFyjWBQUOiIonW0lQDFF+oRiPf328=;
	b=dsbX3SIhbPaJTb0Hf1eNWItEcAzavRCDMuSinp8qa0PSgzUOE7F6jCH+mcL78BRKvDh9+H
	D+PwIKooyltdG0fDBtuIGzHFa0ChagTeGzBjiuPQugvcvu0anQAD3DRtk4b+MYhhrXtSuv
	zd4TcYAol4F5eCyclTJyMFbBaa2T958OJZEAxD8vKXwI22mugUaPduLKJRPH2mZH+qbpg9
	9V8l16u4+NTiqIm2JgX0UdHM3/E1zWzL1X0aGAbAvJQH7hv22kruMO3HiI5Rvo+mMKfHri
	d8LjeOPaGrwXhlgAOsn3LredAgfllTSHUfoTNYchhZcYthw9Cj5R0pwUPkxvng==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 03/12] mtd: spear_smi: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:49 +0100
Message-ID: <20261105171158.399247-4-paul.cercueil@bootlin.com>
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

