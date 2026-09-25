Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4140443B3F5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341293; cv=none; b=JBRzqRILx0eWhp9DS/c65x4+kXOPvJQNQ/i3bqw7MUlKB61GmKutKUsIHSnvNBLbj8S4lAEd90FFhAogE3cNL2EkL4C8s6jT1zTbeDtCm+6bSRBJKohMtPuIRVYIqFNWZrwAqERRuprBDrwyYVC3fDo3mwvuXjsP0H/ySpiHg7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341293; c=relaxed/simple;
	bh=Y8KuumFeg2TNtbfrw8uLyBEE+Uon4Wg8fV3wFdy/75w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNLK3g45q3Q5uDuKGtQP6XRdTDL9ZxLUHazAWI5U4rwQ/3D8H7BG3BYuG/bddked6+clOcbAmPmlbUjaOnHLQtmV5A7DC1V5YlwjoZU/4NhkybXFnAx/N6/QGA2DBX38QbN3FDGoKcWhzpUwZHwqldI6Nxf18t5LFOABS3NcWEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwHBbDIV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwHBbDIV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053091F000FF;
	Fri, 25 Sep 2026 13:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341291;
	bh=y36uyne0Xz4vr4BUu2+7kxY/O487+hZX4QtqjTIV1Io=;
	h=From:To:Cc:Subject:Date;
	b=kwHBbDIVFo8MBHHPB3KOherccixtgqTf6EhV8sDzx17pgQ5Ahh91P81RwaGFpy9ug
	 sGUvvOkJQ+t/WYliuvII2Kcwdd2w2EcypQ2ufzbNW7SpUl8QIpv6N0R/v3WglekqXO
	 Y0c8FArKbUy9iCz4UYQLczz3TJPRXxildOMcz7b+vy4TB1C5LrhQ9ISPaF3oUJPsWt
	 yFp6FbXXa7EcrYUIeSZhVuUgkMTJEG8cCeHpPeVkU16qOfSS5I1YSzkojO3Zn8CDvo
	 RsBOoGibpdZTBZ/eh5++dnDpE419/HvO7+tB6zsIwVyi1kubwQBXMo6KPwvRNeid7m
	 E/nZ6SB2Shc5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: fix novatek-nt36536 dependencies
Date: Fri, 25 Sep 2026 15:01:00 +0200
Message-ID: <20260925130125.3897046-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The recently added driver requires access to DSC helper code
and fails to link without that:

ld.lld: error: undefined symbol: drm_dsc_pps_payload_pack
>>> referenced by panel-novatek-nt36536.c:109 (/home/arnd/arm-soc/drivers/gpu/drm/panel/panel-novatek-nt36536.c:109)
>>>               drivers/gpu/drm/panel/panel-novatek-nt36536.o:(novatek_prepare) in archive vmlinux.a

Add the usual Kconfig dependency.

Fixes: 75a5dbd1f4f7 ("drm/panel: Add Novatek NT36536 panel driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 6874752a1901..8bf7911d2a0e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -694,6 +694,8 @@ config DRM_PANEL_NOVATEK_NT36536
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	help
 	  Say Y here if you want to enable support for Novatek NT36536-based
-- 
2.53.0

