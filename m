Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794602277;
	b=sEhHJ+ezUdksdmB/aPMUWufaW2N+PcU+MN90Y7OJLVR20GbnBY+/o5ahhgtozpSzQPYR
	 mhM8n+o/hL4GUghQL6bdKvBaQIfnjr4q51RoatQ7EeNcHw28F25NcdoLdQRirYl6LCuoK
	 9E80BHFI3wxw0ZhidEP8QGkGwbcMwvMb/s5x1Llbyz9gtdV2rqPB/6cm5PzAmQl1jNtN2
	 9ItY30QmgaOXhS746X0B5T19tHwcXgNlJ49WxtpFAgCVzcQ9GF7x3X3prI2AC1iNW8P6L
	 qUTHrnbCl6Ot2wR6w3BQbLCChZNZwLgxakqilIMFnwRio6N8nJufcBVi1oOPtEcaKrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602277;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zcbGexqUs6AyY6rvNjsjQJWCSAAYmXVOXmh3IdhOCBM=;
	b=oLdXhI0C2vUk3wwmBfxKldVdQG7yUsHAmXORVdYJfF2BzIXX3ALOZpxNZcp55awVALUf
	 XsDzk1Lfr8J8IUt+h65uOpGqfX7xXiVD6vqynJcToBFEMHAjZsdUTmtV7cM+eEFXJLske
	 U1Sl2KMdreGXJDLTxc5FuMKL3XKJCX1gYVxeJxYTh/YRtz3oiBJX+zRvsY9LTgTfkC9oW
	 nJUkzLWbll9nhv7IFo4jd+KDhRTrTjikuiy7VLBPiSbkzbtv3ETsz96FgahtuDML9SaH5
	 dOWFpnR/IEdM2B7M/L5gF1NZd2J5yGiiX80gjBdhQvrcFC/Rzt+qK6A1aehZnjAlNoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGBrgu2V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8DF606A882;
	Fri, 13 Nov 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGBrgu2V
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794602277;
	b=v5BYhPzNZkRqAgpV0tgR3NYA9zY712vFNSIjr1vcgGzs/FfA+/wTJ9XoJMlm9wZuNMIJ
	 Woop4HL3uE+jTYrhTOMtZfBebkZTw7HOKafeCpCQG+fjognYg2iGVulrCBx2Bk5NeJx0N
	 cNjSChLc6s4NUR2LWz35VEhqdbtfe4rY7RcMirR15bPw/8pfkPLv0lAf6eu47FkKHcSKH
	 3hKzq3qgTOlSK9FOx00i7HQEFwDsGwYFIRzeoZkrIRoj6/0buFc0lJVw0PNcqn4jLXODI
	 p7zLOw12uQ9M1/MF3IdRswb6sYX4NwDgM795ymSeUN4fI3KxMiQ9ACtqt53UGYGy9VA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794602277;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zcbGexqUs6AyY6rvNjsjQJWCSAAYmXVOXmh3IdhOCBM=;
	b=1KBXuMvz+W9nyPwHc91KN1255Heq09pcKu0z2uiU0tqAQtFenc4aF4MUi4KZ5vvOqGI3
	 WgF+qXYViPzsCQ107/noPqByuVG44oaWp3jAvoaWsvERCVtHBstFvzunOfZKGlcKqR0u3
	 Q62EpMnp8114GJXA6M2DmXexRUQjOW9EeOMl1rjL/susk8kEhtdP1pN8Uy/00/nuehu+V
	 9I+9I3XZ/YIUdMtmFgo6AL03LW9lOPqFOKIFrI1rcjGhtP8otgTcGKlX32oZhK2bgqIRR
	 h+lydXXxUPNMYfPhmAN9Y1PWKInnesG/10/1I9z7nbzFsv2JByemuhdYaw8D4/qmmdA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2629B1F000C5;
	Fri, 13 Nov 2026 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602277;
	bh=zcbGexqUs6AyY6rvNjsjQJWCSAAYmXVOXmh3IdhOCBM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DGBrgu2V0TLeGXO57K3WHeHX2F5btUEhAsCWTruq06By8FEhHvvbN+D3bcP/cLffV
	 aIJTWEltyJMpkPIdGeP42pQ+FXwMbLbViG5/0Esvzotav9h9qanrGu9Zufz/texXqt
	 sCD+qRv9tyHgbVb/ycM2LjSAmBma81RXnZcPdmaziL8B4iNeNEVCFPHJKQBXNj2ZrF
	 qGp6XPOTKhneJCNPuKbKZeTWU03h28cjnsR1Ccj+2IYIn3OuOh5HCLPrx9wmNqGd5f
	 Vtn7g66g9wNEH/yk0ua671FVkY/Dzw5RBqLDREOn7x9IUmKlv2eVC0/GVM+MAPdR+V
	 e9vipkOnNOeaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7B09D49ABD;
	Fri, 13 Nov 2026 20:37:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 20:37:56 +0000
Subject: [PATCH] arm64: dts: rockchip: Fix the order of the RK3588 AV1
 decoder resets
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
Message-Id: <20261113-rk3588-av1-reset-order-v1-1-d73f60222ff9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW6gcTW0VwkvdvVUU6AxYxKI7
 +5Wlx+H86/kMIXTuVjJsKjrNGbIoaD+HscbWIdsKo/lSUQC2zPUTcNxETY4Zp5sgHGq8h7bOqY
 2UD6/DFf9/MKX7m9/pwf6+VujbdsBhO9S/noAAAA=
X-Change-ID: 20261113-rk3588-av1-reset-order-b4261a95ab93
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602276; l=1508;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YP+Ju9QjQfuU0YGwfWBljQdLr0V0QHLGHZyAd+cCC3w=;
 b=h2Y6s+lUrSYGVaonyq4DMPUpiqk68iJw40e55HnQ6t7RM1x9PLBQhBMoWYd4m+8wB0YLKqp18
 ZScq/59KbGvCoQqS2b+yERSYY7jGHr4Gf+2ESpKOOVfHH4VqwHLBUul
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The binding lists the AV1 resets as AXI, AXI BIU, APB, APB BIU. Use that
order. The driver gets them as an array, so only the order in which they
are toggled changes.

Fixes: dd6dc0c4c126 ("arm64: dts: rockchip: Add AV1 decoder node to rk3588s")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Found while describing the same resets on the AV1 IOMMU (hantro-robust
v3). AV1 fluster on RK3588S (Orange Pi 5) is unchanged (203/242).

Developed with Claude (Anthropic), which wrote the code and the commit
message. I reviewed it.
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index d0f364547ae5..3d1e4369578b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1471,7 +1471,8 @@ av1d: video-codec@fdc70000 {
 		clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
 		clock-names = "aclk", "hclk";
 		power-domains = <&power RK3588_PD_AV1>;
-		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
+		resets = <&cru SRST_A_AV1>, <&cru SRST_A_AV1_BIU>,
+			 <&cru SRST_P_AV1>, <&cru SRST_P_AV1_BIU>;
 		iommus = <&av1d_mmu>;
 	};
 

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261113-rk3588-av1-reset-order-b4261a95ab93

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


