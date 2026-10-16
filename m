Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com [115.124.28.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E059137F006
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123916; cv=none; b=TPwXCUIsd4TrcGTBR+4cOvRuabVa/uPH6hVAeD9qpza1/LrgUyZsqco71rxx6mSUnD0UXNyvw6r3EqJCeOZ1HC7IIeThkSbSGKZx7lsRxUqFjzbHl+3gplKg0DbFZVFN2l7z+EV3IDUmCmOmNfPLvYlBzpFV+XNJXPDVXM8rtVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123916; c=relaxed/simple;
	bh=IHlZ+9y4kztrRAESCmbg1gOhuTi6p4zn92n2tUDpRuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kGqJhq2yCJzb/kWQ4/pIIeBT2G9lSDs1u9JqFb4tcX3J6KAKyjDGDNTjqiak6Ruu+VrTDkZ/2r/DbBEzfezlJOCc9PGdaiG7U6EsplkI99Iy31m98Ihr2ug2+0xirHmD8ZwONMYX6yPN9oobtponjEqiX6tw0ygoPyGZUB2HfhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=jN2abOIZ; arc=none smtp.client-ip=115.124.28.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="jN2abOIZ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1792123905; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=vbO+vifKiqBGD5SfF2m4S6cQe/JLEOcIEjOjSAHPgdU=;
	b=jN2abOIZtce0KdybhPwiy3Ju8R7kG9QLKzf0IRDQ1L79P4il9uIAWYROtJgSHrdgIuAB8cOgxP2/ts3Fa3c+Pj52v1c4QCNJ6a9VN7Ex+HKX6Jb/oz57V8BNZdKy3dWq8+CMFyKojf7PK07Z0OMS8Xc+iFaY0mF0L72IDmg98d0=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09093241|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0151924-0.000875209-0.983932;FP=17779160273956545723|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.jg1YhS-_1792123903;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jg1YhS-_1792123903 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 16 Oct 2026 12:11:44 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Chao Yu <chao@kernel.org>,
	Chunhai Guo <guochunhai@vivo.com>,
	Gao Xiang <xiang@kernel.org>,
	Hongbo Li <lihongbo22@huawei.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Yue Hu <zbestahu@gmail.com>
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] erofs: fix unsigned underflow in LZ4 in-place decompression
Date: Fri, 16 Oct 2026 12:11:43 +0800
Message-ID: <20261016041143.2293155-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

z_erofs_lz4_handle_overlap() computes the overlap offset between the
input and output page arrays as rq->outpages - rq->inpages.  Both
values are derived from on-disk pcluster metadata (pcl->length and
pcl->pclustersize) which an attacker can set independently, so
outpages may legitimately be smaller than inpages.  The unsigned
subtraction then underflows, causing rq->out[] to be indexed far out
of bounds and the returned LZ4 source pointer to point past the
output buffer, resulting in out-of-bounds reads and writes.

The in-place path is only valid when the output buffer is at least as
large as the input buffer, so guard the branch with
rq->outpages >= rq->inpages.  When the condition does not hold, fall
through to docopy, which copies the compressed data to the per-CPU
buffer and decompresses safely.

Reviewed-by: Fang Xieyan <fangxy@xiaopeng.com>
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
---
 fs/erofs/decompressor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/erofs/decompressor.c b/fs/erofs/decompressor.c
index 354762c97..50a5f9ddf 100644
--- a/fs/erofs/decompressor.c
+++ b/fs/erofs/decompressor.c
@@ -117,6 +117,7 @@ static void *z_erofs_lz4_handle_overlap(struct z_erofs_decompress_req *rq,
 		oend = rq->pageofs_out + rq->outputsize;
 		omargin = PAGE_ALIGN(oend) - oend;
 		if (rq->partial_decoding || !may_inplace ||
+		    rq->outpages < rq->inpages ||
 		    omargin < LZ4_DECOMPRESS_INPLACE_MARGIN(rq->inputsize))
 			goto docopy;
 
--
2.50.1

