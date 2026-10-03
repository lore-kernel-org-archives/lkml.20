Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93A309EFC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 02:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790993054; cv=none; b=o2HN6O3UWutXx/tKnKiUUTut1Ba2NJ5M2tWQYzP0LoYTW47Qp4s2P0uExNnaiUvBLek0SbPsgIaYGlf2qr/I0hGjsUoIhsVoGIWm0QdlJn0hrxFa7LnKlGpn5TjuxMOWbOXtXvjlTA+qyMJaqlQFN4UeHcgC3TrG46exCoGge64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790993054; c=relaxed/simple;
	bh=3825StrCBllQECcMwalCcgh55uklTHATIfWlomPu4h8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bUcMgdgo6df2cVbY2twqSbEmEM3NsP0ftDhAlhnZN/D83sTcOqOvCOzRyqZKz2oN0CsL/kD5Abw8ipyjqRsbrRw1zUY/J4C3n/jihx1kuLhHCjiXzLj3rG+aK7L6DytukX9z2ZaFlYrE4LMzW4GFqknJiq6uYdNnkn1I9KUICnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im; spf=pass smtp.mailfrom=nahida.im; dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b=G86mp1ZB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nahida.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b="G86mp1ZB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ff680331aso3406015e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nahida.im; s=nahida; t=1790993050; x=1791597850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl2TIJFtTxd9FjFAAhnWrUwiB3Djal108LEa5BAa8i4=;
        b=G86mp1ZBRBvn/x0CUkASG1IhC+r/kte2nsOoqDuzWRuHMj3Q3aruGTxZ9UDDCNxHT0
         g0+2ZS/9gKaQL+3Acov/iNbx8eyWDAcXlTMgZgrZsZyfC7zO/AjZCwkXtyCSKiV5EpLn
         /CE38AD3Zx4hDsyjO0Q6UbPVxc8Ye+Lq9w7rGEZOzSbSFW0hcmy6BiLj8ykzDa9lPtGV
         o/AeoN0UzBVJygo5MXXfozcvr1dH5FzH5W8GW3/bNGuR5QdBwZzHI163q+GOiq/csCo3
         OWEusmWNx3CDFsyVc0CSirqvJFGepRMKBRtKZjWYdezmxADTRRQMIyyMPlUfK8NOkBX8
         qV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790993050; x=1791597850;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yl2TIJFtTxd9FjFAAhnWrUwiB3Djal108LEa5BAa8i4=;
        b=L6WCyDDmqJHkLEuO9+YGx8MqvfXyCuxzckdbDl7asFLfQBWI1Jmr70sRFdjjN6p6H3
         PeS2VwIDCmFEU1Vkj8nEdm8Ze0KJk0QgD1AvMHdGrcVsbC+iYeDeRUsJPx71kDG9rPfR
         LyljoruQMWgl7pxCyZpVKaC+9Qgy0stcJ84BUQt5ujh1WBgdCi/gEerWYDKRbd4bJwEB
         3dWoTnl6hBp9eN4+wqX8wJEDYZY1A+Bedvd5gJ1NTfVrPFfVzsOp2p5drsZjVNgkl+Fu
         tFT2QgFhYh8QJ0tjtIGOOm7Ve/srEhApZrZtP908bBwYfm8K3zq5Ay/vRo/cNz17+vV8
         WvAQ==
X-Forwarded-Encrypted: i=1; AKwUvBytDSwpczKA2sUy4zwwRMFbzjuCFSQea8T2r5b0QCuFBLUks7g8r6MuLc+wdcoYqwaqElBh9MXxxf1ySyU=@vger.kernel.org
X-Gm-Message-State: AFuF++k6gDGkBJCcNyigUfMenRU2u7BnID2wjAJXrqAKBJtwKWEh7XZk
	VipgrM1eSHCzXms7yuXRZkuS2iGlCsC8jb5WqBK1nHWkT4exHJMvEsdCZ2ao1+n0rmxu
X-Gm-Gg: AYBFou0RbQup4RJEgtHblAxGS8dgAuTraCDRdyKwGg1mwnYWohk4UZyTzLLqJwgG/bM
	hLs0nsfCbvUZN4xg0Yv7fpxzvwcxdO10di/tvpQ5HFCOqnCbuMfwQQ5xIu1ItR8DjJtdGWhUyd+
	fRUdfxh9z2I/cPI0Sq2z7tRm7q/OZAdS7MCqMrmToLXU507kTddaehkfHuH+lw5GQ5xQw7sENd0
	Wi6Ilc/mbmwJS3fRFkYVWfs3vHW99+kgbkXgiKrS3Vk2+8GIymA2nKQ2ji11x34AGSy4EvPqP5Q
	kDTFQj7OqZssK1d+a7nCE4GR76rLKmMCIHWg/zqXEVdMfYUTxtIPRW69wzhCZ3wGssHvDhDvndh
	dhBVN7VlVWvLOwKNjROIA1hYsltnZ/udTKn0N8bTasDxtKRI6wHLrlFUJBXHP6rpjNCcbT4x0CN
	xMgP8UTc306sqAbivEHFbYAMNZZmPa1hy9yu/UH5VuhtjJCkh9B08/sYriu4+Mh0Sez2u0xGW6Q
	jMoeS+LAJLg
X-Received: by 2002:a05:600c:4f06:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-4a1680b469dmr19267065e9.4.1790993049902;
        Fri, 02 Oct 2026 19:04:09 -0700 (PDT)
Received: from akasha ([213.145.82.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm115889825e9.3.2026.10.02.19.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 19:04:09 -0700 (PDT)
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
Subject: [PATCH v3] drm/panic: allow overriding panic QR code URL
Date: Sat,  3 Oct 2026 10:03:38 +0800
Message-ID: <20261003020338.184615-1-me@nahida.im>
X-Mailer: git-send-email 2.55.0
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
v3:
- Add a compile-time check that limits the Kconfig default URL to 255
  bytes, ensuring panic_qr_url is always NUL-terminated.
- Document the 255-byte URL limit.

v2: https://lore.kernel.org/r/20261002222021.149450-1-me@nahida.im
v1: https://lore.kernel.org/r/20261002203140.121165-1-me@nahida.im

Tested on x86_64:
- Full modular build with DRM=m and DRM_KMS_HELPER=m.
- QEMU/virtio-gpu runtime override with a non-empty Kconfig default URL.
- QEMU/virtio-gpu runtime fallback to the Kconfig default URL.
- QEMU/virtio-gpu runtime override with an empty Kconfig default URL.
- QEMU/virtio-gpu raw kmsg QR fallback with no configured URL.
- QEMU/virtio-gpu runtime override with a 255-byte base URL.
- Kconfig default URL length boundary: 255 bytes builds successfully,
  while 256 bytes is rejected at compile time.

 drivers/gpu/drm/Kconfig              | 10 ++++++----
 drivers/gpu/drm/drm_panic.c          | 11 +++++++++++
 drivers/gpu/drm/drm_panic_helper.c   | 17 +++++++++++------
 drivers/gpu/drm/drm_panic_internal.h |  4 ++++
 4 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b..5216120c4 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -111,12 +111,14 @@ config DRM_PANIC_SCREEN_QR_CODE_URL
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
+	  The URL must not exceed 255 bytes.
 
 config DRM_PANIC_SCREEN_QR_VERSION
 	int "Maximum version (size) of the QR code."
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 9fe97c4ed..9cc8c2f95 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -49,6 +49,17 @@ MODULE_LICENSE("GPL");
 static uint panic_qr_version = CONFIG_DRM_PANIC_SCREEN_QR_VERSION;
 module_param(panic_qr_version, uint, 0644);
 MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
+static char panic_qr_url[256] = CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL;
+static_assert(sizeof(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) <= sizeof(panic_qr_url),
+	      "CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL must be at most 255 bytes");
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

