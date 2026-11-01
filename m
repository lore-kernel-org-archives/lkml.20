Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565249;
	b=dHeg/iHE6qLof755HDAdmNvC1D5cU7ddio0UyH8gUNMsH8mKi+BFflKsA9Cx/QrmQA/8
	 vhgKa4mT4OjtLWlROmO4HM5dqRkV+hNjZDfAVYguAsV2w76SMNnvt0LWrhoBZ2WtMFcqx
	 nGsNmLC6bqiOk7pUn2RVRdqb8SenddcUrz0fTYHUNgXnAB0ZKgh488h0bN2Z97YwUkObe
	 op1NqUOaTyy1weePHAsHGXgYZN+007SQuJOCZyDk/QdJv3BvBJRcgZnff9pXkg+swJP64
	 TgIEjMAC1uPDPDOZDq34PxPSRlkYBtOh6YsPcSTLjZBeU1afjpFe6TOABqI7P7Ly9qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
	b=HGLzfOh6WAcJg3C3tIKjS7Mo+KYWTqKm+fNQYaH2hGa63lP+VW13PQzK8e9ZDK5qUB2Q
	 fA7nJva6bNAoRG6nr/oBBNLokODy9BwHk0yrXqQUpcb0SSGEcXV1tPUOYXpZ3dziSfPOU
	 LYznt7RwMQfh1rJf5+BIPLFK9tr8KHN+22Uvz9mZdBR2XIs6XR4bXejDiM0/zJDTKnCWQ
	 fD6RLxQVf0CZs/eRqXhmH2aAJK7feukrl9OxKkp/B0eA82b5XANldbSqJlowDz08DNIvl
	 LL3RYkmumwCVaOxPEiIa/bbu2QuDmtmDUibRgC7C/1vVS84+mQkmeRcpsAKv84KvKvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2rQsl6J;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BD6606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BD6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2rQsl6J
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18506135e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565248; x=1794170048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
        b=h2rQsl6JF6r8yJaimAgurHkvgIEUOBN2l/PFgxOPhehtV/famX9N0k0Ue0d4054iiL
         pPTirxy4Mqo93uxkeCYyMS3jbXqH5KqVO4d1xbbOTyIzcn15N/EJAt0sTvcoiQA5aIfq
         JdTzy9o+jrag67cUTZQ5ES5f08eK9BQQzBSDEbYS+KbTrN8j1tY8L6sPh4y1A7voZb33
         k25DNxg8N81bHcH8a04YdVPd4TTDoyywAv6TSOxFepU8oLjh3WCmb1cXNK1Z9ID1M3I2
         E/66LPnibKZ0DHyoV0GBD2Pk/kV90W6Y2LW9ZOpGaZQsPd7pMdVW+Zd2Bg2I/zfHiAe2
         xymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565248; x=1794170048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
        b=sWWteAzED4fCXEqIASKKk0KW+xUibPoL25n+awlYrvQNR410dbkt1B9QdWhPvFCE7z
         kJqSQCo0l9yUlbU3U3IBxgUe4J/L7qyz+2q/4RKvLDIGZXOW82rTJdkEtMwpH8ciJc5+
         Z5Vo93nAcBURSlwlT65J8T9cpjJ6m5dpeLK/wmxv4w7+QsIFZtkGzHJoCmIQLE8ULC9J
         dzibJy93cus0SDMmdJiv7034x+1lii1NT/A1YIemv59uxo55Ezwr+pm/Jkkrh+hAb++h
         E/N8nNDkqBmLSxZIMQC5eJvm9UcATHVI7UsoEHt2i9vLNL1CCTIRQt+TQApY1jRdr5/q
         zvvA==
X-Forwarded-Encrypted: i=1; AKwUvBxoI+A55etXTQcnvyjDgrX3Y1b+vEOqxTzlGQe8PcrDK3cyH/XNSdTtPG191yAQ9w6w722BZfzRJH8iaek=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP4OV5V0BjKpypli+0sFwfWC4H0Mgcs5nhIx+/RbroqGvkQSvs
	v56cl6BOfreNwdfDMjtUtfTmiBwTBMFgajv23pVSBIan1BUQ3rjMRjK9
X-Gm-Gg: AYBFou32wjIy/t22g8iREK8HymlEryFg5Kbl03f2GniZY/6WWfcze3k/2v6brUDky/w
	HHlg4Qqev8VPYhrDRU2chiQKoBrxL/yjA3etQ+DLiSwUHw3uczGQqVkG8z6/ERKsb80mYCt/ENO
	fxMVzrqwFp86YSvsGIczw9D0GqDGZi/mmz4RgWideY/CtMv7vok0zTqJUtajgd5ztvMgj1cDaL2
	rezKkSkyQ9B5dVzWQg/S5n5wE9MNP7Megz/uVmj4VREsOeF8gpIOC7wl0LwlJJZ56TYIyxHh6gh
	r3vIIBY/lUBbK9a3prSgawyyCu/wpZDSiSqwBq7q4FMOu4/O35dLcBuy09+yQS+izhTLeKG6ptd
	+OW7vr8QkjUojJqGAdlraxyO/64h8mkPD1p+glbcB936dzxdQkTrjuyUUr9zo3Vfr8+Qu7GJmeK
	B6DOh4xls87PLH0HvwbT6AG1x1hbv6cS4x0i2+E7oSHmGsaP2Ye4TsqDudbDVaJb7v9UYkxsGyW
	gbAnYzMz/Vqn6dwZdrYs/01As0xQbfIOW9nzNWLEjxf+WUOZPLv1vmZ0Cnp0A6kw8LavgrYHFM6
	X34mcntgPjCvimmJO0XyFJm2E74/b8GlB9ZDlofIRRqVSwGzjs1q6t1hGllJB8xJiEEab2kNSBk
	x9AMhP7sD29dPVaM4hW7MpXcMKCboXt+rmVLokomIrljssA==
X-Received: by 2002:a05:600c:1d07:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ac18c735b3mr192334605e9.25.1793565247854;
        Sun, 01 Nov 2026 12:34:07 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm263946675e9.12.2026.11.01.12.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:34:07 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] drm/sun4i: dsi: set the connector orientation from the panel node
Date: Sun,  1 Nov 2026 21:34:06 +0100
Message-ID: <20261101203406.1360656-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun6i_dsi_attach() only accepts the panel once the DRM device is
registered, and returns -EPROBE_DEFER until then. By that time the
connector can no longer get a "panel orientation" property: it has to be
attached before registration. The fbdev emulation is also set up from the
hotplug event of the attach, so it gets no rotation hint either.

As a result the rotation property of a DSI panel on these SoCs is ignored:
on the PocketGo S30 (A33, 320x480 panel mounted for landscape use,
rotation = <270>) the console and the boot splash stay in portrait.

The panel is a child node of the DSI host, so read its orientation from
the device tree when binding, before the device is registered, and set it
on the connector then.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig, DRM_SUN6I_DSI=y
  and =m) and arm64 (defconfig, =m), no warnings. Tested on a PocketGo
  S30 (A33, ILI9488 DSI panel, rotation = <270>): on 6.18.54 with the same
  change (6.18 still calls the helper of_drm_get_panel_orientation()) the
  console and plymouth come up in landscape, where they were in portrait;
  on 7.3.1 with this patch the DSI connector reports "panel orientation"
  = "Left Side Up".
  Not tested on other boards; boards without a rotation property keep the
  current behaviour (no property is attached).
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to fix the console orientation on the PocketGo S30. It traced
  why the connector never got the orientation, wrote the change and the
  message. I reviewed and understand it, and tested it as described.

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae5832..1eb8a4cde0 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1055,6 +1056,31 @@ static const struct regmap_config sun6i_dsi_regmap_config = {
 	.name		= "mipi-dsi",
 };
 
+/*
+ * The panel only attaches once the DRM device is registered, too late to
+ * give the connector its orientation (the property cannot be added after
+ * registration), so fbcon and the boot splash would not rotate. Read the
+ * orientation from the panel node, a child of the DSI node, at bind time.
+ */
+static void sun6i_dsi_set_panel_orientation(struct sun6i_dsi *dsi)
+{
+	enum drm_panel_orientation orientation;
+	struct device_node *np;
+
+	for_each_available_child_of_node(dsi->dev->of_node, np) {
+		if (of_node_name_eq(np, "port") || of_node_name_eq(np, "ports"))
+			continue;
+
+		if (!drm_of_get_panel_orientation(np, &orientation) &&
+		    orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
+			drm_connector_set_panel_orientation(&dsi->connector,
+							    orientation);
+			of_node_put(np);
+			return;
+		}
+	}
+}
+
 static int sun6i_dsi_bind(struct device *dev, struct device *master,
 			 void *data)
 {
@@ -1085,6 +1111,8 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
 
+	sun6i_dsi_set_panel_orientation(dsi);
+
 	dsi->drm = drm;
 
 	return 0;

base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

