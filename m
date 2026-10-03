Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACCA47F774
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044159; cv=none; b=Z3XtV33OnYvrbD5l/HXdHVozG/VXPkhCKMiGJVpmMy1iBimfIp5zCN3A+fNxHb2NIY6lPpq6bM0kRK34WSFWvmzoni4vTwaJFwN/wuK596PN9aLPcsqnDZ1F6yGz7TmeXADMCogvnDwl7D9gxrr1DX6rH7TLxj5ae4naAhTBJX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044159; c=relaxed/simple;
	bh=7hVQfSPWmJt+ZjB8lin/xSrAcr+IAyT1V8vPe+DsKbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6MQ2fUIgaNnCh8gca1SmTsmOPBA1RlUDvdBMsupm4XAXeBI3YixnMLupViBwvp45fzC8pZEcF/ZZO9CoNDnVVYn41iPcv1aBRzIBT5DHQ5dZ+/XxgrnTIo+BOCO0Y7E8d10+XPAKdI4BRSndunMmhXx0nJx7LJmzZmBRPQqOxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRicW8/v; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRicW8/v"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso6544505e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791044153; x=1791648953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ya85XkpyrpMe6Lfgalo1nGODKz5TM2XHUGeehhaYQEs=;
        b=NRicW8/vdj1EMMQRoJR0Sw4wZLJqdmpXevPuE2uYcVO8EBziWXWC0u2eA2sIAHBXyL
         hdPvWTBH5Niw2cka9nFKR3K946tAdfdWb4TDqSjVWGkmfIu+LrvC9e7pPxCDFpfNX/w7
         KIL9V6oeF7LzVp0Wik/CgCmXlSMJGIU+R8uXB7BHA33ffkoYs8yweExre9dfofxfwwLa
         0NKExX0GS2moa26thWLizKiIOJm4b3uoizpNQnmkZGXPjKc9kGRgDB1+3WhXaDH0rHko
         Vl8DFe2bmjl6+IYwUaRKTRK8CCDTTo/EOT2gTVnNF32O92B6vvgzizubv0y+NqnVgRv9
         iTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044153; x=1791648953;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ya85XkpyrpMe6Lfgalo1nGODKz5TM2XHUGeehhaYQEs=;
        b=LW+hPDccD/ruV87/5/7c4i3VsA5JPvuogv6LIrsWebW3K9e8ou+XmJH9thpJqX+gRT
         /hBtSCUJRqgguE9er7JzcpioaJNOkdXSYqRTnxJB247of9pEnGX1pZmQzNqOdIaWbkVM
         CuR55SWt/0BIQiWv9zHN3z+Hv7/4Eq95OBFBRS/YZkD6x0b4rEFUstt3Eyrxkurx40n6
         3kTiGG2tIfTIRMBiOoy7OsGLjdEzllhNBTRcd9H3xPH2wwse4DjoClmajJ9fmRLQb9/2
         mCtaIaYdaVxz1KzDhIP3sKOg7+yEU1QORpZkv6b4Slj0Uncx9rtq7HMVfaJQhwcmxhd8
         1tWA==
X-Forwarded-Encrypted: i=1; AKwUvBzSDzJtiZyzjZDDkfkNzJ/3Rhh/2cU2eR/KioCjrId9+5m+zI0qVp7KL0N6LwLG44vympGJkyREQTlx9HY=@vger.kernel.org
X-Gm-Message-State: AFuF++lNEwOknFyM9vCBRTza9nDY6XHnHVB8fOqeJoJt4MJFHeFhbpvV
	yqN6A7Gc8Epet+deo9LuH0zYdc3qCd7Sddy9WCvYkUapBjOexK0kXK6o
X-Gm-Gg: AYBFou3XMt1wMYfjkKRNAzJt5LRkDp3awshxt/D0FJtv3sMJVkmTi1Nz419oaiB0sTj
	rgEZH1vRyZCjdeV0GHwtJN1b8uBRz1VbwV+LLSErgn9obv6eRYf/SKf08sJ2hrv1v5tzB5UToak
	UBcMUVLUyZP2XPXKetqjPOq2O85TvxnC5vRTguwa27OYGm1uEPYlvOir+QYaHSkJueEQsjoaVY4
	UTh2MZWzTpjpEhtVqrq3wnJ6tIqz8tsTXdVFulZpz2JvORpPnllD/qpREV1aLcdnmASlN8o3TQc
	LQsBE+97oO/C6dey+VgEYCKZQSDrxJ5LHL6Rjm7vSomaTBqEE002DRYlU8JJ46UI819vxgorzxg
	K3bhxSiifZXtdgHAVeI4WEasialEGNwFY+XJSzgAvmdWTP7pcCNYs7tNmo1TeKcBynd1vT75teg
	epLltd81XHzMY4125l3tIRP5X51HfNu7yX4pkI2/RBtGg1u5RGsI0iS7ZKerwf61+vRDVN/9xED
	te51IyXTohLeNL7sdnW3zZxbwUk7tAIbylKaR66anjk00rHWxsa/wAg76mvi9zyVf8W
X-Received: by 2002:a05:600c:4e13:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a02757999cmr98416455e9.16.1791044153155;
        Sat, 03 Oct 2026 09:15:53 -0700 (PDT)
Received: from localhost (p200300eba703ae00ca7f54fffe019321.dip0.t-ipconnect.de. [2003:eb:a703:ae00:ca7f:54ff:fe01:9321])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm167309945e9.3.2026.10.03.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:15:52 -0700 (PDT)
From: =?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 2/2] drm/amd: fix HDMI signal type for EDID overrides
Date: Sat,  3 Oct 2026 18:15:08 +0200
Message-ID: <20261003161525.23600-3-johanneswueller@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003161525.23600-1-johanneswueller@gmail.com>
References: <20261003161525.23600-1-johanneswueller@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If an EDID override is in effect (e.g. via debugfs edid_override or
drm.edid_firmware kernel parameter), the overriding EDID may not
advertise capabilities matching the physical connector being used.
In that case, trust the physical connector type over the EDID in
create_eml_sink() and dm_helpers_parse_edid_caps().

Signed-off-by: Johannes Wüller <johanneswueller@gmail.com>
---
v2: rebased; create_eml_sink() now lives in amdgpu_dm_connector.c.

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c  | 9 ++++++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c    | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index ad3383169d83..2bce57b06037 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -2134,7 +2134,14 @@ VISIBLE_IF_KUNIT void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 		return;
 	}
 
-	if (connector->display_info.is_hdmi)
+	/*
+	 * If an EDID override is active, it may not advertise HDMI capability
+	 * even though the physical connector is HDMI. Trust the connector type.
+	 */
+	if (connector->display_info.is_hdmi ||
+	    (connector->edid_overridden &&
+	     (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	      connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)))
 		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
 
 	aconnector->drm_edid = drm_edid;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 5c74f19fc33a..9f4465682088 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -223,7 +223,14 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 				  edid_caps->display_name,
 				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
 
-	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
+	/*
+	 * If an EDID override is active, it may not advertise HDMI capability
+	 * even though the physical connector is HDMI. Trust the connector type.
+	 */
+	edid_caps->edid_hdmi = connector->display_info.is_hdmi ||
+		(connector->edid_overridden &&
+		 (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+		  connector->connector_type == DRM_MODE_CONNECTOR_HDMIB));
 
 	if (edid_caps->edid_hdmi) {
 		edid_caps->qs_bit = connector->display_info.rgb_quant_range_selectable;
-- 
2.56.0

