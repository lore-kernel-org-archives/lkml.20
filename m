Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227B438A70C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975375; cv=none; b=bFdXkrSXLiyluMD8LbtLY9JnV88e/twCmToUS1QUdBzY2sOSv6NosJSPyxc+3lbKGK05lIOvih9EcKTwQlk4BOnhCZncHOmJqvAPzzEcYOach5qkOo3e2fE078ktOrmpf+OxGyfzmYAfLvjKckKxy+q03zU209iLotSki/vQpxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975375; c=relaxed/simple;
	bh=VxwEIG6yCOOvrzqWhkvESH0ChUSgHAYSU3EDjaD2jXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERLTDeiwetE0hMdh4DBW/vHTDpZ6KeB6ky4BdlteE9IDa9S02PKc4DJhBpt2C6IliArWJ1OIJHJu/SX9isxu6i1hq6E1/lsFyMAnkHLfKU4SSaJlDOU8p5si4MO0a6nXK8g94RGRXd9O7Rj/SHqPc0kzcLWvxpdlr+A2sdR+s0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adENeQ9t; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adENeQ9t"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1740e4so2944815e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975372; x=1789580172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLa/2IhG0uPxKott5hiW6gEdbabkA+pAUSYZZS+3kb0=;
        b=adENeQ9tVbrXM1H9ILpgmFPlb8lXE/aCRhE80oL/UPkcRJFdCrNGKSGcCly1mU7Re5
         8wCm+MtaZlfNCiKhz5Y0LKqVS6YVZ1AzJ5gUEkdk0se0ihW9JRXtw3VrbdPuLx90IfoL
         xcjPQRZXKbfZ5yqTAS6+7Hic3jttup0snue6+GT/QTltU16W3q5maCG9SspSH5KpvfOS
         apFMST/R97QzRhKCXc3+FvT4xKpdEo0FoRSDQvxO7MhkSXGLm4d8X9/AV9CUHLN/bl/M
         l/2QRqLCUyTrhXCM4j0ftQf4H7LQyOjnonJSiqOCdz4RZMP2B3ewlm0QG9+u99sQlTPG
         2Udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975372; x=1789580172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLa/2IhG0uPxKott5hiW6gEdbabkA+pAUSYZZS+3kb0=;
        b=ED+TdmzcItRS8mTca6xHthMBHqmA6Mxgg5tOa6/R8GwMbvsq86WEjC7nvAeM9xsMk4
         x1c/pC4Tdbh6bF9lCf9KYmYbx/Wp7HySTqyNizQIvdkpRBngM1hW+x2jPnPMgLb5nL9U
         24rcOxHExMaCEZDtOi7Wwswt/BuY0frKjL5EI0vs1pySO91rsdt7kXFhDhirXZp3tj12
         0sKdQLS0tPQypPr9UTZO75wtgJh4qny5FiiaYpHZF0dQl0P6bPXmsqhd7z85mWMwh48t
         Kxsz5heGeY4T2h1EkGJrGUZ7faOfl/8Jdthx3xD8LWg5qQRhRnT6ItgWqqZZi9RSDONo
         gLVw==
X-Forwarded-Encrypted: i=1; AKwUvBwAl7ds6vIcZptgDEVPwraJ7zBU42ThxQZDpkiNJPZgvhkBYicVV3VQk3hzLROY+phsgjTjPOtiJst3agQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kVUHR2t6qAnfhZGTavGLg+xsK/kIabxXAw4bSuY+Niep1QAq3c
	UzhhoC4QoJy7y2f2AtBxdT4lK2vWpCHNju1ClyeWunW4aHbhkvaT3e+W
X-Gm-Gg: AYBFou1iZFmYCFrH/TYT7apy3MjF4fCvvl4S6e3OfvAtiUREWzEB0KWvJI6UrUisoxx
	7/Q0KF8tvT0wp1JdYLezVAC9XLcVUQZlujPJdH5zB8cKCYETRiUbrwx0PXCImHRuBvxtDn/g2b5
	hu5hkX3n8QgNpyomI/bnlFRTBdNzjxvFzUNBxcDxXg9YEj7qwtiOazlftihYB1xKeBCq9W0Vo0l
	FdULx5iU/IR5fJdA3dYZqFws9w07kMq6Z/LBBdd2OQu7+4+knuUqSXF7q2jem3HInrmc/m1HesO
	Lq+OZ+a+2tfu+pUBeolBp9FfuNeiEDj4nImKlGlv2KEyn6QXgIlPeAnlV4Y+fpNo3nrTCBY0aBg
	4SdAdW1/1BtNJtDP/AAIGfTwpmBWxDlsQMQKner3GCiDW5EfzgOPVLtLogdb7PEHubpl6cNX6iB
	2qTZ1v8xBlw+Xpyd+i0fWT0ee/7UbYnnJLjEbRl9TxCMerx8WSI3qWndiOghrhxV1qDDGO7YkBo
	KoC8UkrwUVWYiT8scqq2EcwOlV7JCPS7UEWnykjQzFNVy7vDq4D050UQVhYM3JguBv5ir0dvVax
	GA==
X-Received: by 2002:a05:600c:a305:b0:49c:ff81:e062 with SMTP id 5b1f17b1804b1-49cff81e076mr237967455e9.2.1788975372348;
        Wed, 09 Sep 2026 10:36:12 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:b011:705:bf09:2680])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:36:11 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/display: bridge-connector: Preserve max bpc across connector reset
Date: Wed,  9 Sep 2026 19:35:39 +0200
Message-ID: <20260909173542.14030-3-royalnet026@gmail.com>
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

drm_connector_attach_max_bpc_property() initializes max_requested_bpc
and max_bpc in the connector state, but nothing restores them when the
connector state is later thrown away and re-created:
drm_bridge_connector_create_state() returns a zeroed state for
non-HDMI bridge connectors, and drm_mode_config_reset() installs such
a fresh state on every connector that implements
&drm_connector_funcs.atomic_create_state instead of a .reset hook.

This matters because drivers can attach the property before
drm_mode_config_reset() runs. Rockchip, for example, binds its
component drivers (which create connectors and attach properties)
before calling drm_mode_config_reset(). After that reset,
max_requested_bpc is 0, so drm_atomic_connector_check() computes
max_bpc = min(info->bpc ?: 8, 0) = 0. Any driver that filters output
formats on conn_state->max_bpc then rejects every format, and clients
that never set the "max bpc" property - fbcon in particular - end up
with a black screen. meson already attaches the property on a
drm_bridge_connector before drm_mode_config_reset() and so already
boots with max_requested_bpc = 0 today. dw-hdmi's format negotiation
does consume the value there, but meson attaches the property with a
maximum of 8 and the 8-bit fallback formats are not gated on it, so
negotiation yields the same result for 0 and 8 - the change is a
no-op for meson.

HDMI bridge connectors are immune: drm_bridge_connector_create_state()
calls __drm_atomic_helper_connector_hdmi_state_init(), which
initializes both fields from connector->max_bpc. amdgpu likewise
re-initializes max_requested_bpc in its own .reset implementation.
Non-HDMI bridge connectors have no equivalent.

Mirror the HDMI helper on the non-HDMI path: record the upper attach
limit in connector->max_bpc (drmm_connector_hdmi_init() already stores
the same value there) and restore max_requested_bpc and max_bpc from
it in drm_bridge_connector_create_state() whenever the "max bpc"
property is attached. Connectors without the property behave exactly
as before.

Assisted-by: LLM checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 +++++-
 drivers/gpu/drm/drm_connector.c                | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 00feb73e63d7f..6197fb80f7cc2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -279,9 +279,13 @@ drm_bridge_connector_create_state(struct drm_connector *connector)
 	if (IS_ERR(conn_state))
 		return conn_state;
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
 		__drm_atomic_helper_connector_hdmi_state_init(connector,
 							      conn_state);
+	} else if (connector->max_bpc_property) {
+		conn_state->max_requested_bpc = connector->max_bpc;
+		conn_state->max_bpc = connector->max_bpc;
+	}
 
 	return conn_state;
 }
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3a..0400a6a92e2b7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2866,6 +2866,10 @@ EXPORT_SYMBOL(drm_connector_set_link_status_property);
  * @max: The maximum bit depth supported by the connector.
  *
  * This is used to add support for limiting the bit depth on a connector.
+ * @max is also recorded in &drm_connector.max_bpc, so that
+ * &drm_connector_funcs.atomic_create_state and &drm_connector_funcs.reset
+ * implementations can restore the property default when re-creating the
+ * connector state.
  *
  * Returns:
  * Zero on success, negative errno on failure.
@@ -2888,6 +2892,7 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 	drm_object_attach_property(&connector->base, prop, max);
 	connector->state->max_requested_bpc = max;
 	connector->state->max_bpc = max;
+	connector->max_bpc = max;
 
 	return 0;
 }
-- 
2.43.0

