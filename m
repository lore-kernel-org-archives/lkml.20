Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818798;
	b=uq6aE0TPUninl7HjIpqqUSh/nCqZj/LDAMDIfGzVjquDf6GnPfyWWNfoAXN4u1sQPrcY
	 V3jnY9xvkZK9qiIIJQgc3FQjP7xibZY6dI5cnIvMurQlDu9aWHp4p+7f4QQy6ax5KroQq
	 6buuS+Aq4YLaPb+rvJsIz1RN5D7pjHQOQlZ+08Gcucsho4yu8eb9zrw/vlH8y3B0yBIPS
	 vm4f4VDGCranFwS7l4o1te19GZ/FGw3FkzSXIQ9tFqVg4bh1+CyGPs6HuIp14neXdBQzU
	 MHTa/ZmIqm1lNPjd6vtwwgieNn3dLln+inxEwKtGQ4IDAXiEHHndtNKIFiAgg53CCiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818798;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=xsQByQ0D6Ix2x9EDzpTjaiHgbcand3FUuNn+57t5Hbk=;
	b=SWHBwB3+rxT42S9ZNeGxyu4JZotRhN9FGFcwNFOasaDL1SxXUw/Vr+j9apisn0uHZPj4
	 d5qwNLvWtVWa+MFrEk8o37x+JceNVZ4AyggXesEbQDKK3bgdvTgIbVsPJoFKAizzLMQ7Q
	 mmCeZswWc57GYDFf6Pk+yA3Ws9Mki9tv7AqLXKtcynf00Hu738D/q+GcrmZHTwUkR0oU3
	 23daaUw4Tz0JSEXooQHZ8Y8BpHqMnu3Z6Hu9ERodyQTS6qPAHuiPiVpubny2Q/ymHRyNW
	 azXpxvwY/KR7fOTpaMw9Dz0DYPrW3xbVf8Hwgk4eJSxRy+VKyq7KIh5LbnUBpDegkdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=IpusMoMn;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=IpusMoMn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1794818777;
	bh=xsQByQ0D6Ix2x9EDzpTjaiHgbcand3FUuNn+57t5Hbk=;
	h=From:To:Subject:Date:Message-Id;
	b=IpusMoMn+Np5t7KMauRPiBD/jvwsoVuhnAuA8JVRcYF6ZeUk4x1cXxoD2ImU4SCuV
	 fsFhvX5DbZh4NwjUMJgJGbS8cfk+S67mMtPWlhCLJX2TtBsZ6LlPBQVhYc6YOL1IRz
	 l3FXY15SwovL0Cohof79g6j+Ck3kBIwY5gGvQvRo=
X-QQ-mid: esmtpgz13t1794818773tdd28430e
X-QQ-Originating-IP: TBPlYzybBYcUlZTHNZ5djQ84nZ6wvxk85DaLGnl+X4Q=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 16:46:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14606022908303960892
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
Subject: [PATCH v3 2/3] drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
Date: Mon, 16 Nov 2026 16:45:54 +0800
Message-Id: <20261116084555.1061-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261116084555.1061-1-kernel@airkyi.com>
References: <20261116084555.1061-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N+/GyfuFbcLiaWFZu1r0Sog72euP/Vr6n3CpW0l/qqqis9TAiLAOwRao
	kPWFMv+s6YLJGe/cyic3c1gVZ2kCi2zZjHgmNRKLT6Mam7sns3ydVmgJDmw/0uue8jRw0tn
	y7dcHq6IpLcRmWr/kvzn7+FEEngrX4QfANlkD4WHvbouOSaKXQo7RSY3zgbaCjg/9BBy0p7
	GTYMnGoXiOpsucMDOTXnH5jnvSXvjq6DqttB9VNLS+LOUDVYQAWiY/rMJ7BvnNh2miUYr+t
	RcTyrN6oDSfZrV48EOM6E75vCkUNUZ7fqxIT/jlH8glWhP34qCRsayjdXWKFnPvD+AdkCtt
	0DGjsFEthHbWXSY4AxQl1JumdhmgMUKLd49+T0J5fb/PLO326rglv7GGbqd6ade99rHrnb6
	r+bmSi4k2bfajbnm2rjoQ8hokvMclkP1netcOtuSdzBhe348Zx/7fI6iLXFgqlJtgF0KwQ9
	gXhQD4GU1BvlpdvzZMMyjdR7x6535Agm7EkbxPai5j8XoYAO3pye+hNIs8jOFsFmenr7UcI
	LMAhotjrpumkjG/fnQ+D8bVbfEUEBYQ9yyQjPVguPO/JyNnW3+TCWoEuOH/Hu4u0AER/BPL
	RXEFU4ApemmC9FuPqWjbyltA6lww/L0RAfRafqWyjxVLwO2P6HyFAARh1dV+GPFgHBfyi9H
	Kaw4mJ/dIjSRoxjzTwmiLr4b+fzDkIaEPUTBoWLg72xOUWnhY/ymhvbGWm+twqkdytbXD52
	BptPf43Eb4Ute/4VTFuTJWROluhBGD5CMy50UA80rzI0BqnmSzgVpQQX+VA0aYWUy+Cv2jn
	1RD1qb39A9Ji+Mp1Bh9RLcPHY+7bGNchiIFAIUxirFPiXfRxBJrpHbpFP6HdFNE1y2fkaQp
	tHJCY0KB6g4rhHGqFHCeMSWnAY2bxaLTN9lUWl/u0HB/2rIRTsZotiLFNjdwoRnu8RjYEFl
	StC0wI4t+IEqdOTpRl9lD9TKPUt/dbfljrjQE3ymkSp3L2hqNJvTfMLsbPW/MxNjGQNyBWN
	EzXf7k/x/qDuPsjxBd
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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
index 0de038acb56f..e811709bdc72 100644
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

