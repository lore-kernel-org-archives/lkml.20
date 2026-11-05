Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840479;
	b=XTXpLsUe4ZF61hi0BXe0UAbQ9l2MsmqrNnhjHzlz6lijhuWm3Bv51PnXl1ECYNjqGbh9
	 t04IsyE5C/RBdywA+neyb+Sn66SYJZhlIscYlHjPhbOQJE0Y3FYKMHxnkW1KAhACo/CWP
	 9r6pl9LOsJU6eRGcopYt5csJL306QrXdG8ZPJdV7ZxgccuRe37t1MF/FSo23nbLKdbwqC
	 f2ZaXBIrdMhn0YN2/yJBK3fnI6H/iKPhcbH54MIlDMsRbZOjx2Haggf5jXit69rNjerpf
	 RZY4RWWP4O/fa/k/FiSI7p6AlRgGSyVe1GZrc+/gQmLQg794s80F0RqGguPL8kc3SiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840479;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=cX+DbcJmmg9QakyYJpWVZ77VZJzicnM6ehZMoDfPJjw=;
	b=HSdO+7SJ6oDwYX2YvZmXt0PhIoJVudjLoEU/DZwzvpFHfDvbt41ZGmxmT3K5Ax5r/glS
	 nQwYZJO88XER44kw1zBVVa7wOz10RYIk39DYaz/RbNQvUZ/2rQ8bMKWUy8kHtpaMLyIOm
	 BmbKw+ukXN2m7n7+4/HTrcd1vZx14L/2GBvicqUyy1hoidy90oY5D3WkNJELR4m41D0yh
	 xOvC2I++RX0lEzpZa4bs98CfiD+FjQUHL89+Xn88dis0+GRKO2iF/ZxhKXYQ6Aj9sGP4a
	 H3eaHzv5mv2MLYnxo/9iK3L1yn9XFcpjKHbFeQy4E8E0q6zpufbbIcR9QDXsBC3VNVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MDWWwlXC;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF5A6082BC0;
	Thu,  5 Nov 2026 01:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF5A6082BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MDWWwlXC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840477;
	bh=JzGzUfuhfcfeEnoYFB9FfGGdw4SszHeIH0PSK2/hZUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MDWWwlXCSlM0agj9tA9e8bWmz22nJlYyA7++e/F5OFCJeSxeCQ20bW8gFLiyn+KLF
	 cgdWstVA7e4YNZ4Ph0OAHAqkF3illG7cXvSnxAeSGKcJxEdqRZ7LnlCmeC+K/B/koH
	 /nG5ruGhKF9cSxRC+FasKNfRClJ0z+wnsmCioobILURMDIAgjKtD+Fb1CDcuvFOuuG
	 9yff9O5ycWppvGl8xLaFwRsi6sZ1R+NSiaBDvFgmrGhSdlK2XMwGJprvYvaIHToB4O
	 JtdftT+5VFwz//BUSU3KxDOG6F6u3bIvSDr/6hp7EFrtXQDai+5OcbImDmPHTceKHi
	 sKd9iyGkkOtKg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 447E517E0D48;
	Thu, 05 Nov 2026 02:01:17 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:49 +0200
Subject: [PATCH v6 15/15] arm64: dts: rockchip: Add RK3588 VOP2 resets
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-15-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, Andy Yan <andyshrk@163.com>
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
index aa69fd3793fd..d0f364547ae5 100644
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

