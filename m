Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAF679CD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160735; cv=none; b=qbTBoARuL2tFYaLvis5i1LhlMOTiyjG07nlEzfeCtVNTQ7Rl2Bv3KBeqty68iA1C3dqkQhxWeu1pqOL6G5gve7TJXrp1D2+A2/u5Jj+R/GEJ3BMcvUtrn4HQa7r5HPCuGYB+toOh3gxQVjTivli2FU476R/djFly0oiutigeWHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160735; c=relaxed/simple;
	bh=Y//2B/y9c1+PInn0UoaxR3RF1A8oIriYQhCokHi1XEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDlyeQHI2VcZQV1XGolqay7OPIYCUTP4OUDa4hou7nK+apWM6GxJkEIXX0dpzGmHJPs8T+CGG8hgzJgXp67xXTNz11Udmekbj0QmQPQ9knVU/wLbh2/p2Kc3F1Mv1500iBhgv1ujsljVhTc5YTWtDjxLvMsQhUv2L4u70QBZiYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CCmzHR+y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CCmzHR+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160726;
	bh=Y//2B/y9c1+PInn0UoaxR3RF1A8oIriYQhCokHi1XEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CCmzHR+yJ2n9MfkF6irj3PEzCxGhZVSFlwYI2AQkvKjrwLouXDfGrhZGq3lsYYEK+
	 A23AXoSYEQyhuA9dZXxxSXxhKUCuveL8IiykwAf2OJt6f7TjpUF5yPaCUdil0ttKHC
	 8Ueus4zQpjw2RsOloQ0p9aQNifkQ5Hx9gZBIEvbta5VxnPJKlQwy1rUAbomEsV3Ba5
	 onPISy+IE4LkSaIg7J3G7MRiUgysvDWC7dVwg3fU+TShuR3txzeK3u0aQPjq1uWGQQ
	 6vEHSwys18RpuLf7X/naMEdD9DzDscPhE8YCxlYM7yxGj7h42sK1nOIYzrHSI8eShi
	 xBnFGj75JInKg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FF2017E04B7;
	Mon, 05 Oct 2026 02:38:46 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:02 +0300
Subject: [PATCH v12 01/16] drm/bridge: dw-hdmi-qp: Demote i2c bus error
 messages to debug level
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-1-195157ba0b40@collabora.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2

A NACK or timeout on the DDC bus is a normal condition when the sink is
absent or unpowered.  Some displays keep HPD asserted and the EDID
EEPROM readable while in standby, but leave the SCDC slave unpowered.
This results in i2c-related error messages on every boot during
scrambling setup, even though the condition is handled gracefully and
the SCDC configuration is restored on the next hotplug event.

Log the i2c bus level failures with dev_dbg_ratelimited() instead,
matching the silent behaviour of the non-QP dw-hdmi i2c bus algorithm.
The DDC users already report failures at the appropriate level, e.g. the
SCDC helpers via drm_scdc_dbg().  This also makes the no-hpd special
casing of the read path messages redundant, so drop it.

Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index c9568aea98dc..9abcea92b720 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -350,22 +350,14 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
 
 		stat = wait_for_completion_timeout(&i2c->cmp, HZ / 10);
 		if (!stat) {
-			if (hdmi->no_hpd)
-				dev_dbg_ratelimited(hdmi->dev,
-						    "i2c read timed out\n");
-			else
-				dev_err(hdmi->dev, "i2c read timed out\n");
+			dev_dbg_ratelimited(hdmi->dev, "i2c read timed out\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EAGAIN;
 		}
 
 		/* Check for error condition on the bus */
 		if (i2c->stat & I2CM_NACK_RCVD_IRQ) {
-			if (hdmi->no_hpd)
-				dev_dbg_ratelimited(hdmi->dev,
-						    "i2c read error\n");
-			else
-				dev_err(hdmi->dev, "i2c read error\n");
+			dev_dbg_ratelimited(hdmi->dev, "i2c read error\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EIO;
 		}
@@ -404,14 +396,14 @@ static int dw_hdmi_qp_i2c_write(struct dw_hdmi_qp *hdmi,
 
 		stat = wait_for_completion_timeout(&i2c->cmp, HZ / 10);
 		if (!stat) {
-			dev_err(hdmi->dev, "i2c write time out!\n");
+			dev_dbg_ratelimited(hdmi->dev, "i2c write time out!\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EAGAIN;
 		}
 
 		/* Check for error condition on the bus */
 		if (i2c->stat & I2CM_NACK_RCVD_IRQ) {
-			dev_err(hdmi->dev, "i2c write nack!\n");
+			dev_dbg_ratelimited(hdmi->dev, "i2c write nack!\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EIO;
 		}

-- 
2.55.0

