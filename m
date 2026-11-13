Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587962;
	b=eP8l/AuUSPgYeZuyXN12MToHKP44QVYi3gCFecPNtoZsUg7Y1rWHrXbwbaT41jPsiN41
	 GP4v7MdG6Tq2fHBMh4uQLG3Vpn5W38sl3fjWDBPUpJtbCIeG7NQNZs/8Bk0Nd82wUVc2d
	 hD0t586eE/p4YZYPBTjWmYMD8CizqVL18eHRRoXRNSuAIe7ZCBx8vmLTA/jkTqtuYDAQf
	 GvGgFTNCL282dU1s6uikYr3PqJNe/9vEcuL7Ntfewd36Dot2Bvf7aaKsT7zN52rrU1Nn8
	 df6ywfG3fZ1DKim7WmkbtTijMTRtJHd/vzFFLw8llRbZVbJ4fRhvghJdJxZldFFmJgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587962;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VRoae0uJKg41x4H1sHQuO0swuZqkwOjr8m8nkdoCDdk=;
	b=Fj5y4EQHJJMkQozkN47cK7lpP+QDzoBNbjsiS2ZRF6vOmvqZWkz2iauRJ0w/1re5ukIA
	 SI39nOgazt9y42uT8s/tAeoSoFGDRzYFc2lRC8qEjCLKEpz5rDIG1GGZ6IUPV2T105wC+
	 yss7bb5BJ/+lILnPP5wDzfKEvgpNOljslvSieUOUCX7Y6FSUzruEh7zBGmyJGXs6fu6VE
	 fDdIDbL9DCmqRNK9LanXRqP4/ZVfeIe5Q6odX7lWwW+8gk5QVmFQC/bA1qhWT0c8rY/as
	 0pCSgWv73OqYoQ/tOA5NYO1v68S5IrsGZlwL2ddaPYUo7nftiThg0vwuADVzGWYKHCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oolv3h7g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D4606AFE3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oolv3h7g
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587961;
	b=UHwFHmtOd5zLefTRJb8a/qsFvlPMT38ef58+KomC4oa49I0ghrQ0Lm5jEsK1dFNaWUfq
	 qiYQR5KPVujz8of3t7VVqXvBaTpLJbZfmmH098rYuVpS34wEfd+WPTgHvvYatEEO5uwGV
	 uvzx7Y0SlZtxKkYylZ6W/kFkwQVLUhCLwnc2b854Is9NxjPpUDbFo2NXDnhm26ajZ9B1r
	 Tb2vc4MDmEE2vS4KXimbEpZN6IpH+j1Do1wBAAd9sNl8fY5OHrTL2aQvVsrOnhb0l/XgI
	 LNFbzooxi55l4PCTKAruV02MoXQup0prX9DXeLuViMAFPBOs9epq4lvKopMoI5JceZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587961;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VRoae0uJKg41x4H1sHQuO0swuZqkwOjr8m8nkdoCDdk=;
	b=PU9LJfhg7JL4v7yqrQfVL4n9evdrLaRdOzxDevOcB3a6GvhGUvW8q6tCDZXtjbAO192I
	 KinUqzGwvevrJ48nmpVNQpKFx7zSemUC8FYd1oavu0LvoHjehynHiyLB7PQBXWOxq+EL9
	 08HS3JV60+/xmlwhAO8l3nhlwJ7STAhmyVBDk9wieODyZOmidbW3BKEUkdj9P/cA9y6Kh
	 jfikb8ib869ZEQxc+froaX68E/7ShHvDa5x6UeO9elNKH0Kv9qLZcLFdNhQTirQKhM2Dg
	 ZyBe1/VldzTacKb29ilxh0Jp1ebzbcydpRCSMhXaEkryURxAz74XXKc/Ze+gtfrY6OQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 760CA1F000C7;
	Fri, 13 Nov 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587961;
	bh=VRoae0uJKg41x4H1sHQuO0swuZqkwOjr8m8nkdoCDdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Oolv3h7gcMuRIK/vG2UrAJ3EQ5Ivr/Gx90tSJmUWJxQVpGs5xdzV7OiIOH0t7rATn
	 Whk20mbEVbhq4eSmSViv0XDckjEGSsRdSHZd8MMoZ5HITIl0O7IU9lE1I1SILHiCFI
	 uCD32NzhKn7uuF55dd+fk9o986AILoX+VJInHc7KKv5IOOVFVd0y/bSM3dK5pi5tWh
	 lsMPEa1dPiKZigV7uSn0kp/mIx9vb8IHSgg41M34JNXZJyPVWWSH5v4vQbWC06+SNo
	 AUXf0HnZizy16DeIxjLN/h8ybl1QFQ637IFj/od/crflSS0npp34m2sexB9HlS5dJY
	 pJKswW7Bhoftg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2AA9A499CD;
	Fri, 13 Nov 2026 16:39:19 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:39:25 +0000
Subject: [PATCH v3 8/8] drm/rockchip: vop2: Fix the AFBC offsets of a
 source that starts inside a superblock
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
Message-Id: <20261113-vop2-fixes-v3-8-08ae37e83b5c@gmail.com>
References: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
In-Reply-To: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Damon Ding <damon.ding@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587957; l=2614;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=OP4jKFakkLyQ4QcI6idmiNeI2E8izD1vnV+qArtL82k=;
 b=c7CMcHGVoAgMCU6gBh2rcDJRL6AsU5CYld1bsphqTY42r8d+LqBbiEn+80XBNC8prbB3OW/kO
 fzTR8Rlok8ICOlSnxoCzPtL0qgkepW9BP5E6uaJg35x+0uRreo5Xa50
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

For an AFBC source that starts inside a superblock, AFBC_TILE_NUM misses
the first, partial superblock column, and the transform offset is the
whole x position (truncated to 8 bits) instead of the offset inside the
superblock.

Count the columns from the first one the source touches and take the x
offset modulo the superblock width, as the vendor kernel does.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 0c300279399a..fc36edfe79d8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -431,7 +431,7 @@ static bool vop2_half_block_enable(struct drm_plane_state *pstate)
 }
 
 static u32 vop2_afbc_transform_offset(struct drm_plane_state *pstate,
-				      bool afbc_half_block_en)
+				      bool afbc_half_block_en, u32 block_w)
 {
 	struct drm_rect *src = &pstate->src;
 	struct drm_framebuffer *fb = pstate->fb;
@@ -479,7 +479,7 @@ static u32 vop2_afbc_transform_offset(struct drm_plane_state *pstate,
 		ty = act_yoffset;
 		break;
 	case DRM_MODE_REFLECT_Y:
-		tx = act_xoffset;
+		tx = act_xoffset % block_w;
 		ty = bottom_crop_line_num - act_yoffset;
 		break;
 	case DRM_MODE_ROTATE_90:
@@ -491,7 +491,7 @@ static u32 vop2_afbc_transform_offset(struct drm_plane_state *pstate,
 		ty = vir_width - width - act_xoffset;
 		break;
 	case 0:
-		tx = act_xoffset;
+		tx = act_xoffset % block_w;
 		ty = act_yoffset;
 		break;
 	}
@@ -1433,7 +1433,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		if (fb->modifier & AFBC_FORMAT_MOD_YTR)
 			afbc_format |= (1 << 4);
 
-		afbc_tile_num = ALIGN(src_w, block_w) / block_w;
+		afbc_tile_num = ALIGN(src_w + (src->x1 >> 16) % block_w, block_w) / block_w;
 
 		/*
 		 * AFBC pic_vir_width is count by pixel, this is different
@@ -1484,7 +1484,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 			vop2_win_write(win, VOP2_WIN_AFBC_PLD_OFFSET, yrgb_mst);
 		}
 
-		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en);
+		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en, block_w);
 		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_SIZE, act_info);
 		vop2_win_write(win, VOP2_WIN_TRANSFORM_OFFSET, transform_offset);

-- 
2.55.0


