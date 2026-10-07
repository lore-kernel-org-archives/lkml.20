Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139446F4BA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365631; cv=none; b=rQn6rT4cIDop9R05aWdKmh57ztdrUd1Tg548em8aebo5a/vSsRl6WlCKcjQAkjcerETILVJ2jYKemk3JYLwTuWXNFUmGy/6oiO9dHIBgGe15jl+CtbbnKf9R4IT7sZS3buTB0B4tiJWWHJKgvqhRCSRUt5d2Kcz02FxsOjqi7js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365631; c=relaxed/simple;
	bh=C3V4UXgsMyjfls0kAgGHGbnZQnqSrUwTQ3JG/daKfzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dz8G0CmYMz32V9LsUuBnCbC1PCDPFJ/COVutW9Wbk37bDq9OVsT9nPweABW96xBaCj+/Y748XeG60D/vt9mikoYFw0yCtSnmUiqoYMYAVFXY9ZQ0dVxPZQSDvW/JKRlbHIY9sEifAlUAhCaYbR9T6f0DydClcNXc87I8w8BS4sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnWPsQDc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnWPsQDc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a0a911e8d6so1956041a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791365617; x=1791970417; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vy63mdqIPndIk85N+xwyTXgE3amsDxjtRy55K/v9EX0=;
        b=RnWPsQDcPPxdkGYEMJxBGqDo0Z6YfizxDnjmqeT7S7d/vAuqMeO9N1mEdKl2Ws/9Au
         iza+RqolhJAzVETbau88LTA19jC2zEM89Q/VKCGJ8MkYwjaQKr0MEFbihIGrVAq2102R
         Gyn16jVMQeFNJO+HvICQIbpfdjRmhl3cJiZuqa7XeZamcVRKhYrHJYjuib7493TjHLh0
         DdoiWczeNlb55LKWlZDPrFgl+0y71u5opTghYShPZK7bnztlF/GEt1gWhOMXu81mjnnQ
         kjfS43Ew1MVC+Ag4RxSt3hE0MmxcQ6btCYML2uapaMebXzKqqh6KmwVtsMzBp2kITEqW
         Sv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365617; x=1791970417;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vy63mdqIPndIk85N+xwyTXgE3amsDxjtRy55K/v9EX0=;
        b=vNq4kBmLzzSkEQvmKQsl+KfNrMHTe9YbXzFujhdDJu+Tx8VrPBpW7Mtr0+oxLWdnj2
         Ao5gKM4OTGCFMNwp3IpYxsyA2e8hetsdGIANWtLPPQ5MaWhKGw+kfX4/x5ZPNAs3N5Ox
         83JS1aBmyab39+Q2S47XBLR/4EihdZh7IydxkVEYH1inTjNZ9rKBgirgS58XSJgFBGUy
         5xrYXUj25pOkFJTX3P0kSpaiSNDUpxJYDVzQ/uSkt7XrqQNFwCAGliAwzr/I4TcLRs0e
         IA2qnTd3eZ+G5fPeWrmVVmC/OiHijzkTftL0loVYb8VhUuT/7ha5TvZFFj7wIoQ1JdLK
         MTkg==
X-Forwarded-Encrypted: i=1; AKwUvBxA3LjandYM1SySQmkZz2hjJ9Ofc+oXjAExS7Gb6iFcwmwfoZq4FHdzrcxSW4nLYBLZW3biWZf2D94jUIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqlROlWbGxPAOuuXPq6/f8htS5lijuPEDnRy10aSmPvlY9/BJl
	xwMgdYEhWeAYCz19rKNUIZR7RHXkzI81kPQBN4opHz1+j4HTuklqfe/a
X-Gm-Gg: AYBFou0zOrX0/hNWXpKashtII7g82JdxcpgFVAKTR0FCASOZ06dPhk1J6u//FSTzium
	pSUSZFW7QSIyT+2KLoAswPjlumWFx3AfH01FM9RxVhsQr+yjJ68CnAKluayZAUFc4cGNRKqARdI
	yBqutDJCgNBGT/GWV3X0uNCFx/Bijk2VoXZwSVL5df3Mf0BCfN7Q5aWOo+s1RJXqveCIWRmcdGQ
	RTPvFYKoYdpI6jFBLh/4Z8EtFsvo0AYsR7Eoofyu32F9TN7BglY7sS6zOaWnSBRJQZ2utIE8bMe
	OiBkd6yhSzsFf8BXalsPPqFJM/GcmaMR81JF5nGvwrsuhuBNHfpKGMof7QGl1FVMX8kmz2LCnQp
	rzEmAJYgnRo009MpgONJX0VT6JNVh7aDO30fxfn6hTlekFtzS/M3YdRJb2I1xeHlhOExBUomyEi
	/vGgzdb6bdxYjtu9cWLU5OgZPqm7n2zlASd6TWB3TMLZCHN5rzBEsARJgxG0rGgk6iC4NtOn1sS
	ozU1CsFVL6BW5A/jrOA4vrtrt+ZuQksD9hlrOorp8D87L8+Shd3QPGOBDSP8CyxmcETmzKLhnBl
	Vss1b0IZ/7bUpndiIx1aKnPpm3aLjQNher7/gxUGNzO4363hNzHWCLYpVA==
X-Received: by 2002:a17:90b:4a86:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3a8a1be69d6mr1440644a91.50.1791365616910;
        Wed, 07 Oct 2026 02:33:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e662a5sm9119994a91.4.2026.10.07.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:33:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 07 Oct 2026 19:33:19 +1000
Subject: [PATCH v3] drm/fourcc: Add Apple Interchange layout format
 modifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-apple-interchange-modifier-v3-1-721fc44abf6b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4V0bU2nBURX/odxAe0UxvBKi0RD+
 HcLPuKK5bm5OWdiHh2hZ6doYg5H8tS1AdQuYrrK2xI5mcBMCpmKTAme930dxnZA9zk0nSFL6Lg
 utFYAOlOJYUHQO7T0WOWX65v9vbihHhbj8qjID517rvURlt83BFuhETjwxKQoD/ZolcjOZZNTv
 dddw5bQKH8qECLeVMmgikHkyogkBpv+q+Z5fgEOhUYuIQEAAA==
X-Change-ID: 20260830-apple-interchange-modifier-cbcc311c835d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Oliver Bestmann <oliver.bestmann@googlemail.com>, 
 sofus <sofus.c@icloud.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenz.ca>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=C3V4UXgsMyjfls0kAgGHGbnZQnqSrUwTQ3JG/daKfzg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnHBF/88+VblZ+1TMx8yeJ83+NmB837n12arO/f7q3Vm
 Xw0OO9/x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpZKhj+Wbsab5+a0sgcHXn+o20uo7j+PPcyxQCZoK4qtZzv6cc5GBnuqXKZ597
 SvBPqMTfAw9O9rLVdyZO9I/oda4RefVNvDSMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Interchange is a tiled and compressed image layout used
for buffer exchange between Apple hardware blocks. It is
similar to the already-supported GPU_TILED_COMPRESSED layout.

Add a format modifier for Apple Interchange so that it can be
used for buffer exchange.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenz.ca>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v3:
- Explicitly mention lack of stride and single-plane treatment
- Pick up Alyssa's R-b
- Link to v2: https://patch.msgid.link/20261004-apple-interchange-modifier-v2-1-410a3d0541f6@gmail.com

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
 include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a103fdc0b3a3..0bb049f91524 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1626,6 +1626,30 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
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
+ * Following the example set by GPU_TILED_{,COMPRESSED}, Interchange images
+ * are treated as a single plane by software and do not have a meaningful
+ * stride.
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

