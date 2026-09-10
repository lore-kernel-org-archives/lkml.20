Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7434C361977
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013329; cv=none; b=npXzYaJwXfQvqbLWlXn7sCSNWFSvYPo2B1hZdPIIIgXK4yNC6t07haZ9vXnziJcsDRMm3Y81/43NbKQvNwgfia3htzvSueBLVbDbMzgb48ZcFeQ2MIYE/IKK+3yEs7/BvchIuf6JCb6ga43Ix2DBmuf1M4pIpKSzYNFAt+eXUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013329; c=relaxed/simple;
	bh=CvDJRNsTHKNohsTT4JCjGasESprjXtj1pUSqF4uWdhc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=iBZOq/G5lR6cCAfh4wlpO3WJ0/0mP+U2WBsebawrp91b2ht5IbjiVBgDnOnDrVPS1wtjocszCs5F1UAhG4SWhqWYPDhqeZy1YN+Cr3hrpqUzDBvB2AjDLGYL1NcsnIj9WXXDKPIKSfJ6VvLg8JeAAsEPC/PpJemxAowD6OflPw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EHwfRofd; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EHwfRofd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789013314; bh=eGaa7WtGesoGkfLmGYd8BfggAGGhj1AGgS2FEmEHT8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EHwfRofdYxwiJpI13iQkDuuhtqsxlEFkcFMYMzrw6dncMPsmth7uENlYBHmVKUAkO
	 EczT6gbH2mRmdXLRfSZB7rB6m+Yzhu8C1t963J71fVWVXJcqszD9tWDte963/XXQ0g
	 RigdqwQFqHIV3xkrDrqj7EiPwGZmfJpSEOLrGcZo=
Received: from localhost.localdomain ([223.166.55.8])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 21594CA8; Thu, 10 Sep 2026 12:08:21 +0800
X-QQ-mid: xmsmtpt1789013301t9mnxf2fv
Message-ID: <tencent_522792EE6F63A5581C238FF17E9862F10A08@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJmZ/WDLySmntYhGyGLrPDWyuXyhl5s3x3LO88e4L7Ce1O77Wv6S
	 X7PqKcq2G5G3ciQxsiUu/4ma+81yGGDO38CEIY7B9s+vXy86lADfQVXs6J14fHy9It+NcdTBJ3Dq
	 tOD18/zelcN7WtnqOx1pkZX9xt6USnQz/QlERh4gWLwg/jdyKOx4ydezWPYsR7DEvlnLrpT1BRJP
	 Unl5yWMC3AfM9MOf6XXtpgAp3viFnS+RV6Qe+P8HjULJcjfAoHlvmchBjgF/SgJ88Q0uYGkjGsQj
	 NN6suMgkbtCBDDgb+qDcqHfX19H2Kn+M2hyPqckCOdoPYVy8bNJVjGcQ2O5XnPdHbwK1oZ7QNuyk
	 3rNaUcuOvMcm+qJwxdBI038Da2gOKvzoyvPq0p3kUt1GLvnWyMtiHL5eNpd2P+mHiHbFzd/5sLED
	 ZbnzOlW7JdeOobOz/tp3GloFTwBUpVUHoz1wnlEvh9LLHEmQyPLJUXQorU+em/Yhzr5uE+yzsqRu
	 F/uXkkbBKtwzCCY4WhxLTyuXmfeemqCf0cUB5cAy9smR0w2PK8ZAfQXsjDX9KWwYZbCwXiftOnUP
	 wNbyGlKdBNPYetiGbgIuxTo7Xtj9W3gIrTYeBBamy89qObVuF08pmcMFIqy/JrBINJBatV3MuDDX
	 xllEhKk8HEwWNtSoN88F+Mp0Jbz0sw998M1Mam81raOcjuB9quGMTNFLh+rnYKNWDQKZ1pmEI0O4
	 bIW7kQ39tkbYKeBQn5KjsfDRLk+XJom7/tsDXyDDm2aNLZSBMyC6m38M5Mcf4Xge3fgtKdj4sK1c
	 gXmMTfMFVZv42NhoSL0PExfKOIaFoypN166/oTAAQM9bh223OJqdKgwnfcIWILBpynTD5cwvttZY
	 sSJY6YtgdtiJKum/J4bmn8xrYCPzPfXKdzzdaZSjRoMwMlYtVxXGWGnIJRrbLuF8YOSeB5kgUP1f
	 jxaucFAlaTgKBU4hMrK1vbUM4LOYnT5bnB/1JLMkFstmdImi9J0SnirjKidOkg8cdP6Arf6prHS/
	 kzyYVdS526evzr+ywjYvCEgAvTKu/Ahooh5tfmpw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Zongzhen Feng <1768315307@qq.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongzhen Feng <1768315307@qq.com>
Subject: [PATCH v4] mtd: spinand: cache the last read page to avoid redundant SPI operations
Date: Thu, 10 Sep 2026 12:08:14 +0800
X-OQ-MSGID: <20260910040814.3342560-1-1768315307@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
References: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
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

The cache is invalidated on write, erase, ECC errors, and
non-cacheable reads.

Signed-off-by: Zongzhen Feng <1768315307@qq.com>
---
v4:
- Invalidate cache before writing to databuf in spinand_read_from_cache_op
  to prevent serving stale data on SPI read errors.
- Copy ECC-corrected data back to spinand->databuf in spinand_read_page
  to ensure cache serves corrected data for software ECC engines.
- Invalidate cache on any write, not just writes to the cached page,
  since spinand_write_to_cache_op unconditionally overwrites databuf.
- Invalidate cache on erase even if the operation fails, to prevent
  serving stale data from a potentially corrupted block.

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
 drivers/mtd/nand/spi/core.c | 41 ++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spinand.h |  9 ++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf9301f25e7..7f66de5af171 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -485,6 +485,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 
 	if (req->datalen) {
 		buf = spinand->databuf;
+		spinand->cache_valid = false;
 		if (!req->continuous)
 			nbytes = nanddev_page_size(nand);
 		else
@@ -560,6 +561,13 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
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
 
@@ -764,7 +772,12 @@ int spinand_read_page(struct spinand_device *spinand,
 	if (ret)
 		return ret;
 
-	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
+	ret = nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
+	if (ret > 0 && req->datalen && !req->continuous && req->mode != MTD_OPS_RAW)
+		memcpy(spinand->databuf + req->dataoffs, req->databuf.in,
+		       req->datalen);
+
+	return ret;
 }
 
 /**
@@ -833,6 +846,20 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
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
@@ -842,6 +869,9 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret < 0 && ret != -EBADMSG)
 			break;
 
+		if (ret == -EBADMSG)
+			spinand->cache_valid = false;
+
 		if (ret == -EBADMSG && spinand->set_read_retry) {
 			if (spinand->read_retries && (++retry_mode <= spinand->read_retries)) {
 				ret = spinand->set_read_retry(spinand, retry_mode);
@@ -1064,6 +1094,8 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
 		if (ret)
 			break;
 
+		spinand->cache_valid = false;
+
 		ret = spinand_write_page(spinand, &iter.req);
 		if (ret)
 			break;
@@ -1188,6 +1220,11 @@ static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
 	if (!ret && (status & STATUS_ERASE_FAILED))
 		ret = -EIO;
 
+	if (spinand->cache_valid &&
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

