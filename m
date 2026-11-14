Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625675;
	b=XFvXxMSfS0NzalpOiSEXolcx0zYEvFNuvszHRU9Z9pNqKI8yKUPl49gKhvzEHHD8BELw
	 nW6so/9OLpQEiHOz0RtRMTY5raXW6NhvL2nzLx4odlG466Gv5ge5sLDZE4T279l8zfsYi
	 DoZkFgyRWlR5SJXKl1z7Qoq8Hd3qtFeVQCUfAEbQf0QHgTIpy9ZCOoxItHBbKIMD47ObW
	 XmxQ9hG5nAcDVdzDO2enh0wYU9fdXwZZJUGBw0PoHmP5HsLX5Y/rAFfRjuuODxB7pRq2f
	 OtZNYp0tTh8W3UmB0ojBxRL/H/G0c7mVk7B6hyUN+rSppVrJssJgQq0Cy3grDp9jQeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625675;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=minVMPaxKdnfyCJpbOwFdJHL/LDtX3McHU8H1MIv0Xk=;
	b=jyJpigc9YayZi012pGiYXW6n/EJVAXdLg09A31dv/zV91aIAxa9kq/bdxVq7LMxBQNij
	 p381ZZ/2hO+X294PBNBP50QN5dMincDpzaWjpiZm2ruADOI6PS1gikxqLewh2xhD+xL0G
	 cDG65l2mJTNcT9GQPH9cdK3fsQwKMk80CJioSX9b/FGZmIba3KBhB74VQPegYPUoxGd+q
	 I5BhLOb/6SrR32QdTFAOx+qQWCJRPJ8Js77SLSoQ/mF4BOw8S1Ff10ZGT0Il2wIWjLLOl
	 spmzROTvtYWlcHZLKmGwCUYbb6qRkOJHmKUSxixi9vGw5Arct4W7oGodWQj1GFM36KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=G0YZ6fvl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RMvLJ2mH;
	arc=none smtp.remote-ip=103.168.172.139
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70A606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B70A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=G0YZ6fvl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RMvLJ2mH
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id 9ED1F1381A48
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:07:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 13 Nov 2026 22:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625673; x=
	1794632873; bh=minVMPaxKdnfyCJpbOwFdJHL/LDtX3McHU8H1MIv0Xk=; b=G
	0YZ6fvl6B4tixy1wuMCXH+idyIMOSp4jjzZ7M7Hj8CzycVMT4AF+SDYteWzoWqxw
	m3uc1Nq8duDFr0ctKemt1q/jVCVwXKtvpsMZW/4XJBNcJy2Xz8TuxPUiSbDEtb+c
	ncEz7MaXQt/EoJNHWb9yo30UOipbQzywD7XmausfL35RePjNkPmM9xvYErV4yciE
	dXSzvReFA8FZ39CAp8+0r7I5dL6eoVuM6HQa5M24HbUTNB8r6793akan+E8WTsb4
	9iMNcIt2k+dICgof6mQjU1kl+BF7ts7C9a7/bU8yLJzj4UB+ZnEwB8TRecm0MOiS
	eqgJ7lbV8+eaGI4stiFuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625673; x=1794632873; bh=m
	inVMPaxKdnfyCJpbOwFdJHL/LDtX3McHU8H1MIv0Xk=; b=RMvLJ2mHq78DESybD
	OLlxdyf7DHWJp8kTm5F5UEwKJqv3W3V94V7p9sZwxhjg8A53pfrVe4gk5r5SlVGB
	4xhWz4MKLf6mrRQDjuIUYpIDtdknFGok7/fYyUdimZAbl7L4kvcpAZ4vZry7Zfyd
	Y6RwL4bGs0TrGhkBjk3OSO242f4fnqTBzLHw11YW6P8tEthMvJF09CalnmH+1xUV
	3TXCcCr0I8FsrqdIM2j0DBYvif7sqGfQ/tBiEq+Kbgr9ZPoBHoOvXwWnUe85sVK7
	RkPTx7V8FPTiYhIWLfAAsqL6JtZ/29uot8jRcch00hAuWXLo8EvWIrVDZ5jywTlr
	4tWMg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625673; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:aZwRyiyHL0YJKNmBs+KVmSCn0QE8dcdSm/1n9vj/nywtvLl
	Qy/+AkiDvj9wnfYpmn9VllSljYNdd/LDqxAMAuxlG5uvEQHdOfYxm/3txop2kwwE
	EYAPxxeAEJPGc7MoCgQhPvnTvDqvJeVv2VRIQvqQuKd4+ww/90TYnQCv+BSigw20
	woq/h2McV1IbbruB+U37kHhXkWwPOAWnA3ajXI1y3h3XH4hTKXcBe6/CZD7yAYu7
	4kccdJaNCli0Uj/HmMq2gW7+mwgSMPD20CRuHl1XmJPIJeCHOGDc+7lJZymMoSqD
	+dGJwdyG/AFk/+XV4TUL+0fRwxkra/Ds2wPQNxA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:EMxXy9xAZ5ctopLWqVNQ7sYHei75wDpLzcRuSICud9k=:1+NbzSznMYt1rSZBGDikCAdMHVRI7t6SMcI79gsQSUo=;
X-ME-Sender: <xms:idD3asggZHPb6KVJz0QsCPiYaIw8HheB9OdtoD5gNHmgxHHn2xIjCA>
    <xme:idD3ahcmBaNnnqD3b4ZsxIKV0vuRhkPRvty7O-46vy5oSj6oleZEZBFw5N8D5aUNI
    mhXROYcs52Qb6mOv68TVc3g7zjRqxtVp3w-ZcEtxfw_0yKv-P1Ydzt5>
X-ME-Received: <xmr:idD3arUsfCPuwhEV0dCco3vJ5bB2O5ef0vJESHkq6vWAUAgCECRjPaFht-FdAC7xAmgNtMTe>
X-ME-Proxy-Cause: dmFkZTEGMxOoH3y/fMppx2r36gm4cx9GYI3ohK01ZShvs6zT+8h1mVWufLahBuei4Ed1/3
    xRbUYha+QR045BDD8FCRFVIM91rSGwUQ7zMnQH1Bkat2KqUfUo8S4YHSEorvk8zLj3SaDW
    2cnjQVg1N4cjgYIFaRpoqGeOaFHkoldyad78tsE+DecFb61BS2EtavEyFF5qPgk+LGIze3
    1pj9uE4MqQ3E6Y1sY03sy7yic0nfNy3N91ax17Z8mzLg+z2lmCVcb4QExTOBMVx/MohP3G
    wnkdi+msWCJW4WkcwQvXo9jRKjLop8wk5fKsg/aLeHj4SFgb7u29HtVGx3Iv5RN6/FH7Uc
    6ooYTCQJTzCVoGpAgAOmwgxnP95SyZGhb8IR/gfhtnijNjnwmL3vbyASIyngaAVfisingC
    GkviKl5cAo2XuBatVdj2coWGf5yhq22IF6VSCnwNzJJ2E0mtQ6yjIqq4HmOZ6VKl8Z4d3e
    X2B8vBYoqK8/+zjBwKDw0izgWXV42sdfCA2e0t1lPz/Ykp6UJfZ++jkgGOhfH7d+aTDQEt
    TCpElkeA0wPvN93ga5P72J62SBRc/yT75IqclhylkonazCl9gpFSajqnOdSGtopXM5KZDO
    wMS1pA9TfyaKBIlIAIVfQfdS9IO5fB8CLCXkTmCXCClcW0oSh1hBkOrNisnA
X-ME-Proxy: <xmx:idD3ajzDOpbOOQc8Yg1u-nL5gWfN6FrghzInKre29s418eOebadD0Q>
    <xmx:idD3aqBtoBm22JnKIWQR3pBacPBPyxTNK72MjlN58vw1YLrf875DZg>
    <xmx:idD3ah5kzDEaglxuAKYLpZrUT9Yj2NlaiF1tCFQ2ywaxDCw73p_sww>
    <xmx:idD3apmJg_oBatXvv1KumlntFngQbdaEiBW4Ct9ySiYK6IeEbEuyOA>
    <xmx:idD3ahnsXtrmaMGRBFmy1XPDGlTs7p4on_Cem-lDS41XzCKHZc31BRXB>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:07:45 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 12/12] arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
Date: Sat, 14 Nov 2026 16:05:29 +1300
Message-ID: <c0d64d55586774802bdd70defa016be6912ab83e.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
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

Enable both NPU cores and their IOMMUs in the ROCK 4D device tree.

Make vdd_npu_s0 the supply of the NPU power domain, so the NPU rail is
switched on and off with the domain.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../boot/dts/rockchip/rk3576-rock-4d.dts      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index f068794e48d4..72b251d396fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -722,6 +722,10 @@ &pcie0 {
 	status = "okay";
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmi {
 		hdmi_tx_on_h: hdmi-tx-on-h {
@@ -779,6 +783,24 @@ wifi_en_h: wifi-en-h {
 	};
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
 &sai6 {
 	status = "okay";
 };
-- 
2.43.0

