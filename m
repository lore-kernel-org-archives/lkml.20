Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D946AA96
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145744; cv=none; b=d48tyrtYsl5XHWTxepNdrEcpCCeWGla8+hkd35k9e1T85/yE29PJxRYpQYlsxM9tXql58GglRNB0vdguuH1qArbcu5h6mtGExMzKIwfsdwc9gTSmdK7pNk2tuaO2nD8P5RISsqsBhV32qFHq8rCmcvZrq/Px65MfFrv7XXcuVjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145744; c=relaxed/simple;
	bh=zLR7JgJIzw44pFUWm86/5MQw3kQDZ7b4n71YXnam9jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EhsxuW9T8AY31fzlc/Hbiwi5rWE7e1I11deOYB3ohrzf1GibSDw+v0fuyBYDCKRd3FsIHynLr/9EzzBLInwa82XKpLuZU1BGcPg2eJV0DjHt/6wP34P2Dua1NKlv2c8tN8vGqVZtEt/actsx7FpXTWRtweJWvSB3xZTm39Na+rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMNuVDJx; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMNuVDJx"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a813079a55so587793a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145742; x=1792750542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJlyzhoWQhc9t2V9V/IMOCakgx6bB3MzV1A39J6uch0=;
        b=kMNuVDJxRQqry6qftwuFquo5BOel+onoFTI07bD0e13XY4p4kY/6HlVVX0dggkT3OB
         iZfS4lTN0ahHdQxiQu/6Qpokmnk8m1HjYrBg1hZLfY3Eg2Af6Nl25koJpzlBmsyQ8FAi
         Ve8AaO4yY0hUY2A4hBXTF/pPPPEDQugmZDLNp4iv47YcN4Sqf8iKtk8dWFCwZGNtfLNU
         JcqzAp4JxDEtBBR3+/dv9VtTDdSD7FPU3zRzZavCEilqohSiLN8rvgIEyZZaSE1vs9hF
         mzvvCHIsLB3N/26uXoBC51ciRsL5b/8bYZkladRaCSyEyWlBtTaeTRnDXPujeooA8PcR
         DWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145742; x=1792750542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJlyzhoWQhc9t2V9V/IMOCakgx6bB3MzV1A39J6uch0=;
        b=wFyhqiy+PIHLQNvi+LkSZCrd+oC0chKQidFnBcXkU4FtAWE4ccyRqcRYrOwiUt2+Fk
         EQTXL1wRNuw6mXKgV1CDYFhcIYZAsNzVb+aMHwRI/cVTGFzVpd3RI4Y/SmxV3XFEn3Br
         hV987x8PM9qQxdpjK9EbUkcUaa/R1/10kR7xNmMUKfHSqzGTmpV15Vj22st8N93yRVjy
         kFOu8F/3WkM1kWrSfvyvg0aPTSsf0LW0I89IEcEPdgxamWPthb7ued1ziLbTP80/4KRL
         myOSXVWJ5tU6QzD/nxbMn/Y8isRUIzdCcTjr95C9DNtkH6RfRHTQ6tsPlSbHV/x0kknv
         JzeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQR9sHqlVv1cwtSTzbJZU+Fuiz5U+1BpV9cma1c1qsHpM5Eyxdux/ae8Gz533p1SQSplV8BvHzJaraTuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKufsHxAaDEy7XqrhfFroklzz1CDFJzMZQNTxr/Zzy+9svrNSn6
	fuIo/Cpj2NJqYMOSruNFs3CGhzjm6PYgREHZNkxQCzpZQVXHsZPQ1FDJ
X-Gm-Gg: AYBFou1G9jH1FBTluCeRQQQCSSTTGxQekSj4B7Em8jbjxuKj40Mju1ZTlCqmQWeNLsj
	/Les2BjMJkTffFf2uKiQMQn1YvCMtizN4AiaDix+ryd2PwNBX3SLrfoanssP4GMSAbFKsz6x0O3
	9Nou7Qkc2kO8cKVELune9AVMY/6nNTNpgcnTzQ3p/TxqvvIZoJW/N85MdcoKbCQx3/SqlG132tl
	JjL9aQzXCnqAuSDjSX7f8plZ93MzS6fXmveT0j/NfD7oLoJjCIBK/gYVudPHhjH8LrqaU1IfCh5
	OHDedifFuSdm9G/Pvu78HAUgZ1TwqMB36HVO1qyAl5xOHmCTaAiBvyg7UzlUASiSA2wZLlDdLSb
	wwEzILft1S1Iw2MkdK/utzSV6lrk94YZuaSoYSr8RLJeWNFdKmbQiqT2Q3r8RF7+KR7R2X0GizJ
	OZpCucpUr+1Ge552etet7MAtDFzonqcTzX39djexezwqjbh1tJPcNNllZ4rBDP4bAsZEMo/usRI
	HYA8spkMgAS1xLLLZ9EsNSHwHPHT0KXOxjYV6R/ep0EUwmdDm6tiqbe1n8ZsD5DKFYcTPil
X-Received: by 2002:a17:90b:17d1:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3acbb7ffa6emr1720514a91.18.1792145742097;
        Fri, 16 Oct 2026 03:15:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1467:1666:71b7:b993])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e7548sm8682651a91.1.2026.10.16.03.15.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 03:15:41 -0700 (PDT)
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
Date: Fri, 16 Oct 2026 15:45:30 +0530
Message-ID: <20261016101534.14179-1-sinha.aryan03@gmail.com>
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

