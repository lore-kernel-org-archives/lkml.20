Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639570;
	b=LyEAEWQcwMTTQNgS2ZbN2mitjAWlq12QwJhyI5HuUfylI7+rk3jL8966KTmH2aAMD9Fb
	 n+vDqhtrQEzVT7qAWNmqcTBaH2S2DQCfQmXJ2mKzEetCR2qQSERo8YVGSFFGsC8g8xIT1
	 VxtWFQby9sCkbjM3ehvTe3WQuuJuIO4IRxExmLHKBSSYPe3OsqBK/B8C4m/qsOXgJRDiw
	 YGJHCeHMQaFjUWssXGTOkx+mjLbh9RQ5Pr6Cg9IEb+UKsUpxYYegTL4KX3RSIG0Nke6CD
	 +g/3LRJUxm6GSrjHMp44NiERM7sVxL1m0B3UviQa2rc5tX2MV9Hk0++1r8WixdrjONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8VG88+Iq3vaISnahrDlu9XP6pNoIrIIWL4VTZc72VoQ=;
	b=cXJGfWC+M3tj5YI0J/T6HidOSC96jmg1aM1I9HyIUGzZCE8+9yMdunkCiuEMiMDEYgSm
	 2huMUFTEoceQXvLLfZ6cM5WzuIn+UIK7xrP6rCy0IcxPdKWjpFJOp85L1zgwCHixk5w5/
	 8Xq5UT4+JnurHfFhmCO5KiIhtsw7yCTy7Q1Qr2tPfFJ6RnpoZTA+dp2833dkluBcYueIk
	 OSBGhmFQAuQMJTq3r226/ezFYeaFgb1X1sNIP/6MAZkx1Y0yewC5UHIXd8SKNus+b5BGJ
	 oUUVkCTS19MEIZfRh77PUtToVmZOIGtOHhTr9aagrUY0kaxh9DMGZXIIiBSPtwnWNcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="QUj/2aX/";
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC8606A91E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FC8606A91E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QUj/2aX/
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab3dd9667dso25897111fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793639568; x=1794244368; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8VG88+Iq3vaISnahrDlu9XP6pNoIrIIWL4VTZc72VoQ=;
        b=QUj/2aX/Pwq4cGAOB7apUhZIZsWaAwdu+sFoW0jJU0WB0eQWSyG13Z2acJZ29W6zDE
         vZorbn+qU1kod/QAAk7ciVbRGz7AXMc+HMeuf1czrqMjb/dW7BjH54VdNhqzULY+O0Ox
         Xe9/1Rh6NA1xgRt+9ZRVfCjAuWrGaiZxffgr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639568; x=1794244368;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8VG88+Iq3vaISnahrDlu9XP6pNoIrIIWL4VTZc72VoQ=;
        b=Rm+txHER8bc4OH+SfHvtBmQKAsZ/VN6xBuCQ9p+gUZGMx3ov93EIZjMoK24uaZhG19
         k5xAE+m5C4upiUGBpuA6RXc/Tdtw3oyxcIC3krp6BBAgzCQEAheTfu53GAyJLs0EUs1b
         m/bRM7YiArdgdivZnkqLUf9P42mCcKV7jaQiBygTMoK9NC30BHINcY4GUH7D3uRgxPrQ
         xZen18D43WiJH0NAWo+8ms09TljYdN2fBrvGsDG91Cyp5/vn5rv3XBfBexpGaspXsocK
         x3Wk6jzm5pPD417ozh+AGEFblw5y+VkqdXBPNA+CmOM3uXZfGwaL5o5tbOBJZTpzxaz9
         tX2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjrY4l+q7Gc363dBI/QUcN9OMPIxmg+6uKNwUuWFCwzwnTrBMgydfYJ9JcutVZtxtGvPnldaexEgTPCBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SKrM78ULOXa8o4GjXHaawar1hnghXavgaktL8bkBC0CyWBVXh
	xXwXPw3D1dbERWStgmJTQpx3J0HpydL/UTopQ/2otSaGSXJHnLRHNR+OSR+d7wkAJEjk5voFW/0
	USUnUZg==
X-Gm-Gg: AYBFou0Hm1D5EluXtLSOr61oL2YdpJJYGA0ah+mU6Gdpnm5eerV5oOA2p5NWOtqa/1a
	BdZgW7RtfjTwiB83Z2i2mZ/e3h0P32fVoRF5GIDE15yyfVNNADjBfLci//eEpFObx/xdhyXO6ad
	Fy9g+YEDk+GAOmurRf4KLYQARuCVuokLJJlWRtIndU1wsbnXeb/mQtDk6UfqgO5Xls0TiO071YZ
	aJdwZGYOSgBlsIfYkCKmWQ+TY99J9CGgBJxFGFWYMfd4Mv10yEXTKvu5S3VU/fHkinCG+F/GU97
	WsVqczHxOme0DzsTpHRm807sAZ/B9+Q5z84z0oEkpG0fopfuWXG73441QT+jWMDrhoUtbBr9mXU
	dzzMQ/++cj1AZifwAKAo8UkJC/dqAWGiv5PdTE1Ri2fl6vK651cVvWdLZtol5gNSI26CUjE7ori
	YczPmPvGwltqYCczDQmBKtL7wL/AwHTws0A0KAmpULmdvxco4hy+K32+15tKVdR0G1qDuvx11HE
	xYPEFrP+bfAxrY8/KbTWUXHeQlU/1fhtF82Dx+LKllaHB5aViGIqU+8WSQcqNF8KeUpzmT/nXpy
	z4BC/RyIpkich9/4NLHguXQQ9foRod+heedzix7B3ya1Z7lDd3ls3oNZw3n23BuwEhraBU++I1t
	DG02Lf73YyA==
X-Received: by 2002:a05:651c:4198:b0:3ab:53ca:c746 with SMTP id 38308e7fff4ca-3acb7a9a3f9mr29982501fa.12.1793639568252;
        Mon, 02 Nov 2026 09:12:48 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd5c479bbsm566121fa.32.2026.11.02.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:12:47 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Nov 2026 17:12:44 +0000
Subject: [PATCH] media: videobuf2: publish buffers in bufs_bitmap under
 mmap_lock
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
Message-Id: <20261102-vb2-mmap_lock-v1-1-fe550fe03ed8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIvE6GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3bIkI93c3MSC+Jz85GxdS1PLVIPkZJPUlCRjJaCegqLUtMwKsHn
 RsbW1ANTThOxfAAAA
X-Change-ID: 20261102-vb2-mmap_lock-959e0cc4edb3
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

vb2_mmap() only takes q->mmap_lock, not the main queue lock (q->lock).
To keep vb2_mmap() safe, newly allocated buffers must not become visible
in vb2_get_buffer() until they are fully initialized and q->mmap_lock is
held.

Commit a286b0837e13 ("media: core: Add bitmap manage bufs array entries")
started setting q->bufs_bitmap inside __vb2_queue_alloc() before buffer
memory is allocated and without holding q->mmap_lock. As a result:

- A concurrent mmap() can find a half-initialized buffer, and if buffer
  allocation or .buf_init() fails, __vb2_queue_alloc() frees that buffer
  without holding q->mmap_lock, causing a use-after-free in vb2_mmap().
- If fewer buffers are allocated than requested, they are already
  counted as active in q->bufs_bitmap before .queue_setup() checks
  whether the smaller count is acceptable.

Fix this by keeping new buffers only in q->bufs[] during allocation and
setting their bits in q->bufs_bitmap under q->mmap_lock once allocation
and .queue_setup() succeed. Add a memory barrier pair on q->bufs_bitmap
so lockless vb2_get_buffer() readers also see fully initialized buffers,
and let __vb2_queue_free() read q->bufs[] directly when cleaning up
unexposed buffers.

Fixes: a286b0837e13 ("media: core: Add bitmap manage bufs array entries")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
This patch was generated by an LLM, but supervised and reviewed by a
human (not the most handsome human, but a human).
---
 drivers/media/common/videobuf2/videobuf2-core.c | 97 +++++++++++++++++++------
 include/media/videobuf2-core.h                  | 13 +++-
 2 files changed, 85 insertions(+), 25 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f1757..185393078ce3 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -427,19 +427,36 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
 }
 
 /**
- * vb2_queue_add_buffer() - add a buffer to a queue
- * @q:	pointer to &struct vb2_queue with videobuf2 queue.
- * @vb:	pointer to &struct vb2_buffer to be added to the queue.
- * @index: index where add vb2_buffer in the queue
+ * vb2_queue_add_buffers() - publish buffers staged by __vb2_queue_alloc()
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @start:	index of the first buffer to publish.
+ * @count:	number of buffers to publish.
+ *
+ * Set the @q->bufs_bitmap bits of the @count fully initialized buffers that
+ * __vb2_queue_alloc() stored in @q->bufs[] starting at @start, which makes
+ * them visible to vb2_get_buffer().
  */
-static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
+static void vb2_queue_add_buffers(struct vb2_queue *q, unsigned int start,
+				  unsigned int count)
 {
-	WARN_ON(index >= q->max_num_buffers || test_bit(index, q->bufs_bitmap) || vb->vb2_queue);
+	unsigned int i;
+
+	lockdep_assert_held(&q->mmap_lock);
 
-	q->bufs[index] = vb;
-	vb->index = index;
-	vb->vb2_queue = q;
-	set_bit(index, q->bufs_bitmap);
+	/*
+	 * Order the buffer initialization and the q->bufs[] stores done by
+	 * __vb2_queue_alloc() before the bits that publish them. Pairs with
+	 * test_bit_acquire() in vb2_get_buffer(), which is also called
+	 * without q->lock or q->mmap_lock held, e.g. by vb2_find_buffer()
+	 * from a mem2mem .device_run().
+	 */
+	smp_mb__before_atomic();
+	for (i = start; i < start + count; i++) {
+		if (WARN_ON(i >= q->max_num_buffers || !q->bufs[i] ||
+			    test_bit(i, q->bufs_bitmap)))
+			continue;
+		set_bit(i, q->bufs_bitmap);
+	}
 }
 
 /**
@@ -448,6 +465,8 @@ static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, uns
  */
 static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
 {
+	lockdep_assert_held(&vb->vb2_queue->mmap_lock);
+
 	clear_bit(vb->index, vb->vb2_queue->bufs_bitmap);
 	vb->vb2_queue->bufs[vb->index] = NULL;
 	vb->vb2_queue = NULL;
@@ -460,6 +479,11 @@ static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
  * @first_index: index of the first created buffer, all newly allocated buffers
  *		 have indices in the range [first_index..first_index+count-1]
  *
+ * The allocated buffers are stored in q->bufs[] but not published in
+ * q->bufs_bitmap: the caller must either publish them with
+ * vb2_queue_add_buffers() or free them with __vb2_queue_free(), both under
+ * q->mmap_lock.
+ *
  * Returns the number of buffers successfully allocated.
  */
 static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
@@ -506,7 +530,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		}
 
 		vb->state = VB2_BUF_STATE_DEQUEUED;
+		vb->vb2_queue = q;
 		vb->num_planes = num_planes;
+		vb->index = index + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
 		init_buffer_cache_hints(q, vb);
@@ -515,7 +541,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			vb->planes[plane].min_length = plane_sizes[plane];
 		}
 
-		vb2_queue_add_buffer(q, vb, index++);
 		call_void_bufop(q, init_buffer, vb);
 
 		/* Allocate video buffer memory for the MMAP type */
@@ -524,7 +549,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			if (ret) {
 				dprintk(q, 1, "failed allocating memory for buffer %d\n",
 					buffer);
-				vb2_queue_remove_buffer(vb);
 				kfree(vb);
 				break;
 			}
@@ -539,11 +563,20 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 				dprintk(q, 1, "buffer %d %p initialization failed\n",
 					buffer, vb);
 				__vb2_buf_mem_free(vb);
-				vb2_queue_remove_buffer(vb);
 				kfree(vb);
 				break;
 			}
 		}
+
+		/*
+		 * Stage the initialized buffer in q->bufs[]; it becomes visible
+		 * to vb2_get_buffer() only after vb2_queue_add_buffers() sets
+		 * its bit in q->bufs_bitmap under q->mmap_lock.
+		 */
+		WARN_ON(vb->index >= q->max_num_buffers ||
+			q->bufs[vb->index] ||
+			test_bit(vb->index, q->bufs_bitmap));
+		q->bufs[vb->index] = vb;
 	}
 
 	dprintk(q, 3, "allocated %d buffers, %d plane(s) each\n",
@@ -562,7 +595,8 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int
 	struct vb2_buffer *vb;
 
 	for (i = start; i < start + count; i++) {
-		vb = vb2_get_buffer(q, i);
+		/* See __vb2_queue_free() for why vb2_get_buffer() isn't used */
+		vb = q->bufs[i];
 		if (!vb)
 			continue;
 
@@ -580,6 +614,11 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int
  * __vb2_queue_free() - free @count buffers from @start index of the queue - video memory and
  * related information, if no buffers are left return the queue to an
  * uninitialized state. Might be called even if the queue has already been freed.
+ *
+ * Buffers are looked up directly in q->bufs[] instead of through
+ * vb2_get_buffer() so that buffers staged by __vb2_queue_alloc() that were
+ * never published in q->bufs_bitmap (because a later .queue_setup() call
+ * rejected the allocated number of buffers) are freed as well.
  */
 static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned int count)
 {
@@ -587,9 +626,19 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 
 	lockdep_assert_held(&q->mmap_lock);
 
+	/*
+	 * No buffers were ever allocated (e.g. REQBUFS(0) on a fresh queue),
+	 * only the queue state needs to be reset.
+	 */
+	if (!q->bufs) {
+		q->memory = VB2_MEMORY_UNKNOWN;
+		INIT_LIST_HEAD(&q->queued_list);
+		return;
+	}
+
 	/* Call driver-provided cleanup function for each buffer, if provided */
 	for (i = start; i < start + count; i++) {
-		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+		struct vb2_buffer *vb = q->bufs[i];
 
 		if (vb && vb->planes[0].mem_priv)
 			call_void_vb_qop(vb, buf_cleanup, vb);
@@ -624,7 +673,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 		q->cnt_unprepare_streaming = 0;
 	}
 	for (i = start; i < start + count; i++) {
-		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+		struct vb2_buffer *vb = q->bufs[i];
 		bool unbalanced;
 
 		if (!vb)
@@ -676,7 +725,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 
 	/* Free vb2 buffers */
 	for (i = start; i < start + count; i++) {
-		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+		struct vb2_buffer *vb = q->bufs[i];
 
 		if (!vb)
 			continue;
@@ -1000,14 +1049,16 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 
 	if (ret < 0) {
 		/*
-		 * Note: __vb2_queue_free() will subtract 'allocated_buffers'
-		 * from already queued buffers and it will reset q->memory to
+		 * Note: the buffers allocated by __vb2_queue_alloc() were never
+		 * published in q->bufs_bitmap, __vb2_queue_free() frees them
+		 * straight from q->bufs[] and resets q->memory to
 		 * VB2_MEMORY_UNKNOWN.
 		 */
 		__vb2_queue_free(q, first_index, allocated_buffers);
 		mutex_unlock(&q->mmap_lock);
 		return ret;
 	}
+	vb2_queue_add_buffers(q, first_index, allocated_buffers);
 	mutex_unlock(&q->mmap_lock);
 
 	/*
@@ -1125,14 +1176,16 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 
 	if (ret < 0) {
 		/*
-		 * Note: __vb2_queue_free() will subtract 'allocated_buffers'
-		 * from already queued buffers and it will reset q->memory to
-		 * VB2_MEMORY_UNKNOWN.
+		 * Note: the buffers allocated by __vb2_queue_alloc() were never
+		 * published in q->bufs_bitmap, __vb2_queue_free() frees them
+		 * straight from q->bufs[] and resets q->memory to
+		 * VB2_MEMORY_UNKNOWN if no buffers are left.
 		 */
 		__vb2_queue_free(q, *first_index, allocated_buffers);
 		mutex_unlock(&q->mmap_lock);
 		return -ENOMEM;
 	}
+	vb2_queue_add_buffers(q, *first_index, allocated_buffers);
 	mutex_unlock(&q->mmap_lock);
 
 	/*
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a..0b32ac7bc8fc 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -565,8 +565,11 @@ struct vb2_buf_ops {
  * @memory:	current memory type used
  * @dma_dir:	DMA mapping direction.
  * @bufs:	videobuf2 buffer structures. If it is non-NULL then
- *		bufs_bitmap is also non-NULL.
- * @bufs_bitmap: bitmap tracking whether each bufs[] entry is used
+ *		bufs_bitmap is also non-NULL. __vb2_queue_alloc() fills in
+ *		an entry before its bit is set in bufs_bitmap, so buffers
+ *		must be looked up with vb2_get_buffer().
+ * @bufs_bitmap: bitmap tracking which bufs[] entries hold a fully
+ *		initialized buffer. Bits are set and cleared under @mmap_lock.
  * @max_num_buffers: upper limit of number of allocated/used buffers.
  *		     If set to 0 v4l2 core will change it VB2_MAX_FRAME
  *		     for backward compatibility.
@@ -1286,7 +1289,11 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
 	if (index >= q->max_num_buffers)
 		return NULL;
 
-	if (test_bit(index, q->bufs_bitmap))
+	/*
+	 * A set bit guarantees that the buffer is fully initialized, pairs
+	 * with smp_mb__before_atomic() in vb2_queue_add_buffers().
+	 */
+	if (test_bit_acquire(index, q->bufs_bitmap))
 		return q->bufs[index];
 	return NULL;
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-vb2-mmap_lock-959e0cc4edb3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

