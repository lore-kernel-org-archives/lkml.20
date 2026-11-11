Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376813;
	b=dGvh4m5f4ZErL2DH6gdE6jmS+xO3zZRPwO/ZH3Elh288EOma/Y7Svqvt90tYHbrZbQer
	 neay3ixNOI1mLgFefS2eCE4Jyj/XjSSt7nnEmK3rs6mP6/+jO7X7BWiUFrZt5RuC0xPur
	 Jyp6IRYcrY0gEt+g4mhmSqyq5x9fZT+qhGGLqCN9m4EA0f9IuhRsjqS6dm6zGNB+cVZ6s
	 4+qNzOFFtLNOdchxt0ujdnCmZA9y9+AB3RUTu8mHoLhbn4M9VxotghIDYuYgKivYvXCne
	 tN5OxlP7Veg62cr7o6RpcTWTKd7zRAeOG1P+u9uPqssJHfeHfdIvbVoBedaDyFlXsOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376813;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=jlCjVTtYcDJV2GxVFzkI5+sBCCmm3HpqABdRAtlcdIMHZhzUPkX7TagyDBFzNkPDvNDn
	 Ozr7jnv1Pi6v/fRRUwvB8+zSVHmZVpMjq7HS7DnY86lCkzylaa5jE7F2x/vjGCBHJTf99
	 QWzVmj/MboXqGh4S6Q8gdopukPhwQaQ3f2PC4tWD8rcknpU4s1Hl8gnW1yXreM5CsyICd
	 VQaKD4euW9hzz3a+pQ4JMmeG/SF2qV6jInnAuSe5IuIDUbjYn29qxsWf9IiAh4xFafWNZ
	 4ZbhBL8Ttb/X2P1nKcgB31yuWXOANwOwYiWIGuDGFE1ogCpTzoLRdHXEcbq7w3x7Jwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CpMtYLk0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3962660A262D;
	Wed, 11 Nov 2026 06:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CpMtYLk0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376813;
	b=tGluTC7Q4yGRDyL1UX8mXkQrJsOH687bQi1Ug9Auz57rXBJB34pNVnujEGVNbAvNlTN7
	 +NkMAkGGtFeBclLCbFZaSrY8TBWyMTw2Q38MTvDYVzNLkpEd3Jxvv6+axnVnsBhNefwSd
	 Lf43UMoZQaRO7TS/rqhWCwd+KJ4RMjjMNopbX0H91oykvkQsI1UNTFIj4XGNm3KNemKWH
	 AyD0nqzOI19OB0T6+WkgMeNosFRZRCFXHOJqToxyBGLF2M+etZOQbsUBoYjlE/R99h5Ce
	 r8nuXe3ifGjnsVp2VjlGzFnBlOo4a/GRYX8ZxXwaXnX89l8cgp8lvznKZo6NqZYTebg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376813;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=hcLR2NzQ8e9hr5FEhmZr7iujlp3A7dBwRMesUWQrlGNFV5dI3fQbyoV/oWTJODUjzaka
	 DaWPPqOiSs3Ev4pEkWIIP0lbwToKAkevzVmTRzKAdD2VzRzuWYK+CT80Yu6XUo4hO+nO5
	 s+vR959QxlnxdGjN3X4crVGncXhQ3sXYHlzkFrbqwSFcfGWkbedMBmmP5MdJGotkjkSbd
	 iwGnueOK3O0WaCxlyaLVa1NFlrr4u3G9JDSeZNqDLn/spzpPjjSZZExmT5YPsjSRP9IqU
	 6h33iCtwEOxUy9Ia5gq8FnI920CqPegSlIbewFlDJkmi0Mi3vB0l4rFcVot9J/ycXaQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 287031F00A0D;
	Wed, 11 Nov 2026 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376813;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CpMtYLk0SZ9JMGD0MaKWfupCmjfTL4UZxIu+tJNYjfHMMtk8iDthD+U+K10DX9FKB
	 S39sybRTWFsQJzmA8JKiwZJWGlRiWgqCpr1IOJJz8lI69D1nydoAvn0u5vBjYy+0/P
	 KFFDD0f9A3X91vD0rxDc6PaZrSoGzchxmAcwQYeVni+Tz6lCXcQve0ZJvCZd0ni7xb
	 +3dZqvjXVz4xsak8Vz639JCroDbt3IBdCQk4m1L9Cye4NHVYG+fDz1gy2J4qHR8U10
	 ayitwyv1G6hamtiGlLB1ZWYO3pB7UfrumYqLFZMrLF0P65oe6mvtZs6PLlgr7n9WeY
	 8+w9MIp4TujIw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 323DD48DF2;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:13 +0000
Subject: [PATCH v2 7/8] arm64: dts: allwinner: orangepi-zero2: Describe the
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
Message-Id: <20261111-h616-zero2-dt-v2-7-88d8030fc975@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1094;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=koI5LGgxBRvtt44PpABti87vN3ELbNOlU9mgjrDscGI=;
 b=2CQ6LDVGiv2EC0iUm+5zPuEgt3Jsm8LTq/f7YbI63awhqKxYsof4T27Fn2j6wOGkMLVOM7DPJ
 eMOEMt+5bvXDriM7m6KvXhv2+ATUMLPbg+hEE+04XgcFP6fPzmtx84C
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


