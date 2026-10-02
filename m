Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6E2F9D82
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973202; cv=none; b=bWJAcVVlRUxIkMvXB+B+/1AEGRWMTZ8k+qdVLBANDB/9HyvPd5UTm4kEmOvabpU94FzesyrloTU8kqcLrdgTSBj7Cz3gaTEhn5Arp8rovSJCtwJUpu/bdQapaHFBRBL/8kM229ESSWRnXuw39yJAui5qdUIJpQ25tivQjK6TYZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973202; c=relaxed/simple;
	bh=fMr9wqzIL5yNQMKNzq/D/JRXbVirhFcQkVTjHMyPcvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UrS/t06TYbg79osE3JCWDoi8P/WX3kOAlu8XcUKqHJPyqmYux9qjCIaI5MladX5a8hpbKVSoJK8l3zzlM0rco8AGbS60cY1AQmVU9w5bddjt5FLS3S65sVsO959GsmDylr6GqS5Xt+sSzbYEv02we0r/qP74vwRIg26i/seF6eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im; spf=pass smtp.mailfrom=nahida.im; dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b=FWLVNno3; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nahida.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b="FWLVNno3"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so7880683c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nahida.im; s=nahida; t=1790973199; x=1791577999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaAbUTkeyv8L0kxjY02IfRoRrUD0iGjIWc7/EOPXNTA=;
        b=FWLVNno3d/V49sY2BQUa4sCXrxdjJyISigtSS9nL6YQl9/W27/to5ZW+joJ358yzzx
         d+mCmM8zQZ+kIxf31SVO6uhg6eLY7ha4Y08YWz1aULb97MmGbuiH8PFHwfGWNxCvP7gl
         qAyBF57ZN0mNwonweQT/akQt8vot288AeJnn3KrZRgzvYYGnOGaA68JOuSh6Rp9QaOMd
         Nc73UM9QdhCkVv8wWCzfIwh+/GTnPsKe/tYqaF9ONtZFrx5enfJjI50iluEQ/Yk/iCDh
         /RT+1dos1AmBbmDQZyV5UzfJdfi86ObSJRpZTHpnBhrrA21NMo8FEHDVWZsNJo/hoF6E
         ew4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973199; x=1791577999;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaAbUTkeyv8L0kxjY02IfRoRrUD0iGjIWc7/EOPXNTA=;
        b=QzkiVgq7jyrUm052ZshY5+jh6bL60Pc5amDa8q0xoBpmHymooBIQNUKG1NZ399+9cz
         cO/fdjN4MZPUIO9ApvqXbQONYx+1QOgPmnieIoER47AOQr8ULZh/AECjAJUa4VKfWFWC
         P3D8Oh2ksGCPwtIQudmBdj+CRh/lXTTfjmo1uMASQ0Zn8vN4G/VAQHGIzE7ihQjpUm5V
         nMqP5aErrfiAkOU1bTd+WDYtttcc/SRV9Y78WeNXXQX0QrN4xFregB4ujCCWr6WUAl7h
         2oaC/ObwGa4ao61BL4f4SJ+1ALPK2Oo7CHdA+xrIHAdABbii4LxPcjnUItLPrcZdX99q
         G/Vw==
X-Forwarded-Encrypted: i=1; AKwUvBycRLhLGUYqYg3aWxLGjI3ty268NjyRu2OEM70g5alc+6O2amUZN3C5k+6PKFdgI8WmiROIRP8p82K+VV4=@vger.kernel.org
X-Gm-Message-State: AFuF++mh4I8Humkcesqy0TuhstDHXrE2I3+Yn3kdP1TEYmYywu+yf88f
	9why4c07iZSr/H8cSGnacshCFZWTWHs9Q0pvFSgBPzSMNeBTfEdPQMmKkZ7yjSiX0uTx
X-Gm-Gg: AYBFou34sx1/rsBBXDjjtmDYIcOeqoXrDYDoP/mIDFynf8IIqnc1uckszwcGBuFMxFP
	wmpLI067bYuEHfr5RHwG/yHegLJBazcw5pz3Znya9W+IJPnOgTLfhhtqLM4usQsRF7iS99yxYd9
	39Eu1qUuDeCN14Lb8lDqI3EGI5Eo9kVYY9+BIBF/3aQ7NWhlpgvslSfh45bekLkMuY3ifC7RAyE
	IGTsVpjje8OMoXCmm0+0hVqVWtRj/74ucodAWZLceHVstakZ9XYOzL9SsV9N+iH+ROjEW2k1lxx
	hIem4EhfflnTi3ug+Vg5Lij/d97e5E21YbHxG61FrkOGe1N09XSGOvbY3B8ljS6JzDwYukQnXNm
	Qv7XUdyQ2rhMuwzL7PYbrR2IQsazxygVyE/dR1zQh8KBg6t7y2uQTVtxZ3Ko+RpTcjwG7rBR24C
	gSuKD2aw/A1fRNQv3/Y1usMbEyrxP9/gdOtR7XiICPuLYoN+UEqsSAB5Kt5gOq1nBPsakLpp3gy
	a1i9XHF2e6r
X-Received: by 2002:a05:7022:ea9c:b0:151:ece6:b171 with SMTP id a92af1059eb24-151ecf6056amr107994c88.14.1790973198761;
        Fri, 02 Oct 2026 13:33:18 -0700 (PDT)
Received: from akasha ([155.103.66.170])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f810bb13esm7239560c88.13.2026.10.02.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:33:18 -0700 (PDT)
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
Subject: [PATCH] drm/panic: allow overriding panic QR code URL
Date: Sat,  3 Oct 2026 04:31:40 +0800
Message-ID: <20261002203140.121165-1-me@nahida.im>
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
Tested on x86_64:
- Full modular build with DRM=m and DRM_KMS_HELPER=m.
- QEMU/virtio-gpu runtime override with a non-empty Kconfig default URL.
- QEMU/virtio-gpu runtime fallback to the Kconfig default URL.
- QEMU/virtio-gpu runtime override with an empty Kconfig default URL.
- QEMU/virtio-gpu raw kmsg QR fallback with no configured URL.

 drivers/gpu/drm/Kconfig              |  9 +++++----
 drivers/gpu/drm/drm_panic.c          |  9 +++++++++
 drivers/gpu/drm/drm_panic_helper.c   | 12 +++++++-----
 drivers/gpu/drm/drm_panic_internal.h |  4 ++++
 4 files changed, 25 insertions(+), 9 deletions(-)

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
index 8913c3d22..f98ffe564 100644
--- a/drivers/gpu/drm/drm_panic_helper.c
+++ b/drivers/gpu/drm/drm_panic_helper.c
@@ -609,7 +609,8 @@ static void drm_panic_helper_qr_exit(void)
 	stream.workspace = NULL;
 }
 
-static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_version)
+static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_version,
+					    const char *qr_url)
 {
 	struct kmsg_dump_iter iter;
 	char url[256];
@@ -618,8 +619,7 @@ static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_versi
 	int max_qr_data_size, url_len;
 
 	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
-			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
-			   utsname()->machine, utsname()->release);
+			   qr_url, utsname()->machine, utsname()->release);
 
 	max_qr_data_size = drm_panic_helper_qr_max_data_size(qr_version, url_len);
 	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, QR_BUFFER1_SIZE);
@@ -686,8 +686,10 @@ static int drm_panic_helper_get_qr_code_raw(u8 **qr_image, unsigned int qr_versi
 
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

