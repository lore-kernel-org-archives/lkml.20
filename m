Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587960;
	b=tq7oVNr2Awj/aY8TqOW1wdzxuqUS+9AIq4zL4DZ0GNCZxjFHJYq9o1f0JGiApzQBIh60
	 Q7GokN7X1PBa47p1Dtwd5TX2uJQqZeKV4DGJHxhYKVCWaBqPtRB5T+lxqQvq2EbfneKX3
	 7BQbriIGbVso3XZ2KoINjKfmevA3WCStvFDwlN6tciDQZv92jCJi+N5XDcKCrVSU4Q55q
	 cIts9kIn7UPYEoeLYSjqxOc13STDuvn2mS0hH08V0Hckq6SqV2SXT5DYe7YRLDtNleay7
	 KKyZCVbgd/EoShSLC1q58Dnu7p9PbqkQSrbKwynY/VySclFNwTaefELv6qQoFeFTxsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587960;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Sea7z+n5pZZqi+t3TzaXiTFzXOh2A7iP/dngPcAdtLM=;
	b=p9dOlQnTQtChMDbjdh4K5RdI2dPXiMw06go8KFKonujtPX4rWrzmvtUWEH47JiZ5DB6q
	 c//VR9JzFerMJbC5SzYdCCGXoZ6tzT+FhUhDeVACF5VQSnd5RzLGYRcOdu1/gHHjN9ggN
	 PxG0OGStXBgN2pK+EbRzuwwvbBSNW52dq5cZuTT29dsLYrbs4yBz7dSSBhtTe5WOR2pzc
	 Yu+u0BtLt27B+E9a/uiM0hyqiviax04r30sVitE5TRHAObN/a/JyG4EoArKjoeduH5EjS
	 SBODxLDmHr0TCHyBxtZ0T7RAfGAZFwrdnGdqEwUwnM7xWjNRcfBczTSPXi+LcROgyZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPoa4qQo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29648606A8B6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPoa4qQo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587960;
	b=iYxEXoQe5sTU4ddgFhtOHqQ/7U/MRZRNPIr6jQ+6//XF5FGoRqU8oofpUO5eMwyW/S04
	 shyaDdcHOKSGMeyEa7858TkpOzhy/EVUuZNnNqEdM+AzjgsUdU8zw1gllbf9EpQfZqet2
	 LFqfpywNOqEArOYDxa/LcyhXkwek7OZdzm+Z+HCv4UHBUA3r74MgaYzuxksHHHKVbFGe2
	 fTh/b1AQ1lttgucl3+J4sBYkyHshjYohxtoYpJ/FcelY3/5M3E5nduCkdYvlbqywUVEFq
	 nTIvX5DY9TMlDdnURCSxzWhdYwCMWImy37BeDsXU8YkucIk9TmwCcOWGIW/kNvGtxQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587960;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Sea7z+n5pZZqi+t3TzaXiTFzXOh2A7iP/dngPcAdtLM=;
	b=fJY6NbKIKv1ddX5QVw1HLClKfwqwmijGzzwoJx3rZQIUSEQbcN0yuBJpC401f8h0CGSx
	 hNVBeJxaaqA2JZ0/FfCS6LchV5RcAmsEMqdfuidR/Ka2rpo93NzkV9f6n3Qq6Q82S6u0y
	 ee5UFrPf/iQkFl2meHgZOwZaZ+YblkGRCXGQsNV4BIEm+aSozqK3+C8S+UapkOQBiP1eS
	 0jWUgS0lqAfu2aV1gncTKviy0Fl7VQ+5EFKwGCIM6dlxGKLugRx06WUp+o6y3upVNKk+U
	 xIJsmU6tfZ/Y5JwrtDCkie7OgGiOqlR9O9Y+1JrLVdHhD8lT6izLCxHwCavgqbfMSKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 225F11F000C5;
	Fri, 13 Nov 2026 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587960;
	bh=Sea7z+n5pZZqi+t3TzaXiTFzXOh2A7iP/dngPcAdtLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fPoa4qQo68oepnQp1FHLDbvAaFvUuotApQZj1jwTA3Uzztn5zs5eO4nliAjGfs2Yq
	 lmiTGCUkwIoN7cZ7eex1gVD2Rzp0Z8StLVXSRgeJE4nIDJPid0Xb63M6a3V3u4ogHb
	 JTi7ZXhzzOmBUKEqbNnPA2LMfkSUXvCI6P1uYZoa4H7tzGkZRmQaHxLkHOmOQcU4aw
	 fe5QhpaB9TVOVCxvPmoQ5CzRjKD6K+KHK8UJXb20EEanDtVb/4l/zB+ysZ7Kr30Ju5
	 /xp7sJv1hIEiyVVehgdoNiI49ctFC2RWu3T/Xd6Md5oZl+Vk/zWJar1ao+8tg3uZZF
	 1cj53WJSOFKUA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A760A499B6;
	Fri, 13 Nov 2026 16:39:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:39:20 +0000
Subject: [PATCH v3 3/8] drm/rockchip: vop2: Fix the HDMI sync polarity on
 RK3588
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
Message-Id: <20261113-vop2-fixes-v3-3-08ae37e83b5c@gmail.com>
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
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587957; l=1551;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=y/BLNj95neZ1kNSGI9NFsr8jsXQo+g+IgIthS+l+Duk=;
 b=HFnpn0UfQaUqdoo8fKpEc9f1pAJsgldamAS3CAJLhWJBsQCR4pB44jgJOoJoSQmOT/Cfg6G8M
 gm39pCe6xRaB8NGGqHCoLfwa5TA4YEeJfxwlZL3li41h3sXUfV2JBty
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

rk3588_get_hdmi_pol() is passed the POLFLAG bits of the mode but tests
them as DRM mode flags, so the HDMI sync polarity bits in GRF_VO1_CON0
come out wrong: +HSync/+VSync modes get one of them set and
-HSync/-VSync modes none.

The bits are set for a negative sync. Test the POLFLAG bits instead.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index f340aba5bfd1..3e654cb99ddf 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1683,12 +1683,13 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
 		return 0;
 }
 
-static u32 rk3588_get_hdmi_pol(u32 flags)
+/* The sync polarity bits in GRF_VO1_CON0 are set for a negative sync */
+static u32 rk3588_get_hdmi_pol(u32 polflags)
 {
 	u32 val;
 
-	val = (flags & DRM_MODE_FLAG_NHSYNC) ? BIT(HSYNC_POSITIVE) : 0;
-	val |= (flags & DRM_MODE_FLAG_NVSYNC) ? BIT(VSYNC_POSITIVE) : 0;
+	val = (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(HSYNC_POSITIVE);
+	val |= (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(VSYNC_POSITIVE);
 
 	return val;
 }

-- 
2.55.0


