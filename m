Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901592;
	b=VIm35viF7JCjA2hvARxolOSX67/5Q/sgvQTV6johc0bZmtDr5kFdpqcL8+4Jy3bQp0jH
	 eK0zgaWKvrojek8DPUXJ2dJf4kTmZ1r2FO9g0usVu1Zkt5lLLYN+9uR2Lv4P0W07qyzxD
	 q5w/G+jFcLOAXifpPzJ9gofHpb9b/KL0V3N51plF+PDIseFua3FupLAmFZvnuWuNigXLj
	 cvGb7w059BlMiDWMZSnlawq3Fv01ooKvTr0uwvIV9r8gO/KuXdG/Lzx8h0bluhjCRS7pK
	 di+uK+chOPRJPK4Z4Jg6VfWTcwokO1dUITEMtFPj7tyLHWbbCzanEftm2xrR0toD+rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2jp+q/SwpdNjoJ0Jza5F6t4iYi3H8WSNu/t3kNmEXtI=;
	b=EwiLzJ/1Ql4hpPloLo12DWLuOi6ypa7ks5bVvgMRvOidSlfi/n3j1PH7oXO2Y+BYlzg7
	 5pKvU79lEgqYBdzrX2u3Lyn4i9SxSUEZgE7Oa+IQ+fzBZOMOVfi3OUbBWbHAU4+QMfNFm
	 TSKvLaGw41PykNBj7dqn7smEgU9ZSR6CFl9qSjAnvvMVASgX4jPglmzPq0/LwtSfUeogO
	 /PGgVpNa3+1MhF67QFdsXR2Y5wGpcG1aQS3q7Qx11yHhGDrYGFKsawFGsVjfu7ohNjvgz
	 iDaDNNwMHEs6lnN3vKDy3dLki0UeutgHq0hrhV5FzIh365feLbegI4MQrVYT1h/LXLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=i6GdHGkJ;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=32YFCtCG;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20504606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20504606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=i6GdHGkJ;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=32YFCtCG
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7ZmPt1492454
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=2jp+
	q/SwpdNjoJ0Jza5F6t4iYi3H8WSNu/t3kNmEXtI=; b=i6GdHGkJZy/65o6RBRUR
	d5tpixqJpCBrywlJeXDutqScE/O8gTQ+ZB0nnNblcv0pyoV0QYftelS/iphpZSCn
	gtGGdq976VtcTYcGOxWu4BBppRzhvttmFMrpDKP5495l3qBWZZ24gbOaqaYxBQ0H
	uw19fmbOFQWSmSb/n0UShEdrYR1rJXrWO40qdtrZLZ2ICTObe2WdkIDzXUWjv8h1
	YWlKT4/PfvTrMFyDsYZRVJqEaz7bq1Qcpe9yeNz+WU2zWbT7BqRh/z/Q+GvuMEpa
	4MdQIDEHQOyXLYrOij13bp/nHxIy8xfcG6M+kr3P6ELqjXAuGAoC8+fOTDnF6HpL
	+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0cc0scnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:30 -0500 (EST)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d3e7ba879so34791261cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794901590; x=1795506390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jp+q/SwpdNjoJ0Jza5F6t4iYi3H8WSNu/t3kNmEXtI=;
        b=32YFCtCGSVRXspbXiEsR4wxuaYlKyr7cR6kVR3D3t6AYRrhZMj45jmF91odafa8ubR
         C2GbZl0I1PRt/W1k/Z3H7gXsho6sXHQvOLBHJVBvrEDSO5ArgW4SA1jAHXa2M9zc+g++
         PgR3eURLp0ho/Gv2yB4g0pnLnR0qV1+q/WI9CQf1edrYjCmRajfC9tFzjzeDe0xl1AHs
         AlzekthYUtPACaE1pOkypHUTDL32+25AbuqtLDl/1+6XQidV7jLg5GmRmLr/wd6fM4pv
         rtz0MxV9v2Yl42SL+UBO1sqTtb+y3h+s1mha7RdHih9hVpNGIaLlBsGn7/N+HEpEUpIZ
         xdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901590; x=1795506390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jp+q/SwpdNjoJ0Jza5F6t4iYi3H8WSNu/t3kNmEXtI=;
        b=By1g0XglHc5Io+PkouXdBzgDOODBBHVIuNrlHxrH56rRHrrRtUzQXvv9yTw7evPEaJ
         fnhQX+TdaGe82EwlCyNCbyyDRLS3HgUKNLyoXDgKTlWb5RBUSOePxvn4B+0osg1LcRJN
         a54D68Vt50ocOG7RiBXDTkhvySawYnNgrz/NOc4Fd/wnsRlUPnCTywapj/vu9kLf0CJy
         u2hV0PhbcsDbRFFl1P2zQUB1fAjL4+GaB5RqfgVvwMvSSwqztfoMa+a/GBFcJ15SkdXa
         5+nb2LHsP0ZGhlSc/klpi3SC2QcwDitZrBTBGZfoO/U9bZvM9a+Q9qUg5c12TQvO4P4S
         8LSA==
X-Forwarded-Encrypted: i=1; AL+hErEixPYJIXXkg1YYks8Xn+Hwu7XXUcbh4cvmGV8NMi5A2rDibuvDu6IgkVksvjBLScRkLati7EaJOsFVAmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z92LH2KriMoYusCHHADnJe+6gzgbNm5nX7PIU7o2+uPPyXPEDao
	w883CfTqD3Q8hfRSXw8QTiPJGmMl9EftQZ/yzA47Y32ox5F1Fu2xyEhzQbASQ7N3rJq7RLJBP6w
	USjhMwlouTt3ltaEwcDwbBMPVeVdER7JZeKzZviG/L1wCeSfcyjqZU41UgPwlJQ==
X-Gm-Gg: AYBFou3VFcqHWhz493g51KXLfFs6rRoDR0dDZVq6wqnNEoEqNcDXz1iUCHx3nXaLC7u
	zT7/HD0112QRSUwUHJWtcXXCBzpCE8L4FddgnssF0F+L6WSbffHfl9OpLWPRgG0qYWsudAv5FRb
	ioCa3NQW0BjG/SLr4GA+RaGeDsCp/qgAti82y/gb13cUXDtnV+XamARET07+wuZoOiIXr0PZ1yg
	0Lv7a/vfECT4mpwVBk+8xon6rLL9Dat8l0u1my9iPRb9HssgzqywX60wexPUkUxHlyM9nCWrwjY
	zt7sxIX6pBqExzsCvwrJzy9hYi6YLrGig26bbGIhd2WOWHA0GqH9H2uI1x8lYle4p92OFdgohTo
	T8tIf5EVjE6TYbe/3PSNG4YRvQ1SzFuJgyyJgoHd5v/L33dYJYW+6jXvoK3IslDwoL2JOIOBPlP
	YDdH397c01IUiayQoDSw==
X-Received: by 2002:a05:622a:180b:b0:535:1cbe:375e with SMTP id d75a77b69052e-55ac8e900b9mr215400861cf.59.1794901590223;
        Mon, 16 Nov 2026 23:46:30 -0800 (PST)
X-Received: by 2002:a05:622a:180b:b0:535:1cbe:375e with SMTP id d75a77b69052e-55ac8e900b9mr215400741cf.59.1794901589669;
        Mon, 16 Nov 2026 23:46:29 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db0f58sm105632286d6.39.2026.11.16.23.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:46:29 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 02:46:26 -0500
Subject: [PATCH 1/3] gfs2: stop using pages for log buffers
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
Message-Id: <20261117-gfs2-log-folio-v1-1-35db3db42e35@columbia.edu>
References: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
In-Reply-To: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794901587; l=18142;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=O7B4aHx3f5GKRT7UrIhkyo5WP8g3U5k0thSxpTqQbz0=;
 b=A7/8GEMFFABsrFy4rds6/GO6BFGtedwWwK02/jw5UApkT6PH8dxqTUWYtka1MXCApGgXPXTX/
 3uRXu4ZyCrFBry4YaEwdqsNApCGR2DWNAWoxervShSPVa+QeWnskBse
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=EMKTQFZC c=1 sm=1 tr=0 ts=6afc0657 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=tfPiBnztSx6P5pKhK6kA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX6OtHVHyzMGXM
 flsP6RHvHOGs+jr2IyZhV2RUnMgy0iUg8glJPfNyG19wLAju0QSUJ9IsrPxRn0hym0oz6Jdw0yP
 d1Df3weiM56I/wfF75Wo8Yd9oRdveo8EeGc4R+fg2xC4Vv5zz5e/
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX5vNK5rD22u3c
 FgPPgTlgqbg8JFNuJlSNBYx7Dt6t4yf8BNKPF4hdoPzZXwcdhqxT/t5p43ks7lg1jlGBbPhcuy4
 YJSrz6sO3zTWWy9vyKNya0swRaj4MRWNAGSr5yx3UoAdIfm3L+k0BBGUegKVw7q1Zjr+9OjN4Uo
 /x6Ykvfah8EGPzkekNUmgbRXGPeBi8+5d95vmOMW00Fihmj08ZvFR1GhRHd/hJNkX19v8WIBqzP
 Y37Gbkc85mJ3Wn6W2Gs/6qCYkCuldfl76UpHD2jVwtnpfvYnrtS1KhLdeXhP4U4oKSGaoFWPD+V
 sGhWKETi0Hu1pxV3UiBPc3mSCFmCP2krSl3HUo9SkF3s6xLB5HoUv+yld8VvCwwyvR9UW9qNXCb
 +UBNCIzL0yhzQ76QiZjb5hAza+WXywnZHqb37GzXpeDmANyRQF9Ukat2XxO6KEHozz+pkYwbACN
 dIw4MelPkyu1KzpMeYg==
X-Proofpoint-ORIG-GUID: CzTDq39blq-HzrFgKojddvtN1_dWs6PX
X-Proofpoint-GUID: CzTDq39blq-HzrFgKojddvtN1_dWs6PX
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=10 spamscore=0 lowpriorityscore=10 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

The log headers, descriptors, revoke blocks, and escaped block copies
come from a mempool of pages and share a bio with the buffer heads being
journaled. The completion handler tells the two apart by checking each
segment for buffers, which treats a pool page as a folio. That won't
work once memdescs give these pages a type of their own.

Allocate them from a kmalloc mempool instead and add them to the bio
with bio_add_virt_nofail(). Give the pool blocks their own completion
handler, and start a new bio whenever the handler changes so that a bio
only holds one kind of segment. gfs2_log_write() now takes a folio, so
the log write path no longer uses struct page.

Each descriptor and each escaped block copy is now a bio of its own.
They are contiguous and merge under an I/O scheduler, but the flush
path doesn't plug, so without a scheduler they reach the device as
separate writes.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/gfs2/log.c  |  10 ++-
 fs/gfs2/lops.c | 203 +++++++++++++++++++++++++++++++++++----------------------
 fs/gfs2/lops.h |   6 +-
 fs/gfs2/main.c |   8 +--
 fs/gfs2/util.c |   2 +-
 fs/gfs2/util.h |   2 +-
 6 files changed, 139 insertions(+), 92 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 1baaaf30c4fa..238f6655e15f 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -841,7 +841,6 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 {
 	struct gfs2_log_header *lh;
 	u32 hash, crc;
-	struct page *page;
 	struct gfs2_statfs_change_host *l_sc = &sdp->sd_statfs_local;
 	struct timespec64 tv;
 	struct super_block *sb = sdp->sd_vfs;
@@ -850,9 +849,8 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 	if (gfs2_withdrawn(sdp))
 		return;
 
-	page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
-	lh = page_address(page);
-	clear_page(lh);
+	lh = mempool_alloc(gfs2_log_buf_pool, GFP_NOIO);
+	memset(lh, 0, sb->s_blocksize);
 
 	lh->lh_header.mh_magic = cpu_to_be32(GFS2_MAGIC);
 	lh->lh_header.mh_type = cpu_to_be32(GFS2_METATYPE_LH);
@@ -905,8 +903,8 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 		     sb->s_blocksize - LH_V1_SIZE - 4);
 	lh->lh_crc = cpu_to_be32(crc);
 
-	gfs2_log_write(sdp, jd, page, sb->s_blocksize, 0, dblock,
-		       REQ_OP_WRITE | op_flags);
+	gfs2_log_write_buf(sdp, jd, lh, sb->s_blocksize, dblock,
+			   REQ_OP_WRITE | op_flags);
 	gfs2_log_submit_write(&jd->jd_log_bio);
 }
 
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 657edd406dd1..c86f92f2e508 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -196,45 +196,69 @@ static void gfs2_end_log_write_bh(struct gfs2_sbd *sdp, struct folio *folio,
 	} while (bh && size);
 }
 
+static void gfs2_log_write_error(struct bio *bio)
+{
+	struct gfs2_sbd *sdp = bio->bi_private;
+	int err = blk_status_to_errno(bio->bi_status);
+
+	if (!cmpxchg(&sdp->sd_log_error, 0, err))
+		fs_err(sdp, "Error %d writing to journal, jid=%u\n",
+		       err, sdp->sd_jdesc->jd_jid);
+	gfs2_withdraw(sdp);
+}
+
+static void gfs2_log_write_done(struct bio *bio)
+{
+	struct gfs2_sbd *sdp = bio->bi_private;
+
+	bio_put(bio);
+	if (atomic_dec_and_test(&sdp->sd_log_in_flight))
+		wake_up(&sdp->sd_log_flush_wait);
+}
+
 /**
- * gfs2_end_log_write - end of i/o to the log
+ * gfs2_end_log_write - end of I/O to the log for buffers
  * @bio: The bio
  *
- * Each bio_vec contains either data from the pagecache or data
- * relating to the log itself. Here we iterate over the bio_vec
- * array, processing both kinds of data.
- *
+ * Every folio in the bio comes from the page cache. Unlock the buffers
+ * that were written.
  */
 
 static void gfs2_end_log_write(struct bio *bio)
 {
 	struct gfs2_sbd *sdp = bio->bi_private;
-	struct bio_vec *bvec;
-	struct bvec_iter_all iter_all;
+	struct folio_iter fi;
 
-	if (bio->bi_status) {
-		int err = blk_status_to_errno(bio->bi_status);
+	if (bio->bi_status)
+		gfs2_log_write_error(bio);
 
-		if (!cmpxchg(&sdp->sd_log_error, 0, err))
-			fs_err(sdp, "Error %d writing to journal, jid=%u\n",
-			       err, sdp->sd_jdesc->jd_jid);
-		gfs2_withdraw(sdp);
-	}
+	bio_for_each_folio_all(fi, bio)
+		gfs2_end_log_write_bh(sdp, fi.folio, fi.offset, fi.length,
+				      bio->bi_status);
 
-	bio_for_each_segment_all(bvec, bio, iter_all) {
-		struct page *page = bvec->bv_page;
-		struct folio *folio = page_folio(page);
+	gfs2_log_write_done(bio);
+}
 
-		if (folio && folio_buffers(folio))
-			gfs2_end_log_write_bh(sdp, folio, bvec->bv_offset,
-					bvec->bv_len, bio->bi_status);
-		else
-			mempool_free(page, gfs2_page_pool);
-	}
+/**
+ * gfs2_end_log_write_buf - end of I/O to the log for log blocks
+ * @bio: The bio
+ *
+ * Every segment in the bio is a block from the log buffer mempool.
+ * Return them to the pool.
+ */
 
-	bio_put(bio);
-	if (atomic_dec_and_test(&sdp->sd_log_in_flight))
-		wake_up(&sdp->sd_log_flush_wait);
+static void gfs2_end_log_write_buf(struct bio *bio)
+{
+	struct bio_vec *bvec;
+	struct bvec_iter_all iter_all;
+
+	if (bio->bi_status)
+		gfs2_log_write_error(bio);
+
+	bio_for_each_segment_all(bvec, bio, iter_all)
+		mempool_free(bvec_virt(bvec), gfs2_log_buf_pool);
+
+	gfs2_log_write_done(bio);
 }
 
 /**
@@ -291,9 +315,9 @@ static struct bio *gfs2_log_alloc_bio(struct gfs2_sbd *sdp, u64 blkno,
  * @flush: Always flush the current bio and allocate a new one?
  *
  * If there is a cached bio, then if the next block number is sequential
- * with the previous one, return it, otherwise flush the bio to the
- * device. If there is no cached bio, or we just flushed it, then
- * allocate a new one.
+ * with the previous one and the bio has the same completion handler,
+ * return it, otherwise flush the bio to the device. If there is no
+ * cached bio, or we just flushed it, then allocate a new one.
  *
  * Returns: The bio to use for log writes
  */
@@ -309,7 +333,7 @@ static struct bio *gfs2_log_get_bio(struct gfs2_sbd *sdp, u64 blkno,
 
 		nblk = bio_end_sector(bio);
 		nblk >>= sdp->sd_fsb2bb_shift;
-		if (blkno == nblk && !flush)
+		if (blkno == nblk && bio->bi_end_io == end_io && !flush)
 			return bio;
 		gfs2_log_submit_write(biop);
 	}
@@ -319,38 +343,63 @@ static struct bio *gfs2_log_get_bio(struct gfs2_sbd *sdp, u64 blkno,
 }
 
 /**
- * gfs2_log_write - write to log
+ * gfs2_log_write - write a folio segment to the log
  * @sdp: the filesystem
  * @jd: The journal descriptor
- * @page: the page to write
+ * @folio: the folio to write
  * @size: the size of the data to write
- * @offset: the offset within the page 
+ * @offset: the offset within the folio
  * @blkno: block number of the log entry
  * @opf: REQ_OP | op_flags
  *
- * Try and add the page segment to the current bio. If that fails,
+ * Try and add the folio segment to the current bio. If that fails,
  * submit the current bio to the device and create a new one, and
- * then add the page segment to that.
+ * then add the folio segment to that.
  */
 
-void gfs2_log_write(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
-		    struct page *page, unsigned size, unsigned offset,
-		    u64 blkno, blk_opf_t opf)
+static void gfs2_log_write(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
+			   struct folio *folio, unsigned int size,
+			   unsigned int offset, u64 blkno, blk_opf_t opf)
 {
 	struct bio *bio;
-	int ret;
 
 	bio = gfs2_log_get_bio(sdp, blkno, &jd->jd_log_bio, opf,
 			       gfs2_end_log_write, false);
-	ret = bio_add_page(bio, page, size, offset);
-	if (ret == 0) {
+	if (!bio_add_folio(bio, folio, size, offset)) {
 		bio = gfs2_log_get_bio(sdp, blkno, &jd->jd_log_bio,
 				       opf, gfs2_end_log_write, true);
-		ret = bio_add_page(bio, page, size, offset);
-		WARN_ON(ret == 0);
+		WARN_ON(!bio_add_folio(bio, folio, size, offset));
 	}
 }
 
+/**
+ * gfs2_log_write_buf - write a log buffer to the log
+ * @sdp: the filesystem
+ * @jd: The journal descriptor
+ * @buf: the buffer to write, from the log buffer mempool
+ * @size: the size of the data to write
+ * @blkno: block number of the log entry
+ * @opf: REQ_OP | op_flags
+ *
+ * Like gfs2_log_write(), for a block allocated from gfs2_log_buf_pool.
+ * Ownership of the buffer passes to the bio, which returns it to the
+ * pool on completion.
+ */
+
+void gfs2_log_write_buf(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
+			void *buf, unsigned int size, u64 blkno,
+			blk_opf_t opf)
+{
+	struct bio *bio;
+
+	bio = gfs2_log_get_bio(sdp, blkno, &jd->jd_log_bio, opf,
+			       gfs2_end_log_write_buf, false);
+	if (bio->bi_vcnt >= bio->bi_max_vecs)
+		bio = gfs2_log_get_bio(sdp, blkno, &jd->jd_log_bio,
+				       opf, gfs2_end_log_write_buf, true);
+	bio_add_virt_nofail(bio, buf, size);
+}
+
 /**
  * gfs2_log_write_bh - write a buffer's content to the log
  * @sdp: The super block
@@ -367,30 +416,30 @@ static void gfs2_log_write_bh(struct gfs2_sbd *sdp, struct buffer_head *bh)
 
 	dblock = gfs2_log_bmap(sdp->sd_jdesc, sdp->sd_log_flush_head);
 	gfs2_log_incr_head(sdp);
-	gfs2_log_write(sdp, sdp->sd_jdesc, folio_page(bh->b_folio, 0),
-			bh->b_size, bh_offset(bh), dblock, REQ_OP_WRITE);
+	gfs2_log_write(sdp, sdp->sd_jdesc, bh->b_folio, bh->b_size,
+		       bh_offset(bh), dblock, REQ_OP_WRITE);
 }
 
 /**
- * gfs2_log_write_page - write one block stored in a page, into the log
+ * gfs2_log_write_block - write one block stored in a log buffer, into the log
  * @sdp: The superblock
- * @page: The struct page
+ * @buf: The buffer
  *
- * This writes the first block-sized part of the page into the log. Note
- * that the page must have been allocated from the gfs2_page_pool mempool
- * and that after this has been called, ownership has been transferred and
- * the page may be freed at any time.
+ * This writes the first block-sized part of the buffer into the log. Note
+ * that the buffer must have been allocated from the gfs2_log_buf_pool
+ * mempool and that after this has been called, ownership has been
+ * transferred and the buffer may be freed at any time.
  */
 
-static void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page)
+static void gfs2_log_write_block(struct gfs2_sbd *sdp, void *buf)
 {
 	struct super_block *sb = sdp->sd_vfs;
 	u64 dblock;
 
 	dblock = gfs2_log_bmap(sdp->sd_jdesc, sdp->sd_log_flush_head);
 	gfs2_log_incr_head(sdp);
-	gfs2_log_write(sdp, sdp->sd_jdesc, page, sb->s_blocksize, 0, dblock,
-		       REQ_OP_WRITE);
+	gfs2_log_write_buf(sdp, sdp->sd_jdesc, buf, sb->s_blocksize, dblock,
+			   REQ_OP_WRITE);
 }
 
 /**
@@ -604,12 +653,14 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head)
 	return ret;
 }
 
-static struct page *gfs2_get_log_desc(struct gfs2_sbd *sdp, u32 ld_type,
-				      u32 ld_length, u32 ld_data1)
+static struct gfs2_log_descriptor *gfs2_get_log_desc(struct gfs2_sbd *sdp,
+						     u32 ld_type, u32 ld_length,
+						     u32 ld_data1)
 {
-	struct page *page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
-	struct gfs2_log_descriptor *ld = page_address(page);
-	clear_page(ld);
+	struct gfs2_log_descriptor *ld;
+
+	ld = mempool_alloc(gfs2_log_buf_pool, GFP_NOIO);
+	memset(ld, 0, sdp->sd_sb.sb_bsize);
 	ld->ld_header.mh_magic = cpu_to_be32(GFS2_MAGIC);
 	ld->ld_header.mh_type = cpu_to_be32(GFS2_METATYPE_LD);
 	ld->ld_header.mh_format = cpu_to_be32(GFS2_FORMAT_LD);
@@ -617,7 +668,7 @@ static struct page *gfs2_get_log_desc(struct gfs2_sbd *sdp, u32 ld_type,
 	ld->ld_length = cpu_to_be32(ld_length);
 	ld->ld_data1 = cpu_to_be32(ld_data1);
 	ld->ld_data2 = 0;
-	return page;
+	return ld;
 }
 
 static void gfs2_check_magic(struct buffer_head *bh)
@@ -652,7 +703,6 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 {
 	struct gfs2_log_descriptor *ld;
 	struct gfs2_bufdata *bd1 = NULL, *bd2;
-	struct page *page;
 	unsigned int num;
 	unsigned n;
 	__be64 *ptr;
@@ -665,10 +715,9 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 		if (total > limit)
 			num = limit;
 		spin_unlock(&sdp->sd_log_lock);
-		page = gfs2_get_log_desc(sdp,
-					 is_databuf ? GFS2_LOG_DESC_JDATA :
-					 GFS2_LOG_DESC_METADATA, num + 1, num);
-		ld = page_address(page);
+		ld = gfs2_get_log_desc(sdp,
+				       is_databuf ? GFS2_LOG_DESC_JDATA :
+				       GFS2_LOG_DESC_METADATA, num + 1, num);
 		spin_lock(&sdp->sd_log_lock);
 		ptr = (__be64 *)(ld + 1);
 
@@ -684,7 +733,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 		}
 
 		spin_unlock(&sdp->sd_log_lock);
-		gfs2_log_write_page(sdp, page);
+		gfs2_log_write_block(sdp, ld);
 		spin_lock(&sdp->sd_log_lock);
 
 		n = 0;
@@ -696,8 +745,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 			if (buffer_escaped(bd2->bd_bh)) {
 				void *p;
 
-				page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
-				p = page_address(page);
+				p = mempool_alloc(gfs2_log_buf_pool, GFP_NOIO);
 				memcpy_from_folio(p, bd2->bd_bh->b_folio,
 						  bh_offset(bd2->bd_bh),
 						  bd2->bd_bh->b_size);
@@ -705,7 +753,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 				clear_buffer_escaped(bd2->bd_bh);
 				unlock_buffer(bd2->bd_bh);
 				brelse(bd2->bd_bh);
-				gfs2_log_write_page(sdp, page);
+				gfs2_log_write_block(sdp, p);
 			} else {
 				gfs2_log_write_bh(sdp, bd2->bd_bh);
 			}
@@ -856,7 +904,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	struct gfs2_meta_header *mh;
 	unsigned int offset;
 	struct gfs2_bufdata *bd;
-	struct page *page;
+	void *buf;
 	unsigned int length;
 
 	gfs2_flush_revokes(sdp);
@@ -864,29 +912,30 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		return;
 
 	length = gfs2_struct2blk(sdp, sdp->sd_log_num_revoke);
-	page = gfs2_get_log_desc(sdp, GFS2_LOG_DESC_REVOKE, length, sdp->sd_log_num_revoke);
+	buf = gfs2_get_log_desc(sdp, GFS2_LOG_DESC_REVOKE, length,
+				sdp->sd_log_num_revoke);
 	offset = sizeof(struct gfs2_log_descriptor);
 
 	list_for_each_entry(bd, &sdp->sd_log_revokes, bd_list) {
 		sdp->sd_log_num_revoke--;
 
 		if (offset + sizeof(u64) > sdp->sd_sb.sb_bsize) {
-			gfs2_log_write_page(sdp, page);
-			page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
-			mh = page_address(page);
-			clear_page(mh);
+			gfs2_log_write_block(sdp, buf);
+			buf = mempool_alloc(gfs2_log_buf_pool, GFP_NOIO);
+			mh = buf;
+			memset(mh, 0, sdp->sd_sb.sb_bsize);
 			mh->mh_magic = cpu_to_be32(GFS2_MAGIC);
 			mh->mh_type = cpu_to_be32(GFS2_METATYPE_LB);
 			mh->mh_format = cpu_to_be32(GFS2_FORMAT_LB);
 			offset = sizeof(struct gfs2_meta_header);
 		}
 
-		*(__be64 *)(page_address(page) + offset) = cpu_to_be64(bd->bd_blkno);
+		*(__be64 *)(buf + offset) = cpu_to_be64(bd->bd_blkno);
 		offset += sizeof(u64);
 	}
 	gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
 
-	gfs2_log_write_page(sdp, page);
+	gfs2_log_write_block(sdp, buf);
 }
 
 void gfs2_drain_revokes(struct gfs2_sbd *sdp)
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 772557b63b48..c1d9e6fef7ac 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -14,9 +14,9 @@ extern const struct gfs2_log_operations *gfs2_log_ops[];
 
 void gfs2_log_incr_head(struct gfs2_sbd *sdp);
 u64 gfs2_log_bmap(struct gfs2_jdesc *jd, unsigned int lbn);
-void gfs2_log_write(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
-		    struct page *page, unsigned size, unsigned offset,
-		    u64 blkno, blk_opf_t opf);
+void gfs2_log_write_buf(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
+			void *buf, unsigned int size, u64 blkno,
+			blk_opf_t opf);
 void gfs2_log_submit_write(struct bio **biop);
 void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
 int gfs2_find_jhead(struct gfs2_jdesc *jd,
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index a607e98eb45f..0da4cfbe54ea 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -166,8 +166,8 @@ static int __init init_gfs2_fs(void)
 	if (!gfs2_freeze_wq)
 		goto fail_wq3;
 
-	gfs2_page_pool = mempool_create_page_pool(64, 0);
-	if (!gfs2_page_pool)
+	gfs2_log_buf_pool = mempool_create_kmalloc_pool(64, PAGE_SIZE);
+	if (!gfs2_log_buf_pool)
 		goto fail_mempool;
 
 	gfs2_register_debugfs();
@@ -187,7 +187,7 @@ static int __init init_gfs2_fs(void)
 fail_fs2:
 	unregister_filesystem(&gfs2_fs_type);
 fail_fs1:
-	mempool_destroy(gfs2_page_pool);
+	mempool_destroy(gfs2_log_buf_pool);
 fail_mempool:
 	destroy_workqueue(gfs2_freeze_wq);
 fail_wq3:
@@ -240,7 +240,7 @@ static void __exit exit_gfs2_fs(void)
 
 	rcu_barrier();
 
-	mempool_destroy(gfs2_page_pool);
+	mempool_destroy(gfs2_log_buf_pool);
 	kmem_cache_destroy(gfs2_trans_cachep);
 	kmem_cache_destroy(gfs2_qadata_cachep);
 	kmem_cache_destroy(gfs2_quotad_cachep);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 529c3ec37a18..1fd5f817312b 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -34,7 +34,7 @@ struct kmem_cache *gfs2_rgrpd_cachep __read_mostly;
 struct kmem_cache *gfs2_quotad_cachep __read_mostly;
 struct kmem_cache *gfs2_qadata_cachep __read_mostly;
 struct kmem_cache *gfs2_trans_cachep __read_mostly;
-mempool_t *gfs2_page_pool __read_mostly;
+mempool_t *gfs2_log_buf_pool __read_mostly;
 
 void gfs2_assert_i(struct gfs2_sbd *sdp)
 {
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index ffcc47d6b0b4..399c20004283 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -165,7 +165,7 @@ extern struct kmem_cache *gfs2_rgrpd_cachep;
 extern struct kmem_cache *gfs2_quotad_cachep;
 extern struct kmem_cache *gfs2_qadata_cachep;
 extern struct kmem_cache *gfs2_trans_cachep;
-extern mempool_t *gfs2_page_pool;
+extern mempool_t *gfs2_log_buf_pool;
 extern struct workqueue_struct *gfs2_control_wq;
 
 static inline unsigned int gfs2_tune_get_i(struct gfs2_tune *gt,

-- 
2.39.5

