Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6A837E5CB;
	Fri,  9 Oct 2026 03:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515918; cv=none; b=mCpN6wst8e5gf9v4iF90e22G6od5+YptN7blJrzyLkRw4TS+rgnMYLQ3W020u8vyQn/QYKMhZY4ri19ou1Q/vWLa5OroagKBVGN9B6mnPT2o6pbH33Ig4stJ+4xf9ljPptRAB/o03kvTQQH0KguwZ1Rv9EN1ZRTFzLnOGENIKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515918; c=relaxed/simple;
	bh=y8Hk7pwSF01X//hlbGuKeI//kPSXq5QtzgIxRDu/UNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANw/XWIRrpLUn3msNIKY+/oiq9m+GCeJmE9LSpn/qZnIXyEM6sY5hHeDblZLutNnBJkFjG3zEoqm7OmtxRSXQ65klzHmyGYhL6NHGf3gvCn+zhYnGmCrxkK47VDrnw8oz790tn5mJfe1ndQDbsLWhv/vm+lUyEtxXum9jpRrDOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515834tf0417f50
X-QQ-Originating-IP: EuPfVQdQ7C/DcphIeULq/TvnkWsIwm0C4Knbx2+F2nw=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8697921741928776439
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:55 +0800
Subject: [PATCH v2 03/20] drm/bridge-connector: Attach max bpc for non-HDMI
 bridges
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3357; i=sophon@radxa.com;
 h=from:subject:message-id; bh=y8Hk7pwSF01X//hlbGuKeI//kPSXq5QtzgIxRDu/UNE=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlZ8jeQ8yyZ+66e3jMCWDdv2fKs7Zex8UUWxMKvws
 3KzrkJORykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgIkcOMnIcPXJ64nvDWvMZL58
 scnVvV/ptecT87WDX5137uVsvvhpcgjDX5kTk1U8N8oe3HA+0KBdpXsNs6RraVb75L7665cDNly
 XYQUA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MhuEEgXNPF1fZAw+EUqTqtdZ8K6FHr5ropDtetE+fLK6SIpSElnuN/9a
	71NPHmbbeefCQpQOzrztIl8QZgCfdyTYtVjNOf1x0TigdTGrBr/fCVxhN0QejS2ie459ZHc
	/Dluj4u5aPdA60vGrqoG/mcWEUDhB27h7PFrKd9FeSpb/j3Vnh93Kw2NOBf+uQcuV6OjEwo
	gnVlKuxXNAMXhDuMAUiSjkGQ5CJSq4raI3+tOV4mj7u3IYnLYhWrPctY2IWljmYNFXJJ+L8
	EGjISdCQWsZPaO16ibVgkNzcYhnyTRFbNvk+sSeZ/YJ5mB/3fW+7cn6GT8Cl4cl6thUQmZk
	69zHFJ9fx/MauQKdJEg1cGKth3Eybd/MzazoxYAd0u3lX7MShw9VaNi3Ln5uq8gCT9rJMZu
	ROSc4GynkGltph+bmKaNDTQDnwofLkqpeuPa61Y9fiuIyaClgM5P66muLbJCUyfz22jrSGY
	5I9H9kqHiZ+yoI/ey+2H5grY6Fnnnf0HOFhcnIFAG0sTiVQDCSDX9yeuAx/2hPuunn2o+9N
	nB+90J43PfdrZcwipQ968L20ofKxUn4C0VMCMbOhjktqgqTYxCG8ZkHRqXzeKCeKujzUOH3
	sDEahZYY1h0TonSlN4Vr1u5uZIj1EXTPUppobx5I5/yVxDI41RjR87blDjjI4+PNY3j67MY
	fR14pS0MFrj3KZ89Uwx/yPnh9O2ac1dvSMokzS3pbf+jaP+zxVJzk5b8nKHGZleC1fFvqOx
	8Ol2YpiQ7XrHi7rV+sao30Jnw/PaviQ9XVD5mbwACsYQ93LCr4ixcOQYXcdGK9kUqlPBJFR
	FJXsNS4kDq0+DB3+fUWr8L1ao7pwFK/qEOtjzaQtkRe3mjPnLCQXJ4Fw0wfBcOq2Dp7DvlO
	17U5uwvrChyibNxDYewGydqUuZ+vj39yiYIJnIfBQpq16PVX8DZ+YjAAN7t2v9omSL4+evc
	2yCtP4hWmh3P2gKT9sZXTWA+vQ/uS59L8Mxf78PMebVrFVOtOLc94Xi5a25u1qGkb+uf92e
	x3qE2M+Fn+Aei83iw0uIKop7vEZI2S0aEIS0gtKMJEMIz82mML
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Allow non-HDMI bridges to advertise their output bit-depth limit through
max_bpc. Attach the max bpc property when the lowest reported limit in the
chain exceeds 8, ignoring bridges that do not report a limit. This lets
DP drivers expose deep-color support without attaching the property in
their connector initialization code.

Use a lower bound of 6 for DP and eDP, which support 6 bpc RGB output, and
8 for other connector types. Keep the existing HDMI registration path.
The property can be attached before connector state allocation; the
atomic state helper initializes its default when state is created.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++++++
 include/drm/drm_bridge.h                       | 11 ++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8b54069fa53a..be2e08a3694a 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -825,6 +825,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
 	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 	unsigned int max_bpc = 8;
+	unsigned int chain_max_bpc = 0;
 	bool support_hdcp = false;
 	int connector_type;
 	int ret;
@@ -985,6 +986,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			panel_bridge = drm_bridge_get(bridge);
 		}
 
+		if (bridge->max_bpc)
+			chain_max_bpc = chain_max_bpc ?
+				min(chain_max_bpc, bridge->max_bpc) : bridge->max_bpc;
+
 		if (bridge->support_hdcp)
 			support_hdcp = true;
 	}
@@ -1026,6 +1031,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					  connector_type, ddc);
 		if (ret)
 			return ERR_PTR(ret);
+
+		if (chain_max_bpc > 8) {
+			unsigned int min_bpc = 8;
+
+			if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+			    connector_type == DRM_MODE_CONNECTOR_eDP)
+				min_bpc = 6;
+
+			ret = drm_connector_attach_max_bpc_property(connector, min_bpc,
+								    chain_max_bpc);
+			if (ret)
+				return ERR_PTR(ret);
+		}
 	}
 
 	if (bridge_connector->bridge_hdmi_audio ||
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 58fff047f43b..01ad1878149e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1089,9 +1089,14 @@ struct drm_bridge {
 	unsigned int supported_formats;
 
 	/**
-	 * @max_bpc: Maximum bits per char the HDMI bridge supports. Allowed
-	 * values are 8, 10 and 12. This is only relevant if
-	 * @DRM_BRIDGE_OP_HDMI is set.
+	 * @max_bpc: Maximum bits per color component the bridge supports.
+	 * Zero means that the bridge does not report a limit. For HDMI bridges
+	 * with @DRM_BRIDGE_OP_HDMI set, allowed values are 8, 10 and 12.
+	 *
+	 * For non-HDMI connectors, drm_bridge_connector_init() attaches the
+	 * max bpc property when the lowest nonzero limit in the bridge chain
+	 * exceeds 8. Bridges remain responsible for validating configurations
+	 * against any limits not reported here.
 	 */
 	unsigned int max_bpc;
 

-- 
2.56.0

