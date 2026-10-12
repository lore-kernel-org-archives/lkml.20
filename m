Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4AB4DDB35
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844711; cv=none; b=HrDCDpIzZ+6qtu4LwjY3PVsLSP1l/boaAqGoVijCE14aSXTGB0MZylmut3GBjh5Kxw3tLfatBRpcc13MyJB/UtxSVQ7loMORLkzEdbCajbSHBiAYJzFCc7Pf2PbUDnncgcDSacV2hjrdSt5a3wgvS01SszQ44cvPELKYDRCE2vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844711; c=relaxed/simple;
	bh=IDHHGRFWTIa0P6tdIQmYlDnWb+c7bekejJB4Teo90EE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgZTKBs9VoOzFWSOBy9QOVaKSsH7RvhT+QPHFo9I+OAu21WTRhUq+VXcQ9EZgofb2ZTb7pOqQk6ROK+Zig8aCIOa2MuA+waCv+6op1a/G8EsL7xW8p1K7+BF7jgT6w95Zl8bndOsPLVBQV6VUfPUdNzGu9TdnIM2H0y/t+uXhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eQWoClgl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eQWoClgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791844702;
	bh=IDHHGRFWTIa0P6tdIQmYlDnWb+c7bekejJB4Teo90EE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eQWoClglp/lTl+SuSsLcvmFK9Dw1r7Bu1qz4fjpESjDfCN80FlAmeoSCqkGgycPbN
	 GhKd/fhr6yDy8cB8xn52APDTwOIqnJDOGQsJKjgIe3bPnlAYX6UjclUPKfmkwdVeXK
	 6Ci2y0Gvtkayd8+yOsgbKVB0CInq0M1YlClQWOZk6b6/9HvALDxW7UY20iLYd4Hfev
	 pJGZpQL7N9nbjn9cKfPbc72fkQGuAHMMdv8xXV43bR3NU7W1Mo1LSPRMike4eEF05O
	 CsAYNOiAFoQpU3m7w3gteiyZq3xjPrS8/c5FUnBTqwhIY6FoNK9nwikZgt9zwJrOHA
	 S5G5YImupHd5g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49B5E17E09A2;
	Tue, 13 Oct 2026 00:38:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Oct 2026 01:37:45 +0300
Subject: [PATCH v2 5/8] drm/vc4: hdmi: Propagate -EDEADLK to the top level
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-vc4-common-scramb-v2-5-a41d15e131ad@collabora.com>
References: <20261013-vc4-common-scramb-v2-0-a41d15e131ad@collabora.com>
In-Reply-To: <20261013-vc4-common-scramb-v2-0-a41d15e131ad@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
index 922a6b99891d..59af0d068457 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -344,12 +344,11 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
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
@@ -368,17 +367,9 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
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
@@ -416,10 +407,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
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

