Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA6585974
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156736; cv=none; b=tWS3V2CYdpADYI7YZ9dNefV1ZN3vVcHpaXvSP+Km3MIFoWv0/GfoZ1YCOlBNyCUhpyj6EOaW2ngWCrm9Q3C9prbVbrNJmBJ+DNtpQmeUgwcvy+QK6Pv7Pt7NBU9OUmkR5w2pPnKocEqlNJjT9jP419utJogj/YJBy54OVFFPKKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156736; c=relaxed/simple;
	bh=v5jCBu2QzUm5jVmHqR774C4Ti19LoRQS8Xm9FGYJMss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hCf+G3qt33y5QZ/idipN24N8hShITMjpMyUlTfF/nxr96EH0tRx6Q8mY7DrbsqiZDzuXCDJNcw9Gyh5qd/ASeN7RJDWGSqyW20zbvveYGNyRD1FAbWHyylVYeOocwcvyag+/Fmbw7zIIj3fiEfKLftVXPbVr205+VVno8HPhbhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQwCjPsW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQwCjPsW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so66692f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156727; x=1789761527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQc/+XJKcMZ4EW0CsqUV1SQXS+g/1U/+e+C+i+eqIyg=;
        b=IQwCjPsW/Nr+I4ydBvItYZ7f62wwp9dATiLuAOyONI2Edkr6dmuJaxjNtv3KJM1qnW
         im/CT4gWGOgUcZ4oRWnaD6R3G99X6Xo8cwxlz20o1QnCZUvr5nzh7kr5CsupQZqoEGPN
         NfF+OdXkdP7h2G1o9kYGlXXflx1+lLVEpk0sRqJwNeKuYXLunU91Bq7uRCKiWVFJg8AE
         ezY7ARcQD3RAv/v6AbzvKiZG+4/XFe1rn1wL4doAcP3Hb3c7fo9nT8GD9Oi85nKDBPBY
         Xddpp6KSvFHyqQlDFCIxagZD8D1lrUWILLNE9zZaj8zAPaG/BPtbcAclUTKJkcrJORBM
         EcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156727; x=1789761527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQc/+XJKcMZ4EW0CsqUV1SQXS+g/1U/+e+C+i+eqIyg=;
        b=n/NnHsKyrHkZyh2oPLDiIW4Gol372zMXtpsDiPDekgA2T1ybJREm0ZWngn7q0lItsT
         +eMkeapcMC2WqLEWLlgZ5ca5bYYtoXfpEBbwWEDS75rGfI3VZZa08EuPwvSIITbejjUf
         XOjJqDf/kT/Dlx1T5u6/mpODpC+DqO3tbdpTgeEzsUFN554dAa5s7242GPsYd+w938GB
         7einX+xtlBiv6RI8aFlvXLy0iwclEVTx0o76EMb2CnzyDxb8eBl9faz2PzzPesyzuYBe
         74sVkX48yjmELTPQ4HZ/yCylDgSMzXQ2feUwkgghcrGJAofUe/ejBv3O5Plj72HAjYef
         IXAA==
X-Forwarded-Encrypted: i=1; AKwUvBynZqj+RqYqkzju5jbrvoLYQkWeHqo2em5JwfAF94Tr4bH7H16pm/c4/IE/oBp2uVKE79kHBYBigFcLfso=@vger.kernel.org
X-Gm-Message-State: AFuF++lrrvfRLDSNFMvYWKEwP85BMSxfi8zHaMM1oTPatjWdp98bDM8o
	SHozxNmNYSA5i7qt18Y4Cxf9Udpx0ZsFN0nu9YYGiLQPbjmXjLPoUdds
X-Gm-Gg: AYBFou1+XrYUvd9hIx6qveGyBXdWSEbxgR3kYX5EYJk9le839S02ZOZdKeqjLUBok4i
	fCBqg+n17/u1ofEOO0gKacLQF9qeB7cohUwt1IQlLpqpVETzIygGyQFkUdtjaDPtsbsI0uOjNnw
	3iSIpvXWkR8l+jD19JbCTFBRERMfFcI1lYivNo4c/n0332P3Eow3/iqIsDeMyC40lLFmg4lSQXy
	vLt4Qsc1gShUO391wDrW4ihxWJn05SU3asWQV4ojIXFZxCKQ42QjgcPaC3P3M6zrTQJDWGrqem3
	GQbv9tmQUMzY5SPO+SuCogAcMlxa+/0nmktSoQ5u6hDInFLaZXDBzDkTU28X8tPa/menWPXWa5P
	1qnCxEhgnrVgBafzlVgsb8Tg/YEaKH83Q92i2/rshhw7LqMdQttQchnby5e5FQYWF/IwvTrqEdM
	1LgbLtmhe3RdYCDJ9JZEolF0Vubdv/WCozn9y2doLWJR6fjQr3gYJj4JsJixQw/XazyuOtdt/em
	D8EY2gD+A4UZGzs8P63rGg6bnDva2FX8yg6i0RjSF3fVKBJF3eR4gvQ3l8AGqzrPO7UbZ5/lYSG
	VuE76VS6PRQuuvLxKHxYGexdUIfhyAbmY3zNd512BC978nQ=
X-Received: by 2002:a05:600c:3f08:b0:49c:f13e:e50 with SMTP id 5b1f17b1804b1-49e6108c75dmr69869655e9.13.1789156726619;
        Fri, 11 Sep 2026 12:58:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e63c9a7c9sm121892875e9.13.2026.09.11.12.58.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 12:58:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vblank: Fix a name that does not exist in kernel-doc
Date: Fri, 11 Sep 2026 21:57:29 +0200
Message-Id: <20260911195729.78610-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of
drm_crtc_vblank_helper_get_vblank_timestamp_from_timer() refers to
drm_crtc_helper_get_vblank_timestamp_from_timer, which does not exist.
The name is drm_crtc_vblank_helper_get_vblank_timestamp_from_timer. Say
drm_crtc_vblank_helper_get_vblank_timestamp_from_timer.

Fixes: 74afeb812850 ("drm/vblank: Add vblank timer")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/drm_vblank_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank_helper.c b/drivers/gpu/drm/drm_vblank_helper.c
index d3f8147ecdc126e02010da2b9a7435e0a8708ba1..02d5c4b1e33d50cee3ca1a10c449f3ce00125999 100644
--- a/drivers/gpu/drm/drm_vblank_helper.c
+++ b/drivers/gpu/drm/drm_vblank_helper.c
@@ -154,7 +154,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_helper_disable_vblank_timer);
  * @vblank_time: Returns the next vblank timestamp
  * @in_vblank_irq: True is called from drm_crtc_handle_vblank()
  *
- * The helper drm_crtc_helper_get_vblank_timestamp_from_timer() implements
+ * The helper drm_crtc_vblank_helper_get_vblank_timestamp_from_timer() implements
  * get_vblank_timestamp of struct drm_crtc_funcs for CRTCs that require a
  * VBLANK timer. It returns the timestamp according to the timer's expiry
  * time.
