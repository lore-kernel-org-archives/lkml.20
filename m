Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289020;
	b=OC8+n0PO7gDfkOHQE5mjsBy23OKjHlnQM08WzP1+08gL0kIakGFWyp22SXu9HSXsZ8X7
	 0JamJtXT5m+S1hXgnYwVSO296cEqYP4VwyzQiPqWGZcqxuX/Gmhg5s3ukuS/XY9l/iOjP
	 N4MY3AV3g9ywACSyL+ptjwRg6mle8dtRN3Vl5pfCVmN4V/hMmwOQvKfGzRovG3iyZFuzp
	 DZTm6JOIJ1gLmIkGc/5hlcwlT2Nn8AcTr13+/9gmP5oM/FKoPV4j9cOh4XGvyOnuh9OFz
	 EFndRkS3ohG61Xvswjfhl6VluzXq+kh0daNRxYX3vA/TuSMKJs03aWlenh/qrUFSQUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289020;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=;
	b=Sle2sHU+l3G9MB6iidqY2PdZE1Uu4WHEdhPHVXZOzy9qDmIjRDiCeYFIv9Oc5wNHSA1w
	 M93rau3HOTcPJnzFKGkTLF7O1erloDyW+bKOz5Qtt85ccwKvkc2i0rAE3vpWjFvafq1IA
	 klbSP4/ZUkqP79nxWG6sUQf5IEx9LALnH0ZRHedvJHy0TpOot9TdQtRBoSpGwRcIt57fY
	 tr8yUwPIAPgQ6VnsL5rJblj2EHYtH1+yUvh/blcbfJ587ClSh1db+Ve3xgmRhyGtXijk8
	 2Qvi2wPzbQmYB3YRWK/b3SFlShhs9RNtPW+Y64Y+ds/fY5cdNghGKCbNkg11FAjpneg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CPyXR7kK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCAB60A2619;
	Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CPyXR7kK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289019;
	b=Hh4w205b6jYz+bBMIBtQU9878LicMSgWCrml0xjhzPl+zbOkZB7xoFEz1w0QjGXdFs3f
	 NfezjxPqSHpvwY3jf31iaVINx6pIY86qkrDQRyEiXOUpg531ZvFOsxCpzGEL1tqAdcgGE
	 a4oe3MntW4FeROeUfVJGa7j0gxYuoIGbFkO7G6EPOuxXKTk4RLB7PqxNONCec5wSS2Xy6
	 GEogxigNJinSiLHD/MupzHgTbzMq2ObaodKAEcXxkhu4imp5c5ocjRn9d/yBA063all3U
	 L3iz1h9cn5SU0DR5rBWBBkDbGJsqiV0K74QsilxW/s+B6owIzJk2OT/AaN3C36X4I9Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289019;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=;
	b=ufBx2tP1MBRxuSi3Izd0kKYJq9Wf/0fV30eQ1V557laVTGBsjrEinMOu1CdssmypEPra
	 q4y98HzpogLz3gHUBdf6UQsKoVPoGIFCkK394MQGmUzJLsU5/gtJqAXDXFw6sDB5sRLqD
	 fDuUi1s1b5KrojheUpMJX8MN7RVwU6BgEiRgekFNd4YanXxwGcoC0PRsfHiUNt0hYYvvY
	 +ha4hRUDhYmlzSNphuHFNLUguK9z0/BD6YAO4RDJbhmTFs4xYRp7WcYUJjz0IjTgzlF7m
	 qSprrUUHAT0bzRPFvWo+md779TUpn+HcF5V/d0M6/cdzFzr5Vf2QtsXx4WTgqUZt3CQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B489C1F008A7;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289019;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CPyXR7kKKps35e8yi5LiPwrlyPpZzEyViRBdGkCPa1LdzPqaybWSWDPk1UNNy3nv+
	 Hy8Y1R/EyjRItK5U7mkW5Bv8Po7fJ26PluYwieGfM5Za/AHS5sfl1JlocSJRuGyg58
	 1zrLSWttkGWjjad0tQwuEDfGBOXa7DMe6fIVY09X1RtZQARwJ6FIE8kYj/3M/WwVMA
	 b9hdDEHMMBNlkbFCWZ1i4fsTmbxrZ9ZurxAUGZA8ePpmLghX2cp9ub29lB5kNnAg4m
	 vEul32BIOCRdBJU+4T4c/IJpkHt9L06396sWcjry3aYJIkE9+aedyUqQ6k/QFzqknq
	 8qPyFLDDYSP0w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17F15488BB;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:37:02 +0000
Subject: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
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
Message-Id: <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289016; l=1421;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Iab2h5Ns40ufO6oTUc6or65fgVwB87DFnCvwebhE2a0=;
 b=7jmDunNjfJz90BQbeqlz1pB1bvz0rEa1eMYESssOimvG9Ewiozn+umcp8upBV0cteiUv/r4EW
 e2trVdap+hdDQLMp7XIFDen3FzeqDFYYAsFvsxlLxQu0kJ67Q45BO3d
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The I2C core numbers adapters after the "i2cN" aliases and hands out
dynamic numbers, in probe order, to adapters without one. The Orange Pi
Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
for the header pins gets whatever number is free when it probes: TWI3
on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
changes with the set of enabled buses. The vendor manual and the
vendor BSP name the buses after the controller.

Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
changes for buses that stay off.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index d5d39bac5915..98fc83291dc8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -12,6 +12,15 @@
 / {
 	model = "OrangePi Zero2";
 	compatible = "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &r_i2c;
+	};
 };
 
 &cpu0 {

-- 
2.55.0


