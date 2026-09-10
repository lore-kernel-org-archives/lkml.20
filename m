Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE135E930
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019111; cv=none; b=fwu1om656P4x6i8nZTbKSSlrb8AudhkBZAngYRqWvkPVMB3SP6jafYv6v8QfwiegiQW3kmoPlkVBsrnEXpDwu3ntEOayQdQR/6KLXsKXZLgtlYcl3X/yao2C++OLNamqpPeE7lr5udFsbwDLZTXwwuQpqtRFi4MAuMrNlhnKCyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019111; c=relaxed/simple;
	bh=fLsspzdTI5YPs+eo3giUzFXCMIKFkW2PNlroBTMyjgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMK/ze+Zy1i4bn1FS4kCWRxiLT/ocRyXsbTT1595qG+Xboi/he6HJXZbMiEtSUUfn3BFYwsEPtv6y/tD1rwHqfYnz90/PN4QV31dy8wfoUB5CXEbBDQNqAo0D9b2QxGgfGeE88D3/EsS3hMrRvlrnKa8ShlWnl6mkJ9a4DYLUkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPkx1ZJp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPkx1ZJp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso789622a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789019109; x=1789623909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrTsAq+tUgNIgmUZvhsJQsIdVBmbJT7W1rd7UeUsP5k=;
        b=VPkx1ZJpw9zt5wC3kh94DMTE7meTbUEQ/5oB+tcIMJFjTgY9vgtnKYukU38z0gD33b
         GlxVMKax0tsIWqlldYZC44Eow19bNlTFjXEJ1+mCeNcrn6QR4/bb9RNicN02N9nKMbPT
         8Kr5t1fzKHXpdVyJ58BhKLWGOiOSj7vL/FsBaUaVzvAiVDPcyUmhEJJVKOrCpBn/Q6iu
         ADCin6+CqQDsw/o8fjHa0TcPfS8zlODCCdb5sSPBRynF1cKqiG7mMr+2z6H6onnO+JPZ
         XgeyLa0VjnmO38oNxHnRHFgIUHxzweQfhc8NFvcfV722+B3QdnpTa8QRRnga32yNY9hx
         wqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019109; x=1789623909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qrTsAq+tUgNIgmUZvhsJQsIdVBmbJT7W1rd7UeUsP5k=;
        b=fFQTdzwKkU9bPSs1hCP4d6cMv0nqCUlcDjtfUWXmbHDIAox5AHXNFrBnZhXlyxB3gp
         g/CJImEj3dyMNjMDNOuaFgRPRgXXpzOvS516xMbg9YYhAid9YwXMsqpvRxCQtanKA/Ke
         TKVU0UcD1QCXFP6BI8hcReW9PBVCTRaNt6C3+4TKCTe2OYRoZZ0pkEUFxkKgDkFAneai
         x/5a/XClyz9gBYUxFlwXq+oVgq/CXri3aBtfluIrvbFTEqERG+sZrnyTMveduZNxXkEF
         K0nFUQCUTP+6ieyq6SKzA56cIF8B7TDgy1JxXX4FqZ5OEmcniTtX+5cZW7FMGdUsNXfM
         WleQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjBlC520PzDNYLHS1wfoqEKFl9NmHfpSgEV57x7Fp+d+MFuQjAzc5SovHTN4NZRnxCDhDsE+sWwsuFkTA=@vger.kernel.org
X-Gm-Message-State: AFuF++mKd7+pCWgWd8GIPMn3yScRdjwlgpF1rY1D2QJPkRnr4n11bzfV
	zRC7qf/1wzueNCbJyqwaTWdkjtBIZnQODC6lQjw+d+H44be7ySB8/zkX
X-Gm-Gg: AYBFou2GbV1+UAAA3RDtYPMfDKSZOpctPMVlG4k52ypInJmriwf52VJLel4UjToUZ+f
	puMoZz559CmGnyKmZUYsv/ubxCFec514R2oDfZY+G9fTBd377CbabVv5xszIhjMu4e+7ZWk0vdp
	/ckHwDruV95uGiubyYvMMjcdHRFejoUexI/OAsXm1ep4tIrWLNLLNafLP/UwEo7RcS/Gsgvc/5k
	JSX9833FRLOeoIqinHH96chJPKmDFnGBIhfZmPQ+DutRsxNWND6nerDFb+gbrEPWhh+n+8JwKd5
	5asbbl4vRGA82gQU6Sqou6GHCS2zH9kFTKYMqB+w7YWHauiyKrsA8RRUsgS+Wj2NYGjuvmb2AG6
	tMdSzIDhba7y3TGrGzTWnh4W522Qti04EoXjljoX8Jf8LsSe3MJuisflVsN228xzV2A3QHYceEr
	EguSUAVQ5oRyrKEzoOxrwstvr8wQ0eXuoohou9QCd9/Xpqw/70fgk7u4Q2nHVkTg==
X-Received: by 2002:a17:90b:384e:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39d707b291amr6953379a91.0.1789019109032;
        Wed, 09 Sep 2026 22:45:09 -0700 (PDT)
Received: from fox.. ([43.242.224.196])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14344a86512sm22102561c88.10.2026.09.09.22.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:45:08 -0700 (PDT)
From: Roshan Kumar <roshaen09@gmail.com>
To: linusw@kernel.org,
	dri-devel@lists.freedesktop.org
Cc: leandro.ribeiro@collabora.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	pimyn@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/pl111: drop alpha formats the hardware cannot scan out
Date: Thu, 10 Sep 2026 11:15:03 +0530
Message-ID: <20260910054503.4155812-1-roshaen09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825105427.686619-1-roshaen09@gmail.com>
References: <20260825105427.686619-1-roshaen09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PL110/PL111 controller scans out a single framebuffer and never
blends its alpha channel with anything. In the pixel-format tables every
alpha-carrying entry (ARGB/ABGR in 8888, 1555 and 4444) maps to exactly
the same register configuration as its XRGB/XBGR counterpart, so the
alpha byte was never used by the hardware.

Commit 860e748bddcc ("drm: ensure blend mode supported if pixel format
with alpha exposed") added validation that warns when a plane exposes
alpha formats without a pixel blend mode property, and PL111 does exactly
that. With panic_on_warn enabled the warning prevents the syzkaller
vexpress-a15 manager from booting.

Drivers should not report formats they do not support, so remove the
alpha formats from the PL110, PL111 and Nomadik PL110 variant tables and
the now dead case labels in the display setup, instead of advertising a
blend mode property. Behavior is unchanged for userspace that picks an
XRGB/XBGR/RGB format; alpha-picking clients fall back to the identical
X variant.

Link: https://github.com/google/syzkaller/issues/7805
Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Roshan Kumar <roshaen09@gmail.com>
Changes in v2: drop the alpha formats entirely instead of advertising a
DRM_MODE_BLEND_PIXEL_NONE property, per review feedback from Thomas
Zimmermann. Leandro's Reviewed-by from v1 is not carried as the
approach changed.

---
 drivers/gpu/drm/pl111/pl111_display.c |  6 ------
 drivers/gpu/drm/pl111/pl111_drv.c     | 16 ----------------
 2 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 5d10bc5fdf1f..e1b513d36c27 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -267,14 +267,12 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_ST_LCDBPP24_PACKED;
 		break;
-	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR8888:
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_LCDBPP24 | CNTL_BGR;
 		else
 			cntl |= CNTL_LCDBPP24;
 		break;
-	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB8888:
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_LCDBPP24;
@@ -297,13 +295,11 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		else
 			cntl |= CNTL_LCDBPP16_565 | CNTL_BGR;
 		break;
-	case DRM_FORMAT_ABGR1555:
 	case DRM_FORMAT_XBGR1555:
 		cntl |= CNTL_LCDBPP16;
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_ST_1XBPP_5551 | CNTL_BGR;
 		break;
-	case DRM_FORMAT_ARGB1555:
 	case DRM_FORMAT_XRGB1555:
 		cntl |= CNTL_LCDBPP16;
 		if (priv->variant->st_bitmux_control)
@@ -311,13 +307,11 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		else
 			cntl |= CNTL_BGR;
 		break;
-	case DRM_FORMAT_ABGR4444:
 	case DRM_FORMAT_XBGR4444:
 		cntl |= CNTL_LCDBPP16_444;
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_ST_1XBPP_444 | CNTL_BGR;
 		break;
-	case DRM_FORMAT_ARGB4444:
 	case DRM_FORMAT_XRGB4444:
 		cntl |= CNTL_LCDBPP16_444;
 		if (priv->variant->st_bitmux_control)
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f5..2175ac953795 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -341,13 +341,9 @@ static void pl111_amba_shutdown(struct amba_device *amba_dev)
  * This early variant lacks the 565 and 444 pixel formats.
  */
 static const u32 pl110_pixel_formats[] = {
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
 };
 
@@ -361,19 +357,13 @@ static const struct pl111_variant_data pl110_variant = {
 
 /* RealView, Versatile Express etc use this modern variant */
 static const u32 pl111_pixel_formats[] = {
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_ABGR4444,
 	DRM_FORMAT_XBGR4444,
-	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_XRGB4444,
 };
 
@@ -387,19 +377,13 @@ static const struct pl111_variant_data pl111_variant = {
 static const u32 pl110_nomadik_pixel_formats[] = {
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGR888,
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_ABGR4444,
 	DRM_FORMAT_XBGR4444,
-	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_XRGB4444,
 };
 
-- 
2.43.0

