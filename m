Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2B526AA0;
	Wed, 16 Sep 2026 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569341; cv=none; b=Io/RcZ6DeVRGQsuanQT0hWkYGpRQMFzGwUz+YPfoWuwdiAOuON2NRac3bI/9kslekEi/FA3hA/7nioPo+sazKx7idRTvmxZwr9fMpcIVyExCvzKg+xid5bTZVFwEyOVbrDOKWs38jXF+CspLtcz9r8WhtsBvfvZomSf+6VhFlGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569341; c=relaxed/simple;
	bh=LiGGpGLE6D6aZj+FpFUOX6l4A/sAgkXWywK+IAQ3x4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZK2RfuIc+EDCOH1M3KH6Dfb/9j9m6OZLkM5pXBZcKmje9oO57/O+Ito5oLZ0ZmnFwoqc9r54Syh0sfS3czxKGHv/TihBlc3S1yTQlT4KmexBBVxTcBmHA6ctyGv3LPyqnZRO039RjhbHMnudzRjGLktzAelR/2S+B3fko1R7rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lWHpwYXi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lWHpwYXi"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4D3DC42;
	Wed, 16 Sep 2026 16:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789569237;
	bh=LiGGpGLE6D6aZj+FpFUOX6l4A/sAgkXWywK+IAQ3x4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lWHpwYXiU+SVrfLTr4GYvWFG9EkE0HzzbtyUNloEehfjHBgH0gQ9UPUPJoutPQ5MG
	 u2Y/liEzDHl1weaPaplOgdBC1jq5rUiDhChwGRr2Cw/Cb8/ZCzo1/Q7e3WN4kAqgzo
	 4+q1kOQfJVSwZiceYyGZinKUlk/cJp61ikUxvdAc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 20:03:04 +0530
Subject: [PATCH v4 07/10] media: videobuf2: Allow exporting of a struct
 dmabuf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vchiq-isp-v4-7-f668c2017b74@ideasonboard.com>
References: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
In-Reply-To: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4707;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=xG3dyunYI1VbEVnz1f7OyO886qwdzNs2DVKi6UN8ipo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqkMrjqUNFZpjsy46hu1RvRhQ1780ajTP4Z20
 PUZT+O7iN2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqpDAAKCRBD3pH5JJpx
 RV4bD/9Wu7OInXsb7PnQOApE5ubLZ18Z03BMtw2IL79grAAV0NfBFtRajFNC6hCiWEvg+3KfnGn
 clyw7nv3N8JwwZojSQFCCPgfdkuiCEWa2dHlA9I7cIRX/do4aBW+KmKpVheU7Pr2xHhJtzrBPj7
 Qx555+UkC4SstVuL0P2cvfNyQRXLtjgpEUI/hRYbQeeZ4uC3A177Clhi88XwR/uJ31i7wh/F8sX
 nVFKT+cgvmavqq0aK21fa0ZeKqAF6cnQRd9pjd83/vqL08mENg5tFRFrNVEt8YubrNSTu5ioTZ5
 D0gPus1aBaq/N46izScXBh67MQXNrqNydMaeiAcFEm38f1DwaT52eLiG7FpCz+l/KAd97ZyKRLq
 In1HmcTd3g2HU2ohZ2mFNE78R771ZqCdF+8r6xVUN1fIyZ1yyRlXzHF+kd/lZe/BgTqkkV/FxwN
 QzV3lzACh/RP+XKT5uPFVQvV8/RaIlRrrCMOf7UvUwd5tmX/aPFoKPBtOyMQ4W3FJsgLES4fv6k
 lMBp7Ev5bg6SIYZT/y2fFYQaxJnlUcmW8T/Pvz0sKidAYMXFaNUuH2jFrGduHKPf3eMkzBGAmzB
 fVTEE2ZgJvTssdRoxvSYsfv7rrfctMz8ug1i+OSdKxOPGHyPPX3rO5UR1k7J0nCP6gMjEgFP8SY
 zfKSagoooxp+pUw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

videobuf2 only allowed exporting a dmabuf as a file descriptor,
but there are instances where having the struct dma_buf is
useful within the kernel.

Split the current implementation into two, one step which
exports a struct dma_buf, and the second which converts that
into an fd.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Return a pointer to struct dmabuf instead of passing it as a double
  pointer argument and returning an int for errors (Laurent)
- Document the return type (Paul)
---
 drivers/media/common/videobuf2/videobuf2-core.c | 45 ++++++++++++++++---------
 include/media/videobuf2-core.h                  | 17 ++++++++++
 2 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 5e318165659f..7b99d39d7cb1 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2419,50 +2419,63 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 	return 0;
 }
 
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
-		    unsigned int plane, unsigned int flags)
+struct dma_buf *vb2_core_expbuf_dmabuf(struct vb2_queue *q,
+				       struct vb2_buffer *vb,
+				       unsigned int plane, unsigned int flags)
 {
 	struct vb2_plane *vb_plane;
-	int ret;
-	struct dma_buf *dbuf;
+	struct dma_buf *dmabuf;
 
 	if (q->memory != VB2_MEMORY_MMAP) {
 		dprintk(q, 1, "queue is not currently set up for mmap\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (!q->mem_ops->get_dmabuf) {
 		dprintk(q, 1, "queue does not support DMA buffer exporting\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (flags & ~(O_CLOEXEC | O_ACCMODE)) {
-		dprintk(q, 1, "queue does support only O_CLOEXEC and access mode flags\n");
-		return -EINVAL;
+		dprintk(q, 1, "queue supports only O_CLOEXEC and access mode flags\n");
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (plane >= vb->num_planes) {
 		dprintk(q, 1, "buffer plane out of range\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (vb2_fileio_is_active(q)) {
 		dprintk(q, 1, "expbuf: file io in progress\n");
-		return -EBUSY;
+		return ERR_PTR(-EBUSY);
 	}
 
 	vb_plane = &vb->planes[plane];
 
-	dbuf = call_ptr_memop(get_dmabuf,
-			      vb,
-			      vb_plane->mem_priv,
-			      flags & O_ACCMODE);
-	if (IS_ERR_OR_NULL(dbuf)) {
+	dmabuf = call_ptr_memop(get_dmabuf, vb, vb_plane->mem_priv,
+				flags & O_ACCMODE);
+	if (IS_ERR_OR_NULL(dmabuf)) {
 		dprintk(q, 1, "failed to export buffer %d, plane %d\n",
 			vb->index, plane);
-		return -EINVAL;
+		if (!dmabuf)
+			dmabuf = ERR_PTR(-EINVAL);
 	}
 
+	return dmabuf;
+}
+EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
+
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
+		    unsigned int plane, unsigned int flags)
+{
+	struct dma_buf *dbuf;
+	int ret;
+
+	dbuf = vb2_core_expbuf_dmabuf(q, vb, plane, flags);
+	if (IS_ERR(dbuf))
+		return PTR_ERR(dbuf);
+
 	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
 	if (ret < 0) {
 		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index feda638d0064..a73c59f21dcd 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -954,6 +954,23 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
  */
 int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
 
+/**
+ * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue
+ * @vb:		pointer to &struct vb2_buffer
+ * @plane:	index of the plane to be exported, 0 for single plane queues
+ * @flags:	file flags for newly created file, as defined at
+ *		include/uapi/asm-generic/fcntl.h.
+ *		Currently, the only used flag is %O_CLOEXEC.
+ *		is supported, refer to manual of open syscall for more details.
+ *
+ * Return: returns a pointer to &struct dma_buf on success; an ERR_PTR or NULL
+ * otherwise.
+ */
+struct dma_buf *vb2_core_expbuf_dmabuf(struct vb2_queue *q,
+				       struct vb2_buffer *vb,
+				       unsigned int plane, unsigned int flags);
+
 /**
  * vb2_core_expbuf() - Export a buffer as a file descriptor.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.

-- 
2.55.0

