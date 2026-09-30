Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA9C3546EE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731177; cv=none; b=T5PdRMWwOcDO5vw6seKhupxxW2JqYzhfzX8Q/a4pnsyL0S2NorXtjEF4wqxKYBprg9qMeCTh5E00R733Bj1kJ3NplEBDnGcKr7oZ2J8Sw60mS7ybisJxBZi6sXdZbDM2qfOZ0NE7lzFbIQis0Mo0nxwsF44rKaAUsJN8ZhiHjfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731177; c=relaxed/simple;
	bh=z0XfG6Jb9eCCzk7huw/wpFQKZWAceKGpTAT1YF65/ag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Oy49Sy08W2ogii2li2ZuC2aGnEn0W9hwzfRTmhMh1m9bX8CIf/imjgU9YiNhWY8yupKB0sfqpbvhDC1tb4CHnyYnUbbc9VETBH/UH2dn+K1tB+bLoU4bVC+luYjYwuiAdpuoR+klvZf2hG94NPkL1ANGJTS5wOhArieiL4nOvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hq3ZnBc/; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hq3ZnBc/"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3282d5302ffso2492532eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790731173; x=1791335973; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHwk2OQQ4Zl9lDHyUY4iPD2cM/pNo2Pz0tvm4qnKYmM=;
        b=Hq3ZnBc/v3SWN1CZnRxEGl/hR2nzw+pgQ4iwRmI9lQojjpHiWX1CT0EIAxSdMTAsD2
         2hkDYmy22RCFFR/nFl2jqLoxzuw2yobbJwAdRuWDvq45lrVctQf/POnIucET6iKqx2Vk
         KaNCBjwBJfHtDp5XaDKbLxffeqosihFnnQQGmRR5CdF77W0azDug/VIgb35S7299+itc
         /mCdi9sCecXcrNY0ULE4PrOq5+NXz1yu8feZDBtaRsISsOQBK/4nOWfRmgBgUDUDN84x
         YzrRmk0dyym2PQfP/JICwseNOXSy+1zvLc5Dj6un2ZN8jrSjP6tCSyUYNbws21JbchWZ
         UeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790731173; x=1791335973;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHwk2OQQ4Zl9lDHyUY4iPD2cM/pNo2Pz0tvm4qnKYmM=;
        b=sXLd0INuZGt73TUjSKNQc/dbb7vrXun0xOrNecvsb44apLi8iRWSfdEWEkdOhVmGRA
         BS6jK7GLlPQjHc1Uk7sJcXQcDhJSVzkvAtYfr5Z6sMWT4BritM4u+1JVv3WTFY9XoeFK
         toyGJMnLc2yZaRmlwys1yh71rBr0qvVdiC/OHQKBVk9T9BsC2MRyS3UH6WzUZHZzQNun
         nXsVjSWUtcTfB/rqKvlPzkORowhvpU//1p6VBtSsRDU+jbUrPDijhQ7joAkCHpXIg2Mp
         3gwjLftz3CJWz7r+J2PHCQVmypS9jjzg83l1y73+j8h3+sqOFerUQ+L8H3rIKSqu9maN
         qDog==
X-Forwarded-Encrypted: i=1; AKwUvBxRVbYh5EAn/yFSxO0csYJ3xSzCbEEztXuiaFo9l3lqMBJJVLxZQ9n3OqGcne2+usimNHXi9rdKyyRskg8=@vger.kernel.org
X-Gm-Message-State: AFuF++m7J67INmg9tUFR9chYx1ygRqlc0RsVK40zG49D45hJJMuRMdjK
	RrFhVhSal4fRhInSaoTRIdk2uZ03/2uUAPVKRtdE6fa438LzsZ6F3YzLgWdTixKp5ZczHbeFwv2
	5LbT3h1Ui9dhqXWBPnwFFO/caBJ0yr5nagychOw==
X-Received: from dybhe38.prod.google.com ([2002:a05:7300:e1a6:b0:34c:489e:103b])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:88c3:20b0:33e:5e42:e0f9 with SMTP id 5a478bee46e88-34cdc2ca4f9mr14476eec.6.1790731172919;
 Tue, 29 Sep 2026 18:19:32 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:19:19 -0700
In-Reply-To: <20260930011921.1188150-1-sarthakkukreti@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011921.1188150-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011921.1188150-2-sarthakkukreti@google.com>
Subject: [PATCH 1/3] erofs: avoid redundant page copy for aligned
 shifted/plain pclusters
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Cc: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

When a Z_EROFS_COMPRESSION_SHIFTED pcluster is read in-place into its
target page cache folio(s) with page-aligned input and output offsets
(pageofs_in == 0 && pageofs_out == 0), z_erofs_transform_plain() still
maps each page via kmap_local_page() and calls memmove(kin + po,
kin + rq->pageofs_in + pi, cnt) where dst == src. On x86_64,
arch/x86/lib/memmove_64.S does not early-exit when dst == src, executing
rep movsb over the entire 4 KiB page and dirtying all 64 cachelines.

Furthermore, z_erofs_attach_page() restricts uncompressed pclusters to
a single inplace I/O page (fe->icur <= 1), forcing multi-page aligned
Z_EROFS_COMPRESSION_SHIFTED extents to allocate temporary shortlived
pages and copy every page beyond the first via memcpy_to_page().

1. Allow multi-page inplace I/O in z_erofs_attach_page() when the
   pcluster uses Z_EROFS_COMPRESSION_SHIFTED with page-aligned input
   and output offsets (!pcl->pageofs_in && !pcl->pageofs_out) and full
   page bvecs.
2. In z_erofs_transform_plain(), return immediately when a page-aligned
   Z_EROFS_COMPRESSION_SHIFTED request has identical input and output
   page pointers (rq->in[ni] == rq->out[ni]), and skip memmove() when
   po == rq->pageofs_in + pi.

Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 fs/erofs/decompressor.c | 24 ++++++++++++++++++++----
 fs/erofs/zdata.c        | 14 ++++++++++++--
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/fs/erofs/decompressor.c b/fs/erofs/decompressor.c
index d387b27c4ee2..0f6517f329ee 100644
--- a/fs/erofs/decompressor.c
+++ b/fs/erofs/decompressor.c
@@ -283,6 +283,21 @@ static const char *z_erofs_transform_plain(struct z_erofs_decompress_req *rq,
 		rq->outputsize -= cur;
 	}
 
+	if (rq->alg == Z_EROFS_COMPRESSION_SHIFTED && !rq->pageofs_in &&
+	    !rq->pageofs_out && nrpages_in == nrpages_out) {
+		bool same = true;
+
+		for (ni = 0; ni < nrpages_in; ++ni) {
+			if (!rq->in[ni] || rq->in[ni] != rq->out[ni]) {
+				same = false;
+				break;
+			}
+		}
+		if (same)
+			return NULL;
+		ni = 0;
+	}
+
 	for (; rq->outputsize; rq->pageofs_in = 0, cur += insz, ni++) {
 		insz = min(PAGE_SIZE - rq->pageofs_in, rq->outputsize);
 		rq->outputsize -= insz;
@@ -295,10 +310,11 @@ static const char *z_erofs_transform_plain(struct z_erofs_decompress_req *rq,
 			po = (rq->pageofs_out + cur + pi) & ~PAGE_MASK;
 			DBG_BUGON(no >= nrpages_out);
 			cnt = min(insz - pi, PAGE_SIZE - po);
-			if (rq->out[no] == rq->in[ni])
-				memmove(kin + po,
-					kin + rq->pageofs_in + pi, cnt);
-			else if (rq->out[no])
+			if (rq->out[no] == rq->in[ni]) {
+				if (po != rq->pageofs_in + pi)
+					memmove(kin + po,
+						kin + rq->pageofs_in + pi, cnt);
+			} else if (rq->out[no])
 				memcpy_to_page(rq->out[no], po,
 					       kin + rq->pageofs_in + pi, cnt);
 			pi += cnt;
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 6b07e73ee2aa..0517caf61959 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -698,9 +698,19 @@ static int z_erofs_attach_page(struct z_erofs_frontend *fe,
 	int ret;
 
 	if (exclusive) {
-		/* Inplace I/O is limited to one page for uncompressed data */
+		/*
+		 * Allow multi-page inplace I/O for page-aligned SHIFTED
+		 * pclusters so that uncompressed multi-block extents read
+		 * directly into the target page cache folios without allocating
+		 * intermediate shortlived pages or copying in
+		 * z_erofs_transform_plain().
+		 */
 		if (pcl->algorithmformat < Z_EROFS_COMPRESSION_MAX ||
-		    fe->icur <= 1) {
+		    fe->icur <= 1 ||
+		    (pcl->algorithmformat == Z_EROFS_COMPRESSION_SHIFTED &&
+		     !pcl->pageofs_in && !pcl->pageofs_out &&
+		     !(bvec->offset & ~PAGE_MASK) &&
+		     bvec->end == PAGE_SIZE)) {
 			/* Try to prioritize inplace I/O here */
 			spin_lock(&pcl->lockref.lock);
 			while (fe->icur > 0) {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

