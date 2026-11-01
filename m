Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548798;
	b=V4D+/7pok4gFZKiFSPxSytL8r8GFfM4zJ7bGXCRFmwEppJMwBLbzN/i4s50rT9zOekVY
	 n22KlsRypJyWoirtVSpfA92lQqzl50M1Vuz9VnogkIrprgR7kgB/76dUVObn0uUq8UxhA
	 2UT9y1n8QtxF13b8mMzdzCD6GEIEmizeM/gsOKK+aL0b+F7TBodeWuTbJ+0YArNhVmWkk
	 phlhJycCVcT+00fMLZ3QFTatEvxOqWKo9ZxfN9g+U5ynTZuUcLfFOKbahMbxCAuv2xt7E
	 CSUGv/rUd7997rBPzRzDjvgIRCszr5rdP2PqI1gMhussO/v5xxPQ024Ik6RLvs5/nLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548798;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rSXU4MdQ526YDwpFQqmQayTOK2c15g71hi0jEnqqt1k=;
	b=SF5rMknHQ/8rtn/Ipz10lLiTOiNJBEteBaXreSmYlHgO7dpRDOhAo0RgXA+no4szXOVo
	 7wGvWMSYHn4E3bPOojbZ/apI0lUnChTKQBd9aQ/UzM2rmDq2j+a44dn6TpM3kMLK+cZmy
	 teQz4SlXaWni33oXexuOGGi2cXM80bgBg7ATl0l+bnhK22VxeDn5gw5L2MtKdMLMzOrG5
	 fsEiikRy8lTPcq5+P+N7z2yfAcsDQz7E1ffKCeQzZs8wO+mlCn1t7xeGFjl2XDcqLlTbO
	 rJVj5R5Yhrb3WZyz4VNU7SsqRskakySeuARdGSMUgrkKxpiU7dyZzxr2cvEhW7d0ORA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIltwHE7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F0606A324;
	Sun,  1 Nov 2026 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIltwHE7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793548798;
	b=Pk9196040DLrjqR/1GRCXe03ZYBu9/u663vs11Ux8KjjQ0xD4FgEfeBrn9m+6q6gavn/
	 lUhdPNByOKY1VRx20lRciYVCJfM+EeT+y0TeNgyzkf8NSJxeKo69YU5myhN7AZmqWB8B0
	 KbyFZgvYuKWt4hgfEawQ6e8i++lSGnqNeOHbdYU6r0VtsFNHE/zjEHdHAbnapwq2ilT0r
	 wuHLy9jTd+G/IAXb7FZE5OHyTFyKQoXEsJGRl9CPztzUSjv7qGp6EaxWBvJvaWzfqikoZ
	 bs3NvKJC3GFdX0Bl7uX5Jwu/3USwPySHL/O6hcdSDMd64ydZh3CKvVVprUDvQ32C9zw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793548798;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=rSXU4MdQ526YDwpFQqmQayTOK2c15g71hi0jEnqqt1k=;
	b=B/Y+BSKH6mSTDsBGjWgAY47rfP2h5EnGfIn6jXobnWwHY1DxuFy4W9eN+MSw2dzgKzpO
	 9DDGqpjvwyGNAO/kIC6jA7C/3o9nhZ7oxZNOLNLZZcOz/q7r39FSNgCqbd5MOfDZNbsde
	 HZCrvvXFynh7+1QjoNizvE/1a9EYgM7lK6Pl3V+RbfLgj5umNmvHORsdTdk6CkZcsbQdB
	 50HuYq3sHuExy/7IJc86tJ8Lkji2N3mnyWnwp3/pNWyNYsRdCQqOpfIFc1G1oNLeULSLz
	 vYk9lwImyfrEZzUJ2BfVcFWF5xt6+YDy31HlkAlUNMGGUWoVrcsrdt9XKpSbered14w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 750931F000C1;
	Sun,  1 Nov 2026 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548797;
	bh=rSXU4MdQ526YDwpFQqmQayTOK2c15g71hi0jEnqqt1k=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=JIltwHE7SI6ouhYgSjhCFz4VL7YEzP+uv0OB7CP2S6FJ2EqATSXMRX5X9nOH4VP0W
	 iA+UpQNBb+u0JyMt6ze4eXIFn6XfjElXJ4mFueKRi2X6oAStGnok5L80QyIuc+AmhE
	 uwrxDynhF/4Qw49bgTBDVp8Py9Avt7fDsMEadcXoMwAXTOSi24wXJgrnBnJEKU3dDY
	 NGXI2IjaSKEhmKAtcXukoYuLpyiIqPFukk07ZLjQVDrzCFqowpS0XzKwWP6qxP1txb
	 zZfPW1vomDrv+LYxbDDLlXMGIqrLc41hvMzFugWeGGDeWBrEg490Qw0vW77aRWTmeV
	 rNMNGJiON6WRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C5F14461D4;
	Sun,  1 Nov 2026 15:59:56 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 01 Nov 2026 16:59:41 +0100
Subject: [PATCH] arm64: dts: freescale: lx2160a-nbxv3: fix 1588 and id line
 names
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
Message-Id: <20261101-for-upstream-nbxv3-dts-line-names-v1-1-7c8eecb2da9f@free.fr>
X-B4-Tracking: v=1; b=H4sIAOxh52oC/x3NQQqDQAxA0atI1g1MRivYq5QuZmqsAY2SWBHEu
 3fo8m3+P8HZhB0e1QnGu7gsWkC3Ct5j0g+j9MUQQ2yJAuGwGH5X34zTjJqPvcZ+c5xEGTXN7Nj
 VmSKle26aAKWzGg9y/B/P13X9AHbiLQZzAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vincent Jardin <vjardin@free.fr>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793548796; l=2193;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=ISKcvjfV02vWOp4oL9uUzMIK04tsXq8YeCeMJLgxIRQ=;
 b=ZpoRWP4cOckBlkls/HAiGexv6R8q/Ujap61DCpqzW7toDGxkec9a0p0haztMsR1/0Wrm0qOy1
 TMyw/wzpTv/Ds+8XHmoHyhh6EriJoQdy8mNOryfZrfYMnO+gR86BtjP
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

Let's properly support 1588 on this board and fix the names.

Fixes: 565b6713a460 ("arm64: dts: freescale: add Nodebox v3 CPU Module")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
index 9c5588a75cdd..5591ae262707 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
@@ -169,7 +169,6 @@ &gpio1 {
 
 	status = "okay";
 
-	/* Platform reset, no consumer node: released at boot */
 	pltrst-hog {
 		gpio-hog;
 		gpios = <29 GPIO_ACTIVE_LOW>;
@@ -206,9 +205,9 @@ &gpio3 {
 		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
 		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
 		"", "",
-		"ptp-refclk-in",
+		"altfn:tsec1588-clk-out",
 		"", "", "", "", "", "", "", "",
-		"u1700-zl30733-pps-out",
+		"altfn:tsec1588-trig-in1",
 		"",
 		"ethsw-mdio-en",
 		"usb1-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT pads: one wired-OR net */
@@ -247,21 +246,20 @@ eeprom@52 {
 		pagesize = <32>;
 	};
 
-	/* Board ID straps */
 	gpio@74 {
 		compatible = "ti,tca9539";
 		reg = <0x74>;
 		#gpio-cells = <2>;
 		gpio-controller;
 		gpio-line-names =
-			"boardid-0x0001", "boardid-0x0002",
-			"boardid-0x0004", "boardid-0x0008",
-			"boardid-0x0010", "boardid-0x0020",
-			"boardid-0x0040", "boardid-0x0080",
-			"boardid-0x0100", "boardid-0x0200",
-			"boardid-0x0400", "boardid-0x0800",
-			"boardid-0x1000", "boardid-0x2000",
-			"boardid-0x4000", "boardid-0x8000";
+			"boardid-0x01", "boardid-0x02",
+			"boardid-0x04", "boardid-0x08",
+			"boardid-0x10", "boardid-0x20",
+			"boardid-0x40", "boardid-0x80",
+			"test-mode-tp1500",
+			"gnd-p11", "gnd-p12", "gnd-p13",
+			"gnd-p14", "gnd-p15", "gnd-p16",
+			"gnd-p17";
 	};
 
 	u800: gpio@75 {

---
base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
change-id: 20261101-for-upstream-nbxv3-dts-line-names-93b121a5b440

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


