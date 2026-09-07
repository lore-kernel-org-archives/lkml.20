Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354693B3888
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779661; cv=none; b=XdjDhneAIm6kggOYoe1ykwBKuzFFjUadjZpbXzgzsvZ7wEGZFGWTafzTQtbu0SazX7rkHcqewgFCPakt2KihPz4Rzc2KG/SSUwhjMrpoCah4E+NawRFLntM1ZHa1Sddbnp+jN5jm4BlYGMpyOjewXhQJNYBIGw5op1NTY5nAtTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779661; c=relaxed/simple;
	bh=RC3Jgc99iSA9eJvklt/OtPcuaDvB1zAVs8QSaV/2TbY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=TNfyIA3WzFwuYdKT4TCqyThRgT9ZYGPd+GTqA5OmbibYwRBgq5nOImjIY6UHRJxpTTEPnbCzQlSN0NtBdVC32CsR1YBSlWvazL2fcGxrxGfXhGM+5qHYt2b3oZ7MoaH6JmK4FatOCCU1jbIh9JsJHBHwYUX/uIo38ehtC/Fjyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=V9L3sOTc; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="V9L3sOTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788779654; bh=fSVzpKS/YYyYMMxwPPQTSDGVAtpZRqUa8+PAUJd3p7k=;
	h=From:To:Cc:Subject:Date;
	b=V9L3sOTcz9KwUUG/bbNtFGjICkn4jGRJrwYX60PAmT1zCqEVy8LmFYD/jjVblkTfk
	 wsdVNP+GypFw3ZAckXVkVuFh9MqxScH8+DphQ4wZzD5Nc0azVX96g8i4+L26btspYn
	 oUgmTp216v3Y2LOVzX9Z4VNIdrtckFqKbCO5jzL0=
Received: from localhost.localdomain ([223.166.55.8])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 2A9A9AD8; Mon, 07 Sep 2026 19:10:41 +0800
X-QQ-mid: xmsmtpt1788779441tsoomyqxn
Message-ID: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJA6P4cVAkZA6LcNH7n20/3XC+huFHXppZr3uXt/jzf5GJfzgxsS
	 5Lypkzs9aujCfK+BAYwhnne7SByB8krRwAwgBTu67RPGojCJN4X3ZHzR+XL4Iv84mTWKOvJhDBBO
	 PEAdX5DC6mgV6j/U66DM3v850TvI/pkbdrmElpwaYlaiYjAMaz+thlZx9ux/YTFIQm96L28XMxNm
	 p0y+wTtOJJUyJajXhRdvNsiwObXIVvZOogeMvO+npgfhzI2rhVfMU0EuZZad9KWewax/O/EERI47
	 8c4BhW1XGK6ZPr582H1Qr0beV0FrD+edPpXZMFtWKhOoR7KTf2RvNmOTRMDJRhS/qiAc6cPjb98W
	 p0UX35Rfv7GEjRg8r92Q+iAFYbHvFoPg7Vvq4QQ+/xDg7AyXsRNDxDSD/nkCDhZ70ev9xDhATZ7S
	 Oceuik5LFjpwoNBxQpWbFtPBnt2iMW0tdaowMVzTSsmvVy6vbZEkRoVvWgVKKZJJRoDtjbZXzblT
	 yXRaoRtfPY8a3R1WkppdtOTBgKoCfJf84qGZ0ZmDLlHg2YFi35umOIUQ84+FOVI/0ydA62pMkKxD
	 smlcnQEMCfQG5Yt2Us/rps0R9FmvyJuBEVMihLD0gZfJj8TeUTz0ZZEdoTULCpc/QTpju8sX/BYo
	 cOrCFYgGs72FCSxipzVdFhs5ldkEr/AFQGJ89xpDbnlKDETPgVP9IJW0RD1UU3Tr94SPOt4iMpn6
	 gJmeXL5KaMdVsqoPnif8QVJUsbMy664Ix/DdOipSL99v/G+hpd/MawS61gv4WIwg3gP2p5TmWCmb
	 yNiJmD3ibU/OFaAp0k0pz4lvDIaxeKREIm8D9Boy/lknaLnSYW25T7KwdxjRp1JwtSp35LAduivE
	 fVbi2QUJYTQtPMg/gdcvAVRqclyGeYQi9zdUugaVDOozG0C/1hmpAWNVXGV9UG3zOK3dnIUfw/ua
	 4e+poXpssmuOSVGMlnItKL9dJk5UdIPmdWdScpQjdC7IRTWZ+5gMexnrgLpCw70OW0FX6P8Qg=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: fzz <1768315307@qq.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	fzz <1768315307@qq.com>
Subject: [PATCH] mtd: spinand: cache the last read page to avoid redundant SPI operations
Date: Mon,  7 Sep 2026 19:10:40 +0800
X-OQ-MSGID: <20260907111040.3305150-1-1768315307@qq.com>
X-Mailer: git-send-email 2.25.1
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

The cache is invalidated on write and erase operations. RAW reads,
OOB reads, and continuous reads are excluded from caching to
maintain correctness.

Signed-off-by: fzz <1768315307@qq.com>
---
 drivers/mtd/nand/spi/core.c | 36 +++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf9301f25e7..fc082127bda8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -557,7 +557,14 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 						    req->ooblen);
 		else
 			memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
-			       req->ooblen);
+				req->ooblen);
+	}
+
+	if (req->datalen && !req->continuous && !req->disable_ecc) {
+		spinand->cur_target_cache = req->pos.target;
+		spinand->cur_block_cache = req->pos.eraseblock;
+		spinand->cur_page_cache = req->pos.page;
+		spinand->cache_valid = true;
 	}
 
 	return 0;
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

