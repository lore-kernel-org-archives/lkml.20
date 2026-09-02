Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704474503F1;
	Wed,  2 Sep 2026 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389669; cv=none; b=NqprLEetj+QbiZsekcQtT7OSXW7tWrbLf7uFTuIb+c6V8ti+VuxEIUVJl1DmHJWM0W7Dk26Df3yuxTcchr/Q7u3zsEe8Is/KsaJaK3mCERNcOXi1v7Kx3emw11t5Kc11LHwaSzUcqZCD5De1vw3cIpCkRQmsB2XOmTgQRb2TNDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389669; c=relaxed/simple;
	bh=NtHdI1r04ll3cmriR0IAxLz63PsZ/Z1TC0z5wDweaC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWezvEUdLC2tKFiHOzi/gbLoUjJfMtKN3hlCHtpFZXSRcDOfBf7v+ewtsMmkHwU1ZMbSe3qJfKqOohfEMPHWFmAJu9pD6ODuqGDDqqIeepmXApLP6shgCcvhZFCCMBKjRB2bksQZdF67H2dWCFZuxI74wMS28vQL488tzFQqb8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UzObHvXB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UzObHvXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788389658;
	bh=NtHdI1r04ll3cmriR0IAxLz63PsZ/Z1TC0z5wDweaC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UzObHvXBTtIO2Xd/uiRXnyUZ5voVG+Gbhjq87SeXRZqe4MfePF/+zN7XgsDUIRbJ/
	 MKA4rccAxlTpcancb3Yko1z4p01gBe/eldyJBYZnYiia+29GQUXz8tGrt/BSSuLmfK
	 uO51D0t/i50Lj5RJ8hhnernnx9GoAUXdlxPywba1iqYae7cmRnuujjxjOSfRsq9oDt
	 XTfJ04vX8hnFxyMp9eX77kbIlrxA7E3lO7nXZlLLGIcOcri4PELs13I0BiQqoCywAh
	 aLwm+PRSeNh3mAZebJr55QoK8z32wZJiKWxM87KR7n9rEWAQRJ9UZa1tq1SfXFKTZk
	 vS6jGDVHwsq1w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B115517E157A;
	Thu, 03 Sep 2026 00:54:18 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 03 Sep 2026 01:54:17 +0300
Subject: [PATCH v4 10/14] drm/rockchip: vop2: Switch to enum vop_csc_format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dw-hdmi-qp-yuv-v4-10-fb45bf4147eb@collabora.com>
References: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
In-Reply-To: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

Improve code readability in vop2_setup_csc_mode() by using enum
vop_csc_format for the csc_mode variable, as well as for the return type
of the vop2_convert_csc_mode() helper, which already returns CSC_*
enumerators.

While at it, replace the nonsensical 'csc_mode = false' assignment in
the no-conversion branch with the equivalent CSC_BT601L, which carries
the same value (0) but is type-correct.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e78cddc184d3..04db4c037421 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -648,7 +648,7 @@ static void vop2_setup_scale(struct vop2 *vop2, const struct vop2_win *win,
 	}
 }
 
-static int vop2_convert_csc_mode(int csc_mode)
+static enum vop_csc_format vop2_convert_csc_mode(int csc_mode)
 {
 	switch (csc_mode) {
 	case V4L2_COLORSPACE_SMPTE170M:
@@ -711,7 +711,7 @@ static void vop2_setup_csc_mode(struct vop2_video_port *vp,
 	int input_csc = V4L2_COLORSPACE_DEFAULT;
 	int output_csc = vcstate->color_space;
 	bool r2y_en, y2r_en;
-	int csc_mode;
+	enum vop_csc_format csc_mode;
 
 	if (is_input_yuv && !is_output_yuv) {
 		y2r_en = true;
@@ -724,7 +724,7 @@ static void vop2_setup_csc_mode(struct vop2_video_port *vp,
 	} else {
 		y2r_en = false;
 		r2y_en = false;
-		csc_mode = false;
+		csc_mode = CSC_BT601L;
 	}
 
 	vop2_win_write(win, VOP2_WIN_Y2R_EN, y2r_en);

-- 
2.55.0

