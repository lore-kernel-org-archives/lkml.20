Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262086;
	b=sE9Y2jqLe0Evnurmn2odlnE3XFyRydf0p/L6O9WGzaA/YOLmdN1XKyRW/FegRG5g1HCU
	 fF0Rv09uo9bizVw9IRfyX6rXEA/XQqFpkgjt1CPmyV++pp3r5ogRS6Yt5Dkq4xr8w6z+E
	 1nK5YAEIDc1tB3t1b8/IZ9fayCaao0GTCaVd4c9f/zlw8UrU82xTAleQj2aKIeaQpjgia
	 LjTN5shhN+NhziBUuHthz2dPElSchkgsLaLka4B8ntjd96BRvNthQI1j9OeCjfHZJZ9HX
	 Mvws73qHx3Jy2GRpq9eEXdx27zuayTBUF5Cs+dMzB31mPrvwFlu/7yEqE/YG2Jkie6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262086;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=coo6LudP7+MXTGLkixUJjnU6L9CG0CO+uQUYKmWvOsg=;
	b=PqMIwfeQa1Hz+RVWzhEVQFcyK4SVpovMUKW3wczn/tRI5vtSyk0Np0PvGsxeEsgRJkd0
	 sCfYOfB98PooF0zWJxs3hWBd8i0B0cSZvHVqEDHHpPpeMy1IHyesHt9rmR+5D7s7l4o0F
	 X0Fm/I7nNG+nmrajshpkmUkwRKcUjH1fq8m3rVN7cs9i9mXFCYr9cmafz6NhACY85Gxem
	 TsMNUfFBBmnbKA4sRYDve8UiiY1rYhgtS/T+8QJUzFu4bmKjViKFHHsGpIi6V1dMDitus
	 LkPhh2HO6ozn99/E3uhFF10cQdVYVKfTHic2Iw9BpeQf5CkrZAis6sMkIdWIBz8CyTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=RWiCKpdX;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9409606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9409606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=RWiCKpdX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1793262075;
	bh=coo6LudP7+MXTGLkixUJjnU6L9CG0CO+uQUYKmWvOsg=;
	h=From:To:Subject:Date:Message-Id;
	b=RWiCKpdXNAGaOwjCuLMuU9vrf5CcJVPDNNFWxf3UYd8cwvOUasXHouXkNE/C5Ucu0
	 BVxln0sui8WEnhR2BI1o+rkxzgJVLJ8aX1Ky3gT5bGXDCWBwLJSVcaNjH4Ay2s3Kfl
	 WpDtTmQYD5XmTi2xFkgJpyy5bn4aUrWdDN1a3B0g=
X-QQ-mid: esmtpsz17t1793262071t26810925
X-QQ-Originating-IP: MU1nVtS0U94iEE4PP6y+/7HGqBqj4VURMar9zqctctA=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 16:21:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 958842394236650097
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 2/3] drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
Date: Thu, 29 Oct 2026 16:14:28 +0800
Message-Id: <20261029081429.862-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261029081429.862-1-kernel@airkyi.com>
References: <20261029081429.862-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MIYVF5Pddf3w0c6i6Ir5NX0Dk0nBSN+SCIhe6vihL4NwzYHe/H2UE0H+
	IXw4jM1gzxPvg2OxK/hrdA1nK4/ThGYkWqWpjhxdD398NqlK4S7rduTMujFfRNrmtbIek3+
	8CnECu8m8s+BMeotYRMsKxoV1vYYnJ6yitlb/xIp+bZT7weYWLjibAHooNSn+mZb99CA3dJ
	E2xWLq/fZ4YAfGLXvu5mBB1SmyQZSm9S2hU8i5f8f1v52knyFgN3ANSJY6iV7SZBYWTkg/v
	JJTN8YyNgPVWjsmnqMQEu/ZTMdjbjOctEJBGDie87uN07d2rwJJcG7dOCPKQA2YOU4Neb6J
	QyAtUXcdR0Ha434G6mM/wSiGDrtNaPg9Nn4psK+AGrqS5rAgtXgy3ANBESNOPcRbq7AGQO0
	LOBDS39TZf3edRfuciCwN3DsdgLdhRgw0yDPSgXEtZYpq+6Isr786MdsDr/kWiATNwDkC8g
	qe8DtmWWE0zrbBemEoo4H/5jjQsILGzAh5SevfgmLcT6LggU8AD+1fVYbEvaM47eaDCANLg
	osbBwSULfqQawmSp6FZV3vedmJlFZI3CjFEszZQhX6GjjnJ3W6/A9ribefdGHhAHDtLcBYF
	iAvdiHB5t0D3EcrJDcUtRs4FpYL5ADw+dcw7txXeoxIKCctmzRBqSQqkIYYpTqDkSgsTpo2
	clfaOYYTPG07TcXxqSYtPU3Q5J15BUoQ1zSfxgGQvyZvV3YHocLZjGs9ADp4cQQzEdhElWo
	ZcuXuixfEaGtIfa7VXchm88aJCcWIo25wIINkcOgRjuUPqWnka4M6bnvYQk5U0WueFQc06F
	EV0Xp5UCmyzFbSpfaar7kHWkAPYgdeI5IMZ+W/SjScQ7eHvfZvR6Dy+UWhfCYPYHZ9CtMi0
	77ufv6i78Zue3IthZ1+p7YSEDCgEe/XnQ1BLIU85EK6fmft4UAZM3M6ucEA3KNgDYhzs3fj
	Mm/I/Jrgk4/mzdl9BuCOYZk4+jEqL4vhcB2yZyEpHwrUKRpIguRoJ3hQHWjse2+BMTOC3hp
	pUCohkR6DGrPDghF0C
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Packed YUV formats store chroma interleaved with luma in the same plane,
so they have no plane 1 that the UV address registers could point at.

Restrict both the plane 1 offset calculation and the UV register writes
to formats with more than one plane.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
(no changes since v1)
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b38a32d623b5..06291a13320d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1305,7 +1305,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	rk_obj = to_rockchip_obj(fb->obj[0]);
 
 	yrgb_mst = rk_obj->dma_addr + offset + fb->offsets[0];
-	if (fb->format->is_yuv) {
+	if (fb->format->is_yuv && fb->format->num_planes > 1) {
 		int hsub = fb->format->hsub;
 		int vsub = fb->format->vsub;
 
@@ -1460,7 +1460,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	uv_swap = vop2_win_uv_swap(fb->format->format);
 	vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
 
-	if (fb->format->is_yuv) {
+	if (fb->format->is_yuv && fb->format->num_planes > 1) {
 		vop2_win_write(win, VOP2_WIN_UV_VIR, DIV_ROUND_UP(fb->pitches[1], 4));
 		vop2_win_write(win, VOP2_WIN_UV_MST, uv_mst);
 	}
-- 
2.53.0

