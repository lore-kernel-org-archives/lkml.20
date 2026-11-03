Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693325;
	b=f/rt4cu6Foy7IjBgxCg3sRcrfwV+ArCDaAJMybYiWBV3zZmJCIghDcBrtxyfbxJ2vOqB
	 iXY2vo5uI4LK8epQ0qD9xAPBdrvEhRIHOi+5CQcM/RDd0w07HOTXuRB2RVUTpEQfMOszV
	 4sHYpF2IOHfugqKUId6UbjjMvMo33g+JuQBqlpZHS4HryQsTYJBsqz/EIYhRVrIvhpvOi
	 9XHPqLQ8YME7G9zwvDZlRhT06SlO0ND/3tDsb+R2kchNXXTFqCh9fs8i3oftmwf6S2PBY
	 e0u5MVhvKh+59MNekMrto1ZEbidYuAYQRRmZ1xyjNEE1sPXw8nYdhQiTja0GL7mMkQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+mZx2h60mxWAern0xV0Lwa4Q7NKNI+YY8a+FQNzxn0o=;
	b=KnWZRdCAJbM8WRlVfHEYDxkT2AP/slZAt6kMv8y+B41tiME0fzGmPaC/97KtpctQQJ1U
	 7sNcD/KPhO7gAkwFp8N25NBOoY4Dqf3Rd0vxKvVu5NShA30OVvOyORIMDK8uH+14DLhgE
	 0KaZ32VtygbaqMuag3XtH0sURzTGIQsorQGFg8Zb9JhqP7b8FCRlaUFW50sA9p4LyGcIF
	 lwRgqDjgN9BW4Im99bo8OBENt2T9wGp4tY9IaogGVQknvbgoIen12O9ApCtvxoxDbk70v
	 gO17XdB1X1pBcta8vtx1YK9ds0HXQkln2t7Z2CeKFl7eESejxpU6cDUbDKMRBks+aqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFKxFwVb;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644FD606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644FD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFKxFwVb
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso6815961eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693324; x=1794298124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mZx2h60mxWAern0xV0Lwa4Q7NKNI+YY8a+FQNzxn0o=;
        b=jFKxFwVb6P4aFylJ1Npd0+8E1cbicz0nqYFrd5zBVhHPhw4X9LfYu2kZnJWPkIHlVY
         jEphu5UpzNzPglVj2RxxRONQerlYdAAzFmu1kSEMG87yjDQR2sKBNs7bVR5Bb0rqOXYC
         xry5VDAG4L6UF+bdbJI/GUBGZmz6XG4AZe/crKg/QEI5GcPvXYXJXuybCOl4qa5+ZagC
         eYDZGdP2bcpO9fhaljP6uF2pg2dyCsv6y0YHc+4Xu4nmvzghoSIheM1gcmmZLOw8eOHv
         WrM5E8n6U3T7h8XNYrXVGEtUJmRbIaZFD1bRZJO1huoVi6JyD6KcbSlAAGCxTWJ+r5zc
         eUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693324; x=1794298124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mZx2h60mxWAern0xV0Lwa4Q7NKNI+YY8a+FQNzxn0o=;
        b=rT9ckcB62d1pmvycicCJPycrUwbWr3J6+955QE4Jgxh33ciAMHsnac86lLBTypOYgK
         59wGpmCC19XoyEQ+PakeJ5SY78K258vitXx8hmHIUuZClzxBNxtqhhgD14brpxLWD3MU
         f+w6xkdoruOVIqaIe+ttn278fdzIUn4vWy3ZPDq5vjZalLmeGXDeWbyl8N31XGUlINBk
         K55N9UMn0qt8Y1OaqfYonSxhoeuClWrCarOzOGfyB16xj9+AJq01I5A2o1589koUeFTU
         HYZ8glwBxF4s8mqfrPn+wicaGrshXZB1dzdtHBRadko6VN3ynZvdl803znGKaDgx2Yvt
         mtRg==
X-Forwarded-Encrypted: i=1; AKwUvBw21Ki2hEJscDWyst2iRBIgCJnmJFmlDSK8d+OGu7G/BGytzLwqWoxSM9C/pSZlIhoZiJCs6TqVhPmhwCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XbBTbwC0NrZteAvG+qlxVbaAozzU5WP7Xyil8IOraJtpdtJqq
	M+PBZKgvDvPv1bk8cvFcowoYhHSldLIW7xvshXiPdiSmAkR+FKVZWZ68
X-Gm-Gg: AYBFou1OfWQ4IyzTN2ihWT/HEO6l7r4lc231Uq6mJJJ3KOCCr7CMi9D1UsISzTfJwte
	KRpWNnRUY0Rh6N2z+4O+snTfsembH+vV+j41+6NhkR5lKY1SW4MQ9+f5Zid6vBDMGEizk45GFYD
	dBoizqY2i9pOGeEztnacV0+10jSnG7ue5zb3LyriMw/eoBda6peH99qy1nksONpXd683KDh3ThF
	oX13mINOKPLil9suVnoNndrsUHPEb4lzPHoGJPyGcwpV4QOT2Ile5XzYMTE5WSG0MZFXcTXYhwe
	O/yDRKjs1ALMUFGcH/jxVZyS/U/QYUhQ1E8K+BcQYRhAzkfQGZrCpGXg5ROm5L3PuJHDD4f6xlu
	3KoKIne7u2NAT+D9T3o+r8kEOY9HoC9wLhys3YrYPf9f3BhXXA57gUZL/v+FeuKUA2ldBoiXkc7
	nB1KT82ujekuDT9L1w1Eh7RxVoUi4cjKx44LNBMd4fNTmBH0AEw/qHUE+WEbXMwRlLUL8Jj9vrf
	2PLZkVKdB8cXNsKfLcQ+vLoMPjrxXmXpkKYniACxXMct3eKr99IvoZYR8b7+XYLTHqaQ09nOTTq
	xtw/r7s0nt3XouNlTzcKqUpPUdeVUKC14IA5INWVTYh0zkWH/pppZcdQQrOGEG5lQLQa0fDoNU9
	dbzQbke4vPR+EktMPtAnfdqYUH8j0TEmOwX9vbGEFr2qO/tg=
X-Received: by 2002:a05:693c:4142:20b0:36a:6106:4f63 with SMTP id 5a478bee46e88-36a6106506dmr12153752eec.16.1793693324236;
        Tue, 03 Nov 2026 00:08:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:43 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v13 05/12] ALSA: virtio: Keep control payloads alive through DMA completion
Date: Tue,  3 Nov 2026 17:08:14 +0900
Message-ID: <20261103080821.16983-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Keep response values in a separately allocated aligned response buffer
so INTEGER64 control accesses are aligned from this patch onward.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_ctl_msg.c |  289 +++++++++++++++++++++++++++++++----------
 sound/virtio/virtio_ctl_msg.h |   24 ++-
 sound/virtio/virtio_kctl.c    |  121 +++++++++--------
 sound/virtio/virtio_pcm_msg.c |    2 
 4 files changed, 300 insertions(+), 136 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
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
@@ -47,8 +60,10 @@
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
@@ -71,12 +86,73 @@
 void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg)
 {
 	return sg_virt(&msg->sg_response);
+}
+
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
 }
 
 /**
  * virtsnd_ctl_msg_alloc() - Allocate and initialize a control message.
  * @request_size: Size of request header.
  * @response_size: Size of response header.
+ * @request_data_size: Size of request data buffer.
+ * @response_data_size: Size of response data buffer.
  * @gfp: Kernel flags for memory allocation.
  *
  * The message will be automatically freed when the ref_count value is 0.
@@ -85,20 +161,85 @@
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
-
-	if (!request_size || !response_size)
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
+
+	if (!request_size || !response_size || request_size > UINT_MAX ||
+	    response_size > UINT_MAX || request_data_size > UINT_MAX ||
+	    response_data_size > UINT_MAX)
 		return NULL;
-
-	msg = kzalloc(sizeof(*msg) + request_size + response_size, gfp);
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
+
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
@@ -112,17 +253,15 @@
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
@@ -133,6 +272,7 @@
 	unsigned int nins = 0;
 	struct scatterlist *psgs[4];
 	bool notify = false;
+	unsigned long flags;
 	int rc;
 
 	virtsnd_ctl_msg_ref(msg);
@@ -142,27 +282,27 @@
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
-
-			list_add_tail(&msg->list, &snd->ctl_msgs);
-			if (notify)
-				virtqueue_notify(queue->vqueue);
-		}
-	}
+	if (msg->response_data_size)
+		psgs[nouts + nins++] = &msg->sg_response_data;
+
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
+	}
+	spin_unlock_irqrestore(&queue->lock, flags);
 
 	if (rc) {
 		dev_err(&vdev->dev, "failed to send control message (0x%08x)\n",
@@ -173,46 +313,36 @@
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
-	}
-
-on_exit:
+	}
+
+	/* Drop the reference consumed by this send attempt. */
 	virtsnd_ctl_msg_unref(msg);
 
 	return rc;
@@ -308,10 +438,23 @@
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
 
@@ -321,9 +464,13 @@
 	query->count = cpu_to_le32(count);
 	query->size = cpu_to_le32(size);
 
-	sg_init_one(&sg, info, count * size);
-
-	return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
+	virtsnd_ctl_msg_ref(msg);
+	rc = virtsnd_ctl_msg_send(snd, msg, false);
+	if (!rc && info_size)
+		memcpy(info, virtsnd_ctl_msg_response_data(msg), info_size);
+	virtsnd_ctl_msg_unref(msg);
+
+	return rc;
 }
 
 /**
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -21,20 +21,28 @@
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
@@ -49,7 +57,7 @@
 static inline int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
 					    struct virtio_snd_msg *msg)
 {
-	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, false);
+	return virtsnd_ctl_msg_send(snd, msg, false);
 }
 
 /**
@@ -63,7 +71,7 @@
 static inline int virtsnd_ctl_msg_send_async(struct virtio_snd *snd,
 					     struct virtio_snd_msg *msg)
 {
-	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, true);
+	return virtsnd_ctl_msg_send(snd, msg, true);
 }
 
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd);
diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
--- a/sound/virtio/virtio_kctl.c
+++ b/sound/virtio/virtio_kctl.c
@@ -3,8 +3,10 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2022 OpenSynergy GmbH
  */
+#include <linux/limits.h>
+#include <linux/overflow.h>
+#include <linux/virtio_config.h>
 #include <sound/control.h>
-#include <linux/virtio_config.h>
 
 #include "virtio_card.h"
 
@@ -157,14 +159,16 @@
 	struct virtio_snd_ctl_hdr *hdr;
 	struct virtio_snd_ctl_value *kvalue;
 	size_t request_size = sizeof(*hdr);
-	size_t response_size = sizeof(struct virtio_snd_hdr) + sizeof(*kvalue);
+	size_t response_size = sizeof(struct virtio_snd_hdr);
 	unsigned int i;
 	int rc;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0,
+				    sizeof(*kvalue), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
+	/* Response lifetime through ALSA value copyout. */
 	virtsnd_ctl_msg_ref(msg);
 
 	hdr = virtsnd_ctl_msg_request(msg);
@@ -175,8 +179,7 @@
 	if (rc)
 		goto on_failure;
 
-	kvalue = (void *)((u8 *)virtsnd_ctl_msg_response(msg) +
-			  sizeof(struct virtio_snd_hdr));
+	kvalue = virtsnd_ctl_msg_response_data(msg);
 
 	switch (type) {
 	case VIRTIO_SND_CTL_TYPE_BOOLEAN:
@@ -233,7 +236,8 @@
 	size_t response_size = sizeof(struct virtio_snd_hdr);
 	unsigned int i;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -288,22 +292,27 @@
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
-
-	tlv = kzalloc(size, GFP_KERNEL);
-	if (!tlv) {
-		rc = -ENOMEM;
-		goto on_msg_unref;
-	}
-
-	sg_init_one(&sg, tlv, size);
 
 	hdr = virtsnd_ctl_msg_request(msg);
 	hdr->control_id = cpu_to_le32(kcontrol->private_value);
@@ -312,13 +321,16 @@
 	case SNDRV_CTL_TLV_OP_READ:
 		hdr->hdr.code = cpu_to_le32(VIRTIO_SND_R_CTL_TLV_READ);
 
-		rc = virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
-		if (!rc) {
-			if (copy_to_user(utlv, tlv, size))
-				rc = -EFAULT;
-		}
-
-		break;
+		/* Response lifetime through user copyout. */
+		virtsnd_ctl_msg_ref(msg);
+		rc = virtsnd_ctl_msg_send(snd, msg, false);
+		if (!rc && size &&
+		    copy_to_user(utlv, virtsnd_ctl_msg_response_data(msg),
+				 size))
+			rc = -EFAULT;
+		virtsnd_ctl_msg_unref(msg);
+
+		return rc;
 	case SNDRV_CTL_TLV_OP_WRITE:
 	case SNDRV_CTL_TLV_OP_CMD:
 		if (op_flag == SNDRV_CTL_TLV_OP_WRITE)
@@ -327,28 +339,16 @@
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
-	}
-	kfree(tlv);
-	return rc;
-
-on_msg_unref:
-	virtsnd_ctl_msg_unref(msg);
-	kfree(tlv);
-
-	return rc;
+		return virtsnd_ctl_msg_send(snd, msg, false);
+	}
+
+	return -EINVAL;
 }
 
 /**
@@ -369,27 +369,36 @@
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_ctl_hdr *hdr;
 	unsigned int n = le32_to_cpu(kinfo->value.enumerated.items);
-	struct scatterlist sg;
-
-	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr),
-				    sizeof(struct virtio_snd_hdr), GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
+	size_t items_size;
+	int rc;
+
+	if (check_mul_overflow((size_t)n, sizeof(*kctl->items), &items_size) ||
+	    items_size > UINT_MAX)
+		return -EOVERFLOW;
 
 	kctl->items = devm_kcalloc(&vdev->dev, n, sizeof(*kctl->items),
 				   GFP_KERNEL);
-	if (!kctl->items) {
-		virtsnd_ctl_msg_unref(msg);
-		return -ENOMEM;
-	}
-
-	sg_init_one(&sg, kctl->items, n * sizeof(*kctl->items));
+	if (!kctl->items)
+		return -ENOMEM;
+
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
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -684,7 +684,7 @@
 		break;
 	}
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, gfp);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0, gfp);
 	if (msg) {
 		struct virtio_snd_pcm_hdr *hdr = virtsnd_ctl_msg_request(msg);
 
