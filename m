Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD55B4DA9B9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844711; cv=none; b=iGlRuqk+X8FOKIXgWYvu+8x8BKmO889f6qP21sUOcGQ7NtWa4PvuW4mng84v0YfYDdQ46eUqu1f+pGUFWWmFLbTpf60x6Xb15Xza19HRdm43moXVpLcnoMWBWXs9R/CY/EieVrJDxDAEcGz+poGOcnJbLlz5y+kKz3d2pD1bUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844711; c=relaxed/simple;
	bh=kxO6ZDWl0vMlcYgUD8Iwk9kBD1FrezQM08sAxXxT4Ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6S5c72V9t34/3wthshnbQhCmjG9Oww9Xz8ltmwRyZyx6W5EA8jGd1YdCEdg6D9mL9bvnjdo63owyu8ZtV6Jbuo7bQG2Hpp47blGYfZeqCcNEyOzrxGrAYrUZyTmrpWaymmePyiLJAeQE0A8fS6GCuhVPO/uI+oo2eIworWF0sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O0o5LIUB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O0o5LIUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791844701;
	bh=kxO6ZDWl0vMlcYgUD8Iwk9kBD1FrezQM08sAxXxT4Ec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O0o5LIUBHEYhgclUP2U6YRlW5S4G+K9HY/WCngZ1f4n/tSkGYbk4Ik7O3PE/TcDYM
	 YOyjtEvT3ELNtB7NpVodAtXHhb/rrdXG4btkbj4THb6jSRkOtKwlLOTdNfiHLWfv+s
	 C3s+3G8s9XCrP17ONCymAZeLxPfqwLdlK5Cy3ZYbiD0nJ+DQl9MpfYyy7USjYnK7D5
	 rj621P+mIrgspzjdhaqfOOijSn+JEfthzjn9JxTrmyQrKwx4Cqg6QjsdCTzidM+4Rh
	 Ie3MyC2Z9S8xeYW38QpaMYNB0kvaVSN/0XbvXOtBpdMdG+zWtaElO8Pv0dYrdoXM7J
	 sdAhD7yBv5cng==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 844B917E0962;
	Tue, 13 Oct 2026 00:38:21 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Oct 2026 01:37:44 +0300
Subject: [PATCH v2 4/8] drm/vc4: hdmi: Switch to .force_ctx() connector
 helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-vc4-common-scramb-v2-4-a41d15e131ad@collabora.com>
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

Use drm_atomic_helper_connector_hdmi_force_ctx() as the .force_ctx()
implementation, so that the acquire context created by the probe helper
reaches the HDMI connector framework.

This is a prerequisite for converting the driver to the common HDMI 2.0
scrambling infrastructure, which implicitly handles SCDC state recovery
through a CRTC reset when the sink reconnects while the display pipeline
is active.  Note that this does not interfere with the local SCDC
state-management implementation, since the driver's scrambler capability
has not yet been exposed through the common helpers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 60c2c655b2e9..922a6b99891d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -505,7 +505,6 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.debugfs_init = drm_hdmi_connector_debugfs_init,
-	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -514,6 +513,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
+	.force_ctx = drm_atomic_helper_connector_hdmi_force_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 	.mode_valid = drm_hdmi_connector_mode_valid,

-- 
2.55.0

