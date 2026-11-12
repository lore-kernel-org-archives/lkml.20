Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469009;
	b=CVV/8HT8tU9J6vWDPdzonCsmRzK25K0bC4U5uWmhAQAHje20C45Xrpp7MGHYGYGIW6kQ
	 uPRw1yVWnYveRVwZZChNxpWojGEx8uW1/IYrONBIg/nLMQsXMiKGDr+7NiBTQOzaw/cy4
	 IKFt/aVMbSzv5YB7RVcs04swv8IHlF7P9G34NMmH/lNkYHZGutsPfxyOV/ukQLWJ7T++j
	 +fk8wmaLlbwXxETHbFr4T3cNq271QYHBrHjyLU4ZnGLts00XSiwg3QUPL5zJjKHISM2w2
	 3PMSVmyPYMmVKl3/OACOSlB3lr9T1wjkOcaorRj0Km8dvNvrj5wRQhdDLQXfSu9viGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469009;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=w7i4mPEqWkPnR7/WFET/ZBgXt1DQ1x4fbHvdPQWGd3Q=;
	b=y60X3QBOnHtjCdThdiPpcNyGo4+VsNCjFbCUj8A/Mt6+2tTmQXE/PEppmzqpBdjszC7i
	 SWRIkoib1N8qqgunORMxyOEJ1XNFeMJyxdqS5GiqIaMK/wT0mXRMQokKFO+aFlLqijFS/
	 reSJ8RQgtXByQsCSvxTEn+0ct1/1iUGUlUekltIja7JCWzLaYzdfJ86pWg1+mFIp6TgRF
	 vDtf8rSdILpJBVvWOqPANVDKG5X0x68utV3UuUobXRd60sUQWm7UmghjPYQbK0isTQjt3
	 7OM6oumAOgIzP+cb4WNXm3fOdpT9jS9/6Jz4MpQhqlkgOdUZ8YbCW4Y3eUM/KCTWqEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BxYdR38B;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2A606A336;
	Thu, 12 Nov 2026 07:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB2A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BxYdR38B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=w7
	i4mPEqWkPnR7/WFET/ZBgXt1DQ1x4fbHvdPQWGd3Q=; b=BxYdR38BAZRJNkxMze
	jORJ9OLdGt7XhuYI7Eb/p2y7HdDuPCdy4Le/Wa4luTdT0oeurBWRJYx7hA7jHvq0
	+ekdtJGlQkwEIpZDt84pkM2oCGnr43qUDXOCnBu0IofsY/OxDTTRRFFJ/D8Timlf
	3dBLPGYQ0MDWFAifAsRlB+OM8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCHaRhtbPVq_SySFA--.53017S3;
	Thu, 12 Nov 2026 15:36:20 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v7 1/4] EDAC/loongson: Rename driver-local symbols
Date: Thu, 12 Nov 2026 15:36:08 +0800
Message-Id: <20261112073611.25770-2-zhaoqunqin@163.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20261112073611.25770-1-zhaoqunqin@163.com>
References: <20261112073611.25770-1-zhaoqunqin@163.com>
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
X-CM-TRANSID:PSgvCgCHaRhtbPVq_SySFA--.53017S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw43uF4DCr1xXFy3JFWDurg_yoWrXw4fpF
	13Aw4Y9r45Kr1jk393trZ8ZF1ay34Sq3sFqF47A3yI93s8Cw1UXFyfKa17ArZxAr95Kr47
	Z3y8Kr48CF47CrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_9N-UUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7hRQj2r1bHTj-QAA38

From: Qunqin Zhao <zhaoqunqin@loongson.cn>

Remove the "edac_" prefix from driver-local definitions to keep the
edac_ namespace reserved for EDAC core functions.

Rename edac_check(), edac_probe() and edac_remove() to
loongson_check(), loongson_probe() and loongson_remove(), respectively,
and rename struct loongson_edac_pvt, loongson_edac_driver and
loongson_edac_acpi_match to loongson_pvt, loongson_driver and
loongson_acpi_match, respectively. The shorter names are unambiguous
since they are all file-local.

Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/edac/loongson_edac.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 3ed4d34a33..5dfa41e877 100644
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
+static void loongson_check(struct mem_ctl_info *mci)
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
+static int loongson_probe(struct platform_device *pdev)
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
+	mci->edac_check = loongson_check;
 
 	pvt_init(mci, vbase);
 	dimm_config_init(mci);
@@ -128,7 +128,7 @@ static int edac_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void edac_remove(struct platform_device *pdev)
+static void loongson_remove(struct platform_device *pdev)
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
+	.probe		= loongson_probe,
+	.remove		= loongson_remove,
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

