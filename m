Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E756328A;
	Tue, 13 Oct 2026 22:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931937; cv=none; b=VME5fDlWkg7fADuhpGm21Dc0JxfR1H8wrkIGk/WcnHaDps7xzS1TOJbh3rnIv4NmRGkf8faAM9Q+rwaMKDNAxbATACYWhcFRdgTSUjqR/dYMe4jV7M2lV2qe/0A4JsvVDoSRS2+Zpql2KurzuurH9w78TvqXFEHry+7IKCH8r+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931937; c=relaxed/simple;
	bh=t4xm3scI4l7rWR2iBzxLstmE0RTUxpACdTblDz3oXNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6i6VnTKwb18/o/SZ4Do2CpwlEjArhv2QucRaqqUVN6sXG036WefZS05uU6JeBaBiFLO5MLydGPIHUHtyNt1wOB6m2y6m7XEUtmlsVaAJlPKC2t0Rk3glJNCHQU0qErzff2Sj/X65fks2N7jX5Z7vFhRlDkodg5uHMQYNUjdnv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CFVeqWm9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CFVeqWm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931919;
	bh=t4xm3scI4l7rWR2iBzxLstmE0RTUxpACdTblDz3oXNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CFVeqWm9bZ+b2qYqAyW6WEpI8vPhOwqd06tI38Fo7G+7VirPG5DQgRCp1R/nABSVf
	 qQkR8ZzJ2LDrzOleN4SQWWjn/3+1gVpn1cFFupHnNq/CE4/TZTjXWP9JzYv8Ddkh99
	 SOq3lCVBniNaGs5lVLfhwGI5xso2ykivJ8urd5cMpxubp41BZRR4La+NoP5e4dMm02
	 +LeLuMKMLWqjmEdj6+Tn2uNQZQIB5AmdZfQl9x1iHZYF36Q7PMqq+TA5mjhftczIVT
	 +usZqzS25oWkvGTZ2ARJG0braLal0GO55OFZEKUjClBPPAeKCTuWJ0/udB9/NJHQZT
	 SSy5iZ9kpRc9g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1726417E1509;
	Wed, 14 Oct 2026 00:51:59 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:29 +0300
Subject: [PATCH v5 12/15] drm/rockchip: dw_hdmi_qp: Do not mask error code
 in atomic_check()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-12-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

dw_hdmi_qp_rockchip_get_vop_format() calls
drm_atomic_get_bridge_state(), which takes the bridge private object
lock through the atomic state's ww acquire context and may therefore
fail with -EDEADLK when the lock is contended.

The DRM core expects -EDEADLK to be propagated up from atomic_check()
so it can drop all held locks and restart the commit.  Replacing it
with a hardcoded -EINVAL defeats this backoff mechanism, making
otherwise valid commits fail spuriously when multiple threads perform
atomic commits concurrently.

Propagate the error code returned by the helper instead of
unnecessarily overriding it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260902230603.AF5C61F000E9@smtp.kernel.org/
Fixes: a18aa0dd7a0b ("drm/rockchip: dw_hdmi_qp: Implement "color format" DRM property")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index f2a1ea8dfefa..db1933d75ced 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -203,7 +203,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 
 	ingest_fmt = dw_hdmi_qp_rockchip_get_vop_format(encoder, conn_state);
 	if (ingest_fmt < 0)
-		return -EINVAL;
+		return ingest_fmt;
 
 	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate &&
 	    s->output_bpc == conn_state->hdmi.output_bpc &&

-- 
2.55.0

