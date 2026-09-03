Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AB6429818
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423150; cv=none; b=AIkMbRS5YHUE8A3aIwLIm3F9Abh6DWnOFaquj2d3470deuXDzVNyx/VnvupomZOTaqVzPhwaQcpmeSZX7f6dyzyVOUZ2BUq2iSvHDTSa4ahC095FCWp4uw094rBz2KqsTQ0blGiebo1YtSZaX7muSlZYTKAmff68NMtrW/8zAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423150; c=relaxed/simple;
	bh=Npe/PkexqQkZbnpl0luiiB7MgJaTBmo3xxd0ijpJOjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhpNPi7AVia7UpFO2DcJODcf3pVId3TCfFUU3Ju7Hg4FxnUBNe//RKkbED4Q9Qq6zB/Nmzypui/eXxH7cp1URKtYA4BzqTBgwYgR2UAjonA4mcfgk3VSYPGdBJjxhpyXytK3smXkd8qUEa+Ua2UNWs876Qv0a4dCgDpSPXq6gEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dLUncXhm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dLUncXhm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D2F41A1990;
	Thu,  3 Sep 2026 08:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E92A96057F;
	Thu,  3 Sep 2026 08:12:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3F7C11C7A03F;
	Thu,  3 Sep 2026 10:12:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uzHFdnJ9YPRPA9nGrh7ulAEZnrzGbXJbec5Chdit+Zg=;
	b=dLUncXhm5sG8BzsByBLKL8FY+kz8ST/wcXw/Ad1l0089CcnNuY7+0BE+4nU1HFfHAsAy7K
	zu1lGgQQU7YacN6w802YXVKGadFihpokWFiy2RUXFslJrzSmBrNZIC7VMaLLayTL6huouN
	9nnpV6piK6AdvWiY+alqEF7zcd+7k6c1VtsUQ+xECq7gbz0mu4vjm9zAedldd7sD2BS7Fs
	GPXrcEdOztlCBuAvG4vgoBKpZ3IyiLzDuHXAwvQzuu54nqeVlwYQRxoK8nARxrwwETpKvA
	dQcMOeouCwMMkvZknp+tCAU+lJxO9Z7k3P7XnQx+7zoIjtwkhBnoTASz6+GlNA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:12 +0200
Subject: [PATCH RFC v2 09/19] drm/mcde: dsi: remove unused includes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-9-2ab8ee24538e@bootlin.com>
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

The helpers are included but unused.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v2
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index ce078aa3910f..747886dfa17a 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -11,17 +11,14 @@
 #include <linux/regulator/consumer.h>
 #include <video/mipi_display.h>
 
-#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
-#include <drm/drm_probe_helper.h>
 
 #include "mcde_drm.h"
 #include "mcde_dsi_regs.h"

-- 
2.55.0

