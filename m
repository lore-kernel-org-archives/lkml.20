Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4794AE8A5;
	Wed,  2 Sep 2026 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368412; cv=none; b=NsyhYdYqMm58hfrcKq+4p+4d+yh7QAmmUptIO2MALwiL1uJ1JbpoWt6OkaYQXJ5Xtknv/r/iAdi6yPQCQNAztdA7+ObWXQQT+Rx+jNCvkeRd2EiVQgbqZeoY24YcZ1rTTzqHb9d+/aVQ7Je5W4tLa3vs/XU1gsfu8Z0bDbEbkGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368412; c=relaxed/simple;
	bh=ECrmUygfYfLZncVnyBNsfKyJO2oKaSDvUiiPYEKr6cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVUmE7lFdaq2PaMEPSp03HOA/5Od2w9UgLKIXLeDu+NzxeKhl3j5p676yGFFOZHwgw42NkxsXvgKFYOoCbINdhvqCeJ8dBUy/u6kqM9vvCl+KIi+iU1I5tWG59Eb0tsXvaAreFY/oFUdN2AqJlkXzwjBjzHp71A4odyZreo1aSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JwDbN15j; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JwDbN15j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 730984E414EB;
	Wed,  2 Sep 2026 17:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47B4C6053C;
	Wed,  2 Sep 2026 17:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 552B511C79D62;
	Wed,  2 Sep 2026 19:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LGZwYBojvf6z6A3kSsqqOxznQcvg2kta/W2R0+OqU+I=;
	b=JwDbN15jc6X++alUeVNGWxECEV7xs0qC3M1t+K0CP0N7sLzhJHcDjQsJH97WPOMhqnbme2
	riiDEidWszJ7WfaQLHb0qkmEHOCujv9Uhz6qyAuYqZSdiUHYoRPF78tEnMSBS5BTZWN6tG
	IW2KL7NuwCPgGieLTUcaEq+UdK7ngBHWSK+2moD+dGg5u9V8Ew0xnZdxjcTvsJSCOIKlhG
	4KgRY1pfnxt8PuaSqcAIYE0DqqcrK3k68i3ctWhbdPlDuPiIcosn5nftYKgL/1/psWhVaj
	SsCIHWblxytCh01m9ZRAAiWRF3WEDRtHsYVjgzPcdQB8TG4OgImjdPNqLoWDGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:21 +0200
Subject: [PATCH v4 07/25] mtd: spi-nor: Create an indirection on the part
 name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-7-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

We currently print through sysfs and debugfs the name of the part if the
.name field, which is legacy, has been filled in the ID table (otherwise
"(null)" is printed). These IDs had an interest until manufacturers
started re-using more and more extensively the so called unique JEDEC
IDs. At this stage, a name that was tailored for a chip sold in 2016 may
no longer be relevant for a chip sold in 2026. Still showing this name
through the various filesystems may confuse people, removing these names
cannot be done since they are now part of the user ABI (because of
sysfs).

In order to allow overwriting the .name field (which is part of a
read-only structure), let's create a spi-nor pointer which will by
default point to that .name, but which can be cleared in fixup hooks to
make sure the name is hidden on newer parts.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c    | 1 +
 drivers/mtd/spi-nor/debugfs.c | 3 +--
 drivers/mtd/spi-nor/sysfs.c   | 4 ++--
 include/linux/mtd/spi-nor.h   | 1 +
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 77d28c99c33b..1e8628da675b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3493,6 +3493,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return PTR_ERR(info);
 
 	nor->info = info;
+	nor->partname = info->name;
 
 	mutex_init(&nor->lock);
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 512825c3fc85..275671222588 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -82,13 +82,12 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
 	struct spi_nor_erase_region *region = erase_map->regions;
-	const struct flash_info *info = nor->info;
 	char buf[16], *str;
 	loff_t lock_start;
 	u64 lock_length;
 	unsigned int i;
 
-	seq_printf(s, "name\t\t%s\n", info->name);
+	seq_printf(s, "name\t\t%s\n", nor->partname);
 	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	seq_printf(s, "size\t\t%s\n", buf);
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 643513ee891b..a2dabe4c6422 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -25,7 +25,7 @@ static ssize_t partname_show(struct device *dev,
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	return sysfs_emit(buf, "%s\n", nor->info->name);
+	return sysfs_emit(buf, "%s\n", nor->partname);
 }
 static DEVICE_ATTR_RO(partname);
 
@@ -78,7 +78,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
 		return 0;
-	if (attr == &dev_attr_partname.attr && !nor->info->name)
+	if (attr == &dev_attr_partname.attr && !nor->partname)
 		return 0;
 	if (attr == &dev_attr_jedec_id.attr && !nor->info->id && !nor->id)
 		return 0;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3a55d76ea77d..b1e573367604 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -395,6 +395,7 @@ struct spi_nor {
 	u8			*id;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
+	const char		*partname;
 	u8			addr_nbytes;
 	u8			erase_opcode;
 	u8			read_opcode;

-- 
2.54.0

