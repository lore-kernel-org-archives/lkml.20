Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632461;
	b=Dls7LVq1/d5MDxhCG5CH6RFC6JVD6BcRJheZYazQcMQDcfurhkXFORxNCN6hVTdku++6
	 ilBLFkhnPRZENBvXu9YCbCZ3ZgtDc3yX84Ik0iVqkFFqWkrHBJOWH3ERd9DBk+HQCVt4f
	 nTtbU6mM6M22iqpi3AR+kvW4zCg79xjlqWLCuxTdZhK+39eXIiDyz6pPeClY6QUBii6Q0
	 FSSws3DfXl7luXZrx1Dp1OXJc0r4SNVfWMzsqCkHEbMseRnXu2T2a8RYX3NURc0DcvRMk
	 iMxciMu0wWAeGtxrzJIqtV6Iuik0OXsDdyWHwTdYhgD86UEJ3q9NQ/qm3P29HYks8TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632461;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VprmHzKoevFYyO2zpBf3Oq2WFfWlTuyEXWwmu0tCtkw=;
	b=LFDYuD9UYnmgtUfC09UE/A/nf/ykLiLxBevFUl/2AzaAYwb6SObVku2KGXzB3TnlUHjs
	 e7Adw3+DIBLuLp+g1cdt/HcqHh+DVknxaYZl0ZMLltlTa4+p8W0KTdKLj4i14KjiLquk4
	 Ag2Im8Rh/2RbRVSRuGkEPZfokI0gpmzQRRbqmDOdn1+DGW0z/gIt1XjfNknIh7r4NJUTC
	 N3ypHGvO6517fImrTk9LKjS1K22+wohcDbXqtJh5HwAoPwG21lbaLdiI6DSj4CP7SBuld
	 0rq7mUuGRR/u/2L54juQpirmaCo+gCEErXJccBS1hF2pZqi5/KSObAtog0tgZYGSOzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=C9ylrcxn;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38AC606A8B1;
	Sat, 14 Nov 2026 05:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38AC606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=C9ylrcxn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=QxdMOism8SgOCS21Pd4nTNnv0OG6gglB5ydp900h808=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C9ylrcxnOe6qFQsW7w5p6iB73+p+F9WFdttzRktJm0Gz3QPt1me2gbKOZX2LJoyJ5
	 WrbwhtQ/bm38NBS9909QE0u/DJoodlHz9ZxJakVvJCEOG/KHwa7/fIWAyqr8S8WeTg
	 Y1BAVcCLcGgyjT22zTq2eFkfhxIGqr2tuqTywzy4KjiXhe2l8OYl+0djHNMiRO4R/j
	 wWxakRLH9xL7hZ2LCBpHnB86QPbODRdhyHJACxYieVhDoiUuYQ4dPPLSgUulOi3XA0
	 KdKJKOzuR+/DeO0/TxmJNC+I+oW7kRxMfki05T40Oa3jDeWfLcLFEmDdZKfqckX64B
	 iCUeM80vdhjkQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B645617E3BD1;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 18F89480047; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:42 +0100
Subject: [PATCH v12 09/23] drm/bridge: synopsys: dw-dp: Support
 MEDIA_BUS_FMT_FIXED
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
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-9-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3869;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=QxdMOism8SgOCS21Pd4nTNnv0OG6gglB5ydp900h808=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wfglAOEVNJTvKhHq999+Q8N9n2wXR9et
 JNR4P8DgheS/IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaKm4P/0lrFXviKzssjcyuHIGiSo66qrpi7GBtUwUZy5lI0ZXbrZD88OPNhhk/VzqOGj82kJX
 uZSNYFwYOTEIfZpfGWSWH9OnG/lY968p5LppZmPAIYiv1/8yuO5NbYdz5OYZKhAoDXmiyF+FaSD
 KNNDy++MpoC+6QVD+6wx33vaMddEbL2tP5YsaNcP+uZSyBb2UPknjYIA+y1PNdUnFAPHFQ2Fx5O
 IXnZA7U79zz2tn1NuqMuJmkd4WHkPlpoDx7bOvFBF5yVRO497O+nOx+P4cmoDTUBAxZHC6E9Exo
 H53f75r2gJYbKyD9epp2/fTFEIgqSiAJawqH8Ai8y+o8/3EYGSWYHANN7zsa/Cssh6KaRdPzQqm
 eMI+MoJtN7wm/vm7YMhqIi/wJs1F9qX2IB26BS5S3uK7dSzHeHIjg3kIyD8NJhqeHUutpZsw4XI
 yjuiahRWxhoOsun/VYUhm3Jluy+bfbXmWNBTuS9aWTySWD8dRRyMo30nxUw/zq3YjgzmrxwSDPS
 0apuKVFnHTnIUpBR0QCmPpFJF7iY6/UFei5FjjqU07Esvzid9zUr6Uv4lLZJsQGr3aO8MxF2zAh
 jp+cAbhBxt7Os64GaD2eaqMvta+R1oiEp9ts4IpZUpf59o26V5Z97kzu1LVFl0Rflz6JbHeNXuo
 1VF5U6MGkYNdAL5C/AFs5sQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for MEDIA_BUS_FMT_FIXED, which is e.g. requested for USB-C
DP chains as the last bridge in the chain (aux-hpd-bridge) does not
implement atomic_get_output_bus_fmts(), which results in the generic
drm_atomic_bridge_chain_select_bus_fmts() code using MEDIA_BUS_FMT_FIXED
instead. For decent support of this, two areas are changed:

1. In atomic_check, resolving MEDIA_BUS_FMT_FIXED output format by
   using the negotiated input format.

2. Implementing a custom .atomic_get_input_bus_fmts hook that, on
   MEDIA_BUS_FMT_FIXED, advertises all bandwidth-validated formats
   from dw_dp_bridge_atomic_get_output_bus_fmts(). This lets the
   upstream encoder negotiate the best mutually supported format.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 34 +++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 158c727ab58b..5db9063ee97e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1536,6 +1536,7 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 				     struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	unsigned int out_bus_format = bridge_state->output_bus_cfg.format;
 	struct dw_dp *dp = bridge_to_dp(bridge);
 	struct dw_dp_bridge_state *state;
 	const struct dw_dp_output_format *fmt;
@@ -1546,7 +1547,10 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	state = to_dw_dp_bridge_state(bridge_state);
 	mode = &state->mode;
 
-	fmt = dw_dp_get_output_format(bridge_state->output_bus_cfg.format);
+	if (out_bus_format == MEDIA_BUS_FMT_FIXED)
+		out_bus_format = bridge_state->input_bus_cfg.format;
+
+	fmt = dw_dp_get_output_format(out_bus_format);
 	if (!fmt)
 		return -EINVAL;
 
@@ -1831,6 +1835,32 @@ static u32 *dw_dp_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	return output_fmts;
 }
 
+static u32 *
+dw_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	/*
+	 * MEDIA_BUS_FMT_FIXED means the downstream bridge does not constrain
+	 * the bus format. In that case, advertise all formats supported by the
+	 * DP link so the upstream encoder can negotiate the best match.
+	 */
+	if (output_fmt == MEDIA_BUS_FMT_FIXED)
+		return dw_dp_bridge_atomic_get_output_bus_fmts(bridge,
+							       bridge_state,
+							       crtc_state,
+							       conn_state,
+							       num_input_fmts);
+
+	return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
+							 crtc_state, conn_state,
+							 output_fmt,
+							 num_input_fmts);
+}
+
 static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_bridge *bridge)
 {
 	struct dw_dp_bridge_state *state;
@@ -1883,7 +1913,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_duplicate_state = dw_dp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
-	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
+	.atomic_get_input_bus_fmts = dw_dp_bridge_atomic_get_input_bus_fmts,
 	.atomic_get_output_bus_fmts = dw_dp_bridge_atomic_get_output_bus_fmts,
 	.atomic_check = dw_dp_bridge_atomic_check,
 	.mode_valid = dw_dp_bridge_mode_valid,

-- 
2.53.0

