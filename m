Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F7648F02C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815424; cv=none; b=BXzjc0+axLkNMDerldZINlOXxq+j3HOOVMDsxdcQD29LQswNEBtJdcFrsI/86oRBWm/oKbeEAa8QGsGfTmwYJI74rhfgyCyBmPNcZDu8GSjiG+3f+0yXuNTOXZ0/faY3PMvkJWVNtT95ymRF4zSZ44FCcvOIFM9cA2lGL/1DP0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815424; c=relaxed/simple;
	bh=O1WHpjvpWSXquNmcpSOdvaAvVDHAyOOKIz7x7Xy+fDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQh+LPlIn9u7cwvPj+XNjyYO6ylhWpKka/d007kEv64Ezh0WHNzsNAJK3ujj/Pc3aUa5l8CjhoFdBAZVnbCXZRYcHgncnWpk3QXDXD49DDNtcR32uExYq3ix5TYa/1o46clkFzKITH1v3IRscVSFlpyqUnnyZutdl0VYIQi5Y88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r/uRdlU2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r/uRdlU2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B13F1A1122;
	Mon, 12 Oct 2026 14:30:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E097601A6;
	Mon, 12 Oct 2026 14:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0812F11D70CDE;
	Mon, 12 Oct 2026 16:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791815415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Opti/DO5X2lTMTVGY8z+wHnZNMtFaPOMj0o8RMo2cB0=;
	b=r/uRdlU2qnZf/6B+Dq5bEt/1BnowSM9dLxEIDFKFl79IXQQxOJ3kvdODr8PhFPV+PVj2++
	OFlw2umn+ylI5Kz8a2iPtLwdU+lrkyfPfVw6G6khwrsx8M4tjr0BiZmrdhpCRotYZFhVsl
	WS/pRPgZs6+DJ/1D7TGroBhFJuyYTRu1qlH6nPRZTpvb7f90Nc9hwEyDoZa3mYrGcKEv1p
	lxdLN87PQcD0S5Xjq1IgxC+EYsyPIKl0v79eSqXcqLVy0Vk0VQhU/l/Xi2/wX/0f7bpoQ6
	tZlOT4Q617Mu/UIQ9Z5uR/cnfgrm/Ha4KeJjBLFvwjeeDVYovrjIYN7dOo0pBg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 12 Oct 2026 16:29:51 +0200
Subject: [PATCH 1/3] drm/bridge: stop mentioning deprecated
 devm_drm_of_get_bridge() in docs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-drm-bridge-every-panel-cleanups-v1-1-0fd272f486b6@bootlin.com>
References: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
In-Reply-To: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

devm_drm_of_get_bridge() is deprecated. Update the "display driver
integration" docs by mentioning the currently recommended API.

Link: https://lore.kernel.org/all/c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn/
Suggested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..e259d078f7de 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -68,8 +68,9 @@
  *
  * Display drivers are responsible for linking encoders with the first bridge
  * in the chains. This is done by acquiring the appropriate bridge with
- * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to the
- * encoder with a call to drm_bridge_attach().
+ * of_drm_get_bridge_by_endpoint() or of_drm_find_and_get_bridge(). Once
+ * acquired, the bridge shall be attached to the encoder with a call to
+ * drm_bridge_attach().
  *
  * Bridges are responsible for linking themselves with the next bridge in the
  * chain, if any. This is done the same way as for encoders, with the call to

-- 
2.56.0

