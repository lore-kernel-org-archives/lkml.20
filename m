Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653514;
	b=ySk/sJE/JU18+/3JVRb70zT6DKHTTl1OY1rf/YzbwWAGCmUpj7aWN1wIrjpTL5y/Xy42
	 3NnpDKj4OLYeK4uaPqtgkg7V3MsitApZaap81HdfQ8ES6f47WEC5RB8GfnrvVtqRzH1tR
	 2nHGdVjYHQintK5wsW2DAbUc7U5P57Kkb50TaEUzMydBuLwS35gpOT8YvODacAxj5EmzY
	 c9Wwg2NYiDrC6tWQAl8Bi7Y0muoPTqr830dINdLmomVwcjkTw/KMm0xuR+uOuymOuZukz
	 ohgTaxdfXZfCf5v+fCLwMvht5/QbVB0mjL4cOsvJL6pvDC0Lfo8JrqZjljT0UO61leA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653514;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=XQtpwBbNQSG09Tws7x6dKc8i9V8heR9xSsqFP4cmwGE=;
	b=lU1GuUH63D7UiY63WxNdESThQaef9rsD2lvszSpQXRtCUuXzd5cvdQFBB3Bswca3a+pS
	 1wx6AgL46IYbVMJE5Lzc2AuKjcn55KGP3bt07zJ4JnHc5Ye+asgTunDoXgDPSxaJY+r20
	 +j8UPs4MXzmBgy910fk6SnLpwnWAAhVC/ifR770y2R3qoC+7Q2D+AZ+MoDaENF8GMLF6T
	 ItaPOG4EjSQbHq/0GYSavY+LTJXZPvnEhXqrvppROYWO9BjDLHlQ726acl55E2cUcLZBm
	 /pzjEAoU8HTXUwyyChvM3JKOWIVBZ1d5OfJ5hWw0jLj5eQz/ybGJ4m98CsMBfkxNZqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=GvivJwsT;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24057606A329
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24057606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=GvivJwsT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792653502;
	bh=XQtpwBbNQSG09Tws7x6dKc8i9V8heR9xSsqFP4cmwGE=;
	h=From:To:Subject:Date:Message-Id;
	b=GvivJwsTB6zm18f1kYELQgYwlWuro2gagY+KuSbp9YOZJnUJ2fanHaPULoi4rgpPD
	 vVCn9DkLlo5eegSAAA6topwt81WN6r8BN0prEYlX7xrxwhGTabvZX3An/ISlNd8S16
	 RCUYSFKDLR72DswnUbsHfS7jU1dU/3xVl+Wa8zgI=
X-QQ-mid: esmtpgz10t1792653498tf61c24c6
X-QQ-Originating-IP: HX1t2sOuxhJHsPQIrTI7coDscVM70zdTd26TmRi7hpU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Oct 2026 15:18:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3961529649271326920
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
Subject: [PATCH 2/3] drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
Date: Thu, 22 Oct 2026 15:17:36 +0800
Message-Id: <20261022071737.508-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261022071737.508-1-kernel@airkyi.com>
References: <20261022071737.508-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NPQ6h5IKr4Gpdw5dKsmPndZndRBoDoxjdXBtX+GfrrZ+eKN9MFgXesOS
	5F1+GgrC15Y6LrWw2yz7+tPT2xat+UNujBJIT/SAf5Y5cEyqhepadjtuO4HMw/q89HSlZv3
	8f4DhNhHgx6XvW4HaH5YfQ/pwAGYWymKyuZOwOCPb8IFvsNOeBlaZLTUR6j/K5xBVVglqqu
	vk5WHKSUPhFU+/OAgEJ+yt07WeSBR/mUG6oE4Y54tYn14zDmFGtb1jbylYmFFvBe8nHd9c6
	J1E/FrRzRm9kK6pXlXCKZeLLUktfyMz+mp8dfmMSqwEtCCJ7/cU8kCUDIqobHhcZ3Rx/2pJ
	J2lrpsGqP4oq+pVJlbdspqi5i1lrNJMqgRdjBzJDnQhQCWcyY7ZJGDhS+M3yz1BFj5vLsB+
	th7TlnSHi/b5OT4Ip5AxJji8i9lQ7Exz2dk6aJSnUjbc3sRCEtNPQ+xzlKBLq6qFaxuD4yN
	fWXoFfmCCloy1eRGazcVdBOMPUcAd7MH/HdAckUSZdUznVUP/cd47K1ateJueRAAoOcf3Tm
	eTyzEtRN/5a+2EyMuPVc/mXlnqrPRVzdpORxN3vaXExOtzO+i48aOuAXZYIa19bxE7ixm0W
	li2DBogT3e/PBk55BBCuq3W+ETyv3CFr5Ccn/gQ7Rdym8aUIsMzH5WWK1IiIfySFnIHROjT
	Jke2p6aIFX4J4RMILPf4H/uqOm/e4Y//YtGSqTA92/NWrIqGo0ykO/kLR+sia5AlRqAQt76
	x9waGiLz+yDAiU4kHDZF5tqG3OgBCs07ZE7E36XAEvH/r4UY5f/y0E0ZxdUJFjggrS7Zb3t
	WBYoRNa1xMQsn2DkAxN9pa8sSmLYpmOUqN40iR9nrlOJqSJwXMtrfm2VOI1Ckd2IGcZF8FL
	2+i20VDYKGe+91PT/5+D8H6ydtVVsIUEzYn7cwWuDkFfg/jry1NTjYn/0lNAewJtn/vwE7E
	tilYIrAyQVj1jK3b259wqYHkNxFQXxcBHuYnGN7edpdJM86Osn1Wq/HPtt9FfWHFJVdL6Jb
	kysUxSjQlPistHwVZB
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 480aa8c8a8d2..42ef1b996656 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1305,7 +1305,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	rk_obj = to_rockchip_obj(fb->obj[0]);
 
 	yrgb_mst = rk_obj->dma_addr + offset + fb->offsets[0];
-	if (fb->format->is_yuv) {
+	if (fb->format->is_yuv && fb->format->num_planes > 1) {
 		int hsub = fb->format->hsub;
 		int vsub = fb->format->vsub;
 
@@ -1461,7 +1461,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	uv_swap = vop2_win_uv_swap(fb->format->format);
 	vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
 
-	if (fb->format->is_yuv) {
+	if (fb->format->is_yuv && fb->format->num_planes > 1) {
 		vop2_win_write(win, VOP2_WIN_UV_VIR, DIV_ROUND_UP(fb->pitches[1], 4));
 		vop2_win_write(win, VOP2_WIN_UV_MST, uv_mst);
 	}
-- 
2.53.0

