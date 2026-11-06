Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996325;
	b=ljBAmKwKPSLT2+PytB77CIFrE4sJvqo8JiKQlBXLo0pcvE7IKlLYtap6/f6GRdLDMGi8
	 vjXeSDFJJO94q0wzsZozW2ROVbyiiQ3UDO0ZQtwPLNwdGMqPhVLkqLv0Rs9xr2k/1MZXj
	 lHal93HhP9pxfLQUlG4gQCiQb9ij58OdF5IdwAgXyW5+vGAOLZ4LGrFveTh1FHUn7nVt7
	 4QVKJ2xDev9CBCEMI70sqHau6Mq4qSwa87RZ/HE/YCoBllHgDyPOO8smGTsblf+rE5kpo
	 Mtu2b+SFbIqXG5m/+ysrT6woIF/7Y+jd/chzmycMcenG5qoLYsRK0it20ULWciTqbtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996325;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uSJ4vbMiyBJ3KV16f/IRC7Rj6KoRMpICsB0ySFtNe5k=;
	b=n+fsbA6Cd7jd41ECLjJIz3/5EabXwN5Y20g/H0vGgdtxyF42BVi+fgXnhM3j0QabVvCX
	 1qOmceTaE5K7mrg66ujsgrnA55MYhGw3NkAqZ24CsfkWWxIs8KGDftVheVQNkVjPyAbUI
	 YudbQPULx3eGC50c2GIqgezD7ToBLi1ePnP8WVB4Rltwskrc4dqi8tQFizGU6Lz+oP3SA
	 uFKc9bIFHo2/23qcmGGT2uns3EM5Cv2l6YFAZQaMy5CBtf7xhMo+9jtfF4xoqeVEo4B1h
	 lxptKiSJgBR6iOCdYO/G3eWMJ4Xfmn647neZvg555eq8QbFO7I0jyHzvrlBklUiNQtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DNEFXheC;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441A606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7441A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DNEFXheC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793996322;
	bh=kZs66Y8zCDowdLKEog8fI1dLv9mv2m+LG+S1l3NtB5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNEFXheCXonUAnTjZcsXS/pSGpUUO+xa+x9BYa+SrqzuGepK9FAHiLBp2a2y3CE1j
	 I1xBdPMAtJifpI/LApp/LtuZ80F6AAF5R78mqI9ZOuo+AJ0etLKFiG6FE5U0vcmo0H
	 VjmWE8AO9gvyyWhZ/PqyrZnem5M8cLm6zSkU5PlFZ7YaXvB0X7rME0kHURMVf1d32A
	 csgUfBCxYQRhVTg73MGwPtzOznANQZ8rNG/qNUi3S55MJkuLVGW2RZ7RQGM1wncUMI
	 jpHXS5kejrQqojWFQDfuULI/yNAoz5FADLxY6KOzID0YU/Ehm9/9F3YDTSvI2StWy4
	 Db4FB8r7H+blw==
Received: from archlinux (unknown [100.64.1.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: leandrohrb)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC02317E00AF;
	Fri, 06 Nov 2026 21:18:37 +0100 (CET)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	alex.hung@amd.com,
	daniel@fooishbar.org,
	hamohammed.sa@gmail.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	melissa.srw@gmail.com,
	mripard@kernel.org,
	pekka.paalanen@collabora.com,
	robert.mader@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/12] drm/vkms: rename VKMS_LUT_SIZE to VKMS_GAMMA_LUT_SIZE
Date: Fri,  6 Nov 2026 17:18:02 -0300
Message-ID: <20261106201813.129911-2-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
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

This is the size of the CRTC gamma LUT size. So let's specify this
in the name.

Reviewed-by: Robert Mader <robert.mader@collabora.com>
Tested-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 4 ++--
 drivers/gpu/drm/vkms/vkms_drv.c  | 2 +-
 drivers/gpu/drm/vkms/vkms_drv.h  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index fe17f49305a9..019d7bc90cdc 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -222,13 +222,13 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 
 	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
-	ret = drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
+	ret = drm_mode_crtc_set_gamma_size(crtc, VKMS_GAMMA_LUT_SIZE);
 	if (ret) {
 		DRM_ERROR("Failed to set gamma size\n");
 		return ERR_PTR(ret);
 	}
 
-	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_GAMMA_LUT_SIZE);
 
 	drm_crtc_attach_background_color_property(crtc);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5a640b531d88..86a8a95694fd 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -113,7 +113,7 @@ static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_commit *s
 			continue;
 
 		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
-		    > VKMS_LUT_SIZE)
+		    > VKMS_GAMMA_LUT_SIZE)
 			return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index dea6cad3f1b9..34b855431af3 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -25,7 +25,7 @@
 
 #define NUM_OVERLAY_PLANES 8
 
-#define VKMS_LUT_SIZE 256
+#define VKMS_GAMMA_LUT_SIZE 256
 
 /**
  * struct vkms_frame_info - Structure to store the state of a frame
-- 
2.56.0

