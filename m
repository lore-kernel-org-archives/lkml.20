Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048459;
	b=qk7F5+SvTOqt9OtUCTVjTY9nfUXk4FgouYLJ4KEmgtglYihnCfdVknxOGfIkDxgZm8Ou
	 C/QkIMPVIeFQOIHSFLbWB7nUBZ/0Jg6Sdo8oLCL2zgO/IQYLtHhQcAGN14RlRCY8qcmZN
	 MpynLsPSrbMiTrz+roslxx+nij5mrgVGGFiZg81utsVZY+W9LX10qJmX6+qne72nwauWK
	 DM0ku3PBC5RtmksLCCe36zFtw/OWnlTvRD2Q4mTwQ7vTQXTqVxFfchKy1qcSUhoz+HzFg
	 rBOWEBj/CvIJytCb8TXt0gxIJViL8lY8TMUB87YDtC5mrQHyN1UMrDTIQ27bLp0Ubsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gs6IOJ2d9nrR4hk6rBiqyfNHtcU7Qx4Hjf4P/81L2vQ=;
	b=bFiFVyJ+7Ze4IE2/fO4DjGbFOE8Okhaq4SzsZm+vo5FcN1D9CPjb5QpQpWtAahFw3w4o
	 wFaT1kLmh2XWffnt4MQhzmgBj+lCYLTeksgcc2DmtMB/uHM6bHOv3FfAAF8yEnOouj43G
	 5vxv40a11v3kibF0pi0VZIt6xqckREwPS+yYEA8q8yxzLK7ZJC0PuCvEsf2GZOL6kbdQ3
	 v6PM7eqxPLhwO7JJvfeYUwJNNA5zrZ7i4avubA8rKzRN/uBVITha3HyYnxsjd7iq06ffe
	 j+zsy8oOGD78CPKhGutAF4c5eyhAntpzlNqzIeU3/GnfVHRc8xTLsKCmDKvvDjC/0qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ao5dSXnh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A42606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A42606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ao5dSXnh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso9394645e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048457; x=1794653257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gs6IOJ2d9nrR4hk6rBiqyfNHtcU7Qx4Hjf4P/81L2vQ=;
        b=Ao5dSXnh5T63YZE4nv498Lf9nDJMoqxV4INinVAuJPytxB4b6AqIEZ4zWnKCEHlAiS
         NpnKYQDOh46uHYfcJbN0BOsjA9dD9mpFhY5o9MzO0pwT1o8A3VeHNenWEdVJWxsJjQOV
         mmQJQSwHX05uDCWDfD4NgNC+hvBRQvlv3yZAPDDOQJQ6WNhX6c4XZTDq+IUaF0ddd8vc
         5KYPPOLvnKGDD4pc+MH0SbviFj/qh6Gi1jjA2M6MaSGQFYpbpn7iWBcWmSsd1R+xPNif
         K/2kJn46A4qNj6ulC2Cba7ThewQW0Gcat3H1gnC6D44+Azv5ntLWppBqpA/PiDxByUtd
         CQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048457; x=1794653257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gs6IOJ2d9nrR4hk6rBiqyfNHtcU7Qx4Hjf4P/81L2vQ=;
        b=erva1HoCFz6qtasZpS6R7uMt2qqp0TXy4Jvd7f+6Nc8vm7giX+NF1zKXwaquhqCS9N
         UjnM4SfD+LgWXqjJcOICJN2TLF8vUGlEX6kKRBy6j2cx5FN5wDxyh+kxe6bh/6iat8JJ
         Hl2tBc0CkFIrCSQEndHF5/+mFUwHUSAktYCOQk5L4/dXAjsxRpgBx9F09pM/IALBs1+N
         hFY7bpAj/iBOQIoRgVm5mIz4+2TqPN7+S2WfrD+kK2ulPOnkS7DBVWJbrjwZ5DjN9uKk
         2DG0f996UCHPYaZujde7pYJI+7J62VTNvtkRiLy/+CnvXR1vDHn8VW4vMPsJth4WgCut
         ioHg==
X-Forwarded-Encrypted: i=1; AKwUvByWGaL3A82izAHNjrmiAP60VQ78K7uqdaydh9+jz6Tn9tXEglg7GjC9eGzq4gkCKVG/MuNmJHKDN2etqlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z965mIneoZN2gaCMLQcySRPtjmmVEC5sZF1d2ByIhi2+MVb3Ib+
	yAQZE6kU2cjPKU4G7hcsNazmFVsM2xjkQOz0wURIHrRXCSalEYEl/6uv
X-Gm-Gg: AYBFou1TvP7dv1VBLRLK7fTtNdeIrv5fSob41yUd2dMuQhjpaDfymVkcxbWsh8QOUHj
	lgLiKe+loa3vkQ7giMrQqdLjZUYDyAwQ0JqQY0GWfg7+HVeqRrSg66hua0whTwbOq2CMi8G5BIR
	ApsuODVwIH+VPAsbv/uklXw0cbK5Krs8h+Y38qCEeEb0n8EgAJDX3SRQqHCgmyqGvlHVxfGv3zK
	u0e7kvGlRUu1M60A2e8iGauYlHbx4pzOh7X5VLqWq05wk37Etun/swcCB2h/+8vkt8Sj4PRWDNL
	hlQvaQDCaoBUMgudD1SQzkxc/R96ON+Hz1ZVfYdnLNoOBIRcnkspr+yKxddTprJSQUmxktC7RVK
	mrTgHp3VenDeee6gOyju9CcrMsVswVwkfEKE1q8nlEY+NR/1rnyMsK1PERjIew1lcpcT8TIXEIf
	iodgr8QtB+ub5ukEXgJUZpCiCQ4dY/5bt3NqKKHe2NnAaS4KBYLor7OPo3Ndb6N5YPz4A51fLn7
	W0mMHEtRYlfTy8ESx1gd3x6+3btD89nfnfRbHsiX1RHLGhRS0tPlOdxegETmUqJUMohp9WH3m7X
	teNwLxINxvR3Wp7HxgvQ3WWjh43T5OFqcCHxpBr6scNaSwEYyYWeEoYJgEqqhzugo+pvTy4l9s9
	GpvOVksPxZthjViWwNteIK5PYZCaPJea89cEeejcjWe7nBrxLrMSHUZX/63PVUgyalKIKtgBKzn
	4y4e6ad0/HcxRaojDzmUl03IFScVk+ux7kTTxR
X-Received: by 2002:a05:600d:82e1:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4b6e0cf4464mr101136445e9.34.1794048456657;
        Sat, 07 Nov 2026 02:47:36 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm47935635e9.4.2026.11.07.02.47.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:47:36 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: videobuf2: add opt-in DMA-BUF CPU access
Date: Sat,  7 Nov 2026 11:47:01 +0100
Message-Id: <20261107104703.44111-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107104703.44111-1-kmehltretter@gmail.com>
References: <20261107104703.44111-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers that transfer buffer contents with the CPU must bracket access to
imported DMA-BUFs with dma_buf_begin_cpu_access() and
dma_buf_end_cpu_access().

Add a uses_cpu_access queue flag for vb2-vmalloc queues to bracket the
interval from buf_prepare() through buf_finish(), using read access for
output queues and write access for capture queues.

Keep this opt-in because some vb2-vmalloc drivers pass imported buffers to
hardware, and end access in process context because DMA-BUF callbacks may
sleep and return errors.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
- Scope uses_cpu_access to vb2-vmalloc queues and drop the attach_dmabuf
  dma_dir parameter from vb2_mem_ops and the allocators (Tomasz Figa).
- Call __vb2_buf_end_cpu_access() from __vb2_buf_cancel() (Tomasz Figa).

 .../media/common/videobuf2/videobuf2-core.c   | 76 +++++++++++++++++++
 include/media/videobuf2-core.h                |  5 ++
 2 files changed, 81 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 29e539ee002e..6c32d3cccb93 100644
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
@@ -1504,9 +1563,21 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
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
@@ -1720,6 +1791,7 @@ EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
 static void __vb2_buf_cancel(struct vb2_buffer *vb)
 {
 	struct media_request *req = vb->req_obj.req;
+	struct vb2_queue *q = vb->vb2_queue;
 
 	/*
 	 * If a request is associated with this buffer, then
@@ -1743,6 +1815,8 @@ static void __vb2_buf_cancel(struct vb2_buffer *vb)
 
 	if (vb->prepared) {
 		call_void_vb_qop(vb, buf_finish, vb);
+		if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
+			__vb2_buf_end_cpu_access(vb, vb->num_planes);
 		vb->prepared = 0;
 	}
 	__vb2_dqbuf(vb);
@@ -2191,6 +2265,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 	}
 
 	call_void_vb_qop(vb, buf_finish, vb);
+	if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
+		__vb2_buf_end_cpu_access(vb, vb->num_planes);
 	vb->prepared = 0;
 
 	if (pindex)
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a..bbcdd8c8989a 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -510,6 +510,10 @@ struct vb2_buf_ops {
  *		->finish().
  * @non_coherent_mem: when set queue will attempt to allocate buffers using
  *		non-coherent memory.
+ * @uses_cpu_access: the driver transfers buffer data with the CPU instead of
+ *		DMA. For imported dma-bufs on vb2-vmalloc queues, videobuf2
+ *		brackets the interval from buf_prepare through buf_finish with
+ *		dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver must set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. This lock is used when waiting for a new
@@ -614,6 +618,7 @@ struct vb2_queue {
 	unsigned int			uses_requests:1;
 	unsigned int			allow_cache_hints:1;
 	unsigned int			non_coherent_mem:1;
+	unsigned int			uses_cpu_access:1;
 
 	struct mutex			*lock;
 	void				*owner;
-- 
2.39.5 (Apple Git-154)

