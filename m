Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA8315D5D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838028; cv=none; b=fKw3MwqDesNEfz2a9ckY+GOibmPpXLS0kptsJ73gmM9RLIYZd2UjDXKOZUhP9GaiI/Ju8GHA+0vS36JwbSA3ahfOU7H+tkMfFxXjXwpdMOC0sswcnbVO3YjD0e6clulsg/mx64vtsC4X2ZO6Kdsp1zsPjQ9i3rA+mP3cNdGRnT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838028; c=relaxed/simple;
	bh=hvSjnMnM4KCfcYRFgojfyvOGOUjPfntll5gryXHFof0=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=GwIMu9/XryQOYTsXjlmY3kR8kmAA+uk0/+TN6Xj3uReUpkCJVPMF5nj3nvzb23Vsfx6kUOb8oA4fPT/F5fIFft7yUVYPXj78+fQ2K1U2cJGQHxYOshULl+ii3wKcTrQEY5iI1JhOFhUpDbxQQpO9C1TqilF3t6tCa3nHlcwgTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mWscfgje; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mWscfgje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788838022; bh=RQhosnyt6aERtesI5svtuDxWAhd8P12cd7CiHkOvBTU=;
	h=From:To:Cc:Subject:Date;
	b=mWscfgjevZGVTvgitxJ/AfJWgSYexy47IImiJrtMzIkus8LSgIX0B8k/OYyP7Sh7a
	 U2QfsUZCDBsuwS0xMwsczDQhhDaLt4mfXz9u1kMBhvGlMb2y2lt85fZIKMlJ5SjJxK
	 UrAr/sI8OusV/FKyzXuT5e7BUa+asvv+5TiXRDE4=
Received: from localhost.localdomain ([223.166.55.8])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 66039CB1; Tue, 08 Sep 2026 11:25:32 +0800
X-QQ-mid: xmsmtpt1788837932t51o31uiw
Message-ID: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
X-QQ-XMAILINFO: NHWsITUsYMGeIo9jtsaxRfEhMDZ0EUQn/MHOxKkLfED+rUDknmzcqdqV8w2CBD
	 8KRpHtmF05mGbRPpz/84e+3Pvep1R2QyUacznuwc3lIxe8ecMmkLLkzzVD59ij8TZ6X5npd1uUqO
	 D/WZaIY3ewl99tElBQZ7l69rz+9GmC3qxxsTAi4COHmp9CeGUtDIIOJLG9s/hZvA5ZOzRaF0CoeN
	 BnGkVfrDUA84FBDhuq61ZhiWkPwYZP07uE7ru5g+TBhxNDtzsE/zFKdM/q+YETM73c35nkmHK1ba
	 FO6QaXF4Ks++E4kpHZUpno+NF9Yfx6uLO8GGgW87fpy4AmWSwW+chD6qswqummClUmVXGok22nGa
	 yeShV6uEdvYSMjHaDH237xZ82GThtyN8jJkYtYWuDP13cwbAzDX1pa6siKHVTsUeV67ONkajm1jM
	 AkV74pOsGhh+lRFmku8XbzNsgasVmoYpx6lKroN3EzFXo6zn5n/EpPyHJHPi/VhWJofJXf5SuECP
	 xbKu5wzaEvq3NcaYb/xDQkUqvJgXPlcPYllkEmecqQlguW8A0lKZ7pwOKXsV3soMOVTw7ZI8eH7w
	 c8C69XBmDBXp1/zVCFFD2HWRdVdZm47Wf3sFX1SwdynL+SinHMnPwyagSdqJZn7kL6QYj2N8Jdaz
	 gDCrL2S3AOEg3iA3d/mzseMVTKeruM6OBuWT/ydqb9DozRyhSQTw0/yQP9Kiq1srcG7fh2hcWTwA
	 uhPRrDwh+cCFrNV2HC4+WLW/+anBmJkinWLmtHa6Kz9T/fZSnfLj1MSTwSReFrBJ+DO9hzxRcEf9
	 ihDtPDsrAmjZ06edpD/9bieklsOVWvq+YcKthMf2UmA0uU9pUy7BdsOkJwtnCg66TnWerEqzuldL
	 24N7zGzVbIoviwnZtG28ss8ej3oU8gPsxwl7Pn/GHnn4EgABXSghG8iUrNLfZWxcraTD2THvXrBo
	 bcPi77auJ6QkJJgs22hSiJ6kA6wVFq9I07Q7CNAsYyQHy1vQDYxAFpxOvoZGRi4CPtbmC1DyfWMD
	 9Cdvkn4qxLjwocQ5RPKoL1FpM9z57o9W6Uu1vIsWxu0ShUPHyk/hcpCcd5HAE=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: fzz <1768315307@qq.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongzhen Feng <1768315307@qq.com>
Subject: [PATCH v2] mtd: spinand: cache the last read page to avoid redundant SPI operations
Date: Tue,  8 Sep 2026 11:25:30 +0800
X-OQ-MSGID: <20260908032530.3309746-1-1768315307@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zongzhen Feng <1768315307@qq.com>

When squashfs reads files through mtdblock, the mtdblock layer
splits I/O into 512-byte sectors. For a 4K-page SPI NAND, this
means reading the same page 8 times (4096 / 512), generating 7x
redundant SPI read-from-cache operations. Each such operation
involves a full SPI bus transaction, significantly slowing down
boot time and file access.

Cache the last successfully read page in spinand_device to avoid
these redundant operations. When the same {target, eraseblock,
page} is requested consecutively, the data is served directly
from the bounce buffer (databuf) via memcpy, skipping the SPI
transaction entirely.

The cache is invalidated on write and erase operations. RAW reads,
OOB reads, and continuous reads are excluded from caching to
maintain correctness.

Signed-off-by: Zongzhen Feng <1768315307@qq.com>
---
v2: fix build error (use req->mode != MTD_OPS_RAW instead of
    req->disable_ecc), fix whitespace noise, use real name
---
 drivers/mtd/nand/spi/core.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf9301f25e7..21bc29ae62b8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -560,6 +560,13 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 			       req->ooblen);
 	}
 
+	if (req->datalen && !req->continuous && req->mode != MTD_OPS_RAW) {
+		spinand->cur_target_cache = req->pos.target;
+		spinand->cur_block_cache = req->pos.eraseblock;
+		spinand->cur_page_cache = req->pos.page;
+		spinand->cache_valid = true;
+	}
+
 	return 0;
 }
 
@@ -833,6 +840,20 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 		if (disable_ecc)
 			iter.req.mode = MTD_OPS_RAW;
 
+		if (spinand->cache_valid && !disable_ecc &&
+		    !iter.req.ooblen &&
+		    iter.req.pos.target == spinand->cur_target_cache &&
+		    iter.req.pos.eraseblock == spinand->cur_block_cache &&
+		    iter.req.pos.page == spinand->cur_page_cache) {
+			if (iter.req.datalen)
+				memcpy(iter.req.databuf.in,
+				       spinand->databuf + iter.req.dataoffs,
+				       iter.req.datalen);
+			ops->retlen += iter.req.datalen;
+			ops->oobretlen += iter.req.ooblen;
+			continue;
+		}
+
 		ret = spinand_select_target(spinand, iter.req.pos.target);
 		if (ret)
 			break;
@@ -1064,6 +1085,12 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
 		if (ret)
 			break;
 
+		if (spinand->cache_valid &&
+		    iter.req.pos.target == spinand->cur_target_cache &&
+		    iter.req.pos.eraseblock == spinand->cur_block_cache &&
+		    iter.req.pos.page == spinand->cur_page_cache)
+			spinand->cache_valid = false;
+
 		ret = spinand_write_page(spinand, &iter.req);
 		if (ret)
 			break;
@@ -1188,6 +1215,11 @@ static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
 	if (!ret && (status & STATUS_ERASE_FAILED))
 		ret = -EIO;
 
+	if (!ret && spinand->cache_valid &&
+	    spinand->cur_target_cache == pos->target &&
+	    spinand->cur_block_cache == pos->eraseblock)
+		spinand->cache_valid = false;
+
 	return ret;
 }
 
@@ -2025,6 +2057,7 @@ static void spinand_cleanup(struct spinand_device *spinand)
 	nanddev_ecc_engine_cleanup(nand);
 	nanddev_cleanup(nand);
 	spinand_manufacturer_cleanup(spinand);
+	spinand->cache_valid = false;
 	kfree(spinand->databuf);
 	kfree(spinand->scratchbuf);
 }
@@ -2044,6 +2077,7 @@ static int spinand_probe(struct spi_mem *mem)
 	spi_mem_set_drvdata(mem, spinand);
 	spinand_set_of_node(spinand, mem->spi->dev.of_node);
 	mutex_init(&spinand->lock);
+	spinand->cache_valid = false;
 	mtd = spinand_to_mtd(spinand);
 	mtd->dev.parent = &mem->spi->dev;
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5f4c00ae72a7..887ef6d34a41 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -757,6 +757,10 @@ struct spinand_mem_ops {
  *		   a command addressing a page or an eraseblock embedded in
  *		   this die. Only required if your chip exposes several dies
  * @cur_target: currently selected target/die
+ * @cur_target_cache: target of the cached page
+ * @cur_block_cache: eraseblock of the cached page
+ * @cur_page_cache: page number of the cached page
+ * @cache_valid: whether the cached page is valid
  * @eccinfo: on-die ECC information
  * @cfg_cache: config register cache. One entry per die
  * @databuf: bounce buffer for data
@@ -798,6 +802,11 @@ struct spinand_device {
 			     unsigned int target);
 	unsigned int cur_target;
 
+	unsigned int cur_target_cache;
+	unsigned int cur_block_cache;
+	unsigned int cur_page_cache;
+	bool cache_valid;
+
 	struct spinand_ecc_info eccinfo;
 
 	u8 *cfg_cache;
-- 
2.25.1

