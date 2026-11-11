Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376813;
	b=J6WPsNuXRmkQLM1zsw3FVZqZSp9mM/FVUruRX1z3SnR8z0+lgkEJiIWNmVCJqHprhoyK
	 +Jx+/3KF2xoFGKIGR2hYId52goHYuTnbpgRvm6hJH97lLxNFk2BThee9/IJ50xWdIK2EF
	 X8j4uyUmivUMoTxgS2xmmIUQJyruWaktKNmc13Oud+2SUe64vKAexdt9ci2yTb4F9CrJ4
	 +WKQwFzHWfwSG5ph0he0RFVA/K7+UI8fCGnwFzSsJ6EDDGn+0M2qwmnn7nrM02cIt3WX5
	 um1zepeKex4XdOALgTC+XT5mafh9Z6xQzBz+KTRnjqofBY8xvFGHN7RjpGnqtfu2QqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376813;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	b=oo+OEjNBRYvoq3UbQXaObfGmoMWpuJbx7HbCMgxQOFWcDg6a5SN1mU/0D7ZLVUJwViB+
	 v02ZmeBnvxl35/Phh+nmyH8TXvkyOafA2+fn6vKy4UwmdSZoUHyOrn1VVtYy3/ZKepyJE
	 T6MfldTOCX6flAOi5PqckLBY5Oqe3KX2x27fRcndQNy90OVpm5Yrtyk/+W4dPUjwLxmgB
	 1ORGFhYT6MKTKr0UAN48nlivL6VIhG6jXDbe2scYrtoCCYXuZguJUNo5ZcquhuSZ6ClMT
	 sBd1SuU2hwTEXLmeZPkpfIZCOOWxuoAQn1Cu2vfxONAKAqsDThYth4uFtbcE8TuPNew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mz64vY5J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87960A2621;
	Wed, 11 Nov 2026 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mz64vY5J
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376812;
	b=fkMhi4tLveRcxN0I5V3micrydD47uYEKqoHRlpKP5ZfnVuSAY/fBNB0WgcxDY9R98XK9
	 YHslNYQ+gUnfHjrzIWFxpsRcQlPxqoOaN8pZbpfXFuX424OQKZUZiHXGbtO42kZEbJc6V
	 yi89y5DhXuczyIBq28v/lPzgiMEn1wNeA3eO2+t65OIUY/Q45TutA6HbdR40GyYp88HP2
	 XnmjJS31rCbNczmaxw5xA9FhnAcD8Nxy81z2Tl5qtVF7BsqAXv7tYL32R6kos7hYmZTGx
	 aU0RemovuzTP3BeQ5IrnLWfOX5bFDKJfRs6qPlUkMjUgsP4IuriHBDHMa3VYdzDao6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376812;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	b=sWkbMXHBqOKersZwLNUbWhTHYXReaxxCW+QTIzaMs5rluIO8MeE1GyT/9dOUifjTrftL
	 wgtyi7WJCTFJPnc/XC91fqjvRXpI899IfxayU9ckZL2MHnZE46+wMK1CLR+g9AZdJeo2q
	 gR5xyyV4MKaq27ZxTwOBqqTiBfueH5CXXhMAX25XAl5Ixmr6PT4MtXCQ3l28LRh0H+AqF
	 UBzMPzMbkBoGyvr4LGRKdy06V66F4cS6CeylPgW65bzuBsvUrW3Zv/QPviFFl09Gl/545
	 T7yp0GkD07RzZcAYzwbvh8574nX2JRYlF8AC5yrcp38v7DR5YP2p0a39IRZTEJrMH5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 226201F00A07;
	Wed, 11 Nov 2026 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376812;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mz64vY5JhtCAR/RK436dF/IhAVCtM+1emI8/WeTT5cbjy25HPr71bbWkAzy3cnZ7t
	 BAC8RgUpYrZbDSSk3h4pljNLuN7C6nLgkDF2QwS3SV4GVyh5iVa2onnWnz/O40ILjH
	 iM0VxWMc+plkUXqm8Lh8O06eQZCNiV2ZFFJobekVmiiVmFMeCScfH+J/tlEqavMSjy
	 4hQupwNJVhK7IPaNHuWF+v9iGSPJQKRIh7lrzN0HPa4SyG8Gcn+UIlh7KnXQ+BbkV8
	 1oK1uLc6QxqqjEXUdZp1QnKRhciJqgXQJ7frYDNejDcCogRkI8Wc00mLaUJL+pjeDx
	 ziLsH9JeNVjvg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2165348DEE;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:12 +0000
Subject: [PATCH v2 6/8] arm64: dts: allwinner: orangepi-zero2: Enable GPU
 DVFS
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
Message-Id: <20261111-h616-zero2-dt-v2-6-88d8030fc975@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=990;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5MPJQC1S+CHiR8Bt9vkp2Zk5ZwEghmC4r8Nx+9ugUME=;
 b=87DXPy99NnGEeLVD0wtNkkEfGbzg7aHpEpdfOqHgzEVS3BS5k5Ps5iDC7Mr9PY0dpH9SFYz7H
 lWW2d9+2J7qDZ/kHX0wHgWiLG6xJ3+HHXqfdQmkVsCYT0/SFBjjg74X
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The Mali-G31 on the Orange Pi Zero2 runs at a fixed clock. Include the
H616 GPU OPP table so that panfrost registers a devfreq device and
scales the GPU between 306 and 600 MHz with load. The voltage window
of every operating point overlaps the 900 to 990 mV range of the GPU
supply (AXP305 DCDCC, mali-supply).

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 719d6dadf7bf..ca78d094c431 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -7,6 +7,7 @@
 
 #include "sun50i-h616-orangepi-zero.dtsi"
 #include "sun50i-h616-cpu-opp.dtsi"
+#include "sun50i-h616-gpu-opp.dtsi"
 
 / {
 	model = "OrangePi Zero2";

-- 
2.55.0


