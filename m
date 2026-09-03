Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08B366042
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423227; cv=none; b=o9DnbEFuhmpfeNTn+9HFtolXaLpaJaUapcYrm7QKQDAi85ylu3QnDw+ntdKJ8o/+hpwrAthqcRpICsNfMO3XkFy+3X+wG/uKA5Z2nJIAHQkLnq5KdaMFc2jNEhV2MK3FNBllPWqFddCcXO+t7gmDbaz3Aui4INlAWFhP9hPt5z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423227; c=relaxed/simple;
	bh=QziXAMEs57ojYlztSvESLH3KUU0z1319BX8gBQz6Cxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FU0xSA3ddFxlpgNJRqN/1F5ibyTEGaY1C3QQxJ3LhQLgqOwDp2nsZ+Ahch1jGhwnHcDwg2oEotVsIIwnai28LTypLB4WnczvgaXNbaTemUP0Fpr5OmUibbXIKrahRFc0eAUBv0Nvze/GuarzR/AFNlzRSpdDvj1Rz+ZMXFzyWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BbWXXCsD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BbWXXCsD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 30C721A1977;
	Thu,  3 Sep 2026 08:13:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F08C2602B8;
	Thu,  3 Sep 2026 08:13:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6C3D11C79ED7;
	Thu,  3 Sep 2026 10:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SY0pHjPdJdtRzhNI28GPcbLNlgGlZJu7msNQb0jyBF8=;
	b=BbWXXCsD7m/gi1SgbNhU4TIpfLnsOvsFjaoXfEUmpyd5ckh0X1o8lNF0WuPyQGi65MZmUI
	P5YL63Mjw8lc9z5z2TJ5xx9AiOtEsi6DsVJlzyNxIs9NnnhB3pJuiu4xcUYIeKMaG+IX8o
	Hh53mVgEPatec72YAz6LtA81BizQELBZlgBOBwQdXNm7M68PC9b9+rKEqSzr/NUZbYvwuk
	7eokEfhpv/yhogW4yq74Yl8SIsuoJl9+5LlIUMdBzBxgAHPtIftNBJm5pfRL6IqqEsYW/6
	8dQ/Nsl+MhHEmqO3kK4VKlL93j4XD2JlTbdngiMEAxXfh36PmB9UoWVuPLmYvA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:18 +0200
Subject: [PATCH RFC v2 15/19] drm/omap: dsi: remove unused includes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-15-2ab8ee24538e@bootlin.com>
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
In-Reply-To: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The drm_panel API is completely unused in these two files.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c  | 1 -
 drivers/gpu/drm/omapdrm/omap_drv.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index a57f5df5c830..6723c3d422c9 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -38,7 +38,6 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_panel.h>
 #include <video/mipi_display.h>
 
 #include "omapdss.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 92d6a1f9c0a1..89a6d3b4aa6f 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -17,7 +17,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>

-- 
2.55.0

