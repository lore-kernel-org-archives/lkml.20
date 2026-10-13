Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0FF51C054
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909285; cv=none; b=HiBsh1J1VctMkzGpS4g2eGD3q/+LYb0XvCOp9rQU66G3YdHU4jbnGPFOpGWggh5S9lm3961knHYNeHpilv/xcLdQxbpnBxQwF8to57mQcPzZXDzjCsIxudgz063DBZ3kJEVwB9pvYrtQStWCaDJtMUeORXs2qHmOU72N1K2eZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909285; c=relaxed/simple;
	bh=DxCyvQLxUq+/f2JK6Z2QmBbNAjwYlL+kjRW9icA84Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7Q3h1JWtixsmjIXOqG68pvdnqT/7j7jHQ8XfmlR1/Y65s/vAmot89pEUPkkyih0mqhVdsDFbUJOI6SlrXvvVzfqn+6hLn6OKjzDPvuTEZ7aVZf3j7vUbJXP7ziAPX/26+LSmUjPUjvSR6/JrdwVqkbb5RgSJbqly1oYPyezFEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fM1Goyxx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fM1Goyxx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 378FC1A1216;
	Tue, 13 Oct 2026 16:34:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CD4F60362;
	Tue, 13 Oct 2026 16:34:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62A1111D7180D;
	Tue, 13 Oct 2026 18:34:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hd4xqbqZfQTtYZlZh1PzDHrfekBZu/c7Qjh9nfxt1Qc=;
	b=fM1GoyxxLNsEWBaPPsjoqb2rLKiGA2NZsdwe5ew2CQfrjDhOpU61o7SP/4AOswN3tZMwPN
	yQd5qMwQCc2vCACizDVQtS4ciwVRVGsw9Qxj9XmQiXxBbX3o3Ue7zbBvao13iWOi93GiIY
	KFSLLEhdtSn0cb2ahZmYrnAeVbW5nuzp7LIe2rXq7pgZS4ZnXZ0jtbfMv7HGM3mKhQUZTn
	ovVrPSf8Z1dARJumZDi2vkKjq65UUIvZZF1CBaGhfoweLoIyXlT5/srxuqRRnQr/pEBixY
	D42nFQrrcjEbe85aR3DdNkZB0W6WYhcr9aPONzEOTCW4VOZVhA/9FQj/JzB6GQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:56 +0200
Subject: [PATCH v3 06/17] mtd: spi-nor: Fix the meaning of a comment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-6-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I got mislead by the comment above spi_nor_setup() which implies that we
program a specific configuration into the device. spi_nor_setup() is
pure software, it is the step where the core configures itself for
dealing with the device. spi_nor_init() is where we tell the device how
to communicate with us based on all the knowledge we gathered from its
SFDP table and the DT.

Improve the comment a bit to reflect the fact that one should not write
volatile configurations in spi_nor_setup(). spi_nor_init() should be
used for that instead (since it is called at resume time).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2bbec3feda39..bc11c8cbb234 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3458,7 +3458,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		init_waitqueue_head(&nor->rww.wait);
 
 	/*
-	 * Configure the SPI memory:
+	 * Decide how we will deal with the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.

-- 
2.55.0

