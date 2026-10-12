Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BD149891F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819902; cv=none; b=SUh4XWifPSScryzViaMrexc9HLJ6YSnemdUwzrQ0dr67DdHPBIYr3GYB8ppIUyOP0p7z+LuOfVgwyG3uipZ0J1HOaFvnSdEldVUk9sBOc7L9d0Dilgkw1KXvb+lwNg2YgmYFh4k5ro6pRQ3jle7MlbI4dcTlcFrsbMpApu9/OH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819902; c=relaxed/simple;
	bh=zLR7JgJIzw44pFUWm86/5MQw3kQDZ7b4n71YXnam9jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sznm1Y36G8piiDcpnDAzojcZZZn2KHhckJhY9dooCO/2ApRPdGZeNslZj3aaiXAATKlnEniGdjk+219k1zPtq12cXiey3Vhx/uTEKeY7n9p2UzOR3kXhiUgw/n6+RZqcHQpMstGrBNQ+I4d6UwXiBUeiXa7g6E2RNKVi3sxjLV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8Dzno/Y; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8Dzno/Y"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33e6279a1d7so175563eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819900; x=1792424700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJlyzhoWQhc9t2V9V/IMOCakgx6bB3MzV1A39J6uch0=;
        b=C8Dzno/Y6hXYIGuX9nehOiGs3WkvguF0uiVlcEXO/oynWR8OZvZixja5bFSfAEIZZw
         BMmz+CHXOZ6JXe84tdT7/yD1NIM0bM5bh0UodvZSAAuNL3btzkbNqDJao0iiVria2HCW
         lL2TaeKTvPzg1G+fVvphinMacHuOUpGstw8hmkl7OUQ9YDP3hSHBRDtFL2QKKuMfnM6r
         FXCGn0f5jdovsZjHB8x0YgN579/jxjYEhq1smitF9/tzpKE2IludbEYnVsIzsAj1csD0
         kOkHsfdM8yOpMpPHfnr/jnzHH38IMn0C17hiTxjRNpViKxBhwvaxZul3WRisglLeTrmG
         +8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819900; x=1792424700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJlyzhoWQhc9t2V9V/IMOCakgx6bB3MzV1A39J6uch0=;
        b=uw4f1c/CPFy+0yLKp0nk40brUW9Je5lJnyphM1xBj6tn/dfjUwt88DV2X1hbn5Yo35
         mLQOOSms1Ef5szDl7F1tw2iHYFl0Tju+HTEtzr25Fb5+Trtz3kOT+F5A12YzusMFsjhU
         axnQbUme7zOI/sNnhFuaLLgmlzZG6pPcwqrPPq21yuq19Nci+zpdLXnJIq4VPB6MCcZO
         Pfhx9fVFSYTSONSA4w/dRTGLmJUJbbLE6dtif2CcHRpHWENxy3od/t753K+ngGDIz5LY
         /8UH2tMJ0Uvhdqfb6lYJKxZ+tgoKmGb3WOSr1TjnTvflAq+0yIQQ5hm7Z4+u9/fgY61+
         1tNg==
X-Forwarded-Encrypted: i=1; AKwUvBwdlyMd5s2gtN1zhspNXpUACh66lEW/FoYIQyFgUdisUsWHv85wMDzmiQVnzyy6yIDyXdT2wqAaU98ZMxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpiVYIa+ofDNt+3PsJ7myTMt2ARaMUfSaMwjEZ15YgDeNiqKk/
	ZejjFltyQVR1Xu8/8Fc5yJvyesecAvhsPFw+v3loPrJ5UaX57RfB93je
X-Gm-Gg: AYBFou0H58iOBdM85gpWR4hrDyb/8OOMtjyq1LQQiZNs/mQipzbJpWSokt+MYv7a2/l
	6CWzjztV5XY6jLRNeARKIemamgUh6TFhvdDJcJKk3TuRFd1HCMAENQzUxjG6q7MABtGCVY1CN3E
	QIlUPBLBSZqcaBdNVR5WpdBiGWHR1AHc3bazBu7FRGGI+ZhMDsPqnhTJ/Imz8HsOoIZjml5Nuwh
	eXqffVUB9D3iryOKqExNpFWkgKgViNI2UYQwAKphvpjr/aK43Ibrv2PA1Elvg0wODdLLewqdxft
	Vq2FJs6Ex5/KLxeHcTsiG7xe5Dr5mvT1BenwA+/VQ+ZAFuXHwRFfoHpuYzj4FvLlFxCIRk3U++D
	InnIhej5jvsNFiXXr6bOrxN08uhgcS1FkRG3oRAwP+xMKJ+teHRwoET/4/6+AzGkR8x8qjvMByy
	NsnCwssCtvGbDB7kXTVlCgos/qpqqSIRr4bEQsxmXkkgQi1shwZQro58CsQa8lFCylipIwtP/e4
	JHv9/CcF/nnGs/1SwRSgL9jdQTszLGXgnBfonOIdzSjdrvU9oN3EDrrmBjO6PR1/b8Xt2rgrgNS
	gLBg6bk=
X-Received: by 2002:a05:701b:291b:b0:14c:aaa0:941c with SMTP id a92af1059eb24-16a64ba421cmr13044123c88.35.1791819899484;
        Mon, 12 Oct 2026 08:44:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:c1bb:8d21:6c07:8107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm30728040c88.19.2026.10.12.08.44.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 08:44:58 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] drm/vkms: Fix kernel-doc parameter and member names
Date: Mon, 12 Oct 2026 21:14:47 +0530
Message-ID: <20261012154449.42015-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A handful of kernel-doc entries name things that do not exist. struct
vkms_output documents encoder and connector and misspells wb_connector,
struct vkms_connector calls its base member drm, vkms_crtc_init() lists a
crtc argument it does not take, the CRTC plane helpers say crtc_config
instead of crtc_cfg, and vkms_config_plane_get_type() is written without
the get.

struct vkms_device used a dash instead of a colon, so its entries were
being ignored rather than warned about. Switch it over and drop output,
which is not a member either.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
@vblank_hrtimer and @period_ns in struct vkms_output are stale too, but
they are already removed by Thomas Zimmermann's pending patch, so this
one leaves them alone:
https://lore.kernel.org/all/20260420131831.242882-1-tzimmermann@suse.de/
 drivers/gpu/drm/vkms/vkms_config.h    |  6 +++---
 drivers/gpu/drm/vkms/vkms_connector.h |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h       | 11 ++++-------
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 8f7f286a4..56805b0c9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -269,7 +269,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config);
 void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg);
 
 /**
- * vkms_config_plane_type() - Return the plane type
+ * vkms_config_plane_get_type() - Return the plane type
  * @plane_cfg: Plane to get the type from
  */
 static inline enum drm_plane_type
@@ -373,7 +373,7 @@ vkms_config_crtc_set_writeback(struct vkms_config_crtc *crtc_cfg,
 /**
  * vkms_config_crtc_primary_plane() - Return the primary plane for a CRTC
  * @config: Configuration containing the CRTC
- * @crtc_config: Target CRTC
+ * @crtc_cfg: Target CRTC
  *
  * Note that, if multiple primary planes are found, the first one is returned.
  * In this case, the configuration will be invalid. See vkms_config_is_valid().
@@ -387,7 +387,7 @@ struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_confi
 /**
  * vkms_config_crtc_cursor_plane() - Return the cursor plane for a CRTC
  * @config: Configuration containing the CRTC
- * @crtc_config: Target CRTC
+ * @crtc_cfg: Target CRTC
  *
  * Note that, if multiple cursor planes are found, the first one is returned.
  * In this case, the configuration will be invalid. See vkms_config_is_valid().
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index ed312f4ef..52ae97af2 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -11,7 +11,7 @@
 /**
  * struct vkms_connector - VKMS custom type wrapping around the DRM connector
  *
- * @drm: Base DRM connector
+ * @base: Base DRM connector
  */
 struct vkms_connector {
 	struct drm_connector base;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 0933e4ce0..1c94a2dea 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -202,9 +202,8 @@ struct vkms_crtc_state {
  * struct vkms_output - Internal representation of all output components in VKMS
  *
  * @crtc: Base CRTC in DRM
- * @encoder: DRM encoder used for this output
- * @connector: DRM connector used for this output
- * @wb_connecter: DRM writeback connector used for this output
+ * @wb_connector: DRM writeback connector used for this output
+ * @wb_encoder: DRM encoder used for this output
  * @vblank_hrtimer: Timer used to trigger the vblank
  * @period_ns: vblank period, in nanoseconds, used to configure @vblank_hrtimer and to compute
  *	       vblank timestamps
@@ -234,9 +233,8 @@ struct vkms_config_plane;
 /**
  * struct vkms_device - Description of a VKMS device
  *
- * @drm - Base device in DRM
- * @faux_dev - Associated faux device
- * @output - Configuration and sub-components of the VKMS device
+ * @drm: Base device in DRM
+ * @faux_dev: Associated faux device
  * @config: Configuration used in this VKMS device
  */
 struct vkms_device {
@@ -284,7 +282,6 @@ void vkms_destroy(struct vkms_config *config);
 /**
  * vkms_crtc_init() - Initialize a CRTC for VKMS
  * @dev: DRM device associated with the VKMS buffer
- * @crtc: uninitialized CRTC device
  * @primary: primary plane to attach to the CRTC
  * @cursor: plane to attach to the CRTC
  */
-- 
2.46.0

