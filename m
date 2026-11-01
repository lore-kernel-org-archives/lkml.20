Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793505727;
	b=1xLJ54pE5lKbl/TwLGsyERpCRPND2YvWWUmYe3RXZIzyoypp5Wnc00lXVD51quLPs6fL
	 luWzkDnQhWhOZ+30ms2aaFmxSwQiuwg92kaUOxw55fIusLeuTlJUTo/hwpZICf7MQVF1s
	 H+JVDP0+TcP2pL7utnzLAgWl2M7EW35Qi90ArseF07fZg/Pd/7GoDUqA6tZIJ3Be2nsTH
	 ED3kAjHGyDlz5Y+jf91FqeRYHlPt9CXsEEbxClcoKUDYahHZSXgLSMpplveDGhdDUu0z8
	 m/yeVQ+SVk3gKDqDcw5Xehm5OzvDuyK3yr03vc5WFsaTB+sRwbHXGFFZMsbMpHv78LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793505727;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=peN5ftTqyFAP70ofPsYsaUWUB0BkZNqrFQzWyZxPC0Y=;
	b=ieBup7QV5llqMrLKViDv6hRn8G22X+45TdzTLdBb2L/DQWMSvKmc+7nbxCT/ypKwB0To
	 Rp+w0NBGARBW9Zo0+gkFgTQ/h8SQ8XzbwX+9Zq6ceuU/4gintNpVVClIT7ilY/RYIjTIe
	 zB926v6MXaSmBAOD30NGC02xIkTmirAX54vj4aKfmcKkIodY2RRyuVE5wVHA62OtOimLC
	 c1O4vdsFf7k1PFnRIJ9DQhSi4VJw2SfQQpSNkbWqN+Ol8jlyKKg/FWYeXm1FAlpPUOe/b
	 T9IehU7oQ0jpORxa+NDS/jN0A9KJpPANxYt53eei6cuGSvX3b0KBRBKtl8AdRkS5Sbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Z4GrQNjD;
	arc=none smtp.remote-ip=160.236.53.103
Received: from mail-m16023653103.xmail.ntesmail.com (mail-m16023653103.xmail.ntesmail.com [160.236.53.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F793606A33A;
	Sun,  1 Nov 2026 04:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F793606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Z4GrQNjD
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d84159;
	Sun, 1 Nov 2026 12:01:55 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v1 6/6] arm64: dts: rockchip: describe RK3308 codec detection resources
Date: Sun,  1 Nov 2026 12:01:25 +0800
Message-Id: <20261101040125.1864141-7-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
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
X-HM-Tid: 0aa19545653203a8kunm8fccdc7416d2c3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGUMeVk9CGRpCQkhKGBlDTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Z4GrQNjDREKR9OntzCbcxyJ0F4IAzMQOh4a3q2Glom4QFLLIjtZYqUW//oeuY9C3Tn0Hsaws2HgV2mfhwcZGRi9pBHYoRerVStTJPO70+4cmGMgTNjIRcyhywQJBCkKj4NkZhSIfqL3wBwUvsZfbR3/LaY70oBqC4jxBb7WGeuU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=peN5ftTqyFAP70ofPsYsaUWUB0BkZNqrFQzWyZxPC0Y=;
	h=date:mime-version:subject:message-id:from;

Describe the detection GRF phandle and the codec and headphone
interrupts for the internal audio codec. Name the interrupts so
consumers can identify the revision-B/C headphone detector without
depending on resource indices.

Keep board audio routes and external amplifier GPIOs out of the SoC
description.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 31c25de2d689..fb4465eda574 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -836,6 +836,10 @@ codec: codec@ff560000 {
 		compatible = "rockchip,rk3308-codec";
 		reg = <0x0 0xff560000 0x0 0x10000>;
 		rockchip,grf = <&grf>;
+		rockchip,detect-grf = <&detect_grf>;
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "codec", "hpdet";
 		clock-names = "mclk_tx", "mclk_rx", "hclk";
 		clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
 			 <&cru SCLK_I2S2_8CH_RX_OUT>,
