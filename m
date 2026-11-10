Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295132;
	b=nhVqfWTW5grshBzcitAKpHQHJCJyhvNDUpARMAyzVWJW9LIc8h8MUMfu/cBLg8Skf1qP
	 fHq8TVYaTEG1I52xRZsCxbWhiWr7qgDr/orLr27GfdD6JWsiZIr+7Y/BVivPYcVKCN+h+
	 hEozSBIylpCgq5zqZFTexKcbFF4Goir9YXrhz4gxO9h0Jz8z9ODYjjmHkKAG55s1fUESD
	 wn1sPzxrFMuy+ilKWogscXy16+gcTT1S0lgAn76q/2AkSWsB8dZJxvbK5h8/ntQYnoDeC
	 XpK592Hfq8+YttuSR+OHlsGIA2ODVB8rVB2kMpyybp2b0u6JMIu6aRyYL+UHronFl4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295132;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dXRtwq3eD/NFK8IgPBhgp/7A0pFkznKtBS+ZOXdYqTg=;
	b=ypEsNEust0kCVrdrIgrwVCEpmXFDdFC8TPVZY0fJ+DTfJ0avyxMvS+xOncQNym/apqQT
	 40tbWvzad3g9Nl0G65Yu0eoODXQ/q/9+E6iFyTQo7Aq4PdrRg0Q/O0zi+zixJo0z1HXSc
	 qm0DGFA3RaIKET4/yAY+qYEbxZuDUZrhsdUsBXrttpkgizZwx+qq/35o18LlGACR5A8we
	 dQaOLzb8Is2JdzaImJ1nc6eAjcBgYjef07aT/4PVEsPA7lpJ8MHEfY2dGHR8IsMClEEKP
	 zIGSHvZEnvJ2nfO8rECrDGAfB5CtmDAAPCfCwPs10RiGl9MvRTCp70NK42FEaw1WZug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PtTe5Ofw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5460A5BDE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PtTe5Ofw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295132;
	b=WwBJE39yOIbwof5m/EK7fxafobMf0rmc43vyPRhUWpVAVYAdPUnwrsHgE1pbDo70+4op
	 mOWgupaFGaZqR7BNNvFkBBCXHgcVoOeyXPYqc3yDPyZioShUxVcEFRbP0aAh9tUWy43wo
	 geSSLd8xADb1/1qg4pm6qe/Kaw1Avj1octQ3nfjr6EJQRjYvCNHrepbV0y5CXlmmJgTXj
	 qaFuZ2/ebs03gVt0+bxNDEXIxJ7CuCbCvym8/+/HMswckPoErX80zIBlGQsF972mb5wF1
	 nH4elqIe3/GvOiEucQBHUmqiza12QLHzb9ZCKC6lF7QDuZUk0GYIgEN5PqdJ3WrAxfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295132;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dXRtwq3eD/NFK8IgPBhgp/7A0pFkznKtBS+ZOXdYqTg=;
	b=VRKPCv6PikhzStZZf/YpK6sognT8RfFlmyUpmJHiEcseSAYv9AQFt/jaJFuutJZq+StK
	 g8Gl1zv8qb20uHfazwIJ0xpxbaQ2H/iibTkPPF5GUjtleuMXaENgP1gLy9qC49rOncwcc
	 Ji+X9mUBz2kQUrbrHYgFrn/9hCwMHorMYFYussRireB6dwVXoiDkq1djOQjv18k1h0CGy
	 c1hSNYINlLuHmx2ohBdt/Ooc380Fm6JeuCYB9+zUd3Q+ts3+BhNb4oe1kqwQpdjKJ4c0B
	 0jBBygBbyNYIvWuCPGxX5y2WE1LiP/YDxYDNv6CeHAduS5ztBSaV4mgAsH2HYxlL7kQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C9661F008BF;
	Tue, 10 Nov 2026 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295132;
	bh=dXRtwq3eD/NFK8IgPBhgp/7A0pFkznKtBS+ZOXdYqTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PtTe5OfwJoXiCaUY1JsRgUwo9oS8T7WBVd2J9sb110Kpiw314tVAthNwmklfFirMV
	 PY0UBXQ8wgyDM337Ryp48vog9V+QXOJARuFdOPdJ4V7MwV9edxLktlzOv2HAHYCLDV
	 3tnL7n124V9kUvAPbpwIjx4LJArPkeyNJpHLfOVT+xmFTCAAsecDqMs5DOGaXAiiCb
	 irUux6nD7HtUcqT2uaSm1DgWoikl31C1VJo6c2LNhnCqoku7UArHOZRJRrRrUGHVso
	 f4ZxJCsBZ8ETxidvmEwbQrnlBfogzk4iEfBHRTgJ2Ya29XrlePI+ZazyoDtxdOyLUO
	 SzRNKwI3M58Sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1BCAB489C9;
	Tue, 10 Nov 2026 07:18:50 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:54 +0000
Subject: [PATCH 6/8] drm/rockchip: vop2: Find the first mixer of a video
 port with Esmart3 too
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
Message-Id: <20261110-vop2-fixes-v1-6-d336e9dd90d3@gmail.com>
References: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
In-Reply-To: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295129; l=1329;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=SPA5csf/bAh0B83cKoZHeqtof5v0uoSMoUIlfdJ5VbM=;
 b=i+wS43YteQlCqC153QQbNpaUW9KYpgHXaMG3J+LGfX0EkNm9iK+dlaut6m4/8oQ3xynCZDNX1
 5gr1Z+2z7P6Cqe7qW/WBCv9w8qWQfP23ve9Xq9XwUN+ZBKtHQ4+U8qk
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

vop2_find_start_mixer_id_for_vp() looks for the first layer that holds a
window of the video port, but for_each_set_bit() takes the number of bits
to search, and ROCKCHIP_VOP2_ESMART3 is the highest window id, so Esmart3
is never found. A video port whose bottom layer shows Esmart3 then starts
its alpha setup at the mixer of a higher layer, or, if Esmart3 is its
only window, past all layers, and programs mixers of other video ports.

Search all window ids.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 83203d18865b..2843bfb36341 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1889,7 +1889,7 @@ static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
 
 	for (i = 0; i < 31; i += 4) {
 		match = false;
-		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
+		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3 + 1) {
 			win = vop2_find_win_by_phys_id(vop2, phys_id);
 			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
 				match = true;

-- 
2.55.0


