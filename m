Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793335405;
	b=l7FqSpHA11P3HKsL1hWY5gSJqxlddfQeIPvsl2vrWAnFFDx/Awtn0GO/XqFCAWNGR1fO
	 xxNgtb4AXGZ94pDdKigjq8pTjOG6+dWOO/NtvccYJ4EZl5a5uxagIurAQta84B2hMsC8D
	 XM9+nJpamU0yi6Tis44Se5Xi9v4zNLMrssL7OI23A8ddIzs2WlwlqvSYYOKNHSMrOwHhk
	 eP1eQ9YdQLTm86P/3z7cZD20l3osxHsGPAkSTJ1/yfX6xpUnjoKxkUtPUuLxZbncO0zGD
	 HhlR+2PAkiIs+DTNW8Hc/Ale4ZZr5wn/NmaC6WQxx5gmyOnmGX9ogVe0R1JihMJEdWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793335405;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E26z6EohDNNZFX2V92ZFn0EDYciqgngLpV4nScBKlDw=;
	b=axygN87UkzqMuH+FptMSbHt6s9a1bkjRpGKwPMMZXvCGT/pacMwPUbIlXPd3K4SRucw1
	 jnHtFSEHLkkxyxdE9MCgXcd3765WAo4vj1Oagr9o1YyQZSndLvQNQQhrZwofpyhot4022
	 jRVhwNizcAD/JUPO/DkiSePWtERuFqgEmaQTJzyfV/8s9TTnmZW5OdX8D9DShnxscY1nm
	 K9eb7K6gUHxN7khOcSoYf8hyV6GCs24C7ZJrUNwVpKvUJYpNzOPtA3CAQFkv+r2akcJSl
	 Q69kCRIqD5x5BAeN+oe2pTThYoHqyt0HPN839A0uDNCIMGK/Xs0Qa6KZG34la44Ob6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LC2pTnXh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00361606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LC2pTnXh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793335404;
	b=HAc8dEAFwNZwomgI1GhZDMAIhnKdUtnBWmn1xv98uFpH8NQwRH/jAA3lmpv26RFpxz4q
	 DTHF0995VaP22MbD+zPevlDGCsELPJG0Yb3NlF9Ehq0qVFKTq4aYa3BcxfQhW2HH78bIY
	 9Y+yBBJzd3tECH0+H4lyF0s5uw+ULLe1RSC1Z+IfPMv96V03l9xxZTDvBkSmpS2lRPJNF
	 cw9S9Fp4nurHN0wkLiunQsg/yK1/IRvk1zrW2srv53RlnIrBqp5A5ZZCaliR3tu8XkB72
	 Yw9p+8oqUDj9LXvu+aY2+E+nuVFa5X91Gj9OAkzuJYex1nRhoDwuD8Cs8/QFmtG1xdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793335404;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=E26z6EohDNNZFX2V92ZFn0EDYciqgngLpV4nScBKlDw=;
	b=ypBiYy7aDF2mdnVcflFXkrlc7gq7ys5oJd+YaTDBWBgtiXxxaUOFyZcyHQ8b8wUfoZrp
	 4nko/hKhNt8dkNQJJtHi9U8UdeCjinG/PRR0+rFc4rari8W28a5ekpiBDeX3xkHyixmmA
	 gmiTdVRhPNl1wGHBYR90WJramrD6D2jsmays+WwENPK9sgekhTmpC3IeNXhkOtLL5W7dQ
	 CEzgN8BxNiBkgCyQ7eVcvIkAwWvhbwfIMlqtn6nsxaGJFDwYaOrvgarDxHb6iod6WRcQe
	 TV1aITpwVRLAx+B9YAbPYqyNqLfqBT3GZ70+8O8mY/AAIQ37oYeFlMkoIyOWxWVQxig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 266961F000C1;
	Fri, 30 Oct 2026 04:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793335404;
	bh=E26z6EohDNNZFX2V92ZFn0EDYciqgngLpV4nScBKlDw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LC2pTnXhaePv1dRwkEUaLsAswpQ0FHwasG4aH/j9/0mjuIYERX//yTJXPHe/v1k+5
	 qHV65vVEfaHmzzzj6tYDlOFFY95SlsiignsdJpzGOsJMTSw8tN5UwhqJ1148FieE05
	 N6/oOc70hZhsx5xZKztHbPoRHMMn/fsFM64MDQ+10KRzC3pkFQ7lMQe3vP/0kgyY5D
	 MjxfCI8aFKS6Nx43R7JraMlEEiPPGW/Th5e0bSn5IYPk0DjuIRN4pOYhm73HN31xR0
	 hcaQIU9jGzX9SMilF9HDdTtf6lSrzmwxejUxKcwSnwWAAPGBVQK0I3m99lYor/vMsO
	 SE71fL0LYyenQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AAB0B43659;
	Fri, 30 Oct 2026 04:43:23 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 30 Oct 2026 06:43:21 +0200
Subject: [PATCH] drm/panfrost: Gate the RK3399 GPU clock in runtime suspend
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
Message-Id: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv>
X-B4-Tracking: v=1; b=H4sIAGgg5GoC/x3MQQqAIBBA0avErBvQhMKuEi1ExxoikzEiiO6et
 HyL/x8oJEwFxuYBoYsLH6lCtw341aWFkEM1dKrrtTIKs0tRjnKibMZYi3lHOdGTM9HrwapgobZ
 ZKPL9f6f5fT9c1dbTZwAAAA==
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=aee4514usbOrnKBJFpIWBVeVFNuEk+tVTdQcWikAb04=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlPFLLOSB8ueTB1946dbsLytj3Moo8S1xtIW4sndIR+v
 7bd2nJWRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZjIhVkM//Q7npVszd0963Zd
 2oV1yvyt9yTsRLr/X5zN+ntr6snTzcmMDF9lnhourWM5pFXj6FZrvLLt5sZfk0p7bSNiTbL/x2a
 YMwIA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The RK3399 Mali-T860 matches arm,mali-t860 and gets default_data, so
panfrost enables aclk_gpu at probe and keeps it enabled until unbind;
runtime suspend powers the GPU off but leaves the clock on.

On ROCK Pi 4A restore from hibernation hangs in genpd_restore_noirq()
of the GPU while panfrost is bound. With the clock gated in runtime
suspend, as on the Allwinner H616 and the Renesas parts, it restores.

Match rockchip,rk3399-mali to default_pm_rt_data.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on ROCK Pi 4A, drm-misc-next 33ed26235db9 with the rkvdec fix [1]
applied: hibernation with HDMI active restores 6 of 6 with this patch
(once right after glmark2-es2-drm), and hangs 2 of 2 without it.
[1] fixes the same kind of hang in rkvdec, which otherwise hits first.

[1] https://lore.kernel.org/r/20261030-rkvdec-runtime-pm-clocks-v1-1-fb2c5b629e79@iav.lv
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7c348a0bf1ee..21a9a12abefc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -983,6 +983,7 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "renesas,r9a08g046-mali", .data = &default_pm_rt_data },
 	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
+	{ .compatible = "rockchip,rk3399-mali", .data = &default_pm_rt_data },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },

---
base-commit: 33ed26235db93162935d1719bc6f538c384a2fd8
change-id: 20261030-panfrost-rk3399-pm-rt-cea3fc1790d9

Best regards,
-- 
Igor Velkov <iav@iav.lv>


