Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587961;
	b=TeE8LBkxfNZLUm5yJA/vaibe11RevDVbjpbF77UTptGixbJsbxKqicG0nAdcKcQC1Ax8
	 QtoCZHwz6X6t9I+6tKKuJpo79dkavolzqtAftv5eFwzUURWH5BPiFvvMVOUh0sHH4u6No
	 BAgbSg4LfuzKEqzxVshTjIkxPQiVf+ykmaFIDWNLQM/D/JjQzFTsPf2EINmRDwXnoyvOY
	 rDfT4o+pnx9SX3q4vACj0PywmqN2NK07WH6Yj3by9gpY1kfst25H4u0aXYa1QLNikfoJR
	 wj7/tx4PcwH8ITCI0sXEahyFoNTfSxtbU/+Mes5Os6Rg2YQzmFCDKssyS1nHV6p4CHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587961;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RxSPduDOiaRwH24FYN3D1kk/0l8Fy9fc2Bjq8nF2JJA=;
	b=dfCTMtjH3+AKPtu4WL8hgF29Yj0bpLHcDK3U0RxayfOlGoe21DsNJVBTfHWfjaf08Glx
	 s37Q+CbOllzfMXY16ZBnQfPzBeWmXkA509Bcn873VTIUSmd4OCSq+2blhrSipzFFoiMKK
	 vDZf2WmpUtnKIGLR7poxZeysfBg7WiUBJbjRHpu8WU4ZUKUM3PANeqi4sAj2KG8JigH65
	 ZkSUYfpfFU5LrSYNhTt8+t3+WIY8nkGIJKe+5prLhDZOQPrvoEWSflr5JTPXn6um/aLc9
	 k985V5biP1SsjxmGqtX/a9xkojMGq/1i2CYzoYhiNBb/5dbyfiRiT7H4TJmjNHUrw0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OQsol5aN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B968D606AFDB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OQsol5aN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587961;
	b=s86bV+Cac68hQ5HU3g3kkJogOc9ApZxwIKaNr/TfCCOdel8LVUfx9xklEvUk3aS/kv28
	 qS/28upT6juVQsja8Q4HlsYwITN9CEcSbNBiubWrOwxybC6AiGPxeTxyZnmbfLVvFfRip
	 rZgkTJoe2oQUr18H1jHyayyxY7Z4FH/54PMQMz0fXfbt/90+LsL54DzMduv0jqLTl0axs
	 Q7UNCOZ9GBp6xTx/5YK8icm7KIbLBDPzps3bnk4TVn77udqpx0XqMdzcrZCE32x3gESkM
	 6jJvOvhxi2EHX3hO+uCGEMxSDAvc/qWflKjudT2TnAwvDNQwuA332vxFb3Y5y0D8icw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587961;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RxSPduDOiaRwH24FYN3D1kk/0l8Fy9fc2Bjq8nF2JJA=;
	b=nrgiCt5cWIRULFpL7k0JynE/7dvmviMV1gSFZlKgpBMFgf80k8IrVlVLmc0vdt59q/j4
	 bMOpOB6C3h0BgBphhne7WbOEwMkpETe89toteaRKqntDpChxhuTw8IGTXok2p88jlO9YI
	 ZICRWLcv8azxler3muGcQN/CxT4bFHM6vkMvA2YuRAap5xcJTqkI59+rJZkUXZhRYAk/m
	 QSIDSD/3e5qMVhWBC1jjuyCb1Ie9oOxSu6GA7yGZS84cL1ejeeB0jfJIkAM/tnjhRzJKi
	 M81HYgfEmXzMP6TFb++iJvN8KbXXdopFSFcvJwyU6VgnA8LDrXu/qX5vmcn3atgLj4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76FC11F000CB;
	Fri, 13 Nov 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587961;
	bh=RxSPduDOiaRwH24FYN3D1kk/0l8Fy9fc2Bjq8nF2JJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OQsol5aNf1uXX2dUm8oO4jIhguMpZgV7cjjtG/1G505aWLHoqCVH2b5zJ3PT9jxPf
	 4wEPe5NoIZcgZxOfRUdRb8uptBHi0AGAKSACICX9GVrRLE4mLXtFwrAhaJo8HFwroH
	 rthyGICias9U/oFZ3J2Cok3d014ZNQjfBX6xZ1CBa++nQPuKFyS06b0PxWLfOWv8xI
	 bW970A9iHrPRGf4q7fNNLDbjbOM1Y7f0FU4WhB/HNNdyFD9Ive6zrIxJNFtCSc0VI1
	 5v062EnVuY+tKdDWtkQqzVL8JlB+17hnJgGcnCPvN+6qfv54d0QZl/1RWZYC3lGEkn
	 KjPx8ZDAP0Kag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 15606499C9;
	Fri, 13 Nov 2026 16:39:19 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:39:24 +0000
Subject: [PATCH v3 7/8] drm/rockchip: vop2: Keep the other LUT_PORT_SEL
 fields on gamma LUT updates
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
Message-Id: <20261113-vop2-fixes-v3-7-08ae37e83b5c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587957; l=1431;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=SkwWlNjcbiIUimcs4iIv+zOxIFtUHq1H2Qpz0WkqgFg=;
 b=AlThRHuxtJ9AiM2MPRZ+nBKGtidmigRvebqlaSPq5n1dGKgsE42ZiGxgJl2H9b6Hrc7i4+swD
 IMiRbZMjpl1Cnxa7fWQBbBXWWE3QuOPZ9fwYGe7VBsAWdq8lYqTo5ee
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On RK3588 the gamma LUT update writes the whole LUT_PORT_SEL register to
select the write port, which clears the dclk source selection of video
ports 0 and 2 and the VP0/VP1 merge enable held in the same register.

Only update the write select field.

Fixes: 4f537776340d ("rockchip/drm: vop2: add support for gamma LUT")
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index de3da292b05a..0c300279399a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1621,8 +1621,9 @@ static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
 						struct vop2_video_port *vp,
 						struct drm_crtc *crtc)
 {
-	vop2_writel(vop2, RK3568_LUT_PORT_SEL,
-		    FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
+	regmap_update_bits(vop2->map, RK3568_LUT_PORT_SEL,
+			   RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
+			   FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
 	vop2_vp_dsp_lut_enable(vp);
 	vop2_crtc_write_gamma_lut(vop2, crtc);
 	vop2_vp_dsp_lut_update_enable(vp);

-- 
2.55.0


