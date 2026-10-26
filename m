Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793058812;
	b=5AnP/eK7P+nn6qR00k07roPci6snt5dRs3Bx0pILaDtYSK2AQH0G1S+PnTg4vD5d/pBL
	 veYeaUq7VAsud/TNXliSXolKyz/+ApilKQBl1Mx2epAHHmCqbeuxssi7TXNxtEa251TG1
	 99rILU1AZGtnibffnpfjpWuwerBbUn4aXWrB2y8CS10e2oHQxlDT7Mu2Erb1/lkVjTkgR
	 KCVr4p9oFRa4GefTI3++HgSVLPI/5T0tMzFhk+UR+HRwXYIqSYHKhF+yG0+y3QeyR1OW/
	 nATutSHQBeouixzCRAr0WWWcy5UKLKT/6lD0qhnv5/PLNeoj5TArxecGfF3NohhVMfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058812;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer:X-Mutt-Fcc;
	bh=bjaWup0FuAJOmpAyAzTIR20DllfFLEmJV+1+Hi1zMWs=;
	b=si1i9+cFPS1minVqtW/yK0NxUieM6lLeMKHxz5qQcVy6RQJrP/9IkVpMQxLf+i4Hbtpz
	 TM1Mv1CVJAeoUZ9zret+bgIBwBF7MG+kG3ygd3dD8Wz7UdWbGg4Zzs3+7ddvud5tGJi+3
	 FbyOy08i4ukrA7XmV97lco0ZvYiiRienf1uG1e3P5S9TKYly6yojS9stDn9/Wwh0m/MSa
	 5az9xLjwos4RPjY/QMEZoDQW4cmSP4DAebYavcqSUeVyxWScgAY4sDV/JK0+SvK6gR6yf
	 dh35fdJJwsIzFmstVzrXME+zYZiWVwfwOIiXDkAdwWxDZkGfZ03A2n8oH3OeOeU7fbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSHGypTg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o3RSWRfb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DAF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DAF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSHGypTg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o3RSWRfb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793058810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bjaWup0FuAJOmpAyAzTIR20DllfFLEmJV+1+Hi1zMWs=;
	b=NSHGypTghZthu88N1o+vGv+J1D0RmBioknlkzzumPVM+5RSr63VAs4xnQDhh5VpR4FC7zN
	XgEae8SVmlFX0MexRk/eFfP99teG3b6IFFrdARnYXM7vHcEgIAAksOUcKgD2iKJ7WHniaB
	ZbX3l+NnGhfpnRX5fIulXWYFFGjAKJo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-MMt8p9S6MP67tsoyCWFk3w-1; Mon, 26 Oct 2026 19:53:29 -0400
X-MC-Unique: MMt8p9S6MP67tsoyCWFk3w-1
X-Mimecast-MFC-AGG-ID: MMt8p9S6MP67tsoyCWFk3w_1793058808
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a80bd45e1cso468105e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793058808; x=1793663608; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjaWup0FuAJOmpAyAzTIR20DllfFLEmJV+1+Hi1zMWs=;
        b=o3RSWRfb3/yIHldM83LZA/BFaSMjQeRMrvwO7M+xGVymbbbJGUQJafl/+3mS/urKln
         1P7SvfVEwnCywye/735oOeZC02O+4oj8Uy+4+2Y8ov3xlwlCBtNepjIvfT97qWCZD8SY
         7UVWj7+kmQbykd16hJXmPMRkgDPsNoZtNkoGJJNc+BATNWvlJiXoeN32CU+6NQtngRFz
         GIuzwIV8p1eug4JDQVZJ9tz0IxDpGoH0CDR/Z6tt7gWzV4N+Gxo1ywvz9pG4IuaFlTQZ
         015cpgxEAuUDW/baYYaeOyoQVuQe6jxlgu6eW9cXZBjtJ+FjLrBAcSgFhhXWKLhE8OKY
         ZPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793058808; x=1793663608;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjaWup0FuAJOmpAyAzTIR20DllfFLEmJV+1+Hi1zMWs=;
        b=YjVvgeTjndFtr5W9R3qPW5bZ1ATa28H72Vy4dGrgo7ZvBfINNPdltCTiY9gaFrTTnu
         BJBXY6rUlVD+TyKfokVcNtrnG7HJzp9a5B62r2AnXhGtCgZDKDi8gfwatctmRh9SckC0
         G0yGTvsG59P+/hhMxM+x8kgS6OnOrzDFI0V00McTZ1aIXyOUr97X10OSQ6j0ytWUQoyc
         uzs8a2H6988gG/nKYE6AUr3nZmnxBuQyYXBOv/1CXSsOGZjpgtQhXlDjRZB2N1aXVCro
         dL+3JUHW1Sm9ql0dZGvfHlnw/V/zOO8p4Jjrf9rHVR56/ttT06rpG64mTND60VKcFTJX
         LyWA==
X-Gm-Message-State: AFq9FYI4haXvEXcKcCOw4aHDQC9DWzxH/PJsljxduqIx9pKh7szsz0Po
	uRKjHYrs7ulxQxXLLDnLIsXb9RHYlJbRJD4p4+2Ng5igdS6+R4FzfSQWvgaN5hyB2g9CGAzuVnx
	Ysq3tH3OAgajsrt0ea9s1Cs2DgUN3jv0+QI99Z73MoD9poFSa3/NXS7txhGgbjqfbm7nz4g+Mjx
	O3CxBviTDDnP+FpKjHEnBogkmQOTMciT+pP26lmUE3pWA=
X-Gm-Gg: AYBFou3q6Zc41aqFV9G+REEHCivI3iJfvYR9xhdmzOn7DIwlpxKR2a0Loj90ULzY91h
	EDhsQ+jAw1jRG2OHOOn9WaovK/odV9h0/4R9G43lzRBGDXiMdXE9RVLAOg0hJEwyjg1+i+kbicq
	MItQxLZep451PfzFQSJ41QqM9EhSr6SQfc8iUn/oCfvbHMstgWQa6YRNm2aMGOqPtuCcOJYTcAv
	z3r2IIvU6qFujA0T8XWWUa5bpfsBmueUetRETbt1SvzIWXpRXbcRl5+/88hLzkbV32pX0SeZUee
	9icrmNiUMg6F/fdPL1wBZHuoHLppwiqX7ILp/XfwYfJI6hqk9kUODnr04Yq70j7uebI=
X-Received: by 2002:a05:600c:1992:b0:4a2:1a:a121 with SMTP id 5b1f17b1804b1-4a35acaf98emr138793545e9.18.1793058807610;
        Mon, 26 Oct 2026 16:53:27 -0700 (PDT)
X-Received: by 2002:a05:600c:1992:b0:4a2:1a:a121 with SMTP id 5b1f17b1804b1-4a35acaf98emr138793265e9.18.1793058807090;
        Mon, 26 Oct 2026 16:53:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm17811321f8f.3.2026.10.26.16.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:53:26 -0700 (PDT)
Date: Mon, 26 Oct 2026 19:53:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev
Subject: [PATCH v2 1/2] virtio_ring: add virtqueue_enable_cb_delayed_max
Message-ID: <32e21059adb6cb1fd08c3f4426a313c77cf450ec.1793057483.git.mst@redhat.com>
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

Notes (changelog):
    changes since v1:
        fix off-by-one: place the used event one entry before the
        last queued buffer.  The device only signals once it passes
        the event, so with the event at the last buffer it never
        fired and callers waiting for the batch to complete hung.

 drivers/virtio/virtio_ring.c | 127 +++++++++++++++++++++++++++++++++++
 include/linux/virtio.h       |   2 +
 2 files changed, 129 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index fbca7ce1c6bf..4c0bb860b703 100644
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
@@ -1122,6 +1123,43 @@ static bool virtqueue_enable_cb_delayed_split(struct vring_virtqueue *vq)
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
+	/* Point the used event one entry before the last queued buffer:
+	 * the device signals when it passes the event, so this makes it
+	 * notify us exactly once it has used everything. */
+	bufs = (u16)(vq->split.avail_idx_shadow - vq->last_used_idx) - 1;
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
@@ -2318,6 +2356,68 @@ static bool virtqueue_enable_cb_delayed_packed(struct vring_virtqueue *vq)
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
+		/* Point the event one entry before the last queued buffer:
+		 * the device signals when it passes the event, so this
+		 * makes it notify us exactly once it has used everything. */
+		bufs = vq->packed.vring.num - vq->vq.num_free - 1;
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
@@ -2640,6 +2740,7 @@ static const struct virtqueue_ops split_ops = {
 	.kick_prepare = virtqueue_kick_prepare_split,
 	.disable_cb = virtqueue_disable_cb_split,
 	.enable_cb_delayed = virtqueue_enable_cb_delayed_split,
+	.enable_cb_delayed_max = virtqueue_enable_cb_delayed_max_split,
 	.enable_cb_prepare = virtqueue_enable_cb_prepare_split,
 	.poll = virtqueue_poll_split,
 	.detach_unused_buf = virtqueue_detach_unused_buf_split,
@@ -2654,6 +2755,7 @@ static const struct virtqueue_ops packed_ops = {
 	.kick_prepare = virtqueue_kick_prepare_packed,
 	.disable_cb = virtqueue_disable_cb_packed,
 	.enable_cb_delayed = virtqueue_enable_cb_delayed_packed,
+	.enable_cb_delayed_max = virtqueue_enable_cb_delayed_max_packed,
 	.enable_cb_prepare = virtqueue_enable_cb_prepare_packed,
 	.poll = virtqueue_poll_packed,
 	.detach_unused_buf = virtqueue_detach_unused_buf_packed,
@@ -2668,6 +2770,7 @@ static const struct virtqueue_ops split_in_order_ops = {
 	.kick_prepare = virtqueue_kick_prepare_split,
 	.disable_cb = virtqueue_disable_cb_split,
 	.enable_cb_delayed = virtqueue_enable_cb_delayed_split,
+	.enable_cb_delayed_max = virtqueue_enable_cb_delayed_max_split,
 	.enable_cb_prepare = virtqueue_enable_cb_prepare_split,
 	.poll = virtqueue_poll_split,
 	.detach_unused_buf = virtqueue_detach_unused_buf_split,
@@ -2682,6 +2785,7 @@ static const struct virtqueue_ops packed_in_order_ops = {
 	.kick_prepare = virtqueue_kick_prepare_packed,
 	.disable_cb = virtqueue_disable_cb_packed,
 	.enable_cb_delayed = virtqueue_enable_cb_delayed_packed,
+	.enable_cb_delayed_max = virtqueue_enable_cb_delayed_max_packed,
 	.enable_cb_prepare = virtqueue_enable_cb_prepare_packed,
 	.poll = virtqueue_poll_packed,
 	.detach_unused_buf = virtqueue_detach_unused_buf_packed,
@@ -3197,6 +3301,29 @@ bool virtqueue_enable_cb_delayed(struct virtqueue *_vq)
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

