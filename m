Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDFC488755
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394067; cv=none; b=Dr7zr4cujAIs508O/ZOG/jOnZFoZoslej2TmGKDTAgtClCAzLnpjKPaa3ef/fkZSPnCAHhc/Rzvd0OaoH/LSScf3LETm4iIvMfBJEFLFPZLqQjUpQ6+g0EqVUb3IFLfoSDxkhPBE5tjz570qksKoDXl+j3RyV3/0Ih8Dql/+E14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394067; c=relaxed/simple;
	bh=KbWHiMnRC7Qpn22acKQxyHeLZ2BIuINxMqAY0P7tuls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SbDawtcqnkDd44+Kd+I6f0WGyfQFFqDgyE1CHOULHStO3nMJZkZ972G3bKe/ozpGlNx9RSiJ2aQkgGgWCgram8VBA+N9IKsCCB9LwEwBv6+UdlEO7Otx237KiYNoui+maXFdzRr4t5F118qoI/7PDAokH7zfgmrslNgxf+Mkr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0sn+AQU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0sn+AQU"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1348274f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394064; x=1792998864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3N4hEQnVScozkCXAtUHxCDfoyvbwHIV8uHsxZE1LpnQ=;
        b=i0sn+AQU2aTvXLMp/NxGzH0VoCZgQWwwQXGixD7CAv3uNzRXP9CmTs5xj0SQp8wvkZ
         XcvdLguguV/mWatO8afZEJhKNF9CUWlKc84NwOj+S5FF7X9yfYFwW7etf1ega5hYChEM
         RO8i2fhBFPeFVM1A3Ms+0D+/1eg5NfUp0M+/cFXAiWrrfKGyqcPVw8LagTf1b035qomP
         ZHvEqaewRJ7kYmeP3Drajq5Ke6S5B3NZ1oibJxUurIaQr2RLIHHZ3O0173UGfuGjRBd1
         dAgb+COKXrCMzF2fcYQwFxj5aEFjzgax+c4NNp/PAJDG1etpiYqPCDIKN01UbPJUT7ZC
         Vx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394064; x=1792998864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3N4hEQnVScozkCXAtUHxCDfoyvbwHIV8uHsxZE1LpnQ=;
        b=gYwlLW7wJk7/d7PRCEMUwCw/S4DraLSveDfd9CsqysQvNR7rhxdionmPeJSYMB8MPX
         pngymeHTiQilwwnZH1/borWyvLO5iqWU8+klag7Tj6iotjTtRHyJBZdlC6cCnoFoWVj2
         6z/qe975KDz0BwVIGw0VTP7xY/fJyOrUNLO8PbKYmi1kDLUfz9Un918dyc+2GzPQi9u6
         RtGHVokmzTyD3OcspqerI1/k0pjJg01nyp0LYMVbPRfe/Dog4EAsBQeyLD+uoS2E+yN7
         qlibwniQ+3VhdvxnjAMMbQonIpb0Mt8t9RFUPoMLTkgswZW81SyZut7EK9czSXla5Rub
         O94g==
X-Forwarded-Encrypted: i=1; AKwUvByfY73BYbCdkLOhwv5UaHNDTbVi1JUYBM6tDKPV60e53lIhIHHT08IGQlfPeGdNqCp4/jV3bEpTariPnmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFC8Y8gnQ45rYLO3oKwLG65MHU5UPvysx06INUGSD9F2+TIcF/
	iNi1wVLMHWIVH8FySAsFJ0ukmLmMVc8VxcHcNyXUX1VWalgtyqA6u2CO
X-Gm-Gg: AYBFou2gSgIVOGcet1IfugKhFTYENyuf02/5Rj1OddVARnrQJEYtjuWpmUxgRHbq7yZ
	asKz2ekX7g0mxkl7E09etHtiJOleP7V3pvrXhBc81MHmLD4zGcfYj57WGsAg/FiUKLzoXtaM8pf
	YMe/JU+HGS6OAso5Nz7+Iofgz+vd4PuZEfdU+M224yL6pNBIwTodhKLMS1AnL1McpYzY7Z3ol4s
	v+fvYhkJ+zJDOp0xUdaFTlHZjWg9n+uwVAxo68IFCrINYCyA7RyopR0bbXrht9hCvptJoIEtIlK
	acVjfnVQ2597CJzBH72Phdza3HpXHn8sUwNxBHqEEZSfu1pZJUD12dovh8liCaeUEcglkTFXuDZ
	n2SDarxOw4DNDc1ioGEcAquFABkqnP6OnbzNpphM46xL8SZ2ddtqQyUpFCvwpdlOgWZdNkKYMPo
	+b86+5W7Gor15GHVaNS13dYClCRRTWOXAcIkzJM1HNuOZyi3katkYJpQFo4v3inJbIAz+DI6SMz
	iTrwY1u2DvQaD+/m1mNB5XP/6hJ1LkJH5WH0PyCBdNiivy1A4YmzkACqc3+Lu+rqfaCe+eCJ7Yv
	CNXHgxFvaljGj+dadSJPRUvQ7MuDX+ILcmCsE/CL40RqgZD3r10BB6zsh02dl0eKSC7r0V1I5O2
	2
X-Received: by 2002:a05:600c:a10b:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a1d7601226mr96449385e9.16.1792394063736;
        Mon, 19 Oct 2026 00:14:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm21559338f8f.2.2026.10.19.00.14.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 00:14:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 2/4] media: videobuf2: add opt-in DMA-BUF CPU access
Date: Mon, 19 Oct 2026 09:14:09 +0200
Message-Id: <673c04ad9dcc4f12685c076193ebad9e48e5f08d.1792392288.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792392288.git.kmehltretter@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers must bracket CPU access to imported DMA-BUFs with
dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().

Add a queue flag to do so from buf_prepare() through buf_finish(). Use
read access for output and write access for capture. Map imports
bidirectionally because CPU and device access directions are opposite.
Pass the mapping direction to attach_dmabuf() so USERPTR and MMAP keep
the queue's normal direction.

Keep this opt-in because some vb2-vmalloc drivers pass buffers to
hardware. End access in process context because DMA-BUF callbacks may
sleep.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 83 ++++++++++++++++++-
 .../common/videobuf2/videobuf2-dma-contig.c   |  5 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  5 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  5 +-
 include/media/videobuf2-core.h                | 12 ++-
 5 files changed, 101 insertions(+), 9 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 460eaf4e82f78..d2a78cd0a86bb 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -371,6 +371,65 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
 		call_void_memop(vb, finish, vb->planes[plane].mem_priv);
 }
 
+/* Output buffers are read by the driver; capture buffers are written. */
+static enum dma_data_direction vb2_cpu_access_dir(const struct vb2_queue *q)
+{
+	return q->is_output ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+}
+
+static bool __vb2_dmabuf_is_duplicate(const struct vb2_buffer *vb,
+				      unsigned int plane)
+{
+	unsigned int i;
+
+	for (i = 0; i < plane; i++)
+		if (vb->planes[i].dbuf == vb->planes[plane].dbuf)
+			return true;
+
+	return false;
+}
+
+static void __vb2_buf_end_cpu_access(struct vb2_buffer *vb,
+				     unsigned int num_planes)
+{
+	struct vb2_queue *q = vb->vb2_queue;
+	enum dma_data_direction dir = vb2_cpu_access_dir(q);
+	unsigned int plane;
+
+	for (plane = 0; plane < num_planes; plane++) {
+		int ret;
+
+		if (__vb2_dmabuf_is_duplicate(vb, plane))
+			continue;
+
+		ret = dma_buf_end_cpu_access(vb->planes[plane].dbuf, dir);
+		if (ret)
+			pr_warn_ratelimited("[%s] failed to end CPU access to dmabuf plane %u: %d\n",
+					    q->name, plane, ret);
+	}
+}
+
+static int __vb2_buf_begin_cpu_access(struct vb2_buffer *vb)
+{
+	struct vb2_queue *q = vb->vb2_queue;
+	enum dma_data_direction dir = vb2_cpu_access_dir(q);
+	unsigned int plane;
+	int ret;
+
+	for (plane = 0; plane < vb->num_planes; plane++) {
+		if (__vb2_dmabuf_is_duplicate(vb, plane))
+			continue;
+
+		ret = dma_buf_begin_cpu_access(vb->planes[plane].dbuf, dir);
+		if (ret) {
+			__vb2_buf_end_cpu_access(vb, plane);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * __setup_offsets() - setup unique offsets ("cookies") for every plane in
  * the buffer.
@@ -1423,6 +1482,9 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	}
 
 	if (reacquired) {
+		enum dma_data_direction attach_dir = q->uses_cpu_access ?
+			DMA_BIDIRECTIONAL : q->dma_dir;
+
 		if (vb->planes[0].mem_priv) {
 			vb->copied_timestamp = 0;
 			call_void_vb_qop(vb, buf_cleanup, vb);
@@ -1453,7 +1515,8 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 						  vb,
 						  q->alloc_devs[plane] ? : q->dev,
 						  planes[plane].dbuf,
-						  planes[plane].length);
+						  planes[plane].length,
+						  attach_dir);
 			if (IS_ERR(mem_priv)) {
 				dprintk(q, 1, "failed to attach dmabuf\n");
 				ret = PTR_ERR(mem_priv);
@@ -1504,9 +1567,21 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		}
 	}
 
+	if (q->uses_cpu_access) {
+		ret = __vb2_buf_begin_cpu_access(vb);
+		if (ret) {
+			dprintk(q, 1, "failed to begin CPU access to dmabuf: %d\n",
+				ret);
+			call_void_vb_qop(vb, buf_cleanup, vb);
+			goto err_put_vb2_buf;
+		}
+	}
+
 	ret = call_vb_qop(vb, buf_prepare, vb);
 	if (ret) {
 		dprintk(q, 1, "buffer preparation failed\n");
+		if (q->uses_cpu_access)
+			__vb2_buf_end_cpu_access(vb, vb->num_planes);
 		call_void_vb_qop(vb, buf_cleanup, vb);
 		goto err_put_vb2_buf;
 	}
@@ -1756,6 +1831,8 @@ int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int c
 
 		__vb2_buf_mem_finish(vb);
 		call_void_vb_qop(vb, buf_finish, vb);
+		if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
+			__vb2_buf_end_cpu_access(vb, vb->num_planes);
 		vb->prepared = 0;
 	}
 
@@ -2160,6 +2237,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 	}
 
 	call_void_vb_qop(vb, buf_finish, vb);
+	if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
+		__vb2_buf_end_cpu_access(vb, vb->num_planes);
 	vb->prepared = 0;
 
 	if (pindex)
@@ -2296,6 +2375,8 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 
 		if (vb->prepared) {
 			call_void_vb_qop(vb, buf_finish, vb);
+			if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
+				__vb2_buf_end_cpu_access(vb, vb->num_planes);
 			vb->prepared = 0;
 		}
 		__vb2_dqbuf(vb);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 9ce6284cd5f26..68c146c043fb1 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -768,7 +768,8 @@ static void vb2_dc_detach_dmabuf(void *mem_priv)
 }
 
 static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
-				  struct dma_buf *dbuf, unsigned long size)
+				  struct dma_buf *dbuf, unsigned long size,
+				  enum dma_data_direction dma_dir)
 {
 	struct vb2_dc_buf *buf;
 	struct dma_buf_attachment *dba;
@@ -794,7 +795,7 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
 		return dba;
 	}
 
-	buf->dma_dir = vb->vb2_queue->dma_dir;
+	buf->dma_dir = dma_dir;
 	buf->size = size;
 	buf->db_attach = dba;
 
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index b1d0695cda260..ab03f9d31391a 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -616,7 +616,8 @@ static void vb2_dma_sg_detach_dmabuf(void *mem_priv)
 }
 
 static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
-				      struct dma_buf *dbuf, unsigned long size)
+				      struct dma_buf *dbuf, unsigned long size,
+				      enum dma_data_direction dma_dir)
 {
 	struct vb2_dma_sg_buf *buf;
 	struct dma_buf_attachment *dba;
@@ -640,7 +641,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
 		return dba;
 	}
 
-	buf->dma_dir = vb->vb2_queue->dma_dir;
+	buf->dma_dir = dma_dir;
 	buf->size = size;
 	buf->db_attach = dba;
 	buf->vb = vb;
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 63f023696f3ee..c38faa0188bc9 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -402,7 +402,8 @@ static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
 static void *vb2_vmalloc_attach_dmabuf(struct vb2_buffer *vb,
 				       struct device *dev,
 				       struct dma_buf *dbuf,
-				       unsigned long size)
+				       unsigned long size,
+				       enum dma_data_direction dma_dir)
 {
 	struct vb2_vmalloc_buf *buf;
 
@@ -414,7 +415,7 @@ static void *vb2_vmalloc_attach_dmabuf(struct vb2_buffer *vb,
 		return ERR_PTR(-ENOMEM);
 
 	buf->dbuf = dbuf;
-	buf->dma_dir = vb->vb2_queue->dma_dir;
+	buf->dma_dir = dma_dir;
 	buf->size = size;
 
 	return buf;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a7..8dfe22fa4423c 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -78,7 +78,8 @@ struct vb2_buffer;
  *		to the userspace, also optional.
  * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operation;
  *		   used for DMABUF memory types; dev is the alloc device
- *		   dbuf is the shared dma_buf; returns ERR_PTR() on failure;
+ *		   dbuf is the shared dma_buf; dma_dir is the DMA mapping
+ *		   direction; returns ERR_PTR() on failure;
  *		   allocator private per-buffer structure on success;
  *		   this needs to be used for further accesses to the buffer.
  * @detach_dmabuf: inform the exporter of the buffer that the current DMABUF
@@ -136,7 +137,8 @@ struct vb2_mem_ops {
 	void		*(*attach_dmabuf)(struct vb2_buffer *vb,
 					  struct device *dev,
 					  struct dma_buf *dbuf,
-					  unsigned long size);
+					  unsigned long size,
+					  enum dma_data_direction dma_dir);
 	void		(*detach_dmabuf)(void *buf_priv);
 	int		(*map_dmabuf)(void *buf_priv);
 	void		(*unmap_dmabuf)(void *buf_priv);
@@ -510,6 +512,11 @@ struct vb2_buf_ops {
  *		->finish().
  * @non_coherent_mem: when set queue will attempt to allocate buffers using
  *		non-coherent memory.
+ * @uses_cpu_access: the driver transfers buffer data with the CPU instead of
+ *		DMA. For imported dma-bufs, videobuf2 brackets the interval from
+ *		buf_prepare through buf_finish with dma_buf_begin_cpu_access()
+ *		and dma_buf_end_cpu_access(). Imported attachments use
+ *		bidirectional DMA mappings.
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver must set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. This lock is used when waiting for a new
@@ -614,6 +621,7 @@ struct vb2_queue {
 	unsigned int			uses_requests:1;
 	unsigned int			allow_cache_hints:1;
 	unsigned int			non_coherent_mem:1;
+	unsigned int			uses_cpu_access:1;
 
 	struct mutex			*lock;
 	void				*owner;
-- 
2.47.3

