Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840475;
	b=drqk4dMNk6YRALl75L8ziKu9etESuEuhs48bBKtpeW/rGK+tTHJwdgvzQL2kxI0hv/3U
	 NstSi/RJ4YavHVSD0bLPepbNTcX7ra8B6LN8syY7rrEwtO9TkTpVU61dNO4F5pKLgH2GG
	 Pad5lNw/IX5S2L47J6GEBBh5KAXUrnmVw/7z5DRHNJGHG7dfZY2GjS4v0EUa/uHuIsFNf
	 dZ/ToTS/HkIGOKr6t6P6idb0IkdJGKvY4XCn5PZLQ9xWEguAtZB0tRmKNn4WUIfDLD49i
	 XhgCupuQ/GrwkLz40zPYclvKc5dozgGvCCsq2KvB9cXo72VIzGDTs0vqPy9L51lPQaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840475;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=p+Zgk07gNIjShvh7sz985dtFB/kPI5vroXB9emzMRms=;
	b=SG44cm02OTyBAuDQkgjWiWX8FTYZQ11fI6we8vH3BQEDMIITGKcqYQ9/eYlLjASJwEfs
	 +lPj3ZIV0WzvIuxLveN3oKXHhHHdlH7bHORI0OZ9tLZ3L8Cvc2xSBf0tp3irKxiYDRZXN
	 X/7Rv1X99/DCZ5pv062Bf1E0pOcMFUZOw5oeFy8TF81vWpryiYRmAK19N1G4eh5feaLdQ
	 Jlr5XeFnR92hZW+ZuC7psZiPuKz/PPnpFFJd0z0rl8de6WCoKMQh4vVZR0Wp+pMYCnFGv
	 RO15ljL4iqxVys1niLMGP0NDUKk92M3uoJY1IYIj0D0OsOL9C7GuxDmbXWvhti5s4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ms4BtTYS;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22304606EE9E;
	Thu,  5 Nov 2026 01:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22304606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ms4BtTYS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840473;
	bh=vuS3FEAJj1P3xuszyaL29cGUlOJnhPtoW5/yXO1sV3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ms4BtTYSMLPvuiY3i37yMpFnOH9p55vAwpxQi4ct3/CI780qUurtW9/lbfEPoBiz5
	 cmo7dy+/BcVyCfHVjWMgBYxwAXPSGPFI42RFHafzUcV1tVN2G5CJAdLtIojR6yKWfp
	 w7xr91sTfYz84F/Uy3k8r9c24a9dNhqOpLVkNjgQooHSJrpxJKt882gTZEb9sgY2D5
	 B9ri0smz2XoSs3IZVFSbxKK52MF/VUaW43FKTnlE6EgWM2Yc8qLOg7cS8NBhqIEvcR
	 N1SwmgXp+dbpCgaYhng9zvajJNg8kCXT0mZVGjFqk2uYMUQUTIoH4hzM1NDMFz1RCV
	 a1JhCspPmPlDA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AB4A17E0D7E;
	Thu, 05 Nov 2026 02:01:13 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:44 +0200
Subject: [PATCH v6 10/15] drm/rockchip: vop2: Switch to enum vop_csc_format
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
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-10-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

Improve code readability in vop2_setup_csc_mode() by using enum
vop_csc_format for the csc_mode variable, as well as for the return type
of the vop2_convert_csc_mode() helper, which already returns CSC_*
enumerators.

While at it, replace the nonsensical 'csc_mode = false' assignment in
the no-conversion branch with the equivalent CSC_BT601L, which carries
the same value (0) but is type-correct.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 7c35d73c82cb..76d151b8bc52 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -647,7 +647,7 @@ static void vop2_setup_scale(struct vop2 *vop2, const struct vop2_win *win,
 	}
 }
 
-static int vop2_convert_csc_mode(int csc_mode)
+static enum vop_csc_format vop2_convert_csc_mode(int csc_mode)
 {
 	switch (csc_mode) {
 	case V4L2_COLORSPACE_SMPTE170M:
@@ -710,7 +710,7 @@ static void vop2_setup_csc_mode(struct vop2_video_port *vp,
 	int input_csc = V4L2_COLORSPACE_DEFAULT;
 	int output_csc = vcstate->color_space;
 	bool r2y_en, y2r_en;
-	int csc_mode;
+	enum vop_csc_format csc_mode;
 
 	if (is_input_yuv && !is_output_yuv) {
 		y2r_en = true;
@@ -723,7 +723,7 @@ static void vop2_setup_csc_mode(struct vop2_video_port *vp,
 	} else {
 		y2r_en = false;
 		r2y_en = false;
-		csc_mode = false;
+		csc_mode = CSC_BT601L;
 	}
 
 	vop2_win_write(win, VOP2_WIN_Y2R_EN, y2r_en);

-- 
2.55.0

