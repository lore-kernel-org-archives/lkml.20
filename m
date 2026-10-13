Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D8F51E44B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909290; cv=none; b=C4KRLEwnZ8UKtELDKMBAUP7VUVmSCpjQ7n6GCbOQiA0Uu35MxmQDSAoVU4yzm+jRzNb95EA9NoPQXGmErVXxhtte6quuyBq98rQQfMdDUOnhlOv7qEKdygvmEs0KO1QW42wgzZnwEHJkLIZEWbegQCl0FjCXbhpRW006aX+4reQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909290; c=relaxed/simple;
	bh=nSTyFL3PkCZFRt10DYNr5nsp9ob3tpnhOKRO72SQjFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYTPZGNDjrfNSxilqas3s/3t/OHGuZaxdRkmtNHZeBq/5O/yS9ubt9voLLvt0WWrPlOyKL2AOUHGjkDSn79BO9Nko4Xi1rgnvhbQfcWsv1NojZTcSs/3qoXPwzqLTSw5QhUcQle3NjU4YO3q+yCSYAS96F48zhAtywRuEQwdQxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1cYuobTk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1cYuobTk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 786751A121C;
	Tue, 13 Oct 2026 16:34:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D7E160362;
	Tue, 13 Oct 2026 16:34:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7180711D71813;
	Tue, 13 Oct 2026 18:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=woBPfE2zyVEwVQtzqHUi3dF9ND0uu7ZMv6floLqY/Sk=;
	b=1cYuobTkBJNXOLk+vInzyitX8iuy26xIWzv4aE5eNRdfF9THPWNNJjN8rHN3+js1yTnUa6
	px6hF4J5AsckjnoLO9IiPBPmaWzkdtNvPH4ue3YRn8uGi9pMH1pnKGFkSAh9EK+buLgpEJ
	opG3s+E3OnTCyEstC0iwqqYmvubc299fcoSh3JCqlRgf7LpOJ6BmiHEyAtaJpK4PF4ASK6
	wKMCQf58UvYVrdIxmSRNlzXtHAYfkBMB9QAnBC4Y6wOSpi/SfCgncctgIZLlA+GDfk+rxF
	H7rhZMO2zr5eUBj9DVomBpE+gAJwBQZE+ju01+UnMlZBpv2BH2xptpDrt5Ga2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:34:00 +0200
Subject: [PATCH v3 10/17] mtd: spi-nor: Fix SWP for octal DTR chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-10-6dde1d513df8@bootlin.com>
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
index 07364b0a742a..43dffca23102 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -925,7 +925,7 @@ int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
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
index 6c56fda3913e..bc733df203f3 100644
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

