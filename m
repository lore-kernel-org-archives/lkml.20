Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908968;
	b=tk7hEitG3Kt3eyxNgsWs5mj5eLBu4lnNeRkokHLmwR4G/ONcJhnnyGDb2Z9UF4DgSX+r
	 qs1SEm3Z6RUDqkj9wqot+zQvkpvXSJN4JJpfUEoK4p87LUDAY+ToLr0F8sYokAou68ZTe
	 20jWNtHi1Pzo4EitbtrS9hX7/eSh/TFRcW/WEkzIdmPypYgugn39ahLfos0HNxGCI6sYK
	 cLuwhE6wRxAo7YI06MEo43jtJbGQ8l+O6ZJi4/FyyLPwVQfMctJWla3aXquK2mMV18eAL
	 RD+4w3VI/eRxp1nLQVYONp04eq+4HehyXI8yM06KytGOlQvqbpYhoI/g/YfAjAbXr5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=J9CDqvqYpeJFecYwEjdsw9s1ktTIININYWKKq2RjyQU=;
	b=XWkPSDIgFxJDtEE6Eu1RTfZI/CWmVGMvRjEAcMEgnDO3YxNCli5L4frfIoBUc2XG7TH3
	 VzSPkwC6iIjy2+XyatdKxVn92i+sbO/ZZ0lygUEeWvIMGxhE9Ysz/eZALEN9dNx8DCvVn
	 oF/QlJ8jbAis2vuykgJ3ZWczjJ6EMR/TB+vMR4gzwAahrfgfuZlMUPHAWVLZH8Bba4kwY
	 PeB5Xx7SRSS4b7msUICReG+gVH4KJihiDYOtS3bwSjJu3cXoHM2hRVnt6Fk03/cNZ3fGX
	 DiEGvAAu+twXslUBdDcC9me7cbyD4cVuIVAg+q0gvFJRloXIBOntatyIl9rPmiCZp8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRrftiz6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F62B606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F62B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRrftiz6
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d30639709so610893466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:49:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794908966; cv=none;
        d=google.com; s=arc-20260327;
        b=kZAvAhS4EUwfsHtPYJWe5kjMLrvjfbYtAqqB5lNdm/ec+oMjw5C3bOPy3eG5Rij/gJ
         Djpnz9Ojcq4xsmsCWZPTiNKX/wLT6J8ZOkFzGlxjtiI2oVdmxgSUCt6+4LTb6HQPgX/V
         qChgOh9em/oFVkKt8simdJtbtsmttsxTTMSPTKV/tEl9YyOypE1p1Z84CD0khCdmMAdV
         axd5A1BOcBtItcr2+97large+QHRN7FmTyaGF5Lr2cClULTzlZ2hv+igAPoKNLdWxoRB
         Whq2s5Q5Yi1aR5I3cEZ5SejrgGfrD1HN6VXXFfHaVSw1GEGVs3lqacW4loanEaKlhWQh
         Bpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=J9CDqvqYpeJFecYwEjdsw9s1ktTIININYWKKq2RjyQU=;
        fh=uQ9lhratAu9ZG1AoN4LMCwoKSqhQruf8ESH+jASzX8A=;
        b=mZlTxPAUNSDf8M6KBe+ue+Ifpsp0wdVnvxfmw74L9Gm9IQyO4ZUZ0evLiO3o3cCn2R
         1j3s0a+u09LL2/yKr6pUUPHWONPsCSD1672kdinl6bl7d3QPXDkUBC453qDjB1KQKq6I
         cEF4N/98v5/Nk+J2FToLg6X6BpO8RboGdsKg9FqrHXDQOSIGMFQcp6L7Y6C4QmI76Qny
         3MghUI/oAJGdukiz3sS6yLL4ba7yQD+xvXU6YK3lfXg+hCU3gBsJ49fASAl2rSfITeqw
         la1oO3P0FBG65FSc19nInR0kuJnHU3gv9VzKxGx81KAtwaZqpxbaGStmuBxrO4YrKwcS
         zgjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908966; x=1795513766; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9CDqvqYpeJFecYwEjdsw9s1ktTIININYWKKq2RjyQU=;
        b=YRrftiz6iYTVYkP9YanqkT10MmrYWn1APMCZ8xb4/BPQJVHsSo7syHHRG/YseEFtsG
         E22lnjccJA8+Y/X11V87RvTFbkG7je9XL/O+PvTyASuvEgcDvx+l3an/qKvxJEsSwu1l
         i+84tFnv5r30CxZKq4C+XRRJlVcjcRmZa1bbmRfJSU0vnPuHd+61Kg9LqEMY2a6C0v3o
         rTSCwz4dXi/Ha303ijD90b9UbX+d/aadMzL4QjZFq6nnXlwLs643nTfEMDw+1CbqUzGz
         rfHEvGoUJ0tqo2qcUh1AJ5FiX4oSOdIhscc5kF6blqgLj9IUQNCkirmkaSsDPC9qnBCQ
         Vs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908966; x=1795513766;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J9CDqvqYpeJFecYwEjdsw9s1ktTIININYWKKq2RjyQU=;
        b=vjjLv3mm8SXsg6bxeht63FBTJ8sBEfGfBYNkGb47S1E/G/4U4R/22rjdUNpjxrpWxD
         4PEjS2+rzi7bwLwFDEsjalM43I2Eg8eRlegrl3prJa6wPSyyZP7kQP7dhlhG5Sqr2OKL
         Un0WQsOkYi1JjrRMkXSimGnTDY6D6EOPopOOrM93TG3HloPXqUgCre3PEksKCzYjwXlf
         FViWPbNZdD5EC0XOWBllSZI61qA3SoZODmrzSHzkQevc3CL/A5WySq7ipNr92rccfIiT
         VU+H33Ks4LfO7JqqR1yw2djD3mZPF6CV+pzu1JF0CTLOB5qzLKqlPbiXX+14G7doU2Ju
         iTTw==
X-Forwarded-Encrypted: i=1; AL+hErGnQgeSOLhyD/WEvSE/Qdp1wF5jwXRl82aTzMcZaGvFbHWiSG/Ep2QlSuuRREWtA7Nzz6xOSynLAL2vanQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J5mKEkIviUlhaKyfzQh+0mUXTMZ1DoQv8U2uqUZAR+LxSTerL
	flcMeRK5dr5t4uJnvpHxTBEjRrA/yXHsIsRcrQUv2f2cDPQ103SEOfvBES6aTnwL+r/qqT2+XBD
	F2vn/lf7/2hlt8A7liV/8cGxhvVZBW2Q=
X-Gm-Gg: AYBFou0SXZUZQALKLMGPPzvv4UdwYViwap4tAX/eLQcgPpBg1PXEjpZis9C2tFW6LeZ
	7A7FF/fHfmdRdlyMiWi/0Bvx1FHn1rf7GnSNiaLsTqKvExhdddFJyTf7nkDmCqJYTm4l9qwp2jb
	2tW8cdNaTrnD0+Yam4mYTd3ck7ZvKfnuDOD+BH9JTraD5HvgJu2k+yd2FUVn13CaCorHx1qzdca
	LEau7GMWgmSah3XF9gt0SL7co9FwtIXoQv43VvQz6faE1u58mQ7YBmo9kXvFFUb5nJV2+gGqD6u
	oDd39r1NFqy9NgXXFgIk5NgubNvrZoA16HfIalyR3FXR9l1gD6omWatiW9yokfMWpIkcO+QpkJa
	vlHUKR7zSNAVO4bV7gozGjbXHBOKsQhR0ZOue
X-Received: by 2002:a17:906:4fc5:b0:c2d:c739:30e1 with SMTP id
 a640c23a62f3a-c509643c050mr1138802666b.32.1794908966534; Tue, 17 Nov 2026
 01:49:26 -0800 (PST)
Received: from 118528743069 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Nov 2026 04:49:25 -0500
From: Christian <servidorjarvis1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 04:49:25 -0500
X-Gm-Features: AclHuK8TuW9Lwli_wSH5s4uz0F-M4xJLcWjzRm-qOe_9Jd1man4iRPGpyUrD4SQ
Message-ID: <CAMas6S3zMKwb5KZ-UNnTd92hZNN0CONY28bROWbojYHBNFCRgg@mail.gmail.com>
Subject: [PATCH] drm/simpledrm: Use vblank timer
To: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

simpledrm has no vblank interrupt, so DRM_IOCTL_WAIT_VBLANK fails and
Xorg's modesetting driver falls back to a fake vblank of about 1 Hz for
Present. Every client that syncs to vblank on top of it (glxgears, mpv,
Chromium with its default GPU vsync) is paced at roughly one frame a
second.

Use the DRM vblank timer, as bochs and cirrus-qemu do, so vblank events
come at the rate of the display mode (60 Hz for sysfb modes).

Measured on an HP ElitePad 900 G1 (Atom Z2760, simpledrm on the EFI
framebuffer, Xorg modesetting + glamor, kernel 7.3.4): glxgears with
vsync went from 1.4 FPS to 24 FPS; Chromium 150 (ANGLE on GLES)
animating CSS from 1.9 to 13.8 FPS, with the GPU process no longer
idling between frames.

Signed-off-by: Christian <servidorjarvis1@gmail.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c
b/drivers/gpu/drm/sysfb/simpledrm.c
index deaeb7d1f..3461a0f98 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -31,6 +31,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>

 #include "drm_sysfb_helper.h"

@@ -583,10 +585,12 @@ static const struct drm_plane_funcs
simpledrm_primary_plane_funcs = {

 static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
 	DRM_SYSFB_CRTC_HELPER_FUNCS,
+	DRM_CRTC_HELPER_VBLANK_FUNCS,
 };

 static const struct drm_crtc_funcs simpledrm_crtc_funcs = {
 	DRM_SYSFB_CRTC_FUNCS,
+	DRM_CRTC_VBLANK_TIMER_FUNCS,
 	.destroy = drm_crtc_cleanup,
 };

@@ -874,6 +878,10 @@ static struct simpledrm_device
*simpledrm_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);

+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	drm_mode_config_reset(dev);

 	return sdev;
-- 
2.47.3
