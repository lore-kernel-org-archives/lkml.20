Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006059;
	b=R4KqDFn6eZpKojrYmyvOYQtMIhYIIW11hXEDQBEdi1XdcSQIiof+7LvhdY++/xp/v1r6
	 w3P3/Y1EEP8+Rh+ul5UDctegcoRMMz9NmK4GMkc8skR2NLeyXsedW27gdKI24CaEOvwjZ
	 KGrPjTxxq9sv3GJLtoNqOrUWdJUKSiJtchoNNNBf+K5GDY14g8wpJQ8NknidJEcrRPDWE
	 E5eolbhBPIS6fboclTGRLnig58Ib/l7WF6TnyoETUKNRSt2NKMk2EG10fECSIf5MlptFk
	 oiWcuvmeyxNvCxiYG+sL7SGIlaBTtD/U7ZoNVUD/CZKyM1J5rl9u2DnILv1b1O4O0Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006059;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=po75PQID16iXhFpCpn0KCm8hZxPE2TXmT+5hO88Ww2U=;
	b=PIbCrEQJK1xEvYlh66AidGEvsRcG6OE7qTwVXU839IPORzxoc8Ofig6A7VtejWLGkWXw
	 qPFf4Nqq6LsFuzyvnONTu9pHDxRQuJGGrvPTcozdI0mT0pB3+b7okwZhyec77tQOu3/0F
	 zFo4FjhcUlL9cU2RDd8BZXKsIN/ZLHmjYF7ovKTVKbglhij4tIg/mc+kAaRTgpzWOh7wi
	 kDEzKxU4eWWfx27nf0q43Rd/tUrCgrjJBalqZYRAKJR68jopj1Qhcvkljk+G6MJMYK0Fp
	 r7bsrN2Y6yGnBhjowF8ZSGetIN8N8FwrIIWyBEzLwQ5IZhd3EvGLaz+e8HRsjGWclig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oNvv4o2v;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48608606A323;
	Mon, 26 Oct 2026 09:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48608606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oNvv4o2v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=po
	75PQID16iXhFpCpn0KCm8hZxPE2TXmT+5hO88Ww2U=; b=oNvv4o2v1q3+BOgEAs
	OtongGQfRZw/dH2GILNW5/oR1o+uk/pKejo4CBeptG/aCmrcvuULaT0ReM65n5/h
	t/6xkpKqO1b52CacUV3O7SqNezvpPX9z53S6nHAdO6C7iss4Hp7WM2cYY39wOyyA
	W41HP8pI6d6p8Jj0BbYfvv3r4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD332jHGd9q4hmLCw--.8486S3;
	Mon, 26 Oct 2026 17:13:51 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] EDAC/loongson: Rename driver-local symbols
Date: Mon, 26 Oct 2026 17:13:29 +0800
Message-Id: <20261026091332.30226-2-zhaoqunqin@163.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20261026091332.30226-1-zhaoqunqin@163.com>
References: <20261026091332.30226-1-zhaoqunqin@163.com>
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
X-CM-TRANSID:_____wD332jHGd9q4hmLCw--.8486S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw43uF4DCr1xGrW3Wr1fXrb_yoWrGFW5pF
	13Aw4akr45Kr42kws7trZ8ZF1Yy34SqasrtF47A3y093s0kr1UXF93Ka12yrZxAr95Kr47
	Z3y8Kr4kCF47CrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_9N-UUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7g8MS2rfGc-rQwAA3t

From: Qunqin Zhao <zhaoqunqin@loongson.cn>

Remove the "edac_" prefix from driver-local definitions to keep the
edac_ namespace reserved for EDAC core functions.

Rename edac_check(), edac_probe() and edac_remove() to check(), probe()
and remove(), respectively, and rename struct loongson_edac_pvt,
loongson_edac_driver and loongson_edac_acpi_match to loongson_pvt,
loongson_driver and loongson_acpi_match, respectively. The shorter
names are unambiguous since they are all file-local.

Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 drivers/edac/loongson_edac.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 3ed4d34a336..d9bc33dda7e 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -13,7 +13,7 @@
 
 #define ECC_CS_COUNT_REG	0x18
 
-struct loongson_edac_pvt {
+struct loongson_pvt {
 	void __iomem *ecc_base;
 
 	/*
@@ -27,7 +27,7 @@ struct loongson_edac_pvt {
 
 static int read_ecc(struct mem_ctl_info *mci)
 {
-	struct loongson_edac_pvt *pvt = mci->pvt_info;
+	struct loongson_pvt *pvt = mci->pvt_info;
 	u64 ecc;
 	int cs;
 
@@ -41,9 +41,9 @@ static int read_ecc(struct mem_ctl_info *mci)
 	return cs;
 }
 
-static void edac_check(struct mem_ctl_info *mci)
+static void check(struct mem_ctl_info *mci)
 {
-	struct loongson_edac_pvt *pvt = mci->pvt_info;
+	struct loongson_pvt *pvt = mci->pvt_info;
 	int new, add;
 
 	new = read_ecc(mci);
@@ -74,13 +74,13 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 
 static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
 {
-	struct loongson_edac_pvt *pvt = mci->pvt_info;
+	struct loongson_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
 	pvt->last_ce_count = read_ecc(mci);
 }
 
-static int edac_probe(struct platform_device *pdev)
+static int probe(struct platform_device *pdev)
 {
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
@@ -98,7 +98,7 @@ static int edac_probe(struct platform_device *pdev)
 	layers[1].size = 1;
 	layers[1].is_virt_csrow = true;
 	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
-			    sizeof(struct loongson_edac_pvt));
+			    sizeof(struct loongson_pvt));
 	if (mci == NULL)
 		return -ENOMEM;
 
@@ -112,7 +112,7 @@ static int edac_probe(struct platform_device *pdev)
 	mci->ctl_page_to_phys = NULL;
 	mci->pdev = &pdev->dev;
 	mci->error_desc.grain = 8;
-	mci->edac_check = edac_check;
+	mci->edac_check = check;
 
 	pvt_init(mci, vbase);
 	dimm_config_init(mci);
@@ -128,7 +128,7 @@ static int edac_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void edac_remove(struct platform_device *pdev)
+static void remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci = edac_mc_del_mc(&pdev->dev);
 
@@ -136,21 +136,21 @@ static void edac_remove(struct platform_device *pdev)
 		edac_mc_free(mci);
 }
 
-static const struct acpi_device_id loongson_edac_acpi_match[] = {
+static const struct acpi_device_id loongson_acpi_match[] = {
 	{ .id = "LOON0010" },
 	{ }
 };
-MODULE_DEVICE_TABLE(acpi, loongson_edac_acpi_match);
+MODULE_DEVICE_TABLE(acpi, loongson_acpi_match);
 
-static struct platform_driver loongson_edac_driver = {
-	.probe		= edac_probe,
-	.remove		= edac_remove,
+static struct platform_driver loongson_driver = {
+	.probe		= probe,
+	.remove		= remove,
 	.driver		= {
 		.name	= "loongson-mc-edac",
-		.acpi_match_table = loongson_edac_acpi_match,
+		.acpi_match_table = loongson_acpi_match,
 	},
 };
-module_platform_driver(loongson_edac_driver);
+module_platform_driver(loongson_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Zhao Qunqin <zhaoqunqin@loongson.cn>");
-- 
2.47.2

