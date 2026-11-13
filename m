Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587962;
	b=Fv/C90TLA0JhpGnFkI6LQObQoHnUayvLa1bonWdnjEYHVcJYwj3nkWIrQ28gWKWC3gv9
	 68I6UC9dYSaR0eVgb9GborNPnmQ0CB2MIVuAx6DXt+MxBTjLHjCMndse4t/K4mXv2vOfB
	 BTIn63adBiyvdhkWmpuAUk9Heo9BiZxhyr9jfdAEs+i6eRN6qPUA8Y9h3y+32NFhvuIVf
	 vopnx4K56Bm/PaZRb94YYHDv6XvWJsXLcOxjo1f7I4r96KYAPENSAVlSffUyvfRK4Grub
	 Xx/oLWycYpP134WY10vHQw0AjFR33Pf6eDf03PzKWQgh/IryQ305g3/HA34Rs2kwzdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587962;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vrUiKRg4BvpWB5jyg+qr4DPnBX95IfoxUcaWHJw9PDs=;
	b=kzSLGb7xV8yTNHkfqGXvlafI+L9M4yq8iw0Gko0WEgsANNgr7RrMQzNWfHr2aXn2moWX
	 5mdJaYRpCsdOxILOQWCmR65VqFwhTNd99nbJTkHI6176VUtkDoXm0rSiI9J0tURUDgD5I
	 Cm1TqFe5EEaZUIIcN8xPNgqnbFm9lhrtsiH/Yv4Imby256Mng1WKNjYfATXK6ALjKvZP5
	 n0J2rdHHBB/r6AZzBVok0R5Q4m6MspaeZgJrTY89jr9rbgkx1zasK+vkWVKC1jnh5hU/8
	 yyOPIzPAWHiK0/eJZBuFGEsK44OR/iTqTmfZT7w2lVFYdUiGHWatFpLaxY1fyq+M11Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YwY91uuc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6C606AFE8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YwY91uuc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587962;
	b=PV0RK+UjZ1uQZwI89VMIsfkrI724D8wVLnPMTuHOVopveK/iCUbcoJwHPSacPi0Ri+PP
	 FEiEUG/4ostRMyJNUkH7lGssad/vktb8tAY49IQ4SNE0ZbValrFTVQo3jAeDLuM4K80Bf
	 v1v3Avj+DN6oP3ZkbtI6r+AQRcGqbvmgBkkke+aLDzX/BsfgfzjwwNIXe8sXoFjedbJzT
	 snIAyuzejE3WmgbCTRDOs/lyUhEtmuKN45hr74yd1j8nF3qZCo6zRJBN4wLwGGFzRf7JT
	 BfztnIZ8L+Rk3FGVzXY/Ade6VFS5ntmqK+m58TcIyAVZzlinUqO7oEWGJY2wks+2dng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587962;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vrUiKRg4BvpWB5jyg+qr4DPnBX95IfoxUcaWHJw9PDs=;
	b=0WxH4nrMFJ2hVIO1lAT8vvn67ulv7Shn6SBHRv0PzGJ2KjWLKq/STN1PzhgejP2Wpkcp
	 eSrxS7df2jj9/95uW2M8ZNOud+TbiRmQXbC+5Kv/NNw2p6LiawImBLhSAiVf4znaMl9uD
	 6eKYKesG/Z8bzutTi/Jb4LpB3dvOi9lYSUoruNGppvlhrsbsPh9XZIUaavD1TR4gaBGqY
	 cULwSpLajcYQvjDFhVfLToio4kVY3WfSGN3P8YzfgeYhv3gh4cv3ZoeXHQj1FUSz4VZeM
	 z4PK0+VkyU27O2t/chTq6ikNHlLGeckTbRBHvG/+txnVaVOsPzLwqf/1kSyiShVPhVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 044611F000C9;
	Fri, 13 Nov 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587962;
	bh=vrUiKRg4BvpWB5jyg+qr4DPnBX95IfoxUcaWHJw9PDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YwY91uuc02HtPdYLj/fq0aqgsCkddrJPKLmk5ZAoXR6jIssIgWditnzHVeMIieZ6D
	 KxvMmCIo2eratr9Z91WdgDgAGHnqfA1ePPqhnr96KArbrRvTb24iRdacAy4R7Yna6J
	 VJTeFFGMAVt2dbrK3McfauMcqC/ZZK4lz2Xan7JLdYcNjJ29zPUmC55jiHD/D7eEUx
	 Xui1Dzaf8DZBtC9EqDvX3Gc3KLCIGRHZ65d6WSmWQfPAeZ/Ia7hfceD8vXTcs1aBeW
	 cMskR2bI6/zjDMfWWvy8iyGNst190HNu7QzRY1+UWBscdjapq8MTm6CDCqxu99qiAp
	 kgUIpsViQqJkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB546499C1;
	Fri, 13 Nov 2026 16:39:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:39:22 +0000
Subject: [PATCH v3 5/8] drm/rockchip: vop2: Only accept AFBC YTR for 8 bit
 RGB on RK3588
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
Message-Id: <20261113-vop2-fixes-v3-5-08ae37e83b5c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587957; l=1386;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hx/HDUh+OCmrvWMNMgvNBg8ErM3GEomonan6L+h5ND0=;
 b=3hhlWWJBEKUEQKpkKu1iHKAHK83iKtuEMoOwLdV5OQYYb7Ezz5tv4TeETl7C1szOsy3qTG2Ml
 8sswI7OPypcAd42oZWA0wCmxjULEDoh84p2Ke+llBvQVgWc6y2nF4fG
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

According to the TRM, the AFBC decoder of the RK3588 Cluster windows
supports the lossless colour transform (YTR) only for the 8 bit RGB
formats. An RGB565 buffer with YTR gives a black picture and
POST_BUF_EMPTY, while the same buffer without YTR displays fine.

Don't accept YTR for any other format on RK3588.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e8ef83d6924b..de3da292b05a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -404,6 +404,11 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 	if (vop2_convert_afbc_format(format) == VOP2_AFBC_FMT_INVALID)
 		return false;
 
+	if (vop2->version == VOP_VERSION_RK3588 && (modifier & AFBC_FORMAT_MOD_YTR) &&
+	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_ARGB8888 &&
+	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_RGB888)
+		return false;
+
 	/* Different windows have different format/modifier support */
 	for (i = 0; i < plane->modifier_count; i++) {
 		if (plane->modifiers[i] == modifier)

-- 
2.55.0


