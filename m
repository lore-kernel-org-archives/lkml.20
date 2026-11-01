Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552005;
	b=M3LTuzvz0D6mdPYsXuLhvfafT2hKwy+fhYTwGS5rpmOaaauSggOOLn8mME/wBWzprzDq
	 MHPxCeFUM03KqXzArooJIiUUE9cnFAgMfUv7MTeJ2DXHIoPdYQXrIp5ub9aFkanX6BxNG
	 TX6QPS1rVGlB8m1qHMRWz1xQulp2yDkk+HOZQEf//iwbyCTPxdwwuZik0dc8Avdp+tVJ/
	 dZ/vizjGsEzA0oZEc/KH+Tx6AK+zj82qqbnFvhlKSuYFFC7Xn13qwQRzrHNbmMb25vjKs
	 UxD/2PxzPXgV/zkX7Z5zr47yPwfzIQSYxn0ybDhrKHucTyi5zsDqKVFaLplmc/1ROjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YRHZXduhT/aAWrLeGZjblkuPs/VioNEprpmzptkEp3Q=;
	b=UcgDux9s2Zx7lsmKyHyFN/I56um1vZyeXPOdu8E/Gyy9p0Nd6J+mKuDkzKwF05D2ROrO
	 agyLVYp1brLpyDU59ER2fWOKGHRt84FdeQhqDz9jQwxQYwHa/0bQhu4ZpmDSuYrZGC0eD
	 YmpNevvN+A2Cynf/xdGQ7zz4tMkwB2S4KsHgi2eOjGpCErQyeDiMTQWX5oi6OhotIMcbY
	 xjn7BVzZJHcmFoPeF0/HrdCcRccMNSMb5XgyhR0yX1kyLHIGmO/U5GAW2NwXfVcvEbjc5
	 JvJuQf2HIwaWZVepBbFp2x4vMv9S1y4jMsxfIiNOPPai7tUzavteVJixddj86fCw8uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDSgamjc;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772E7606A33B
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772E7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDSgamjc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so14189515e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793552004; x=1794156804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRHZXduhT/aAWrLeGZjblkuPs/VioNEprpmzptkEp3Q=;
        b=LDSgamjcpwVNv/gIkufzRcd4VM2jIoSB+9Caj1CjGaSFO2i5pDXvrZQSzmSQHIeBST
         0+IATN5IwNuQxz+zWhOxnkDBjLrcMsE0GJH1jKT5HhRYBdWlVP5Y+uAnDGTTMbsegfim
         h/e+3c/pjlGB69sB9WaUE1qP2eEfJMTuQwsXbnQLUPyXJ1Tf3h7msYsgBPqpnCaPZITc
         ffvwmNta/m+x7hN/1oVaDIJ9SdiiCU1tWs0P0otUrAfQYXfS9aQekfu6dbPoUmYsMcWK
         1cK3/F8gldbwICZuAibKuEaH6r7NRfJejTd6caRvJoIl4QUihOrdnaqnBm9w3ZzbklRD
         Lmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552004; x=1794156804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRHZXduhT/aAWrLeGZjblkuPs/VioNEprpmzptkEp3Q=;
        b=yznwsSuRCNfGQ8ATmWbSZOlPkZIQELAg6ZG7eL/i+nPf7O+GhomoYLCvVGeQwQU+3j
         CiUnYTBy6gsM5e8DRJcc1s06ZbILVQ4BGtgRm2OAi9ArtrMbe4Fi41kGdNkXCTTNYpjX
         OXEcpPUgcU1i+7rzn+AAc+RIEEfss7OZKE6pZhCPPSaZHuGpEya7rFX+cZMbX9K1RKyz
         AOUe2L4ZeSUCHiI02fU6jOx7GjPZfXFNXYdEqSSyyY2O2eRbYZtV45MbaPOFPaYnHufG
         G+2gnO3F9w030ylx7MAUVxhgHjA5ksCpbKv+QC6F6Y7lf/CI/K0bO3uiczm6f+C1iLbg
         KV2w==
X-Forwarded-Encrypted: i=1; AKwUvBzGvoZ4p/0gaBuACVfOdBf3Lm15bN0BlhOEtB2nO3cqBpJMRy7OlypsBsL1mjTohl3wzZO45SDHLFxbIic=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZfDAL+bjQ08+qzQ+Z7jEmCuMAopVOOVmnPXvZvR/2TomJtVw0
	hFVp+TKLBfIz3LFN8OmUFw3ANpMKn+CVkCDUaJbXiFLFtZZQXK/7Cwwx
X-Gm-Gg: AYBFou14rQaGsNsLY33xmeTKcKx2NVOSDGCUqeQtKJDmU1FGbd13p3+k9TfNmGFC5ER
	Jue3PLSKgSae+5lSqZdJP+uwiEJswrYBpmvR4EPPF6QArnMYpV4cX8NWJy7LZqpEP6YBVyNnKZd
	TnfXlmL9A9smpy3tbd3LTz+VpXWAAMv18dKNp9WMfqTd64vsC2BwfqzRS2SUTzgW/i30xuLmEZ9
	DJgbQDRTiKIoYWW8ftZ+vE0PACKc+mvTklLUT8rkNVOasfkQuX2nSJMHEGIj1fEebMVhW8H/CaM
	D7ccCiqcjNcjx9EmduB0qAj6PixHHNAT6Pfr9XgKTBGuhj68C4tldd08A5/WpiUdb0euc16m5Bn
	1CplrK840iqDfibfDDF9KK+JeVZ1RMRgL15LM1LJDziIXlqnRTM10dRKOB8ikqzl+2nfRPDTwvK
	Np+T9p/cml7EisfGhBwxgg/UoGqHf2gEolbRUx6CYYka5mRHmVU4/e1G6Af64eFVrsH0zUJFD51
	95vr8si+4V9uyW0Ee/CHKp/OvlOHpyQR2+o/nDVXe/ZtwC18U1pV8zq0/uNKcOdl916c8QBb+ue
	C/++dmwqUS2Fwym0Zlgkjecs/qigtuVN67bS3fRO4wQolNrWj1dBe4KxL5UcBtjlAomfhMT7U+Y
	W
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4ac1932aa2amr179580105e9.34.1793552003842;
        Sun, 01 Nov 2026 08:53:23 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:5058:2b49:7a78:eb6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm223903095e9.10.2026.11.01.08.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:53:23 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] virtio_blk: fail the probe when a virtqueue is too small for a request
Date: Sun,  1 Nov 2026 17:53:06 +0100
Message-ID: <20261101165307.2557421-2-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101165307.2557421-1-stjepan.poljak@gmail.com>
References: <20261101165307.2557421-1-stjepan.poljak@gmail.com>
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

Without VIRTIO_RING_F_INDIRECT_DESC a request takes at least three ring
descriptors: the header, one segment and the status. Nothing checks
that the virtqueues hold that many, and a smaller one fails in a way
that depends on the queue depth. With the default depth, num_free / 2,
a virtqueue of one descriptor gives a depth of 0, which
blk_mq_alloc_tag_set() refuses, and the probe fails without saying why:

  virtio_blk virtio0: probe with driver virtio_blk failed with error -22

With a depth of at least one, from a virtqueue of two or from
virtio_blk.queue_depth, the probe succeeds and the first request never
fits: virtqueue_add_split() warns and returns -ENOSPC, and the hardware
queue is stopped to wait for descriptors that even an empty ring does
not have.

Check the virtqueue sizes right after the virtqueues are set up, before
the queue depth is derived from them, and fail the probe with a reason
when the smallest one cannot hold a request:

  virtio_blk virtio0: virtqueue size 1 is too small for a request

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
 drivers/block/virtio_blk.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index c8bfbf8435ac..0a2af22f2365 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1244,6 +1244,18 @@ static const struct blk_mq_ops virtio_mq_ops = {
 static unsigned int virtblk_queue_depth;
 module_param_named(queue_depth, virtblk_queue_depth, uint, 0444);
 
+/* The size of the smallest virtqueue, which every request has to fit. */
+static unsigned int virtblk_min_vring_size(struct virtio_blk *vblk)
+{
+	unsigned int vring_size = UINT_MAX;
+	int i;
+
+	for (i = 0; i < vblk->num_vqs; i++)
+		vring_size = min(vring_size,
+				 virtqueue_get_vring_size(vblk->vqs[i].vq));
+	return vring_size;
+}
+
 static int virtblk_read_limits(struct virtio_blk *vblk,
 		struct queue_limits *lim)
 {
@@ -1474,6 +1486,21 @@ static int virtblk_probe(struct virtio_device *vdev)
 	if (err)
 		goto out_free_vblk;
 
+	/*
+	 * Without indirect descriptors the smallest request, a header, one
+	 * segment and the status, takes three descriptors. Check before the
+	 * queue depth is derived from the ring, which would come out as 0
+	 * for a ring of one and fail without saying why.
+	 */
+	if (!virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC) &&
+	    virtblk_min_vring_size(vblk) < 3) {
+		dev_err(&vdev->dev,
+			"virtqueue size %u is too small for a request\n",
+			virtblk_min_vring_size(vblk));
+		err = -EINVAL;
+		goto out_free_vq;
+	}
+
 	/* Default queue sizing is to fill the ring. */
 	if (!virtblk_queue_depth) {
 		queue_depth = vblk->vqs[0].vq->num_free;
-- 
2.53.0

