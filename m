Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552008;
	b=m5P02i5UWhuoJsMygUAQqsRfsMijnGtn2BfxS/b/7tulFyGw3j8y9hCsKvEZiOEnfx8L
	 8MbsvSDifg8Ai0pCFzuPnxk6qd4y3DdmM8X++5elHjevTaC1DPrk5b+DtzV2Y5Sp/f8wD
	 Bd95JhLUaC1sOyXk7lHrzW45ETAOjm0DQ2AKXnSZiKZT9ZrYXHVW3QgPwaTKY8wi3nFF6
	 6aTDABHOivSEyXV07muDLMf8LGQrqgKD8+HnczQd7UdAiJygT9Dqxr0LYZbYN0vB+s2ZP
	 5lcNqa09zofakM0l6RZU30c/TR2N5uR06xtFUxG74oFvpvfbG4qejfbBq3yvGZj+iGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XNRrcw/P1Mej9G9gW7ieLo3ycxjD6V+M/Loq7iMzpSU=;
	b=QPol1KQHNIfKInpJw/m0SSwnJekcUVbxfRE3/nkafOJed+nFVJH+bJR5HgwGrfRso62Y
	 7dNQdaQrM+W/9TeLe63Vk3uA82dSZ3jESXXJO3ZCzo7bJcAkLE/nnnsJsmX7hi38uk9Xm
	 E/iUN1Uu4aYrjOQEpVj9y33sCBnrXgIVNWzPrdM2ZVdSs5Titsip5UFBYrG010Ujf/HdF
	 VerkWWqj/HHr0dS5WMtl1Sh93W6ylatGXMdh96VnrvzK7YL9PawiX3zqiYONnAdxd+DaW
	 BAwo30lh2eeht86WgrmRzskkqKE1Ftp9DaN1bKcp6EW1RhXjYp5mbgyyDsqLyz0gwCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neuQCDqQ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F8606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neuQCDqQ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so20462465e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793552006; x=1794156806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNRrcw/P1Mej9G9gW7ieLo3ycxjD6V+M/Loq7iMzpSU=;
        b=neuQCDqQPaa064t+uKrbDqWjnAiTz7BKVeAnegSVo5m6qeQA+pTmzLt0qfIq3MMKaC
         ivoe7dlOsCJ8lb8EXyPGUXqNO8ja/d3xulWEGbxzoqhXyuPohE5CGfbOe9D5eB5qkRK8
         fqBdcm6i20SaWU6xMbULpXoLaWOoSGBzNxOtf7VWfMDO6MWz3VxwIRoAspJhSdUmuNYZ
         +MfWfoFKVYPMr7F2gkGAngtR6LSiwHelFprEZm07Pu1MNWLvcPyH24TgB0yth3iT0IgB
         rhTUYMu5tnp/1NGg+Qb1n+JRkc6UPxTURdtzXBnm5GuUhXq5GsW2RlZux4Nxnv9AQzrv
         qYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552006; x=1794156806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNRrcw/P1Mej9G9gW7ieLo3ycxjD6V+M/Loq7iMzpSU=;
        b=bwzxNKc/nYL/LJHGUdXEh40tbPAJL2XwUZdDFMWbLLwa/cxN/ygCC11/H0raZwHq+H
         koT9grhZ6YoVX3On2wX9V36weYjzTINTbW6R6vtXnbIRnGdCf21Zjj6CkUA6JTUX79hI
         FQtblIxUXBaMRQHE60oiuO5iNNugyR5AAfFlDS78O4TNBorsEVcXyJCctn0Qi8vWgxWn
         qxFuryQb98dFaIf5jFQbEdN2pxGrbJA9GIxFHT+Qq7yvb9M9hbfy67SvxmDCcL4x/IzO
         vT/CO16xWinRZ25c77VBgmxNsTiQfzOUQxhRb7myNcyP7IH++3pGUl4ubGoVj7wPSbAI
         1h6w==
X-Forwarded-Encrypted: i=1; AKwUvBwAlJzrHw7s2vHTZ8cGV48CPZmkt1HANMUxTL6Af0wIvvYb84vxjpfWRA1YwMjUg7dBYAs5z4Onl35/QGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/ZssDzSivwYXqP+SgIsFb/5d3Dg3AnJ4bMcPXBSgkQrU9W6s8
	7UjSnu8jNBtMx2wWVRHAg37TEB71tAdJ2PX1Lj/DTIpLUdtgUSMUMLRB
X-Gm-Gg: AYBFou03+u9ZSGWCCfv48zGshVrH70HZxfRsurpcCsGDmid+QHY9wmKDsgGf0yAtyzD
	SH69P/rX8dtXIiUjD8svYGsRKht9Igd7AKPxZEXFvYOELiZWchAV/TiqDOEuW5iibQEmqL2Gp0S
	Z18syW/dTXtNdBB/OFOwZhB7ulkzslazeDk9/oG8tHVaSkAH4yLEEZR2N+IuO7KKEJKxsTdFGCa
	ndIXIs2n3BYt4lFL46fUceQdgZOOHKSDbjXF5FJxvQwBB87UOmGuVuUfXDTw3alUF9Jd3XP1ZuY
	d/ybFOIaPbtaUm9kJGOaAE/EFQElp3FrUXT1XFVRIbj6FT/zG+63Mm39RQfqZtmdd5AoAxts1ML
	uOPjyK9anwg1TxWHdDtwVeemoaDxnsAdlVAPLGpNPxpCVjRs4TArm2yDnn0u6hHaMuHzxbsedEP
	V9ETIfVu1jGLr0ld0/qgEjfnj62qhtUimQSMIjvUyWxCoVjv2b1uCyUsCZZs5C6S5W2RmZ0Kub+
	Lv+RogxAqeX30iP0mls2YXDK4a2LcwLjOV3UmiT3+WAIDm8HzjHRbX4xSsdCGXfwt0m3xCaNyU2
	obYcQX+f6uxGLWdOtsqrJ9PN+G+OIym4mI3JWcd/uO3BIFvCN0oXzJ6+8d9/TuXf4mvvmI6CFy5
	Z
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr190239205e9.4.1793552006429;
        Sun, 01 Nov 2026 08:53:26 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:5058:2b49:7a78:eb6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm223903095e9.10.2026.11.01.08.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:53:26 -0800 (PST)
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
Subject: [PATCH 2/2] virtio_blk: fit max_segments to the virtqueue without indirect descriptors
Date: Sun,  1 Nov 2026 17:53:07 +0100
Message-ID: <20261101165307.2557421-3-stjepan.poljak@gmail.com>
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

virtblk_read_limits() takes max_segments from the device's seg_max and
only clamps it to VIRTIO_BLK_MAX_SG_ELEMS - 2, which fits the largest
virtqueue the spec allows, not the one the device has. Without
VIRTIO_RING_F_INDIRECT_DESC every segment takes a descriptor in the
ring, next to the header and the status. A device that offers a seg_max
above its queue size minus two thus lets the block layer build requests
that can never be added: virtqueue_add_split() warns that the request
is larger than the ring and returns -ENOSPC, and the hardware queue is
stopped to wait for descriptors that even an empty ring does not have.
The I/O hangs.

Seen with a device that offers seg_max 254 on a 128-entry queue without
indirect descriptors, where the boot hangs loading /sbin/init:

  WARNING: drivers/virtio/virtio_ring.c:688 at virtqueue_add_split+0x6c0/0x850
  ...
   virtqueue_add_sgs+0xd1/0x120
   virtblk_add_req+0xe2/0x140
   virtio_queue_rq+0x79/0x1a0

With seg_max 126 it boots, with 127 it hangs.

Without indirect descriptors, clamp max_segments to the size of the
smallest virtqueue minus two. The previous commit makes the probe fail
for a virtqueue smaller than three, so at least one segment is left.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
 drivers/block/virtio_blk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 0a2af22f2365..5f05aaa079c2 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1280,6 +1280,16 @@ static int virtblk_read_limits(struct virtio_blk *vblk,
 	/* Prevent integer overflows and honor max vq size */
 	sg_elems = min_t(u32, sg_elems, VIRTIO_BLK_MAX_SG_ELEMS - 2);
 
+	/*
+	 * Without indirect descriptors a request takes one ring descriptor
+	 * per segment, plus one for the header and one for the status, so
+	 * it has to fit in the smallest of the virtqueues. A larger request
+	 * would never fit and would wait for ring space forever.
+	 * virtblk_probe() made sure every virtqueue holds at least three.
+	 */
+	if (!virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC))
+		sg_elems = min(sg_elems, virtblk_min_vring_size(vblk) - 2);
+
 	/* We can handle whatever the host told us to handle. */
 	lim->max_segments = sg_elems;
 
-- 
2.53.0

