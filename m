Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798800;
	b=pGNz7i4ULMZXQ1P3HEa9kVc7u+Zv5W5r21siy8BFTHw0Pz/jzxuEhr6i7lVQH1VvFXDp
	 DkBd6W2KGhEuIhazIDj1eO8iuy31EBFBUMocqLVfeLCGQQwAQo8n16JNC9e0KsLiaO/iA
	 AJqQcfDP9fiQiyAeH1Qgz0mgBRKmks1vj0ta48Za81x9nWVW9PRmfefi78gZjvng14LFp
	 yuHkWAOyFCpBiqPqZuqNI2Fh0wrWTDmFkjPwuzbD5Uo3qavajxzq3u+gkBzVJpkntlLZy
	 qMDxFkW2iluHaiMHo8uMGC9tgU0m6zG8/Zyr9QneuZWux+7c+WXMFa65iRDzQCh5oTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798800;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=8VWJRnYdDgWYkOmrdLY6+pVRG5C1TOFKHJS7YbR/EkI=;
	b=z17Fc/F+3yR2ykhNhsZU81Bd4QpS3dBpMe/Tnh/kfBSMCvwopOxPay7TeNOik5dGDHkz
	 AJC+dpslN2KceNQvetLMLjlkxzWEIRJokbYC8c501aa2q3lVNszxNM1CvoxoyONlVv4Un
	 cLLalTnlB+FOStxgdsRFgnbXJJuMTJ7TGjsV/VFil0UjbwPSDP3lfGHFjHBO4NpXWlGv1
	 6zpZ/7QdTQLnWo1zGgZW2A8MD4qxe0D1rGGJsFDEmd1Tq0OxP9fnDglJ6Bn3fYC5Y32pD
	 Xmpsimm5E0xH6r/pKJQTG722CWqGbnl+sHhUQMFh/pJdPyz/11N3sMY6XVHPNNt/u3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RtFrHXQt;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D33606D80B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D33606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RtFrHXQt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793798797;
	bh=odezEJtCWSTeuZEkWqlhIsVy5xrCmes4RvPVe14Uicw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RtFrHXQtUAsk3aPL9EFJoE+VFt+0B5tTnL1oZyD55di3QHr/wAn16NClUj0gd/ARV
	 nVGx6uBM2MK7Qfk6t5zefbOSPzGLWfzOwg+G6QzhK6DGZ+MDz7tCMnE9qQyzQtyrq5
	 rdQ9bLIFSJ7U42yeTDEahNxApHGBjRKydcBh2+/EcixtOa1WukZYMialWUAXPtb0ll
	 yJhG82jWmra8fubPgM8Grlao054sZIi4PrpSqERbJRFUs0uz6txNWWkDl3uDjOzKIZ
	 FG2z6CP7psrKgwqJGTR/AYAloErD0QptLHbSUQ+wCCPxFg2Sm7tqla2ijBq52sreA6
	 OxvZhsFiic6lA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B711B17E0418;
	Wed, 04 Nov 2026 14:26:37 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 04 Nov 2026 15:26:21 +0200
Subject: [PATCH 2/3] drm/display: hdmi: Use committed state to decide on
 SCDC resync
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
Message-Id: <20261104-hdmi-scdc-scramb-fixes-v1-2-16a9bb3d64a6@collabora.com>
References: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
In-Reply-To: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

drm_connector_hdmi_sync_scdc() uses the scrambler_enabled flag to decide
whether the sink-side SCDC status is worth checking on a hotplug/detect
event.  That flag tracks the source-side scrambler status, which is not
necessarily in sync with what the committed mode actually requires.

In particular, a source driver may deliberately set scrambler_enabled at
init to force a disable at boot and resync hardware left enabled by the
firmware, as vc4 does.  If the pipeline doesn't get disabled afterwards,
e.g. because no display was active at probe time, the flag remains
stale.  A subsequent detect (e.g. an HPD event) then finds scrambling
disabled on the sink while the flag claims otherwise, and triggers a
CRTC reset.  This results in a one-time spurious flicker on an otherwise
correctly configured non-scrambled mode.

Verify conn_state->hdmi.scrambler_needed instead, as it is computed
during atomic check and reliably describes the requirements of the
active mode.

Fixes: d653818324ed ("drm/display: hdmi: Add HDMI 2.0 scrambling management helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-170670@kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 872f7e32e8d2..974d5de6d380 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -653,7 +653,6 @@ EXPORT_SYMBOL(drm_connector_hdmi_disable_scrambling);
 int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
 				 struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_connector_hdmi *hdmi;
 	struct drm_connector_state *conn_state;
 	struct drm_device *dev;
 	struct drm_crtc *crtc;
@@ -663,7 +662,6 @@ int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
 	if (!connector || !plugged || !ctx)
 		return 0;
 
-	hdmi = &connector->hdmi;
 	dev = connector->dev;
 
 	/*
@@ -677,14 +675,21 @@ int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
 
 	/* TODO: Also handle HDMI 2.1 FRL link training */
 
-	if (!drm_connector_hdmi_scrambler_supported(connector) ||
-	    !READ_ONCE(hdmi->scrambler_enabled))
-		return 0;
-
 	conn_state = connector->state;
 	if (!conn_state)
 		return 0;
 
+	/*
+	 * Rely on the committed connector state rather than on the current
+	 * scrambler status: a source driver may force scrambler_enabled at
+	 * init to get a disable at boot (e.g. vc4), and that value would
+	 * remain stale until the first disable actually happens, leading to
+	 * a spurious CRTC reset whenever the active mode needs no scrambling.
+	 */
+	if (!drm_connector_hdmi_scrambler_supported(connector) ||
+	    !conn_state->hdmi.scrambler_needed)
+		return 0;
+
 	crtc = conn_state->crtc;
 	if (!crtc)
 		return 0;

-- 
2.55.0

