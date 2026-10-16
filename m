Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393D5547040
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175502; cv=none; b=NoVcOMgjvdSBUBZUpdLwxlwkxADWtLYJeAPjbvHJHaml059uyJ2eIkAo3v0Q2d5TVgJGZpODR4Pa6+1hq7uvRbnsdA2qJ79A3wr9ow9GZccA78ODd+kN5Uyks/UTtyzRUZemkMiCxCP7IZmUDwBD0Kf8s4f7ZTPW7Yl0jwQhQEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175502; c=relaxed/simple;
	bh=XTm4Qvoor35FUd7u0ZYHFCtCOMIvIwCMsY0IIsQzD0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uys1QJPCsDbU8TVBl4sEIikxb69uins8parNxxvyhBfHiDqHFxP8nC/r5NP7mt6aVFIrb7wg1xDiz8ENumpfN7BxoAqidaQiN5q8vgVA429isTKiYY1xdfPD85mxSdVWhrXOS+FeGyp+5OD/Gx0JtbppfPu04UiGFOxBD2Tc8q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=b+xbGtwv; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Q1aCKXrU; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="b+xbGtwv";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Q1aCKXrU"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GGXuUL1471216
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=O8eL
	C8DAH1u/wzn7V277vG0eEMWSE8tpiIZ8joadYhU=; b=b+xbGtwv3JbekXUySiWx
	AGkKgYse6CxobVwBFmZjXuoXjZmV2QKoxTTjo514IOTb7EYpf6lG64xDUmJzcgiG
	Rq/z8ke+bnUUewPWFHrUQ3hmKYCWHL6QSPkkdwGEHIseK94vQl/OoB953CLrAqNN
	n0hf+bDuqsMnmpkK+S8jh8mQKrw8LfwtRkF97L0QSRNSCRmkkCB1JDeX9u4aOyzM
	3EpJpYDry/MhdoARibp8lzhommFoXfCIt/y9Q5GLlrK1ggL0ndfSRpzCaiVdpFc0
	Fa9wc9yDKiX7J4sa8jPlPPDELdL6U6qjyKrxwciavLaiSqtrYC4gYTBGh+IM/jNh
	Lw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbg72m661-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:38 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-534f3fe0236so3395171cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792175497; x=1792780297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8eLC8DAH1u/wzn7V277vG0eEMWSE8tpiIZ8joadYhU=;
        b=Q1aCKXrUgSz3vIPtuWjQ4tpOxkIJobA5hsoEfm13lVpzJl5lTn03TjpX3Vjzp9fFGn
         vSq82Jwr5r8MyGUd1b3MWg997tKypuDGlbIUrpHOC227mt04hoNaK1fQrg37x2Wg38sk
         0pSKDRXkY6wyqXewLlvMbA0+d4RpTQ/1LHuaaAkK6y78OfyqdV9fFTxJwHBELRIK+DKI
         4h7Jos+ZUohAg/rJK435Fw6qvNLeg3Xx6IuUqwEApCgKGTZ5FJC5lKBZAZeyV3o6aa3S
         W4e5EpjfnbsTFlrFoobI+u17ig14g2lo7FsiOIh/ddTxkO60kqABJZ2TAehjWEFLKY81
         a76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175497; x=1792780297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8eLC8DAH1u/wzn7V277vG0eEMWSE8tpiIZ8joadYhU=;
        b=E2V4ospnvAvUkTVLD8/Hh2HsTp24Mo65HMaFLPMasH8poh3+Db4E5ue+f8hoyaGXL/
         8Sj27cMg/+GKzZpouA3rOIQ2zoZ/VmPw/YfUeDQ3eEtUMwzFJU790kjPOJtxZ04FiScj
         JnKVMRXdSIkj6FNQU0eEqMlNmRkXRgevUk4Z5Q758fFAE7rh42a6lXzbf44x9yWBAyrr
         KuoY8PmKExFmtGVeQTblPvQsaZGOdAf0qhknpYd9HBeBkOk+VZnLc05ckj0gj/reO98B
         AwqucOQvVXfEgd6Mb2TgXFvNWVHfdPrevamABL1D70Ul0cqC8O2+aKmh6XUOxYbkZ8q6
         tU1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz70/aVW99B8RZ/yHYJ4ZZXMpBQca1LqV4MZhzd4nCyOy4yL3hGzwjGZRaFT6voYv6nnHhphx+/N2OoFnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs8ZaN7eP56N3xjUlZSexIswsm9qxj19AZdCqT5OaNF55KG60d
	DQEFU2qfB2zrWR6WpekaCyg6c3NVejol3e7r1ffQ09SO6GRGGs+W17jVML3AMrTQiTPLq6ueXM3
	2Gb2VayOAZY7CrFn3K8AedGwvwszRT8loz9mrQDDdxpJ0u1+qHE9es0lREeWdzw==
X-Gm-Gg: AYBFou2FSE4ORjcWxwowz8qguqdLg774POAcd63oqtGLei8j5eejW/xmSKTK4nDNN2m
	Is4IC3fo9ce1FbceRxRakOlq72EbL3//X1ro0m4yPDLygJqeW37zeyjs11F/UyvjGDcOG0gVBSR
	Mk2PY/n66mz08KW6kNiwTXeOOJeMNB1+yTDRmqxw4IV6YoOZbeFTJnEUqqu9RsiySQceEZN2QE/
	vjmsplPrW/ddb4VTmPEX2qhBLwYoq+yBKmkOZvyZ+VN2pl3pNvUK7e+QTq4NHfAoEn4Z9lmtZfe
	DkZGO0dlmvLS71vN5xvz+rSS0+q/1DGnBxac6I38x6QLsAMaphmt2tVzkshF75tdvzJvVwk7/jv
	ZiPih6osoNLM6ysU5VXXUbifTWFLcUs5T3f6vhcwpcKFD32o=
X-Received: by 2002:a05:622a:c85:b0:535:a5fb:644b with SMTP id d75a77b69052e-536460f7150mr5637141cf.69.1792175497139;
        Fri, 16 Oct 2026 11:31:37 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:535:a5fb:644b with SMTP id d75a77b69052e-536460f7150mr5636471cf.69.1792175496631;
        Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb30509sm29187696d6.36.2026.10.16.11.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 14:31:20 -0400
Subject: [PATCH v2 2/2] mtd: rawnand: nandsim: stop pre-populating the
 cache file's page cache
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nandsim-nofs-v2-2-f705c8819d11@columbia.edu>
References: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
In-Reply-To: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792175493; l=5558;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=XTm4Qvoor35FUd7u0ZYHFCtCOMIvIwCMsY0IIsQzD0k=;
 b=nhAk4Hp+snp2ongccKLDRV9YzotpC2vYEwTYWbMVB0XTreCHbsmDqIO0FgAQtr+UE3hpUzEwp
 2Xm8MB9yNZZBsPRqM4RFXrPhtOcnyYa4fRObTomUMrx7s2U9u47JERz
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: SdGkWLsjY4UyYNotCE4xOYNlJOyBTZq4
X-Authority-Analysis: v=2.4 cv=W/StxhWk c=1 sm=1 tr=0 ts=6ad26d8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=CwNomYb1yIFRST93nhMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SdGkWLsjY4UyYNotCE4xOYNlJOyBTZq4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfXytZR84cnSniP
 bMtWrqpkqDG55PBI0SA1AI7N5umyTcss5Neba0v93tumvpMsD78v75IQpsBDLAe2u2OF/mNZet1
 O2Lc8SlNwfMVilI8mtEg+lIXv8I0SdPKocNmlAPI4M6iYQ4wYiqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX2Sm77Cn77Oe6
 UVYthHb9wc5fEqBum0XDWEjnFkm/+yzAsQn790UU6kkjDzIxUkopqBubwxyV1aigx80+OTEWPCs
 p1XOEoIbKn6II9XNnpVmxg8Oq98ym+31ynjIyVpWbS9mYCgkd22kRbJIO0y3eK3QYkr34xxJ25G
 HBLA5LbxqBZbsmXPx3B6UlZgOggXqcPrtpJPCfkuw07HeVIrP/13NxkMHtzahGl/MZiZoUfWHfw
 U0GMBGNgNFYU95rlzPzQiNjYJi+xXxkufdLeg/BxRRuBYnP/pclpSR9DIgdfNcthIt3INVcIbtr
 BHvLSF268kHg/+lQtj2PH1skLxHDg61pk4CW5L8iYmyvW38ajdLuygSwvochNWT/ht5q3CWeEwr
 d7UDr2qxNadLNqAnSY3vUZh1vfoZxgofMY8ox/l8R8v562fTZmy7Y0auPhC1JBY52fHMlNENBSc
 nvUs5yeUpcfTc9mKcZw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 phishscore=0 spamscore=0 bulkscore=10 adultscore=0
 lowpriorityscore=10 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160073

ns_get_pages() grabs the page cache pages for a cache file access
ahead of the read or write so that kernel_read() and kernel_write()
find them and don't allocate on their own. Now that the I/O runs under
memalloc_noio_save(), the pre-population no longer buys anything.

Remove it, and the nandsim parameter of the two helpers that only it
needed. This removes the last struct page usage in the driver, and its
last callers of find_get_page() and find_or_create_page().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/nand/raw/nandsim.c | 73 +++++-------------------------------------
 1 file changed, 8 insertions(+), 65 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 586f4622b59e..0a2a37619389 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -30,7 +30,6 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/fs.h>
-#include <linux/pagemap.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
 
@@ -272,9 +271,6 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
  */
 #define NS_MAX_PREVSTATES 1
 
-/* Maximum page cache pages needed to read or write a NAND page to the cache_file */
-#define NS_MAX_HELD_PAGES 16
-
 /*
  * A union to represent flash memory contents and flash buffer.
  */
@@ -353,8 +349,6 @@ struct nandsim {
 	struct file *cfile; /* Open file */
 	unsigned long *pages_written; /* Which pages have been written */
 	void *file_buf;
-	struct page *held_pages[NS_MAX_HELD_PAGES];
-	int held_cnt;
 
 	/* debugfs entry */
 	struct dentry *dent;
@@ -1297,77 +1291,27 @@ static int ns_find_operation(struct nandsim *ns, uint32_t flag)
 	return -1;
 }
 
-static void ns_put_pages(struct nandsim *ns)
-{
-	int i;
-
-	for (i = 0; i < ns->held_cnt; i++)
-		put_page(ns->held_pages[i]);
-}
-
-/* Get page cache pages in advance to provide NOFS memory allocation */
-static int ns_get_pages(struct nandsim *ns, struct file *file, size_t count,
-			loff_t pos)
-{
-	pgoff_t index, start_index, end_index;
-	struct page *page;
-	struct address_space *mapping = file->f_mapping;
-
-	start_index = pos >> PAGE_SHIFT;
-	end_index = (pos + count - 1) >> PAGE_SHIFT;
-	if (end_index - start_index + 1 > NS_MAX_HELD_PAGES)
-		return -EINVAL;
-	ns->held_cnt = 0;
-	for (index = start_index; index <= end_index; index++) {
-		page = find_get_page(mapping, index);
-		if (page == NULL) {
-			page = find_or_create_page(mapping, index, GFP_NOFS);
-			if (page == NULL) {
-				write_inode_now(mapping->host, 1);
-				page = find_or_create_page(mapping, index, GFP_NOFS);
-			}
-			if (page == NULL) {
-				ns_put_pages(ns);
-				return -ENOMEM;
-			}
-			unlock_page(page);
-		}
-		ns->held_pages[ns->held_cnt++] = page;
-	}
-	return 0;
-}
-
-static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
-			    size_t count, loff_t pos)
+static ssize_t ns_read_file(struct file *file, void *buf, size_t count,
+			    loff_t pos)
 {
 	ssize_t tx;
-	int err;
 	unsigned int noio_flag;
 
-	err = ns_get_pages(ns, file, count, pos);
-	if (err)
-		return err;
 	noio_flag = memalloc_noio_save();
 	tx = kernel_read(file, buf, count, &pos);
 	memalloc_noio_restore(noio_flag);
-	ns_put_pages(ns);
 	return tx;
 }
 
-static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
-			     size_t count, loff_t pos)
+static ssize_t ns_write_file(struct file *file, void *buf, size_t count,
+			     loff_t pos)
 {
 	ssize_t tx;
-	int err;
 	unsigned int noio_flag;
 
-	err = ns_get_pages(ns, file, count, pos);
-	if (err)
-		return err;
 	noio_flag = memalloc_noio_save();
 	tx = kernel_write(file, buf, count, &pos);
 	memalloc_noio_restore(noio_flag);
-	ns_put_pages(ns);
 	return tx;
 }
 
@@ -1436,8 +1380,7 @@ static void ns_read_page(struct nandsim *ns, int num)
 			if (ns_do_read_error(ns, num))
 				return;
 			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
-			tx = ns_read_file(ns, ns->cfile, ns->buf.byte, num,
-					  pos);
+			tx = ns_read_file(ns->cfile, ns->buf.byte, num, pos);
 			if (tx != num) {
 				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return;
@@ -1511,7 +1454,7 @@ static int ns_prog_page(struct nandsim *ns, int num)
 			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
 		} else {
 			all = 0;
-			tx = ns_read_file(ns, ns->cfile, pg_off, num, off);
+			tx = ns_read_file(ns->cfile, pg_off, num, off);
 			if (tx != num) {
 				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return -1;
@@ -1521,7 +1464,7 @@ static int ns_prog_page(struct nandsim *ns, int num)
 			pg_off[i] &= ns->buf.byte[i];
 		if (all) {
 			loff_t pos = (loff_t)ns->regs.row * ns->geom.pgszoob;
-			tx = ns_write_file(ns, ns->cfile, ns->file_buf,
+			tx = ns_write_file(ns->cfile, ns->file_buf,
 					   ns->geom.pgszoob, pos);
 			if (tx != ns->geom.pgszoob) {
 				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
@@ -1529,7 +1472,7 @@ static int ns_prog_page(struct nandsim *ns, int num)
 			}
 			__set_bit(ns->regs.row, ns->pages_written);
 		} else {
-			tx = ns_write_file(ns, ns->cfile, pg_off, num, off);
+			tx = ns_write_file(ns->cfile, pg_off, num, off);
 			if (tx != num) {
 				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return -1;

-- 
2.39.5

