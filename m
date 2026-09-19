Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC5438F920
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841406; cv=none; b=PiICbtVj6E/O7ki4Ug/EjfNJCkXpjp9hCsEqZdHyABsSbk+Az1cZhSN/VGhJeUx7320KY64Vm94ucduhVFynY2SMNwCikvsu4AdSRB/9jifSQDJGaSXezCMu9zNbxV2P4ENt/T7xWYNOSbHRG3NDTraYhcxt81QPVtb9TQx2PpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841406; c=relaxed/simple;
	bh=vZGBjZO+3pK6P6r+j1Br2A8tEHTya3afTzlQC352TVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tY4yXzPgBW3U+HYFzpOf2Q1bnnMC0SFweOqooNI8iqzW9cdH7/Rl3D7O1NRtvsoVdKJjN+p9BbFjTr39cxZKOVLC9wy6EUSezccZncZCHlsPXDLtgApSOY7IC7nTA/wSwe3eaCD4hJi4hg7+Wtc6Rs9TQG1CROJHwvEW+gS179w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq6ZANEN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq6ZANEN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so11924575e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841403; x=1790446203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYG31FNdE+jTjB9/DDoxQaNK7idCKtZmhwSMIq4k/44=;
        b=Nq6ZANENfQE8wfvObqCw+YzNq3QYd8AT7sLD0oGtIvi95fag2CwjTZoUycSgyYBv6Y
         7hso2whjH0rnVb2gEgwk1Q5VZoEwOxBH7ECASxo9gp8MpVoRYBG2FKkCu8qq65eo1rld
         3vK7vx5MFk/5KttMdBifLJnIvJqgkhHsj0vE898QQ8BsXQ3t81WkKrW+p4VxyOc+MzJe
         gCmpoWE39Qt2g/w76/VLmqaAgPxeFwePBU0rsdSn3YwW22VmBLQ06lDgZC2wNkFnnnEs
         nKEZ9r1BPTpcAE6MkmF+wmP0bdQj9/NeA+mvgmS7eLg6p68qcjJ3dINtajW+nhA6Tnii
         FIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841403; x=1790446203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYG31FNdE+jTjB9/DDoxQaNK7idCKtZmhwSMIq4k/44=;
        b=Ft0a+x/AHX+YoYOH2cRTrcZkEu+qQ+INa/Geldt4xthZfR5UoDbJ87zphC2KzxQR79
         xJfot1leMogVqin7WGAfZUHG091azKjxx0f9jOyqfmVC0L7lxV472EOkLQxdFabNmRNQ
         GAS5KoQJ8VuMZKc0WnU/8AOmZUy50xqtuzftt1Ab5/c4O4znXewA2iF/bwL1etaNhdAK
         g1/yacgsGs78/RSpkl0vNYvH5Gi5TuCGLAiRo61LBbOvnZoLGgN4A1iAEAHi4TJtw2MK
         ZTCrPrDqVvaYzDnKlSxj3cqMwlJJrcGW4CTwlnS0qMxIc5KDEYlmEDAbyYZ3Ok/mgR4D
         odGw==
X-Forwarded-Encrypted: i=1; AKwUvBxAgLgtOMwG+aQgMFBs0C/DtMeJCX4IX3yLcd0AKm+9mmUBNGgksjHMz+xjj1nLEZy3UPK0muyXuGmpyXM=@vger.kernel.org
X-Gm-Message-State: AFuF++mTyZfH1ce5OifAH9BDjoHlks5jmigRKWicauzHedPh1WL7XVQI
	3zAM/aWe843eernpCfepwO9yu7ltkivuPC3ihcrQwTA7ZVe+aapru1Ih
X-Gm-Gg: AYBFou1k37mQRKngJUdG2A3Yf5Oa8NoniX3q+SP+dTqDdKnUFyUASrMNC0PMrYjehv8
	BdTSUQ6Fux8Wyn6a5soLUEMRqeS8Y4IY+3BBvs8NO8yoeO+ob22Ib9Z4OIu8asD989Eh+v1F7pf
	LiTflo7HfXx2e1FKzyUyGB5dobvBTiRsdSm3r4AXVI0j4Pd+S0868ccbv5veoJV1Rnhwv5BTo7/
	hua+4cJDRjcbHf3+1hh9DIo6EDtBnYqHM/aMQDQpBHylHrcqV0FhAHL/RZqQUu4hUYM37qBWmLe
	uSlM23yHlldHnOgxjJN4JoVOZ3uRYdBsJLpl63LMYpz6QfEE+A8PAxvVHgUe0Wpvzcg2YctJ50r
	GSiDd5ohfRjbc44qH+xlKlcu1tdu7zj1YBRVmMAeo3m7vRdrtI1LlkPYQiw50WxZDxeHm43UNeu
	QyWzkcRMm2cxJnlx9tC4S0zvy2dX9HJIoa2BMtjKuIQiQK0P/suyOUtK8sY6GlgLDFmLcU83Tb/
	kN2wl3yuUrIT6BDo+K4OrNBnHf/MFpUV+4Aydtq1wOVxl5bN3j9
X-Received: by 2002:a05:600c:8518:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49fc5741563mr88035205e9.29.1789841402488;
        Sat, 19 Sep 2026 11:10:02 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd074336sm88631595e9.8.2026.09.19.11.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:10:02 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/panel: tdo-tl070wsh30: Remove panel on attach failure
Date: Sat, 19 Sep 2026 23:09:44 +0500
Message-ID: <20260919180945.249571-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tdo_tl070wsh30_panel_add() calls drm_panel_add() to link the panel
into the global panel_list before tdo_tl070wsh30_panel_probe() calls
mipi_dsi_attach(). The panel object itself is allocated with
devm_drm_panel_alloc(), which only arranges for an automatic
drm_panel_put() (via devm_add_action_or_reset()) when the DSI device
is torn down; unlike devm_drm_panel_add(), it does not call
drm_panel_remove() for you.

If mipi_dsi_attach() fails, probe() returns the error directly:

	return mipi_dsi_attach(dsi);

Once probe() returns an error, the driver core releases devres
resources for the device, which drops the allocation's own
reference. But drm_panel_add() had already taken its own reference
and linked panel->list into the global panel_list, and nothing
undoes that. The panel is left registered in panel_list pointing at
a device that failed to bind, where it can still be found and
dereferenced by later lookups/iterations such as
of_drm_find_panel() or find_panel_by_fwnode().

Call drm_panel_remove() when mipi_dsi_attach() fails, mirroring what
tdo_tl070wsh30_panel_remove() already does on the normal teardown
path, and matching the pattern used by other MIPI-DSI panel drivers
that pair a manual drm_panel_add() with mipi_dsi_attach().

Fixes: cf40c6600592 ("drm: panel: add TDO tl070wsh30 panel driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index fa961abdd2d7..32f2dd2bcee7 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -179,7 +179,11 @@ static int tdo_tl070wsh30_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0)
+		drm_panel_remove(&tdo_tl070wsh30->base);
+
+	return err;
 }
 
 static void tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)
-- 
2.55.0

