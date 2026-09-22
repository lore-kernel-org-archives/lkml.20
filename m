Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683173AD513
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045662; cv=none; b=tiit9DeX3k/RRLF/Lf0ZpMk3HjUuSi7chQeYXroqn9ZVVn3LwT9DrtwuRVJ0E529fiN7v298NJg/j06yI/n09QMvdLuqu26D2vdlScHfsvqlGWXzfmXsZZAGMRCzBcf9aq6LJokUTqo7Y9dnV/bPh4ncYGN/Kzh0PscomeWTlyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045662; c=relaxed/simple;
	bh=rZZjjs2nTpk7zrUM9R7kySLERZF+SDueEPBYKpLEFsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlNEfebeqFtZylk3LxfAG/eLAQcnXTB83ZSx+gHDx2FNMQgXAOhUXHSSSkh+4PcBxLqHh8BmmTaNhFVmhnL+Pwmm7WSZlL+8N8bBMYtcv/p5ET/KikDgnnc9wE/2Xy4kTQ6K7nfmY2LFr2a/GUmJY408nK1DZpUOrcO4kdyAjxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=oDZbwlSN; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=2T9dfmYt; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="oDZbwlSN";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="2T9dfmYt"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2X3wu938896
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=WiYz
	LkMMA+f6wobylLOZvjQbEJ+PAjPzzuFt2VOtGwo=; b=oDZbwlSNfrkQ3szujUGc
	N5662qJ+UDutoHcjONpzAs3egMDvRR5xvPmWF2oKtSVjJdF2YSWaKywojSFlHneC
	cw6kaZVy2pfnztW59ir+5mSKG9TmE0rCA6HvSxZyky5GF1Wk4k4dzCxAayhdNOrq
	THMIptD514z1apMrblRpB7eyM8Y2BEKaodMqAGysUhWxePNqjJ61VYW6g5fbWHd4
	DWlIS0QRGGX8PDgSjCtfk/pLHnGgO5YmpiQdIyaVuuQZc3Lduq8UiBGZM7Qdn+m2
	Li7j6mFXCfPWgUqpATyWyFBrG7SFvzSJRrTLOVLTmFiUpP7a387fNTu8Niw4N/Yn
	mQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4guavu2bmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:19 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so8801571cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790045658; x=1790650458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiYzLkMMA+f6wobylLOZvjQbEJ+PAjPzzuFt2VOtGwo=;
        b=2T9dfmYt9j5wanJ259N+uwHC3QT5O5e9fUJ3FVYt9Mqd3O9Ja0GQZq1S00RDH+9J5v
         NZ57DyPKeQV5ELdQc/mR5J1LtSAJ5o80cKdn7WI7bKJPrb74JjyjaI2qw5QFjgmAIBW9
         UyKyCQGE+fUNEw77Z/vG1ZMi9cxjIdSZS7IPdZpo+uSDcpiQSnMgQsjz6+h06Nm+oPnP
         cUUtc3mFats79zCyIAGLtpXwZ/en/97DxAMSblt3KpJo7zt3VT6p4S5Rnhbn8r80jluD
         nfYOqz0bSBa8nIUlJUb7qJ9Lk7lpMbP8WP2uRBREQ8O2Z5QcyoI34XRzf5rT2rprMxtk
         2hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045658; x=1790650458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WiYzLkMMA+f6wobylLOZvjQbEJ+PAjPzzuFt2VOtGwo=;
        b=dazYo3UbeEmyobrbU8llFUta55ZOK1IXbnqlG55YLWbdNRGtiAdkHMmVkZtxxUAynm
         3A6tLJx+qxQYaNzNnFrnaBv9zTYmjcUOGLDE3scMCs+60FmGd+Qi82zQRhmjyOmUecA5
         jHbIChTyyV1Jz11Udhn3hDCjJ1e8ztL6/dODTp96rdJ3upBe+ZhirQ+L9ZScVDsvDZle
         tbTm2PqqhTHC3X5gy8vIfnFD8bKk0sZxQXuKt6v+dQmRSdqA8ppkfvFDRx3dhuZMO5UA
         TtLepCu9W6G1P4Mrc7wwIrJdoc3kHoFg1yaX1Ka2I41aOBDPxJsuJm2gtsEhYGdDzBbP
         N6iw==
X-Forwarded-Encrypted: i=1; AKwUvByuZBLLVR0yVnFL3nULQy0VQBbniflXbOFeqjCTc7ASnlk+PBxjtX1Ql7AN73uWyU4xaL2117qserfaT54=@vger.kernel.org
X-Gm-Message-State: AFuF++laBkmdyh3XaxqA+9UIudkLgA3dAOWA4RgnDYlu7VpAV89DcW+2
	3pEeCmc+JnPoNoOigMU25EIs2h0bdF3dawr+VVn0kr/Ox2mcKRfcgY+Vnv1GRF+mcA7FaZNQbAn
	M9+gxC9F4gcN+zQ2L4bxNt2lZyv/1Wl2kVYisHwJaieMhFEwT6LK344OI0mNccA==
X-Gm-Gg: AYBFou3UC9hoCteowfmBbR04B/DnCRA63hpVgt+wYiyq4cnUy3ZBl8f5dGzSmCT3KS4
	a7Kfe75fCPRpuw06G8MpJaxnH2gl4DAFFJWQAA5L68zUJWGNI7uIfLX4C/VW6AT8l2ToRfL0Fcz
	nP8djVTtN3D0RGvk5nU/9Jx/v2KBovNW9uUbzjvdnPYQVUc7uQjkDCzKtkh/M+FAIJ5zjUyWHQc
	RBqFTtdX1dmmDBxfMcZmf4uilmeEHkfrC/k+jqcRqusuV1u6cPuAYvask597hAL6HcH6/okwRZM
	IayI/6SZB9F9nubipEYemDsgANF7bmWoFc2EcbGLIR2JAoDweKWM7kGXKBuB9o5KvWu+nNiovVp
	V3q/8x5c+EHcbs0M2duMhELl4xIn4DtKTYoHMegEVaYxK
X-Received: by 2002:a05:622a:6110:b0:530:fbd3:2038 with SMTP id d75a77b69052e-532db89fda7mr20723901cf.26.1790045658536;
        Mon, 21 Sep 2026 19:54:18 -0700 (PDT)
X-Received: by 2002:a05:622a:6110:b0:530:fbd3:2038 with SMTP id d75a77b69052e-532db89fda7mr20723671cf.26.1790045658153;
        Mon, 21 Sep 2026 19:54:18 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18fce9fsm2048421cf.15.2026.09.21.19.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:54:17 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 21 Sep 2026 22:54:04 -0400
Subject: [PATCH v4 7/8] block: unpin all pages of a bvec in
 bio_iov_iter_align_down()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-blkdev-fixes-v4-7-e2801f71ede9@columbia.edu>
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
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790045650; l=3752;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rZZjjs2nTpk7zrUM9R7kySLERZF+SDueEPBYKpLEFsc=;
 b=FLTYkI7KEFCj48UZA12fYrq5McbVo5ZRKbuncmp3UvNi1DCRZNe/1HA0+F9DD4GxiD/EE37JS
 R5CDQoRmqRED1ufK8EcIyGpML65OQtZzj1U8Yx5q2IaCGaeKBXuph7J
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=OfQNnRTY c=1 sm=1 tr=0 ts=6ab1eddb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=JF9118EUAAAA:8 a=FzqJyQ6YvfuMctRh2gUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX5c+RAt07aWGE
 QEVB7Z5oX9iiQTz2rEHB8F6BOPx2skdytt6zzj9yRrqUPs8eSh5ZMk8ARVTGv73Fjmxnso0EMHj
 55dLI/mn7Y9d3oQq4ow2yrcGAN9eWm9d2qFWbKQr7WBroRIq6YzA
X-Proofpoint-GUID: D2q097WKOfHZp9B9nRucvBJzNFFD9q3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX/i3Ih3bGClJd
 D6avXc8K7Zh6Z4UQiUHqeLcuRnJZ9p3pUGZyfAj3OzrYnGv8f+WazPV5w2XN0zZaevHeUE+edbk
 JcF5y43MDh6nDmB20hn2vsR/SiWOGO98zfafrJiPuovKtVZrU9vWc7M8JVIKnxzKXy1Qi026uxI
 quqMx0dTRoGXUTHv7uqGZh/3noNlV/MeOW7tAzN2jW1pLEMHx1dR90eTwYXCq5SuVgekSNkAqGC
 +m4/+7G3o0aGBVj7FVr83I7CqwjGjSXhJ43QIyR0zrXVA85apvaSbSQ1faHrq8uk5QwQgXvWPox
 P/sDXyRs19gxDgP6lIryjhCgLdZjCAjfn65Ls+HOE2vC7Tc/5RZOFqmnvuH93beJxfByzCuj2Gd
 Z/7Fi7pesZAuBCVq4o9ldqMIvOGNwdZQHtNKvo/KfvgCyXoJX24NE5csnIg3ARqun0h9I1TXdo9
 r0Q4242WMWNI60c8RVg==
X-Proofpoint-ORIG-GUID: D2q097WKOfHZp9B9nRucvBJzNFFD9q3Z
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11912
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 spamscore=0 priorityscore=1501
 lowpriorityscore=10 phishscore=0 adultscore=0 malwarescore=0 bulkscore=10
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220037

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
Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/bio.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 14429a5d4e68..73f6271d1250 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1197,6 +1197,21 @@ bool bio_iov_iter_set(struct bio *bio, const struct iov_iter *iter)
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
@@ -1206,6 +1221,7 @@ static int bio_iov_iter_align_down(struct bio *bio, struct iov_iter *iter,
 				   struct bio_vec *bv, unsigned len_align_mask)
 {
 	size_t nbytes = bio->bi_iter.bi_size & len_align_mask;
+	unsigned int npages;
 
 	if (!nbytes)
 		return 0;
@@ -1214,14 +1230,24 @@ static int bio_iov_iter_align_down(struct bio *bio, struct iov_iter *iter,
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
+	 * the trimmed bv_len. Count the pages spanned before and after
+	 * the trim and unpin the difference.
+	 */
+	npages = bvec_nr_pages(bv);
 	bv->bv_len -= nbytes;
+	npages -= bvec_nr_pages(bv);
+	if (npages && bio_flagged(bio, BIO_PAGE_PINNED))
+		unpin_user_folio(bvec_folio(bv), npages);
 	return 0;
 }
 
@@ -1504,17 +1530,6 @@ int bio_iov_iter_bounce(struct bio *bio, struct iov_iter *iter, size_t maxlen,
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

