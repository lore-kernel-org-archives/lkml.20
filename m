Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295132;
	b=Yw/X8S1XTO45gJgXoGEld6Wl1LNw5ELJoqFBJ5mvmVgTdnyXkQorqCEzx1dOpoKeziRU
	 nZiX5JsWBQQgoBoCA20N9R2DSSMI3n3SPWideX8+37NzWpL8tFYw8FDUpzeKJnuKPZNSn
	 XjaqR+x9n7g7GQia9g21RxVqb1khS1n7FOO6rk4n/Uz5ALMUBrdo3w0J0Qef0CwqTn113
	 j8C+vU3QLRTUarkrzdkuBxi9MScoKKGP1PpOOMEI2M7ZFgJrQTE6/cIekS5iKjSyoOS4g
	 0EodVcl+10NfaAzgRJYEjgEMr88OnSb12kHFs1y/Bydi6PmlQ2L1uusY3Q3tMklhrtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295132;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aV3F+u04rB8kY+qvCgQPsLiy+2Lbp6u0kbyYjrOIjc8=;
	b=5CwHIjIkUhfq10m4vaJI4LvLBlLEUZ6mqA/+Y52OdB8nnWz9rdLWxeMztIKgbpmm7JUD
	 iPPqbjDlrGdx5GzIJByKQB8ZlCgHA4yq/HGuzbZ8E2k47fvBEblyNwII2/5LL1zTCodx2
	 IyOqnZ7RPZT4yslxITGRGT7lYx50WWnGAQR2mMLvS576K10CrYSW6RKRjaWQPq3W/PP44
	 CI9xmKQ62Po8lFnZl0xGNncd/2MgnOdWmMmFh4iXfKzL8OeJm54ASlNnUb1zcbdUTBCXZ
	 cYrumJ3Ja1wNRa8aUPy1cyY8i+8N4Ije+ITvChSmr8RV5/HSbIowqZC3+3azIRa47Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oJJNMkI/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCF360A5BE7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJJNMkI/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295132;
	b=hD8wjyy00c5NJsdQiJggLuEi7NT4cR0fkawaf8AWw++s6xkRN0qAsVv6QBf8WJzgkwUu
	 LEeqHnP4PQXdGEsM3jr4MBIYjF4wjEGCTqtJK+ku0fen1tcLiHF5erEvEBUhGWL4v0AoZ
	 8KSrTHLJTlPGx7nl2tbqissFly6UvCkX8zAF07g4m2cKAgFIEbh9fKbRre1iZxmucyIdG
	 SFbAVQudvrbWvh0lN/VRYoZDHKad+DPRGNsW4uWHgsT+byF4ZTal2QJmlneovyC7tjp7a
	 PYeO3cVGwkQlWogy+2mlfcrMnGGxXf0IwFmYRj3WxOfgy5WS/m2f1hbamyXP74XUURQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295132;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aV3F+u04rB8kY+qvCgQPsLiy+2Lbp6u0kbyYjrOIjc8=;
	b=eZ5aVKWBYpsPV9XNKN8MusXZmj5UNMbtAqEpHhJbagccms9en+OYMA/IsnxscoEoCM9f
	 n0TF25KvjxNcCk71OUgNuPqsv0D1RUfz6l0tdX/DoFJKSTJm2LiU5u3fmWNWJfSMrWdt2
	 hAw/8F7XRMi3iaYTQsk+2T36O3wVocNdCoEppo2C3u0cOn7YYGs7c4yTfjOu8x6+NlppB
	 ZFLJY68khniM6OGWUSycdOL8Tul8Yo+C+GWD9b8z/OPrAWEkF1wLMEsLiXGfp6sb5gPN3
	 Zv78FA078dD7Xf0TixjeEMkK+3oi/hzIZ6JcMiPFuR0re8tLFGrl0Zw7TUfyd6dWr0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FAEC1F008A4;
	Tue, 10 Nov 2026 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295132;
	bh=aV3F+u04rB8kY+qvCgQPsLiy+2Lbp6u0kbyYjrOIjc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oJJNMkI/MCK4C47Xdkh/KNzVOQZBjrQGDZ74g8ITP8yqA/eFXpZAtu9SZsYf7H0gd
	 nvEvsB81cIUSlbmZNNKeM3YAhb096nnGOBYS1tsZ5jerF/Hf4CXp9+9pbsxaoOIc55
	 cLI+QiMFnoBQDc/tIPRrdEJUAWwHFZcj6QCVeny1Rt89oOe6G68pMr6bHjqGuahIDT
	 1omFXtKp9z/wL97TWL53du0hBK6ONMeB7roUe18LsQLWhrtM7M4SxEAHoeBbrlpPBB
	 M5dx6i0wZEZp5mf0giQo0OiX8+XC1sB3gT84DOJP53Jlql8zH8RwoeGsxWg0pXBYqb
	 px7Q2/88lwoqA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E90C4489C1;
	Tue, 10 Nov 2026 07:18:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:52 +0000
Subject: [PATCH 4/8] drm/rockchip: vop2: Balance window fetches across both
 AXI ports on RK3588
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
Message-Id: <20261110-vop2-fixes-v1-4-d336e9dd90d3@gmail.com>
References: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
In-Reply-To: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295129; l=9192;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=PqCMoE45UUS/U/tVsrTv37SKSpBk4qVPNpLOW0m/y+w=;
 b=X0+PGJX1ejzvyeAtKbs8uLHG1u+p+kPxwpmC2TUu96hQB9rvsUiVvPpUitlMBB9qZFEBzvsxp
 jMi34UItgHHAZWFuWN86bnVAhEowkAvzb46jbq+z2hAgFTwLueQwE9Y
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The RK3588 VOP2 fetches through two AXI read ports. Every window has a
fixed default port in rk3588_vop_win_data: Cluster0/1 and Esmart0/1 use
AXI0, Cluster2/3 and Esmart2/3 use AXI1. The port is chosen by a per
window register (CLUSTER_CTRL[13] / ESMART_AXI_CTRL[1]), though, and it
is programmed on every plane update.

One port can't sustain two full screen 4K@120Hz layers. With the
console on Cluster0 (the primary plane of video port 0) and a video on
Esmart0 (its overlay plane), both on AXI0, HDMI 3840x2160@120 reports
POST_BUF_EMPTY on about half of all lines (~120000 per second) and the
picture is scrambled. The VOP read rate measured with the DDR PMU drops
from the expected 6.3 GB/s to 3.2 GB/s: the fetch collapses instead of
merely saturating. Measured at 4K@120Hz, XR24 primary plane:

  Cluster0 + Esmart0 (AXI0 + AXI0)	~120k POST_BUF_EMPTY/s
  Cluster2 + Esmart2 (AXI1 + AXI1)	~100k/s
  Esmart0 + Esmart1  (AXI0 + AXI0)	~90k/s (XR24 both)
  Cluster0 + Esmart2 (AXI0 + AXI1)	0, 9.2 GB/s read
  Cluster0 + Cluster2 (AXI0 + AXI1)	0, 8.6 GB/s read

Moving Esmart0 to AXI1 at runtime (with no other change) makes the
first case clean. Raising ACLK_VOP from 750 to 850 MHz, or changing
the NoC QoS priority or mode of the VOP ports, makes no difference,
and neither does the buffer placement (both planes scanning out the
same buffer fail the same way). So the limit is per port, and the
fixed assignment puts both layers of the most common configuration on
the same port while the other one sits idle. Lower modes are affected
too: the same port also carries Cluster1 for a second display, and
under DDR contention from other masters a 4K@60Hz port with the
console, an overlay and a second display underflows for short bursts.

Choose the port of a window when it starts fetching instead: estimate
the fetch rate of each active window (source size x bpp x refresh),
and put the new window on the port that leaves the busier port least
loaded, preferring the default one on a tie. A window must not share
an AXI read ID with another active window on the same port; the IDs in
the table are unique per default port, and mirrored between the two
ports (Cluster0/Cluster2, Esmart0/Esmart2, ...), so a window can always
use the port its mirror isn't on. A window keeps its port while it
stays enabled, so an active layer is never moved.

This is only enabled for RK3588, where it was measured.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 99 +++++++++++++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 14 ++++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c |  3 +-
 3 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 629ea7f11250..9aeb90c6aa4b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1231,6 +1231,98 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static bool vop2_win_axi_ids_clash(const struct vop2_win *a, const struct vop2_win *b)
+{
+	u8 ida[] = { a->data->axi_yrgb_r_id, a->data->axi_uv_r_id };
+	u8 idb[] = { b->data->axi_yrgb_r_id, b->data->axi_uv_r_id };
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(ida); i++)
+		for (j = 0; j < ARRAY_SIZE(idb); j++)
+			if (ida[i] == idb[j])
+				return true;
+
+	return false;
+}
+
+/*
+ * The VOP2 on RK3588 has two AXI read ports. Each window has a default port
+ * (&vop2_win_data.axi_bus_id), but the port is selected by a per window
+ * register, so any window can fetch through either one as long as its read
+ * IDs are unique on that port.
+ *
+ * A single port can't sustain much more than one full screen 4K@120Hz
+ * layer: two such layers on the same port (e.g. Cluster0 and Esmart0, the
+ * default primary and overlay planes of video port 0) make the window
+ * line buffers run dry, the fetch rate collapses and the video port
+ * reports POST_BUF_EMPTY on most lines, which scrambles the picture. The
+ * same layers fetched through different ports are fine. Raising ACLK or
+ * the NoC priority of the VOP doesn't help, the limit is per port.
+ *
+ * So pick the port of a window when it starts fetching: use the port that
+ * leaves the busier of the two ports least loaded, preferring the default
+ * one, and never a port on which another active window already uses one of
+ * its read IDs. A window keeps its port while it stays enabled.
+ */
+static u8 vop2_win_get_axi_bus(struct vop2_win *win, u64 load)
+{
+	struct vop2 *vop2 = win->vop2;
+	u64 bus_load[VOP2_SYS_AXI_BUS_NUM] = { };
+	bool clash[VOP2_SYS_AXI_BUS_NUM] = { };
+	u8 def = win->data->axi_bus_id;
+	unsigned long flags;
+	u8 bus = def;
+	int i;
+
+	if (!(vop2->data->feature & VOP2_FEATURE_AXI_BALANCE))
+		return def;
+
+	spin_lock_irqsave(&vop2->axi_lock, flags);
+
+	if (win->axi_active) {
+		win->axi_load = load;
+		bus = win->axi_bus;
+		goto out;
+	}
+
+	for (i = 0; i < vop2->registered_num_wins; i++) {
+		struct vop2_win *w = &vop2->win[i];
+
+		if (w == win || !w->axi_active)
+			continue;
+
+		bus_load[w->axi_bus] += w->axi_load;
+		if (vop2_win_axi_ids_clash(win, w))
+			clash[w->axi_bus] = true;
+	}
+
+	if (!clash[def ^ 1] &&
+	    (clash[def] || max(bus_load[def ^ 1] + load, bus_load[def]) <
+			   max(bus_load[def] + load, bus_load[def ^ 1])))
+		bus = def ^ 1;
+
+	WARN_ON_ONCE(clash[bus]);
+
+	win->axi_bus = bus;
+	win->axi_load = load;
+	win->axi_active = true;
+out:
+	spin_unlock_irqrestore(&vop2->axi_lock, flags);
+
+	return bus;
+}
+
+static void vop2_win_put_axi_bus(struct vop2_win *win)
+{
+	struct vop2 *vop2 = win->vop2;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vop2->axi_lock, flags);
+	win->axi_active = false;
+	win->axi_load = 0;
+	spin_unlock_irqrestore(&vop2->axi_lock, flags);
+}
+
 static void vop2_plane_atomic_disable(struct drm_plane *plane,
 				      struct drm_atomic_commit *state)
 {
@@ -1241,6 +1333,8 @@ static void vop2_plane_atomic_disable(struct drm_plane *plane,
 
 	drm_dbg(vop2->drm, "%s disable\n", win->data->name);
 
+	vop2_win_put_axi_bus(win);
+
 	if (state)
 		old_pstate = drm_atomic_get_old_plane_state(state, plane);
 
@@ -1416,7 +1510,9 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		afbc_en ? "AFBC" : "", &yrgb_mst);
 
 	if (vop2->version > VOP_VERSION_RK3568) {
-		vop2_win_write(win, VOP2_WIN_AXI_BUS_ID, win->data->axi_bus_id);
+		u64 load = (u64)src_w * src_h * bpp / 8 * drm_mode_vrefresh(adjusted_mode);
+
+		vop2_win_write(win, VOP2_WIN_AXI_BUS_ID, vop2_win_get_axi_bus(win, load));
 		vop2_win_write(win, VOP2_WIN_AXI_YRGB_R_ID, win->data->axi_yrgb_r_id);
 		vop2_win_write(win, VOP2_WIN_AXI_UV_R_ID, win->data->axi_uv_r_id);
 	}
@@ -3005,6 +3101,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 
 	mutex_init(&vop2->vop2_lock);
 	mutex_init(&vop2->ovl_lock);
+	spin_lock_init(&vop2->axi_lock);
 
 	ret = devm_request_irq(dev, vop2->irq, vop2_isr, IRQF_SHARED, dev_name(dev), vop2);
 	if (ret)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 1c2d7d97a6c2..f1e35967e67f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -29,6 +29,7 @@
 #define VOP2_FEATURE_HAS_VO1_GRF	BIT(2)
 #define VOP2_FEATURE_HAS_VOP_GRF	BIT(3)
 #define VOP2_FEATURE_HAS_SYS_PMU	BIT(4)
+#define VOP2_FEATURE_AXI_BALANCE	BIT(5)
 
 #define WIN_FEATURE_AFBDC		BIT(0)
 #define WIN_FEATURE_CLUSTER		BIT(1)
@@ -219,6 +220,16 @@ struct vop2_win {
 	u32 offset;
 
 	enum drm_plane_type type;
+
+	/**
+	 * @axi_bus: AXI read port the window currently fetches through,
+	 * protected by &vop2.axi_lock.
+	 */
+	u8 axi_bus;
+	/** @axi_active: the window is fetching, protected by &vop2.axi_lock */
+	bool axi_active;
+	/** @axi_load: estimated fetch rate in bytes/s, protected by &vop2.axi_lock */
+	u64 axi_load;
 };
 
 struct vop2_video_port_data {
@@ -356,6 +367,9 @@ struct vop2 {
 	 */
 	struct mutex ovl_lock;
 
+	/* protects the AXI port assignment of all windows (&vop2_win.axi_bus) */
+	spinlock_t axi_lock;
+
 	/* must be put at the end of the struct */
 	struct vop2_win win[];
 };
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 7c48b440cb29..83203d18865b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2577,7 +2577,8 @@ static const struct vop2_data rk3576_vop = {
 static const struct vop2_data rk3588_vop = {
 	.version = VOP_VERSION_RK3588,
 	.feature = VOP2_FEATURE_HAS_SYS_GRF | VOP2_FEATURE_HAS_VO1_GRF |
-		   VOP2_FEATURE_HAS_VOP_GRF | VOP2_FEATURE_HAS_SYS_PMU,
+		   VOP2_FEATURE_HAS_VOP_GRF | VOP2_FEATURE_HAS_SYS_PMU |
+		   VOP2_FEATURE_AXI_BALANCE,
 	.nr_vps = 4,
 	.max_input = { 4096, 4320 },
 	.max_output = { 4096, 4320 },

-- 
2.55.0


