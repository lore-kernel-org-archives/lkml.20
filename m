Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10D44A99C2
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149496; cv=none; b=OwXRvoA5wxizQf36lvU1/9QgfoUxUPC9rYORx58Kk7N8+1xkA9wEzvGmct+3DARp71qgzYDZr71HQlJLiaHTgmmrID0OiO0AtUtQL5K+11KgDIXP6+Z88APmwcRKiGfoS+lL6O+FSNJ2DdbqO+objrtmo2LvaFyAi83vZ+W22jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149496; c=relaxed/simple;
	bh=0uG/QAY00mH5RLxPwgYJVKaylNg99Wwq5xwv5ymXOcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcPhqsTtmYWrnzHVd7DCsjtk6T4BvT4HX4qI4sNL/y04kxpg19jBFy+yCj6bvd0Y5LOPHlCzjSnCeM9eqcUZtVuOg2N4ryUny1JZjoybeNLGSzwcNhFdC9M4J1SY8ggzrdpLgdGGdY4WH7xlAnf1AWMLLoUUgK7UlWOfEz7ZCqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cdZpn0Su; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cdZpn0Su"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 88DD51A113C;
	Sun,  4 Oct 2026 21:31:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B074604FE;
	Sun,  4 Oct 2026 21:31:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83DAB1032820F;
	Sun,  4 Oct 2026 23:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j/cXexyZ7T30AM1csq7xc9wIhMFboTJ8migmpErDMkQ=;
	b=cdZpn0Suk2175DuOpUoBj0L1farIc0btd1RLCRHK2nop2aFho0iPl5XKYxsytaGfgzGKhx
	6tHotkwk+f091GI1bsBf01EhqlG5riJUPtwUyXhZHpUDmJx4YV7gBHp4oElWqv+PMHQryB
	qP6gfES39Xa6Fm2Y4VoGCsMs8uY2arHG5T5raTKvA9sabAKJVDjWAj8+YKmKl4psfofmGi
	sjZ/wLatCBqm9rel7ltin6+dsEUmAhw2A+yNOSvOPAXCAmRe2tPesNqStFZvFUqvCqEo0r
	tP6ZrrOJIfkQDHjEhLI2V+tpDXnp+ouLvrXQt+8MTPUs4WSO7WzJ3GMKxz6nKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:16 +0200
Subject: [PATCH v2 02/17] mtd: spi-nor: swp: Fix SR2 initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-2-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The purpose of the original change was to make sure the SR2 buffer was
returned initialized. One of the goals being to be able to compare
it. While iterating over the implementation of this function, I believe
the return -EINVAL that was initially there has been turned into a
return 0, which does not completely make sense since we already return 0
just below.

Just make sure SR2 is correctly initialized when returning from this
helper.

Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 7e667e4ca84d..6c56fda3913e 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -223,7 +223,7 @@ static int spi_nor_read_sr2_careful(struct spi_nor *nor, u8 *sr2)
 		 */
 		*sr2 = params->qe_mask[1];
 	} else {
-		return 0;
+		*sr2 = 0;
 	}
 
 	return 0;

-- 
2.55.0

