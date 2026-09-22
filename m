Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31D13B71A5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045670; cv=none; b=ljPjUkgm0LT7Ih5SMrM9xopw5UO9YfMW+klih5EhOPIcxepPmoxVH1Zd4NMkvf9xOqEDWp7ZpmLBbM1WWYcInCsIXlUUPKgbmVGxhMf/u0p8QodD1itdM6IFMsKEwNnQ2scZUwkypf7jft6eZYJI2aX06ayKctoJ7jiTuyUR30g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045670; c=relaxed/simple;
	bh=hK0Uz7nHtHESSVhEzTWW91QCtYxv5e3ePGfGSFiFjUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFkORpTIAUBKjyLf3PRKiMEvUwBb1VREr3RaiOxKAqWZnMbZMXqp3q1XpDldyLp4fXP/kzhBcRCpcvDIfvOlN2pLLXnLCY22izUk+InPMGTCItBAXH8NpA+8/ddxIO8WRrHKhPU6qnhgbIhxSwmkJzukWA89gOrWhxdhL+uFpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XR+cRPvr; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=q5p6L6TB; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XR+cRPvr";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="q5p6L6TB"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2X24R1013705
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=f1I8
	+ew540ISvrOYz3s2O7GFW/de6MBJ+lvSs1/O5tU=; b=XR+cRPvrRFnsNbojp3cv
	kQsoAc+1lxFomCgj2n5cMTA51etl+LING0y6gD6v9iSRQlSk6gMN90rdHAyE7tlk
	+2zvO2ZGauGLe0bYpfN7GqfgBCNTWzcu81rh4oWT3f+IKIkTa3bs5JXUVCbBRBy5
	OTqP3Xil+bswL7UDkdkIUBNWp5o1PDIO3LKGP4CYUl0FO4K1iGj8xrFTKswjdoti
	zkXDxTDonQGdMW2C7F9bUatSgarAB6/+y+pXiBHIAfWUXQ68TX5VBo589Yzl0W6O
	Iowu0DReBQmxuYE+Rh2elbpQGV9nsfJ2WH9LQlFjLM6nJH/hsa2AuAsAhzLIb/2A
	dQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gu6vqctqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:17 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fb8f67601so43239381cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790045657; x=1790650457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1I8+ew540ISvrOYz3s2O7GFW/de6MBJ+lvSs1/O5tU=;
        b=q5p6L6TBrwSGlA6BqVnk7A3/i4eqFGAFBXeCGjDD42ImI62EtXuJbFwFlSEpMvjK+A
         DNTphy+jeDyd9I8OX70Uaq+G6n0AatrbewogPwDYehdTYl4AzKBwNw9BsIGoH39D0SZG
         58aA9JmPJgdkAGFi7zodMrJc1orp6lMxF5kFlOZLHke/x/cygE7RSia10yaS40gBrLNo
         YtFCaNmSZ+soiu2ykgB2gBzx/9xSFek4TqQ9Csh6bIK0QipEz75NWNE0jedMccdIDRju
         L/OJyqYqzyrFvbA7J6/w5gPFo9KNjQeK6doPqGvSDh8y1SnctOaxP1hEpbJFXlZXxc7R
         HrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045657; x=1790650457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1I8+ew540ISvrOYz3s2O7GFW/de6MBJ+lvSs1/O5tU=;
        b=dY2yHz1yhZcKA7N8Y4sxMA5LczpzUQYvHfNPN0ZSzlYlhH8SUth7NErVsIyB7OkatC
         EIkVVoTuJC1N+akpuCMLcoYc/zmbX9/Gu+B79LYbXGSLK9Q4i9Ru26aTykzTcSj0q2eA
         O8WZ47p3sOHt+ygpHRogGZUYYqOg80nsbBcnHuxCUyIDlULD8v6YPzyZdpvZv1L5CwIk
         3zufYsuz4vaR1Z7Pfkz09XCgXUa16NGLEI///c6cxf1AkmBfIm39jFGJbjPoMDuyXXrp
         JCTaxGCtJ6pswdwVg7+4Gz0Plzd3gDTIo1c/LkRJ37/AaKLFknan+RV8FoeWcKZjruwU
         Ab7w==
X-Forwarded-Encrypted: i=1; AKwUvBx9ppSw7BzWKlWhv+7is6tmvZWbC0cM59gdqtNLSJgfNq1tmuY1BPZmw8y9nOEph/qtMGB5D7Gj9TYfYMM=@vger.kernel.org
X-Gm-Message-State: AFuF++kA7Z0simoYya1DHqG2wBFI8TuQw9f7mU9PI6Mg8NA6bgW47gfn
	vE+ZI5LECi7amcRceI7qnA+aWXGJm9cTHnatY3kP/nNDdT7Onkoq8SMmhQKTnsL1ispRIryUp8z
	sC/XvzpPI8h0FbUz5kgHP+q3IpT7+qw01f8gR/tGDgXUCt5lERRO84rSXQG5Fqg==
X-Gm-Gg: AYBFou3IwZz3pZJzsEkDtn9uSoMghKbAjvbpB+v4aMUKJ8uo1g3lH/171C7njnzfvr2
	aqJzi1G4bik7I8fUt0gyDYTbVkjl4nVrq5FZ17tWnH1/+OEU71ukTnpTl49UyoICVVvjqxFgVt0
	ZZPYVumdRMdiVJPnhvlAHDvzIoIcm33Q1axhmA45YNoLPfTdbD3zvv8l3aF8CQKfq9tf4akYydF
	iTSsx2MREF9levpol/6JsmgJo26J913X+Mn4ZGf6qXf2cndH4xD70+WJceIc604q2Fb583+25pH
	LSXGL4RhV8Vn+6r37ifr9WkNaLZ792LwOl+vM6TPc6yPQ1oT9JzysOk4+5Zj64hCpYqHtx2Hs5f
	0CdaTKA1Dgf0ZQ4BP3n9gR6Vgiy8cXumgFCYMJZ1tJJ5n
X-Received: by 2002:a05:622a:550c:b0:530:6f9f:d4b9 with SMTP id d75a77b69052e-532d8d37e9bmr34420491cf.20.1790045656730;
        Mon, 21 Sep 2026 19:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:550c:b0:530:6f9f:d4b9 with SMTP id d75a77b69052e-532d8d37e9bmr34420261cf.20.1790045656256;
        Mon, 21 Sep 2026 19:54:16 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18fce9fsm2048421cf.15.2026.09.21.19.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:54:15 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 21 Sep 2026 22:54:02 -0400
Subject: [PATCH v4 5/8] block: fail a short atomic pin in
 bio_iov_iter_get_pages()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-blkdev-fixes-v4-5-e2801f71ede9@columbia.edu>
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
In-Reply-To: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.garry@linux.dev>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790045650; l=4319;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hK0Uz7nHtHESSVhEzTWW91QCtYxv5e3ePGfGSFiFjUI=;
 b=eXzHltWGxrOFw9o7LuFKPUEV9XvGOIQ8fGSN+MJP9ksj06z1WPRWWl06UJNojPd1s5rdfiEyU
 Hr3YcNOp6VvBbpFT43I0dkUmiqOs4Q9OQSJ7LbLb1r1SiiRAWfDWf2y
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: 6bbB4T0rnYH4IXgetsPiwXa-SIw4HIm4
X-Authority-Analysis: v=2.4 cv=BsoIUoX5 c=1 sm=1 tr=0 ts=6ab1edd9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=DOn4q0-T8uZzdi3JsfgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX2mwpT4Vgiot9
 9XQoaO6T+UJBfNUsx7hAFSigODJRfRYuv2kRtfhOMLf3FwM5faP4JbQRpN8oIOzfyLeMiaDEkLy
 ntrFoUh5b1a0fyFiB8scOnd7asrWrt6b2Kfb++GDamI7w5Si3Ndl/zBj9JNb4Z+4A+Upwqqf2Jn
 FTx55v36A/X0VRtOAL4OJtOUVl7twCTIHcrwUthLHcYWGVbt4nhv2ah3Gp9reOUEgiWsASKqAnz
 COo9AUy3sOLK3aEZwpDkUwN8xF/x22S8bDJMY+wh4ZHlohEZP5l2TmbVVrDd1dNenv9wpXOZ5cd
 7buTy5blO2IQsmrnwDocnVm31oQqVcLaSkyd/GsNroG3NLIpRPozmHnXd/B/dfMEW3C269qREK0
 YRL5xjdSsnnCeotffFKU2r3iMWWY63b3nkL0NRVcg23j8su7VcfJB9lq96x+Ikc9sHtOG9YXc19
 /csilf1/beajNxWfX1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX0Sp+11oNdN6k
 nUxbR0qkC7LXm7CWLxzrf8Ui+HWGOVKi0QRFldDS6GA5PS3i97oaw2q3+318hgXlDflXiIMaD4u
 UIkxqFeRXw1kyiYkabKDIPApHpU4x2chdohFB7/soomTK2ZT+nKb
X-Proofpoint-ORIG-GUID: 6bbB4T0rnYH4IXgetsPiwXa-SIw4HIm4
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11912
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=10 malwarescore=0 lowpriorityscore=10 suspectscore=0
 priorityscore=1501 impostorscore=10 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

On a partial page pin, __blkdev_direct_IO_simple() and
__blkdev_direct_IO_async() submit what was pinned with REQ_ATOMIC set
and leave the rest to the buffered fallback, tearing an IOCB_ATOMIC
write.

This can be triggered deterministically. A 16K pwritev2(RWF_ATOMIC)
whose last page is PROT_NONE, on a scsi_debug device with atomic_wr=1,
completes short with only three of the four pages written, violating
RWF_ATOMIC semantics.

Make bio_iov_iter_get_pages() release the pins and return -EINVAL when
a REQ_ATOMIC bio doesn't cover the whole iterator, since an atomic
write is submitted as a single bio and a short one would be torn. That
covers iomap as well, where a partially unmapped buffer could trip the
WARN_ON_ONCE() in iomap_dio_bio_iter_one(). The async block device path
currently sets REQ_ATOMIC after pinning, so set it before, and move
REQ_NOWAIT along with it.

Fixes: caf336f81b3a ("block: Add fops atomic write support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260802-blkdev-fixes-v1-0-a82fc549fd74%40columbia.edu?part=2
Assisted-by: Claude:claude-fable-5
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/bio.c  | 29 ++++++++++++++++++++++-------
 block/fops.c | 12 ++++++------
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index f95b63c0604a..14429a5d4e68 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1285,6 +1285,7 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
 			   unsigned mem_align_mask, unsigned len_align_mask)
 {
 	iov_iter_extraction_t flags = 0;
+	int ret;
 
 	if (WARN_ON_ONCE(bio_flagged(bio, BIO_CLONED)))
 		return -EIO;
@@ -1304,34 +1305,48 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
 		flags |= ITER_ALLOW_P2PDMA;
 
 	do {
-		ssize_t ret;
+		ssize_t size;
 
-		ret = iov_iter_extract_bvecs(iter, bio->bi_io_vec,
+		size = iov_iter_extract_bvecs(iter, bio->bi_io_vec,
 				BIO_MAX_SIZE - bio->bi_iter.bi_size,
 				&bio->bi_vcnt, bio->bi_max_vecs,
 				mem_align_mask, flags);
-		if (ret <= 0) {
+		if (size <= 0) {
 			/*
 			 * A misaligned vector fails the whole I/O.  Release any
 			 * pages pinned by earlier iterations before returning
 			 * since this bio won't be submitted to release them.
 			 */
-			if (ret == -EINVAL) {
+			if (size == -EINVAL) {
 				bio_release_pages(bio, false);
 				bio_clear_flag(bio, BIO_PAGE_PINNED);
 				bio->bi_vcnt = 0;
 			}
 			if (!bio->bi_vcnt)
-				return ret;
+				return size;
 			break;
 		}
-		bio->bi_iter.bi_size += ret;
+		bio->bi_iter.bi_size += size;
 	} while (iov_iter_count(iter) && !bio_full(bio, 0));
 
 	if (is_pci_p2pdma_page(bio->bi_io_vec->bv_page))
 		bio->bi_opf |= REQ_NOMERGE;
-	return bio_iov_iter_align_down(bio, iter,
+	ret = bio_iov_iter_align_down(bio, iter,
 			&bio->bi_io_vec[bio->bi_vcnt - 1], len_align_mask);
+	if (ret)
+		return ret;
+
+	/*
+	 * An atomic write is submitted as a single bio, so it has to cover
+	 * the whole iterator or it would be torn.
+	 */
+	if ((bio->bi_opf & REQ_ATOMIC) && iov_iter_count(iter)) {
+		bio_release_pages(bio, false);
+		bio_clear_flag(bio, BIO_PAGE_PINNED);
+		bio->bi_vcnt = 0;
+		return -EINVAL;
+	}
+	return 0;
 }
 
 static struct folio *folio_alloc_greedy(gfp_t gfp, size_t *size,
diff --git a/block/fops.c b/block/fops.c
index a3a709697b40..90777e8a9a6c 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -342,6 +342,12 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
 	bio->bi_end_io = blkdev_bio_end_io_async;
 	bio->bi_ioprio = iocb->ki_ioprio;
 
+	if (iocb->ki_flags & IOCB_ATOMIC)
+		bio->bi_opf |= REQ_ATOMIC;
+
+	if (iocb->ki_flags & IOCB_NOWAIT)
+		bio->bi_opf |= REQ_NOWAIT;
+
 	/*
 	 * Users don't rely on the iterator being in any particular
 	 * state for async I/O returning -EIOCBQUEUED, hence we can
@@ -371,12 +377,6 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
 			goto out_bio_put;
 	}
 
-	if (iocb->ki_flags & IOCB_ATOMIC)
-		bio->bi_opf |= REQ_ATOMIC;
-
-	if (iocb->ki_flags & IOCB_NOWAIT)
-		bio->bi_opf |= REQ_NOWAIT;
-
 	if (iocb->ki_flags & IOCB_HIPRI) {
 		bio->bi_opf |= REQ_POLLED;
 		submit_bio(bio);

-- 
2.39.5

