Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625523;
	b=5jB1rmpWS0EZ8+GgS7sFBr/JFjIIIy+3bruJloik7sSS7QsfbA8BNeWgVvaQKryof2gX
	 wou2nLkFmTmHePR+ZxAC3EKo8HRWhzdb3h9mKpRsd3aPWTNIqy/1oyjqfa85wT0TFJDNJ
	 /V0/1XGyM+wP44zzKITEKVUC0mbtSUuesdYH1CR5xtG+iCT6KoZH2ex4immNI39Q91FqL
	 1Fjwwvf/MyAMz6AGsA7BkEJuhw+7xdaPLmECXN+4a35WUk0dOYr+HLWr5ax/aIYPzRXbG
	 yBv4LDuQsHuKRHGY/ACzkb2FlYwUNfV1naVjKvWpTiYgELMGB8CKgDsQd0l80HcgIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625523;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Tfj8xOhGv3aLFSnyPnoftSykJdx3O2+yOv2fTajXqZA=;
	b=U/95xltu/qq6HC+89bjf8iez6r1FsnOq6ao5Yd5me5P237OQMN7ki/BhEkrKciMaHOU0
	 Qohptc3/yhmSt4r6RSR/1NV1HKJnnJtbRW5h+akrsQNR6HKcnrsFkhyXkUgPUjpeofysF
	 Vw2Upn7AoL22p+7k6z/zf2rL24A+zrfbEjHqP8LjMEn6QG5Vd/PXODHs1Nyn++qbQeRKg
	 p54IqcWUgBkuZzbhIWgYtuQSK6b8br9QMkNoqwspJM25hiwKgzRItyUMioirYNQNH7wyD
	 Vyq/F6zQSwbfyOEseqirHQpmj7uM0tzX7wVogFi6XTizCQbpA8XzKhfJKeydt8N9uyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=eoy9sL2d;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oOvdVOD7;
	arc=none smtp.remote-ip=103.168.172.139
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69185606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69185606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=eoy9sL2d;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oOvdVOD7
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 92B0D1381A23
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:05:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Nov 2026 22:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625522; x=
	1794632722; bh=Tfj8xOhGv3aLFSnyPnoftSykJdx3O2+yOv2fTajXqZA=; b=e
	oy9sL2dNLnO989HGOCiTzuBakV9f2tNPrhAZwZ2S/H7T1y3YoQN6Afbj4b/PD5Yk
	78B4kziy3CrxneEjwXKzuJVNfG1dKtWcXtON1eiaqxIrIR4KNqSDtEIvFpNgvUa/
	rozBmsCPhvXAAu1ooAL06CiB1GWb5MXTS2TG/WWmCWg6CQ9vT92Zrk/TDn/RowFo
	66SVm8bXKCva3kCN744I/ajzfYwfuV62K/wNpSo+bG410BLlj4mDasTpEox6Klwo
	hyrLjKqMgpZhvW4MrXbmHIOE4yzvMVyS5UKwh8biCk3Dtj+xu5SkHwJn26RYDkqg
	WR1hpk4Pd1gjUGjaG2tNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625522; x=1794632722; bh=T
	fj8xOhGv3aLFSnyPnoftSykJdx3O2+yOv2fTajXqZA=; b=oOvdVOD7CwnkY9WwA
	7rxT5XeRzIMClXy4KE/DqKeXDpgXoAM4ZLUwVMD+BfkXdBioHfEB5xgadNv5/F23
	TEihit6+d7CtfBSfGuHHUsusulYNvSQRrsnauTdUSqz9vM7j3Vw0HFx858sJeTj6
	i5kfn/a6VC8dYcMdImy441Qq3dc4p2DMocwR7pQu1lyRy+Qs2TPmZ6u2AHfOjMau
	3Fn31p1skqZrqyCos7qoea+SS3ISr/MDgpyGxl3YlTER21KaJ0XScMsEINEqPLM+
	TIE8OJqQryFsLHmoJeZys72ytbJlZkj81o728TOQSCmktoLUPfw3An7QDW3wvHbO
	ICEqA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625522; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:tQrrbxdd9KhBYXEObDcPbVJMZR1XOePrl8EcIvXnL9P6rkx
	5jJi18DiXNMnM6T9AnQWpM9VO9HqhVvTcsq7OkKyiDuiSur3ohyJIpPQReMBiRon
	QbgJtstooOlZeokTYZJ7F3FT4a+m2BwyhKbwD2rh+W1UetrkptH5i6Gw2tSVUPd7
	sV/ijGD0AXpkmF2b+jNIu66/Fe5u5B+fHt/63pUCMgeJWSQASqFKzlNKtJRfLKgF
	xdEGPvrWlUeubku918YwSbA92pxJXLmP6WRWlyZZ/ahP9iBwqi+jWW1Msw2D/U8B
	yxlw8odvhEeUwKHDDQ7hQWDkalUyS3NKrqIPIqg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:6y5iaDAnBfXRiHNj58VVFezAuAMpgT6TSdokhg0cty8=:WEBOazfurM23ahZUC/wEzSpnZMIbPO0jswk81G9oTOc=;
X-ME-Sender: <xms:8s_3amdoVRQbxwXN_Gd6nvVD9-8I9V3A973jhT71BgEyJG5-ddcLeg>
    <xme:8s_3alxd0aiBarRgzIwmHxlL715zydnTNeH9LmJhkUz0xWwqap7h60SJm2g4qV9js
    lU9agDUvArCx-GUK89mPyrL5-iHUDLMTRda5-3ksoB7R5rdGIUcQHI_>
X-ME-Received: <xmr:8s_3ahHwJujI5wWyuICQY8mXighRJBzFvOJTbhyozCyY0Xqi_1kagtl-9bpjONxQfzfaiZpQ>
X-ME-Proxy-Cause: dmFkZTGz9WnlZjVE2HKbL42hlhRiRjvh0qv13kuFDFn3+2l+J9l5ZGi0ACkeAsLfSd3Pvm
    YnlMS6eJMEMf4L9dY8Hb9ude5fnVrJbsKsxhfaxf36lbesjLo+5+GoIQX4PcdWwScCLOQJ
    g7fRWRTDzKadWbOl0JgzaeqbKfjBdnDAiS60usPLXDekIwUGuNacgS3BUb2Z6DoRzwPsim
    aXV56gHbLmXbQ8zGVKzUj3foq+ONearsy4Enm9lW+YRz5j5Zg70Pr5jnwTPLaiZWa86bGT
    V4eCQsfBmuolPiuUgKaNhZYhTw4UbN7IikU43gT975Fdei2j3eG8+tejGM6+krkKFdM1s6
    WhSY9EIJP/hePWkGhuzp+ZcFrh0AxEQv1YcyeoSH+pe0ZU2IFnuBbTDYc1WlCSZ7b9LlP+
    tyrj85U0arqfBhuTjuZtSLSXcpOc4LQFxRUs12z9ClrIfNtmu3FcNtFpFbQRS4nECeNnrC
    V9DeOiKvDvx/7W4gMOzz/nnnSlxGuRYblsyKiokw+HqXNBe6SAMsMUck6ogJvfdxG6UsI7
    y06X2y8oDDPZj5m/1O1KNVwM89xf4SQYurNWifvt6YYolbB2oKXECHN4aNK6y4essp5leM
    Dz2EAkWNj/KLa0dmofrAOypwUSD4EgErsd8t/cqR/pri9UxZxPjXPgDFCv9A
X-ME-Proxy: <xmx:8s_3ak27dcHAq0rMNrVcmrNQDh54d7BIVbOtx5ORaZsa_KGVRL1jiw>
    <xmx:8s_3ap8JYAwCe6a_Xb69VTISvLGiYD_A7xzimnhgdn1NjdFVkISakw>
    <xmx:8s_3anE-gx_p2tr9MBB5z69Nej1smBIEBq03SnUww52PWaGvqBLxuA>
    <xmx:8s_3avhZJrNH2JikxaAUxpcz466Pj9TlfWsYO7MvML6SZSJaKqKhHA>
    <xmx:8s_3aomDm1h4R2RdDTk3NZhHv1xdhRL10XsYwA6hf83YbB4dun2mQLsg>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:05:18 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de
Cc: finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	vlwwwwww@gmail.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 2/3] pmdomain: rockchip: manage the RK3576 NPU domain supply
Date: Sat, 14 Nov 2026 16:05:00 +1300
Message-ID: <7a35b1c0ae3c4e130a156dbf477fa2df659ffc61.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615323.git.gahing@gahingwoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_pd_regulator_enable() only reads domain-supply for a domain
marked need_regulator, and the RK3576 NPU power domain is not marked. A
board that sets domain-supply on pd_npu therefore still has to keep
vdd_npu_s0 always on.

Use DOMAIN_RK3576_R for PD_NPU, as for the GPU domain, so the NPU rail is
switched on and off with the domain. This needs the previous patch, or
boards that leave the NPU disabled hang when the unused rail is turned
off.

Tested on a Radxa ROCK 4D without regulator-always-on on vdd_npu_s0: the
rail is off while the NPU is idle and on while it runs.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 5cc2094e87cc..cb5487ed1e55 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -1360,7 +1360,7 @@ static const struct rockchip_domain_info rk3568_pm_domains[] = {
 };
 
 static const struct rockchip_domain_info rk3576_pm_domains[] = {
-	[RK3576_PD_NPU]		= DOMAIN_RK3576("npu",    0x0, BIT(0),  BIT(0), 0,       0x0, 0,       0,       0,       false),
+	[RK3576_PD_NPU]		= DOMAIN_RK3576_R("npu",  0x0, BIT(0),  BIT(0), 0,       0x0, 0,       0,       0,       false),
 	[RK3576_PD_NVM]		= DOMAIN_RK3576("nvm",    0x0, BIT(6),  0,      BIT(6),  0x4, BIT(2),  BIT(18), BIT(2),  false),
 	[RK3576_PD_SDGMAC]	= DOMAIN_RK3576("sdgmac", 0x0, BIT(7),  0,      BIT(7),  0x4, BIT(1),  BIT(17), 0x6,     false),
 	[RK3576_PD_AUDIO]	= DOMAIN_RK3576("audio",  0x0, BIT(8),  0,      BIT(8),  0x4, BIT(0),  BIT(16), BIT(0),  false),
-- 
2.43.0

