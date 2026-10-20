Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489779;
	b=sKIXoI2QJXZXGsEQ2uFXk3QCzVKtaolJW2OmkZMKzr6JZnN6IDvorikHUKmW1Ox7/4a+
	 pUuYMLKbV0Hq/QO5MOWs93pecvErLTyT0osZOe0Jz1+JeQOLR93CebMLxZs8mML+HN3bE
	 wNbMxYc9c/UKNov9syJIoPoWto0c8lbcntpXkhglyywtxQMfhRhcbO77Cd9+C8j3ulQ6l
	 +Co4H/nRkeUd3+Eyx8BOwOdpVr6YuL+zrDiBID1j3ToQK4xwwARzILx5dahGtOmCHVnbn
	 u/O+uUqigSoka1lDy5KIVq4zg9JTr/CQv5l8WVwcINjX63rkG6HlEAOn39A8DqzM+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489779;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=EiRTXA8tWnpKHyyK9Kym502kD2EE1/XY6ULlSm9bIHI=;
	b=RyHFLEK3FhuhMX8bpsWVJ96vXtwB2frfW6i3KLWExTIg33eMUqPB815jRup5WVRh+bca
	 rxC0RN2WxcD6NArrsfa4mGPvAQ4mjk5lMAmC5fvo6FuhzkND7ZoCnVvs6AqOlrOKQyJlR
	 g20p1Si+JTMnL9On7tylTXgDQadHLNkrNIK78y1cttPifasbqVBbNUdB/GkRaTuqb9QoB
	 P0fR/K8sMdK8WVTNpsGK7p3Nv6gUoBwG6pOdoClCRNDxPmfExiNw0zUuS4gMtJkcj+9Ic
	 TpwwtTxJwQwh47xhnXlDiC2f8MWZJTiuhprB9d+fOtX5c/swrum7k/pzQAdMvRoTZUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EaOa7kKM;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2AE606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC2AE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EaOa7kKM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ei
	RTXA8tWnpKHyyK9Kym502kD2EE1/XY6ULlSm9bIHI=; b=EaOa7kKMRj2/BYSNL5
	UMPjHNXFzG2Xlp2i9cnpS/Bp4AX6kd5ew/sm3sl3a2ZFhb6NhgKkz41JH6p0wbXU
	xPbDti05bUxdEX0UjqhTuqZTSnIez2TPaws1tDQ/v1+0l4cKeO/0O5BbVWLLlqQk
	qq4IaebX6o57DyWRCmANU/yf8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3P1nwONdqe1PyAw--.25428S2;
	Tue, 20 Oct 2026 17:48:33 +0800 (CST)
From: oushixiong1025@163.com
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>,
	Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/udl: fail fast on stalled URB pool
Date: Tue, 20 Oct 2026 17:48:30 +0800
Message-Id: <20261020094830.695425-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PigvCgD3P1nwONdqe1PyAw--.25428S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr1xXryruw45tF1ktw17GFg_yoWxGFW7pF
	4UJa4YyrW8ZFWakr13Ja1kCr43J3WfKa97G3yxGasa9w15Kr95Jas5CryYgFyDJrW3GF12
	qrn2vrs0kF4Yyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn4SrUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC4RHa6WrXOPFCIwAA3W

From: Shixiong Ou <oushixiong@kylinos.cn>

A stalled device never returns its URBs, so every allocation waited
out the full timeout and stalled the display stack on each operation.
Flag the stall and fail fast until an URB comes back; give damage a
short timeout and keep the long one for modeset.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.h      | 14 +++++++++++++-
 drivers/gpu/drm/udl/udl_main.c     | 30 +++++++++++++++++++++++++-----
 drivers/gpu/drm/udl/udl_modeset.c  |  6 +++---
 drivers/gpu/drm/udl/udl_transfer.c |  2 +-
 4 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 145bb95ccc48..43cff97e12f7 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -11,6 +11,7 @@
 #ifndef UDL_DRV_H
 #define UDL_DRV_H
 
+#include <linux/jiffies.h>
 #include <linux/mm_types.h>
 #include <linux/usb.h>
 
@@ -46,6 +47,7 @@ struct urb_list {
 	int available;
 	int count;
 	size_t size;
+	bool wedged;
 };
 
 struct udl_device {
@@ -72,7 +74,17 @@ static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
 int udl_modeset_init(struct udl_device *udl);
 struct drm_connector *udl_connector_init(struct drm_device *dev);
 
-struct urb *udl_get_urb(struct udl_device *udl);
+/*
+ * How long to wait for a free URB before giving up.  The damage path runs
+ * on every atomic update, so keep its timeout short: a stalled device never
+ * returns its URBs and the wait would otherwise stall the whole display
+ * stack on every operation.  Modeset is low-frequency and worth waiting
+ * longer for.  Once the pool is flagged wedged, neither path blocks at all.
+ */
+#define UDL_GET_URB_TIMEOUT_DAMAGE	msecs_to_jiffies(100)
+#define UDL_GET_URB_TIMEOUT_MODESET	msecs_to_jiffies(2000)
+
+struct urb *udl_get_urb(struct udl_device *udl, long timeout);
 
 int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len);
 void udl_sync_pending_urbs(struct udl_device *udl);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 17950fe3a0ec..b92cd5300030 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -169,6 +169,7 @@ void udl_urb_completion(struct urb *urb)
 	spin_lock_irqsave(&udl->urbs.lock, flags);
 	list_add_tail(&unode->entry, &udl->urbs.list);
 	udl->urbs.available++;
+	udl->urbs.wedged = false;
 	spin_unlock_irqrestore(&udl->urbs.lock, flags);
 
 	wake_up(&udl->urbs.sleep);
@@ -213,6 +214,7 @@ static int udl_alloc_urb_list(struct udl_device *udl, int count, size_t size)
 	init_waitqueue_head(&udl->urbs.sleep);
 	udl->urbs.count = 0;
 	udl->urbs.available = 0;
+	udl->urbs.wedged = false;
 
 retry:
 	udl->urbs.size = size;
@@ -265,16 +267,34 @@ static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
 
 	assert_spin_locked(&udl->urbs.lock);
 
+	/* A device that stopped completing transfers will never wake us up:
+	 * fail fast instead of stalling callers for the full timeout on every
+	 * call.  Allocations for teardown (MAX_SCHEDULE_TIMEOUT) still wait,
+	 * since the USB core returns all URBs on disconnect.
+	 */
+	if (udl->urbs.wedged && timeout != MAX_SCHEDULE_TIMEOUT) {
+		if (list_empty(&udl->urbs.list))
+			return NULL;
+		goto take;
+	}
+
 	/* Wait for an in-flight buffer to complete and get re-queued */
 	if (!wait_event_lock_irq_timeout(udl->urbs.sleep,
 					 !udl->urbs.count ||
 					 !list_empty(&udl->urbs.list),
 					 udl->urbs.lock, timeout)) {
-		DRM_INFO("wait for urb interrupted: available: %d\n",
-			 udl->urbs.available);
+		if (timeout == MAX_SCHEDULE_TIMEOUT) {
+			DRM_INFO("wait for urb interrupted: available: %d\n",
+				 udl->urbs.available);
+		} else {
+			udl->urbs.wedged = true;
+			drm_warn_ratelimited(&udl->drm,
+				"no URB returned within %u ms (available %d); device stalled, dropping frames\n",
+				jiffies_to_msecs(timeout), udl->urbs.available);
+		}
 		return NULL;
 	}
-
+take:
 	if (!udl->urbs.count)
 		return NULL;
 
@@ -285,12 +305,12 @@ static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
 	return unode->urb;
 }
 
-struct urb *udl_get_urb(struct udl_device *udl)
+struct urb *udl_get_urb(struct udl_device *udl, long timeout)
 {
 	struct urb *urb;
 
 	spin_lock_irq(&udl->urbs.lock);
-	urb = udl_get_urb_locked(udl, HZ * 2);
+	urb = udl_get_urb_locked(udl, timeout);
 	spin_unlock_irq(&udl->urbs.lock);
 	return urb;
 }
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 289711035b67..c907846048f8 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -218,7 +218,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		return ret;
 	log_bpp = ret;
 
-	urb = udl_get_urb(udl);
+	urb = udl_get_urb(udl, UDL_GET_URB_TIMEOUT_DAMAGE);
 	if (!urb)
 		return -ENOMEM;
 	cmd = urb->transfer_buffer;
@@ -342,7 +342,7 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	urb = udl_get_urb(udl);
+	urb = udl_get_urb(udl, UDL_GET_URB_TIMEOUT_MODESET);
 	if (!urb) {
 		drm_err_ratelimited(dev, "get urb failed when enabling crtc\n");
 		goto out;
@@ -377,7 +377,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	urb = udl_get_urb(udl);
+	urb = udl_get_urb(udl, UDL_GET_URB_TIMEOUT_MODESET);
 	if (!urb)
 		goto out;
 
diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
index 7d670b3a5293..bfff17bba58d 100644
--- a/drivers/gpu/drm/udl/udl_transfer.c
+++ b/drivers/gpu/drm/udl/udl_transfer.c
@@ -202,7 +202,7 @@ int udl_render_hline(struct udl_device *udl, int log_bpp, struct urb **urb_ptr,
 			int ret = udl_submit_urb(udl, urb, len);
 			if (ret)
 				return ret;
-			urb = udl_get_urb(udl);
+			urb = udl_get_urb(udl, UDL_GET_URB_TIMEOUT_DAMAGE);
 			if (!urb)
 				return -EAGAIN;
 			*urb_ptr = urb;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

