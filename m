Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3849411FB8;
	Thu, 17 Sep 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633521; cv=none; b=SsMr/SW8URXQ5Wzc0vdvFBlIpyrkEnKFM69O5H9cJGl5V1UBLRzLo5LlTuD5wZLaSdfPDliTJrtizkDSVsUxVpL+Uny+Y9XXLsCjJ6E3O4D5OxA26/4dJY7mTLVskC5nXNqsaiFnaenUTQS3+mW5uqhFy5fu/WvHLlrP3Rrvdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633521; c=relaxed/simple;
	bh=FvGUVOZEcuWbC9LQs+V/zTIbuYEusVomNGxq02eco44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWEP5kxGUIOvsGpyNicX/RxMmx/ejYWoxtcel8vTtovCgG1vUg938Sh9ywOH5IZgmrf5Zi1Rz5cIJ5i0RrhdFYngDbshiXrwTlEQZddG7AvU1+wmYkEPCelWm9OGfBzmBfZkQ11V0aNUy1dN0qge4qftWMkbOES4d4b9DMRhEbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P0LsuaMs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P0LsuaMs"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8E82B2D;
	Thu, 17 Sep 2026 10:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633405;
	bh=FvGUVOZEcuWbC9LQs+V/zTIbuYEusVomNGxq02eco44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P0LsuaMsQjFMEEaiJJfMDUXmv7ox7I0q9bgMBJBoAlR28ndjCi5kwmpVfy0BdpZb+
	 uIBhM+2ZWmhpLBF4NGWbou2Snm6W0CTlAqYJqgu1kr9OCuOjp+RgR6oRS6lecZnG8Z
	 OD4wqZLBSQu8dfa5XI/8aMNplgjCbMlHK/M1RQqs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 17 Sep 2026 13:53:07 +0530
Subject: [PATCH v5 01/10] media: videobuf2-core: Move type check out of
 vb2_core_expbuf()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-vchiq-isp-v5-1-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
In-Reply-To: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4440;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=FvGUVOZEcuWbC9LQs+V/zTIbuYEusVomNGxq02eco44=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqq6PO1INK6GxNeWgjUCatwA3ZoqrADke3UIbQs
 6X7h/wUAguJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqujzgAKCRBD3pH5JJpx
 Rd8qEADIBsUfm3gvm+CN1hALftXwu1reI86qEmH7AdrS7V4WwyMP5aQDEq1KHkmsIArSyflI9BO
 /QkJAmm2wlYydZZz6Y/wBClwut9O2oU6VkBOIcIjjBEwUqvPZYADe1zbO1byJ39ElK/zFNIHsW+
 P0VP92lzAmw2j+PR1HJS5J/5hQshkcUKmmzivFmCBytU+PeUySAzC7UStYoAZ3lSYIvpDcdl3da
 oZ8EwNbmmmhj31WXg+pRGG141AYKu4T892S5oq6OX5R6ImUnNK6RlJNn8jUj2TXfITQwU4266V7
 llvZ+wM8kvpskfMVvISeY2VO8oomdhCfkCmr09w5NyGPmtDSsuGPKCKV4ErTeHEUOOsoigt49+I
 JJRV/vguqBGFeAJIEjWplCz6Tqhpc7PhEJVR7fjmWpoJME2E6U1rHnjvLJrhXHX+lX3/8WSaGuF
 OaiuAdwHH5cBR8OAGag72m3ADRUIscI9wyGu3Whc+NgczNYKzeQzy72sT3SwtZN4mIPOoH+1tcX
 NOUtMzUmrQ380xRd92s7IHbEgrGq3ZJR4EQ/3LGJJcGIHos0SUGVWIg7/JufQnahE9D3jODD/Iy
 QgV+rRW+6HFFq+Y/em9kXCoc/jTLVsfdaXpmXfP/j3QHydiDwdRhVkzOoJhbpdobfRYIQpQUqWc
 IzAMUo8mgfolxOg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

vb2_core_expbuf() takes the type of the exportbuffer as an argument and
checks if it matches the type of the vb2 queue. Move that check to the
caller (vb2_expbuf).

There is only one other user of this, which is dvb-core, where the check
was anyway redundant as it passed the vb2 queue type instead. So update
it too.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/all/20260910150454.GP1892234%40killaraus.ideasonboard.com
---
Changes in v4:
- New patch in v4
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
2.55.0

