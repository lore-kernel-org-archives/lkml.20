Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA754560ADB;
	Tue, 13 Oct 2026 22:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931930; cv=none; b=H4XX/T1IeBg8Ct06zKQ/mBfD4xZkR30jb8gKGGHPvgsh1dxcvoDGJPkJwBWd3uGnXve8Jm0Y/39tEvAt1FaxvVtMYILbOltVlPNyB+BnnI4piCbEQi/oEWt8xBf8M02i/qZ9kS3t+tUwN6sJmABdsdv9a1WFrFpgmNa4Nqan8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931930; c=relaxed/simple;
	bh=e11OdPT81oEiswOclnJuj1hBcz1HaIKK+zMCIpkyO/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwCyLY3i2pw0Tf/Q8g6ebaf8y3KULJh6VL1cxCOGEq9ksHtCxNJuj417WFCRG/+vNx4AiMAmV1MaBSCCskXneHgNtQ6cp+t+w6XleX60fMWAfxsCRAjAzrd4sERZizoedAFOMEcCrTr5BV+zmw5/fh5n+meMf4+nNDN1IsCcysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qLo+f+sq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qLo+f+sq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931913;
	bh=e11OdPT81oEiswOclnJuj1hBcz1HaIKK+zMCIpkyO/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qLo+f+sqMFr3+owkbxcwExKNYhCTGpLuJ1rTW59IMzfFWzbOspiG9vVU57RNFaCTG
	 Iz0cCgCX2oqAhz1wTw7IXVwUp7TuPaS3W7uGEt92QRdzalPn3TPDZZe/Bjx3h3JQrs
	 vfEu2VbkKmI22iF+2mKpDPHwxyny3e7lVmtxT1rN54ENr9AJuLlC/qyIx1uzoZQy97
	 BH5h7YKpjw/eTDvFJfbiUudzCOHtgIN/IE+V6mOqvTssrmMSLP3yZ8/v8l5yp/HC9D
	 IzzRcW5sAPTXPG29xsuyFAFiZU4utI8FPRC33DTlhqLZ6ORHx0aZxor/cjFQRH3f1u
	 Phz138BMUkypQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8343F17E0CA6;
	Wed, 14 Oct 2026 00:51:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:21 +0300
Subject: [PATCH v5 04/15] drm/rockchip: vop2: Send pending event when
 atomic_enable() fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-4-6fab0fe43a9b@collabora.com>
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
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

vop2_crtc_atomic_flush() stashes the CRTC completion event in vp->event
and relies on the frame start interrupt (VP_INT_FS_FIELD) to deliver it
later via drm_crtc_send_vblank_event().  Since atomic_enable() runs
before atomic_flush(), bailing on an error path makes it skip
drm_crtc_vblank_on() and leave the video port disabled.  atomic_flush()
still traps the event in vp->event, but since the port never scans out,
the frame start interrupt does not fire and the event is not delivered.
Userspace waiting for the flip completion then blocks indefinitely.

Note the event cannot be flushed from atomic_disable(), as userspace
waits for the completion before committing the next state, so the
disable does not arrive and draining it there would deadlock.

Use the newly added vp->enabled flag to detect this in atomic_flush()
and send the event immediately when the port did not come up, rather
than deferring it to an interrupt that will never occur.  This also
avoids the spurious drm_crtc_vblank_get() WARN previously hit on the
failed enable path, where the vblank is not on.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260706194935.AC7601F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 36384f029ef7..3bbbe365b5f1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2083,8 +2083,19 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 	spin_lock_irq(&crtc->dev->event_lock);
 
 	if (crtc->state->event) {
-		WARN_ON(drm_crtc_vblank_get(crtc));
-		vp->event = crtc->state->event;
+		/*
+		 * A failed atomic_enable() leaves the video port disabled with
+		 * no scanout, so the frame start interrupt that normally
+		 * delivers vp->event never fires. Send the event right away in
+		 * that case to avoid stalling the flip completion.
+		 */
+		if (vp->enabled) {
+			WARN_ON(drm_crtc_vblank_get(crtc));
+			vp->event = crtc->state->event;
+		} else {
+			drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		}
+
 		crtc->state->event = NULL;
 	}
 

-- 
2.55.0

