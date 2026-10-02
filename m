Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA3348C47
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943710; cv=none; b=IYEVl9vL2ijD8R6vVRuRnNrcleAS6H3nSARGOBezGO967y1kiYG3WaKt3YdgmyCQyyCkeTSwMUN+3W05m6YkP7gne0PyWZ6JIDibNr2421bXn5K5dyu19SbXPqoiDCpO8ikmKjI5k7iJrypcdR4D14U0ARHfFf2PxcYweO5S7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943710; c=relaxed/simple;
	bh=iHglCSMUfjm//ul5CabExZm+38z5YlrM7pRGN8JEpGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/p9RW6w/DzpAJs20V1y5yY5Dq4GYEdPjEMbD7J2m7wn7+bXjhOrTKXTQ0Tf1T73rYYX1b7stGnXPLS6OSu4NgxU9UuWllhZRSFqUYLovDE85m+SgpSymSNMjFWUxMXtuAEM2ozuOxqxXYUjKb6nCAB064hH5ufErzsXkMFZpU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Tb5cmBEF; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Tb5cmBEF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5CAE11A10DF;
	Fri,  2 Oct 2026 12:21:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31FF0603DC;
	Fri,  2 Oct 2026 12:21:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12A461032820F;
	Fri,  2 Oct 2026 14:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943704; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g5E971noNfwmosMia1C8bd4DCKd1mlhJxpuuFYZH8pA=;
	b=Tb5cmBEFBOBxx+HWlBjz1xSY4WqML7yrFnb5F2iNT/ALLaYRJNbzlvGtFmx98IJJNbaKvo
	pxlsGOBaQXmaQ7uLYo5pCodUa+uvfmRiY7UJRn0Bq/W/Hpuibs1fdbG9Oqis5yFKrrlcO/
	uar4EtxMwQQeJIsx+aM7tWLNx9K1oF7LgKFN7/sglyN8PbSz7FxMF35bbEA8qHI6Z23lAt
	lqYKj9ur9Xr2q2VZfw3RxcK+7ogiZXNLP61ncjw9fgtOGtBoS3AVp6C6+N8G22pfqHMgav
	58Gen73z6iyXXbVnkcb6qrD+YIjD7lazw6qBxBKNnVoeDcjfS2pMlBLuAlA6qA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:21 +0200
Subject: [PATCH 08/15] mtd: spi-nor: Fix SWP for octal DTR chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-8-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

During the recent rework of status registers handling, we mostly focused
on quad capable devices, partially skipping ODTR devices in our mental
model. It seems that many (if not all?) ODTR devices have no SR2 read
opcode and have other control mechanisms. Because of that, the current
support in swp.c is broken, because reading back the written value may
or may not lead to the expected result.

Let's extend the _careful() suffix to the helper reading back the values
and comparing them. Maybe this "carfulness" will have to be moved back
to the core, it is a bit early to state it. For now, let's just make
sure that we read back 0s without errors when virtually accessing SR2 on
those chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c |  2 +-
 drivers/mtd/spi-nor/core.h |  1 +
 drivers/mtd/spi-nor/swp.c  | 23 +++++++++++++++++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 152add3834fc..4926a3193891 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -927,7 +927,7 @@ int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
  *
  * Return 0 or errno.
  */
-static int spi_nor_write_sr1_and_sr2(struct spi_nor *nor, const u8 *sr)
+int spi_nor_write_sr1_and_sr2(struct spi_nor *nor, const u8 *sr)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	int ret;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b64f26b69c05..cee33ca18b04 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -664,6 +664,7 @@ int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2);
 int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr);
 int spi_nor_write_sr1(struct spi_nor *nor, const u8 *sr1);
 int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2);
+int spi_nor_write_sr1_and_sr2(struct spi_nor *nor, const u8 *sr);
 int spi_nor_write_sr1_and_sr2_and_check(struct spi_nor *nor, const u8 *sr);
 
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 7e667e4ca84d..e9cf2ca23234 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -240,6 +240,25 @@ static int spi_nor_read_sr1_and_sr2_careful(struct spi_nor *nor, u8 *sr)
 	return spi_nor_read_sr2_careful(nor, &sr[1]);
 }
 
+static int spi_nor_write_sr1_and_sr2_and_check_careful(struct spi_nor *nor, const u8 *sr)
+{
+	u8 tmp[2];
+	int ret;
+
+	ret = spi_nor_write_sr1_and_sr2(nor, sr);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_read_sr1_and_sr2_careful(nor, tmp);
+	if (ret)
+		return ret;
+
+	if (sr[0] != tmp[0] || sr[1] != tmp[1])
+		return -EIO;
+
+	return 0;
+}
+
 /*
  * Keep a local cache containing all lock-related bits for debugfs use only.
  * This way, debugfs never needs to access the flash directly.
@@ -407,7 +426,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr1_and_sr2_and_check(nor, best_status_new);
+	ret = spi_nor_write_sr1_and_sr2_and_check_careful(nor, best_status_new);
 	if (ret)
 		return ret;
 
@@ -529,7 +548,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr1_and_sr2_and_check(nor, best_status_new);
+	ret = spi_nor_write_sr1_and_sr2_and_check_careful(nor, best_status_new);
 	if (ret)
 		return ret;
 

-- 
2.55.0

