Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898625;
	b=K8iNQBf7DldkRtxVxk8vEj/DeA3Z2aqDsqJ8CY1PkqIKJWJyODDzmRckbPKckUt2dpFF
	 7DPD4g8wP6JlUFzvOenhWDqVkaysHLk+YZ2sP6bEKDO4RReSQmYthFsGlJh2F6NYYaGx0
	 b8XCmYbmWW2/s1LxaMslHe+tRRbfV96PLOe/7yD4W32ISCTeTnFjbyLjxqAnCiWM9djj+
	 /Y3v31U6SWfN0n3Aq4x90YwUhW4qyfKzkUQESh0gT0DPdf9OwtByecIV0YHxY0NUEd4ne
	 dXxEaBjlBBV0UDfIhVqRnVU1CcVb7ZgIgKgQ/PIJcWSfwlA40WutVe/bQ1snIVtDl3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fR0H6dCyIChpNu61Z5VNXLB+u6i8sY7DInoW15P9yYI=;
	b=l17AtEXP6gOeD8R/UH2ggfCAiaDNybNkjoIkiT97K2VTLJhR65bsTczYuoUnb/qoU9V6
	 mMpD3XFqPPNpjoDOBcdE6YwLJQPgiShszL1UfYRAqZGuXyTMTGCYapqAHWvMCb4mM845z
	 vQO1PuaGfryxVK4oJzJxflzfI8XoWlf+3Gik1s7FGQiW6OPjNT3d002YdrD1+GT+FdpPl
	 gFWGkw653USqd6S1d0SIeLwdllAhZeDYKSUhZ1itFvx3Dbc2ghRYZVtoC2a46fNu3+sfS
	 mtIoxEeekWdxFdgSBqfY3fLZNlxu+gJqu6u/ojZbC6QGJZL7+cO46DoNF1XnNo1DtrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Yuiyv202;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=oi78VYep;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067C606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3067C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Yuiyv202;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=oi78VYep
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH5XmsR761151
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fR0H
	6dCyIChpNu61Z5VNXLB+u6i8sY7DInoW15P9yYI=; b=Yuiyv202xRkEnNSbQo1c
	IEq43u5gfqJYeWj+haa7BlWO1SOJ9vud77Kfa9FqndlpvgCHT50+z32weoWU2auN
	Q4wO0yeHDpIRGGRpRcoUjyZexMOuEqrND6v1pgyLWNz1WXYQyncCXcoshIRWjGJ0
	TeWj4QqCmeO+TPKGcwPAuKK+NmdGeGWRw4komPYrcLqnyAnIYSJCjrEhtqo4FDkO
	nWoE75y6wIfQhQ98egrc+k5WgKdbxZJa9q5ec/1IRc60/Ckey6zsuimL5M5nVn9/
	z5okXI5OahoY7uza4c5gi/DIBTqa3usugfkLGFb9VPYJn6KOx811tJOdgwszkdAM
	tA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059cng0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:57:04 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55ca34548f5so79128061cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794898623; x=1795503423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fR0H6dCyIChpNu61Z5VNXLB+u6i8sY7DInoW15P9yYI=;
        b=oi78VYepvp78VaL6VzVJ3qlLTcPH0Gml9D9hTIVjX3tvUVwyySjTavOaMMjdnwgZ8l
         LRzAkMf4h/6K/wbBYI304JavA4m5Uj/U2BesNjFPVAtWkT5s9/1AhqN3hjZRRSyRg2p4
         ZeIS0B37ONxzitIMbxLRqNf0NLc1zB60et1lWMo+Sv21Y6Zeu09CYZCYY0Peo96xLRkV
         QmEDIxBvEGvgdNtKREov/0TsrgFl2YDHizIDdFnQ0Jy9DcmtN1PtTAXHqXZtOjgtreFi
         KQfYMDLKcl0sGIgDZBdy5FwUN1K2IGuFM4CcbRuRUZ13oUWTZ3M3RC4jbix4F4RWa0mB
         YavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898623; x=1795503423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fR0H6dCyIChpNu61Z5VNXLB+u6i8sY7DInoW15P9yYI=;
        b=aAsa6FMO9E4ePSFEIeLMQQrLOWkikLsYueeFMLVCSnPHyNKx3lyN2t3CeSjH/xXNLN
         4bnCl6a0Ff+5al95H7AO1o5Cm8rcrQZRn+NG0TiKKYCW2LPVhTofFKy7o8YEdglHWRx7
         avpjWneZXyOhhnxt8Oq6id21+wA0VCqW43iLU75yNvUZ+BhxOLzvCqgp/4aRLQ7YKxDh
         BwOj6wgVj+U9yi1baVzpEpMTS81N/YqSjk10w8qkpxS8Tvmok4kCTlMSRSEa/zhQJXC6
         fUofM+ZSsOvzhXf4GfNoGoWqYwCeXrAZwsFeGUN2LmyViu6rxiC7w2uaG/mIxdaTQuDm
         n4Ug==
X-Forwarded-Encrypted: i=1; AL+hErHlELxL7NLJ2pNxWyJXSMHuXWNSYj1uCX+OBhOXqwyAEGWl789Rjj2NXS5vZ80LAbhVNlM79xqBE5hgvow=@vger.kernel.org
X-Gm-Message-State: APuU4Z99GvlaFv3UrCngXNg+UEtdNAowRp+NqJTAO+GAyuPLrT1DEQPV
	iVHik/toAGJJ/0Trfvl613JjLOCgsPSxfRaH4zwHPees6DnxUfegC+iavQGR0TVBwyzc/Ci0+zt
	uqFVlKprzOhQX3qV9F3Hy9fZcTyXmtlbnxtxaC7U0Ezg0Q0y9QUat4SVFQ6mKkQ==
X-Gm-Gg: AYBFou2WcKcxTnuNOU9kKEOILXCYVSCKlkUimZ3zz+AeE2erZ9FpPTvURmE6sOBHCM0
	nSmoxGLNUUi6u11SXJri/EHK5rwFejI7nJrdo+NWeDqqxIyTJrctyjzjg2die6mOydf91lh3L40
	fvINB2Z0K8HUY4z3EyQFDWcH5KhrQ71wEqcscdQvV8Ie8uLsdHFIqrtDFXVSoAt/MxvqxeK2s9y
	TMcE9+H8zYtIVgq+dO9xac5UKkE8gOcvT1ygPlVO7+gPU09lBP3USNmmBW7ujOicmZ59EgPbMtV
	KPOcCbDrlxpAJ6kKG9d/yl1xtZzRGWdgErpquJp8IfFhDBNaOm+iUTVi7p1XWksSFeqb3pa8VJR
	kCVFICk2q/QCDpvqYUNKZziFATLRG2dtcmJJKtLi48LAI/n2u2MpqbPgR6OucJDf4aT42SQEckS
	7bwVgNnq+kmJJowButpA==
X-Received: by 2002:a05:622a:514d:b0:55d:3350:d260 with SMTP id d75a77b69052e-55d3350d482mr101909861cf.22.1794898623044;
        Mon, 16 Nov 2026 22:57:03 -0800 (PST)
X-Received: by 2002:a05:622a:514d:b0:55d:3350:d260 with SMTP id d75a77b69052e-55d3350d482mr101908011cf.22.1794898616569;
        Mon, 16 Nov 2026 22:56:56 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2006csm98408871cf.10.2026.11.16.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:56:56 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 01:56:17 -0500
Subject: [PATCH 2/3] jfs: allocate the log buffers with kmalloc()
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
Message-Id: <20261117-jfs-page-leftovers-v1-2-2722918aacdb@columbia.edu>
References: <20261117-jfs-page-leftovers-v1-0-2722918aacdb@columbia.edu>
In-Reply-To: <20261117-jfs-page-leftovers-v1-0-2722918aacdb@columbia.edu>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794898606; l=3939;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=k78p+LfUD+v5kL3SQb35zpTe+B0cspWb+IcaTC5jO7w=;
 b=P0gnBJEWtOqHwvvVdxsX7IVB81N6LzrEu3opWBSyU8JTruRr3wbLek6paJzj74l7PvGzg3/kE
 BdPIPh15z/0DssGN5sGGw6dMaILVriZSRLxBu4XLwkCQSsA/CLtM8v9
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfXyjLwXJhDXdNk
 TUjfzlKL2RcZRfO2CcSWJTZ3eMOOlBVdjhQyKI1Zz1h8ARTPqyk2vSWDeiToh97Gz1+cRWGakWL
 LY16Pr5sDomTOzLe+q7RNOrdbYfkEQdppafzSuMyHAekceJNEaki
X-Authority-Analysis: v=2.4 cv=MsPHeGae c=1 sm=1 tr=0 ts=6afbfac0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=bV8h02UIR3vtRmO60MoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 23i7CvfiSDGGKruA8jjaGzvSbo0IhnBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfX07iCKdwGVDdK
 7tTz8ts8TNI9ppSgTCY7mmesTCV9AodPR15LpRQj9OUlQ9qHhowYq2lNweKrI9UW+m9xo6CGNTp
 39yAggTV+lM8TnKUsi6wm6aGip1kx6im2Z3CWNS6H50cTeEaSnBKC7nQhe5roMp3q/G8YrHR381
 zSag75GfpeAIWDGCqpjrqz4WfTRHTwlO+Pl4rDvY16JisN0P2fjlB/EtIZDptMwC/ZDfqVUAH5k
 s9woBziQUNc1or2laxNua5iK5x8NJJyck3AoGYfVHxbu6OsaFik6efLTXd/G3xip7qwsiYjRBfG
 Ye6VCN+XydGAPgpItyF/jC+4jknI6UMHiUe7AArItKyCOeuFja+mMwqUvbmL+fcUcrPK5YmBvuM
 cCMTNr+2BKoN+hOuPZs81Bf8hXEE5K+KmyG9aj+PTg50pETDzrGooq7/QP/fGHHZQaRuP80BpCv
 +o0iKR98EjCe4qiNXOQ==
X-Proofpoint-ORIG-GUID: 23i7CvfiSDGGKruA8jjaGzvSbo0IhnBt
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=10 clxscore=1015 impostorscore=10
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170027

The log buffers aren't in the page cache, so they don't need a struct
page. lbmLogInit() currently allocates whole pages, splits each one into
LOGPSIZE lbufs and takes a page reference for each.

Allocate each lbuf's buffer with kzalloc() instead and add it to the bio
with bio_add_virt_nofail(). LOGPSIZE is a power of two, so the buffer is
naturally aligned. This removes l_page and l_offset from struct lbuf.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/jfs/jfs_logmgr.c | 45 ++++++++++++++++-----------------------------
 fs/jfs/jfs_logmgr.h |  2 --
 2 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 306165e61438..ad77fdf56149 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1795,7 +1795,7 @@ static int lbmLogInit(struct jfs_log * log)
 	log->wqueue = NULL;
 
 	/*
-	 * Each log has its own buffer pages allocated to it.  These are
+	 * Each log has its own buffers allocated to it.  These are
 	 * not managed by the page cache.  This ensures that a transaction
 	 * writing to the log does not block trying to allocate a page from
 	 * the page cache (for the log).  This would be bad, since page
@@ -1807,33 +1807,20 @@ static int lbmLogInit(struct jfs_log * log)
 
 	log->lbuf_free = NULL;
 
-	for (i = 0; i < LOGPAGES;) {
-		char *buffer;
-		uint offset;
-		struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-
-		if (!page)
+	for (i = 0; i < LOGPAGES; i++) {
+		lbuf = kmalloc_obj(struct lbuf);
+		if (lbuf == NULL)
+			goto error;
+		lbuf->l_ldata = kzalloc(LOGPSIZE, GFP_KERNEL);
+		if (lbuf->l_ldata == NULL) {
+			kfree(lbuf);
 			goto error;
-		buffer = page_address(page);
-		for (offset = 0; offset < PAGE_SIZE; offset += LOGPSIZE) {
-			lbuf = kmalloc_obj(struct lbuf);
-			if (lbuf == NULL) {
-				if (offset == 0)
-					__free_page(page);
-				goto error;
-			}
-			if (offset) /* we already have one reference */
-				get_page(page);
-			lbuf->l_offset = offset;
-			lbuf->l_ldata = buffer + offset;
-			lbuf->l_page = page;
-			lbuf->l_log = log;
-			init_waitqueue_head(&lbuf->l_ioevent);
-
-			lbuf->l_freelist = log->lbuf_free;
-			log->lbuf_free = lbuf;
-			i++;
 		}
+		lbuf->l_log = log;
+		init_waitqueue_head(&lbuf->l_ioevent);
+
+		lbuf->l_freelist = log->lbuf_free;
+		log->lbuf_free = lbuf;
 	}
 
 	return (0);
@@ -1858,7 +1845,7 @@ static void lbmLogShutdown(struct jfs_log * log)
 	lbuf = log->lbuf_free;
 	while (lbuf) {
 		struct lbuf *next = lbuf->l_freelist;
-		__free_page(lbuf->l_page);
+		kfree(lbuf->l_ldata);
 		kfree(lbuf);
 		lbuf = next;
 	}
@@ -1971,7 +1958,7 @@ static int lbmRead(struct jfs_log * log, int pn, struct lbuf ** bpp)
 
 	bio = bio_alloc(file_bdev(log->bdev_file), 1, REQ_OP_READ, GFP_NOFS);
 	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	__bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
+	bio_add_virt_nofail(bio, bp->l_ldata, LOGPSIZE);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
 	bio->bi_end_io = lbmIODone;
@@ -2117,7 +2104,7 @@ static void lbmStartIO(struct lbuf * bp)
 	bio = bio_alloc(bdev, 1, REQ_OP_WRITE | REQ_SYNC,
 			GFP_NOFS);
 	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	__bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
+	bio_add_virt_nofail(bio, bp->l_ldata, LOGPSIZE);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
 	bio->bi_end_io = lbmIODone;
diff --git a/fs/jfs/jfs_logmgr.h b/fs/jfs/jfs_logmgr.h
index 09e0ef6aecce..e8f43c25deb6 100644
--- a/fs/jfs/jfs_logmgr.h
+++ b/fs/jfs/jfs_logmgr.h
@@ -455,8 +455,6 @@ struct lbuf {
 
 	s64 l_blkno;		/* 8: log page block number */
 	caddr_t l_ldata;	/* 4: data page */
-	struct page *l_page;	/* The page itself */
-	uint l_offset;		/* Offset of l_ldata within the page */
 
 	wait_queue_head_t l_ioevent;	/* 4: i/o done event */
 };

-- 
2.39.5

