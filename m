Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325AA35CB95
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034720; cv=none; b=BM7w1mwnybENSm8HlGhgGcSwtLuq/98z1dvSMWjJvrMT+dUfJ9pOAjqTGgBfnNHj8cbjGr03+WoorWSVx7NsO5IxLI1p03Z0qPFXhemz16R6tRgpNe/DEL4SP2Wz/mLoFgzbi+IDZcYE+o//ROBn7ZWidWXyDcDIxRXaMftyK7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034720; c=relaxed/simple;
	bh=/F1Xym/plZbo1pfkzzAb8MvFGTETsyWQ9+sr4h1es04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdppmOM4ftKMyk9sQFsCaaXx6S9eyeuxYHr5H7LkEGxiPP/szVeEi68jVtGRAohcLkRemazSh1FOxFGgv0xnkvdTkRsgdXRQoPFjFEBU5Io//whWhlUfzA0ReHoncjlkh1+/438SyGeTlTdM1Uco+I26iuQce3yr0HOu4Rh1A2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Ah4RNaEh; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=FeP07e44; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Ah4RNaEh";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="FeP07e44"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2a6jS597028
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Z3B0
	VzQNULTJNhgjVIKqmL6RGJ59M3Q0Li1pDVIxsTU=; b=Ah4RNaEhbl9bS/ST5C+f
	t1JwEpf+jnHKIY2aDay3u23jIjzsa/hVKdNQnjmlgadGc/EO/3Hv0gxZA7O4l8+U
	S6e7gVeFaHWjI9cKylAMDi8MGpYSTG5XCCphD3vqFHmJFvM2tB8NOhobPHOt5L75
	zRjedtIPYRm61ORlYlr3Y5TZBqi4Eiyzl7OsR+K3f79PPmpb/+MP/pEAy5lEpbfe
	xsVFGZWHkxhV67TG//iZhuKzJ1MBGsvEHRXGTMAI9trBEJbnaOkjtEHZuCNc0ECg
	sDfjzZ0RLdNcr9J7Azl9AnVaMxZt8/BACD6++334s786O0uLNt01RSx+NNn2zz9p
	7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hagy3a139-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:25:17 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535252004e9so114320251cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792034716; x=1792639516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3B0VzQNULTJNhgjVIKqmL6RGJ59M3Q0Li1pDVIxsTU=;
        b=FeP07e44PcVR8vTVrrnSyILe1rceAnB/lqutUk35L0XXN2bUbMVUFFv+FPSRdocr6o
         BUnfIAEndfBkLsOndk0wZM2DKdERBxtv4zHpuZLxJQtJdqNRh3I8onfP1HZ3kCXYgPEF
         9ecSwQkppju7gMepjFF9UvD1AhFQ2xF8mLH/Y3kmk4V7nz8775OQjC6wXiMx4X8vGe9S
         cbUC09YrBewXPuiN/9d6LoDcCQdBoKR9cdgS3W89PXc5Ixg3tTgncUNiPDiK9TdivHw1
         OKvmaRPQ2ug9CU/4gpMI+EfbuI18SVG3TsZLiWoUb0joQejj4UZ7fOHvFYIVI7wrtpS4
         tkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034716; x=1792639516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3B0VzQNULTJNhgjVIKqmL6RGJ59M3Q0Li1pDVIxsTU=;
        b=Zr6y5l6KhzjIPxdU86BG+esjLed9OxhmWWXaowPa+EVBlnN/W2Y3pa3HTT9EXc1WWT
         MMehn44CLr0fqDw3ntxVU4A0bf1tim4aW6V2fC4fmlQJOny/vqXRz+S1l8b1VdfVa6ls
         aJp/LoVDG1mRJLyDJTY3/1aWR+OVWh3S9keSj1nc6WovJSmadDeAUK47FTw8Ub52u5p7
         DGmqPw73Q7zQZz83y1t/IXjQSfyPwa1qNvZWzdYD6q+ILpxaG9ZxxEYNdnobFwnYivcX
         yH4GqOdHQwTPOjO2Mp1t60wydkxm9U7d+93AAOXM786hJ3TJTja50SyCGXoJ/rkYTzSj
         /gjg==
X-Forwarded-Encrypted: i=1; AKwUvBzGNp9gO2eErnKh0DPVCNfmiBc7JxRSY5fXaFOhVT6DnmiEUchzdcod2GVohWLAliATkNDFEEdreEvmkRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHKhC1LYBO7TwIwWwy0cyjQt06MIp9JfHQ377vVatLDenmN6e0
	Su05+8LHn8J5RGJawUTh9NXlBLV6WV1wB2+psmIvMYK1iCc1+FAFL7SmPYdjshZJ2QlzZfMG5PG
	JID4V4zMHeZRa4YLs4ab3AvyErqtYh82xIH3/xEYzE4VvplUD8HdE70FWSaFHXU3EZfnpqQ==
X-Gm-Gg: AYBFou2fPcrZ95TEio2fW5jjnqfoyaTnfzK1Bek4BOIhDSaknO62kpBaNE6fAEKAoWJ
	OYgB/VpeKW2quE6K5MnDy7ADZD+qd6fDp06DXPZ1xbKLYEHMNE44mlomxdi3ZHcLYhezq6gX1ln
	t89sCWTngiBGrHoZo2q5BFd2vI8iUg/9ylAo9mux/KdV2ueB7CMJaUs94gVxdc7dWPkQAK5xAeR
	LofvX1qHPZ8++vLi8CDG7f2GtHD0aw2KkRZR08dtAUTtVFGzvq0oGHE6TixPRelsB0zzEEOHBDK
	xloO7VRD0qmHz7zKPnOxnpDBcCNeY5cT4uNlfqy/X09p0BKBdqnNjD89yT1z7BADNdoiyZUvebH
	7ryM7kBXXLPFTyn6cZk0gD4W853RVUxGv2SOiMaSg4lut
X-Received: by 2002:a05:622a:1e1b:b0:532:cebf:489e with SMTP id d75a77b69052e-5359faddf6bmr279562821cf.15.1792034716154;
        Wed, 14 Oct 2026 20:25:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1e1b:b0:532:cebf:489e with SMTP id d75a77b69052e-5359faddf6bmr279562601cf.15.1792034715630;
        Wed, 14 Oct 2026 20:25:15 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127bac07sm15022721cf.14.2026.10.14.20.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:25:15 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:24:59 -0400
Subject: [PATCH 2/2] mtd: rawnand: nandsim: stop pre-populating the cache
 file's page cache
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nandsim-nofs-v1-2-47e49f37e387@columbia.edu>
References: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
In-Reply-To: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792034707; l=5558;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=/F1Xym/plZbo1pfkzzAb8MvFGTETsyWQ9+sr4h1es04=;
 b=8uT6TvQobQiYAqv0rTOpufo+w8rCOigosEixXsjaZzrly9YXH2KdyJoClhTJyWRdlLuSE8XFJ
 GGD0eP8YGxgDakLiOO1H7tqPASyYLOSzLLy2msB9nwH8a7WQEI72fPr
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: 0Wrjfdb7z5M51KXTanYivg9WJr-KYxuy
X-Proofpoint-GUID: 0Wrjfdb7z5M51KXTanYivg9WJr-KYxuy
X-Authority-Analysis: v=2.4 cv=A675rKWG c=1 sm=1 tr=0 ts=6ad0479d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=CwNomYb1yIFRST93nhMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfX85IaI9gKAvJj
 io9s6IGF5oollduNWwBXl8gwEXLpHbjgYNkxMWq91b2daakZtAcPyTAgfQfjzultKOWdo0Ol9Kb
 M/nV36ERTTbONLcCwMIx4egcR4oNBKY90vQsYcfJVO4/eJqFW4uU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfX8tO3TmJszLiA
 w3nGRl4mYgA0J7uUhqMSblVpOq9hd/Vkz0/cbZfM8+c9k5DlWLyA01+bfhozVVzQBxZBa3yIKty
 uzPE8M9XbCBu8OJCEsFTBo1Xw0eyFaov+LRyd4kZ3c4oiejlo2BjQfjqrGLztpbNxOW+9T9Kf+y
 M4sO1JG2KggkYjUgLbStpKoVr/6fq6FNUNESNADtW2v7BSXjqlx1v9uAq9FjGHWQJhuW4u/Lil3
 oK4MXySR60mdvr6u+E/gATW8mB93hptfmYDOspnS60cFtgsQtDi0wijWm4w/7/9d7LjGt+BMPk1
 ug6svrbHYQHbAIoA1wasp6EEKoYrx+o1pitNoS78jAqxqGOjK1azjL6dkvImerPaFtDfIMgIe90
 u7PmDWwL6VBrMOP1XetNSLqATpB4YnYI8nrhyAHEth2f+wrNxW8Q9iYyZpvd3XTm0gDFaf6Bhwu
 NWPI7WXS4NXly5P64uQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=10 spamscore=0
 phishscore=0 bulkscore=10 lowpriorityscore=10 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150013

ns_get_pages() grabs the page cache pages for a cache file access
ahead of the read or write so that kernel_read() and kernel_write()
find them and don't allocate on their own. Now that the I/O runs under
memalloc_nofs_save(), the pre-population no longer buys anything.

Remove it, and the nandsim parameter of the two helpers that only it
needed. This removes the last struct page usage in the driver, and its
last callers of find_get_page() and find_or_create_page().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/nand/raw/nandsim.c | 73 +++++-------------------------------------
 1 file changed, 8 insertions(+), 65 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 4559df2cfa3c..7de2f584795e 100644
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
 	unsigned int nofs_flag;
 
-	err = ns_get_pages(ns, file, count, pos);
-	if (err)
-		return err;
 	nofs_flag = memalloc_nofs_save();
 	tx = kernel_read(file, buf, count, &pos);
 	memalloc_nofs_restore(nofs_flag);
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
 	unsigned int nofs_flag;
 
-	err = ns_get_pages(ns, file, count, pos);
-	if (err)
-		return err;
 	nofs_flag = memalloc_nofs_save();
 	tx = kernel_write(file, buf, count, &pos);
 	memalloc_nofs_restore(nofs_flag);
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

