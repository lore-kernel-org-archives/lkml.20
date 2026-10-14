Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24130ACF6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791939813; cv=none; b=gtRd0phz/Fz6GvvV4IJtVckKXkm3bqnlfpCZ6neIOcihyKSXYSmE0Bda8QAbMGY/96j+N+OFo0qeUNW9q15XHgdmNT8CQk1H437D7ZN7Y7kFhg4YMFnl+E4BoA9H3QjcXCNZ3E5qShwwGWMkQ3m0cQeIZSnuRului4qkPHh0lM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791939813; c=relaxed/simple;
	bh=W2m7Jca/rq/QUZdEC4unu3AGFLZj7t3LTmYrZHCk2pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvC2UOli0SXXafQiRSzOiuLJPREBmDeHaqUZdyS3sehMcNon6Yqmg5VfKihjUPlkl1bcHl+7mHx4Lt7YYIXvOse7o99ZUgg2OcpzmJRvVEXNXP36nOhjF2QD7+NKXcRFLojs7TA4sxPEaxac6f95joicLXvBah7QNyMlFrVymQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=enNfqkEV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="enNfqkEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791939810;
	bh=W2m7Jca/rq/QUZdEC4unu3AGFLZj7t3LTmYrZHCk2pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=enNfqkEVyaEg4hC9fz6aaYJoazvz++LlME7dC9O3utjuCj34vjw7E37EChby6PAvp
	 taQJ+6ASkYegEXlwO/k9ru4GFcNYaXJsgg/Pz8K9BYXxFgTGELgLMOjL4+aGrZnFYg
	 LMqii9F3ZD7gjPj8NNZuPpb4pL7ugPU+0z6AwZU7xXBdNz2zexUXojXmfN3w/05gjU
	 K+zYQBXutgWGL8NCzqXXS6q5kXFuKPh23TAHMKDisyndVaRCXf8kDtJjL61Pk9FoW8
	 IDdF1aAmDq7J3Q8IsEUX/ZSN1FTf0FvQs4pNTKX6EFC8N0xiZFB9YEFtSgbtgjmuk7
	 cPAc0bVLEOf9g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3480417E0A5D;
	Wed, 14 Oct 2026 03:03:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 04:03:10 +0300
Subject: [PATCH v3 3/9] drm/vc4: hdmi: Switch to .force_ctx() connector
 helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-vc4-common-scramb-v3-3-c68d58d959a2@collabora.com>
References: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com>
In-Reply-To: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com>
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
index 26c63ce2dc2f..7c921a444e98 100644
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

