Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5F563FAB;
	Tue, 13 Oct 2026 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931938; cv=none; b=LGxauu11QL1Ox4419hdc94cPiVHEKC9rSOOzpLX0jon/W9HFsooYWtlyOwBPvdhMzclpKckCrdJv3ypeWxk9KxFaUcoJzbRXLRjfdaZ/2yiySpiTZS4EKJlibCi/VSstVT7nhCcwxBEvvwjAb17DHJf/DEGAmyQgBy9EPx9ix+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931938; c=relaxed/simple;
	bh=KiRqqrlaf8HazlzQcUHaYydMUHKelMqz701+av4CyKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uR7N5EZlTIvmp/lDjrexfz7msx/FnhlZHLGLLl69tqk58bhuoDOu76qWtROBu25Zg6P4Z+FFBxAmXBoLp1YSY0HS044QfMFUi/eUZj+Deui33Z8vzK+3DEBSVeWnLg1DP7+mvEa4wTABhjZek+4NoTmhhrkGegGXEN/gk9hWUkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fMZN61Cs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fMZN61Cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931917;
	bh=KiRqqrlaf8HazlzQcUHaYydMUHKelMqz701+av4CyKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fMZN61CsPtxfilKjKFZHI1ApDChIuDnDGWKYRnFxrf/2r/O4toGECNBnKzAMoNJt0
	 S/4nxzwjhldCg6CyED18/0YZRIY1h7XqZThvzGrPSNNrM6Iwf9l4AxVT4uQ+9gHUoU
	 ergJqUBoNf7VdtaCp8mm0bG/yE+RdyI5LvNbW5EbCX54uSXJvQLrUDrNyn8tb0nIbe
	 FQZIILAqdaHVnoigxm4qweXdNQYKyPziZOZDrDId2yg1EgprIMyQxoVluWUgE05W0G
	 xwZGIUvJ2ATI+Abrf2Ak/PjA0JXFIKLG8H8kRLiP63WFHVXRzuPljBZQ9wZew0AvDY
	 gtnszGRmGyEIQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A999F17E12B9;
	Wed, 14 Oct 2026 00:51:57 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:27 +0300
Subject: [PATCH v5 10/15] drm/rockchip: vop2: Switch to enum vop_csc_format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-10-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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
index 45f3acbfa634..1b0f72958763 100644
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

