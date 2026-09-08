Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A474F55BE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862817; cv=none; b=YDPNR79nC8imj8w6lGR3Lx5BZjkpvLLWj2XhJnD9E36Yv2atvMlHLH3lc7SIY2+HIPOHaFTMR7yVeA8cM2/eFFOL8b0A1awSyHLWJI22bwqL8+Z1NOVU24bKFNtXNEXi98dp5ZJqgNVOCMVGi2STwfcU+8frXA/qF8oo6VfY6/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862817; c=relaxed/simple;
	bh=xPnNP7uxyugic1XzQqXWe8qmqyV5JID+iXt90df5txM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=NLYNXeS6FWRP1T35Qhy6pcY9kndvBkxtMHNLYbGjI/xh0UNlHPsvFV+AT3FbaIzvYxvQdxKw/0qUa51DaHmKDwkCoYXsG1261qbBNYSvH5kO/tKS3OzsfBMRTN1ouOqHfS0G9+uFEyuUqn29Xt0A8EWMtQ14wQPQgjgyvaUr7XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=AH8yx60C; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="AH8yx60C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788862811; bh=NNIBVf5+fanw9UbPk8ctZ4bXJ3jQgINTT+ZsSM8Xfho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AH8yx60Cv1Q7BTEkUrKXipvKOCFbitVYCm0UOMw2pyyE0za00gaXS9xZ4JmeN51P0
	 ZCgz2+e6e1oBBD0k74uC9KerJo8fdZ7eQNS1Xgq3ckqO97G6ZX+EJjO4dHnVUsRco4
	 x2shf0qDmwpzXL8lEzpWsxdzT47Q//G1dJaFqx0g=
Received: from localhost.localdomain ([223.166.55.8])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 4FBB86CE; Tue, 08 Sep 2026 18:19:59 +0800
X-QQ-mid: xmsmtpt1788862799t8i3gumi7
Message-ID: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
X-QQ-XMAILINFO: Mfa2ogpi8We7usBzROBO8cDvatF2B7/FYhOERh51v+MCo3afLC2SM6TooGXfdZ
	 MwJ8GTBmElYTOQAq4Ul6LT2XaxGV6zUG/XVwCB5wycCxo74ZsrF9HOOOl6O7JhVdnc0vAhzk/rWC
	 HCRRuLg730nR2Tjlr7870PaRqG9xk1WtemYhWyiXjbIxr3g7M3z6ChNCSls8qNp3U/LPP94lJiFY
	 jQc1LFb5tTFNxlZPbciGNSXeWlViWMqNstyjBmQyKN0Rt8c68b3Dmhse/CETmGRuxgYL1ULBfnFB
	 WTJgjV3ACOu5P9bVT0AvqYUim3tpMk9zXyWUpluLfdMmTYh7aoRA34FiK5v7HpcRxXrOAd/VLp78
	 Ur1FQAtJihfnRw/oAcdzLHCxjtezK69E5UFFBU3RiQevrBzn9iSundDr2nPXpp47Nlgt6oJLidGx
	 7r3O7d8bbhs+m4cuNpFME65FAAVu8DF7DXoBg/EyB/yogKwYxAoMGWw2nlchJAvEUPFHcSKr1ZLk
	 c7m1s2Gq4OZJr4qSVpk6W2lGMsKakNUTK20SHxaNRePTHznn0QQK+D2yo+TIR3gwQmujyyYNFCwM
	 Xl382oFBXH7DjdfKiK23kfjLqkkGum0M4tR3O/9FneiytMeiJCYvrFv/jsonaUjR1V640/yAsiX3
	 5FA+HTcihjOEyUUeN15O3aPr+EottiS0W5UM2WC0Ex5KPvhXaqKkjpRuIrblDOZjuXf22GLXZG42
	 RpLWeb66YUW4l14af+8CYqaN9BDzClmCURY3lXRegUCfYyFoHRflMI6ZtiOTv7L1SNcL3gWB1uIK
	 CbzGXJCQoaikmBUfn6KM57PVx36YK3eJ80VLRSV1vroUJA5gb76FUIUq0HlmXtNdfAKeQ5F2NiEC
	 20Ae2mh21TRIzeIWk9QgG1UCuiMCy1LWWwMY3VWTqGmd3KHYZTe84DT11ESn33prUxA8TlvUztQC
	 9VBVZ5ng76U8qw3lXXB+u26RrTZRn+kxmeqNlOCN1bzyrnFZLwMUgas6KXcp1NL0ZeKMfDEltKte
	 0qZ6uErycWt3Z/gvwRIKpnSS4ZOI/vk+HhvCYmpq5r9JAtKGWw7qWgeFejB+w=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zongzhen Feng <1768315307@qq.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	richard@nod.at,
	vigneshr@ti.com,
	Zongzhen Feng <1768315307@qq.com>
Subject: [PATCH v3] mtd: spinand: cache the last read page to avoid redundant SPI operations
Date: Tue,  8 Sep 2026 18:19:58 +0800
X-OQ-MSGID: <20260908101958.3311434-1-1768315307@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

The cache is invalidated on write, erase, ECC errors, and when
the bounce buffer is overwritten by non-cacheable reads (RAW,
continuous, or OOB-only).

Signed-off-by: Zongzhen Feng <1768315307@qq.com>
---
v3:
- Invalidate cache when databuf is overwritten by a non-cacheable
  read (RAW, continuous, OOB-only) to prevent stale cache hits.
- Invalidate cache on uncorrectable ECC errors to prevent
  subsequent reads from bypassing ECC checks.

v2:
- Fix compilation error: req->disable_ecc -> req->mode != MTD_OPS_RAW
- Remove spurious indentation change
- Use real name instead of pseudonym
---
 drivers/mtd/nand/spi/core.c | 39 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf9301f25e7..f545dd948604 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -560,6 +560,15 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 			       req->ooblen);
 	}
 
+	if (req->datalen && !req->continuous && req->mode != MTD_OPS_RAW) {
+		spinand->cur_target_cache = req->pos.target;
+		spinand->cur_block_cache = req->pos.eraseblock;
+		spinand->cur_page_cache = req->pos.page;
+		spinand->cache_valid = true;
+	} else if (req->datalen) {
+		spinand->cache_valid = false;
+	}
+
 	return 0;
 }
 
@@ -833,6 +842,20 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
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
@@ -842,6 +865,9 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret < 0 && ret != -EBADMSG)
 			break;
 
+		if (ret == -EBADMSG)
+			spinand->cache_valid = false;
+
 		if (ret == -EBADMSG && spinand->set_read_retry) {
 			if (spinand->read_retries && (++retry_mode <= spinand->read_retries)) {
 				ret = spinand->set_read_retry(spinand, retry_mode);
@@ -1064,6 +1090,12 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
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
@@ -1188,6 +1220,11 @@ static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
 	if (!ret && (status & STATUS_ERASE_FAILED))
 		ret = -EIO;
 
+	if (!ret && spinand->cache_valid &&
+	    spinand->cur_target_cache == pos->target &&
+	    spinand->cur_block_cache == pos->eraseblock)
+		spinand->cache_valid = false;
+
 	return ret;
 }
 
@@ -2025,6 +2062,7 @@ static void spinand_cleanup(struct spinand_device *spinand)
 	nanddev_ecc_engine_cleanup(nand);
 	nanddev_cleanup(nand);
 	spinand_manufacturer_cleanup(spinand);
+	spinand->cache_valid = false;
 	kfree(spinand->databuf);
 	kfree(spinand->scratchbuf);
 }
@@ -2044,6 +2082,7 @@ static int spinand_probe(struct spi_mem *mem)
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

