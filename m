Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482818;
	b=aK8nhqGCzBkyXs8Cn+rCCfKN4Rhs/G4mjoLZuQQT+7WST83H5a30urlWvAwU2p2VLxj2
	 Rg9OBScWlQEW/rnWnwPtW2y/ldm7otomwZiHwjyEqsMnW8Kgkqkw783CfM2eTZczG2t1V
	 cYTmjkV/jXPCX9Wyoj1yC9R/2UlRuq4X0AfdJZZM2FEy3hdUqTPnXlyBkA1xbj8i4IVTu
	 PcC0jqd91M3N8lp8BywzeNTnnjooIUUoTV6BhZfW9wxCQvor2X9GyIUoPyhpBlb/9cz23
	 NxidDAleAJJ2i63KurdhdiEwmAorDEByuClt0JySdod+7uphrVuGmef+Io8M9G3E/yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482818;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iSurMTjjXMqIbAPmYlacWsBpDjoN1amWMKgaBaCdTD0=;
	b=m+w/UFb3XpZNyIIzd0bWBfItV39DBFbgQXS2WE8rdsWsAJIBdy58/j6D64r4SPGS+SH1
	 MBKh61yUQbX5yiLcooj1ftciwDnRrCQy8C4w5IKdin0ZmLG43/cxzYLj+pLSP420/Veyu
	 /MMiVNudM7Enmorfzhs1QJKBp72de/nooW/EWWPh9HmTbGNcCWbkpMCX3RTFNfSi8VIfm
	 xayDglGjoSeiyQznZu02qVII/8op6YNtX9Zw6k+tl0/O88R5VN6anIm7FNMwnHvXMuEhk
	 rsOqzN+oN6CvqympOJzwLYVhU5GMONMpfxrwHufwn5Jr8AfTlN+VM1SgZsd7MgKNvbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Iln9jUn3;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7D60A6F6C;
	Thu, 12 Nov 2026 11:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B7D60A6F6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Iln9jUn3
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99958D77;
	Thu, 12 Nov 2026 12:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482672;
	bh=0qrNB/5Q37mChnTV04xfvUY+Y5wzyUabCqTpoOedSQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Iln9jUn3VTX714htEfFFXn7EvR7GA6OLPilFvwFyV7KY/xotsX4gw28b+ahAFzhnD
	 vWT8Luhp4ojcIRWFpIYC0BI5Bb5liwsTkjjWUc6NbIo1D/NplGG12PTmL6XV18nYPm
	 D9H0WETnzQBZ2QG57Fk+KOeEMnL4VAX/ikAKO40A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:56:30 +0530
Subject: [PATCH v6 2/5] media: videobuf2: Allow exporting of a struct
 dmabuf
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
Message-Id: <20261112-b4-vchiq-isp-v6-2-711b48378367@ideasonboard.com>
References: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
In-Reply-To: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4856;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Le5D9sRlLa64/8mx0DNW1ZignBpuaWsmfPP8cdXuoOA=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aJpmKAsS7UPbulT5gQt2R17B01r0mwycRn9s
 L7Oiv0sxxaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWiaQAKCRBD3pH5JJpx
 RQtrEACTDl8A+WXWh9hFErzEVaELEBKfeT+l5UC8csq/CCkE+jK8Aon4Pe1QV6NzkTSXMJxKkpQ
 HKDwowaqV6JekYOMtL9f9JehzlBji0Xbv+8quIoEMuzEJJJik5VoDm8HS1whQjFCsjONa6UZYOJ
 7QCNwItlBmh7iAf8Lvr+DX6SoMrzhovDDMo7zLV7QN4nH3UGGrTFXKez+LWK6cK15ep3Q4mlyh/
 rKtF70w2k6Kc8dVK19VlQ6NXBBca5F7Gd56D8ir/ysfnI/cvLtxsIpNYAvjc6A30Y17Mv6evTx7
 zehqKX2FfmXK9RXPc1a/yD8uqkDbqmkZEquGuw8VVrIytmNQDN2rSOZ2vjvi+QLbZCiRNNE+Dd7
 HmpzVMVRD2USGnfd/R5yYswmy8Uoa2OjImg48QOVAP5KN6ChSLFZZbCKKFp+6fbBFc5SEV9xye2
 3hUMIvoEPE/4oNHRGy8YOWGrAPVb2w41MWQkRCn3NLX0uFJWjAvrQkj0LC2afbJoheQdM9SL71p
 +kPVufBOQ750vbYvVhRGut+HgvigomRcyFjUwONfq/XgJgxTaXmrFsJBJmu9YbKYjFqU5ATNJOX
 fhT3WkXvZLre64A9TO6BohnOQtaMAk7E9qHlBSsES5LVz1MIMNqVP53nkpHeCGGycQgHjVCEwft
 rbr30grTxZLjRDA==
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
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v6:
- None
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
2.56.0

