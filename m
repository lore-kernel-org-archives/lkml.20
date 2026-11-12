Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482814;
	b=nLljMpUciZcivy7Rf9E5mblV39NkmXZdKr72rCK23T2xd7e+yFc29IK4mZJbX7PlAd7y
	 Zj92LPwO1EBaJOpINAE9VbV+KSavsM5UQb7rvIFWEvQyGSMdoq8shjEun9R+e7XB6ZOG/
	 xpK4WkOi12W7jXVnc8Ai884gnEyPnfIRVdNSrnfCrUzGrbwQx7aHioo2Jrizyjud0bb76
	 JN1iO1YvthZW39TBh1pjHGnCFildA6gzGKJJebvI33dcJDtIWgwUCvPQVYLnZQpdS/5jY
	 KVxZV3EGBqpCH7kVfYjeZloiKuJexF8PfYrXqwm64sCcCQxg/5KzzEUoM4h2ohk6uMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482814;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pvnTky2rr1OVYIEAjOLyue2SPG2gAHzpqmoJhFf34Tw=;
	b=awTgr0W6k0shpaQ0WqbZwr3+d9dW+odnYE/Ryvrbi4MWEYyng2Q1RbwfQy2aZ2ldHSr0
	 kiKz0Nau6Jfw9z7Mu8Pgzi+69PFBsv+mK9nhF2COjg7+nL3RImwa/CTmfWcgaD2+xTeL+
	 U4UFB1Xc9MNxuFzyBDoG7/3Q09LoqZp2A/2X2U2WwfSU3cXwqi/+ZBQAb5+CbnXd92gmh
	 rqwodv/sZV/xumgaINidtmw2rXDT6oTBFQZjVlcoVy7YXbSKH+BdOLc/hXFqTJqjntgty
	 lc/kb+wDt7hJpmHwrqM+ev/fxvmp3KoGAjI0F9HFr4XYLZdyTGL9iJSduav42qGSnrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=p8sa+g7V;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753B606A331;
	Thu, 12 Nov 2026 11:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B753B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=p8sa+g7V
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE4D2802;
	Thu, 12 Nov 2026 12:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482668;
	bh=KYZkWwB2Tv0K0JLJrfyDO8wArdfZxNOZP5A5oLs+kCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p8sa+g7VE5EZCvOB1nrW4bEoLmBJqq/Ux56Q5KwhNJ3Fl9AmKl44MwDuhgdPX2WqR
	 8jbbQVn8723fbFWDmMIY4yuXoQTZqZITzORA7yaocy226+4Shnwugrjibx2CT4mUeG
	 xoF05uWgW9Op8OB48RSfxITp1vZ4EfvsIQxhBsFM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:56:29 +0530
Subject: [PATCH v6 1/5] media: videobuf2-core: Move type check out of
 vb2_core_expbuf()
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
Message-Id: <20261112-b4-vchiq-isp-v6-1-711b48378367@ideasonboard.com>
References: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
In-Reply-To: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4563;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=KYZkWwB2Tv0K0JLJrfyDO8wArdfZxNOZP5A5oLs+kCE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aJpZ6YNrWZXsE0pS+j85ca1qnnFARi9wa7iX
 c10UxY860yJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWiaQAKCRBD3pH5JJpx
 RaEnD/4mVwa0bRW4KALuu0FQKS2dJuHnmfuWCjngGlvmkaaaSADO7Zzcu39Axc2Cd/uY21gC85K
 aI6EsVjoVAoG8y4xO9hw1qpO/XZO47NtQBVwkYMnGm/+IUdBvWMq/f8x42lFdXDBc4aIIU0bNRI
 MZLebAhbYWZrsN8VvoiE8gnE4uVS6i4M98zA/vMJDsJD57vtY2GR9Z8rvvYTngOjkA8F2ndhO1V
 67AgXWtCg/vTNIMYo55ToPGuP1DGkf3JbbZqOwSCdt0QvJyxAFLOhDy8bDsDAXgcK4C0QIvTiLn
 lcLvGZC5a2z++Ad0ocgFSAeRcoiWIF4OJb9U2c3Nie6jkcH/2y8lbVnSlicXNCMAhz/Amk8i4RN
 sg+CQ+4Fw9UteWcbWdz+P3buI0g0j+SCRxKcLfxNjJz2WdULxqHAkrMTTxjdtKnjHuPkkiN/XjE
 WxNbmN9FhIv8PJ6zCylCCp4r8WKWvG2hy5qssBY2nQXrAgkJKJePHPofpF1egCWrNhOXfte/u7q
 jxuOmtgkLkP0xBPrHQzpy7nCnVXIG8pcvrhsfgsrHip6d6ecviXPqXHSOol/+PIwNWX7UzjM9h1
 1aH6NRgKyt51sgShhSA+uOoJ8ztx/1SmUdY+fZ8CnaxdYk0UxDWyeuGtv2q3Nh/utcf3hNQjIQW
 HhUDUP5xk6o8srg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

vb2_core_expbuf() takes the type of the exportbuffer as an argument and
checks if it matches the type of the vb2 queue. Move that check to the
caller (vb2_expbuf).

There is only one other user of this, which is dvb-core, where the check
was anyway redundant as it passed the vb2 queue type instead. So update
it too.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/all/20260910150454.GP1892234%40killaraus.ideasonboard.com
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 9 ++-------
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 ++++++--
 drivers/media/dvb-core/dvb_vb2.c                | 3 +--
 include/media/videobuf2-core.h                  | 5 ++---
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f1757..5e318165659f 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2419,8 +2419,8 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 	return 0;
 }
 
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
-		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
+		    unsigned int plane, unsigned int flags)
 {
 	struct vb2_plane *vb_plane;
 	int ret;
@@ -2441,11 +2441,6 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
 		return -EINVAL;
 	}
 
-	if (type != q->type) {
-		dprintk(q, 1, "invalid buffer type\n");
-		return -EINVAL;
-	}
-
 	if (plane >= vb->num_planes) {
 		dprintk(q, 1, "buffer plane out of range\n");
 		return -EINVAL;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 5a1ee5eb9c0f..aee1a9244a7b 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -877,14 +877,18 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
 {
 	struct vb2_buffer *vb;
 
+	if (eb->type != q->type) {
+		dprintk(q, 1, "invalid buffer type\n");
+		return -EINVAL;
+	}
+
 	vb = vb2_get_buffer(q, eb->index);
 	if (!vb) {
 		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);
 		return -EINVAL;
 	}
 
-	return vb2_core_expbuf(q, &eb->fd, eb->type, vb,
-				eb->plane, eb->flags);
+	return vb2_core_expbuf(q, &eb->fd, vb, eb->plane, eb->flags);
 }
 EXPORT_SYMBOL_GPL(vb2_expbuf);
 
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 672b0efdca21..fe7a6554b30e 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -357,8 +357,7 @@ int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
 		return -EINVAL;
 	}
 
-	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, vb2,
-			      0, exp->flags);
+	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, vb2, 0, exp->flags);
 	if (ret) {
 		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
 			exp->index, ret);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a..feda638d0064 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -959,7 +959,6 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @fd:		pointer to the file descriptor associated with DMABUF
  *		(set by driver).
- * @type:	buffer type.
  * @vb:		pointer to struct &vb2_buffer.
  * @plane:	index of the plane to be exported, 0 for single plane queues
  * @flags:	file flags for newly created file, as defined at
@@ -973,8 +972,8 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
  *
  * Return: returns zero on success; an error code otherwise.
  */
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
-		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags);
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
+		    unsigned int plane, unsigned int flags);
 
 /**
  * vb2_core_queue_init() - initialize a videobuf2 queue

-- 
2.56.0

