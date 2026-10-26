Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027407;
	b=WcIUU9LCtfcgEw3Fgn+GISyLYU9/3rGjmwZH+aIOQEnjoRivKmJi9KvYTZ5QRyahm/rZ
	 ScPdQZoPTHfcNfCweRV+5UQsNgFJqaIcPHUn1pL/BrQ7SprNnlhTfiBgqarfoPsTV1tfq
	 5YF7PnaSW9q/BiRBqF6mdX8PPhBI8Y7MAkMuaWKmK3+6ZTzyx6ul23J7qC59paGnaWyTE
	 V07CpLQKgeYV+2r9bSXOTPom8E79vahrogAeO2BOH7XZLGkAf1oHtssUOGjLF/mPMlsmU
	 1RsBjoN57HeAQslBAHqoSE9yK0jXO7UspUXkbFQg2z+v1UZUJCOmIOqxF2NIguWHV2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027407;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer:X-Mutt-Fcc;
	bh=HzMeo7/jJ0swTyFLCpz+u7iHeHxr5VYkay9cet6ED5o=;
	b=vsd67z0w+jNobIyLHe8TVu1HNSqPihDxjOPUCSGgcq6mIHX+R5yDATgdpSsSBhmZmNdR
	 49oAbndVpuykA4wh+ZLzfw6S1etdDe2PyX1XYf6iOe749vS3dJqDqj35IwvttpB1zGdZS
	 V2INPkNgNhztJYF9I9nh+vb6V9S3jz4GBIFD2NUWGZUEAsUIhhgcglRkHmOj9KvZJutcN
	 vURa8WzZLRaAmGMn7/VWaohy5z8bykAX4/Bkwafh4+dA71qDb+TDb9P+UD580UL3Q0JuN
	 AR/cHpmgdRu5+0shZ3XIpairDeUCnT/wucCxZJ2N8BxHfeJDsKyQ43fz4gxEbGC8LuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S6trrtKP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AteXmqCV;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C4606A338
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0C4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S6trrtKP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AteXmqCV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793027405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=HzMeo7/jJ0swTyFLCpz+u7iHeHxr5VYkay9cet6ED5o=;
	b=S6trrtKP+iKWgV0n6a+sAm4QBAJQBkHcw4E9T293cQJtvCAzhzTA/sVP54V37/6+rNMQrM
	y8Xs+Y0/bYZ2uVyXckg1VkYbUaptAk+4mVArseZ0wdui6+92brAiMf5e2mKjuLxF3NVA3B
	Bx6RCa+uLLNIN4ZgLdJ9DofonRyk2r0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-EHY9jA4vMJ2f29dvAxKyvg-1; Mon, 26 Oct 2026 11:09:58 -0400
X-MC-Unique: EHY9jA4vMJ2f29dvAxKyvg-1
X-Mimecast-MFC-AGG-ID: EHY9jA4vMJ2f29dvAxKyvg_1793027397
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so2922021f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793027397; x=1793632197; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzMeo7/jJ0swTyFLCpz+u7iHeHxr5VYkay9cet6ED5o=;
        b=AteXmqCVt6ftOsZ5XGLo2JhDHvACbnbhzJhob0qgz06BG3aDvuQVdpqEO8OGdC5+jN
         bB5KwOIPzdMzwQNu8PwvxlBB/Ir6zrvhUI3X/EFST9Y9UiXLkwL+mCFrI1D55f/ZzFJ7
         K3/jgkkPG5+XKfJUPpKc86szZd2hojLMirC9woCd/d1AqMCnHT1MW9NeMHyRrkOzI62J
         CPw5o29x8SuYadiacgrqj5K6hLhJFDTBfo4hI3Zg9yycfooKTQmCAIk1iFLSlkvdI5TS
         BCShGGX1aDKgywvbvHlNpJElfJT2i+D0xxKDoUQzaM5GUJQBazQ+2lM5pbDI27nmZ5qq
         Jp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027397; x=1793632197;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzMeo7/jJ0swTyFLCpz+u7iHeHxr5VYkay9cet6ED5o=;
        b=Jg6j/oet8x6PcCT0oFoQwzY75AZxDidNhpadfnnD9xY0V5LlKij/b35VLLtpGRfEYV
         hEzJNM5sBEa3XV1KnaOEhY4dHWXLRvBgEjIak9S667UWattr6U0avEdAXxxOni2v2ZoP
         PkuG6c5m/bETgrSGPqJVCU5mb0FdBu7Wg+6V3qgpdaUxc8B6Ubm68kplIM4vy7UJ86it
         /1RrHUVvSBqK+dYEIUYBDzWTn4eGnTWNjKsBQGx4TGfVEYeui8GrU3XxQWFTuRuR/i9Q
         2hE0JDAU0uliP0YzUTOhq+fa0PEsWGx/0Eh/993k6NpG83CHAFrAD2Kq798b95mThboo
         DxRw==
X-Gm-Message-State: AFq9FYKy2TJI2EW0Du9JTjUwEmuzeT+vv/2svDrq9OFiX4JiRFYtzep1
	2uTcM6UCTKcAibUW7zcu1xmFUd2djhZ/seGdCQgTC5GpfgtCqRA0qpfDu3qvJ7YheDtLtAImvXL
	C6ULuWliN1cUgCloLYdypz2L2JAOeMkkeD0wwMg3l3DpVuhz5/SlabcU+KH0HnkkB1j1e6Tlebm
	q8VfujYXnic9GUItMdk88nwzbZaK3wHuMbRhNiOs/D6z4=
X-Gm-Gg: AYBFou2DtdP5Z1mepLTrNwF6CM7GAYoGFqYVIx2Oi6XH4p5qbtdGcWG/FcaiHMD/UGQ
	q5ETymBukuZ26yFQnAGGHOS39EJFdgOBkQv9XlN+VoszQYnuS/zq1J9+NAQDybEyVXRHk08kFGv
	R3sLaD2ybdbPEq9OnT++zaUQ9YvxuuVf7QGBSIhMmzZ9g+5FXTPvqtdp3HelcHD7BPdpUFs90s7
	Wg172rl2SiwJ9jAOqZOWnBEm1EGGLOxYFWHMm3j/xvoY66zpCagNibVgtpM1c0W/1qX54HDlwl9
	zRjIsgCXW1N6e+IBHR8eHj0aRw6wvk6wo6Mh6pvCBoKv6++UBAExQVqWVF4KY0xYm6I=
X-Received: by 2002:a5d:4910:0:b0:48d:eb6b:9d12 with SMTP id ffacd0b85a97d-48e3eb786c9mr8555297f8f.16.1793027396567;
        Mon, 26 Oct 2026 08:09:56 -0700 (PDT)
X-Received: by 2002:a5d:4910:0:b0:48d:eb6b:9d12 with SMTP id ffacd0b85a97d-48e3eb786c9mr8555218f8f.16.1793027395723;
        Mon, 26 Oct 2026 08:09:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bdbsm13923921f8f.19.2026.10.26.08.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:09:54 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:09:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev
Subject: [PATCH 1/2] virtio_ring: add virtqueue_enable_cb_delayed_max
Message-ID: <ad6a530f49c4a0e182112a73789e31b5e91f3bb7.1793026707.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

virtqueue_enable_cb_delayed places the used event at 3/4 of the
currently queued buffers, so with VIRTIO_RING_F_EVENT_IDX the device
interrupts early and often - this is a good fit for drivers that poll
and process buffers as they trickle in, like virtio net.

Some drivers queue a batch of buffers and then sleep waiting for the
whole batch to complete.  For these, an interrupt before the last
buffer is used is pure waste.

To fix, add virtqueue_enable_cb_delayed_max: same API, but the used
event is placed at the last currently queued buffer, so the device
only notifies us once it has used everything.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_ring.c | 125 +++++++++++++++++++++++++++++++++++
 include/linux/virtio.h       |   2 +
 2 files changed, 127 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index fbca7ce1c6bf..0428c0ae9a8a 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -180,6 +180,7 @@ struct virtqueue_ops {
 	bool (*kick_prepare)(struct vring_virtqueue *vq);
 	void (*disable_cb)(struct vring_virtqueue *vq);
 	bool (*enable_cb_delayed)(struct vring_virtqueue *vq);
+	bool (*enable_cb_delayed_max)(struct vring_virtqueue *vq);
 	unsigned int (*enable_cb_prepare)(struct vring_virtqueue *vq);
 	bool (*poll)(const struct vring_virtqueue *vq,
 		     unsigned int last_used_idx);
@@ -1122,6 +1123,42 @@ static bool virtqueue_enable_cb_delayed_split(struct vring_virtqueue *vq)
 	return true;
 }
 
+static bool virtqueue_enable_cb_delayed_max_split(struct vring_virtqueue *vq)
+{
+	u16 bufs;
+
+	START_USE(vq);
+
+	/* We optimistically turn back on interrupts, then check if there was
+	 * more to do. */
+	/* Depending on the VIRTIO_RING_F_USED_EVENT_IDX feature, we need to
+	 * either clear the flags bit or point the event index at the next
+	 * entry. Always update the event index to keep code simple. */
+	if (vq->split.avail_flags_shadow & VRING_AVAIL_F_NO_INTERRUPT) {
+		vq->split.avail_flags_shadow &= ~VRING_AVAIL_F_NO_INTERRUPT;
+		if (!vq->event)
+			vq->split.vring.avail->flags =
+				cpu_to_virtio16(vq->vq.vdev,
+						vq->split.avail_flags_shadow);
+	}
+	/* Point the used event at the last queued buffer: the device
+	 * will only notify us once it has used everything. */
+	bufs = (u16)(vq->split.avail_idx_shadow - vq->last_used_idx);
+
+	virtio_store_mb(vq->weak_barriers,
+			&vring_used_event(&vq->split.vring),
+			cpu_to_virtio16(vq->vq.vdev, vq->last_used_idx + bufs));
+
+	if (unlikely((u16)(virtio16_to_cpu(vq->vq.vdev, vq->split.vring.used->idx)
+						- vq->last_used_idx) > bufs)) {
+		END_USE(vq);
+		return false;
+	}
+
+	END_USE(vq);
+	return true;
+}
+
 static void *virtqueue_detach_unused_buf_split(struct vring_virtqueue *vq)
 {
 	unsigned int i;
@@ -2318,6 +2355,67 @@ static bool virtqueue_enable_cb_delayed_packed(struct vring_virtqueue *vq)
 	return true;
 }
 
+static bool virtqueue_enable_cb_delayed_max_packed(struct vring_virtqueue *vq)
+{
+	u16 used_idx, wrap_counter, last_used_idx;
+	u16 bufs;
+
+	START_USE(vq);
+
+	/*
+	 * We optimistically turn back on interrupts, then check if there was
+	 * more to do.
+	 */
+
+	if (vq->event) {
+		/* Point the event at the last queued buffer: the device
+		 * will only notify us once it has used everything. */
+		bufs = vq->packed.vring.num - vq->vq.num_free;
+		last_used_idx = READ_ONCE(vq->last_used_idx);
+		wrap_counter = packed_used_wrap_counter(last_used_idx);
+
+		used_idx = packed_last_used(last_used_idx) + bufs;
+		if (used_idx >= vq->packed.vring.num) {
+			used_idx -= vq->packed.vring.num;
+			wrap_counter ^= 1;
+		}
+
+		vq->packed.vring.driver->off_wrap = cpu_to_le16(used_idx |
+			(wrap_counter << VRING_PACKED_EVENT_F_WRAP_CTR));
+
+		/*
+		 * We need to update event offset and event wrap
+		 * counter first before updating event flags.
+		 */
+		virtio_wmb(vq->weak_barriers);
+	}
+
+	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DISABLE) {
+		vq->packed.event_flags_shadow = vq->event ?
+				VRING_PACKED_EVENT_FLAG_DESC :
+				VRING_PACKED_EVENT_FLAG_ENABLE;
+		vq->packed.vring.driver->flags =
+				cpu_to_le16(vq->packed.event_flags_shadow);
+	}
+
+	/*
+	 * We need to update event suppression structure first
+	 * before re-checking for more used buffers.
+	 */
+	virtio_mb(vq->weak_barriers);
+
+	last_used_idx = READ_ONCE(vq->last_used_idx);
+	wrap_counter = packed_used_wrap_counter(last_used_idx);
+	used_idx = packed_last_used(last_used_idx);
+	if (is_used_desc_packed(vq, used_idx, wrap_counter)) {
+		END_USE(vq);
+		return false;
+	}
+
+	END_USE(vq);
+	return true;
+}
+
 static void *virtqueue_detach_unused_buf_packed(struct vring_virtqueue *vq)
 {
 	unsigned int i;
@@ -2640,6 +2738,7 @@ static const struct virtqueue_ops split_ops = {
 	.kick_prepare = virtqueue_kick_prepare_split,
 	.disable_cb = virtqueue_disable_cb_split,
 	.enable_cb_delayed = virtqueue_enable_cb_delayed_split,
+	.enable_cb_delayed_max = virtqueue_enable_cb_delayed_max_split,
 	.enable_cb_prepare = virtqueue_enable_cb_prepare_split,
 	.poll = virtqueue_poll_split,
 	.detach_unused_buf = virtqueue_detach_unused_buf_split,
@@ -2654,6 +2753,7 @@ static const struct virtqueue_ops packed_ops = {
 	.kick_prepare = virtqueue_kick_prepare_packed,
 	.disable_cb = virtqueue_disable_cb_packed,
 	.enable_cb_delayed = virtqueue_enable_cb_delayed_packed,
+	.enable_cb_delayed_max = virtqueue_enable_cb_delayed_max_packed,
 	.enable_cb_prepare = virtqueue_enable_cb_prepare_packed,
 	.poll = virtqueue_poll_packed,
 	.detach_unused_buf = virtqueue_detach_unused_buf_packed,
@@ -2668,6 +2768,7 @@ static const struct virtqueue_ops split_in_order_ops = {
 	.kick_prepare = virtqueue_kick_prepare_split,
 	.disable_cb = virtqueue_disable_cb_split,
 	.enable_cb_delayed = virtqueue_enable_cb_delayed_split,
+	.enable_cb_delayed_max = virtqueue_enable_cb_delayed_max_split,
 	.enable_cb_prepare = virtqueue_enable_cb_prepare_split,
 	.poll = virtqueue_poll_split,
 	.detach_unused_buf = virtqueue_detach_unused_buf_split,
@@ -2682,6 +2783,7 @@ static const struct virtqueue_ops packed_in_order_ops = {
 	.kick_prepare = virtqueue_kick_prepare_packed,
 	.disable_cb = virtqueue_disable_cb_packed,
 	.enable_cb_delayed = virtqueue_enable_cb_delayed_packed,
+	.enable_cb_delayed_max = virtqueue_enable_cb_delayed_max_packed,
 	.enable_cb_prepare = virtqueue_enable_cb_prepare_packed,
 	.poll = virtqueue_poll_packed,
 	.detach_unused_buf = virtqueue_detach_unused_buf_packed,
@@ -3197,6 +3299,29 @@ bool virtqueue_enable_cb_delayed(struct virtqueue *_vq)
 }
 EXPORT_SYMBOL_GPL(virtqueue_enable_cb_delayed);
 
+/**
+ * virtqueue_enable_cb_delayed_max - callback for all queued buffers
+ * @_vq: the struct virtqueue we're talking about.
+ *
+ * Like virtqueue_enable_cb_delayed, but with VIRTIO_RING_F_EVENT_IDX
+ * the used event is placed at the last currently queued buffer, so the
+ * device only notifies us once it has used everything we queued.
+ *
+ * Returns "true" if the callback is armed and we can sleep waiting
+ * for the notification, or "false" if some buffers were already used
+ * and we should poll instead.
+ */
+bool virtqueue_enable_cb_delayed_max(struct virtqueue *_vq)
+{
+	struct vring_virtqueue *vq = to_vvq(_vq);
+
+	if (vq->event_triggered)
+		data_race(vq->event_triggered = false);
+
+	return VIRTQUEUE_CALL(vq, enable_cb_delayed_max);
+}
+EXPORT_SYMBOL_GPL(virtqueue_enable_cb_delayed_max);
+
 /**
  * virtqueue_detach_unused_buf - detach first unused buffer
  * @_vq: the struct virtqueue we're talking about.
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 3bbc4cb6a672..214fa36b8eed 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -114,6 +114,8 @@ bool virtqueue_poll(struct virtqueue *vq, unsigned);
 
 bool virtqueue_enable_cb_delayed(struct virtqueue *vq);
 
+bool virtqueue_enable_cb_delayed_max(struct virtqueue *vq);
+
 void *virtqueue_detach_unused_buf(struct virtqueue *vq);
 
 unsigned int virtqueue_get_vring_size(const struct virtqueue *vq);
-- 
MST

