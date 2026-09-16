Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46052120D;
	Wed, 16 Sep 2026 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568804; cv=none; b=iISzbG6ZBsOkEIeRgDSTUrTYGUzAZm5BGd/RIjjwJ6PZF3cgdXSOv0gk5u8zejCNzQriZ3zCdL6pRri6heTFzWRbKIrX12hjwiRdygtEtWs9jINRqfkvCYYFn6ZciPNyHOQ1/nZhQwhjOfEiioeJrC/8qVfVDeXpN8EWONVzD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568804; c=relaxed/simple;
	bh=LDg/LOpHA3pZb1VMLpuIx/TvBG8ah9c2D/LFijUb180=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UANlg95b8rgkTKq4cq16RGHYWcHuedDK+aqkduJ/rQEpPv4XbSvixbVaUWWz3ax8SmMTaE5Upp5CCUYunEk1xdUy85E0wF3vyzUxVkYMq7uoGUCa5wSpy7Q6VvpC0E9C6xTeHcVhhPgd7db+oVBxy9w+UyAYbYtOcgLO0lrkl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fg19kLqe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fg19kLqe"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C61B218E9;
	Wed, 16 Sep 2026 16:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789568697;
	bh=LDg/LOpHA3pZb1VMLpuIx/TvBG8ah9c2D/LFijUb180=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fg19kLqetIzLb1NxnV9guh/FmXFKNVvIYXF//KaO14A7osiCcORkC7c0WWw8Jere7
	 o9BPWxfmjDcQJayXSPXWi8vkvaMdqbmmEQ5nc1wjbGmRdO4/g6puTuJAhwdDWVcDm4
	 hRwQ0uKS7mqWBGjF+HWdOY3kvE0elBCkYsQkhHoo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 19:55:34 +0530
Subject: [PATCH v4 4/6] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to
 support zero copy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vc-sm-cma-v4-4-476d1142b5df@ideasonboard.com>
References: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
In-Reply-To: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6380;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=W/e+hyH1D8pv5YioxZnKsmlthW8o/kVx0Exwlb9+ba4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqb/pH9cpkR7fnd9/v6bhhEZeB/icr1exiQNM
 AAzGy/SNBCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqm/wAKCRBD3pH5JJpx
 RTS9D/4tcMipBSTkMDzAcGtHT9wJb9Evaf5wSQS0kbE3oykWJRRiZVhbu0VdAJ786HoVHyZxGIJ
 YebdvfaHkhf1O6Sb+iCW+mKsuZNN/xITVUxu3E6kRAmTXPrbaRGe4bTunjxGuZMcGOrcWSBfvor
 BiyyDRLFFLjZOj1dZ0WweXZ4FVd2Xj84mjOLBa+8izumdcXoRTIt31UjJ0I9ZE/KbjT02Qu+fg4
 l84TGPWEwN2d2MeKPaOJsGPWXyJfPI2luxZPYRDN145T9Qz01RqB9muIbNqobMis7NbmFi4hRUO
 sdd94ARfpHCNGTtRlfxb+otUudr8r3tBEvzeMNOVPU4mFpu//bLFgzgcT+QHXMiQ6OMCXaF7zKU
 6r/Zc4l84SuRpv3DBuHT72LbkAPX+pIqnMEDNPmPMEf0o8kABVgn8OZOhrWGYlDuzFQHUueQRK/
 Drwefy0ygEEx9wncnMWItFQJxJdXOISOLjKoxiKhjF8VbF708n9B2PgSHNApuofwESiWV0oCQNy
 pBL0q4zYv8FSfb6tVjkP32d0+DN5mhqBNmasmnVf+Bjo3N8nKngV8x7SVLi9cprbnsufTT7Jqhw
 VwoEyIKRUVToHRH4iuN+/+Ejm/9swJRR3JqL86vf4EGAu5jEMLcamHJhoZ+0xhraOLwLsnOI6w9
 a87XrMsRWlh+b7Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

With the vc-sm-cma driver we can support zero copy of buffers between
the kernel and VPU. Add this support to mmal-vchiq.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/Kconfig    |  3 +-
 .../platform/raspberrypi/vchiq-mmal/mmal-common.h  |  4 ++
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   | 65 ++++++++++++++++++++--
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.h   |  1 +
 4 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/Kconfig b/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
index c99525a0bb45..8a798dae408c 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
+++ b/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
@@ -1,6 +1,7 @@
 config BCM2835_VCHIQ_MMAL
 	tristate "BCM2835 MMAL VCHIQ service"
-	depends on BCM2835_VCHIQ
+	select BCM2835_VCHIQ if HAS_DMA
+	select BCM_VC_SM_CMA
 	help
 	  Enables the MMAL API over VCHIQ interface as used for the
 	  majority of the multimedia services on VideoCore.
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
index b33129403a30..6c5092a68b99 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
@@ -50,6 +50,10 @@ struct mmal_buffer {
 
 	struct mmal_msg_context *msg_context;
 
+	struct dma_buf *dma_buf;/* Exported dmabuf fd from videobuf2 */
+	void *vcsm_handle;	/* VCSM handle having imported the dmabuf */
+	u32 vc_handle;		/* VC handle to that dmabuf */
+
 	unsigned long length;
 	u32 mmal_flags;
 	s64 dts;
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 918c30d84ba0..a64b5175e1a9 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -23,12 +23,13 @@
 #include <linux/slab.h>
 #include <linux/completion.h>
 #include <linux/raspberrypi/vchiq.h>
+#include <linux/raspberrypi/vchiq_arm.h>
+#include <linux/raspberrypi/vc_sm_knl.h>
 #include <linux/vmalloc.h>
 #include <media/videobuf2-vmalloc.h>
 
-#include <linux/raspberrypi/vchiq_arm.h>
-
 #include "mmal-common.h"
+#include "mmal-parameters.h"
 #include "mmal-vchiq.h"
 #include "mmal-msg.h"
 
@@ -422,8 +423,12 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 
 	/* buffer header */
 	m.u.buffer_from_host.buffer_header.cmd = 0;
-	m.u.buffer_from_host.buffer_header.data =
-		(u32)(unsigned long)buf->buffer;
+	if (port->zero_copy)
+		m.u.buffer_from_host.buffer_header.data = buf->vc_handle;
+	else
+		m.u.buffer_from_host.buffer_header.data =
+			(u32)(unsigned long)buf->buffer;
+
 	m.u.buffer_from_host.buffer_header.alloc_size = buf->buffer_size;
 	m.u.buffer_from_host.buffer_header.length = 0;	/* nothing used yet */
 	m.u.buffer_from_host.buffer_header.offset = 0;	/* no offset */
@@ -484,6 +489,20 @@ static void buffer_to_host_cb(struct vchiq_mmal_instance *instance,
 
 		msg_context->u.bulk.status = msg->h.status;
 
+	} else if (msg->u.buffer_from_host.is_zero_copy) {
+		/*
+		 * Zero copy buffer, so nothing to do.
+		 * Copy buffer info and make callback.
+		 */
+		msg_context->u.bulk.buffer_used =
+				msg->u.buffer_from_host.buffer_header.length;
+		msg_context->u.bulk.mmal_flags =
+				msg->u.buffer_from_host.buffer_header.flags;
+		msg_context->u.bulk.dts =
+				msg->u.buffer_from_host.buffer_header.dts;
+		msg_context->u.bulk.pts =
+				msg->u.buffer_from_host.buffer_header.pts;
+
 	} else if (msg->u.buffer_from_host.buffer_header.length == 0) {
 		/* empty buffer */
 		if (msg->u.buffer_from_host.buffer_header.flags &
@@ -1431,6 +1450,9 @@ int vchiq_mmal_port_parameter_set(struct vchiq_mmal_instance *instance,
 
 	mutex_unlock(&instance->vchiq_mutex);
 
+	if (parameter == MMAL_PARAMETER_ZERO_COPY && !ret)
+		port->zero_copy = !!(*(bool *)value);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vchiq_mmal_port_parameter_set);
@@ -1599,6 +1621,31 @@ int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
 	unsigned long flags = 0;
 	int ret;
 
+	/*
+	 * We really want to do this in mmal_vchi_buffer_init but can't as
+	 * videobuf2 won't let us have the dmabuf there.
+	 */
+	if (port->zero_copy && buffer->dma_buf && !buffer->vcsm_handle) {
+		pr_debug("%s: import dmabuf %p\n", __func__, buffer->dma_buf);
+		ret = vc_sm_cma_import_dmabuf(buffer->dma_buf,
+					      &buffer->vcsm_handle);
+		if (ret) {
+			pr_err("%s: vc_sm_import_dmabuf_fd failed, ret %d\n",
+			       __func__, ret);
+			return ret;
+		}
+
+		buffer->vc_handle = vc_sm_cma_int_handle(buffer->vcsm_handle);
+		if (!buffer->vc_handle) {
+			pr_err("%s: vc_sm_int_handle failed %d\n",
+			       __func__, ret);
+			vc_sm_cma_free(buffer->vcsm_handle);
+			return ret;
+		}
+		pr_debug("%s: import dmabuf %p - got vc handle %08X\n",
+			 __func__, buffer->dma_buf, buffer->vc_handle);
+	}
+
 	ret = buffer_from_host(instance, port, buffer);
 	if (ret == -EINVAL) {
 		/* Port is disabled. Queue for when it is enabled. */
@@ -1632,6 +1679,16 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 		release_msg_context(msg_context);
 	buf->msg_context = NULL;
 
+	if (buf->vcsm_handle) {
+		int ret;
+
+		pr_debug("%s: vc_sm_cma_free on handle %p\n", __func__,
+			 buf->vcsm_handle);
+		ret = vc_sm_cma_free(buf->vcsm_handle);
+		if (ret)
+			pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
+		buf->vcsm_handle = 0;
+	}
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
index 8c3959f6f97f..9d31816f5be5 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
@@ -49,6 +49,7 @@ typedef void (*vchiq_mmal_buffer_cb)(struct vchiq_mmal_instance  *instance,
 
 struct vchiq_mmal_port {
 	bool enabled;
+	u32 zero_copy:1;
 	u32 handle;
 	u32 type; /* port type, cached to use on port info set */
 	u32 index; /* port index, cached to use on port info set */

-- 
2.55.0

