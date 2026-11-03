Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711869;
	b=be6j16jZDv3hPp8iZJo+3TwMN6fC/IKMJfhukENCU+KQqBL61X1CS3Hk0yxdPSEJzgh7
	 +XTKvSccUpC/92xkm5HSOnScGFGgHCbXNuJArVrR9JKY4dIM6bcdVvHEael3QzNymKobw
	 GGvKY+PC+RyKelgHLPISOUbInzPnSaR0IbXqkU39sg5HRuYKBczr66BY0zhLb6d18DHTj
	 NzDCEnZfojIZBm0R0XKuVsKQV/8psgeMHj7u1ejL4AsRJVYYQdh576g9iWpXuObMbAgS9
	 sEFD2SpvMK/tg2EOAv19Wq3nO/91qShbtAPabcYcuJSksoBydu1CZU03bJMnOJNEhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jcPg1aaiTAlATaZ1v3nVonIRAz3AoliPFd68t5iVQ3A=;
	b=S9AFft17KCaXRctB7aO4/kgNxYyNK7Sxw99VFw2IIRPEPkE20Bq4GNGcsalz3uSLvzkC
	 jFdkTwnwGjGer+QLA00wSXSizhxywUgl7hQFMfdMIpDNmZFWF44bX7H7oz5A9hCzjmpzE
	 s5HXoLqXgwqRiwK4F4ui7xd0JPbKy0Z6QGsU9bHRgMvc3WiAcZBjB6WZfQa/DJuRV6PIP
	 WAIEin5DnqyzOJFgFUHqqaFJVkP8v80hCh4ZCjhDbibSMLR4Ryn9s5AUDcz7sUWPV8oQv
	 8ZU0Zp0liWPxR6MFjK5Mxe3+KpPT2PXy0YLh5+Lf/rMel3ZB5/xtm3Os2EqIk4m5XoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=YjHJrPLk;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=TRdiIiVd;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E3606D837
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3E3606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=YjHJrPLk;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=TRdiIiVd
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38xKqj522715
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=jcPg
	1aaiTAlATaZ1v3nVonIRAz3AoliPFd68t5iVQ3A=; b=YjHJrPLknekV0oaH7LWj
	K2jemgNlGJCANHD9DgquV0EQ9v6e7Sas0C3Gh8mVcfIliyxzBOLD/ga57iEI3qym
	43Cvdi7pFKAX7jvzQ/t2Hs4IKl81+JiADlSobXXUOz0H6u6wC+KnQOJPjyTBS3vA
	VPJ5GTMpoBJILCfxgW01iP1rc1uMkw6dGm7iYxxS180DNwfJ+C6SLrBsmtl0ZER7
	1rh8A7uv9US2MySz8KSYc2937sWf/BBUaxiOzD6sVwo49QHeHOLlxmoMstkvcaC5
	aUSlXRSxB/vE1E2ZLZ+punrzOE8CaDXqdffkxCmxgILlU3+ypb7jl1EFQ9h4Ltsb
	Vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hqck8s5pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:48 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so775157485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711867; x=1794316667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcPg1aaiTAlATaZ1v3nVonIRAz3AoliPFd68t5iVQ3A=;
        b=TRdiIiVdwWaxljbf7fwt4GbO7kiAsFewDE3+SdUEYcZkeNqnxuPPsZdUE4nrrb7W9M
         53oL1jUdkm4o+BA7X/GC67R0CcLoPc4Xrr3V3QT9cIZUD2pBS5FoGSuAote8L6FDeUnY
         UhpwtkM/7LN6W8wAlJHiVzO0oonzpieU2i/EjYLB2RyJiAfQm7Gh3FtyKdHfUMOGMg98
         wCZklMxfzWgkoC6kXQxWrg15rUt7rkc4fXTq2ImpSk0QAPcdkmTUzxIoqWM9Dl3cUKU4
         UZnkOlhazOnhYrSwCSvxdEDP4oUx5RsplSk1izEMZjVUHOVjotqkJN1Fq+FKgDCpXpPA
         TVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711867; x=1794316667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcPg1aaiTAlATaZ1v3nVonIRAz3AoliPFd68t5iVQ3A=;
        b=RxEBXoE1UVFKa3qoB53HLh6oVxc7XbzXbpw6F4a7ignMTGb4SmfBVYSc17MtoiI4mw
         oe011tAu2mmZv9JqLr0QtZ4tQJfJjGUb4FpO2k/cNJSQt6H5aw9RsqgRPVDADZJ4Q+SK
         qnuBrBaImNs0w94hLGTsmkQ+UF7Ls4/M7bHHWJvz0+KFcvEdoLRI5bqBccIHol0eOSN6
         PzpFl7cUHvSSlmS/itecGXaH1Kwo5hi8ReoRz+1046uoNTz4do5Y5WrBCID1wQNBEmSL
         nwgo+tB45gDjuyOm25HZb4UmKXUINbGYcGybEQU0ep/yZiBddsGFcrSs4R7NafDhB/qP
         rllg==
X-Forwarded-Encrypted: i=1; AKwUvBxmDaw2m2HupzBrlN7OXHu2er0t6g2u7h3B7DLlizzjG7CDZ4cO/4d8CdjQc/HaLWyrbGjStegdsBg9n0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jFcn+XVcqBOtXie0Ra+abSCfLYs8K6bDzMOLgJad/3qC9hjRA
	3B39nudhfKgp/YZPHLbh3ukE8zgt4j8algu6/dFHBeZdoT9Dl8nkPvABUsIWXZgswXjz1Cmy4+y
	afwp47+ReEernW0OriXV7VrDBYOVVgMQ/TWefJU8JlcYGFkJw6SX2Oi0wvlXEdw==
X-Gm-Gg: AYBFou0MxwTH/awEEVkTlSibQL/bV5wV+eB0a6jltONfVWWSgkyTcynvxfA1LYMWuNV
	MEylwFNWvr7QqD/12dCjQiJYeVxmlkLW0Pnu79CLTUTWsu+TySo++ZDGMMUaA/+AY4fxrXjoAKV
	Ukg4syg4pGuvHEzIJ67+uZ+QWle2BVkCScY9GCU2nwcdweKUa+IlmyHG5j+vxD9JCva6T8Hm9rQ
	DB1I9Wt2/oXKfiYd/SPC2LBbJz/4CzdZWZC15v19pUqziw0+OJmF6HuUPLOOOutaUaMCA3lGddB
	94PoTQcghKT48lDAGw+3LiFIza7rxnp8MWzJshpngb8AeunPP7N/QVq+EPNdZlWOU2dIVivqotn
	X6GbaWPhWOGJLI4eh+/92uv8Yn5V/9Zs6162sgxEVsmpWh2rkBKswLaFCDzo=
X-Received: by 2002:a05:620a:3703:b0:93c:6417:f9c8 with SMTP id af79cd13be357-94421719051mr2166473385a.29.1793711867171;
        Tue, 03 Nov 2026 05:17:47 -0800 (PST)
X-Received: by 2002:a05:620a:3703:b0:93c:6417:f9c8 with SMTP id af79cd13be357-94421719051mr2166467385a.29.1793711866491;
        Tue, 03 Nov 2026 05:17:46 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:45 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:04 -0500
Subject: [PATCH 06/16] squashfs: convert squashfs_readpage_block() to
 folios
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-squashfs-folio-v1-6-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=6684;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Ij8sgRZHXpVxFWe5M01jleWdzMzvT5LJPL8abnGL55w=;
 b=X/7NJdUE1e4v8fyWJp4U4c9S1DEx3gW+i+yI7Bex3dguPF9ezr56YrqAaV0cKQxsTolC28hJv
 UM8xgmKq95dDsit6j7yMnsEJBZXuKfC+b/TmSzqtblfY4P37OkQ26qc
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXz0MZ0Um9ciGK
 BSWmFE7t172wg31v+6sobLY6zB3kPFjetUTdH9ThrqttGyExexa6j6yIqyAwfORARTylrG3+oOK
 B6LXjvWG+pbeFNSTxRFRXwSpKTk9qZhimenCtNdJK8dj0AGCtEE1JSay6wQq35B7Bu05vPQcqUE
 0X92ZaaVSUdaHCaYBCApqP3w5Iz9fUJJ/deFM7jsYJs2N7UNpVj5l22cXPQA3WxvhBFYjRJ71nx
 JbOYW0O6929Y+64ejXcqK+HJR9PGezlySHLlsmwdlLVPnNVaBbBJrsNd/MoT5/Md9l0jX102/va
 uvz92ZzJqX4osdtyAzajYR/FynXPFJbikQYWs9A9oxsNwtagQVRXm6HFNIH+5jVxJnqFsG7DuDx
 t9UnaH2Op7sl8NnjZ+usel/ijoYLl+NuOxv9WaMSazQ4VoiCf3rtrzgBpd3mO6vOHoMq+c5jRDG
 yJZqLPt1tI6AMEsmwDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX6pKF8dEfVqou
 GLUx0XyTtK7gw6KiOWvdR0uwjT+ycrYyhLqHPFFwaDtIjHg38IbJVnp7IoQrV1qPlRlhkfNYpiS
 EPQJt8Y9BgaNISr9FYh/STL92J3gn+NvGPzBnCMChcKx/3Q6fBJr
X-Proofpoint-GUID: anZ-36ArSM1kqYmIcChnJcnhFAEXoXRB
X-Proofpoint-ORIG-GUID: anZ-36ArSM1kqYmIcChnJcnhFAEXoXRB
X-Authority-Analysis: v=2.4 cv=LLrz05W9 c=1 sm=1 tr=0 ts=6ae9defc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=ooRp0o8M0ftYUQVqoecA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 impostorscore=10 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=10 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030052

Convert squashfs_readpage_block() to folios. Use __filemap_get_folio()
instead of grab_cache_page_nowait(), and drop FGP_NOFS, which
FGP_NOWAIT already covers [1]. Add squashfs_pages_per_block(),
squashfs_block_first_index(), and squashfs_block_bytes() for the block
arithmetic the read paths keep open-coding, and use the first two here.

This removes one of the last callers of grab_cache_page_nowait() and
up to three calls to compound_head() per folio. No functional change.

[1] https://lore.kernel.org/linux-mm/20260830041901.2668-9-willy@infradead.org/

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file_direct.c    | 95 ++++++++++++++++++++++----------------------
 fs/squashfs/squashfs_fs_sb.h | 24 +++++++++++
 2 files changed, 72 insertions(+), 47 deletions(-)

diff --git a/fs/squashfs/file_direct.c b/fs/squashfs/file_direct.c
index 3b6aa4727c79..55286dab03d2 100644
--- a/fs/squashfs/file_direct.c
+++ b/fs/squashfs/file_direct.c
@@ -22,102 +22,103 @@
 int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 		int expected)
 {
-	struct page *target_page = &folio->page;
 	struct inode *inode = folio->mapping->host;
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
 	loff_t file_end = (i_size_read(inode) - 1) >> PAGE_SHIFT;
-	int mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
-	loff_t start_index = folio->index & ~mask;
-	loff_t end_index = start_index | mask;
+	unsigned int nr = squashfs_pages_per_block(msblk);
+	loff_t start_index = squashfs_block_first_index(msblk, folio->index);
+	loff_t end_index = start_index + nr - 1;
 	loff_t index;
-	int i, pages, bytes, res = -ENOMEM;
-	struct page **page, *last_page;
+	int i, nr_folios, bytes, res = -ENOMEM;
+	struct folio **folios, *last_folio;
 	struct squashfs_page_actor *actor;
-	void *pageaddr;
 
 	if (end_index > file_end)
 		end_index = file_end;
 
-	pages = end_index - start_index + 1;
+	nr_folios = end_index - start_index + 1;
 
-	page = kmalloc_array(pages, sizeof(void *), GFP_KERNEL);
-	if (page == NULL)
+	folios = kmalloc_objs(*folios, nr_folios);
+	if (folios == NULL)
 		return res;
 
-	/* Try to grab all the pages covered by the Squashfs block */
+	/* Try to grab all the folios covered by the Squashfs block */
 	for (i = 0, index = start_index; index <= end_index; index++) {
-		page[i] = (index == folio->index) ? target_page :
-			grab_cache_page_nowait(folio->mapping, index);
+		struct folio *f;
 
-		if (page[i] == NULL)
+		if (index == folio->index)
+			f = folio;
+		else
+			f = __filemap_get_folio(folio->mapping, index,
+					FGP_LOCK | FGP_CREAT | FGP_NOWAIT,
+					mapping_gfp_mask(folio->mapping));
+
+		if (IS_ERR(f))
 			continue;
 
-		if (PageUptodate(page[i])) {
-			unlock_page(page[i]);
-			put_page(page[i]);
+		if (folio_test_uptodate(f)) {
+			folio_unlock(f);
+			folio_put(f);
 			continue;
 		}
 
-		i++;
+		folios[i++] = f;
 	}
 
-	pages = i;
+	nr_folios = i;
 
 	/*
 	 * Create a "page actor" which will kmap and kunmap the
-	 * page cache pages appropriately within the decompressor
+	 * page cache folios appropriately within the decompressor.
 	 */
-	actor = squashfs_page_actor_init_special(msblk, page, pages, expected,
-						start_index << PAGE_SHIFT);
+	actor = squashfs_page_actor_init_folios(msblk, folios, nr_folios,
+					expected, start_index << PAGE_SHIFT);
 	if (actor == NULL)
 		goto mark_errored;
 
 	/* Decompress directly into the page cache buffers */
 	res = squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
 
-	last_page = squashfs_page_actor_free(actor);
+	last_folio = squashfs_page_actor_free_folios(actor);
 
 	if (res < 0)
 		goto mark_errored;
 
-	if (res != expected || IS_ERR(last_page)) {
+	if (res != expected || IS_ERR(last_folio)) {
 		res = -EIO;
 		goto mark_errored;
 	}
 
-	/* Last page (if present) may have trailing bytes not filled */
+	/* Last folio (if present) may have trailing bytes not filled */
 	bytes = res % PAGE_SIZE;
-	if (end_index == file_end && last_page && bytes) {
-		pageaddr = kmap_local_page(last_page);
-		memset(pageaddr + bytes, 0, PAGE_SIZE - bytes);
-		kunmap_local(pageaddr);
-	}
-
-	/* Mark pages as uptodate, unlock and release */
-	for (i = 0; i < pages; i++) {
-		flush_dcache_page(page[i]);
-		SetPageUptodate(page[i]);
-		unlock_page(page[i]);
-		if (page[i] != target_page)
-			put_page(page[i]);
+	if (end_index == file_end && last_folio && bytes)
+		folio_zero_segment(last_folio, bytes, PAGE_SIZE);
+
+	/* Mark folios as uptodate, unlock and release */
+	for (i = 0; i < nr_folios; i++) {
+		flush_dcache_folio(folios[i]);
+		folio_end_read(folios[i], true);
+		if (folios[i] != folio)
+			folio_put(folios[i]);
 	}
 
-	kfree(page);
+	kfree(folios);
 
 	return 0;
 
 mark_errored:
-	/* Decompression failed.  Target_page is
-	 * dealt with by the caller
+	/*
+	 * Decompression failed. The target folio is dealt with by the
+	 * caller.
 	 */
-	for (i = 0; i < pages; i++) {
-		if (page[i] == NULL || page[i] == target_page)
+	for (i = 0; i < nr_folios; i++) {
+		if (folios[i] == folio)
 			continue;
-		flush_dcache_page(page[i]);
-		unlock_page(page[i]);
-		put_page(page[i]);
+		flush_dcache_folio(folios[i]);
+		folio_unlock(folios[i]);
+		folio_put(folios[i]);
 	}
 
-	kfree(page);
+	kfree(folios);
 	return res;
 }
diff --git a/fs/squashfs/squashfs_fs_sb.h b/fs/squashfs/squashfs_fs_sb.h
index b87221ea9bdd..e9ba38afacf3 100644
--- a/fs/squashfs/squashfs_fs_sb.h
+++ b/fs/squashfs/squashfs_fs_sb.h
@@ -10,6 +10,7 @@
  * squashfs_fs_sb.h
  */
 
+#include <linux/fs.h>
 #include "squashfs_fs.h"
 
 /*
@@ -79,4 +80,27 @@ struct squashfs_sb_info {
 	const struct squashfs_decompressor_thread_ops *thread_ops;
 	int					max_thread_num;
 };
+
+static inline unsigned int squashfs_pages_per_block(const struct squashfs_sb_info *msblk)
+{
+	return 1U << (msblk->block_log - PAGE_SHIFT);
+}
+
+/* Index of the first page of the block that contains @index */
+static inline pgoff_t squashfs_block_first_index(const struct squashfs_sb_info *msblk,
+						 pgoff_t index)
+{
+	return round_down(index, squashfs_pages_per_block(msblk));
+}
+
+/* Number of bytes of file data in block @block */
+static inline unsigned int squashfs_block_bytes(struct inode *inode, u64 block)
+{
+	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
+	loff_t i_size = i_size_read(inode);
+
+	if (block == i_size >> msblk->block_log)
+		return i_size & (msblk->block_size - 1);
+	return msblk->block_size;
+}
 #endif

-- 
2.39.5

