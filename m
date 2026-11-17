Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908293;
	b=MeP2wcErE+XzqZ0FZyeSh3iettcTWjKxb+q+Fz1mKwVADSFt1+y8dN4QfQ8zLVBhGu5h
	 k2rtzQXZP72JdQwaDGs2rz/hPF22wXQgkY1HCvYmMPBZpDPOOFDTng0XLpzlYRCWmw+yJ
	 gH1FoCDNo5h3KgnRRJVk5MKyh5znA5nUnQzfAEoqwFMN/okmVw9jV4+w/L9Vnfm7LahC6
	 wWYIMPylGfrv/OXdGi6TSAwDGGU+XdnBXOXbDCUpm+J2y5tSYyXBw1hWN/+mub3s/Oxuj
	 mx2U5zUoISpxRgF3zsQBFop97mgtARLcShTdaNSi1ALh8BQjIzGCw93u3C0/AoyUYBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908293;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=U2zcWgafVMtElah9OWy/kylKC33TgfREtsEF6Thc7FA=;
	b=RnJlsDJiLDBzzQKuiALhxd6oo9InjZbKLnGLruQXz/kNPfdpwOHzrZmVYMcBLbMsV+YC
	 Z4O9GnUBOCeGqCsLLc+UDOFEGVhliEs+sZzxSNeQBqNT2paJzq33uJb/mHgMJRLAcDYH0
	 vUikCep6c4yrCe5Lrra+TqKdwkyiBvCP2cyO+EjByQ2YghObT05PbzANUS8fDvKEvN7MG
	 v3PqY0g3sWtvuZUqaTBGrRz2Wa81yc3nCkyQlLny10L0RVKLrS6n8CtT97jFE4MgLy98+
	 8wLukA8M7gmqSTC5N/qJAn4YZX3XjHCFSzyKspxSN29F7pnSp7hAtPirbmuNp5SdcjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ueAEB2tx;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22099606A88C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22099606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ueAEB2tx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CBAB64E41146
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99DED5FC81;
	Tue, 17 Nov 2026 09:38:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1626611BC0B8F;
	Tue, 17 Nov 2026 10:38:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908291; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=U2zcWgafVMtElah9OWy/kylKC33TgfREtsEF6Thc7FA=;
	b=ueAEB2txuOpQc6hJtPTYIDJytq+WC/AKQ6UL6eZNHAv35k1fmV9ANNahZT/Ec+aWIA7x60
	uk2/NLXmVdFlL80/hd1/SYRQ50ibwIuIaZW/DLxXixmst6ZOolMLLSWHwavm8ic1OqWxwp
	5iNbulW38qARIxWBF/GV28LuR727OJkso60gAJ3FLmKBLqCq6V9s1vSqfG7tgdqQ9c95YH
	dGzpyAe45MgrsY7BqrxpPBhpZyAx6BLqqMeju3ko5NUqUFovdH0lJR5b0tSvDE0+PMfUkj
	+mEis+LemMM0w+W9U4PoiaVCMtfnj0B29tLyeuffQ1feYLFtuKHNi6rDyboLVg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 05/12] mtd: maps: pxa2xx: Remove #ifdef guards around shutdown callback
Date: Tue, 17 Nov 2026 10:37:43 +0100
Message-ID: <20261117093751.14988-6-paul.cercueil@bootlin.com>
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

pxa2xx_flash_shutdown() calls mtd_suspend() and mtd_resume().

Unlike what their names suggest, those two functions aren't related to
CONFIG_PM, and neither is the platform_driver.shutdown() callback.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v2: Don't use pm_ptr(), and rewrite commit message
---
 drivers/mtd/maps/pxa2xx-flash.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index bc303a9909d4..5846e09cea37 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -111,7 +111,6 @@ static void pxa2xx_flash_remove(struct platform_device *dev)
 	kfree(info);
 }
 
-#ifdef CONFIG_PM
 static void pxa2xx_flash_shutdown(struct platform_device *dev)
 {
 	struct pxa2xx_flash_info *info = platform_get_drvdata(dev);
@@ -119,9 +118,6 @@ static void pxa2xx_flash_shutdown(struct platform_device *dev)
 	if (info && mtd_suspend(info->mtd) == 0)
 		mtd_resume(info->mtd);
 }
-#else
-#define pxa2xx_flash_shutdown NULL
-#endif
 
 static struct platform_driver pxa2xx_flash_driver = {
 	.driver = {
-- 
2.47.3

