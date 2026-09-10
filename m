Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797A33859E0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789009492; cv=none; b=Sym0nDdTpV/W9rSu63XPbsjRUOknbQGnGkSkTg0Iea6LuBkonedzGkCPwe7J8aHAYr2/xtPMwEUuK6yhLsx2XUkzL0q0zxbCGT79/1MVyBLSBSNCVExaxeBFTTHJ+ZyLjL1sDhrxhl1hPlS+zFD9jRGlXc7vu9gD/boG9HrErVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789009492; c=relaxed/simple;
	bh=11x8nh4/GocuGyfa6j5tOwvYau3RbR+l13vudjCrR34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsHjyUo3SpbLqeOmrVZVEJWffPzgkozYSgQ6aTiMsIs+X/Q33kaGeisDXZTNNcrbqXNRTyMrCzk54oFhh/TsfS0KYMAlmxwxW/mo/XFfLZ0URujcYBT63JXroJT0w3ofuje3I8mdLkCGGCYtwSlf3iYrNaXEUxDdgvHz04rMnCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com; spf=pass smtp.mailfrom=compal.corp-partner.google.com; dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20251104.gappssmtp.com header.i=@compal-corp-partner-google-com.20251104.gappssmtp.com header.b=pccOBGhQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20251104.gappssmtp.com header.i=@compal-corp-partner-google-com.20251104.gappssmtp.com header.b="pccOBGhQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso948807a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1789009487; x=1789614287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sLZ97DnFTLkm0PkrD3uKvAkUsl4fwc4lT7Olf3ovjLc=;
        b=pccOBGhQFadgYvKH3kaA/uZ6H1pE+BCcQUj1eAsGkoc2Zt0xVWXAoMJsllb1XGJEvG
         7/D+OhctvFOIRhv6IO3dFKpIQA0qfU7Fo12QVy5cuiux8KKTdSPtvSSmSFaSw2Mj2is6
         zjl12L6u9tfaiviJ2n/UaOwUl9LsErMeXsjgSAb+wnhHuz4AHUaMSgl7YPy0zuTJRrz8
         fxNPZjuV+jGjwnCv3Ge57LI6/zyknCTUjh6of9aMAhy8JWj5R4DeJfyujikcy6K10jd8
         bJ5GRxtr4Je84CzuDm/h+bDsGXKKKdFXhyOzkAY6Qf7pNLJhYZQpGBwrtbQS1L50w+Kf
         s1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789009487; x=1789614287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLZ97DnFTLkm0PkrD3uKvAkUsl4fwc4lT7Olf3ovjLc=;
        b=SP7T/QjZJqEf0JWiUxfK+agyldto9VAel3ZVp62BOT/Y9BbRO2pDrp2IMasxdeXMA5
         x4fB+GUE23akl4ifUAgLbdNoGKvhd+P7oDeS4Fd8S7EhDVtz2IJRu3scIu0S3FNcyQnw
         uw+CciA4CjSLzKC49ZDYMG58YMZFtXlt+sBpy4BIWP4r7GyezmD9WPjw5dAquytVU8ri
         OkD8oLsbU+jj3XCLDlsLyVZpeAruUf3bAuWwx3SDR2Hdawnq9f7n8b/fEigvkwQVXcQ9
         W1JRaJnt302Rg/SSmrObn8dZBdXlpw3g6i2beVoaGKCO8H62QisarLP/7Llj4K/M7mtN
         6b8w==
X-Gm-Message-State: AFuF++mskHJjUVM0azIqvF5FGsexzzMVcJi1YSNoLtevzFomvp9qzdrY
	bD4Zr/C4cFsjJ4Tf4GO0ODPZqXBUlJjRANmOhsRbdp4YcKPyUsnwxz7vtcGDXIW0OFwYuqdojW7
	+abzV
X-Gm-Gg: AYBFou2cDARd7QOC4qCsHaQEMPeAM8/E+JkaYZJh+Y3uaiNG2FSYr4CbmKgioaQkyv6
	hA+R9gh2Q7+gbBZMNPlrm6wfxpbZDb9j5HRfRjhhq0TojM3i4PA4RhEiQY4cUujoD0cpGpHW/zK
	E8wrB/CnPZUQFgk+Ah8tDH4Axk/UJ8mm19mrwebvs4nCPHYP3NMPHtUhCdhapoXWPbxsezGBU+x
	ZjxfcXQ/AIAdTCf/Nx2jaoHAncBPJeJEXsr7/1JTpgVZlGUqExHtbuaOuXiYQ9jfGlkfL5Wl7sd
	CufoYgkJChF8G7xw/F7mdjiBAxJAQelE6GfSPTh6fWCjMY/7eBsJw/aXnrEDKdWRVh9aYgFHf7H
	cVa0IdrI/jRvpG1XFfkEVZeTNYQrfWWlXG2hdGBG3kxfBpK0Mo2FYqe2/uh7lPEVL7JG4LqyCbm
	VGmi4JyZ9cb0UqqcTvzNKDtPvaf0m0rAsB3jce1OCP3cHJXBBLTxKAUukC0yBtTByIOHge70TSF
	Q61qxbuPGZJjCQ0Gb0ZIk3iIIQUazvu9QeAxiHGKERM1mFlpS2DtDIhDJwMHu8=
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d70ae1a5emr7626555a91.13.1789009487545;
        Wed, 09 Sep 2026 20:04:47 -0700 (PDT)
Received: from terryhsiao (61-219-175-100.hinet-ip.hinet.net. [61.219.175.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae865d2csm2733421a91.1.2026.09.09.20.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:04:47 -0700 (PDT)
From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Subject: [PATCH v1] drm/panel-edp: Add BOE NV140FHM-T0A
Date: Thu, 10 Sep 2026 11:04:31 +0800
Message-ID: <20260910030432.1009658-1-terry_hsiao@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The raw EDID:

BOE NV140FHM-T0A
00 ff ff ff ff ff ff 00 09 e5 ea 38 00 00 00 00
1c 24 01 04 95 1f 11 78 03 28 65 97 59 54 8e 27
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 c0 39 80 18 71 38 28 40 30 20
35 00 35 ae 10 00 00 1a 80 26 80 18 71 38 28 40
30 20 35 00 35 ae 10 00 00 1a 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 0d 40 ff 0a 3c 7d 0c 10 21 7d 00 00 00 01 38

70 20 79 02 00 25 01 09 7f 41 02 7f 41 02 28 3c
80 81 00 10 6f 1a 00 00 03 01 28 3c 00 00 4a 5a
4a 5a 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 c8 90

Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index bfb49b647b96..b66751df502c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2084,6 +2084,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x3879, &delay_200_500_e80, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x388b, &delay_200_500_e80, "NV116FH1-M31"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x388c, &delay_200_500_e80, "NV116FH1-M30"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x38ea, &delay_200_500_e50, "NV140FHM-T0A"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
-- 
2.53.0

