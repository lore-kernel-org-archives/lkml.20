Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FA63DE447
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463415; cv=none; b=ToBN7s2R+ddIu4MC5bX6McXgdltHyRrCTIrJbBj3WdzUzkhfYOpWz9vvkIupKpUkvTC2rgE3Lny910dUwNWHnPXmTp3yB8ktNcgRwCTm9lse7hY1jtdstIERaGMQxdasdr34CRTtHX5qK7u/Ho2Zt5KSnYMLSns6J4uM7yNwcfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463415; c=relaxed/simple;
	bh=g2NMp1OTkz+xp2hURg4AbW7nPX6JSMyZwFFA6vA+7Sw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OdaFe6q4UOd+yyT9Fybjhf2LGbXiFlTNMTVv9309YW3eneYHSii78tTzwY06lqJ13+r+xGmk9xexuRwS6JoyZnOimytyu7u660YU75k/R726c1TBdXfzOvXKDt/TBxywHZmboOQQx/74yyS6EwXEz6ZYPHBymFEiNmhCSbqi3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9piTlPs; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9piTlPs"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98929bb8eb0so910970241.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791463412; x=1792068212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZ/V9Z4SvvYEKRHXDwdb1N1cFPl5NmC2hXDXe08e+q0=;
        b=o9piTlPsupYsGHbsNdiXuVq/HC85+Yk9jPIdn8mFGEb49WnsI9XfqezisU1MXLuu8C
         0fpxuNB3MXbR7NWvxhYzg50RzoGUPcvIRMX1ZihnOdwpWHgvYssPokqTak5FvSV2L2CJ
         IsfJNVqO4J01HoYvCGU/e8mJGhQbA74xgmFmM8EqBcUiexVXWJGWNRVMmrIJBZUi3yfn
         OdvuxEVrilGdXQYH4xXG/g8wsNj1Cr1efVnURFTuPW0nzgyffsMUzrzOyp8CVMN1LBVe
         PzxvjNr2NinmXUYCbxPxlxoDud089O5BHPdR6IRMMl/dWa2oXOj/t5vLoQgG9GmtD1ju
         kQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463412; x=1792068212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZ/V9Z4SvvYEKRHXDwdb1N1cFPl5NmC2hXDXe08e+q0=;
        b=tql84Dc8Ha5fvnIELarSAUnR6iGPDUZi4eB+smhrT0irsMFFif119LrDJA5jppSO9v
         nXIyvTt/LpqMJ9noyHlJOu7fDuoRvtCtPetw/5Fjle7d+SHVoeJlKdERbK/PNJ+gnNyq
         +lhufqIvHQ5sPL0AILzP9OT8wQqhFp9WI1cXnU+w9QS14WuAT6Emj9qr315PfWfRuPkA
         k3oQzW7z8vhjLibxpLvn3sVGHmZ3HqXzf5o1v9Mf8XKUh0ErUjQ/XBMDe3eO8YSwVban
         anUGIu3ozUD+GHEuPVzIMbNSaN3R3op9gVNRXG2PHPyl+fNqv/WAgqwPZE9KhmTzpxfq
         9Kow==
X-Forwarded-Encrypted: i=1; AKwUvByykkYTbUQxuxGAgkOa8PHTNGp8YmqkEToJPJ/+4eOOnmO7lHXqQhcz31CuPNMidP8XX9zGaXCsgt5xJVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO7z+EpfeNtDaYRI2BrqmNtC6BHRZGb3V0fPZDP+s9D9nEK5cL
	nURoVXoZRtNVKpOyYu3V23vpATaAjNGq0JKjGOYYbmV+aocC101tWUUr
X-Gm-Gg: AYBFou2DtsOZqSNsp1ATvgcpxL1gt4zyebd7VlYxXcDNBxyL5yggMSCUI4Tr0/yoIzZ
	HlkVU5/zTvYgRl9/6pQhP5l/7nkKAgsXkJp/Cyzhp0FZUrO+mLmM6l8APG68kqBh27EFv4wM9/k
	iGEyLPHQxoFF30DBl/p64d6H6PyzlXYfI7or+UF1Y5wYy/uSJbGR/WtGnQKFxDWCMGygylvrcDU
	5jHh4N2ZPTd4N655xX63gxjsJgh6Yzav69aagK1dmsm72qIB4ILUokMrhPkqsF7TwhyyYhXXaNq
	KWx4AJEtkfC43hRVfPxaamyn1fQxg+ZLiuK3jdYfF+DApFK9payYUaCFjDvxFir8OZD8uBPcIIK
	VdNHj/Ir23hnTwGBYejcWwKnRYHNM26b4/WwsS7oqq03ZQ8F/Qa9aaxemVc7MSuXCS2tYhvYoVV
	L5a3XoOZ4b1rzH2YejBhTmxafLic22fNnxiMC/w9lpDz8G4FJ3
X-Received: by 2002:a05:6102:370c:b0:7c3:66db:a66c with SMTP id ada2fe7eead31-7ca38b522ebmr1122494137.20.1791463411637;
        Thu, 08 Oct 2026 05:43:31 -0700 (PDT)
Received: from fedora ([2804:14c:3b83:954b::e289])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98e39c39cd4sm3821051241.7.2026.10.08.05.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 05:43:27 -0700 (PDT)
From: Julio Faracco <jcfaracco@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/qxl: Fix out-of-bounds read in qxl_update_offset_props()
Date: Thu,  8 Oct 2026 09:43:17 -0300
Message-ID: <20261008124317.32199-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function qxl_update_offset_props() dereferences
qdev->client_monitors_config->heads[output->index] for every connector.
The connector list holds qxl_num_crtc entries (default 4), but heads[] is
only allocated for client_monitors_config->count entries. When the client
reports fewer monitors than qxl_num_crtc (e.g. a guest started with
heads=1), output->index exceeds count and the read runs off the end:

    BUG: KASAN: slab-out-of-bounds in
         qxl_display_read_client_monitors_config+0x61e/0x6f0 [qxl]
    Read of size 4 ... located 16 bytes to the right of allocated
    32-byte region

Factor the index-vs-count check already open-coded in
qxl_add_monitors_config_modes() and qxl_conn_detect() into a
qxl_output_get_client_head() helper that returns the head or NULL when
the config is absent or does not cover the output's index, and use it
in all three places.

Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 34 +++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 75d47e6b9142..92cc240dc9c2 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -147,6 +147,21 @@ static int qxl_display_copy_rom_client_monitors_config(struct qxl_device *qdev)
 	return status;
 }
 
+/*
+ * Return the client monitors config head for @output, or NULL when the
+ * client monitors config is absent or does not cover this output's index.
+ */
+static struct qxl_head *qxl_output_get_client_head(struct qxl_output *output)
+{
+	struct qxl_device *qdev = to_qxl(output->base.dev);
+	struct qxl_monitors_config *cfg = qdev->client_monitors_config;
+
+	if (!cfg || output->index >= cfg->count)
+		return NULL;
+
+	return &cfg->heads[output->index];
+}
+
 static void qxl_update_offset_props(struct qxl_device *qdev)
 {
 	struct drm_device *dev = &qdev->ddev;
@@ -157,7 +172,9 @@ static void qxl_update_offset_props(struct qxl_device *qdev)
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		output = drm_connector_to_qxl_output(connector);
 
-		head = &qdev->client_monitors_config->heads[output->index];
+		head = qxl_output_get_client_head(output);
+		if (!head)
+			continue;
 
 		drm_object_property_set_value(&connector->base,
 			dev->mode_config.suggested_x_property, head->x);
@@ -262,12 +279,11 @@ static int qxl_add_monitors_config_modes(struct drm_connector *connector)
 		return 0;
 	if (h >= qxl_num_crtc)
 		return 0;
-	if (!qdev->client_monitors_config)
-		return 0;
-	if (h >= qdev->client_monitors_config->count)
+
+	head = qxl_output_get_client_head(output);
+	if (!head)
 		return 0;
 
-	head = &qdev->client_monitors_config->heads[h];
 	DRM_DEBUG_KMS("head %d is %dx%d\n", h, head->width, head->height);
 
 	return qxl_add_mode(connector, head->width, head->height, true);
@@ -1103,15 +1119,17 @@ static enum drm_connector_status qxl_conn_detect(
 		drm_connector_to_qxl_output(connector);
 	struct drm_device *ddev = connector->dev;
 	struct qxl_device *qdev = to_qxl(ddev);
+	struct qxl_head *head;
 	bool connected = false;
 
 	/* The first monitor is always connected */
 	if (!qdev->client_monitors_config) {
 		if (output->index == 0)
 			connected = true;
-	} else
-		connected = qdev->client_monitors_config->count > output->index &&
-		     qxl_head_enabled(&qdev->client_monitors_config->heads[output->index]);
+	} else {
+		head = qxl_output_get_client_head(output);
+		connected = head && qxl_head_enabled(head);
+	}
 
 	DRM_DEBUG("#%d connected: %d\n", output->index, connected);
 
-- 
2.55.0

