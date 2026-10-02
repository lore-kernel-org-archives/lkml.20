Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4C3AEB32
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979972; cv=none; b=Z3pR/eenBOmzfd+h5zS9JjKC8OH1aE1BM7FwDmvPUPTTLxbvSSTWUH1ZW5XZ24pjUe1VQyPIphrUeJ9/96Sv/gQGsbEhtnTflR4nAjuLdjc6eC5c5nY9Q4SwTz48Ibr21XdT1I1F7a18ywrcZZs4OfOUeiGbDcw7tPEtzW9Fh48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979972; c=relaxed/simple;
	bh=JqmaG50ni7JGTJgTL9U0gKmNWIWy/D+KN19P7yQkVXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDY5AulZHMg17tyUha+5hfIR9rk0gpP8w/CveFK6yTkSr4JR+9OFBjbyAJ67j97phi/hli+VxaTH90sjoSrUyrpzcjdOlNe76yDMGpYrn2FCc9QVJ+xHH31kw0V7mT2qk+RwvaIv9pdbX/B+Q4ubQ+rH59esiLCjrCIOdK02uNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im; spf=pass smtp.mailfrom=nahida.im; dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b=bTTjkUSZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nahida.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b="bTTjkUSZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so2154315e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nahida.im; s=nahida; t=1790979968; x=1791584768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BiaxJRqGo6X1dko2yEPnGXMg7e78PjNfKxJLCypYRSM=;
        b=bTTjkUSZCesQwvNxLdI1WhBQxOtYIh4S8Y13uDTOWqVmHoNLWyqW3b1c7bT0L8OfD7
         SNrczWixEy3vmDhmzCp6zJGYv3cEx1wikpxaVA7VahUMctn38SC7eA9JPgXJYFqLOL/y
         FsdjxiZIvDZQiNyHFesIsskDbPrhxFaJmsnTZ3ZX/T54X7ryK32EqHkAfEMVj30fUty8
         hWPfyLCA0v+TybyjZESFQQbxcG7kYZZXh3n130UEoy1vOLiU+ltu43sP63w0vRdfIw3m
         EHb+4i5dCnKu+JQfqdtfAzLYxm3W6yR9Qj9ukfCBeDadGoaAaSaQwFVYtnbVLLPMX8SI
         g8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790979968; x=1791584768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BiaxJRqGo6X1dko2yEPnGXMg7e78PjNfKxJLCypYRSM=;
        b=TlULKOnyfnBt8e47GdvOLJKZmBK1zBMrh84yy01aiWK06qQt5hL3Nl2/FL3FFyA0WK
         z2EEfdA6f1fQxDt8IyCCsyWUd7ymzQhDs3Dsay6awCZUJyYZLTpMbZICHuwH1B1YJNxk
         7hYkQZDQ+z0+fY8TEt+Dzt0BaoT2cJrm+6c4pdwMhI24tGMCCVeppLrrX5tx2wkVNvH/
         O68XEBBLlfBzoeSsh85RM4IrJLZ9F45699nDuZGyp9TouhlIqz8cbNSyFSUSfHesG02f
         yfRsU4IR79nPNAk9NVhQnY4j9w5y4GFvaRspiEqCPpMLR2rT6GAJt3o6oexakxGKPYTe
         AmJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBG6BItRONfMFveq5OfAHEg9SkSvlKsevYYU4PK6tTjYLv3GWBxZEu5HfBxv+xT72i87VRp0mnOv+AuQE=@vger.kernel.org
X-Gm-Message-State: AFuF++lQk8E8Gg+kjGP4HrmEqGv9DLU4Bt3i5URx5PP4qwUfog5hjE/m
	Uw6FoD5W9g8PGmZOnh4HXsJrANeJvV/ojRYz4RNG5Mqro2h8OiNYmKG3HYTZ3t+hXcrJ
X-Gm-Gg: AYBFou2V/+nPB8hxYvwwqsaOO6xFGZ/fKRVUSNPBBg8fEg3KJIgYxrTn84ytWNIbdEM
	jEN2VQg1dZUxm/bnoYsys4tdeuF5+C+uuH5P4u80ge6ME41TSyV/RBacYPFjd5BBRi9izF2MpkA
	S5Mf8lmXGewMqzAQsjTTEY1NDi1Hv/XUV/PqXY27jTIz/5BWqtZBYEOt5jvjuDdMIxSYZgYXaKE
	6Uq0CzB2v2HBDfy5LJYm83rCJFaquXFWRfrOz5/J/81VBNqsotXcVXDZfdVcOz6kVPX0sKoZ2Q3
	rs8/Yj7gK6YAulNS3YZiozKk1IXdV9mGJX3bPssugUcS41Upg7gTk/kimnhnZdfkhB96om3LdYV
	LuIP2Z/+7+Xw7UiJoLzJWx4vvHgbeitsm1AFs+Cb1g2Fmtv4/eiGJZa6tUMVhkyl2c87yWH0LxC
	TpRqVBYgOlUnxhIGQXjGEYltlka1uGmLFB83X5rME7fZf2dL41BK4rLkZ5e3JMxuYQ9E/QPtGE2
	e0A/yXM+RnD
X-Received: by 2002:a05:600c:6992:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a02755fd98mr68431455e9.7.1790979967946;
        Fri, 02 Oct 2026 15:26:07 -0700 (PDT)
Received: from akasha ([213.145.82.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm8968085f8f.23.2026.10.02.15.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 15:26:07 -0700 (PDT)
From: =?UTF-8?q?=E7=BA=B3=E8=A5=BF=E5=A6=B2=20=C2=B7=20Nahida?= <me@nahida.im>
To: dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E7=BA=B3=E8=A5=BF=E5=A6=B2=20=C2=B7=20Nahida?= <me@nahida.im>
Subject: [PATCH v2] drm/panic: allow overriding panic QR code URL
Date: Sat,  3 Oct 2026 06:20:21 +0800
Message-ID: <20261002222021.149450-1-me@nahida.im>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002203140.121165-1-me@nahida.im>
References: <20261002203140.121165-1-me@nahida.im>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The base URL used for the panic QR code is currently fixed at build time
by CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL. Changing the panic report
endpoint therefore requires rebuilding the kernel.

Add a drm.panic_qr_url module parameter to allow overriding the URL at
boot or module load time, while keeping the Kconfig value as the
default.

Keep the parameter read-only after initialization so the panic path can
access it without additional synchronization.

Expose the configured URL to the DRM panic helper through an internal
getter so the helper can use the runtime value when generating the QR
code.

Assisted-by: LLM
Signed-off-by: 纳西妲 · Nahida <me@nahida.im>
---
v2:
- Grow the formatted URL buffer to accommodate the maximum 255-byte
  runtime base URL.
- Reject unexpectedly truncated formatted URLs.
- Test the maximum-length runtime URL.

v1: https://lore.kernel.org/r/20261002203140.121165-1-me@nahida.im

Tested on x86_64:
- Full modular build with DRM=m and DRM_KMS_HELPER=m.
- QEMU/virtio-gpu runtime override with a non-empty Kconfig default URL.
- QEMU/virtio-gpu runtime fallback to the Kconfig default URL.
- QEMU/virtio-gpu runtime override with an empty Kconfig default URL.
- QEMU/virtio-gpu raw kmsg QR fallback with no configured URL.
- QEMU/virtio-gpu runtime override with a 255-byte base URL.

 drivers/gpu/drm/Kconfig              |  9 +++++----
 drivers/gpu/drm/drm_panic.c          |  9 +++++++++
 drivers/gpu/drm/drm_panic_helper.c   | 17 +++++++++++------
 drivers/gpu/drm/drm_panic_internal.h |  4 ++++
 4 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b..3d9d421f0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -111,10 +111,11 @@ config DRM_PANIC_SCREEN_QR_CODE_URL
 	string "Base URL of the QR code in the panic screen"
 	depends on DRM_PANIC_SCREEN_QR_CODE
 	help
-	  This option sets the base URL to report the kernel panic. If it's set
-	  the QR code will contain the URL and the kmsg compressed with zlib as
-	  a URL parameter. If it's empty, the QR code will contain the kmsg as
-	  uncompressed text only.
+	  This option sets the default base URL to report the kernel panic. If
+	  it's set the QR code will contain the URL and the kmsg compressed with
+	  zlib as a URL parameter. If it's empty, the QR code will contain the
+	  kmsg as uncompressed text only. It can be overridden with the
+	  drm.panic_qr_url=<url> kernel parameter.
 	  There is a demo code in javascript, to decode and uncompress the kmsg
 	  data from the URL parameter at https://github.com/kdj0c/panic_report
 
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 9fe97c4ed..463544f71 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -49,6 +49,15 @@ MODULE_LICENSE("GPL");
 static uint panic_qr_version = CONFIG_DRM_PANIC_SCREEN_QR_VERSION;
 module_param(panic_qr_version, uint, 0644);
 MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
+static char panic_qr_url[256] = CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL;
+module_param_string(panic_qr_url, panic_qr_url, sizeof(panic_qr_url), 0444);
+MODULE_PARM_DESC(panic_qr_url, "base URL of the QR code in the panic screen");
+
+const char *drm_panic_get_qr_url(void)
+{
+	return panic_qr_url;
+}
+EXPORT_SYMBOL_GPL(drm_panic_get_qr_url);
 #endif
 
 static enum drm_panic_type drm_panic_type = -1;
diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_panic_helper.c
index 8913c3d22..b0ea0b4e8 100644
--- a/drivers/gpu/drm/drm_panic_helper.c
+++ b/drivers/gpu/drm/drm_panic_helper.c
@@ -609,17 +609,20 @@ static void drm_panic_helper_qr_exit(void)
 	stream.workspace = NULL;
 }
 
-static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_version)
+static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_version,
+					    const char *qr_url)
 {
 	struct kmsg_dump_iter iter;
-	char url[256];
+	char url[512];
 	size_t kmsg_len, max_kmsg_size;
 	char *kmsg;
 	int max_qr_data_size, url_len;
 
 	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
-			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
-			   utsname()->machine, utsname()->release);
+			   qr_url, utsname()->machine, utsname()->release);
+
+	if (url_len >= (int)sizeof(url))
+		return -E2BIG;
 
 	max_qr_data_size = drm_panic_helper_qr_max_data_size(qr_version, url_len);
 	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, QR_BUFFER1_SIZE);
@@ -686,8 +689,10 @@ static int drm_panic_helper_get_qr_code_raw(u8 **qr_image, unsigned int qr_versi
 
 static int drm_panic_helper_get_qr_code(u8 **qr_image, unsigned int qr_version)
 {
-	if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
-		return drm_panic_helper_get_qr_code_url(qr_image, qr_version);
+	const char *qr_url = drm_panic_get_qr_url();
+
+	if (qr_url[0])
+		return drm_panic_helper_get_qr_code_url(qr_image, qr_version, qr_url);
 	else
 		return drm_panic_helper_get_qr_code_raw(qr_image, qr_version);
 }
diff --git a/drivers/gpu/drm/drm_panic_internal.h b/drivers/gpu/drm/drm_panic_internal.h
index fe6d514a0..f33552265 100644
--- a/drivers/gpu/drm/drm_panic_internal.h
+++ b/drivers/gpu/drm/drm_panic_internal.h
@@ -14,6 +14,10 @@ struct drm_device;
 
 #ifdef CONFIG_DRM_PANIC
 
+#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+const char *drm_panic_get_qr_url(void);
+#endif
+
 /**
  * drm_panic_lock - protect panic printing relevant state
  * @dev: struct drm_device

base-commit: 54e61ea6c492d69a1717018826d8340810c812eb
-- 
2.55.0

