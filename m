Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA445D92C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991524; cv=none; b=ZEwhEt0UhGq95jn+Jh7IwMMiNgjEhthRohe3MqSi+2eNA1zPr/6LqvUXpEray+gmwHsTpH+AWBiUXPXb3xQgoIQziqpxmIftM+8n1uIfshSamVWJo3WNAXLihiisFGtTlqBvVyRPDscYc7vPJwxhtJ/DlIzeidTnq2hAhqn2vL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991524; c=relaxed/simple;
	bh=8sOl9Tikq+zc49svnUxUmgbqOF9i7Se4x0Ssb+suI4M=;
	h=Message-ID:In-Reply-To:References:From:Subject:To:Cc:Date:
	 MIME-Version:Content-Type; b=Ki77GFg6vkgGt3YaPNPtCZVTNFa/w5jdkMbydv45DhSSoFLYKG6VY5k1sd6ksApHl5V/vhmsVQjIiYcORdIMGU3UVOig1Ws6IjZzpDZXcyJFRiF1i0bB47VPWHeVixD8w2ykBr+URemLE/dTTS+7JYSB4b7ZiGoKaDW1xPT55Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=CnrpPX7u; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NXX0eJSf; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="CnrpPX7u";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NXX0eJSf"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689KYcqG3491617
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=T0r7
	0kRjbgwqQJBa4w0AIH8aVkNi7RMCwgx8DuykEvE=; b=CnrpPX7ucZKRFQjfW/hv
	9U8FtKoFX/ZHfYaRCinsQaSrs89pjGKVKHgUMuOVB+qlDrmYlhsYqPdqROP/9MUM
	WNptYv5MICU/f6nMToQaQHS6WpiDx44g9ufW8MM/sTldOwsopRbAPqvXOosBGGRR
	5jjWttvOxfGbkPTJJcf9sFr/JI7yxxCrO+DotXEdhjhvsbiRnL2SBRjP9sRY7RjA
	VxFEFBE5H/cVGmXrHw0YLLbZiu35sPMdcumKZ/LoNBob82FbWepZVquTXCljN4YV
	i2cqHxevnlRMoVN2IFEMUknW0jp+Zyt8Ec2JttZEKIxGfCQDF+bnkQvzwooyrPFb
	bw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gkcyfssht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:05:21 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9103f4ddce5so71291976d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788991520; x=1789596320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:cc:to
         :subject:from:references:in-reply-to:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0r70kRjbgwqQJBa4w0AIH8aVkNi7RMCwgx8DuykEvE=;
        b=NXX0eJSfCvmamZYXYkl4/mpieD1TOxUmoYBkqgSf95dB9DJw0JlyiNGqmtn/SDi4xD
         bZMU4ddotMCqOCU7NiifEPb59UYwzY9cMTcjn5qCMeE08znRZrasksFRNoKgGdkwFht0
         hFRB3Rk3n2dz4hM0PBb2zs+GrYpfab/XUAB5cmLoZBQt1c/w4r6IZVUx7qtrVgEZDcA6
         UbDPVz3YJhEsUeGUVh7Ezh00z+XBJwu65q2PWDeXPsNaJrApHKhvrKnn7Dg+6eZc8bpI
         /UR5gUkMtoVgceaGufPZAEYpwo3WSLgd5nKILmXvQUJto0RCu3wtWKhOKiuyPl96TLdU
         HiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991520; x=1789596320;
        h=content-transfer-encoding:content-type:mime-version:date:cc:to
         :subject:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0r70kRjbgwqQJBa4w0AIH8aVkNi7RMCwgx8DuykEvE=;
        b=f8wEA9nQjtoJ54b/9zWA6WuMZwpQXjVU9RbUqi/9m0LZ/OgHSi75LXW5g9yNJi/gWM
         WDyXDqqPt5XDJBW9byjfXjGs5DXWwtkFXBkE6yDyZ65BAQPf4EdAb0xodO37BSR7Es5G
         WHeZcTXO1Wv1Jb8ZYMep4bVEwdwR0Y9cnwMHZCWGd9Vnq9AtJ48Iaj4ikQR+i6c4PgBt
         P5gW1iPGgeSazyScWLqaYcxF76Z94ICfp1YZJKVJrcj3utWBd79fDfML1BKrhfZcVbgq
         StzpVD/nyofhUFY8fpYmZ0EiSsNn7wFTEMrJa9np33nMNveag18Yrolri5t3h6Sufovz
         jefA==
X-Forwarded-Encrypted: i=1; AKwUvBx5YWz2upzDYPy3RbMZ7O/bAWah16A9G1eLHrOA7RDXkQAkHe22Bj/ANABsKm2ObOeQEdxHWBNxfiRgU/o=@vger.kernel.org
X-Gm-Message-State: AFuF++nCc9784s4lmDD8GrcQx4XsNYUd8TeK9CvCGl0yCAUe5rq3r5X3
	SDVUJL29bpge6bdfuvneGF2ehwPz2SULD3r9TfFICtNZVe25r5DPdi6QjkmZsLt4paEzzgkhxaX
	BK30V0zORx/nYVIenkW+gs9TIowgMWT6Sy/XBcgCaycK2X87hxN1aYhmCi40XwQ==
X-Gm-Gg: AYBFou2Sc+zBy5b4Z8f8g61TCzWPSGAguHhGlf1RCiNEDoc2RPRmuJOYU9tKuB0XU5v
	m/tCJRcHOPxWviCcoTbT0Qo11VRNPBGiSzx8qQ308luZ+xZo5y3OiQel6+fxXUZtsGfrt3dinlw
	8CyAnFVDgOtDBDGgR9cCNAsD1dnIJvXlB23xshETub0yNIJDkbU907tVlLaY9zkyUsSUTXct6OT
	DRfOKmyXVe2GZTa6iN3HsP8apt4bWz4Yk+HMJ7KL6gUcGek1KbPK6+LnXMpX7ckGZ2qbZOgBo+9
	vHyETeXNgiSaaG26ParRQOPEgJU9gaVfljoVuaSfjsv/M4iv590uKsgPF4PSWnJ0QkTty1aVm8y
	anD/dwWDQWUVkgJUI9hvmMWuWN9EzQwGD4K27/+slCJpxN9Rs
X-Received: by 2002:a05:6214:2f0a:b0:90f:b8e3:78de with SMTP id 6a1803df08f44-9103ef59ea5mr535642286d6.16.1788991520041;
        Wed, 09 Sep 2026 15:05:20 -0700 (PDT)
X-Received: by 2002:a05:6214:2f0a:b0:90f:b8e3:78de with SMTP id 6a1803df08f44-9103ef59ea5mr535641566d6.16.1788991519547;
        Wed, 09 Sep 2026 15:05:19 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-193.net.columbia.edu. [128.59.176.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040693f75sm154018806d6.35.2026.09.09.15.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:05:19 -0700 (PDT)
Message-ID: <20260909-blkdev-fixes-v3-6-1a5222c6e8ad@columbia.edu>
In-Reply-To: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
References: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v3 6/7] block: unpin all pages of a bvec in
 bio_iov_iter_align_down()
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
Date: Wed, 09 Sep 2026 18:05:14 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/9MU4sP c=1 sm=1 tr=0 ts=6aa1d821 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fJxgZNdXt3opHMdyAp+FXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=VwQbUJbxAAAA:8 a=FzqJyQ6YvfuMctRh2gUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: r7b-D24gHnQ0bg7FLjT3Eb1swxX8HBnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NyBTYWx0ZWRfX/LkgWaAyPFdv
 nh2lh+xqKDumF9cnW4iPfyqTw9IdKjQG2YkWbp/YzaVOcoD+xS3q+OrOrLuCtNyQvfvewHZS2fp
 FkPfrUNyIz3d2QocZI3gnMscyomCgZuO/GHDQjMRi0dJ9klo7646CuSDbrjlCWQzf4/Ub5Wq+84
 QnDXoJqOfK4VenI9/18rSef+jCCQZoAfS/QCcqGQVBG4SYm1CS8dvrDfp28SjwkbIKtL0aUhxE+
 EwGgwAAhoGsdzybx0eeqtqQxy/hGTVJI/H0a3rz+mwBEoatLuds8ulisWo4v4GtBqbgzQaCJlHV
 6jJZQT0MMUWNTL3fr3FqKKUpqTMgP8EwOHoRYXE+KtoMRN9V7cz1twr9GSsTQa32aTEc53b/oOP
 LJi8cpqAkmXgQ/+boHKDMi8ryKdfRN6XkypPpqkaCwQ4UWc3dNpPZDsBKJfqrqUZwe6Y1eaJHpD
 J38zwJbPlLp/P+w3S0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NyBTYWx0ZWRfX8KNd3KnSCCmO
 pzjMxf5NUmB8SnojAMjQYHpyoCcyJw7u0PR4KSpPp+arFwdsmrZA1cGHivRkcrx7AcAmsfMStFV
 jUawlpM7Wo7xKaojmmrIWewKw28MrlTy74NEpD2+XzBzkldv6uew
X-Proofpoint-ORIG-GUID: r7b-D24gHnQ0bg7FLjT3Eb1swxX8HBnd
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=10 bulkscore=10
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 impostorscore=10
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090247

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

Unpin all pages of a dropped bvec with bvec_unpin(), and unpin the
pages trimmed off the last bvec as well. Move bvec_unpin() up and split
its page count into a helper so both sites share it.

Fixes: 20a0e6276edb ("block: align the bio after building it")
Assisted-by: Claude:claude-fable-5
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/bio.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 63e266d861f1..521c362ae9bf 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1196,6 +1196,21 @@ bool bio_iov_iter_set(struct bio *bio, const struct iov_iter *iter)
 	return true;
 }
 
+static unsigned int bvec_nr_pages(const struct bio_vec *bv)
+{
+	return (bv->bv_offset + bv->bv_len - 1) / PAGE_SIZE -
+		bv->bv_offset / PAGE_SIZE + 1;
+}
+
+static void bvec_unpin(struct bio_vec *bv, bool mark_dirty)
+{
+	struct folio *folio = bvec_folio(bv);
+
+	if (mark_dirty)
+		folio_mark_dirty_lock(folio);
+	unpin_user_folio(folio, bvec_nr_pages(bv));
+}
+
 /*
  * Aligns the bio size to the len_align_mask, releasing excessive bio vecs that
  * __bio_iov_iter_get_pages may have inserted, and reverts the trimmed length
@@ -1205,6 +1220,7 @@ static int bio_iov_iter_align_down(struct bio *bio, struct iov_iter *iter,
 				   struct bio_vec *bv, unsigned len_align_mask)
 {
 	size_t nbytes = bio->bi_iter.bi_size & len_align_mask;
+	unsigned int npages;
 
 	if (!nbytes)
 		return 0;
@@ -1213,14 +1229,23 @@ static int bio_iov_iter_align_down(struct bio *bio, struct iov_iter *iter,
 	bio->bi_iter.bi_size -= nbytes;
 	while (nbytes >= bv->bv_len) {
 		if (bio_flagged(bio, BIO_PAGE_PINNED))
-			unpin_user_page(bv->bv_page);
+			bvec_unpin(bv, false);
 
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
 
@@ -1503,17 +1528,6 @@ int bio_iov_iter_bounce(struct bio *bio, struct iov_iter *iter, size_t maxlen,
 	return bio_iov_iter_bounce_read(bio, iter, maxlen, minsize);
 }
 
-static void bvec_unpin(struct bio_vec *bv, bool mark_dirty)
-{
-	struct folio *folio = bvec_folio(bv);
-	size_t nr_pages = (bv->bv_offset + bv->bv_len - 1) / PAGE_SIZE -
-			bv->bv_offset / PAGE_SIZE + 1;
-
-	if (mark_dirty)
-		folio_mark_dirty_lock(folio);
-	unpin_user_folio(folio, nr_pages);
-}
-
 static void bio_iov_iter_unbounce_read(struct bio *bio, bool is_error,
 		bool mark_dirty)
 {
-- 
2.39.5


