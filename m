Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475354;
	b=wOBquxBmwWGpHS5ug408758jbQVK0Dr0bomid7XUxJPt58+ZQ7Gttc7jb6Yvzv90lz0I
	 YgKWAQH3aGeo9y97ggCOvFw6/hXHxWxi05dvKdBF0cRl46ooBlFkgtX9pEW+hbWJO52hL
	 CpGmT3x6s0Xp4aLLCwoh1Fau4FRosbh7W8h6K9jsao5dEuC33n1WgANO6xnB9cK/ejyET
	 SiN8Ckv+0rfgQY70S+2B56u9F3ny0E7PXtuZtcXcCmDougbzKTl5qnFgryIKbjmWztDp6
	 t1iVz1edbhgUOqrgkJ06+CZw+KYnkNSQLMpvlU8e20BICOvvHA4+61ebGHZGvHm273w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475354;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=agJfQqsem+V7QkRBWdSlEER11R5kmdth96KSiTZf8B6xOIT0yCyN+RF2Fg4Y3z5qa5n4
	 iaTPhjCsW8t7Dii45xFyJr4i4Hlwd6d04sCchFS/S0vMDPGxfH2G0yVR4Aoh2SpVi/wkD
	 kPJ+4ioOP0sQXfAOEOd6+AR9cqMSvuM7AHbRn3l7x+8Cdb5pvR5dQx8vyLH23E+xcjr4y
	 rgBwdqifAbcYdM/g1QTl6fttdpJkv83b3xDiipF2EqoP3jYDbxBhD/EfQjKMCrrjG6f2Y
	 bic2FtLpHqvAW8MPETit4ay2cqHULWtPOjn0XHjEQjAVV1EdouFoyCbJlakhbia7j/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOCsxfYX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B4606A8B0;
	Thu, 12 Nov 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOCsxfYX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475354;
	b=cPqaL4dhdozxyZB3qvOC9h/wWg7JoQovAOCr2AVieIhV3L65mi0Lv2boibqG4hBjl0RS
	 ETuw6pT3m12+l5UNxaTN0PlsxkbTyWcztl2PFbLTrRoqZu+FUXg88VnMO9A7n5CQkQeQc
	 aaHqYzImcDaQL578LEN1iymPR3hB/CWRvez7hQ6V7AUNp85vGs1rp1Ahp1xrUEU+xyhoD
	 jtMlxR/yVtYn7mlBBlCsL++8fqLqda2y54WK+CaKLCG+I9WBZTN+ge5IpOhnoI+E/SLdc
	 S2QtZCvxZfTxUzjbn5Jl7a30RB0Vj2bvv8WhNtA5A7BbSM02A8zg87nhnxGVbXBQn6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475354;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=y/amPLXjNhSqjzuVCTDt6WlSlUUaO5dQWfPfMKjKDVfHWSp9IhMXZW8gA7i9kN22qawJ
	 RF1mWqKFeI1IC6TTq0fRATQZWrv9MBiFL+SJdTL6xILVnBXa6fIiA5wobUbKziFpV/dt0
	 qSC4TKFiOvBF0Moqv73WN6rcvkxGKkZ3jLOW6RVPt4fRZOZ4T5AFM8NQeDp/CpcbbNM2B
	 MFWH0BqfSjfoM+5B5BuGTLnyZIakVTlBELn0gAM5xmmU+qWjB0DUpnrxNx9HXTvL3sbIC
	 8mVyv1qw1Wxgo2Y3clN8YZTb1nAhWOJDi0kZ1DfzUxCT0hfKb2DDz1pF2P1vJm4muCQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B81AF1F00A05;
	Thu, 12 Nov 2026 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475354;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VOCsxfYXZ9V9V4BgwYp92CooSN2ep1L/7nZtHNFeC3bBzVMr0/DtZ3jzaGqjh04Qn
	 TAfhoIDOudT47H2ytTtqhR671btFQ02zdUJBsNItIbReO9LR/SXj5jrP5v+ihWGRqC
	 nLyT322CU5QhcCWDivzyHss7ORsMt9afe1zxlOG4gQOovyaqckZQTnCBOlvL7fa7HX
	 zHjwiwUZ9grBF7LXyPXYiGLPjF8+63EfO6qm6LvGl81AISU3iIYp5snKduz6V2UXju
	 SszXxjSeaSBiyFPOe9D/fHvio9U5j6JuHfbkUGkYMm/VonWuD9XGF+A2HTbivufzRe
	 cWdqI2x7bwz8Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE71F49444;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:37 +0000
Subject: [PATCH v3 7/7] arm64: dts: allwinner: orangepi-zero2: Describe the
 SPI NOR supply
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
Message-Id: <20261112-h616-zero2-dt-v3-7-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=1094;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=koI5LGgxBRvtt44PpABti87vN3ELbNOlU9mgjrDscGI=;
 b=bA8JUFUa3d6iI+xHYYsxVNtM7HtovRgLm6fMnexLvlvWB6RAVaZCH86+PEpzbGK0qVtBhrLTj
 HJSH8S9WM2rCVT3L2b3X1uZ+XDqyWMC18NABBNlthwVONcI+xmS43a0
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The SPI NOR core requests a "vcc" supply for the flash. It is not
described for the Orange Pi Zero2, so the core falls back to a dummy
regulator and logs at boot:

  spi-nor spi0.0: supply vcc not found, using dummy regulator

Per the Orange Pi Zero2 v1.3 schematic, the 2 MiB SPI NOR flash on SPI0
(port PC) is powered from the 3.3 V VCC-IO rail generated by ALDO1,
which already supplies port PC here. Describe it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index ca78d094c431..d5d39bac5915 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -148,3 +148,9 @@ &pio {
 	vcc-ph-supply = <&reg_aldo1>;
 	vcc-pi-supply = <&reg_aldo1>;
 };
+
+&spi0 {
+	flash@0 {
+		vcc-supply = <&reg_aldo1>;
+	};
+};

-- 
2.55.0


