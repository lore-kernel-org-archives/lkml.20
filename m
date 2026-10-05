Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58B233943
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160736; cv=none; b=nibL80N7KGw3mCJ6NhWtacIgk+D3dTxx8zouqK+QC7ObPZGXMHzXl/b9Tvx5hH4vrFgZQk+4cBFOaq+xwSFthRTzVLwYIJbqDv8edoskzQWjtn2t9mU5UTOSROZ8EOu5p0RQqGQk/sD+38hL7cjzeG53aWGvL695petNxJWOEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160736; c=relaxed/simple;
	bh=pH776+SZcxOH2rots8NNrp9mQmYdmQZq0qu/8TIYb6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtJZecAFKTvKve1OvZ/DIQyplpCTgqIPfElLvb/sLSWXvfFTzoB9GkOPrUHlTu6C/UR7qkrJSroe/xC4+rH947cA5j9bcTyqZRcBotLEb4BN2tSDtB00cfO80o+bYuP/zORDF37RplbJMApm0lc3ZuhDYp/MzJ3KYxpEbtKlQGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cB/4dwjh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cB/4dwjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160727;
	bh=pH776+SZcxOH2rots8NNrp9mQmYdmQZq0qu/8TIYb6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cB/4dwjhiUbgDaTk4/ktbAJzIwG9s34Gp33z5b/0//yNRqFBPAuONaML9YVc1Iye2
	 RNrNE/wCdnnLZtikwyJCsEKTA9nBm6qRSqQ4dzDf4BChEZijADsfG2xpk2wfKRTaZJ
	 6eLsOEF2VlZhf0P2gGevuOqY+7Z++PaTfxntWcScjlkW+4PQFwCoxrCZXzjh1FW+YR
	 yCCRVurCg8cybL5KthJgvzFnKdI+9udT9o+QB/wfXbMFXwzwn658IdsROZfHS92KYi
	 6QVVjn8ITGm/IK0DvCDBELZYgHXddx0HIvK6HkAv6NFvj7GoywbKL6LlLE6KhjWKPX
	 oNjUilOpunMJA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FB4117E0CA7;
	Mon, 05 Oct 2026 02:38:47 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:04 +0300
Subject: [PATCH v12 03/16] drm/bridge: dw-hdmi-qp: Remove unused workqueue
 include and define
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-3-195157ba0b40@collabora.com>
References: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
In-Reply-To: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2

linux/workqueue.h is no longer needed, and SCRAMB_POLL_DELAY_MS is
unused.

Remove them.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index bed743ce3909..4b55bed42ab7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -15,7 +15,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/workqueue.h>
 
 #include <drm/bridge/dw_hdmi_qp.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -38,8 +37,6 @@
 #define DDC_CI_ADDR		0x37
 #define DDC_SEGMENT_ADDR	0x30
 
-#define SCRAMB_POLL_DELAY_MS	3000
-
 struct dw_hdmi_qp_i2c {
 	struct i2c_adapter	adap;
 

-- 
2.55.0

