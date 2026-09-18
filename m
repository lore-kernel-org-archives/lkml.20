Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D007449E5DD;
	Fri, 18 Sep 2026 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715876; cv=none; b=l5t+5fSHmKHA28ZnXQtt8tCXC4Wm9fGLmId1+o05wllqr8Xpvvd+h4lKKSn1HbJGrJUpDVTv8bhm+c1W6Mi3Fny5R9eysfApF1N3qkzSGFGUIYga0tfyb8XR8sl2i+guqQkPDgr+WSGC0h7xfU26Avd9rIdLZ8oBTEaf2NixmAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715876; c=relaxed/simple;
	bh=S3bIVRfda5fkskfXkh9GQnelODqlcdcd8goD0BFM/Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/P7Tf0cGC3I9IKeFh+LGqbmu2fqPsxNrMmrcwtGfxa8JnOgAfqbr6wN04/eP5fmgLUJCYI6RkZrKz+50Cc+pf5tIXnIQHP6ZYLSvLIMAJzlSXVAR7yO5LuE7FaWwim6GNS9pMfJXz6hCZcFSN7ttS05G2tRm6iy4U0kGXkI1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=UGeMK+2j; arc=none smtp.client-ip=115.124.28.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="UGeMK+2j"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789715864; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Usux4PNoTA+p6I7UwsuKZwctgiV7/Cb0NtBJVtrFn+A=;
	b=UGeMK+2jkF/ncnEVu8rzixN6lXHSRf7mJX6hwhpEywAD0Hd8M4OQ8/yX63u6XZHVh0pjiSEdCC5fgnam7v9BQ+efGqON+9uHR7XebgpH8txQfjFHJkzYNYIMrXSA5AmkngalbEBvc53JsRiCgDmr5I1g2B+UvzOGKcgj97clGiE=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07454181|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0864622-0.00212494-0.911413;FP=18308394796047918598|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032053168;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGbyUxe_1789715863;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGbyUxe_1789715863 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 15:17:44 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] media: saa7146: bound the page table build against its size
Date: Fri, 18 Sep 2026 15:17:43 +0800
Message-ID: <20260918071743.2421975-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

saa7146_pgtable_build_single() writes one entry per page of the DMA
buffer into the page table, without checking that the table has room for
them:

        ptr = pt->cpu;
        for_each_sg_dma_page(list, &dma_iter, sglen, 0) {
                *ptr++ = cpu_to_le32(sg_page_iter_dma_address(&dma_iter));
                nr_pages++;
        }

        /* safety; fill the page table up with the last valid page */
        fill = *(ptr-1);
        for (i = nr_pages; i < 1024; i++)
                *ptr++ = fill;

The table is allocated by saa7146_pgtable_alloc(), which asks
dma_alloc_coherent() for exactly PAGE_SIZE bytes and records the same
size in pt->size:

        pt->size = PAGE_SIZE;

That is 1024 __le32 entries, the number the fill loop already uses as a
literal. Buffers larger than 1024 pages therefore write past the end of
the coherent allocation, and the fill loop cannot compensate: by the
time it runs, ptr has already moved past the end.

The buffer size is reachable from userspace. vidioc_try_fmt_vid_cap()
accepts any bytesperline below (2 * PAGE_SIZE * depth) / 8 and any height
below the PAL/NTSC maximum, and derives sizeimage from them:

        if (f->fmt.pix.bytesperline > (2 * PAGE_SIZE * fmt->depth) / 8)
                f->fmt.pix.bytesperline = calc_bpl;

        f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;

With BGR32 (depth 32), bytesperline 32768 and height 576, sizeimage is
18874368 bytes, or 4608 pages. queue_setup() hands that size to vb2, so
a 4608 page buffer is allocated and the page table build writes 3584
entries past its end.

Reject a page table build that would not fit, and reject formats whose
sizeimage cannot fit in the tables, so the format is refused at
VIDIOC_S_FMT time rather than during buffer setup.

No Fixes tag. The page table layout and the 1024 entry literal come from
the original driver; b3b2dd372902 ("media: common: saa7146: use
for_each_sg_dma_page") only reshaped the loop that fills them.

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
queue_setup() sets the entry count from sizeimage, so anything that
passes vidioc_try_fmt_vid_cap() reaches the page table build through
VIDIOC_REQBUFS and VIDIOC_QBUF. A capture application that asks for a
large frame, or one that only sets bytesperline generously, is enough.

The check in saa7146_pgtable_build_single() is the backstop for paths
that build a page table from a scatterlist without going through
try_fmt, for example the overlay and VBI queues.

 drivers/media/common/saa7146/saa7146_core.c  |  9 +++++++++
 drivers/media/common/saa7146/saa7146_video.c | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/common/saa7146/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
index c297d019f..dfbd4e40f 100644
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -252,6 +252,15 @@ int saa7146_pgtable_build_single(struct pci_dev *pci, struct saa7146_pgtable *pt
 
 	ptr = pt->cpu;
 	for_each_sg_dma_page(list, &dma_iter, sglen, 0) {
+		/*
+		 * The page table is exactly PAGE_SIZE large, i.e. it holds
+		 * PAGE_SIZE / sizeof(__le32) entries. Buffers needing more
+		 * pages would overflow it.
+		 */
+		if (nr_pages >= PAGE_SIZE / sizeof(__le32)) {
+			pr_err("page table too small\n");
+			return -EIO;
+		}
 		*ptr++ = cpu_to_le32(sg_page_iter_dma_address(&dma_iter));
 		nr_pages++;
 	}
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 733e18001..c895c90b1 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -410,6 +410,17 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 		f->fmt.pix.bytesperline = calc_bpl;
 
 	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;
+
+	/*
+	 * The DMA page tables hold one entry per page and are exactly
+	 * PAGE_SIZE large. Reject formats whose buffer would need more
+	 * entries than the tables can hold.
+	 */
+	if (f->fmt.pix.sizeimage > PAGE_SIZE / sizeof(__le32) * PAGE_SIZE) {
+		DEB_D("sizeimage %d too large\n", f->fmt.pix.sizeimage);
+		return -EINVAL;
+	}
+
 	DEB_D("w:%d, h:%d, bytesperline:%d, sizeimage:%d\n",
 	      f->fmt.pix.width, f->fmt.pix.height,
 	      f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
-- 
2.50.1

