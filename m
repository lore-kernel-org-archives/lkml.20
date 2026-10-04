Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165B38AC75
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117781; cv=none; b=L2PYhpLEIiacDTmlAyhd9FA+vXslw+2WAMlueEXRiLLiVMb7k0wn5h/S3MlpgNE7T7eWvCQ5Ai9uMWCGFj+tJMMpgo8y/3dcyTV5CSKB3Y1pw7Zmno0D8QZy0ItHDcE4E4mTMi2k0+2RikeUKPdJOcGKhPrYyHikCROQMiE+7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117781; c=relaxed/simple;
	bh=nlCjiAzhkYiQ1nYPrjHibWe7jNID9lKUBjiluobqAug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P7KwR5IPNMqZFMCVUi5rD5S8oud4zIAutC7eq7Cq4TNmtXfytztl8Oz0dhZv9eVYc7T1RC88EBqNEacRx/CO1SWdGIKxMAO/2TbKu87Pu0uBYT9CkM/0OMMu1sW7lpirN3937Qy0CO3C2H36NVUpFeZpS5N9YVPkVQTf8qEcldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brNox9Nt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brNox9Nt"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so283864a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791117779; x=1791722579; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=96zU+qlaXFSgWiLmhC8ZDksn5OkhGICnqsZNjrDt1Ew=;
        b=brNox9NtHheVO5RUmIrNZKftbvuvGTNZ5U4d80rSqgJrqPMYwjATZvwhIIAU54h+Pn
         8AEqMRzlPh1OXtMsKwaJolTwIyWYWQWmWyr6HH9fTOZu18Llt2AlWRGr5/YLu4h/+xgw
         cmw3GA8ZyIRL/x5eZF6J6xBUttQ/rniJJsb9FEd3Bn8vbXOpVQ7fUJ3WiHn0kf7KbJdN
         +0TCe3hL1+4TezH2L5IkGMxhdqOodm/P9B6cbyhMf+hIuvNyqW1MIVHItA/LDK3F6KfN
         JuLsoER8mDlCryeygdJjPyZBFUM87fDsL1oUQFVDIlnEZmGReINKeTdFrhf966pxUaEm
         WM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791117779; x=1791722579;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=96zU+qlaXFSgWiLmhC8ZDksn5OkhGICnqsZNjrDt1Ew=;
        b=s10VGDyYHAk/kCUw7EmHYRYG0z/VzLgyl7O8JlDKTpSbWKjUm1kwYLX/03pLg+mEh6
         OQcDj8/6dYPI6P9LBcLZT7jBiaEH7untGgStQnCjmTJAFeBL/xdm79SVYcIQXekORE93
         NiHAhNgV9Fo20jIujCbxstvx8azjzDfIJm83oUy6pQnF+N3KlxX7TH7CasIrQ4uv2ruq
         QIlTDNQo4C7qqAllwEGya2UvoKU/Zs2+XaSygJu7Fs8Q9hkBYLqv5McGJyXfAOT69rsd
         Khj4dkHVRva+r40mNXvx8QSLfZWSQcr1jyoI8KTtOvNDQ+vuewl+AB1Un93VaMOgEUSL
         TvuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMEfMpW2Ist0ZpkImhZWn0mg5azAh3oZzoR96hf9wthIgX7IufR+o6pTnP/Co5nuDqG6ZYdofC7ngllDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgO0fkftCmKNqBqJEIVcbqh7Lz1lC06rlx2ItZotx9c4DXmWdo
	nZMTPQ1GQnOT5voB6gTbTjasGE9aJ5QxZzYLrIqW7fjm1I9pVYzeW2A6
X-Gm-Gg: AYBFou1fvbwY/glMeh77/NqSe0MqOEYYdL0k9z/E2McTt6qA2O/CxCtIm1JuuPmOc5J
	lUBG2RbQTIGP2zdz5kL6DO90f0Hza4xFu3xRK28anUYu6f/rBBcjWSsbIVq+XvlXAx6Gc9Uthev
	7j+UQStFH0kqM12KC+J2WIr86RLes9g9hekz2Mq830Uvml01UvJlXVOrvvOUWIvCl2lyK6UAAEG
	xX+T3hiY6iYBYEg41jVXaGMMpf/7q3659aCfR0+PbsdAhtMtuH8BYLiic7jUmVWsFwXeKgTw3TD
	czgU0MOW3k3GLDWmN+LJtDfojG97vGSMFVfkzOSdI9mllN51i0obPh7lLPYGc+Luz4LwvxbQLW9
	GTzDdx/BYGkzJRy41ysk7Wwn5XCl0EY4YrBF2aOxMhMTiMH8Y3igoDHABMvlU33WaejPz8e1jQL
	a6amgykL/GFwBcw8vc2gkn5uop+TFcqLMdg8UoMZKQCu1h5BuMM8Nr+rCLRARVweuWIw/szGrk0
	YA6inZr/JBcGNd50gLzcFTWIZUkrpo51MDScx24uqh+z8lsILCHKAAOxAuFT3Ky42htHXvpkGk+
	DdbmSHTVx4L76Rx873Xvg/5yciSVbPcpP1zgPyHmSOBLW0g=
X-Received: by 2002:a17:90a:d64b:b0:3a0:c22d:fbe8 with SMTP id 98e67ed59e1d1-3a6ce7cea97mr5790108a91.38.1791117779256;
        Sun, 04 Oct 2026 05:42:59 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a5150sm6599177a91.1.2026.10.04.05.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:42:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 22:42:29 +1000
Subject: [PATCH v2] drm/fourcc: Add Apple Interchange layout format
 modifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-apple-interchange-modifier-v2-1-410a3d0541f6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4XM2po+AqIr/8OwgHYKY4A2LRIN4
 d8tqFuX5+bk3AUiBsIIl2yBgDNFcmMCechAd/XYIiOTGCSXBS8VZ7X3fRrHCcNXGJwhSxiYbrR
 WQuhS5QZSwAe09Nzjt+rD8dHcUU9bcTM6ipMLr/19Fpv3OxL/jmbBBMtNgfJkz1bx8toONfVH7
 Qao1nV9A+HaPonWAAAA
X-Change-ID: 20260830-apple-interchange-modifier-cbcc311c835d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Oliver Bestmann <oliver.bestmann@googlemail.com>, 
 sofus <sofus.c@icloud.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Janne Grunau <j@jannau.net>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nlCjiAzhkYiQ1nYPrjHibWe7jNID9lKUBjiluobqAug=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmHPE9PuJ/F/EJMgFuYfdPiDvPE3GuOx7PCrG+Yb+tW0
 uQrj9XtmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATLW/CCPD6Xkfzy/7amBv+qe3oO+KQs8S+13n5dJW155a96lHXkL1PSPDw1kc4Zz
 h942PObpoK8e+yIp62zmxYl1VO/+aFxMl7y3jAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Interchange is a tiled and compressed image layout used
for buffer exchange between Apple hardware blocks. It is
similar to the already-supported GPU_TILED_COMPRESSED layout.

Add a format modifier for Apple Interchange so that it can be
used for buffer exchange.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Fix typo
- Link to v1: https://patch.msgid.link/20260831-apple-interchange-modifier-v1-1-5d6e27f9f308@gmail.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a103fdc0b3a3..d304ee5c614c 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1626,6 +1626,26 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)
 #define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2)
 
+/*
+ * Apple Interchange layout
+ *
+ * Apple Interchange is a compressed framebuffer format used exclusively for
+ * sharing buffers between hardware blocks (GPU, display controller, video
+ * codecs) on Apple platforms. It is similar to and uses the same compression
+ * scheme as GPU_TILED_COMPRESSED. There is no known uncompressed variant
+ * of Apple Interchange.
+ *
+ * Unlike the GPU layouts, tile size is not dependent on bit depth. RGB
+ * images and the chroma components of YUV images use 16x16 tiles. The
+ * luma component of YUV images uses 32x32 tiles. Compression tiles
+ * are once again 16x16 with 8 bytes of metadata per compression subtile.
+ *
+ * AGX has limited support for Apple Interchange. It cannot be used for Z/S
+ * buffers or array images, for example. It is intended for scanout buffer
+ * sharing only.
+ */
+#define DRM_FORMAT_MOD_APPLE_INTERCHANGE fourcc_mod_code(APPLE, 3)
+
 /*
  * AMD modifiers
  *

---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
change-id: 20260830-apple-interchange-modifier-cbcc311c835d

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

