Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A263C3D6CB8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881893; cv=none; b=jiwqkdo4w2jFsYoxMMA+sIA/0/byoZkqSCm3HzOXdOFVKoj1e14emoqleWLrqrXm8iMMuKi4DQTlCP2OXiPDJoayZJQk7ygADUmDRqveGwG/lr+t0VuVqc+/6w3QwIu8BLt9iLVOyJK1pVP8Ecqshx4iQu73gSvZHVIuKVyo2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881893; c=relaxed/simple;
	bh=PktOuSR789Xz8hQXhutSEVX6QVgbRkG8rmm+Jk3lzzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Up6IgZ3Li1ZiPLJf9BI3OVgN8RqLw9r/nZ5GzarHSQXyq3oRtejIUq4EXwtHgdyFh3f/v1oaBVUW8C6BCnjogWVHPlAXO0y2ETMJhyTWMMNQggHzLl+fx8wGJdWgIgaxZlYNDPfMqwni2s6D/qPuIzNIcFjKx78EroeTQYug2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6q154oF; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6q154oF"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1699416a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881891; x=1792486691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6uYGhbomZY8+eZ8PUN2cUoF333JDkSK0b8ZvX+JYrI=;
        b=A6q154oF8EgqLsA81naL1bCRb5lLfD8qXTIRf5FCUcPJ7VOsGPUjPIHA66N5hHO1jd
         g47x3olnvZ6OT90uKE+QeeAKRRy/fMyKovrD/0Q+QSeEwAETTId88sGgK3k72Ug1Ajtd
         23uYMuR0kEDmePIkk/DiRcey57apFBQ4jnEue5icdlg8ly5UXzoU6XmKJERq6JEQ7QOB
         7mu6OQWqhaybVvxON2g7VJUg+j2NsFdvHanFV+8mZtSZgvHFb4XsOqUDkBG5iHw8eL7/
         77O8AcXo3HaRI/D2o/qgRhp2n0IaiH0Hkebot/SJhjG4xX6Z5AnYunZHSeKKA3HemHRD
         BD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881891; x=1792486691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6uYGhbomZY8+eZ8PUN2cUoF333JDkSK0b8ZvX+JYrI=;
        b=XP0OXWNptxpBcBAGwpB0JFaFn/axFwRpIhp0kI45y94uuQo7IA29AJEnKap4h7vFK3
         rgiRRmcjXs81FtUtR8fWU0hsB5okf7MIrCSb4uebiXQBBiN6Nhc4VdCii8Ag8p5uTK4T
         802spVw05s6qN8Ql5OM95aE1DT4ltzo4rfIC9g9ibmPEngntWvx73LFYDallEEJuU+Fo
         qIy5d8NGdRSyYQ+nCjW0l9UQ7OHdJn4zGfgqrGkJFqtHeCYe4/37HyjlE961330FTfn2
         BHK0lUHhOzmX0Jz5iN69Yx7B3+44oGbIEZm6gjY0whUFuoox8r4zbBHcuNPPwWpvKtP4
         gtUw==
X-Forwarded-Encrypted: i=1; AKwUvBxbZG2n05C9nIRtkOwNB/fevc2wr6kgTNt+XwJSmAxuB1cpxi2DdGjTtrXi8MDEsNLk2ndckQ/Q47lG7q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk/D5qfI50qPHxweyAQmQhzEu0wDwRgn4ZZcMxZZaBOqkuofrj
	i9ZyRAGLJVEdsmih8lv4PJgEYJdRtpAzDhul6sIuJo4boHwgzT29euv7
X-Gm-Gg: AYBFou06VGiYs8NYcMjg+0FKtUQliBmc1MSxbLkffV9ke12AWg+ubGewB+PWdljSXcf
	htty9ah67Z+5HFiLQRkDKTVCMe0IMXV+r1acQyYKerOzfQAMqjutVTXsg35duS8ghxjDoRgalx4
	6J3YfWb+pEs9gEuhcQ5iVmcZBBXtwWadHz90kLXofngdXYHe48q2kaHfh9pfz2oOjjs1oipCI4I
	XflKVUAKOSfXOEXsqACzvvwTNbb2tu0i3RbAY1nrrYUbSOZXNYTefZC5IsGcA2/tCS1V6XOADBy
	cQOuBibYz3X25VyVidkvaigmGcZS93NeU03vdVAgYM5KzJglYDPBOMSYYZWLhYcsG4LY6q6As8c
	licJLHYihbNjEldtjNKbIXoS44kzHpUUGVJdkJcLr23Ta0VZmMKS0NbCHROzSZXewN1+1l2MAc4
	SUCTXuy7+X3BU1BRNUFBxgQ5/aZkwvHdqEMfHGDLPsxWGb6DkUD+eugqHQU1Iu9nRmiIRV1RY/q
	cMvVG17wuKT69BSBoccpg5QmF5xNgPwTWBujDyW1Xsi38D60XwIkhy3NX98xlkL4ix+j3VMoJ9v
	Zjv17ugV1Kqb4UyX
X-Received: by 2002:a05:6a21:4eac:b0:3dd:a00a:170f with SMTP id adf61e73a8af0-3e16be93987mr10646225637.42.1791881890600;
        Tue, 13 Oct 2026 01:58:10 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6063d31dcsm1838592a12.3.2026.10.13.01.58.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 01:58:10 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>
Subject: [PATCH v3 5/5] ALSA: virtio: Keep control payloads alive through DMA completion
Date: Tue, 13 Oct 2026 17:57:52 +0900
Message-ID: <d58a3ac9b1719fdf8ce9d286be606128aeebf1aa.1791881787.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791881787.git.mynameisjune111@gmail.com>
References: <cover.1791881787.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Control requests can expose caller-owned payloads to the device after a
synchronous send times out. Keep request and response headers and payloads
in the reference-counted message so caller cleanup cannot invalidate DMA.

Keep the queue reference until device completion or post-reset cleanup,
even when the caller times out or is interrupted. Consume the caller's
reference on every send path, and let response readers retain an extra
reference through copyout. Check payload sizes and allocation arithmetic
before building the scatterlists.

A control value payload is also read by the CPU as a typed structure. DMA
cacheline alignment alone does not guarantee the structure's CPU alignment.
Align regions to the greater of the DMA cacheline and control-value type
alignment, and reserve prefix slack from the buffer base so typed accesses
remain aligned while scatterlist regions stay on cacheline boundaries.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Changes in v3:
- Respect both DMA and CPU type alignment, remove the +1 offset,
  and retain alignment for every region, including odd-sized payloads.

 sound/virtio/virtio_ctl_msg.c | 275 ++++++++++++++++++++++++++--------
 sound/virtio/virtio_ctl_msg.h |  24 ++-
 sound/virtio/virtio_kctl.c    | 104 +++++++------
 sound/virtio/virtio_pcm_msg.c |   2 +-
 4 files changed, 285 insertions(+), 120 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 7114bea4033a..2e0ff15e729d 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -3,7 +3,10 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2021 OpenSynergy GmbH
  */
+#include <linux/dma-mapping.h>
+#include <linux/limits.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/virtio_config.h>
 
 #include "virtio_card.h"
@@ -11,7 +14,12 @@
 /**
  * struct virtio_snd_msg - Control message.
  * @sg_request: Scattergather list containing a device request (header).
+ * @sg_request_data: Scattergather list containing request data.
  * @sg_response: Scattergather list containing a device response (status).
+ * @sg_response_data: Scattergather list containing response data.
+ * @dma_buffer: Message-owned storage for all DMA-visible SG regions.
+ * @request_data_size: Size of the request data buffer.
+ * @response_data_size: Size of the response data buffer.
  * @list: Pending message list entry.
  * @notify: Request completed notification.
  * @ref_count: Reference count used to manage a message lifetime.
@@ -19,7 +27,12 @@
  */
 struct virtio_snd_msg {
 	struct scatterlist sg_request;
+	struct scatterlist sg_request_data;
 	struct scatterlist sg_response;
+	struct scatterlist sg_response_data;
+	void *dma_buffer;
+	size_t request_data_size;
+	size_t response_data_size;
 	struct list_head list;
 	struct completion notify;
 	refcount_t ref_count;
@@ -47,8 +60,10 @@ void virtsnd_ctl_msg_ref(struct virtio_snd_msg *msg)
  */
 void virtsnd_ctl_msg_unref(struct virtio_snd_msg *msg)
 {
-	if (refcount_dec_and_test(&msg->ref_count))
+	if (refcount_dec_and_test(&msg->ref_count)) {
+		kfree(msg->dma_buffer);
 		kfree(msg);
+	}
 }
 
 /**
@@ -73,10 +88,71 @@ void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg)
 	return sg_virt(&msg->sg_response);
 }
 
+/**
+ * virtsnd_ctl_msg_request_data() - Get the request data buffer.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void *virtsnd_ctl_msg_request_data(struct virtio_snd_msg *msg)
+{
+	return msg->request_data_size ? sg_virt(&msg->sg_request_data) : NULL;
+}
+
+/**
+ * virtsnd_ctl_msg_response_data() - Get the response data buffer.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void *virtsnd_ctl_msg_response_data(struct virtio_snd_msg *msg)
+{
+	return msg->response_data_size ? sg_virt(&msg->sg_response_data) : NULL;
+}
+
+/**
+ * virtsnd_ctl_msg_sg_init() - Place one DMA region on cacheline boundaries.
+ * @sg: Scattergather entry for the region.
+ * @cursor: Current location in the message-owned DMA buffer.
+ * @size: Region length.
+ * @alignment: Alignment for DMA cachelines and typed CPU accesses.
+ *
+ * Context: Any context during message allocation.
+ * Return: 0 on success, -EOVERFLOW if the address cannot be represented.
+ */
+static int virtsnd_ctl_msg_sg_init(struct scatterlist *sg, u8 **cursor,
+				   size_t size, size_t alignment)
+{
+	uintptr_t address = (uintptr_t)*cursor;
+	uintptr_t end;
+	size_t padding;
+
+	padding = address % alignment;
+	if (padding &&
+	    check_add_overflow(address, (uintptr_t)(alignment - padding),
+			       &address))
+		return -EOVERFLOW;
+
+	if (check_add_overflow(address, (uintptr_t)size, &end))
+		return -EOVERFLOW;
+
+	padding = end % alignment;
+	if (padding &&
+	    check_add_overflow(end, (uintptr_t)(alignment - padding), &end))
+		return -EOVERFLOW;
+
+	sg_init_one(sg, (void *)address, (unsigned int)size);
+	*cursor = (u8 *)end;
+
+	return 0;
+}
+
 /**
  * virtsnd_ctl_msg_alloc() - Allocate and initialize a control message.
  * @request_size: Size of request header.
  * @response_size: Size of response header.
+ * @request_data_size: Size of request data buffer.
+ * @response_data_size: Size of response data buffer.
  * @gfp: Kernel flags for memory allocation.
  *
  * The message will be automatically freed when the ref_count value is 0.
@@ -85,20 +161,85 @@ void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg)
  * Return: Allocated message on success, NULL on failure.
  */
 struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
-					     size_t response_size, gfp_t gfp)
+					     size_t response_size,
+					     size_t request_data_size,
+					     size_t response_data_size,
+					     gfp_t gfp)
 {
 	struct virtio_snd_msg *msg;
+	struct scatterlist *sgs[4];
+	size_t sizes[4] = {
+		request_size,
+		response_size,
+		request_data_size,
+		response_data_size,
+	};
+	size_t alignment;
+	size_t dma_buffer_size;
+	size_t aligned_size;
+	size_t padding;
+	u8 *data;
+	unsigned int i;
+	int cache_alignment;
+	int rc;
 
-	if (!request_size || !response_size)
+	if (!request_size || !response_size || request_size > UINT_MAX ||
+	    response_size > UINT_MAX || request_data_size > UINT_MAX ||
+	    response_data_size > UINT_MAX)
 		return NULL;
+	cache_alignment = dma_get_cache_alignment();
+	if (cache_alignment <= 0)
+		return NULL;
+	/* DMA coherence does not remove the CPU's type alignment requirement. */
+	alignment = max_t(size_t, cache_alignment,
+			  __alignof__(struct virtio_snd_ctl_value));
+
+	/* Reserve prefix alignment slack before the first DMA region. */
+	dma_buffer_size = alignment - 1;
+	for (i = 0; i < ARRAY_SIZE(sizes); ++i) {
+		if (!sizes[i])
+			continue;
+
+		padding = sizes[i] % alignment;
+		aligned_size = sizes[i];
+		if (padding &&
+		    check_add_overflow(aligned_size, alignment - padding,
+				       &aligned_size))
+			return NULL;
+
+		if (check_add_overflow(dma_buffer_size, aligned_size,
+				       &dma_buffer_size))
+			return NULL;
+	}
 
-	msg = kzalloc(sizeof(*msg) + request_size + response_size, gfp);
+	msg = kzalloc(sizeof(*msg), gfp);
 	if (!msg)
 		return NULL;
 
-	sg_init_one(&msg->sg_request, (u8 *)msg + sizeof(*msg), request_size);
-	sg_init_one(&msg->sg_response, (u8 *)msg + sizeof(*msg) + request_size,
-		    response_size);
+	msg->dma_buffer = kzalloc(dma_buffer_size, gfp);
+	if (!msg->dma_buffer) {
+		kfree(msg);
+		return NULL;
+	}
+	data = msg->dma_buffer;
+	sgs[0] = &msg->sg_request;
+	sgs[1] = &msg->sg_response;
+	sgs[2] = &msg->sg_request_data;
+	sgs[3] = &msg->sg_response_data;
+	for (i = 0; i < ARRAY_SIZE(sizes); ++i) {
+		if (!sizes[i])
+			continue;
+
+		rc = virtsnd_ctl_msg_sg_init(sgs[i], &data, sizes[i], alignment);
+		if (rc) {
+			kfree(msg->dma_buffer);
+			kfree(msg);
+			return NULL;
+		}
+	}
+
+	msg->request_data_size = request_data_size;
+	msg->response_data_size = response_data_size;
 
 	INIT_LIST_HEAD(&msg->list);
 	init_completion(&msg->notify);
@@ -112,17 +253,15 @@ struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
  * virtsnd_ctl_msg_send() - Send a control message.
  * @snd: VirtIO sound device.
  * @msg: Control message.
- * @out_sgs: Additional sg-list to attach to the request header (may be NULL).
- * @in_sgs: Additional sg-list to attach to the response header (may be NULL).
  * @nowait: Flag indicating whether to wait for completion.
  *
  * Context: Any context. Takes and releases the control queue spinlock.
  *          May sleep if @nowait is false.
+ *          Consumes the caller's reference on every return path.
  * Return: 0 on success, -errno on failure.
  */
 int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
-			 struct scatterlist *out_sgs,
-			 struct scatterlist *in_sgs, bool nowait)
+			 bool nowait)
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
@@ -133,6 +272,7 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 	unsigned int nins = 0;
 	struct scatterlist *psgs[4];
 	bool notify = false;
+	unsigned long flags;
 	int rc;
 
 	virtsnd_ctl_msg_ref(msg);
@@ -142,27 +282,27 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 	response->code = cpu_to_le32(VIRTIO_SND_S_IO_ERR);
 
 	psgs[nouts++] = &msg->sg_request;
-	if (out_sgs)
-		psgs[nouts++] = out_sgs;
+	if (msg->request_data_size)
+		psgs[nouts++] = &msg->sg_request_data;
 
 	psgs[nouts + nins++] = &msg->sg_response;
-	if (in_sgs)
-		psgs[nouts + nins++] = in_sgs;
-
-	scoped_guard(spinlock_irqsave, &queue->lock) {
-		if (snd->ctl_msgs_blocked)
-			rc = -ENODEV;
-		else
-			rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins,
-					       msg, GFP_ATOMIC);
-		if (!rc) {
-			notify = virtqueue_kick_prepare(queue->vqueue);
+	if (msg->response_data_size)
+		psgs[nouts + nins++] = &msg->sg_response_data;
 
-			list_add_tail(&msg->list, &snd->ctl_msgs);
-			if (notify)
-				virtqueue_notify(queue->vqueue);
-		}
+	spin_lock_irqsave(&queue->lock, flags);
+	if (snd->ctl_msgs_blocked)
+		rc = -ENODEV;
+	else
+		rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
+				       GFP_ATOMIC);
+	if (!rc) {
+		notify = virtqueue_kick_prepare(queue->vqueue);
+
+		list_add_tail(&msg->list, &snd->ctl_msgs);
+		if (notify)
+			virtqueue_notify(queue->vqueue);
 	}
+	spin_unlock_irqrestore(&queue->lock, flags);
 
 	if (rc) {
 		dev_err(&vdev->dev, "failed to send control message (0x%08x)\n",
@@ -173,46 +313,36 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 		 * called, it is necessary to decrement the reference count.
 		 */
 		virtsnd_ctl_msg_unref(msg);
-
-		goto on_exit;
-	}
-
-	if (nowait)
-		goto on_exit;
-
-	rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
-	if (rc <= 0) {
+	} else if (!nowait) {
+		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
 				le32_to_cpu(request->code));
 			rc = -ETIMEDOUT;
+		} else if (rc > 0) {
+			if (READ_ONCE(msg->cancelled)) {
+				rc = -ENODEV;
+			} else {
+				switch (le32_to_cpu(response->code)) {
+				case VIRTIO_SND_S_OK:
+					rc = 0;
+					break;
+				case VIRTIO_SND_S_NOT_SUPP:
+					rc = -EOPNOTSUPP;
+					break;
+				case VIRTIO_SND_S_IO_ERR:
+					rc = -EIO;
+					break;
+				default:
+					rc = -EINVAL;
+					break;
+				}
+			}
 		}
-
-		goto on_exit;
-	}
-
-	if (READ_ONCE(msg->cancelled)) {
-		rc = -ENODEV;
-		goto on_exit;
-	}
-
-	switch (le32_to_cpu(response->code)) {
-	case VIRTIO_SND_S_OK:
-		rc = 0;
-		break;
-	case VIRTIO_SND_S_NOT_SUPP:
-		rc = -EOPNOTSUPP;
-		break;
-	case VIRTIO_SND_S_IO_ERR:
-		rc = -EIO;
-		break;
-	default:
-		rc = -EINVAL;
-		break;
 	}
 
-on_exit:
+	/* Drop the reference consumed by this send attempt. */
 	virtsnd_ctl_msg_unref(msg);
 
 	return rc;
@@ -308,10 +438,23 @@ int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
 {
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_query_info *query;
-	struct scatterlist sg;
+	size_t info_size;
+	int rc;
+
+	if (count < 0)
+		return -EINVAL;
+
+	if (size > UINT_MAX ||
+	    check_mul_overflow((size_t)count, size, &info_size) ||
+	    info_size > UINT_MAX)
+		return -EOVERFLOW;
+
+	if (info_size && !info)
+		return -EINVAL;
 
 	msg = virtsnd_ctl_msg_alloc(sizeof(*query),
-				    sizeof(struct virtio_snd_hdr), GFP_KERNEL);
+				    sizeof(struct virtio_snd_hdr), 0, info_size,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -321,9 +464,13 @@ int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
 	query->count = cpu_to_le32(count);
 	query->size = cpu_to_le32(size);
 
-	sg_init_one(&sg, info, count * size);
+	virtsnd_ctl_msg_ref(msg);
+	rc = virtsnd_ctl_msg_send(snd, msg, false);
+	if (!rc && info_size)
+		memcpy(info, virtsnd_ctl_msg_response_data(msg), info_size);
+	virtsnd_ctl_msg_unref(msg);
 
-	return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
+	return rc;
 }
 
 /**
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
index d917435409d0..f867b9b9233d 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -21,20 +21,28 @@ void *virtsnd_ctl_msg_request(struct virtio_snd_msg *msg);
 void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg);
 
 struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
-					     size_t response_size, gfp_t gfp);
+					     size_t response_size,
+					     size_t request_data_size,
+					     size_t response_data_size,
+					     gfp_t gfp);
+
+void *virtsnd_ctl_msg_request_data(struct virtio_snd_msg *msg);
+
+void *virtsnd_ctl_msg_response_data(struct virtio_snd_msg *msg);
 
 int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
-			 struct scatterlist *out_sgs,
-			 struct scatterlist *in_sgs, bool nowait);
+			 bool nowait);
 
 /**
  * virtsnd_ctl_msg_send_sync() - Simplified sending of synchronous message.
  * @snd: VirtIO sound device.
  * @msg: Control message.
  *
- * After returning from this function, the message will be deleted. If message
- * content is still needed, the caller must additionally to
- * virtsnd_ctl_msg_ref/unref() it.
+ * This function consumes the caller's message reference on return. A message
+ * accepted by the control queue keeps its queue reference until completion or
+ * post-reset cleanup, including when this function returns on timeout or
+ * interruption. Callers that read the response after success must retain an
+ * additional reference through that access.
  *
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
@@ -49,7 +57,7 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 static inline int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
 					    struct virtio_snd_msg *msg)
 {
-	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, false);
+	return virtsnd_ctl_msg_send(snd, msg, false);
 }
 
 /**
@@ -63,7 +71,7 @@ static inline int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
 static inline int virtsnd_ctl_msg_send_async(struct virtio_snd *snd,
 					     struct virtio_snd_msg *msg)
 {
-	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, true);
+	return virtsnd_ctl_msg_send(snd, msg, true);
 }
 
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd);
diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
index 45f7b6a5b308..4cf75dedbe9a 100644
--- a/sound/virtio/virtio_kctl.c
+++ b/sound/virtio/virtio_kctl.c
@@ -3,8 +3,10 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2022 OpenSynergy GmbH
  */
-#include <sound/control.h>
+#include <linux/limits.h>
+#include <linux/overflow.h>
 #include <linux/virtio_config.h>
+#include <sound/control.h>
 
 #include "virtio_card.h"
 
@@ -161,10 +163,12 @@ static int virtsnd_kctl_get(struct snd_kcontrol *kcontrol,
 	unsigned int i;
 	int rc;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
+	/* Response lifetime through ALSA value copyout. */
 	virtsnd_ctl_msg_ref(msg);
 
 	hdr = virtsnd_ctl_msg_request(msg);
@@ -233,7 +237,8 @@ static int virtsnd_kctl_put(struct snd_kcontrol *kcontrol,
 	size_t response_size = sizeof(struct virtio_snd_hdr);
 	unsigned int i;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -288,23 +293,28 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
 	struct virtio_snd *snd = snd_kcontrol_chip(kcontrol);
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_ctl_hdr *hdr;
-	unsigned int *tlv;
-	struct scatterlist sg;
+	size_t request_data_size = 0;
+	size_t response_data_size = 0;
 	int rc;
 
+	switch (op_flag) {
+	case SNDRV_CTL_TLV_OP_READ:
+		response_data_size = size;
+		break;
+	case SNDRV_CTL_TLV_OP_WRITE:
+	case SNDRV_CTL_TLV_OP_CMD:
+		request_data_size = size;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr), sizeof(struct virtio_snd_hdr),
+				    request_data_size, response_data_size,
 				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
-	tlv = kzalloc(size, GFP_KERNEL);
-	if (!tlv) {
-		rc = -ENOMEM;
-		goto on_msg_unref;
-	}
-
-	sg_init_one(&sg, tlv, size);
-
 	hdr = virtsnd_ctl_msg_request(msg);
 	hdr->control_id = cpu_to_le32(kcontrol->private_value);
 
@@ -312,13 +322,16 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
 	case SNDRV_CTL_TLV_OP_READ:
 		hdr->hdr.code = cpu_to_le32(VIRTIO_SND_R_CTL_TLV_READ);
 
-		rc = virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
-		if (!rc) {
-			if (copy_to_user(utlv, tlv, size))
-				rc = -EFAULT;
-		}
+		/* Response lifetime through user copyout. */
+		virtsnd_ctl_msg_ref(msg);
+		rc = virtsnd_ctl_msg_send(snd, msg, false);
+		if (!rc && size &&
+		    copy_to_user(utlv, virtsnd_ctl_msg_response_data(msg),
+				 size))
+			rc = -EFAULT;
+		virtsnd_ctl_msg_unref(msg);
 
-		break;
+		return rc;
 	case SNDRV_CTL_TLV_OP_WRITE:
 	case SNDRV_CTL_TLV_OP_CMD:
 		if (op_flag == SNDRV_CTL_TLV_OP_WRITE)
@@ -327,28 +340,16 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
 			hdr->hdr.code =
 				cpu_to_le32(VIRTIO_SND_R_CTL_TLV_COMMAND);
 
-		if (copy_from_user(tlv, utlv, size)) {
-			rc = -EFAULT;
-			goto on_msg_unref;
-		} else {
-			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
+		if (size && copy_from_user(virtsnd_ctl_msg_request_data(msg), utlv,
+					   size)) {
+			virtsnd_ctl_msg_unref(msg);
+			return -EFAULT;
 		}
 
-		break;
-	default:
-		rc = -EINVAL;
-		/* We never get here - we listed all values for op_flag */
-		WARN_ON(1);
-		goto on_msg_unref;
+		return virtsnd_ctl_msg_send(snd, msg, false);
 	}
-	kfree(tlv);
-	return rc;
-
-on_msg_unref:
-	virtsnd_ctl_msg_unref(msg);
-	kfree(tlv);
 
-	return rc;
+	return -EINVAL;
 }
 
 /**
@@ -369,27 +370,36 @@ static int virtsnd_kctl_get_enum_items(struct virtio_snd *snd, unsigned int cid)
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_ctl_hdr *hdr;
 	unsigned int n = le32_to_cpu(kinfo->value.enumerated.items);
-	struct scatterlist sg;
+	size_t items_size;
+	int rc;
 
-	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr),
-				    sizeof(struct virtio_snd_hdr), GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
+	if (check_mul_overflow((size_t)n, sizeof(*kctl->items), &items_size) ||
+	    items_size > UINT_MAX)
+		return -EOVERFLOW;
 
 	kctl->items = devm_kcalloc(&vdev->dev, n, sizeof(*kctl->items),
 				   GFP_KERNEL);
-	if (!kctl->items) {
-		virtsnd_ctl_msg_unref(msg);
+	if (!kctl->items)
 		return -ENOMEM;
-	}
 
-	sg_init_one(&sg, kctl->items, n * sizeof(*kctl->items));
+	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr),
+				    sizeof(struct virtio_snd_hdr), 0, items_size,
+				    GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
 
 	hdr = virtsnd_ctl_msg_request(msg);
 	hdr->hdr.code = cpu_to_le32(VIRTIO_SND_R_CTL_ENUM_ITEMS);
 	hdr->control_id = cpu_to_le32(cid);
 
-	return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
+	/* Item-buffer lifetime through the control-list copyout. */
+	virtsnd_ctl_msg_ref(msg);
+	rc = virtsnd_ctl_msg_send(snd, msg, false);
+	if (!rc && items_size)
+		memcpy(kctl->items, virtsnd_ctl_msg_response_data(msg), items_size);
+	virtsnd_ctl_msg_unref(msg);
+
+	return rc;
 }
 
 /**
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index b7f2334bb221..b54642a9521d 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -671,7 +671,7 @@ virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *vss,
 		break;
 	}
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, gfp);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0, gfp);
 	if (msg) {
 		struct virtio_snd_pcm_hdr *hdr = virtsnd_ctl_msg_request(msg);
 
-- 
2.54.0 (Apple Git-157)

