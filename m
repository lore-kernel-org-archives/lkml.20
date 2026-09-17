Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F76D426D0C;
	Thu, 17 Sep 2026 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633580; cv=none; b=hBvXU1t5eAq/9D4ulLoq2LTtNP8QlNAaA+guuv7/WFSBwyyPcSOVdFwszv7KRLVbp9cY0l+IRrYycGjRZxdgRImrkfz3QdrQAi8s3wePDhvMZf8SCloKAndLY8G0UxRFewVa1wR9FtothBDa78hyhjbqd7Mt09iik4lQ/SwbdAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633580; c=relaxed/simple;
	bh=HGpw61OlyqRrCGSdAUvBwJGvASu1hXV3WIhP5pJuNcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJZjJt+OOCLI/tt1hkhyQ7hhZ2nvXNv603OLGxOxGZbwTukb0NlYj9sPa9R0dM4bHscOtMahAGT4w+pvQIni+N4YyCQCXfAmVOA+fh8kmY7X7dWeobDhdsxTLATQmtEJ0tmb2wDVC0OUA9J/HHWzitLM91rabKIUMV+d2V5hivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i+SKV+cu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i+SKV+cu"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8DC2C51;
	Thu, 17 Sep 2026 10:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633438;
	bh=HGpw61OlyqRrCGSdAUvBwJGvASu1hXV3WIhP5pJuNcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i+SKV+cuuhRQFEeiVb3nA8RBFwFG710mYBj+f/1p6kGJcLotNvSbzBB7BHYNXLrRk
	 F1wqupALZURBcYXNL3fVYnm0KJxxsJGQcRlj1eAIX50maZKMZXaUaoR9+n9VQWeWbv
	 hdU7FM5Z86s2JezSL735VESh3E2tLK0AbzpzDCys=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 17 Sep 2026 13:53:13 +0530
Subject: [PATCH v5 07/10] media: videobuf2: Allow exporting of a struct
 dmabuf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-vchiq-isp-v5-7-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
In-Reply-To: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4777;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Cr6kOKE2wSeMf6SN/lh4O5ooGvUto6gq3Zw5IiCRfpw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqq6PU0276fr7dn1KPrLbJeqYbC+IAgPxgQczt+
 i59PW0d2UGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaquj1AAKCRBD3pH5JJpx
 RTB4D/9tbBdVl0xTv6ppE+sXcNslevWiv1KgQzd7gFnGh2S5SrnQhlS9gOPSh4kyGzjkYAublo2
 A1YdeWCIdbE49vF773tOZBlQVjqzWoV2gkecfuz93M5JNL9YU1vvE+TAjZdAg5GGLs5ONbXASTU
 BjGV9boQfQIw3RCFEMs6yUcoQeExPIV+i//V0S4QSsh9z8GtHWFLK0rYzt+y9Rf1MLmGnxaR8nx
 3w3INCXdivnNXu+91sH/p/shDLoSWcKMaFjDtuFqidZ8D4pDg636I0yaSFyQJTwMRSXqPOjTLkr
 4ZS36THApUPWocWy+/PNLsfZK2rK9UhVZOqMPh95CcV9bESEGGEfCHCwB8skUSr/wSoVUXaW9Ni
 /djusminQq3RXkR7hN6lnDu0l8xQUAljuQouAxzXI8PIp1ejCryiJitPbCxlwPujve/HiXFeYO3
 ihdZxUcahKR6yN8Tn8skqZIUvf7Pd8bWO/2XO4rXCiC6F1qdCvsd4TZtLXeKah15o+PtjY4E+qj
 nvkLrcwTNVgEIivI037KtBcGWt5L3WEsjACYRVDzdiM9KUXPbv2BP5/GY1e8GoOqGWOdXFib+Up
 vTA3pCsZzr77UxUYHv+PrKB8aUu6rSB6bwl79HTnn4uX8VYMmj1kJoS6d+K0vU9JDtQTPTafu7+
 sn6kfesN3oCKO2Q==
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
Changes in v5:
- Update documentation of return type to only ERR_PTR and not NULL
Changes in v4:
- Return a pointer to struct dmabuf instead of passing it as a double
  pointer argument and returning an int for errors (Laurent)
- Document the return type (Paul)
---
 drivers/media/common/videobuf2/videobuf2-core.c | 45 ++++++++++++++++---------
 include/media/videobuf2-core.h                  | 16 +++++++++
 2 files changed, 45 insertions(+), 16 deletions(-)

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
index feda638d0064..45bfe8a2a12a 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -954,6 +954,22 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
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
+ * Return: returns a pointer to &struct dma_buf on success; an ERR_PTR otherwise.
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

