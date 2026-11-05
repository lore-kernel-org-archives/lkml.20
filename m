Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874742;
	b=IG7Lr5YS5Yecyc04DuKYQVWkBgy9KvFzToqpdUZ1UcGdlhOMbC+Fb3/PBJoMAq887IW3
	 u+s+XHdfHskTLhL70YwWoRdKaEle85JU09mY3CxGRuGF6FMioTM0iL2K4GiVft+pDf2T6
	 fj9Ko/97dchpipPekUgWh/7L/6DGHquOLJl2MyNDxDSAix3l9qlOyh2vkFPCLYUGDmYjm
	 hdTaXNjpGjHrnizFI+9fSFZ7Izp2HTMQlw6b5ha5Rgm+9IHHx7eyzPmtoWJKEthqBqJYD
	 u6XsClQh9T9r7QX/LL16svryc2UNet8hJteb1FaaqKrnb+EDDYZvJ8bDHulZme2fySQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874742;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=9ESVIwfrstmuTB5PVf4tjsoA056XmRclKyxQodX1lf0=;
	b=ccNfTc8YU6CsnBjXUbIyqUsg9iz+5QbeSYqTUkggBiTp+nR8aqxWzlURovLvLYsfWI+o
	 mZ3vViK/S6+aCUbrem742zFudiCjam0JRA4RuvcaF+aHNYi+6fOCYemQMPtexRZYs7QvM
	 uOUKANQSJ2RwKmK7c+fbk0y6sf8fosdoBJjgzG8bHr5Uj2SHEEEKNkWO9iS/CWTi/W7sl
	 zgXwgmpTlID1TTMRUOOozbXwUoQjLfBnE7nII0/62gN35Y/eIGUNeRc0uGdkD6jDxQsW0
	 RPRawiRKBEy9KxbXfMBwVuB58wHhXbUHAotmlXfzfICBz6/+JGOEa7EfzE7Flw24tAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BPFf6ySq;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA030606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA030606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BPFf6ySq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D63F34E4078F;
	Thu,  5 Nov 2026 10:32:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A38145FF85;
	Thu,  5 Nov 2026 10:32:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8619610329233;
	Thu,  5 Nov 2026 11:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793874737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ESVIwfrstmuTB5PVf4tjsoA056XmRclKyxQodX1lf0=;
	b=BPFf6ySqTF/2xiIDk+mukLGVZDGGYcvRi8yzk23Qtr0B1hweOJuGdWPq7JgAUxfjD10CNi
	F6pR3knfmgerYnphl5kxt+ULT1y50oTvF73cwtEB2+IdFHHxY2hgeEzFHu426cerguYPfl
	4TxLPoiX/fvCvIVao9qpasTCoVdkIjYG95Y2y5VhI6PdJn+APC11DeeNcOef6sM9+tZqDP
	MLXY4A/7JKzeNMrDbq6KYbetFnxC8jIrx4ANpKc1EtyUZcu/3+pDkPq8aRGrxYKZPb/mig
	4zxHJuTKaSrgmGNnqJ8n0lRu5Bq4RGNPpSLfYNZYWA6eebP5kvVUt8sopNmcdQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 05 Nov 2026 11:32:05 +0100
Subject: [PATCH v4 1/3] drm/vc4: dpi: stop using deprecated
 drmm_of_get_bridge()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-fix-of_get_bridge-build-regression-v4-1-906ca343ac1b@bootlin.com>
References: <20261105-drm-fix-of_get_bridge-build-regression-v4-0-906ca343ac1b@bootlin.com>
In-Reply-To: <20261105-drm-fix-of_get_bridge-build-regression-v4-0-906ca343ac1b@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

drmm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put.

drm_panel.h becomes unused, drop the include.

Also update a comment that is now obvious: now panels are just bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- re-add and update comment
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 686903b8864b..e0d565de42b5 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -16,7 +16,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <linux/clk.h>
@@ -278,16 +277,13 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
 	{}
 };
 
-/* Sets up the next link in the display chain, whether it's a panel or
- * a bridge.
- */
+/* Sets up the next link in the display chain */
 static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 {
-	struct drm_device *drm = dpi->encoder.base.dev;
 	struct device *dev = &dpi->pdev->dev;
-	struct drm_bridge *bridge;
 
-	bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
+	struct drm_bridge *bridge __free(drm_bridge_put) =
+		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
 	if (IS_ERR(bridge)) {
 		/* If nothing was connected in the DT, that's not an
 		 * error.

-- 
2.56.0

