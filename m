Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D43CEBBB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988868; cv=none; b=pl+AghlCFS4uqFCOLBT5shlGULfDmk47zDnomhzZzvxUn0d88kYzOjob1asqYQBoCYNED9LvQPqmv8K/1HjnYBHUiV7WzaXEFUl6Rw67huPxApi4M+7LSCkaVRVTNaR56bRbHcFH0M/2U+aCg1rYEOHcR9/nwk3W0BZ01lWfmS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988868; c=relaxed/simple;
	bh=LPHP2ud1c3YW5aWPJeus/gJIDU9RP1d3zaNoCvKdyaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BY0lItEX/tMN+tCowzzlU7BI30kjwDRb1LJHTYs2YM5fa+cEXUxNqhJbTKPizQ63ySJFR6Wk3PLvHrUO1gykqvfHH7Xl+qJqO4LItpHN5oLNDnJVRPRaIRLmvN0CzlG+FK6zFOqZXXRlQ5CiZLPqhc9YT5+SOWEdJMpeyXy7XaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebumszht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebumszht"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65267C2BCF4;
	Wed,  9 Sep 2026 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788988868;
	bh=LPHP2ud1c3YW5aWPJeus/gJIDU9RP1d3zaNoCvKdyaA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ebumszhtFwh5OBFp8+i7VvVOC2IonvQkurLEcJPnlH7KO4aQNw2Qt2tPZPt3kNJ9w
	 FgLJ3ng02ClqaWEEk11ih7463lPbsIXzmR6Ti+wNp4kE5cirR64zfl2k1mEh/ex0KN
	 rex7V8Ss1KjyZgJ2XWjRrKwAYowCjKhwATaj8Bgn6YYJ2MuxRBzuhQ41X8SqZjm3Vk
	 KUyR186EvqDY+Rf6lEV1wVH5ewUaWCx+zUB0rRKUujS8MtRAjc5aP3m7cSYAsDfKyO
	 cZ0Le/qGRj3o9XYpy3NP6r/R8ObCNagFvz2upZsmhXnXPmJQea0M5K3sVfNIfC+E4L
	 1hhEM2Wv1KlUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E104C79FBB;
	Wed,  9 Sep 2026 21:21:08 +0000 (UTC)
From: Johan Jonker via B4 Relay <devnull+jbx6244.gmail.com@kernel.org>
Date: Wed, 09 Sep 2026 23:20:54 +0200
Subject: [PATCH v2] drm: rockchip: add drm_plane_create_blend_mode_property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-blend-v2-1-37e27af4faee@gmail.com>
X-B4-Tracking: v=1; b=H4sIALXNoWoC/x2NywqEMAwAf0Vy3kIpixh/RTz0ETWgVZJlEYr/b
 vU4zMAUUBImhb4pIPRn5T1XcJ8G4uLzTIZTZXDWtRYtmrBSTiZ2mFzEqcXuC7UNXskE8TkuT71
 5/ZE84hCa+HwHw3hdNwJAikJwAAAA
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Johan Jonker <jbx6244@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788988866; l=1304;
 i=jbx6244@gmail.com; s=20260824; h=from:subject:message-id;
 bh=Vv2dAdwZrZngpYkZZtAtqUthy17ncXSrnl8lfyqCNow=;
 b=7Y4+ehZW3Pl8LcRBNO/umDaR4t+TQniFaUIL8IMw+k7AXa7gOy7ImS/oeZzJ6Q0zkM5k63iLE
 CSUZaUjRPkDC43hP0rkLVd0w6yVkois1LwGyvp87PxSPBGhVEUwn16D
X-Developer-Key: i=jbx6244@gmail.com; a=ed25519;
 pk=MK5Flx1ndjAF0uwXdNm8VvvoghD4KWCNd2hQE8QGyl0=
X-Endpoint-Received: by B4 Relay for jbx6244@gmail.com/20260824 with
 auth_id=971
X-Original-From: Johan Jonker <jbx6244@gmail.com>
Reply-To: jbx6244@gmail.com

From: Johan Jonker <jbx6244@gmail.com>

A validate_blend_mode_for_alpha_formats() function was added that
fills the kernel log with warnings for Rockchip VOP version 1 SoCs.
Add a drm_plane_create_blend_mode_property() function as fix.
VOP version 1 doesn't support blending with a pixel alpha background
layer, only with a constant alpha. Advertise blending capability with
DRM_MODE_BLEND_PIXEL_NONE.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
Add comment line
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 0090d8ff0c79..0bc5b606f021 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1850,6 +1850,8 @@ static void vop_plane_add_properties(struct drm_plane *plane,
 	if (flags)
 		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
 						   DRM_MODE_ROTATE_0 | flags);
+	drm_plane_create_blend_mode_property(plane,
+					     BIT(DRM_MODE_BLEND_PIXEL_NONE));
 }
 
 static int vop_create_crtc(struct vop *vop)

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260909-blend-c89d2c9f6984

Best regards,
-- 
Johan Jonker <jbx6244@gmail.com>


