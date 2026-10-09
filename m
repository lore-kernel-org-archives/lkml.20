Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F03C8C43
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564628; cv=none; b=suh3LL1YHKN2oSInyourtRrxq6GoDUn127ZXbeBRfdZ8Z9gRV+jyxnqcRp1wBmZrLKelE9jpN9gZEyaT9ipFqRz6ti81D2kmbunRNTSesUfbw2Eq6Yu5UQrbPi/RwnOrp6ihvrXlVIzKhxVkyHt1crDlvaOyo8KpsPpBcz/rtd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564628; c=relaxed/simple;
	bh=62IvAR081mGZwsnDCAfyOZAPUixZpTd3Wqytk+0ksZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHBDDiGS7P7QtoxOXm+FAl6yGI0DAnm20mHGTOfwfONfZIGCIm41MJoRVx5RP7yS4OJBWiJ+wyA/DGh+gGmGPMrIWoPQtyppaWKODlv8ZAtmnNFtOZb5TCH7UKkIh3KSHQ8EJJxkbbHD0Cx9UGwHUCdR18/z7B/q38g4DmEYEKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DDIiAsRX; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=PFoR/PVZ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DDIiAsRX";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="PFoR/PVZ"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GYScd984703
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 12:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=0ZU3
	9KIX4Hg3WrrlWgCSo0Z7SkcoZRjn/jcFVOpHoBc=; b=DDIiAsRXlbcz7Hi8LIKA
	hGZRGMC3w/sdYBf8pxmJ596wznd7Ban1MkuEM/+rsupQy+Q4pU1nSNIgMzZVTuD4
	+Y4U6Iyqa9hKdnynhwjbA/j6lDSWzSuwksVpbln2uquwZ5zsXZAYMYb92PHuLWhr
	zJchdsautHka63ITovcNx+yVvunla5DRWYKudYdLJQfsLK82Uo7wmOe8/CCriJB2
	7IK0b8KDeg4x4wl+JgUN5EhLUrit96ZGlkFDPuRfg3Kn9wmN4CTeu014X+xYiNXJ
	E9+nto23kL5/Thlf4SFvWuAEMHOPuvYzIwgqH4ihZaK9IPdHBuKh6CbH+9zEHkRZ
	iQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h6p2nn49s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:50:25 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337ed1ba44so132506651cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791564625; x=1792169425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZU39KIX4Hg3WrrlWgCSo0Z7SkcoZRjn/jcFVOpHoBc=;
        b=PFoR/PVZnhu6j3Le/N8v9TehFRr8mPEYCR8KnsdOcR4E7bq/hjdtjUUhta5cWRAbAP
         BajLt2c2H+Xly3Cd9CECLAkZboRYhyumjLZvmmeGgYeO0aPeq+Dd20zuJn6WJMqVyFM3
         C4nne/eWisiwbmhyvxrChpIz/op+oBuS2tkGedZp4H5s0XiXfl0Nt5Lc1Epv4ZWDbNbE
         FNKQXgvNMnTe61zCrAjaJUysON2m6E3gX5iewkkWwt0QlEedZPXrKKQZ/hY3Nsg1JcoY
         1Yk6ibb91bWjUi1yTuigQ3U70e7OkN58Yq65pEVXa/HjrpoxPQNAcEvcQ0lZWTOCQd0Y
         g4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564625; x=1792169425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZU39KIX4Hg3WrrlWgCSo0Z7SkcoZRjn/jcFVOpHoBc=;
        b=lvwsr+JkgtoWp2pioRFl2Zw4DoC9zF/eDLHmYeHDzBzmhiMl92MLOcnGGc+roPsfWg
         Yo4fLH3BgcS68duX42yZKKLdrweYLWu+SsDvRytFVLsnY+Jv/yDVfaKAs/QwwF23p2Qw
         4f8mFsEUs9CMcFIC3N2uUiN2P/3gfweW2DOXm25WkyMIHa+WgQSt/2vUT4xUMSG/ukdZ
         VfvKiPulj1GbqjEGmg7Xv2kauli88JCLeuHjZPlKWHx+bzRnDdSbm6wqcRvUXMKKMhW3
         6C/l+xfg0ftaQZxEJs0oigjfkVXGTeIuvTHXRlbwJTsLRFrx+ChnFP84VZ3nw8UqDAt7
         YoLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGLIVaxgKmf7splSoyc8XOBUe9ABlSwmdKPsVOy2ycXDLtWgeLxXXqPnalOT5fW04UM91B2rSK1mMRt3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mCJywEbeO1dpm+Wwja2PIMQb0/QL9sOzSAUCS79t09lqCMQlYy
	rzSM9AU+eZtAIPpfk8z4rJXCTXZ934nsLOnckYcAO7SkXrulaP1BLOTHJicqf+qdwF+3ui9Ohfj
	s0RE8i1dHI1+fUB3CV1oXzQhZQxay9/G9U/7wKQRzDkW34nSEMUFGmQC6spHEXw==
X-Gm-Gg: AYBFou2fxE5MuU7/IW+9Rg1J7EUwjbNSEBcs7ALnQ7c0M9LwzSi49bajdLAOPq9GK0+
	Wof0+G1tOuK+NImNvDgcvFiibKCS17cRdDhbdrtJnw01yCTuGpdrjsNztXbP7ki/nbD+k36FLoD
	P5plmdZzrQ4FYjdaoRr+dkfs3Tia7SmutwQaXH+wUXPlLO/RrvCQxDL4noQUo9sbMRyijUUuNXk
	7OotDLAhH8UcutNAb0zhVJVY3etu75RJJ7ANTi164S2SF1yD1bhfQiH3VIa2a+pQX5hpTh9ZACL
	dglOTJfTLFgdHbKH1ME1kkVAT77gJ/P0LkWhdOj5a0K5HO5pbotymQlvjYpHNxMI8Zq/Q5dEI71
	AW0kRKmYvkUxb/9Du+T1GozTkQbUN1bNiDRfa7KYc2A/uWD4=
X-Received: by 2002:a05:622a:2b06:b0:533:920d:7bf8 with SMTP id d75a77b69052e-5359fae3efdmr43729541cf.24.1791564624822;
        Fri, 09 Oct 2026 09:50:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2b06:b0:533:920d:7bf8 with SMTP id d75a77b69052e-5359fae3efdmr43728861cf.24.1791564624098;
        Fri, 09 Oct 2026 09:50:24 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-194.net.columbia.edu. [128.59.178.194])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b77d0eesm22234701cf.19.2026.10.09.09.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:50:23 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 09 Oct 2026 12:50:13 -0400
Subject: [PATCH v6 5/9] block: fail a short atomic pin in
 bio_iov_iter_get_pages()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-blkdev-fixes-v6-5-307939c387df@columbia.edu>
References: <20261009-blkdev-fixes-v6-0-307939c387df@columbia.edu>
In-Reply-To: <20261009-blkdev-fixes-v6-0-307939c387df@columbia.edu>
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
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791564615; l=4676;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=62IvAR081mGZwsnDCAfyOZAPUixZpTd3Wqytk+0ksZM=;
 b=Kow1iVWHAoTwb/DLM6HMqJjy+KZuv3Eq3m1wKfJUWyY/zkbwnQK6Ih2vZn9PJtc220b/UX/7t
 XKaXj92QdqTB5YQvGXM/1PyqYhzKE+Hh9olIf2fTs95pE3fiks/6c1g
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=eaGo7LEH c=1 sm=1 tr=0 ts=6ac91b51 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=u0MKzLA9JmpizDwXU9Rxjg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=DOn4q0-T8uZzdi3JsfgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: _92Xm_BhdLDBZdERUMudM_MfrJNL2TLJ
X-Proofpoint-GUID: _92Xm_BhdLDBZdERUMudM_MfrJNL2TLJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfXyXdgEz3B3Cfy
 x4aOoOUFBSXcZxd7EG+jTmeceUrbGGV1ao9XmQAtey3g2r/qFXXGSuJKMnJVGH0ZG2IlQAsrKXv
 9JydBQQXk7sVVPngta11wk5CU/X7VoNNYJ0Ht4K3udA2mTC8i4lN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX6K1ryPAoVxVW
 Jt7HxChRLSZZzIvE8Yovolzq0EJOq41485Mkn0EiaDOJPAf86b3hcNwmjmOyWbvDwXU/qvL24Oj
 MNVB+H37hv6S+1UJoGWHqgjeFsIk0hTAzfuqcxtuoYk0lKJekVv6RayjaDQesdOX+1fMNtj+98r
 nrhIR0ecBiJL/wtBDPqxvR2+Hx2CMlfTl34MZyNv0FrSbRlhrLV9gjSvM9/7lE0RkJa1oRoG1hL
 Mkv/Dk85dSii+jTDqBnHEJnbY+QnnrbJX3JwOE6pDY7/6bK/vccJUw6U8U4EoFSlc/DuwqI3fLd
 QjZAGApfm7bG7UvpfovvAsFQX9tl/Ns/PReKv91XHh48A8TAmtneN0CDaTlq5l2E2IASV2FNQSE
 GeAS55P1nZRWmC53V05O7+biurps1wH0jZOXFue95nenhKzZWjZQ3XM2BlNskQfpz9+iJz98mce
 85wvXI6kAbkADlxyaLw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11930
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=10
 lowpriorityscore=10 malwarescore=0 phishscore=0 bulkscore=10 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090067

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
Reviewed-by: John Garry <john.garry@linux.dev>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/bio.c  | 46 ++++++++++++++++++++++++++++++----------------
 block/fops.c | 12 ++++++------
 2 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 57ee335899f3..c89a0d5d6e61 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1285,6 +1285,7 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
 			   unsigned mem_align_mask, unsigned len_align_mask)
 {
 	iov_iter_extraction_t flags = 0;
+	int ret;
 
 	if (WARN_ON_ONCE(bio_flagged(bio, BIO_CLONED)))
 		return -EIO;
@@ -1304,34 +1305,47 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
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
-			/*
-			 * A misaligned vector fails the whole I/O.  Release any
-			 * pages pinned by earlier iterations before returning
-			 * since this bio won't be submitted to release them.
-			 */
-			if (ret == -EINVAL) {
-				bio_release_pages(bio, false);
-				bio_clear_flag(bio, BIO_PAGE_PINNED);
-				bio->bi_vcnt = 0;
-			}
+		if (size <= 0) {
+			/* A misaligned vector fails the whole I/O */
+			if (size == -EINVAL)
+				goto out_release_pages;
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
+	if ((bio->bi_opf & REQ_ATOMIC) && iov_iter_count(iter))
+		goto out_release_pages;
+	return 0;
+
+out_release_pages:
+	/*
+	 * Release the pages pinned so far before failing, since this bio won't
+	 * be submitted to release them.
+	 */
+	bio_release_pages(bio, false);
+	bio_clear_flag(bio, BIO_PAGE_PINNED);
+	bio->bi_vcnt = 0;
+	return -EINVAL;
 }
 
 static struct folio *folio_alloc_greedy(gfp_t gfp, size_t *size,
diff --git a/block/fops.c b/block/fops.c
index 2022c7cb2ee3..1ac3fa285090 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -357,6 +357,12 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
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
@@ -386,12 +392,6 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
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

