Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFCF37C929
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975378; cv=none; b=u8OztEmRvQ84+ybqNOGa3yCkXLny3hBaBXfUBrAK2l41vWO0z5KpyGyFozlDpUT2Ip7iPWayXNhQOZoBrDL6AYC7v3UIl5Erxsk0BG5GKTOYrt1LrEIlFvoQLwW2awahBrAcbtVJXaZMpDa/FkRxC1AAMZWDirPPHtA9gS7n6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975378; c=relaxed/simple;
	bh=K6TRwu9LuT59/wZN7jShPaYAGjmA6cF+Xm3+2+qJdbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqZ4Ws2uUbdcPnwR8TL5tcWrHMiX6tBk/9i0nOtlcsjJM1qj6S5HzTwviiOvvm8LfGw84G2CDjx/ITzjdj2zLXaBvTulwe/dY5XMqUAXzFh+Fsb09nmJ9g73yWDfz8xWWxeJynv+NaYTvN66Eiv2nm5bpCqEoZMm2XxCdQQ3EfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms2SQ8sy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms2SQ8sy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484399babcaso567240f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975375; x=1789580175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqyOJwWDc9siUyUIf9HLEiRZ/UBmYkZ2bG5NW9K2GYU=;
        b=ms2SQ8syFyX2qvaOSsH7WibuxIm4GBFIknDoq4wKFw6dcvUKkOefjnChQoP/Qc6ETs
         Rs50y8NTTI84MAKj9vxU0hXcH503HIx/qXJepbngArnFWlvjhMX3vkK5YloPdsmIoRBr
         IakiWnKuACGtSF4utkhaW6N2OeGT0NkdBbkNU0QInbAwHvAzXl5A+KfDKN1Q49vNfIvP
         FFs+d6VMS7jnVkbFiR7oF28azPgWXO0+DRhBZOZC373Hex9UxQUY4fZA14mcpyXbBYKD
         NySBKMxvZj83i2JGEfm48Dbg1b3FjLYs8cOIVNOKVvhF5+pIMdbEL1v5xeAjhrEXRJXV
         cp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975375; x=1789580175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqyOJwWDc9siUyUIf9HLEiRZ/UBmYkZ2bG5NW9K2GYU=;
        b=TeuUDHgXaByTnuneQEBAAeCBAC0XgJA0wjFBsMc0T8NJEohFG43H3XBUAs4T6mh2mF
         hK1NMUZgrmxFa86D7S2gjwrbhjk0ieOf1ID9O17HhwJrOiWUID/GzpExCu+7fAdmKXMg
         yRiiLoTV2oqK/QdqoqAcce82/NZAd1CaHaCYYD2kS3J80KIquyTBy55Iu5aEyZdpOtsE
         Q0/iWykojPqdudhkaDningsU6Gx/VSSDB9bx7iei9/6LES/rB7tS+675ll7nUQhs4Mga
         ImUEzDTF5mD+cU4ATD0glR8POqVGP49kV5Ndmo15am55zH+w5C4ulrmf1Yf3nwNKitqY
         Y8vg==
X-Forwarded-Encrypted: i=1; AKwUvBxksV0t6+c+KcEXmmKCx1MoYgXltAMQmYhBu8kvNG4CxhUtks9K96tlokgPJhj1JJqU3HracPrl7NvNeJw=@vger.kernel.org
X-Gm-Message-State: AFuF++nQJviopSNmJBCNWIquBPwK/UnxrBCLHiuTLl+hFYt20+Wsui49
	TdMkn4TQYd0j8N1ETMCtctvSIaheVFfp9lt7cbOtHHhJ7EvQZ2pU3tk7
X-Gm-Gg: AYBFou0mu9m0+wLx3aR/+Vi8Taa4a6mHnVvZ6BKFXnQva5fcuUN2llXzWAxQpAaTMwo
	PYXR0cTvrsEQcjrwDaYXg4Q88qAPQF9ePushXzqFBjPuPinTPHdiFOB4NY/EooBY94O132vbZxd
	9LRFuOmIL9q1DGJ3tO7mK2+I24nKyhFPXrO/TKrWCWrV79YXbV++Gq60VOPvunBXPATlHvmrHKS
	lOoZ2C1bYEyNxRXlU5eJcpcwo2KyW8R4dignnKq/cMUMsN749R9oqxUhalqT7W8RmCV+8yx75Tw
	LgTe1cgXaG/a0rpYSKYoYZY0IGNhqCQo8W0NKlk2GrfVN2QgD7BaXTQKmCQqflo2EH/jRseOaBO
	sX69Z2bTdbyGXun62Rfy714F4UfTlmjjBIcLgzKTLDKnerKYmkRSnjPAbjAVisZDM3YRjD+nXrB
	PtM+NG5i7Enu61rdRU48aVzH7W8lNDW77VgEeH69zai7V1H8mgDGwjwqC6fpLdyudTDin9oWzf0
	5WCiGGhJERkw7I0H7K/qZWotB+2ue14bBK0iOi79yQi9Dz1iC+H+MoQvAqaXRlKOqVgDggUw0qY
	Zg==
X-Received: by 2002:a05:600c:620f:b0:49c:eac2:ddad with SMTP id 5b1f17b1804b1-49d2570acaemr24678895e9.1.1788975374390;
        Wed, 09 Sep 2026 10:36:14 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:b011:705:bf09:2680])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:36:14 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector property
Date: Wed,  9 Sep 2026 19:35:40 +0200
Message-ID: <20260909173542.14030-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909163206.36409-1-royalnet026@gmail.com>
References: <20260909163206.36409-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dw-dp bridge already filters candidate output formats on
conn_state->max_bpc in dw_dp_bridge_atomic_get_output_bus_fmts() and
validates the result against the link bandwidth, but the connector
never exposes the "max bpc" property, so userspace cannot limit the
bit depth. Attach the property with a range of 6 to 10, matching
dw_dp_output_formats[]: the smallest entry is 6 bpc RGB and the
deepest entries are 10 bpc.

drm_connector_attach_max_bpc_property() initializes
connector->state->max_requested_bpc and therefore requires the
connector to have a state. Rockchip binds its components before
drm_mode_config_reset() runs, so the freshly created bridge connector
does not have one yet - create the connector state before attaching
the property, exactly like drmm_connector_hdmi_init() does for HDMI
bridge connectors. The later drm_mode_config_reset() then re-creates
the connector state, and the preceding patch makes
drm_bridge_connector_create_state() restore max_requested_bpc from
connector->max_bpc, so clients that never set the property (fbcon in
particular) keep the full range instead of ending up with 0.

With the property attached, compositors such as KWin write "max bpc"
on every atomic modeset; any in-range value is handled by the existing
format filter and bandwidth checks.

Assisted-by: LLM checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index b23efb153c9e6..8ff27353b1417 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -112,6 +112,32 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 				     "Failed to init bridge connector\n");
 	}
 
+	/*
+	 * The components are bound before drm_mode_config_reset() runs, so
+	 * the connector has no state yet, but
+	 * drm_connector_attach_max_bpc_property() requires one. Create the
+	 * connector state first, like drmm_connector_hdmi_init() does.
+	 */
+	if (connector->funcs->atomic_create_state) {
+		struct drm_connector_state *state;
+
+		state = connector->funcs->atomic_create_state(connector);
+		if (IS_ERR(state)) {
+			dw_dp_unbind(dp->base);
+			return PTR_ERR(state);
+		}
+
+		connector->state = state;
+	} else if (connector->funcs->reset) {
+		connector->funcs->reset(connector);
+	}
+
+	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
+	if (ret) {
+		dw_dp_unbind(dp->base);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

