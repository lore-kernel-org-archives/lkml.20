Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679640;
	b=tYBCe0JXBEAgxggkU6EHRo+hZb/0ljrqYhzCeI3LAbK62tFPV1kgmEJ6bOt/EmnLIjKd
	 4G3D+cBYWSktQ8bkVywSIFscCoSqOvhYWVHUN4oSX4H+4+vVAANVNTOqilvd0p4+cx/Ex
	 NAD5EK/moA225MylXa95B5qELFDNz6IxPdiv/96GnlSQ4CzYUdX4NPy0N34GybfJ0gUzS
	 IZvExl3acUtJzKcVhf7JKx1F+RFwtU9BfZvP8wlAVLzwWngNhUa9Mqm2nl5bSLWjv3LBK
	 +7lxbbtaFfCToPAV0q6gD23e8AT6e/bDc9Mwl4WfgJcfF8Kdht+rR9fZi5B2Yxizq2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5hED87wOhZ8V8fUnhmXBGiVZtHpLRnJmpZB4oLmvhPE=;
	b=w4irTaFxeAS1GZY6ji8eyBwTQz+ywP5bS5QmzLH9y3C4fH0Ks3nJhr/KW/MJAdRWJTjJ
	 nVN13IlF0MZLVAZPxKZHOVan8qsAW2sFUK0u2RdC11Y4nNGRE9AlvhQVCy8WH3bYTm/Pj
	 61Fk2ac9NUWmmSKEJQsVoEtNZ4IK5lWE9zyLwiNW2sEwrdkoUZo1tnTXnjNafkIpHtMV7
	 USiGDc+t193VkQiEIKAZjnuwfH2lJw7qVBF90y1YlhGsNnSPznr/rizeRt0NhzZIAjigS
	 KmYOZ/Wgo1famgCz4zLSCG1qRphS64Ve+lnkRSxUgZs1hj3NRigiOQNKE+LEgrRqbXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPm5UO66;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB201606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB201606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPm5UO66
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1073330f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679638; x=1795284438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hED87wOhZ8V8fUnhmXBGiVZtHpLRnJmpZB4oLmvhPE=;
        b=HPm5UO66yaPjNTSYWgTCrM4u8K0Cn1Xd3zGSYMILgSfQX558hPw3jS7LMPILMM0GJ7
         Y2SmVPYtryqRoa1b1D5Ivj2q+RpU7GKhaCA2TchftpCjrKhkzXPb8AQt1z2mFNZM9EG0
         OitNNe0JVRhrIjEiS2p7XmCaOKt6CXQ8/Urv4J+YY3UTTcFGXg7yrrdGCqcsP0f5p0vN
         oPmv6j14ZPB0zKOcqwh/Z5zfAdWxpt1tR4SV0XzE0m8popfe7Cep9jBo+WxxB5RCuwt9
         cNT2vyVhM6j0cYq2hlO8kDNPGZUUmk/1gUN7I54sKZWIWeM9u5M5hk6IERDpdg7sNWg9
         pblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679638; x=1795284438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hED87wOhZ8V8fUnhmXBGiVZtHpLRnJmpZB4oLmvhPE=;
        b=0DYPitEPzU3iwMqt7h1toSN16V1wS25bMsn08UQhGbdf7psza81BFoXpZyfmjIp0MV
         sOPaVdc28T9+n71QR1YVu2hHM+3xfhPTfZJxnrmfWOPIFTU+D9QzsbTRoJDVy4UiV5Tn
         WiavEsz2yKBamvZpT27L1cviWmt91bEatZ3C6F+fo0Q1qUO9LknaXBMzMggsUknlD9Lp
         1dTcnbWKK2pRrGI4VKX2ra1ZXLBEe3XERBTwo5ZB4rW9V8apTy74f13KDH4pP8iH1WPi
         5QiI/8R5mhUa9TgoexfYIJvH/IECHTmCaCRow87RFGG5fjq0WyxIjgHMFjJpmGAOUNem
         xUNw==
X-Forwarded-Encrypted: i=1; AL+hErFKclveUSR2vH9d8WVg9z6z+tBOGTBO87PYmB9nQJaZFj6N2GF37ZWYS70O1hp3IsLeIGQrRxire0Tn0I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z86xcZT5MKbTPRupN0b6h8c3i2KDQEUkZ8w/X2OIzrreqpf9Rkd
	dUP9bLMQ7qMu068vPeB74xesE293xWTVosNoU/76jDUwr95KNjD9Tc09
X-Gm-Gg: AYBFou2O6Cdqa7tLZtjhLPUBKvx8G/u1ZOGlQM+0cUwilg2zk7gmd13zk2Qrp4puC9N
	04Ue0dcIKIcBD44T8ewIKQX/6xq0VuimIXNlGuCEzGao5bsCJa+buPNCxkPHqEeL6RRGR1RKeUI
	5495XE2XyPxT6x15dni3PJgI4a8QTolRHWB5ljc+JSilN7ohE7PASf8zNdr0Rk+/7JqM5Ec9odY
	UsiMIndAnjCjmeBftNXtY7xOXNblep7X42DoClrFXT1Jw3FZF2hBDi5oj9GIL+IpC5nbbo/aXWd
	sL+B03RBa2zrz00B6PEqQ34tZm+/hNjZyd0VxzTuwwNU9FDH93xnmtacZMp/FdLx2K0BMCtG7Eu
	szQ5vbDOuaUJwdFTJRtg8qoUYOR6ByCsoxmHNw6Cst00KSxXBwl0HMvW4FGv52+2+sBfcusK6zo
	4IvXT1Dxlkq0sTZZtHinf7qXPTkGLuMPvkh9a4VxwiqRoMzAvAzzwskdrze8eEe/t31dFc0+zg2
	KIFuvVwv8XqGUPQ7tHL+YDzBFAEtZEyIbc/2pJLlmxeklDTtDJjQhN5qSXbG1MKGbzfAjLXsw35
	oJrFNHqWAuE28y8D1DKGmixVOz+H2+pg/lhBQKFNmilqsCRojnE11znJKp4mjjIXH0zlS5xnLHd
	EuPISmFltrNie7fcmuw0fYryCqqv51NU0s6xltvaXz6wHJplLWh6eLtqiAH9DuB8/LstVkR/aR9
	Wj82E4+l414D2yjQbz0GEkC56Yj0Z0uzdNrSq4/yWL1rrW3uifZjPbGM72IezRciJU8OK0F6F8f
	3CS1nCqdfD68Q==
X-Received: by 2002:a05:600c:4f12:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb65edbbcemr44466175e9.33.1794679638064;
        Sat, 14 Nov 2026 10:07:18 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb64ec7b58sm69868215e9.5.2026.11.14.10.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:07:17 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	ville.syrjala@linux.intel.com,
	lexander.deucher@amd.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/edid: Fix sync polarity of DMT 1920x1080@60Hz
Date: Sat, 14 Nov 2026 19:07:11 +0100
Message-ID: <20261114180711.207722-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VESA DMT defines 1920x1080@60Hz (DMT ID 0x52) as the CTA-861 1080p
timing (VIC 16), with positive horizontal and vertical sync. The DMT
mode table has both polarities negative instead.

Since drm_match_cea_mode() also compares sync flags, a 1920x1080@60Hz
mode created from an EDID standard timing doesn't match VIC 16 and ends
up as a separate mode next to the one from the CTA Video Data Block. When
userspace picks it, the sink receives the wrong sync polarities, and
because the mode isn't recognized as a CTA format, the AVI InfoFrame
carries no VIC and RGB output uses full instead of limited quantization
range.

Use positive sync polarities, as defined by VESA DMT.

Fixes: bfcd74d2aeda ("drm/edid: Add DMT modes with ID > 0x50")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b8f882a17c8f..7adaa428163f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -607,7 +607,7 @@ static const struct drm_display_mode drm_dmt_modes[] = {
 	/* 0x52 - 1920x1080@60Hz */
 	{ DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 148500, 1920, 2008,
 		   2052, 2200, 0, 1080, 1084, 1089, 1125, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
+		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
 	/* 0x44 - 1920x1200@60Hz RB */
 	{ DRM_MODE("1920x1200", DRM_MODE_TYPE_DRIVER, 154000, 1920, 1968,
 		   2000, 2080, 0, 1200, 1203, 1209, 1235, 0,
-- 
2.43.0

