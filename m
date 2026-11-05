Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840477;
	b=dN6sFSOxS7enJus86dBQGHiQHr/J18p+6xLISbkKQYjsyltgP47nsvI8XN4xCUXzgDAZ
	 nuFberrekJLEcbNTOYrm7dIxo4Z2XuBYdfWjGsIKmZdLW+BZ0S9jV9ll68j/PSjMCRRVz
	 JG2dvR1VkYI9PH9XFMy+gju+junUBFhFZBvGqLV0RQHnWyDTAOKr3qg4aQzltU2P2IpgA
	 dYp9ftk9UEJH6MpIa7jru17y8O1eHZiSisY7FRZS4QfGOzFH2g2MUUwOqh4bfiBOCvIFR
	 l+wN7kuyV33U65nlo74fRwHp4wqgVVDJzDbpYeiYSrdnZmXKuQuwuHYYN8YooV/gVAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840477;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=SYtilPzqPXCnIDuAgNHfH0KQUIcCbca4y5FMXD8c9rs=;
	b=5WFsHR2P91zYW1b/NxDp4Em2dhNyXcb0v5SgRNCItP/1nwMmatzSIbVU5VrNUHZPui4m
	 ZuelfGg/deRpW9/LiMrmr3J+0XIJgkRYUn5BO3jWSuAlA2k1eyB68R344q44WjGJ5Ecfp
	 mWraHdipJNePZvrR0S4AjnUScnfT/xbP8oM6M0T4ERXRXWpkF+gxtTSyO5CmHNK4anjgp
	 JC+ihZ+98c5/kd70gnVFq8xWDkEFiHoHg1qQxAiXYvoOCs1JfGw0178YGCO4+35NXbSwm
	 1NYZQDsEhJQ5CatRPUNLIka8UfQE//ixMxLZ0Z7EPwd9lrK5UqVAoNa7zcFrwjChp8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KUfR5Obr;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57AA606EEBF;
	Thu,  5 Nov 2026 01:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B57AA606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KUfR5Obr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840475;
	bh=t4xm3scI4l7rWR2iBzxLstmE0RTUxpACdTblDz3oXNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KUfR5ObrP8jFka/2UPUUWjo5o+FDtK93b3osH2OAYgNva3uJp9kGslkH1OJPda5Zf
	 15X8CZOFNP1JNd9dCYuNZEnWFFVWRV3JrpqciB3HKcITk1exygNn1GPePk2JiLZIqy
	 6LiQEhNSQKDr4q5w8frc2zPmaLmytXKMtIYys4O7CaqzfsjbFZfi+PKeGal9ZXjTR8
	 2aOHtllwVzPI6ymja4nt2se6eWSmqQrg96a6lqDvy0zSfwfzPdLW84D9dTz2l55iyb
	 As6jY4tda6vDPVLhwlAfVOQybrhbMNzJC/cveKrTF6i433O+G7wby2GR2vUOTHaOmq
	 KvkFfAhG1aXCw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 038DD17E0CE8;
	Thu, 05 Nov 2026 02:01:15 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:46 +0200
Subject: [PATCH v6 12/15] drm/rockchip: dw_hdmi_qp: Do not mask error code
 in atomic_check()
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
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-12-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
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

