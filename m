Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEB256261A;
	Tue, 13 Oct 2026 22:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931934; cv=none; b=mwMjfDe0qtS4LwZuh+qo1DERxPATFbd0G+AFjjDOfxXFTw/OefTQzRUHd/o2iDiAz58rRKfzklLedMhx6GoIE0RMWm/1uUcZrkd7vB7rIr7TbhIdAhtQ/EbpMpIe7b0kNpSF2kcEerqsAZBJh/ptu0POkpdlzSVQjB660LlINYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931934; c=relaxed/simple;
	bh=UsF0ka6JQJB52yMGxTjsFQSKOLo4iowxPUK1+eAGX70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tjjgwf++AP1XwKMtLpUHzwJZ7xE7KeYCkVn0RCflHDRDp5uW512oBYQcxQZFBOPZxBIo2id0PWmWaSdQoehUET+odcUwA9w6Yv0HguNcl/oTQzX4WLFRu40G+EGUfTH7azQTsFaWUG3/zjFE6vpHPf27x937ANrf25tybnVwnAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QGw0Bk0g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QGw0Bk0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931921;
	bh=UsF0ka6JQJB52yMGxTjsFQSKOLo4iowxPUK1+eAGX70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QGw0Bk0gKZOn8zHLWvJlJcNneUtCBNqyYXbvVZ3vTVvE2L5yyUOxHZzmQFBFlqpQW
	 mRU1CZvhyvh1MRDBKRxctawdHAnb5tLltf4TYqj165v4LttEqd9OTwf6a8bQk0qfxb
	 bNGb8wCjs5ISARnzeXdoOJkik1o2BCQsJsHl1gQku25fGWVCVnUaQFonyI576MqL9w
	 Muk1GPtEloHEe0lEoprAnf57vpJ26ctIaDPyLROgrNg+iD/iQyKfZGvMvFA2o6DlbK
	 0DIJBsoM9RzjcarNqUppU+k9SW5Z3OHrKxxIgmQAz3zZWC44G/4asa8rfL5eBvr3My
	 TrmjTLcLbmInQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F98217E15B4;
	Wed, 14 Oct 2026 00:52:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:32 +0300
Subject: [PATCH v5 15/15] arm64: dts: rockchip: Add RK3588 VOP2 resets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-15-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

Add the missing reset properties to VOP2 on RK3588.

Co-developed-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e0786..574264b9cd9c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1651,6 +1651,18 @@ vop: vop@fdd90000 {
 			      "pll_hdmiphy0";
 		iommus = <&vop_mmu>;
 		power-domains = <&power RK3588_PD_VOP>;
+		resets = <&cru SRST_A_VOP>,
+			 <&cru SRST_H_VOP>,
+			 <&cru SRST_D_VOP0>,
+			 <&cru SRST_D_VOP1>,
+			 <&cru SRST_D_VOP2>,
+			 <&cru SRST_D_VOP3>;
+		reset-names = "axi",
+			      "ahb",
+			      "dclk_vp0",
+			      "dclk_vp1",
+			      "dclk_vp2",
+			      "dclk_vp3";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vop-grf = <&vop_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;

-- 
2.55.0

