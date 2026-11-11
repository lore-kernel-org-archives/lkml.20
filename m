Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376810;
	b=ZvZsbvcuA1aDdaMTrPjZUnhjPxMKIEpjTdz9XJLXQIyNGBGkhYk8IGx4rWbXZNpxit7m
	 +FuOiu72lvPPRBpvXpmzvKZucF6+9oHEX3u/sTuWivvwtWhxPRDHxpBftsy+pXY2Rl+E9
	 yIQqMxEZ/UaPGx+3//TVVF4vcgAKAkPJA5q1pISIdqbfmKqwEtFLR2IfmoDjiyxmB1Q+T
	 KHVeonQDPmM3dYmchQrZaeTOjg4Hsiwpn6GEwvLKDKMJZEKFclaliR4o76kDfayJ0UnAQ
	 P6WyCRfLWgDNkCQwYjqjeI7/G/mjFkCPy0HF30xD53IkNiIxUeWh+qU5om4fP1iDSVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376810;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	b=2ooynnasbAOLp1Ylzh5l2Kupv9kRxrQ8jeGq46REvOBKPrVMJSZClsbTO4MjZcKKxrkJ
	 JQYbXgaSeiTsrJFsob2pzaaUIvGLf7NhtaaywDDLgkcQmOvH/hMnr3dUQWArtMnGw1OxR
	 auLjRXpmcWNFFiBelv5YRSMF+kRaTO3JikJ61ykeIw0oYiGsuCLl9Sx69Pn1gr+HxDFtw
	 gqSCy1Rxdo7TVbJE1apre+yLJpNd6i4HhJUXbhsRCvAxOiZOxQfauCakgWOhWoeSfWEE+
	 HtXdIERmGJ/nRii4WVWELrl1najS6MKT3+o+m6Z0NisaqLEZrl0n4HpBilg4hyQhjfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3hGA8kw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54617606A333;
	Wed, 11 Nov 2026 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3hGA8kw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376810;
	b=X1gGQGRSsQE7EdiDZVz9Kj8amXxNX1DGKAGJbrdb4cg25KCr6bG5uiPF+520qJQUOePt
	 nOF12zmuNq9Vm5LIS11v/naAAn43jdLR7Uf5S7wcQrIUkmG/Ex39chI5lrXGPgI+FubZq
	 2Hvcd5HeMsviUsZ/jxzc7sPSTKXJRj0C54+04L0wVjOfTPR6K3+po1GPQ0HHKZFj90z0D
	 Z2jaNnISqdGMokiVuqQj7PJOSzF9Jris4L2VxI2ows8rGaqR9gku/1tteYfMKlZQ4CD4I
	 0/aML6qhX1qoIaoGNDktCncERVTaYU1HzFkG1Z9hrZEeX9j/q1gqHYOHfLyBAvNeXkQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376810;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	b=fC0L6E2T+Kww7c5T2Op0cNUM5OEeavxNyEyrc0I/uc092TMBA86CoFBGWQUmX9KOyuBS
	 84bI0O/8SuOJ0P85FxqGLlyPJHRF/u94y2ifaKlZ25iq/aINebpqQtjUGTQsH4WMXaGlm
	 nEsNDdsiauJaRdph0wGYxaQLk0ib5qIUDZ5TTqzkVo1NXrMFyR/IUooHYr+h/liIqanJb
	 7ILldbJF3VTfYUJUwPqjVNlGK4vNOkBGGZ2bxJ+PFPlgSB7P1NzAbb+NnyUSpARj0I89f
	 hFyn+Nao1tmcbXmnsLv6dDvpOWdAyHc8JDN9WNJf96wn4PDoUEhU40bPvNDp+OJZ15g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C4721F00A08;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376810;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=P3hGA8kwV8Hyb7ZUQe/W7phZcnPAHLJH9GNkIrKSXi96eP2vmSXbRDLmClVkW1fE7
	 GDudTZX1fKXBG2RmhnW86GW2bjAUpgUlzjz+Dxq3+00HWOPLBXMEHz6uKIZCKtRUId
	 7MdqMr+vihNwRsn3RW+SSLoIjCuvcLJnZ2puar6U/kbHqEKxcpC+Ql3UCkxoQtdvDn
	 vqM7xD8/RNdctboYidHHTNdkMhZrZIMKfnzbaelQIKX0pz4dUnz1OljGAB6bac/pvJ
	 CRE8NbgBlvKvNpxwwvwVmRLfVqL7yWPR0wrUePcCfBvaK7cpxgednWYmZ+AEXaTJal
	 4od+cadUpfwWA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B6AD248DDE;
	Wed, 11 Nov 2026 06:00:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:08 +0000
Subject: [PATCH v2 2/8] arm64: dts: allwinner: orangepi-zero2: Let the PHY
 add the RX delay
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
Message-Id: <20261111-h616-zero2-dt-v2-2-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
In-Reply-To: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1923;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hgTnawt6aimtaYNRLXqSLgWoRIBtKR4Hz80cKcd5MZQ=;
 b=rJDt1Z+hIOmV2HpihY42r8mfiUSAtj5Uw7oj3xkPckWjqYiN3DNOs3d5wkuwFn7Qgnk3xkql1
 74YOR/oQxQUBlDDqpowj0gyIg8N53bVNxSijNzHPXZnx5qI5FyA/lUr
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The Orange Pi Zero2 describes its RTL8211F link as "rgmii", with the
whole RX clock delay (3100 ps, the maximum the H616 EMAC syscon can
add) inserted by the MAC. With "rgmii" the Realtek PHY driver also
clears the PHY's own RX delay bit, so RX sampling relies on the MAC
delay alone and sits at the edge of the window.

On the board this shows up as intermittent boots with a dead receive
path, after cold and warm resets alike: the link comes up at
1000/full and frames are transmitted and seen by the peer, but nothing
is ever received and the EMAC raises no RX interrupt. All EMAC clock,
pinmux, drive strength and syscon registers are the same on good and
bad boots. On a bad boot, setting the PHY RX delay bit and clearing
the syscon RX delay restores reception at once, without a link reset.

Use "rgmii-rxid" (RX delay in the PHY, none in the MAC), as the Orange
Pi Zero3 with the same PHY already does, and as the vendor BSP does.
The 700 ps MAC TX delay is kept. With this change 10 of 10 cold boots
had a working receive path.

Fixes: 5a378f9f2b15 ("arm64: dts: allwinner: h616: Add OrangePi Zero 2 board support")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index f2e3300e078a..1fdf2d3c1a87 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -18,9 +18,9 @@ &cpu0 {
 };
 
 &emac0 {
-	allwinner,rx-delay-ps = <3100>;
 	allwinner,tx-delay-ps = <700>;
-	phy-mode = "rgmii";
+	/* RX delay is added by the PHY, TX delay by the EMAC */
+	phy-mode = "rgmii-rxid";
 	phy-supply = <&reg_dcdce>;
 };
 

-- 
2.55.0


