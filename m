Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B5643F4CF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939311; cv=none; b=MvIP94vDAoE1Chx5fEVTPYsMrLVeDFnspwL6I7PUJ9V4j9CU9NDJdwpZtbJ0rx0YgRlTnSK9Hhv0FUJxLMJPzJwsfunPgmmO+wDMn6b5+9c7KroNlXMnSMMx89ZcwQ6iq+mj1MVzpR2MCPcRLJak5XQ09DzdTsza1eGujAXauc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939311; c=relaxed/simple;
	bh=9vP7F5wuPWbwJk3ltHNtDQR/ieD1hIKW7Aiaaw7mG/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tVr9RchAJCmCQbKzsrgqS3F7RPW5slNrK5VNUJN093EdEl8TVPFpgRKaSONOe35m1b7Y2MQjv3w2QP7q0A/o4fajH8FkaUFBiAiQcSIn2WYEMUwBGQbgmhv4u4eRgqEv5wowSkh0gOjtA1uJnNOB9o2B5LFLi2Ptln2vgeEVBjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAxTIgSA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAxTIgSA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so3564655e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788939302; x=1789544102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwJskRf230nVoXvEhVqyDUFt4l3Cq8VmWwWkkc6yiy4=;
        b=aAxTIgSADEEl7sICNWH4nBCdcYjpaWX9D7o1bCAH/HFgD7QYH9zzAfw3jKYnJTyjQI
         ghE2R+W6uQ6lGrZAmh/sLReyVjYAEC0wAcKJtbYyJIt+R1w5Vt2pu+OwrSMthJ48SpgN
         Gu5bjZ7nJC451bDv8cTDc5JEWyznUO1UlXAKamZQAhhlsTvzSfyahqGcDqVCPJo3CWSN
         lZqlT5OLzEhaiel1svH27ZuQQnZROnD1zDpkAnL+49w+F/XMRSCHGquQGvC1YOxSP1j4
         beSQzm6t45RUCjtyT2m48dXh32Y8j+XUa3L8C+9YA8smelW7AVEyMr1PUgoqY1t4EnSx
         IpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939302; x=1789544102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwJskRf230nVoXvEhVqyDUFt4l3Cq8VmWwWkkc6yiy4=;
        b=DebMuIVXVFoIjDvWDbi5JwjxEd4SdiiNfdO/z0ECJOzM/leS2+420DqJfQ0XckU/RN
         km8S44MCpF3DjryvEq0USkkQ1zVXeY/Ndjibm5mDkqymoShEZR3/75Xl8WsEFJwAZwnA
         a3bUErtoec+nqBhK1prsBIB8h+QAExozMCHKDnbIo1Oyo2OzayHy+UVDzexTfEAc6SL7
         Na/G0d3wy7HmvUdLQ/3m6sz95c6jWDfQegmZEnTNs7jJP6bnu/CPhbbTWrjnCq7SBSXH
         dJeRfNOGEWOFMup6BE+ZnB5JfJ20M4vFnrWLJNc7YYLjvCbIG9Z9V7PaGew1M3pqmjfa
         cbqg==
X-Forwarded-Encrypted: i=1; AKwUvBxqYVw5T6Q0Wc1Kj5rscjAE9pGMnzl2SCF6GAzYX25C/iwSLMW4WzH1clh5excS6HskGB4P0uiB+MLzrh8=@vger.kernel.org
X-Gm-Message-State: AFuF++n0jzaMkDQ3KayGO45kfg1gchIk5cp/s21/X5LM35xO13cKB1fb
	8JXprVirOfYKDnWoRz2D34wu6JabVEbmBFcakDHje8flEFCwt07zquW9
X-Gm-Gg: AYBFou0WrxnEe0gCFc57HWQ+3TEpzajwEG1brJF6FmRB7S0R5gq283Tw3z9Uy7QRJvc
	HkgSGowh+IAI0wbUWrzmQ4Y1R2cWZ5t539F8w6eJEerrHdGCI9DkUn1zjr/F7w6s19QubnBbycH
	+JEQc6SfiqgHeGHfA50IbRsTrl/WP0FNTzGiXfa0lVC5mxUNEy+N3niBaWYQC2UgiuPkxp8IS9K
	cmd3sHoKb2iqTRn0BLf03Fg9KKz6/Bg3m92PIQ4tHeE2GujAE3H9+f+RYki0OBHKgWnd3VjNDI2
	/agpHIvNN6og+QUQeRU6Bb6rJS3C/UZRfpeVWN+W9DEN43yotBe5ino0BJ0TdL0JEkma7IOrI2p
	MuYOczrNckmC1nhGwxWKbBPyMpLgestlUCJQV8wnBRUenPvgzObLZxMoNUOYKgxjh6D241N3Fxn
	Jh6uhbshKnftrJPkPY1bg1iguXnAbWM8LaaGqMgYukqbJ4wOx352ni92SxsSVfjVkcisbUSggPV
	uYEBCeF5O0xqu43h2N3uLdK/9hjnnxGKgOAi7reVq8eeyOVCgHXYjlNclDkWfVOzvdRcrYeKHO9
	nOjvK5WTYAXyh84ygqPzu4lSPd2Rul2SjKmEXuo=
X-Received: by 2002:a05:600c:604a:b0:49d:1012:893a with SMTP id 5b1f17b1804b1-49d1f320b72mr55194575e9.7.1788939302009;
        Wed, 09 Sep 2026 00:35:02 -0700 (PDT)
Received: from PC-Davide.homenet.telecomitalia.it (host-79-24-252-102.retail.telecomitalia.it. [79.24.252.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm588770945e9.1.2026.09.09.00.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:35:01 -0700 (PDT)
From: Davide Bonatto <bonatto.davide@gmail.com>
To: David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Davide Bonatto <bonatto.davide@gmail.com>
Subject: [PATCH] drm/virtio: Replace deprecated drm_simple_encoder_init()
Date: Wed,  9 Sep 2026 09:34:38 +0200
Message-ID: <20260909073440.52641-1-bonatto.davide@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_simple_encoder_init() is deprecated as it introduces an unnecessary
intermediate layer between atomic modesetting and DRM drivers.

Inline the helper call in virtgpu_display by defining
virtio_gpu_encoder_funcs with the default drm_encoder_cleanup callback,
and migrate directly to drm_encoder_init()

Signed-off-by: Davide Bonatto <bonatto.davide@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index a1a875a0c706..85986578001f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -67,6 +67,10 @@ static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs = {
 	.dirty = drm_atomic_helper_dirtyfb,
 };
 
+static const struct drm_encoder_funcs virtio_gpu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int
 virtio_gpu_framebuffer_init(struct drm_device *dev,
 			    struct virtio_gpu_framebuffer *vgfb,
@@ -306,7 +310,9 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	drm_encoder_init(dev, encoder, &virtio_gpu_encoder_funcs,
+		DRM_MODE_ENCODER_VIRTUAL, NULL);
+
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 
-- 
2.43.0

