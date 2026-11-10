Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295132;
	b=2j90qYdraoMEpcZpwhElIvjpcw1tGeMDQwviR25MNSDlMVcbphxFIVWcifQvUqZBi8hF
	 UkNZ7YTEfx/c5aFzU5ur4wsxrGb2k6W8MufcyGosTWd488gFSnxpKoYRzrGCYnXGe1h3G
	 PykB8S4sAFGbR6zw8V6RLrIdPuwjfCn4RgkH/yVBZyPm21hoQLEl9PAHm2KKaRE8yh9MZ
	 pJxR1P5Fe+2e1jU2IGIa/bM7Lu92vsYS4+zoPDlle775zvyT30iT59DQ/vYmgD+O3GVbS
	 ZhKsxu94L3sbobETlyKcJduei3YA4rirw8KLORlcjtNHLMwnmLPXozEKjxCV2wxYiHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295132;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=s1Qj21qpcNfOQIR9sV5LF1bI2tlwUQfLEP8RYtsxPDs=;
	b=HoBCYfTxNF5ilfNkkEo5xRCRAAqFlrM3QIeYsZme4L+NzyeyIzYWg0U8bnq4mqFR+U6X
	 HaVbRceo7swFS7BrT9+RuKCcfea+6dzmO0j1nvnO42isgDR+AHXkZL743/2hyAsp2h7ne
	 Cpf3OHdq+NE+toW+6S08Y3GpDJr1QYjPIz7nd1TpXgH8cKye1A5E7I/p0UqfG39MSgOF5
	 yVvRRi4CiE8GtbGeRkhYQb0pJHHNwsWNgdZZY4NutJMZhSV79ArNbaahFlpu3xml0LGWi
	 JqanZM0L6qzawiL0Jhrf0b1Vwj+uv9UaYlW2irk0WI5rkWm29RuSMTVeYcZcqb6fMwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UGNbK/tx";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46FA60A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGNbK/tx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295131;
	b=UPf/O/mkvy/p1Kd/66N+4cpHujxHyh6uh1OkAqheW9RJ0H8k+7/6vLKR5H/7NJcKzgWA
	 K2tjP+hZFd0yC191EzhcGKE8v+xG42MTkT1oSe8sT+mQZ1YKXqtdk4ANxofwk5LyxGisH
	 EufH32IfymM07PRL3w+u7UYPeGodYvCSpg8yz+u2jmcbrxgGN0IRM+/QNpSehLszQczm1
	 IPBjoTqwKnF4G72O1BJKP6Cfq9ZDNhxu33HroSFp24Ps2rEr8GeXPPER+8LGQ/cmZQXdD
	 G8iCMtwfrtF9xhnsg/LzcJlgdhFN/0KFBzFRLWIkPrIoTdwJG3VT8tFc6dPdWmiToug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295131;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=s1Qj21qpcNfOQIR9sV5LF1bI2tlwUQfLEP8RYtsxPDs=;
	b=V6lWrytmgxxxqJ3AG39f3EfEDkZo6Tl38jTkJlU2uFQY739HK1QeYxqP08MiBO2M1kyr
	 R56rtk2sWvK0SxgK4ooFNx0kPK0kdZxwkaP5xbdwauAenu3TBJiXJT+p4VHe3Np4acNj7
	 I1GIbYVX4AV1wjmQWW97y3vErOX13ltZim7MaM+5lNZpF2k2+MfhWwordm2yy/BD51+Et
	 pH1oe1pIXjZ7c8EAMowlg14mo2lRIGPic2ao6I9mkrYVmj5IEBTWYDHcj7suhPLk4PQDR
	 1SaUC6pffb2BcUcmN5eG/v3stcmki65Syn3ooBd3hfypOW5sGit8FX6uY8ehPcMa3BQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CF741F008BD;
	Tue, 10 Nov 2026 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295131;
	bh=s1Qj21qpcNfOQIR9sV5LF1bI2tlwUQfLEP8RYtsxPDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UGNbK/txuqVf6E1Mv/kZl5sGy+RvaUn8GR+u7bMds9gRg38xEoshXywzIXdmHYG12
	 qxY6ZsAtN1uzoiY4uAVQUg9bJ89dI9v/uj5wSCkQMhJqyZihIRXk9dHpA0KNe4TxAI
	 JeA90Kve/aboBTWRPqIW1vn45Ro9D7aaczPw6DZWCj55+mG+lkS6bj7tMvhafSJDN7
	 6clkwDJacmWRPMHBFGQaFGWtuLafMxpifGyDxJpJPO0I8UuROiTE615e9v19qcfIFa
	 aDctrn1TZbACBjrMooLummV4KsQlV8HuBGOzI1GGlZxrXcVXNXJuzI04i5pI89PIQR
	 2ZzVyVuXXmVCw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C622D489B9;
	Tue, 10 Nov 2026 07:18:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:50 +0000
Subject: [PATCH 2/8] drm/rockchip: vop2: Fix the HDMI sync polarity on
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
Message-Id: <20261110-vop2-fixes-v1-2-d336e9dd90d3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295129; l=1785;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=/jrSLrVkUlalHW0TPexjIwQp3BO194HjqfgHRaS4qLM=;
 b=HnWtJTR8ePkQiIPst0zqwNylcoBjEN4hJ2NMs1vb6p/D3dePg6kgqqaeDFKfjYqV5fqLL4PTw
 M0pNS36M2UzBZFvNVCTyoEy3Qc/sfBBXs8yb23ZIESbzqYckL4pb84j
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

rk3588_set_intf_mux() passes the POLFLAG bits of the mode to
rk3588_get_hdmi_pol(), which decodes them as DRM mode flags: the
VSYNC_POSITIVE bit is taken for DRM_MODE_FLAG_NHSYNC and POLFLAG_DCLK_INV
for DRM_MODE_FLAG_NVSYNC. As a result GRF_VO1_CON0 marks the HSYNC of
every +HSync/+VSync mode (e.g. all 1080p, 2160p CTA modes) as negative
and both syncs of -HSync/-VSync modes (e.g. 720x480, 640x480) as
positive.

The bits in GRF_VO1_CON0 are set for a negative sync; that is how the
vendor kernel programs them (vop2_get_hdmi_pol(), called with the mode
flags, sets them for DRM_MODE_FLAG_NHSYNC/NVSYNC on RK3588). Decode the
POLFLAG bits accordingly.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 659fd0a3ab63..7c48b440cb29 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1687,12 +1687,16 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
 		return 0;
 }
 
-static u32 rk3588_get_hdmi_pol(u32 flags)
+/*
+ * The HDMI sync polarity bits in GRF_VO1_CON0 are set for an active low
+ * (negative) sync.
+ */
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


