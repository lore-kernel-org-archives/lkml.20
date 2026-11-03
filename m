Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793736173;
	b=16sseJUIiTxqxOAQQZ2ELPupY8fPiYa4WzKq+aeSDl77Ft8DbLqFwBsQUpmpPr9BJqUU
	 I6RORW4qGFExbyuG0GPlmZIUnFtgwR/1It/CZ7kkvv3465dHnjSZ+ZOFYoc5E3Fv8g4jO
	 QAzlRr3O210ZbRrZrytTlK2CtWgzATafYnuH3S55jKETWdlcq0VR8GlXalV2wxrtK37gt
	 U2STAunQJv0j+nh5RHC7iLkdaK2S450cr9PpCtjszP2nx3lNSzDrDS4hgBtV3HgQnXSg6
	 YNsYK0814P1GDreGj1A+nuOxfLRm7VVy2JANxxzjxuO33AxZQxQulWiKh0Sn7z4KCYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736173;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0IULrKtmWKoiZT+6TkcJdwDnBY1ZhJuqnaD6U4Ev2LQ=;
	b=UhtIAKt/T/H/j5YIpUahj9Mw3aWIkbP4tG7V7P9EZeHImUdA97Jt4GlJ62wuARuaGaXe
	 ttHh5U62wUnTiIgLDM116dhxF2e6gWLtYBahjvgWfCkfbJUBTS1HYhJ8xfbP2GKSTKypd
	 wIlcq9ZAHHGikQIrmMdjQCoDmmEbef4Sc4QgjZCQaviqdzCTMj+B+880W5oF8p8zyxoDk
	 M0i05ApE6j21lENrZ9ru63ko3RmFty+0CcbB7z/2nVpC8cRurXA+Dmm4ZV48vmPAzeCG2
	 uxUak0ebC55zRMdurtaSh/C3imNYO8iOYdORB01AXhnI8HkAJGSpmaSO9ykSTP14Zlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyv2MkFh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B64606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyv2MkFh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793736173;
	b=v/dbxQbcuYAAFnWfSCeUTJrw1xjP3RgwbV0SVEb3bK81zdAt5h98I3iVfpMXTKp8N1Q8
	 8DPPyC0B622Y5TbWPrAUYKKw3YE9HP8COHIQJNLgOuMMFNYQud2MXwwqhUoYKGL8q20m7
	 ujXS8WzYdpBZluh8rsknwtNLy1G5hbHhOD8sZs+pdBW+2U8O2B+60w1lieXQIuuCxlEHR
	 Z5onRrsLf8wvp88jDNOeYpM1xUksEkVyt+y0t81wrty4Lb9HEzTJpxjwMib1kQglErOOj
	 Z59CsnQMQ9wXFFhTeUvRUfdjaqypXYqDvZoY/+hoz6LAU1vyh5RZHI6PbMI9tUc1Wvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793736173;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0IULrKtmWKoiZT+6TkcJdwDnBY1ZhJuqnaD6U4Ev2LQ=;
	b=EV+NRvbEzSjd3YByo27ND6OpEY3z4yd9JqQVYC5bPfJ9CLtpb4YIITbPwHP4Af6LI1iU
	 buOalaV9UYxtR/fdcrLmqwDQFo5OLwi5rYqzHpXYiOlM3ynkkr0G9JtcoYFCAbr2/3l2w
	 aSlgAmxCJxlrmF+h9qyDDfIuxJ0UvKvGBLPoCnP4ugAusbcMRb4gx9kwXZWaME6w7V7OM
	 pa7qpVrD3FG4M7tSwJv5/E+ZgGqkLGKPRgE7N+6zcORSAQGjZfRTDhn6IKvTdhvU4GMhd
	 /r+IkstD24aMQDamj5dopJFJ2vtRTHMeLzfDzWmB2u2FAORoYv0Ii2cLVk7698FoJyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57FEA1F0093A;
	Tue,  3 Nov 2026 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736173;
	bh=0IULrKtmWKoiZT+6TkcJdwDnBY1ZhJuqnaD6U4Ev2LQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hyv2MkFhuKwxl4fa83ztzly6/CHjHDn0GC+3d0EzDkHiJ5bnHkQEKvA6eaEEUxyME
	 +psVQzCNWvDKXOXvyKCa7FEw/L52xw8t/C42PN6J2oP3AGF2QoEtjYA8K7vvZsC6t7
	 Uce91c9H3KC9VP5ohKXCUKLkOQzptcgc/8gEP9djh02wORbrMj/PO/zGnPte17ZcI4
	 9KDoMDHvidm1dwm4umdF3u2DV+qsCwz34v201gtc9WkjD3DYBh4QmgEj/grfWoe0eY
	 JbuPJs3k/fFpvD2XZ3Jz9S+MXMtHRTMFLoDZnQwe/jcGbwwaafPR/DzfTBC6WPmf87
	 fN+2bGj8O3yWQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DE3FA46AE5;
	Tue,  3 Nov 2026 20:02:51 +0000 (UTC)
From: "David R. Hedges via B4 Relay" <devnull+linuxdev844.thelittleman.net@kernel.org>
Date: Tue, 03 Nov 2026 14:02:48 -0600
Subject: [PATCH 2/5] drm/nouveau/kms/nv50-: don't enable a DP output with
 no trained link
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
Message-Id: <20261103-nouveau-dp-relink-v1-2-7ee88c7f1e8a@thelittleman.net>
References: <20261103-nouveau-dp-relink-v1-0-7ee88c7f1e8a@thelittleman.net>
In-Reply-To: <20261103-nouveau-dp-relink-v1-0-7ee88c7f1e8a@thelittleman.net>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>, Ben Skeggs <bskeggs@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Danilo Krummrich <me@dakr.org>, 
 "David R. Hedges" <linuxdev844@thelittleman.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793736171; l=7227;
 i=linuxdev844@thelittleman.net; s=20261103; h=from:subject:message-id;
 bh=fTBppiTsiT2GDYHmvIFueQkmv7rwIKMHTWHZcuUcfpg=;
 b=qiwvuDt4IUf4VuhzEePZdh9kjlE33AMdMLJwLxilaOBLpr6+JSG9hy9QecBdkjbVvbPZAUSSZ
 GwfHqduU3i7DccM1sP6IYHNIqgeuE3sZgc9FZHZkqtT0bBEFsMr7l+b
X-Developer-Key: i=linuxdev844@thelittleman.net; a=ed25519;
 pk=Cynzuei/w0GLdh3LuNJdvH7aaszLrHSxY5UyujS7l+g=
X-Endpoint-Received: by B4 Relay for linuxdev844@thelittleman.net/20261103
 with auth_id=1397
X-Original-From: "David R. Hedges" <linuxdev844@thelittleman.net>
Reply-To: linuxdev844@thelittleman.net
Content-Transfer-Encoding: 7bit

From: "David R. Hedges" <linuxdev844@thelittleman.net>

A commit that only turns a CRTC back on mustn't fail atomic check, so
it still reaches nv50_sor_atomic_enable() when the sink's link
capabilities have dropped below what the mode needs, or are unknown
because the sink stopped answering AUX.  nouveau_dp_train() then has
nothing to train, and the SOR is attached to the head regardless.  On
a GA102 with GSP-RM 570.144, mutter turning the screen back on while
the monitor was switched off (HPD still asserted, AUX not answering)
did exactly that, and the display engine hung: "core notifier
timeout", after which GSP stopped answering RPCs.

Have nouveau_dp_train() say why it failed.  When no lane count and
link rate can carry the mode, leave the SOR detached, set the
connector's link-status to BAD and send a hotplug event, as the
link-status property's documentation describes.  Userspace that
handles link-status can pick a new mode; userspace that doesn't still
gets the hotplug event and reprobes.  When training is attempted and
fails, the output is enabled as before; only the case where there was
nothing to train changes.

The head produces no vblanks while the SOR is detached, so until the
sink is back and a modeset restarts the link, each commit to it waits
out the window channel's 2s timeout ("wndw-0: timeout").  On the
GA102 above that was the only side effect, with and without GSP-RM.

Link: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/515
Signed-off-by: David R. Hedges <linuxdev844@thelittleman.net>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 10 +++++++++-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 18 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_connector.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 13 +++++++++----
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  2 +-
 5 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8af01de822d5..7f55c016d846 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1843,7 +1843,15 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_commit *st
 		nvif_outp_lvds(&nv_encoder->outp, lvds_dual, lvds_8bpc);
 		break;
 	case DCB_OUTPUT_DP:
-		nouveau_dp_train(nv_encoder, false, mode->clock, asyh->or.bpc);
+		/* Attaching the SOR to a link that hasn't been trained can hang
+		 * the display engine.  If the link can't carry the mode at all,
+		 * which atomic check only rules out for a modeset, leave the
+		 * output detached and tell userspace the link is bad.
+		 */
+		if (nouveau_dp_train(nv_encoder, false, mode->clock, asyh->or.bpc) == -EINVAL) {
+			schedule_work(&nv_connector->link_bad_work);
+			return;
+		}
 		nv50_sor_dp_watermark_sst(nv_encoder, head, asyh);
 		depth = nv50_dp_bpc_to_depth(asyh->or.bpc);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index cc3caf8de64b..cae4e35c30aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -398,6 +398,7 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	nvif_event_dtor(&nv_connector->irq);
 	nvif_event_dtor(&nv_connector->hpd);
 	cancel_work_sync(&nv_connector->irq_work);
+	cancel_work_sync(&nv_connector->link_bad_work);
 	drm_edid_free(nv_connector->drm_edid);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
@@ -1261,6 +1262,22 @@ nouveau_connector_funcs_lvds = {
 	.early_unregister = nouveau_connector_early_unregister,
 };
 
+/* The sink isn't getting a picture with the current mode, and userspace may
+ * need to pick another one to get it back.
+ */
+static void
+nouveau_connector_link_bad(struct work_struct *work)
+{
+	struct nouveau_connector *nv_connector =
+		container_of(work, typeof(*nv_connector), link_bad_work);
+	struct drm_connector *connector = &nv_connector->base;
+
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] link-status bad\n",
+		    connector->base.id, connector->name);
+	drm_connector_set_link_status_property(connector, DRM_MODE_LINK_STATUS_BAD);
+	drm_kms_helper_connector_hotplug_event(connector);
+}
+
 void
 nouveau_connector_hpd(struct nouveau_connector *nv_connector, u64 bits)
 {
@@ -1383,6 +1400,7 @@ nouveau_connector_create(struct drm_device *dev, int index)
 	connector = &nv_connector->base;
 	nv_connector->index = index;
 	INIT_WORK(&nv_connector->irq_work, nouveau_dp_irq);
+	INIT_WORK(&nv_connector->link_bad_work, nouveau_connector_link_bad);
 
 	if (disp->disp.conn_mask & BIT(nv_connector->index)) {
 		ret = nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_connector->index,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index eb292d2ba4bc..3109278d36ea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -134,6 +134,7 @@ struct nouveau_connector {
 	struct nvif_event hpd;
 	struct nvif_event irq;
 	struct work_struct irq_work;
+	struct work_struct link_bad_work;
 
 	struct drm_dp_aux aux;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 019af307c669..9bc24f3914bd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -401,14 +401,17 @@ nouveau_dp_train_link(struct nouveau_encoder *outp, bool retrain)
 	return ret == 0;
 }
 
-bool
+/* Returns -EINVAL if no lane count and link rate can carry the mode, in which
+ * case nothing has been trained, or -EIO if training failed.
+ */
+int
 nouveau_dp_train(struct nouveau_encoder *outp, bool mst, u32 khz, u8 bpc)
 {
 	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
 	struct drm_dp_aux *aux = &outp->conn->aux;
 	u32 min_rate;
 	u8 pwr;
-	bool ret = true;
+	int ret = -EINVAL;
 
 	if (mst)
 		min_rate = outp->dp.link_nr * outp->dp.rate[0].rate;
@@ -434,13 +437,15 @@ nouveau_dp_train(struct nouveau_encoder *outp, bool mst, u32 khz, u8 bpc)
 				outp->dp.lt.nr = nr;
 				outp->dp.lt.bw = outp->dp.rate[rate].rate;
 				outp->dp.lt.mst = mst;
-				if (nouveau_dp_train_link(outp, false))
+				if (nouveau_dp_train_link(outp, false)) {
+					ret = 0;
 					goto done;
+				}
+				ret = -EIO;
 			}
 		}
 	}
 
-	ret = false;
 done:
 	mutex_unlock(&outp->dp.hpd_irq_lock);
 	return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 4422c6185d49..9366678e7d05 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -156,7 +156,7 @@ enum nouveau_dp_status {
 };
 
 int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
-bool nouveau_dp_train(struct nouveau_encoder *, bool mst, u32 khz, u8 bpc);
+int nouveau_dp_train(struct nouveau_encoder *outp, bool mst, u32 khz, u8 bpc);
 void nouveau_dp_power_down(struct nouveau_encoder *);
 bool nouveau_dp_link_check(struct nouveau_connector *);
 void nouveau_dp_irq(struct work_struct *);

-- 
2.55.0


