Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4746EC91
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925039; cv=none; b=lKGcttr7a3W96tUmbAW6RodUsZAJr/VFV/bVcuQyK7B//2H5D87A+5iKfG3jnpaTeXCoo5moD51zQdRzoIWb1DtPKfCLrk2q6qIta7rTebDfLh41zpyRtWlFwAYYer5edx9O7+WQecrM1bwMy9+IMO+DhZZVpXvYZWRa0vA5Yso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925039; c=relaxed/simple;
	bh=7uQC8VotJR36OCAn8vP8AVuyOk19WhdnG7o564CLv+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=paGH2VHfsvj2ywRB8+50pJPegCw9Hvm4RXNQVI0KzhMNNVIdzdm8QS0godCIpYxMaLfiNPC6IwByJ4llYQDtmztBVK4wTlcnPhSH/t56rlQyBxTgMAyUFJXNAZSeMyC5j9g/KnBY+hBfZumfGZljaH9EMg6HmMvD2+puniGmfDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=m8oEO6sy; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BENa23yS; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="m8oEO6sy";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BENa23yS"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCcW8x2291333
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=yBG7
	kFfJ+sRlQ+D9LSOXUuMG2++9TcA/Tr58AwqFz9o=; b=m8oEO6syDU/lforqWQoV
	FfMK75uf5kECsQx97X3vcOFcvCeZmSi4E07VeHFNEO4OFtjWPb9hXySL1+LC5o9j
	n/aP1gJy8HSx8VfzEYPAkpdLqQEMxns2fqtMTdb5gaja5n1CoCjXPCDLfPFtvtKr
	jdKdQIkbj0lyGlOfT2VqD/gDE7Zn0JId6wfyNCGze+rM1KFGo9Jk5vcrymFOGBmb
	eDSn4bwCmGK5orr2PUsJP7PiCQD+0c2nhUv0km7gwKdNs7wEHlmNifSHlgNNMTAy
	DjahGojPPIPVRS25w5XWdMADm/HhH9jgGz5uLQFLkFBcuGDUEWB/mdjWFIlj2APU
	HA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gauffvj2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:36 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c8da50f8dso21152586d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1787925036; x=1788529836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBG7kFfJ+sRlQ+D9LSOXUuMG2++9TcA/Tr58AwqFz9o=;
        b=BENa23yS1MiqNzuDDuRX3HH6GJfiS1ykrbqD+eAZNLKB6hZOABgxIZK07loLFfEvVj
         RRnkgDWpIUEYgtpWcSH1lamZ4eyDa8w/hhAh+HsLqspZW/hgDEIvjdeCFKbtHS1hQRoF
         wRjwcs86wX/Q5dNslzlQrORx01VOrWEX1RnC63jA4UR9jY2K/gE8LBSk+31chTvuM0on
         qBHJPimstvBibjw44Sn8w3m7ifHSJly1aHCZWR2GIhiMc2qmGqZ6MnWTqmrPW/9HiBhL
         iRziVCMg8OX3/v66+wfqE6myP0/AMQs+X6cBjM/8zlklMhVJ2xtWOFj9zhojXEpy+p/D
         h10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925036; x=1788529836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBG7kFfJ+sRlQ+D9LSOXUuMG2++9TcA/Tr58AwqFz9o=;
        b=J53GCSNbTyWdpifeV7tw5FHiqOXo9s7FamZpbDtDKXSTxpbRnCWpoQyz9Dw0azINrj
         jcAnSFrqZ54atQOHNXuQLwzLmCaj7CtAkazn8puxxxN+rzIMOvBo7ZU3xIQSVt4z2bc5
         dSc7uYn/M5iiZzPHMsi0w6GMdvm/oF/IMTX6Pa3w3aW/rxgsIwtY2f5yTMh4qx/305ZG
         rwFVAll5iJM1Tij8T1oimaI4giDeJ9D0NBcRIhkMkCPMmQt3RWo3CsP7sqqqqwXE5mco
         TQoaAFbI5Cmk/hPeGEbTRdNXswN99zJUJHMb7DQ0fv9+THtgkMNXmeBlBQjcA8MjAd2L
         dgtA==
X-Forwarded-Encrypted: i=1; AHgh+Rqk8S7+voLr2w+MAlfdC0t4jzs8mPGzEU591lAycOrHqaIOaEN4p267kJ/tX2x/Fnt/9r5mBkTm3XOw87Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kqOh3AlBPMvsWDpQELr/Y+ZvLCT0W+d8fbTFwrI3UPuzsAHGnc
	3Q0tJZB4RpbMtvZCE4oHFWShHVJDOvmSy6zFFkNdIlEEfLg14Pvqhy13rP3oJV2ykfpreGr5hN0
	ipTc2gS3fhhGImrtnwnTRWD06yUcU3TG3jUb54+jNn+Gn9oM6JHansRTAsFxdBQ==
X-Gm-Gg: AR+sD11bf6lnPW9LXoA8YqLZ9CTvezOPzlF47/nS3p1g+BrOxy/4kKq6HAbrUi2JDx1
	3C6/A3kCkET2Mi5SAvyNJz/61OsA17v1QZV79Oo9JQJZiEVCblFgPcrQ9E0v0N+nfUApS0aaJ++
	o8X0fw6dGWjJCGN3YdR5k++jV4L9P/g1SSWMZnnWsbeQXV4qWNH2oqUcMdi+jOu3pFhPN23K9/z
	kHqOCVQcyCxyBwiC7T8OYWTGN7j1eWzACjGj/Gg5bFSqZFUSCe3kMRj3Nx7AZepDzrmmFMkn4IR
	Zwn1iUmoyBF/Ccw5Md3vvrZt2HdrsTFmb5WJF0XGP9g2Egp92qOkLeNDR4zRkWNcS5qbHRteXfC
	WvipnGq0R
X-Received: by 2002:a05:6214:2584:b0:90c:b415:cb32 with SMTP id 6a1803df08f44-90ce0c1d3ddmr88417846d6.6.1787925035717;
        Fri, 28 Aug 2026 06:50:35 -0700 (PDT)
X-Received: by 2002:a05:6214:2584:b0:90c:b415:cb32 with SMTP id 6a1803df08f44-90ce0c1d3ddmr88417176d6.6.1787925035204;
        Fri, 28 Aug 2026 06:50:35 -0700 (PDT)
Received: from [127.0.1.1] ([45.130.83.151])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4534ebesm15645116d6.48.2026.08.28.06.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:50:33 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 28 Aug 2026 09:49:55 -0400
Subject: [PATCH v2 6/7] block: unpin all pages of a bvec in
 bio_iov_iter_align_down()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-blkdev-fixes-v2-6-32f3f40cebed@columbia.edu>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
In-Reply-To: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925005; l=2734;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=7uQC8VotJR36OCAn8vP8AVuyOk19WhdnG7o564CLv+s=;
 b=dBdBQvsT1Eg2cEiskP/UEXYohc+3xoyjw8hNuV50R2Fc+vM1s6pMZ+Qjh/H/ndLhjWk++quGn
 LMLcwhnLW1dDi2Hoe024qu4r6t1A5HEq1zLzEa8HkQGinX/x5GKMKRk
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: XkT7rQ9ykZu0S_cDchTQKIkE4jB3Z0CN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfX24dEXtux8jQo
 6QITEg4bULcun93yoglAItDoYYypZgFD25DLbfJodjrPblz9QphhydqM5PMilyUbPTqhuBAKus/
 xzvXeJguBhf8mljOeHyXw7d7EIWx0d/m5AvWTrC78wyt2fqWokExzqor1zbUsNKo5CYExf9NbZ5
 a2mXg0OWVgNPBes62LFmtG46a+nacM/PTF+nBjVcAb+f0vcjME7TcfERenipnfUNvHH6gyN/ShM
 ibczRC7V8IxhyhqPT6M579VHdxXE9ezIvvknJI1xFuKOyrUXEV4sNrLbbdsZGUT15e87/GGJYxq
 +Owl9s73GTZj2bC+M/cVOHUvdecljxPvwJo5+Q4VHYcC41BeEwaNZShtjqRR++YBD/EZIJP70Xk
 4g+eyJtv3qDAtKMgZ6Ayqe/qZKQSt7HZX/jkNr4RQ3RpT0hnDx5mZ93Y1qqqq8Bf1KSd0SLoBtk
 s7Y8dH6EiCB4chmDymQ==
X-Proofpoint-ORIG-GUID: XkT7rQ9ykZu0S_cDchTQKIkE4jB3Z0CN
X-Authority-Analysis: v=2.4 cv=Y9LIdBeN c=1 sm=1 tr=0 ts=6a91922c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xDWFIMX55ayQNp92vt0S/Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=35irZU1t4opwmMTl3MoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfXyoZtOqdM+w4o
 lPp7wdjCElUHcEhnzQo1RL3R15bBmywW+oEXmAooaVUCVgQ9mF+1QaqIlkJ+4xD6iKFw7pytei4
 3KLK0s3OEAmvEr1uxvei3Nf3RBXOWEqDK9dObSOv8Li/YYZvqNje
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11888
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 lowpriorityscore=10 spamscore=0 impostorscore=10
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280119

bio_iov_iter_align_down() drops trailing bvecs with unpin_user_page(),
but a bvec built by iov_iter_extract_bvecs() can span several pages of
one folio, each with its own pin. All but the first pin leak.

The partially trimmed bvec has the same problem. Shrinking bv_len does
not release the pins for the pages cut off by the trim, and
__bio_release_pages() only unpins the pages bv_len still covers at
completion.

Both issues occur only with a logical block size above PAGE_SIZE and a
large folio backing the user buffer. On a device with a 64K logical
block size, an O_DIRECT pwritev() from a hugetlb mapping that ends 16K
past a block boundary leaks one huge page per call, whether the
remainder is its own bvec or the tail of a larger one.

Unpin all pages of a dropped bvec with unpin_user_folio(), as
__bio_release_pages() does, and unpin the pages trimmed off the last
bvec as well.

Fixes: 20a0e6276edb ("block: align the bio after building it")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/bio.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/block/bio.c b/block/bio.c
index 898b2f5ef8c8..48fa6b9a6dba 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1196,6 +1196,11 @@ bool bio_iov_iter_set(struct bio *bio, const struct iov_iter *iter)
 	return true;
 }
 
+static unsigned int bvec_nr_pages(const struct bio_vec *bv)
+{
+	return DIV_ROUND_UP(bv->bv_offset + bv->bv_len, PAGE_SIZE);
+}
+
 /*
  * Aligns the bio size to the len_align_mask, releasing excessive bio vecs that
  * __bio_iov_iter_get_pages may have inserted, and reverts the trimmed length
@@ -1205,6 +1210,7 @@ static int bio_iov_iter_align_down(struct bio *bio, struct iov_iter *iter,
 				   struct bio_vec *bv, unsigned len_align_mask)
 {
 	size_t nbytes = bio->bi_iter.bi_size & len_align_mask;
+	unsigned int npages;
 
 	if (!nbytes)
 		return 0;
@@ -1213,14 +1219,24 @@ static int bio_iov_iter_align_down(struct bio *bio, struct iov_iter *iter,
 	bio->bi_iter.bi_size -= nbytes;
 	while (nbytes >= bv->bv_len) {
 		if (bio_flagged(bio, BIO_PAGE_PINNED))
-			unpin_user_page(bv->bv_page);
+			unpin_user_folio(bvec_folio(bv),
+					 bvec_nr_pages(bv));
 
 		if (!--bio->bi_vcnt)
 			return -EFAULT;
 		nbytes -= bv->bv_len;
 		bv--;
 	}
+
+	/*
+	 * __bio_release_pages() only unpins the pages still covered by
+	 * bv_len, so drop the pins for the pages trimmed off here.
+	 */
+	npages = bvec_nr_pages(bv);
 	bv->bv_len -= nbytes;
+	npages -= bvec_nr_pages(bv);
+	if (npages && bio_flagged(bio, BIO_PAGE_PINNED))
+		unpin_user_folio(bvec_folio(bv), npages);
 	return 0;
 }
 

-- 
2.39.5

