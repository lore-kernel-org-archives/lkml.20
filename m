Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109246;
	b=Ecer4BpnPtdjmQqWglMVQ50+BB8YrBnHWZRPnYBUT7dK6Uy/UhYLELr1Ih2+AzQbX9Pm
	 eqhlHtGpbr+odoLWRIylwx3Smf4g8XsxsiK6RVq5AW/P6FJVlOFPPHtVEProEERFDKIKy
	 eDqmXEAThw2sAGyt5MVUvgFTmfT3uoEn0oDwOZokUSAEFnZ6oYJ8dBs6h+14yidH+v3EA
	 /fPMO2ZxQhAG76UhkaHBYw/GZB7bpM+y63ap3KG2wex08Zqg4aN5P96HMtT/6VdS+aqOI
	 jUWMeiD95EhnNjopBA3gcObgsOgzbEopUstQjDl5zx85oztPD4qmKu4NSb+Dg6O+uTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
	b=ibysLQ8+J2ybPfOz0Boi2FGSrMQ4Yaj575FaOM/pfuxGssHLilZ5Y+UlyJ542hFErcsF
	 ksF21VJsFgS4BD598Cbj2vnv9zBNvEyaST22Saf9Zf0er4Rx1kGRpRsH+PTx4eKQvFQW9
	 uqaAa3ulvEn2r6GJ3mopptK1Uh1KrIIrDdzYpirCZ5lVIQo+cFR8LqpEJ6dr1k9Z5I9nS
	 0QSHqt+y0EN8rThW1pqYeCc+Kg+fcb0dBLmeIIuj9Ah76wyDJFTXCTyTV9j4MuREkTf6q
	 /aR36HoqxnGoE989aFSJhQmi2jEk/B4y/0DDzvxjt2CLBYX9fHnYL30ScbbuGnP7rZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CXibKdWQ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058B60A382B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5058B60A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CXibKdWQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b042c0759so2319418f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109245; x=1793714045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
        b=CXibKdWQ9F7anjrgC0VMM7aDjT7IZMsjrShnAhjebv9ylc+23J4tWOL8QvB+1moPRX
         +ccoc8d11rCpEb7OtfOrgtPIf/fT8tmb8PVCSRTYx4nbwMkcpY2vtHqVUEpb/OC3PRSX
         n0Ia7Prd8lLKUDe1UZtgqbfo5N4cIvFxQz6SXiyEYg+iyq3EZ/1FhxyWHv5iBM4l7xCx
         7F2ocwI8m+BeAbnle6aJRUD9PWHXDbHOYkGek9AI74WYQgNsj7qt8kMlhNAd0+KVokOO
         6MNd4RtF0WI/55ngrMNg6XmUK6c78cp3ggmzgkKmzUywXESizZ7nCpjNOly4WKzfIN4I
         Qk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109245; x=1793714045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
        b=lVt9SwGsnwSI/33tejDDwWOJsEmJ/mjAXwF0VnQYj91orW7kCt/VgUIEW0kYdNAPzJ
         O00+Oc4HiVUUhZPum/+chmBQDXmzsUhdgl19z2RSB+qTHNTUdHzo/8yOBKZP0qWlG2+q
         Cb8+49/XhDvkDobbCV0ZU1pg43/YS6scRJWYWC1CmnJIs5870e91/gYhurmu92b06da3
         NQ8+hGCsZ49/9GqvbHoWgtzN5AQUsE05Cl8SdRFdptJpUzcyEyzflt3+Au3wpU9+QNGy
         jWIw9ndYk0CrcGE1pwjtp8vwL6au4q4QAGq3zCTKkV+ZG6U8w29Ykw96lv0zZGCVzbOD
         9TMw==
X-Forwarded-Encrypted: i=1; AKwUvByy53wTBuo0A9COQj2072Ge0UERtmpJUxRmSavLvS57T6uDaNgZccLeAV6HanErqC+r6CCrbaQMPCJUiQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKITHvJCmqXvbfLfYhRNcmS9tIBBJPlBFI3rx1tkrueM1lzWW9w
	vwuA0l98clZDs5M/SgXPYItg9LfDdfM5iEmFCXLD7RdYZfxAKl3YgmKH
X-Gm-Gg: AYBFou3P9QzgodGR5UrSXW3urGavtioszp71J3hdl//AZvRJBgKxqailA/tdZ1ZsueL
	zePezlgnfQGLNVG9T6YMN5PlkT+2FECXudlbFS3ixovHPPsq+TEs4QA2YSqFCen+dGOSaeZs17l
	h+y/rfHyam9Ku/RQUg4AAO0i4fc5cC7Ptw4e+IA/XW5L4DRFAB8CNzfXMw/jMaRHFDSL77OeZSD
	v5gvZy96DUQMIDEaeyM/faGLtdIXXjP9nQ9Qd2LYXjMzLVUgiiEQMwMx0ed+Eq355LjScdRq0F9
	fd7uWQxoAx/0PmKSAHrdtYEV1bH+DtKpGH4KM7MQdE15Oq29HRmvAkfJCdcuGsnwTCRluj8wJJy
	0hr0zHxckSb9Q9ev6ru8+omMwYn4oXCHcTNJWBtrAv+qD+K6BX//kXS/L9P6ST6CTuT9Rk7FAF+
	DUYFl0AT6LC4jXww9ZhGt09h0tDXJo3CZG2gt9l9+S2SsiQoZ/FKWmVVBj+mi9rqVfRzhUnJC3g
	4SaDlurye36MNP+zbKmPRoAbNTxJI/5cTec1goe5aLOHVGJKVIaNrtiyh1W5W1zRKy6AJQ8hCbj
	/Kc8HeKyG77oDwkisVFeol8hVO6T
X-Received: by 2002:a5d:5d10:0:b0:48e:1c72:abc with SMTP id ffacd0b85a97d-48e3eb9890amr18924302f8f.35.1793109244645;
        Tue, 27 Oct 2026 06:54:04 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:04 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/15] drm/client: splash: pick the image source in one place
Date: Tue, 27 Oct 2026 14:53:35 +0100
Message-Id: <20261027135342.2003632-9-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The client chooses between two sources with a boolean: the BGRT if the
firmware left one, otherwise the BMP loaded as firmware. A third one is
coming, and with it an order of preference that a boolean cannot hold.

Name the source in use with an enum, picked once by
drm_splash_pick_source(), and have drm_splash_image_load() switch on
it. No functional change.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 45 +++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 337c7160c4a1..911149b92a52 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -39,6 +39,16 @@
  * a static image.
  */
 
+/*
+ * Where the image comes from. drm_splash_pick_source() sets the order of
+ * preference; NONE is zero, so that a new splash starts without a source.
+ */
+enum drm_splash_source {
+	DRM_SPLASH_SRC_NONE,
+	DRM_SPLASH_SRC_BGRT,
+	DRM_SPLASH_SRC_BMP,
+};
+
 struct drm_splash_scanout {
 	int id;
 	/* Modesets scanning this buffer out, by position in the list */
@@ -87,7 +97,7 @@ struct drm_splash {
 	const struct firmware *fw;
 	void *map_data;
 
-	bool use_bgrt;
+	enum drm_splash_source src;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -429,7 +439,7 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		return -EINVAL;
 	}
 
-	if (splash->use_bgrt) {
+	if (splash->src == DRM_SPLASH_SRC_BGRT) {
 		x_pad = efi_bgrt_image_offset_x();
 		y_pad = efi_bgrt_image_offset_y();
 
@@ -498,10 +508,31 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
 				 size_t *img_data_len)
 {
-	if (splash->use_bgrt)
+	switch (splash->src) {
+	case DRM_SPLASH_SRC_BGRT:
 		return drm_splash_bgrt_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_BMP:
+		return drm_splash_fw_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_NONE:
+		break;
+	}
+
+	return -ENOENT;
+}
+
+/*
+ * Pick the one source the image will come from: the BGRT is whatever the
+ * firmware shows, and the BMP loaded as firmware is the fallback. With
+ * neither, only the background colour is drawn.
+ */
+static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
+{
+	if (drm_splash_bgrt_available(splash))
+		return DRM_SPLASH_SRC_BGRT;
+	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
+		return DRM_SPLASH_SRC_BMP;
 
-	return drm_splash_fw_load(splash, img_data, img_data_len);
+	return DRM_SPLASH_SRC_NONE;
 }
 
 /* At unregister, once nothing else can use the image */
@@ -818,10 +849,10 @@ static int drm_splash_client_hotplug(struct drm_client_dev *client)
 
 	if (!splash->source_picked) {
 		splash->source_picked = true;
-		splash->use_bgrt = drm_splash_bgrt_available(splash);
+		splash->src = drm_splash_pick_source(splash);
 
-		/* If no other image has been loaded, try to load a BMP as firmware */
-		if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP) && !splash->use_bgrt) {
+		/* The BMP loaded as firmware is the only source that arrives later */
+		if (splash->src == DRM_SPLASH_SRC_BMP) {
 			ret = drm_splash_fw_request_bmp(splash);
 			splash->fw_requested = !ret;
 			if (ret)
-- 
2.39.5

