Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482332;
	b=WT1imX0hCsGqm7Ve8Igmp0RmT2j7t7ZhgqdEABaKzxja+b5qF+lthApEfwXYEG4euAZG
	 1NQgay6gqVs0grS+8SprOK+NIOlGYXE1LYYzOa54g/xF2G0iH7v6Oy4amGOOCh9lEco73
	 hFkQ2qDZ8ZhjvHEdcd75LIhL5UllAD9xZ0K5i+Lw92AItL+oxXCe9rfTIeO2vQ5gStthQ
	 2sWD9fCW9hetf4gXXRRQn9PTNCGumL5RqA2RcgWTMFUaYSy7yVEpLwCkjArjR59/8S1ZS
	 EQtHbmuDy9cQaHkjzaynE0Sw9OHt9HH+Cd5TQ1iYrhW0R6H01Tk9rYSaDs7jLxSLHTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482332;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3JJAMGMGP7NgDBACbKcQDASj1tP1A61c76ckOCHRHZs=;
	b=h6MrERPJLGn7q7rN/vOHQpjHuyvGJ/RTYVJMJd91zcEBD5OFgR+C5OzBttelj9zWjLgw
	 qh/6e7gmLutX5vLCt3V89KTWfpA8lTL0+d7qPuJZzmFeYIxr3MTdKBjKWQtgPXC3vYwmJ
	 MeP6fJUym8W/Zk3VPt2AypIhxQMr42R3fTv+8jI5AAnZfC1Dm7dv+NADQI4G3twonyz7W
	 Fso7kh7d5UeuTXRU6q8PhNq81KvLmxawRcAa35PuMf9/BS1LdDQz+f/e4sa3co3nhZvtx
	 0mx/cZnRGPXVoZnxuf8auyDLlFsZH7pYjLG4heAF3qAtJ2Br2/pBr5vK2ggI+FXXttQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SZif495P;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24421606A335;
	Thu, 12 Nov 2026 11:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24421606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SZif495P
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A47F7D77;
	Thu, 12 Nov 2026 12:16:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482187;
	bh=TyDbHaXpCds7m61Yb/A/eMD//m4V9Jy5aZjZ7+7bvkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SZif495PWLMCdEaqWSHSNsBhjYSwMlF+/fSJr7kJLqvPt5kUtdhNeVbY9bgK7r1Bb
	 7MfiXJi6dxQUiaoiGRoV6II5biN5VC6+Exvo6mwIFGWbsvBTPaRz8P7Nsc9D08YO1e
	 WzRPPBtieQdXihJlSG1d85gpTF75z6cJVAeT6y/k=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:02 +0530
Subject: [PATCH v5 04/11] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma
 to support zero copy
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
Message-Id: <20261112-b4-vc-sm-cma-v5-4-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6383;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=X3IKA2/rQKOtJr5VuvmG+h8Kz3d+8KXQEN1UDsivbJc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB31JR1kP976HuaEAYafSP3YRITls7BTbt9Q
 AhM7bryhX2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgdwAKCRBD3pH5JJpx
 RbAJD/4vEV0SHXfQTUzGDvd5CZieGRvTzlY4mCC0owdncg5iEIeltKvj8NRINx4cHqpPPtOk6Jw
 5k8M8mIgbA7FiHQ06xOjJkDbAohBXaiYsOdIDZ26BF0Ud/Qhu1b1PGgG8DnykOClRh1x1fIEZG4
 WiHOxt2k5wCGgTdR4FnkSYcbIjm8QCmONJ1UDjx66I/HUOgR8t18L6V2h6wFtvKqMfnzAw4zmyf
 UruzIevht56cFAqlrgenjeyCbsPAk5KCLl77GVDAqLJyMkTWjQpjnfurI6bf9YllHShhynM29FH
 PfOGGkeEXcAEhWnMZSureXO5APgVw8s4e//aDzDIaT5Xi3ttgv/esVReLsh45nITK51k1L2t72g
 PUf1szeA+RnRBbiqjUhbx7Y8AiGeTb5t2aUy5hZnPJFtb83XdraOsE1ByG6oL0KuCavJ0btTUEt
 EnukuXiSGrXgml/6HTNnJaKYeH6XdpKVsGN/EPsJP28pA7cghy43N2+6nXo+VcGxBvU4Be2gxyL
 7DoqjxdKQl1I8oJaxxhnX/5K9EKlqwk8sjF9GawaU1jFoqLAB3h6llsQueSlLPPZ6BWo9TGxtHx
 LFGlYIAXx5jF0uO6ZvDM22GURzJitHcfhJAlboKvlCUQqSP9tfMWC7raAns7h61oA3yfVnak25I
 h9jEsybM3vya+pg==
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
index 918c30d84ba0..2909def73f3d 100644
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
+		buffer->vc_handle = vc_sm_cma_get_vc_handle(buffer->vcsm_handle);
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
2.56.0

