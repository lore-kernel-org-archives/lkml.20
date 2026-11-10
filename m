Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289020;
	b=tYpHq/ed7BygsTPBfWKek759KHbux0Nw3qc9CK//dqJHMs3DNFLdfJUyFZ0VGbepz6kx
	 dEcB6Q5EaObwZrDP8DDWBVoHhjFxtxzRDklojnXqd9rx/ilvsI1qWSFuk8hKjUHlUcK3E
	 Tb+1LLtcdm25OjeNfAwt22gLAbMsJ36lSBpiiUko9p11CI/buUlIIBf+N0I/04WI9pyoY
	 Mhb77hY/PfU5DYGVLZNCrn4lhZcFedEas8/bhUKu0Qt9aijtmL+oLh2CfjF0ERANkJhGm
	 i2nNeutNkzwrw9ePN+gGRCIKAKtK1gtT0c274mkJQFYcjvt175+20vTvsOgsRFG77NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289020;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=;
	b=K7U20ki8qYGmofGSjpRr/LpQrrHrAL/KcOsHE2T+B5vqrEsSM0+al4jKVcXdHOAwLSJF
	 N73I+6/0xzasUXnu+Lxwev5pu8SLXCCM+QqJUikJi0DhWasHwaUND84bqLEIak+MiLxHA
	 hem+BUFs9DWRgFi02Vsg+5M68FmKGVs0ODloO26kUABaIvbLEM9+xuAPt1C0D4ISMx/o+
	 lNshC29J/iun7b1ROjLgx2nwsa2s2v3ejHXHS4cLSVplBCHeIMfxTKxrHTwGAj2AMrtI0
	 /axSa+57oG4aNyH8Vdn3GI4OaB2k6PZMNaYQWjPkjWlppqR0or2VKoO5lPTuSa8NxpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtoVQGWy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302E60A2617;
	Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtoVQGWy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289019;
	b=oQdFCWWHXNYfQLHdo2j8zOJ1RdX4ARo1xRa3JNNuwqqHAfhBcRd1noA5NZaYCBxOjMBk
	 EOKSAzH8f8peQQw0A6xp9g57Dbw8UHRRBk0xG69fFAVi1mYS7dofYEipmWhec83ZkZTwK
	 NyOLtJIHG1jhPCL2CToQgWLgg1WhWCoUPsz5RCvUKlKvR+2dNV8B4sZ+2ZlGHoVAPGBSm
	 IGAEZFXLQRrc6Z2BhFfpJiOA96rfwX7CPP5IRR4vbcZdydbC0Lgj8TSNWqwKbNkdY0xrN
	 R89XUIzlO9KpusHLvZU6G/m4cC2vSSHfb+zJkjDQCMDzLvqCK4m9z/Hjxu84ftnFpPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289019;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=;
	b=XH8kTgbI9BEF6iuxNftRbzgUycsEDKpcwqcgrNilqCmLGkOUBbyq2Zf+HHStICbHAFD6
	 XCbEwTMHJ19ckOAcnzpmXvE+1xS0g7RwBJyUtdNJ19pXYGbh0T4OvcDDNyOHRiKflyyZS
	 tk8kYhL1NIuGLQC6KfY5uodcT3USEoXa7S+0Q3EJk5HBAp2Gat5ygW2Jk2DzngsgyvM3/
	 SZpWsRUUrQ5tsKT5JSZ6jPSTPO9jjpN2QcLcmAwEUTv46JKfAEt3FTNBCYHEf/6SL777j
	 rADmFCyCboASNus2F0vU2F++UtoJgXFY5rAiDlP1MccXkMxukKp7UR5PabgK/dhgZ6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42DA11F008BD;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289019;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HtoVQGWyG+H2eE1u+23G21EOTZ0F43IzlfwBPhvisVU2a1LGJqMZ7svYVJFahyeTQ
	 CetwImoIfOJpjkh22poV4Jy9V5JekaQ20nKpvWasCYSDXrN7OhCCDTBBON9X6Q24M3
	 K2Oqe6O1xhqcRgNYrEDs7MnBGOkx6Aqu8kuwc0gztZ5jOP7db8XpPeST2y+5lSR/qk
	 bu0ghNtDk+NYzXR3oH/dGEaOrskEBy2Mb8rsfHMgk58H++k8iceJtFGk+3YoR/Jv/m
	 ltzByfEKtDTYb7z0RjMI2x/JcNcR4Fx3vPNnC7iS3JWleLQ4pps3qTY3Qrb6CiCGrQ
	 3ZWvKvA5MJCNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D6B87488AF;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:36:59 +0000
Subject: [PATCH 5/8] arm64: dts: allwinner: orangepi-zero2: Keep VDD-SYS at
 or above 900 mV
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
Message-Id: <20261110-h616-zero2-dt-v1-5-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289016; l=1740;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=7dRmuEnXweiSK3ig6SjcXECMwYZqvp9fut5LB8gZugM=;
 b=ttxB/q32z4e2NHzx07CFEU69/tghB4AS5q2QhUQCLK8uOw4ytbMdx54PHDocvmYWJnz20f96h
 kFGjMiy3bKjCmLM6mY6LQcGq2aSo4kijAyf/fzAM3jgzVga8HEIn2fz
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On the Orange Pi Zero2 the AXP305 DCDCC "vdd-gpu-sys" rail feeds both
the Mali-G31 and the SoC's VDD-SYS domain, which includes the video
engine. Its regulator range starts at 810 mV, the lowest GPU operating
point, so once GPU DVFS is enabled the rail drops to 810 mV whenever
the GPU is idle. The video engine does not tolerate that: with the VE
at 600 MHz, 4K H.265 decodes intermittently produce a few corrupted
CTBs, without any kernel message. Only 6 of 13 runs were bit-exact at
810 mV, against 3 of 3 at 890 mV, 3 of 3 at 950 mV, and 3 of 3 at
810 mV with the VE clocked down to 432 MHz. The vendor BSP runs every
GPU operating point at 950 mV, so it never lowers this rail.

Raise the regulator minimum to 900 mV before GPU DVFS is enabled. The
H616 GPU operating points use <target min max> triplets with a 990 mV
maximum, so the regulator core clamps the low-frequency requests into
[900, 990] mV and devfreq still scales the GPU clock.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 1fdf2d3c1a87..719d6dadf7bf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -114,7 +114,7 @@ reg_dcdca: dcdca {
 
 			reg_dcdcc: dcdcc {
 				regulator-always-on;
-				regulator-min-microvolt = <810000>;
+				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <990000>;
 				regulator-name = "vdd-gpu-sys";
 			};

-- 
2.55.0


