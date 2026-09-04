Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A7051E445;
	Fri,  4 Sep 2026 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545615; cv=none; b=WpJGiKPQry6PX8BegG9aOc1UulLP27Nrz2OTTzBY49wMujGFZoZyxtpfcokULKF6eqFyLMxIDybSp8S+jgy2AMl4MC+ZnvFZmPG23HQZQqcK8e4VoU4yBkt9KOtGBbUKi6dI+YdYUN/t9UiiklDie5CPyO9lytNhMXFKzket/Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545615; c=relaxed/simple;
	bh=e9Na8yqXbo8Mrmip4BI6lHUbI82d372LE0SeToe8ppE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdg+8uHz4KwbkqVqn5eiEs2hrIr3Z/rxVYgQym3LQeb9XupRM3+T/h0OfTVVS/0A8OORVoqmGR9CzPkg+Uz0AQWDllOMzFmA6sLVi5UeXs1Zo300zucqaVhCDHKSQypb7UmmjFqAw1wQ4UVNqIZZeEEEoNUz6AiSNpRNmr83dYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DAr0TWvT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DAr0TWvT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD1F54E41521;
	Fri,  4 Sep 2026 18:13:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B03186057F;
	Fri,  4 Sep 2026 18:13:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7D3011C78158;
	Fri,  4 Sep 2026 20:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hqt+/88NUF/qb77dZgpUKJJCWtbSkZ9Fc6rtIcnbhOg=;
	b=DAr0TWvT042hR3ajMlsc8JEGYKUZhEhvDZsrtkd1c55WHzKag2mhFI6OqWwbYARat1b8p4
	dlNPzTjhG6d2d9FuGw9QZpaYNMVtcpcdp2QMGzpRxDWbPmVsJPpq596ofYMx+LxfkGgF5p
	Yg48iO/Tnx/+ukVfOcbCZ6C4E/IBdqNkp9kZviSfF54rupg2xeXwH+XV3/z/eDuEDYiGiT
	IzqDKhUfN+rkeFTVCxJsK75hTWM2EGe5BrdWp4HKoIMviWAw/WmCOE7K51AFoXGz/gI7k3
	i0F7Vk/IKV2CLgnwYRyMNewwTRsPwZKHXBZe8QSQQcwMgH78pfX7ueyKvPEMxw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:12:46 +0200
Subject: [PATCH v5 09/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-9-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There is an ID collision between the JV and RV families. Both chips are
very similar in practice, it is mostly a matter of electrical
differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
the new SFDP (rev F) field which forces an alternate write SR2 opcode
(0x31). They also do not require the multi-die fixups which must remain
assigned to the JV chips.

Finally, since they share the IDs but not the names, we must hide the
names using a fixup.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c    | 11 ++++++++
 drivers/mtd/spi-nor/sfdp.h    |  2 ++
 drivers/mtd/spi-nor/winbond.c | 60 ++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 95f47c0c9317..c21a6953db96 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1715,3 +1715,14 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	return err;
 }
+
+/**
+ * spi_nor_sfdp_get_header() - retrieves the SFDP header
+ * @nor: pointer to a 'struct spi_nor' with a valid SFDP field
+ *
+ * Return: the cached SFDP header.
+ */
+struct sfdp_header *spi_nor_sfdp_get_header(const struct spi_nor *nor)
+{
+	return (struct sfdp_header *)nor->sfdp->dwords;
+}
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 2cbe22246c5e..1e49ed548a7e 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -160,4 +160,6 @@ struct sfdp_header {
 	struct sfdp_parameter_header	bfpt_header;
 };
 
+struct sfdp_header *spi_nor_sfdp_get_header(const struct spi_nor *nor);
+
 #endif /* __LINUX_MTD_SFDP_H */
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 063b85e041cd..9af4f21e82bf 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -24,6 +24,39 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
 
+static bool is_w25qxxrv(const struct spi_nor *nor)
+{
+	struct sfdp_header *sfdp_h = spi_nor_sfdp_get_header(nor);
+
+	/*
+	 * W25QxxRV chips re-use the same ID as the W25QxxJV family.
+	 *
+	 * Chips are very similar, W25QxxRV brings mostly performance and power
+	 * consumption improvements. The RV family does not require the multi
+	 * die fixup.
+	 *
+	 * They can be distinguished based on their SFDP minor revision:
+	 * W25QxxJV:        JESD216A, minor revision == 05h
+	 * W25Q512/01/02JV: JESD216B, minor revision == 06h
+	 * W25QxxRV:        JESD216F, minor revision >= 0Ah
+	 */
+	return sfdp_h->minor >= SFDP_JESD216F_MINOR;
+}
+
+/*
+ * Since SFDP is populated after ->default_init(), the match functions using
+ * nor->sfdp as discriminant cannot be used for this specific early fixup.
+ */
+static bool winbond_jv_match(const struct spi_nor *nor)
+{
+	return !nor->sfdp || !is_w25qxxrv(nor);
+}
+
+static bool winbond_rv_match(const struct spi_nor *nor)
+{
+	return nor->sfdp && is_w25qxxrv(nor);
+}
+
 static int
 w25q128_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -146,6 +179,22 @@ static const struct spi_nor_fixups winbond_nor_multi_die_fixups = {
 	.post_sfdp = winbond_nor_multi_die_post_sfdp_fixups,
 };
 
+static int winbond_nor_partname_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/*
+	 * W25QxxRV parts re-use the JEDEC IDs of the JV family. Their name
+	 * being a legacy field, it is kept for the already established JV parts
+	 * but must not be exposed by the newer RV ones.
+	 */
+	nor->partname = NULL;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_nor_partname_fixups = {
+	.post_sfdp = winbond_nor_partname_post_sfdp_fixups,
+};
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -552,9 +601,14 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	{ .fixups = &winbond_nor_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x18), .fixups = &w25q128_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x19), .fixups = &w25q256_fixups },
-	{ .id = SNOR_ID(0xef, 0x40, 0x21), .fixups = &winbond_nor_multi_die_fixups },
-	{ .id = SNOR_ID(0xef, 0x70, 0x21), .fixups = &winbond_nor_multi_die_fixups },
-	{ .id = SNOR_ID(0xef, 0x70, 0x22), .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x40), .match = winbond_rv_match,
+	  .fixups = &winbond_nor_partname_fixups },
+	{ .id = SNOR_ID(0xef, 0x40, 0x21), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70, 0x21), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {

-- 
2.54.0

