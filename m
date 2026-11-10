Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269625;
	b=MTacze61vHPxPjqbJZ6KI9kL7asyFgCJebJLKITI0PJhd44RJpzNQJCZkJwVUqUnRqz8
	 c7rj4trrgv5Co9A19lgMm6vrvUFlxDq6zIHY+w5IvN3ooXFcVcZYB8UtVH0W5EYqEQvmZ
	 c2AoCoYMRVefmETU90+2biCOmw4zMTjXYAA7toYZtzrkxgaTBroKIglOAXWqiR/mzgv4h
	 ZhwR1EWtg9jtMxYfaCuIcZTCNELgjumrt5KJ2Oui2LP3yfEnLrgEnK4lJMhhbpto1B4mH
	 5QA40ElPHgRJG0TJBq/OAetDheS54vuwmBoRxA1DV/ZHDBOY/yk/ISVu8AQlj8/vrvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269625;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=tswQ/CLtemZHO6IqI6LpuKp+yJnl7x0DAspaS1EfrL4=;
	b=yVfgQRmqumplqZHN3lWN+VXMxz9ys2sBvUO44V6aox4EidT/Y/3TN6LDfG24NflTy53R
	 1ilRZKty/VSqqELvvRVjHNu4L+Xi9mUejzQ7VptO2N6Z1zt+T9uVK+QTuZvSQolhWWhnz
	 wIabZxUsQDoa1fe6HBiCdNpjZPzS8xIOFlS8hQdSkNmtIznRSBbAOPSfoVhGWi0V1+zte
	 D7gASr+17u3Z65qcqSMJtSXoFDt/up9sTJIPVAaAwv+FtktsgMyMmYgmSwv7f++GmDUaw
	 QBoNbNsGX2OMnm4lhJD63FB+f4guMgG09FrgZZ5wTGQDndnRYy0UCBoMndYxLdt1whA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=K4TJrtc8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6460A260C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD6460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=K4TJrtc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794269623;
	bh=yTFbAtEPlinYRF6xM0XWDJ+6gQLj00Njxgv3jn4S/QI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K4TJrtc8T0P7Nr1ZLzv6/jplng2XS+aOm+YJM52PIIyW2Thu7Mo2+DCho3FhxQH9r
	 NlO7VI6TVB4ANT9Fxy9+2y96IzXLqJJIFzqZkoyHHLwmJV/V/AKYlXBDh1loo41UOf
	 njCLg2MaIrxAN8E5qmmOVmVXqEbETMCS5d7L4ZvRjapZF3mOo+7tHJ2VRAzrISE5UN
	 w3LeZhpyoF5XbEk8JK24po9GhSR7VmSUQMsBi8NsIBLjjoglEYgLJ+oD4jjteoW+4S
	 x3bAN7bGZfJPvmRIt6yU6jZj0TXzhl4MqH7MwwVI2xZqKoYYvJGrRn/VkhUpAquCIC
	 rd/X+Bwh++ZjA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 589E017E07EC;
	Tue, 10 Nov 2026 01:13:43 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 10 Nov 2026 02:13:41 +0200
Subject: [PATCH v4 4/9] drm/vc4: hdmi: Propagate -EDEADLK to the top level
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
Message-Id: <20261110-vc4-common-scramb-v4-4-eaa141a0da0f@collabora.com>
References: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
In-Reply-To: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Lucas Tanure <lucas.tanure@neat.no>
X-Mailer: b4 0.15.2

drm_connector_helper_funcs.detect_ctx() is expected to propagate
-EDEADLK so that context owners, e.g. drm_helper_probe_detect_ctx(), can
perform the required backoff and retry.

vc4_hdmi_handle_hotplug() instead runs its own retry loop and calls
drm_modeset_backoff() on an acquire context it does not own.  This drops
all locks in the context, including connection_mutex held by the core.

Drop the local retry logic and propagate -EDEADLK to the caller instead.
This aligns VC4 with the expected detect_ctx() semantics.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0e6696644687..fc9d5fe07849 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -343,12 +343,11 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	return drm_atomic_helper_reset_crtc(crtc, ctx);
 }
 
-static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
-				    struct drm_modeset_acquire_ctx *ctx,
-				    enum drm_connector_status status)
+static int vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
+				   struct drm_modeset_acquire_ctx *ctx,
+				   enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	int ret;
 
 	/*
 	 * NOTE: This function should really be called with vc4_hdmi->mutex
@@ -367,17 +366,9 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	drm_atomic_helper_connector_hdmi_hotplug(connector, ctx, status);
 
 	if (status != connector_status_connected)
-		return;
+		return 0;
 
-	for (;;) {
-		ret = vc4_hdmi_reset_link(connector, ctx);
-		if (ret == -EDEADLK) {
-			drm_modeset_backoff(ctx);
-			continue;
-		}
-
-		break;
-	}
+	return vc4_hdmi_reset_link(connector, ctx);
 }
 
 static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
@@ -415,10 +406,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 			status = connector_status_connected;
 	}
 
-	vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
+	ret = vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
-	return status;
+	return ret == -EDEADLK ? ret : status;
 }
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)

-- 
2.55.0

