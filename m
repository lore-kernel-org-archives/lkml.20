Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073579;
	b=zNieLp1q29sVD7Lx8PDrqKqPkjzfa0yxn68TEhfd8E73IPgKT/qSaDFb+5l+hfCeHD6e
	 ULOUBpQwQzvOG7zX8Mvz7+6VPDO9Of2DUyShCNY0p6xSrrhDvwczrTyYOmSHns40x8OeS
	 bnswrjpFXUmmvprySTmR7bz6sVXkgn+m6LBMClBdRVnKz1EoU4iTy09BCkkrsJQr9wA0a
	 FXMGw+uq78WOBLcJmehdqsPgOeWrubKZxzb9lkAHUHsTZNFxuPQV/hTYtVvBaBDP0yY2o
	 5tHttN2jv6W69Kcq4pZNZZFQ8yVhbLcDa1EmOFPvcjQo5qTDrGqaoUiCYxC5gKf6jTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BICHTACzcYBYNKwFNl6UZpjtKoThY04fDneyezGDUuQ=;
	b=Wr8QWUB9l3BknQ/kanJQRmcXSVVKXxjY7eqx6hrvJDX2nUOAZejMTwbVMG89s0vUqkR7
	 /ABDWEqXV7AD03MqzrGDDgwurv2ArxR6gtTlW8H0nXknYfrpDc4pLtz2PP8IFU+v3ClUo
	 0lVo6NOm1hpOkLE3pPglmnAKGAufHZ93QN+UVh5gHtFnl0Zyz2QaenJeo5+frxeb9jRJn
	 JvDuMmsJviD9cFEm1vtkH1a5SEVcy+F/cwFv8GF6FCXbrKSFdtYyzbW6JYLNyjpMzko+G
	 Gj9KyF8mfUG2BZQ3AEOvUD66UH6XGXT2lH7S3F2LoTezOPtZwnKNqV/iySohQmrw6HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IRIgdzB/";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B25606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRIgdzB/
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso694563f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794073578; x=1794678378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BICHTACzcYBYNKwFNl6UZpjtKoThY04fDneyezGDUuQ=;
        b=IRIgdzB/GUERXAPw2irKTSy82SlOO7rEVtDdnGzCPsK7GKid1mTN3l9wNDBdAKFNhS
         mrBb4Z0Glhqh4T+BqL2vAwPz0Eev1viNqQ5FsEY/Of3R8ZrxOdAyHYkNb8Newa4Ad9xZ
         B+/N6drbIEI4iHMKdi+5JjHicAJFfp3A843AzM94LrNMCoUvIfSVQTpWvUKQAXiPX4YI
         pEHHhIWGjsb+UFVf6flasCwCBvg3kHy0jHyy4smicZPsukKkZ8iLZ09AX9IUqbiddTba
         YucICvt140UggPR8ctZS3sAGLt9Qa8PJruOev0MwlhuwkRIKjO2Z307pYwzY7NRWZvpm
         mxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073578; x=1794678378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BICHTACzcYBYNKwFNl6UZpjtKoThY04fDneyezGDUuQ=;
        b=n3maYYPhgn01H6hCfVRn3bSS6Nzz2zglVooITD/h3i++CCjF0balCiU8stJDV1xp09
         KLKFm2SPwl6vdvIHVladmhzWEyjkEXEhJO6DyBqL3VHbqegD0cU1IMY9+ALhSVfl9lx7
         SxtPsu8bKe4LDxm/z9fcfnADNT9mJ7eag1BpH4No1FKMWFzpDjX5uhREa5I2khgpCoQY
         BD+unycMRgsvgxJzhyB/IBe9mqwFPQu8nED+/KaUsMIxKBflcl8KmEZNplmNi7ldZ3hk
         RLmbnFZWGm032aR7yxYaWbMqWC4WyHdtLC3K7pw9d5j4gXMwBBgq0za6ZVFxD/Mj44Wm
         DShw==
X-Forwarded-Encrypted: i=1; AL+hErFVr0LMfdUsMZPzCoRjKlJFTEv3Mm3lrh3cNxXKQ1iVWwwrOXi+t6i+SxzEFTim6KhLITdX15WkACi8tCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2aEIsh7LB+sBwkii+P89XEn7VLZIvpnQt3GeU+AjLntKn2Ch6
	r0+Zx5lpmechZiQltZlSYhecvfyyAprZFbrn/08ltf9esP/a8mLmTjBT
X-Gm-Gg: AYBFou2xMZlYyxI3hEF5K4iaaWK2rDXGvSVXfvgnK/XQmxRepPISRox4JQ6MKq00jIX
	HAnH09nKITa3BZRbjWwweh1AoxN2ROBGRhXUhC0CwEvB086s1CJ4s6H9ZlAlSOKFwQkcsO2beRW
	QVC65nkY4gMVbGfpB3d0D0qKUQpSCJC322VQMSt7Gb3F1H3bnVwoExT4CCHK22RGF6qe4aPFqaQ
	fhIa4ifBdFMTTj24uSSBVOGQtDPAHQeNdkgFExHDXM2qDn8VYfwj7n9KGiQs2G59mL/JDR9bODV
	hGmta+Nn0Y5CRKOrzb2Oe9Q4Tllu0gWMAe17n0SJuR3bVxPfMgDHPNxNIwdRABeu+1BB7FXIB1p
	f1APsnyoL/DuaZoUskV3XPtWOeKV/c1yQojgYatk5qFRvgWUXWuHi9yj6oYKmDKkDqC73C0bsTK
	noWF9kdY0p3Ck7T6Bmqj9l0cdMONQ1GBZREVwzVdizTobDUU+2wZ+VpNyNgCcYU7X3RPBQODIN1
	3y74bm89vrVhJPDCQkmaf0GedDuK3Ma18QWJKqnz1xosRYHSG0VSxQ94EIf1K50MrnfxV1W6U2Y
	msJ/w+fYqQRiJ9kATNDiNtZbsxDfQzSd7TuM+yb/vg==
X-Received: by 2002:a05:6000:4690:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-4927721a2b2mr7918701f8f.24.1794073577747;
        Sat, 07 Nov 2026 09:46:17 -0800 (PST)
Received: from cachyos-x8664.local ([188.127.103.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d770248esm11055718f8f.42.2026.11.07.09.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:46:16 -0800 (PST)
From: aic0d3r <igotmysoul@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	aic0d3r <igotmysoul@gmail.com>
Subject: [PATCH] drm: panel-backlight-quirks: Add ASUS ROG Flow Z13 (GZ302)
Date: Sat,  7 Nov 2026 18:45:53 +0100
Message-ID: <20261107174553.123652-1-igotmysoul@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The firmware (ATIF) minimum backlight on the 2025 ASUS ROG Flow Z13
(GZ302, Strix Halo) with its TMA 0x0803 panel is fairly bright: at the
lowest brightness level actual_brightness reads 539 of 65535, which is
uncomfortable in a dark room.

Lower min_input_signal to 1 via a min_brightness quirk. With it the
lowest level reads back 0 and the panel is still lit and readable, so
the usable range extends noticeably below the firmware floor.

Match on the product family rather than the product name, since the
product name carries the SKU ("ROG Flow Z13 GZ302EA_GZ302EA"), and on the
panel ID so other panels in the family are unaffected.

Tested on a GZ302EA with BIOS GZ302EA.314 on 7.3.1.

Signed-off-by: aic0d3r <igotmysoul@gmail.com>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index dcb91e12b..fa5897bb2 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -68,6 +68,15 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 		.dmi_match_other.value = "Galileo",
 		.quirk = { .min_brightness = 1, },
 	},
+	/* ASUS ROG Flow Z13 (2025, GZ302) */
+	{
+		.dmi_match.field = DMI_SYS_VENDOR,
+		.dmi_match.value = "ASUSTeK COMPUTER INC.",
+		.dmi_match_other.field = DMI_PRODUCT_FAMILY,
+		.dmi_match_other.value = "ROG Flow Z13",
+		.ident.panel_id = drm_edid_encode_panel_id('T', 'M', 'A', 0x0803),
+		.quirk = { .min_brightness = 2, },
+	},
 	/* Have OLED Panels with brightness issue when last byte is 0/1 */
 	{
 		.dmi_match.field = DMI_SYS_VENDOR,
-- 
2.56.0

