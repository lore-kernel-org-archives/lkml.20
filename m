Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689326461F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160743; cv=none; b=ZqIO9fc3LATJBAxJ74ipyUccFCa7lIA/GrLZePGhuN3iZdw7Pz15Zxcs2QaQoK8H0qPKK1fdzJr3n3Gh0xC1D6+QpT+qjjTgzvYOtnAq9sdp+dnsrfYx8osI8IUhF+TWeYp8b+h8ISxPk8pLrOvSmO9Q/85UXVKVnI3U4B6x7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160743; c=relaxed/simple;
	bh=7fGQZHsiMEI+KvEu/Wd3yCNxcl4JUPPlRnzvM//GmE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBZ2O7HnCSwRnnpbBOITypytln06LpZDfA5sqp2OZ1DkVsEj/MYKjQrbr6K1KU6LPa0vt6GeFzicB0QFH8TzXtDkYlRUE7Om/McDr5oolbV2SWyIK4nQyr/AvOpC+o8/CZrAfe+EPsuhI7rVrX4xYjclv4mQ7EgyMThYT8t9vCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ft5m6Ht/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ft5m6Ht/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160736;
	bh=7fGQZHsiMEI+KvEu/Wd3yCNxcl4JUPPlRnzvM//GmE8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ft5m6Ht/vGUOTYpNAzD91IblMMefBa2GGW/km6qVPt0aLN/LqvF82XDVAZo0EwbLE
	 A+bJLD7FVW45I8FZ8B7YrdY3muJirznAYUAdSaeW/wZ/tS0DxUAqW8+Oqd/MUyD/1M
	 QlCxhAgh7K8aSNa2aOEXXEal1Iz+uL8xMf35wJw/Gu8ZAK4kPcLnPGn+LM/vkGzKo4
	 6g5eoGQ+Le5XEPpwN7hwxhlRmytHVbob+JODXMx2o6q0vIWrNDjLdYlkmXhyvuYcyy
	 daotZIRlt84kanntL1g1+Qnx1oE18aapBjhnjdrmlkQSWsLLsY64KLFdCEIi1SbqyE
	 b/64amG4w/HUA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3CD317E14FE;
	Mon, 05 Oct 2026 02:38:56 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:17 +0300
Subject: [PATCH v12 16/16] drm/bridge: dw-hdmi-qp: Drop unused .setup_hpd()
 phy op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-16-195157ba0b40@collabora.com>
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
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

With the transition to .{enable|disable}_hpd() phy ops complete in both
the bridge and platform drivers, .setup_hpd() has no remaining callers.
Drop it.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 ---
 include/drm/bridge/dw_hdmi_qp.h              | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 54181b052fe2..b268c9376087 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1089,9 +1089,6 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp *hdmi)
 	/* Clear DONE and ERROR interrupts */
 	dw_hdmi_qp_write(hdmi, I2CM_OP_DONE_CLEAR | I2CM_NACK_RCVD_CLEAR,
 			 MAINUNIT_1_INT_CLEAR);
-
-	if (hdmi->phy.ops->setup_hpd)
-		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
 }
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index b4fb1c578a5b..ad33f9cafdeb 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -16,7 +16,6 @@ struct dw_hdmi_qp_phy_ops {
 	int (*init)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*disable)(struct dw_hdmi_qp *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi_qp *hdmi, void *data);
-	void (*setup_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*enable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*disable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 };

-- 
2.55.0

