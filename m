Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444463;
	b=eN4ULeOgUTSwgqVfUp1vZuztbMZdGYraS/AUIgz8X3QWX136MdSZQpLt/pvGix2Njn3x
	 5XN7/wjuGtWQFant/OqcDom2lKRbKforbOo2MuiNk5rI6qsVYipWjNwkULjXOq1ddeP3A
	 /h20VD5S2mgxvPPsY65axsv9+9mi3sHhshc6zdW1bBZq/JLSKXVsvSTOT4bA8bEASmhTD
	 lC02Uce0pFlqQ0uH/dMEN9ydG0jm0sSMs42yRFWlQWmwAzXHQuEcW+YwQCs+qqC0YU3tU
	 XJ5j+Tys8AQplOo2QjdQL4u5Ec08vg2FPGhSFFZa6mSQTXwt9AGQN2XeSYHRhy2VgkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HjEqMRpJHMxBlJx8PrvbXzsvZE9iPcCWrDVwQeSTNAI=;
	b=tLDxdbcCQLAPZAzmU15EnTXqwFN7QyWKvCV55MAahjETPYMbJmrquS4IPFxzbXFWS1uA
	 ebMJSeTIvsx7DBwFnGmUIdAnLhtCZf+9n+2/Ne1CM/69NeiLpJQBDQStdsiwal1mqCS3Q
	 dapDNUqUhlT2SQntMrEmr50v/E6A9gj81HRfv8ihPgbBYh2lOR0FpHje2X3xcicpb6p2M
	 FJSHrjZTqr159u8ygCHk/zzGLOHBu9wAmPltE0mn10ieVALXyFTObVcIuO7uWX8kdgkK9
	 EEJYcTEdrsGKHFtwrQw65k/r4Ms1M8Bz1eX75FRUWUQG5aCvI8+SxPlPHRmmaNQEy3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CejN7V8q;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F3A606EE0F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F3A606EE0F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CejN7V8q
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7809725eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444462; x=1795049262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjEqMRpJHMxBlJx8PrvbXzsvZE9iPcCWrDVwQeSTNAI=;
        b=CejN7V8q0GIrRFhgBzwfRrCnL60jsOd3BxuMO2S7t4CGe59I8rqmpaXGWyN2gK6aaJ
         go0TSJTKpb1ut6hYt2zxIhNVDNxuQ45RE0jeTqlKkAZZRucliIoOlZC7C7+DuGTatN0/
         ljlNq4zWK5BnITKxZ6k8Jy3O64HmyQJn/SRnPlYsUvE/p9ATY065TfSurtDCLm/dDRG4
         8Kcg9xduKxG8vRYlMDa7//mKslXPIH2AEekvsiN24Qm4aVVqmJK0tUv9TdKt9FtKSsjP
         tjg/n7hFDV+/sqaq+I4X+ei9fGz/iR4C6J5uniQcW79wGZnuyTN7cpvhCsdXuk5KCJQD
         CNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444462; x=1795049262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjEqMRpJHMxBlJx8PrvbXzsvZE9iPcCWrDVwQeSTNAI=;
        b=kcwE04NH6e5J9ThhHObrBUWdibbc+LwUTmN1EYFkXWKxx6XHvPjUL6vFbDi/SL5hsg
         DKfzaYCPLyVuzoAH+61A7vqelY6O/AlR1TZDWzuDH4QF2GXRGX9uUTRTVsSRNw3knwMU
         Ix5DndyqbqlPHLT674OekFHCDci0FNlkPyKDABfzB8fzcO4MF3WBmn8yKr7w9CSn9rM9
         jGdrRKmOb7LkyFnRi1/xCfS+7qQX/h3zRzTmFYv/AlWSgX1c3NjvNgZM470kxYxSEW5W
         ywrDX8G+Vy5lvu5sKA12+CLXBzWpNmCQ4hVj5tUOfCWU7zZboiO1u+/ARoekX+fzeQk5
         6CfA==
X-Forwarded-Encrypted: i=1; AL+hErHDt61ZqN7qUGSGMaL4EQt+CxXhIrgbE3XKOU+RoUU9/oRbIVqCQ0H5Qttw/aiQBNf3bq5ah5ToVPfMmzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MSo9lzc4ziIol5QQ8mFLWikLlvhAs8b+ED5z63KTicSQGqe/i
	1JEYmHz42QHT/QnkriJEQVwBGgYo5KcXWYKmkpoefAvuD7gvDMocbLvM
X-Gm-Gg: AYBFou0a8KtpCrXvniKSrWzTzF/FSy7kqZ69JssArQxWt8QPDJ+bYW9/+0iN2daFMHd
	u2lFnlj6s+EAgSDDLton+0yHeLAwkvTT6TFBSl4w3gifqnlIUELQhdoAvV4xMwV54mMS19CYHxz
	1Ac4PUUg01Nawd6H4zwcBf9b+PdMeNKK8nqudan/cnfrWUJfAQi2OgzqWqhSjNAINnJuVNqE4zE
	ta8xFDzZrgTT66EI/HbPtBRDZ822EoBpzuxEuI6mrjbuFuVJR8RhKvsGSiUgoAMOBdNytgHyW78
	8wlVLeB1SmJPD76yfwBv/ckNAAFif+5XJAEboBhJ4lGEFpIAKJoZcG2Ya7Zdjm16/xuOBufP1B1
	PcVEADszWAL3AXAd9EwXSh2Fc5ildIyY/GsxwVKqV+lQgZy98dtJB5169UqbEd9WCnnmrSXz6X+
	mbaHsUHKE1Paf3cN7A0ZtGJUxgvL0Wo3ScD1DwP883qNpFjwGC0LebYkbJnABy2WU9MwZUPH950
	TwnLOmGcqhlbkYZQojRYy3UwU92uVH4l5bWG7eLCM/Gh3dHFXecy/1ojlnms8kFtAK74Y5q8A5C
	VD6nEMuOVL43skc6jwKt07DezszzHUhC9GblOCxmye7ELy4tHwsXsIl+aez/AAAuyz11wp0mIbM
	3YcWnpdYyDnkrVQpXbXz/EYv+TbvIsE3vKtkcX6JCRPmikQE=
X-Received: by 2002:a05:7022:7e88:b0:182:94d7:f76a with SMTP id a92af1059eb24-1b3c03745edmr4589240c88.43.1794444461776;
        Wed, 11 Nov 2026 16:47:41 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:41 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v27 09/17] ALSA: virtio: bound PCM transfers and retain DMA buffers
Date: Thu, 12 Nov 2026 09:46:56 +0900
Message-ID: <20261112004704.49758-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

Validate ACK geometry, conversion bounds and queued-byte accounting
before submitting transfers. Retain the backing DMA pages until message
retirement. Check RX status and upper payload bounds while accepting
bounded short responses, including at STOP and PAUSE. Preserve the
legacy RX completion and ACK policy until the request-owned conversion,
including the legacy handling of empty PAUSE returns. The fixed-offset
layout still has short-response data gaps; request-owned capture and its
queue/accounting contract arrive together in patch 12. Non-MMU copies
use only the validated returned payload length.

Fixes: f40a28679e0b ("ALSA: virtio: handling control and I/O messages for the PCM device")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |   11 +
 sound/virtio/virtio_pcm_msg.c |  306 +++++++++++++++++++++++++++++++++++------
 sound/virtio/virtio_pcm_ops.c |  113 +++++++++++++++
 3 files changed, 386 insertions(+), 44 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -13,6 +13,7 @@
 
 struct virtio_pcm;
 struct virtio_pcm_msg;
+struct page;
 
 /**
  * struct virtio_pcm_substream - VirtIO PCM substream.
@@ -42,6 +43,10 @@
  * @msgs: Allocated I/O messages.
  * @nmsgs: Number of allocated I/O messages.
  * @msg_count: Number of pending I/O messages in the virtqueue.
+ * @dma_pages: Pages backing DMA messages, retained until messages are freed.
+ * @ndma_pages: Number of retained pages.
+ * @owned_dma_area: Driver-owned PCM buffer backing asynchronous messages.
+ * @owned_dma_bytes: Size of @owned_dma_area.
  * @msg_empty: Notify when msg_count is zero.
  */
 struct virtio_pcm_substream {
@@ -68,6 +73,12 @@
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
 	unsigned int msg_count;
+	struct page **dma_pages;
+	unsigned int ndma_pages;
+#ifndef CONFIG_MMU
+	u8 *owned_dma_area;
+	size_t owned_dma_bytes;
+#endif
 	wait_queue_head_t msg_empty;
 };
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -3,6 +3,9 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2021 OpenSynergy GmbH
  */
+#include <linux/limits.h>
+#include <linux/mm.h>
+#include <linux/overflow.h>
 #include <sound/pcm_params.h>
 
 #include "virtio_card.h"
@@ -13,6 +16,7 @@
  * @xfer: Request header payload.
  * @status: Response header payload.
  * @length: Data length in bytes.
+ * @data_offset: Offset of the fixed PCM ring slice for ordinary I/O.
  * @sgs: Payload scatter-gather table.
  */
 struct virtio_pcm_msg {
@@ -20,6 +24,7 @@
 	struct virtio_snd_pcm_xfer xfer;
 	struct virtio_snd_pcm_status status;
 	size_t length;
+	size_t data_offset;
 	struct scatterlist sgs[];
 };
 
@@ -37,9 +42,8 @@
 };
 
 /**
- * virtsnd_pcm_sg_num() - Count the number of sg-elements required to represent
- *                        vmalloc'ed buffer.
- * @data: Pointer to vmalloc'ed buffer.
+ * virtsnd_pcm_sg_num() - Count the sg-elements for a page-backed buffer.
+ * @data: Pointer to the page-backed buffer.
  * @length: Buffer size.
  *
  * Context: Any context.
@@ -47,14 +51,18 @@
  */
 static int virtsnd_pcm_sg_num(u8 *data, unsigned int length)
 {
-	phys_addr_t sg_address;
-	unsigned int sg_length;
+	phys_addr_t sg_address = 0;
+	unsigned int sg_length = 0;
 	int num = 0;
 
 	while (length) {
 		struct page *pg = vmalloc_to_page(data);
-		phys_addr_t pg_address = page_to_phys(pg);
+		phys_addr_t pg_address;
 		size_t pg_length;
+
+		if (!pg)
+			return -EINVAL;
+		pg_address = page_to_phys(pg);
 
 		pg_length = PAGE_SIZE - offset_in_page(data);
 		if (pg_length > length)
@@ -75,11 +83,80 @@
 	return num;
 }
 
-/**
- * virtsnd_pcm_sg_from() - Build sg-list from vmalloc'ed buffer.
+#ifdef CONFIG_MMU
+/**
+ * virtsnd_pcm_dma_pages_put() - Release retained PCM buffer pages.
+ * @vss: VirtIO PCM substream.
+ *
+ * Context: Process context.
+ */
+static void virtsnd_pcm_dma_pages_put(struct virtio_pcm_substream *vss)
+{
+	while (vss->ndma_pages)
+		put_page(vss->dma_pages[--vss->ndma_pages]);
+	kfree(vss->dma_pages);
+	vss->dma_pages = NULL;
+}
+
+/**
+ * virtsnd_pcm_dma_pages_get() - Retain the pages backing the PCM buffer.
+ * @vss: VirtIO PCM substream.
+ * @data: PCM buffer address.
+ * @length: PCM buffer size.
+ *
+ * Keep the backing pages alive while virtqueue descriptors can still refer to
+ * them, even if ALSA releases the vmalloc mapping after a failed drain.
+ *
+ * Context: Process context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_dma_pages_get(struct virtio_pcm_substream *vss,
+				     u8 *data, size_t length)
+{
+	size_t i;
+	size_t npages;
+	size_t span;
+
+	if (!data || !length || !is_vmalloc_addr(data))
+		return -EINVAL;
+	if (vss->dma_pages || vss->ndma_pages)
+		return -EBUSY;
+
+	if (check_add_overflow(length, (size_t)offset_in_page(data), &span))
+		return -EOVERFLOW;
+
+	npages = span / PAGE_SIZE + !!(span % PAGE_SIZE);
+	if (npages > UINT_MAX)
+		return -EOVERFLOW;
+
+	vss->dma_pages = kcalloc(npages, sizeof(*vss->dma_pages), GFP_KERNEL);
+	if (!vss->dma_pages)
+		return -ENOMEM;
+
+	for (i = 0; i < npages; i++) {
+		struct page *page = vmalloc_to_page(data + i * PAGE_SIZE);
+
+		if (!page)
+			goto err_put_pages;
+
+		get_page(page);
+		vss->dma_pages[vss->ndma_pages++] = page;
+	}
+
+	return 0;
+
+err_put_pages:
+	virtsnd_pcm_dma_pages_put(vss);
+
+	return -EINVAL;
+}
+#endif
+
+/**
+ * virtsnd_pcm_sg_from() - Build an sg-list from a page-backed buffer.
  * @sgs: Preallocated sg-list to populate.
  * @nsgs: The maximum number of elements in the @sgs.
- * @data: Pointer to vmalloc'ed buffer.
+ * @data: Pointer to the page-backed buffer.
  * @length: Buffer size.
  *
  * Splits the buffer into physically contiguous parts and makes an sg-list of
@@ -132,36 +209,97 @@
 int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 			  unsigned int periods, unsigned int period_bytes)
 {
-	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+	struct snd_pcm_runtime *runtime;
+	size_t buffer_bytes;
 	unsigned int i;
+	int rc;
+
+	if (vss->msgs || vss->nmsgs || vss->dma_pages || vss->ndma_pages)
+		return -EBUSY;
+#ifndef CONFIG_MMU
+	if (vss->owned_dma_area || vss->owned_dma_bytes)
+		return -EBUSY;
+#endif
+	if (!periods || !period_bytes)
+		return -EINVAL;
+
+	if (check_mul_overflow((size_t)periods, (size_t)period_bytes,
+			       &buffer_bytes))
+		return -EOVERFLOW;
+
+	if (!vss->substream || !vss->substream->runtime)
+		return -EINVAL;
+	runtime = vss->substream->runtime;
+	if (!runtime->dma_area || buffer_bytes > runtime->dma_bytes)
+		return -EINVAL;
+
+#ifdef CONFIG_MMU
+	rc = virtsnd_pcm_dma_pages_get(vss, runtime->dma_area, buffer_bytes);
+	if (rc)
+		return rc;
+#else
+	vss->owned_dma_area = kzalloc(buffer_bytes, GFP_KERNEL);
+	if (!vss->owned_dma_area)
+		return -ENOMEM;
+	vss->owned_dma_bytes = buffer_bytes;
+#endif
 
 	vss->msgs = kzalloc_objs(*vss->msgs, periods);
-	if (!vss->msgs)
-		return -ENOMEM;
+	if (!vss->msgs) {
+		rc = -ENOMEM;
+		goto err_free_pages;
+	}
 
 	vss->nmsgs = periods;
 
 	for (i = 0; i < periods; ++i) {
-		u8 *data = runtime->dma_area + period_bytes * i;
-		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
+		int sg_num;
 		struct virtio_pcm_msg *msg;
+		u8 *data;
+#ifdef CONFIG_MMU
+		data = runtime->dma_area + (size_t)period_bytes * i;
+#else
+		data = vss->owned_dma_area + (size_t)period_bytes * i;
+#endif
+		sg_num = virtsnd_pcm_sg_num(data, period_bytes);
+		if (sg_num < 0) {
+			rc = sg_num;
+			goto err_free_msgs;
+		}
 
 		msg = kzalloc_flex(*msg, sgs, sg_num + 2);
-		if (!msg)
-			return -ENOMEM;
+		if (!msg) {
+			rc = -ENOMEM;
+			goto err_free_msgs;
+		}
 
 		msg->substream = vss;
+		vss->msgs[i] = msg;
 		sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
 			    sizeof(msg->xfer));
 		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
 			    sizeof(msg->status));
+		msg->data_offset = (size_t)period_bytes * i;
 		virtsnd_pcm_sg_from(&msg->sgs[PCM_MSG_SG_DATA], sg_num, data,
 				    period_bytes);
-
-		vss->msgs[i] = msg;
 	}
 
 	return 0;
+
+err_free_msgs:
+	virtsnd_pcm_msg_free(vss);
+	return rc;
+
+err_free_pages:
+#ifdef CONFIG_MMU
+	virtsnd_pcm_dma_pages_put(vss);
+#else
+	kfree(vss->owned_dma_area);
+	vss->owned_dma_area = NULL;
+	vss->owned_dma_bytes = 0;
+#endif
+
+	return rc;
 }
 
 /**
@@ -177,6 +315,13 @@
 	for (i = 0; vss->msgs && i < vss->nmsgs; ++i)
 		kfree(vss->msgs[i]);
 	kfree(vss->msgs);
+#ifdef CONFIG_MMU
+	virtsnd_pcm_dma_pages_put(vss);
+#else
+	kfree(vss->owned_dma_area);
+	vss->owned_dma_area = NULL;
+	vss->owned_dma_bytes = 0;
+#endif
 
 	vss->msgs = NULL;
 	vss->nmsgs = 0;
@@ -228,8 +373,15 @@
 	bool notify = false;
 	int rc;
 
+	if (!bytes)
+		return 0;
+	if (!period_bytes || !vss->msgs || offset >= vss->buffer_bytes ||
+	    bytes > vss->buffer_bytes - offset)
+		return -EINVAL;
 	start = offset / period_bytes;
 	end = (offset + bytes - 1) / period_bytes;
+	if (end >= vss->nmsgs)
+		return -EINVAL;
 
 	for (i = start; i <= end; i++) {
 		struct virtio_pcm_msg *msg = vss->msgs[i];
@@ -248,6 +400,33 @@
 		if (msg->length == period_bytes) {
 			msg->xfer.stream_id = cpu_to_le32(vss->sid);
 			memset(&msg->status, 0, sizeof(msg->status));
+
+#ifndef CONFIG_MMU
+		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			struct snd_pcm_runtime *runtime =
+				vss->substream ? vss->substream->runtime : NULL;
+			size_t data_bytes = msg->length;
+
+			if (!runtime || !runtime->dma_area || !vss->owned_dma_area ||
+			    msg->data_offset > runtime->dma_bytes ||
+			    data_bytes > runtime->dma_bytes - msg->data_offset ||
+			    msg->data_offset > vss->owned_dma_bytes ||
+			    data_bytes > vss->owned_dma_bytes - msg->data_offset) {
+				dev_err_ratelimited(&vdev->dev,
+						    "SID %u: invalid playback buffer for I/O message\n",
+					vss->sid);
+				msg->length -= n;
+				if (msg_count != vss->msg_count &&
+				    !(vss->features &
+				      (1U << VIRTIO_SND_PCM_F_MSG_POLLING)) &&
+				    virtqueue_kick_prepare(vqueue))
+					virtqueue_notify(vqueue);
+				return -EINVAL;
+			}
+			memcpy(vss->owned_dma_area + msg->data_offset,
+			       runtime->dma_area + msg->data_offset, data_bytes);
+		}
+#endif
 
 			if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
 				rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
@@ -356,42 +535,83 @@
 				     size_t written_bytes)
 {
 	struct virtio_pcm_substream *vss = msg->substream;
+	bool capture_invalid = false;
 
 	/*
-	 * hw_ptr always indicates the buffer position of the first I/O message
-	 * in the virtqueue. Therefore, on each completion of an I/O message,
-	 * the hw_ptr value is unconditionally advanced.
+	 * Completed requests can return captured data after STOP while the PCM
+	 * buffer remains prepared. Once preparation ends, completions only retire
+	 * queue ownership.
 	 */
 	guard(spinlock)(&vss->lock);
-	/*
-	 * If the capture substream returned an incorrect status, then just
-	 * increase the hw_ptr by the message size.
-	 */
-	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK ||
-	    written_bytes <= sizeof(msg->status))
-		vss->hw_ptr += msg->length;
-	else
-		vss->hw_ptr += written_bytes - sizeof(msg->status);
-
-	if (vss->hw_ptr >= vss->buffer_bytes)
-		vss->hw_ptr -= vss->buffer_bytes;
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    (!vss->prepared || vss->xfer_xrun ||
+	     (vss->stopped && written_bytes <= sizeof(msg->status)))) {
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		return;
+	}
+
+	/* Validate the returned payload before advancing the capture pointer. */
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    (written_bytes < sizeof(msg->status) ||
+	     le32_to_cpu(msg->status.status) != VIRTIO_SND_S_OK ||
+	     written_bytes - sizeof(msg->status) > msg->length)) {
+		dev_err_ratelimited(&vss->snd->vdev->dev,
+				    "SID %u: invalid capture position, status or length\n",
+			vss->sid);
+		vss->xfer_xrun = true;
+		capture_invalid = true;
+	}
+#ifndef CONFIG_MMU
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->prepared && !capture_invalid &&
+	    written_bytes > sizeof(msg->status)) {
+		struct snd_pcm_runtime *runtime =
+			vss->substream ? vss->substream->runtime : NULL;
+
+		if (!runtime || !runtime->dma_area || !vss->owned_dma_area ||
+		    msg->data_offset > runtime->dma_bytes ||
+		    written_bytes - sizeof(msg->status) > runtime->dma_bytes - msg->data_offset ||
+		    msg->data_offset > vss->owned_dma_bytes ||
+		    written_bytes - sizeof(msg->status) > vss->owned_dma_bytes - msg->data_offset) {
+			dev_err_ratelimited(&vss->snd->vdev->dev,
+					    "SID %u: invalid capture buffer for I/O message\n",
+				vss->sid);
+			vss->xfer_xrun = true;
+			capture_invalid = true;
+		} else {
+			memcpy(runtime->dma_area + msg->data_offset,
+			       vss->owned_dma_area + msg->data_offset,
+			       written_bytes - sizeof(msg->status));
+		}
+	}
+#endif
+	/* Publish pointer progress only for a complete TX or valid RX request. */
+	if (!capture_invalid) {
+		vss->hw_ptr += vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+			written_bytes > sizeof(msg->status) ?
+			written_bytes - sizeof(msg->status) : msg->length;
+		if (vss->hw_ptr >= vss->buffer_bytes)
+			vss->hw_ptr -= vss->buffer_bytes;
+	}
 
 	msg->length = 0;
-
-	vss->xfer_xrun = false;
 	vss->msg_count--;
 
 	if (vss->xfer_enabled) {
-		struct snd_pcm_runtime *runtime = vss->substream->runtime;
-
-		runtime->delay =
-			bytes_to_frames(runtime,
-					le32_to_cpu(msg->status.latency_bytes));
-
+		if (!capture_invalid) {
+			struct snd_pcm_runtime *runtime = vss->substream->runtime;
+
+			runtime->delay =
+				bytes_to_frames(runtime,
+						le32_to_cpu(msg->status.latency_bytes));
+		}
 		schedule_work(&vss->elapsed_period);
-	} else if (!vss->msg_count) {
+	}
+	if (!vss->msg_count)
 		wake_up_all(&vss->msg_empty);
-	}
 }
 
 /**
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -25,6 +25,8 @@
  *   signal or due to a timeout. In this case, the device can still access
  *   messages even after calling ops->hw_free(). It can also issue an interrupt,
  *   and the interrupt handler will also try to access message structures.
+ *   The messages retain references to the PCM buffer pages until they are
+ *   freed, so late DMA does not target pages released by ALSA.
  *
  *   Therefore, freeing of already allocated messages occurs:
  *
@@ -262,10 +264,21 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	unsigned int msg_count;
+	size_t period_buffer_bytes;
 	bool stopped;
 	int rc;
 
 	virtsnd_pcm_close_ack(substream, false);
+
+	/* Fixed descriptors require whole-byte periods covering the buffer. */
+	if (check_mul_overflow((size_t)params_periods(hw_params),
+			       (size_t)params_period_bytes(hw_params),
+			       &period_buffer_bytes) ||
+	    period_buffer_bytes != params_buffer_bytes(hw_params) ||
+	    (params_period_size(hw_params) *
+	     (u64)snd_pcm_format_physical_width(params_format(hw_params)) *
+	     params_channels(hw_params)) % 8)
+		return -EINVAL;
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		msg_count = vss->msg_count;
@@ -608,6 +621,96 @@
 	int error;
 };
 
+/* Caller holds @vss->lock and the PCM stream lock. */
+static int virtsnd_pcm_playback_ack_validate(struct virtio_pcm_substream *vss,
+					     struct snd_pcm_runtime *runtime,
+					     const struct snd_pcm_indirect *rec)
+{
+	snd_pcm_uframes_t appl_ptr;
+	snd_pcm_uframes_t appl_diff;
+	snd_pcm_uframes_t signed_max;
+	snd_pcm_uframes_t back;
+	u64 buffer_bits;
+	u64 appl_bits;
+	size_t appl_bytes;
+	s64 queued_bytes;
+	s64 sw_ready_total;
+	s64 total_bytes;
+	s64 int_max;
+	unsigned int hw_queue_size;
+
+	if (!runtime->control || !runtime->boundary ||
+	    runtime->control->appl_ptr >= runtime->boundary ||
+	    rec->appl_ptr >= runtime->boundary)
+		return -EPIPE;
+
+	/* Keep the signed frame conversion used by frames_to_bytes() in range. */
+	signed_max = (~(snd_pcm_uframes_t)0) >> 1;
+	if (runtime->boundary > signed_max ||
+	    runtime->buffer_size > signed_max || !runtime->frame_bits ||
+	    check_mul_overflow((u64)runtime->buffer_size,
+			       (u64)runtime->frame_bits, &buffer_bits) ||
+	    buffer_bits > signed_max || buffer_bits % 8 ||
+	    buffer_bits / 8 != vss->buffer_bytes)
+		return -EPIPE;
+
+	/* Match the indirect helper's appl_ptr boundary-wrap calculation. */
+	appl_ptr = runtime->control->appl_ptr;
+	if (appl_ptr >= rec->appl_ptr) {
+		appl_diff = appl_ptr - rec->appl_ptr;
+	} else {
+		back = rec->appl_ptr - appl_ptr;
+		if (back <= runtime->boundary / 2)
+			return -EPIPE;
+		appl_diff = runtime->boundary - back;
+	}
+
+	if (appl_diff > runtime->buffer_size)
+		return -EPIPE;
+	/* The indirect helper advances appl_ptr even if frames_to_bytes truncates. */
+	if (!runtime->min_align || appl_diff % runtime->min_align)
+		return -EBADFD;
+	if (check_mul_overflow((u64)appl_diff,
+			       (u64)runtime->frame_bits, &appl_bits) ||
+	    appl_bits % 8)
+		return -EPIPE;
+
+	if (!rec->hw_buffer_size || !rec->sw_buffer_size ||
+	    rec->hw_buffer_size != vss->buffer_bytes ||
+	    rec->sw_buffer_size != vss->buffer_bytes || rec->hw_ready < 0 ||
+	    rec->sw_ready < 0 || rec->hw_data >= rec->hw_buffer_size ||
+	    rec->hw_io >= rec->hw_buffer_size ||
+	    rec->sw_data >= rec->sw_buffer_size ||
+	    rec->sw_io >= rec->sw_buffer_size ||
+	    (unsigned int)rec->sw_ready > rec->sw_buffer_size)
+		return -EPIPE;
+
+	hw_queue_size = rec->hw_queue_size ? rec->hw_queue_size :
+			rec->hw_buffer_size;
+	if (!hw_queue_size || hw_queue_size > rec->hw_buffer_size ||
+	    (unsigned int)rec->hw_ready > hw_queue_size)
+		return -EPIPE;
+
+	int_max = (int)(~0U >> 1);
+	if (hw_queue_size > int_max || appl_bits / 8 > int_max)
+		return -EPIPE;
+	appl_bytes = frames_to_bytes(runtime, (snd_pcm_sframes_t)appl_diff);
+	if (appl_bytes != (size_t)(appl_bits / 8) ||
+	    check_add_overflow((s64)rec->sw_ready, (s64)appl_bytes,
+			       &sw_ready_total) ||
+	    sw_ready_total > int_max)
+		return -EPIPE;
+
+	/* hw_ready already excludes device completions accounted by the pointer. */
+	if (check_add_overflow((s64)rec->hw_ready, (s64)rec->sw_ready,
+			       &queued_bytes) ||
+	    check_add_overflow(queued_bytes, (s64)appl_bytes, &total_bytes) ||
+	    total_bytes > (s64)vss->buffer_bytes)
+		return -EPIPE;
+
+	return 0;
+}
+
 static void virtsnd_pcm_trans_copy(struct snd_pcm_substream *substream,
 				   struct snd_pcm_indirect *rec, size_t bytes)
 {
@@ -670,7 +773,15 @@
 			rc = -EPIPE;
 		} else {
 			transfer.indirect = vss->pcm_indirect;
-			rc = snd_pcm_indirect_playback_transfer(substream,
+			rc = virtsnd_pcm_playback_ack_validate(vss,
+							       substream->runtime,
+							       &transfer.indirect);
+			if (rc == -EBADFD ||
+			    (rc && substream->runtime->state ==
+			     SNDRV_PCM_STATE_PAUSED))
+				return -EBADFD;
+			if (!rc)
+				rc = snd_pcm_indirect_playback_transfer(substream,
 							       &transfer.indirect,
 							       virtsnd_pcm_trans_copy);
 			if (!rc)
