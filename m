Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289020;
	b=tMI5JUvS6qejNQcUXniOopxHwTGoCQBLbYtQFdyaYNHlQBF01rGYtO/2PKN1et0PzVKc
	 L+bA0nOA7j8PchNlOrlxYoYOVn+1A8Mo/TqbGMobKAHHlI84Zy3EZGXkphUT29E8wOKzX
	 5pyyQPixrh6vfEYP14Uhno/HfgioiYcw9c+TaN+LdMJYSeHAX2/IZSS/eEWa7kw45E4x9
	 YOm3iTuvaRxiQX0b7e4PvIl/VNTD6iDlluKgdEjJSGVUhyDWjCdqHNgZNIG6ox5D/q/VW
	 IgY8y/mTVOShajuHjFZxuKtmfd6cLFw6ltWGfGaAvVKNaoMI/eEqKfa30nmPE+tqDvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289020;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=n4V5rICDrgCSDU0IjgaByN+ZSieO+ygGjDFPnqah0Xgnk9/beqn9TyVD/A6+KkIdocDJ
	 9pKv7hx5emeC9JwWDeJYMFoPF7tQeE/yrwAxem+Jk4ApXeLwCrE0ssrB0hMeTnSa+U2Vv
	 CknAsT/+ya4SwWyNXfEj2jBhTKelD+CFoeg6SQXkRzSruweyda0Wa8jxy26xVckO5nBX6
	 7SH8/tCVdWfesTYKbte6P4kCuTe4aWEx5XVs2gWtauF0JnLZU+yytiEHDrbezjlkhe044
	 urITrqy3zAfhoen7X7cVpSHzSv6/KUQw8AUU7OTwVTKhVrCdsLOWzwn3B6tLqdQbJTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="auBiWIK/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F9A60A2616;
	Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auBiWIK/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289019;
	b=szjmGzYmkoQQ6+VT/BqSkZs3XC12I/Xcmgh7vH5RjAakeKZJfXe+pt47SVlvZegxFdD/
	 NyqQIxav3wgCGu0MioL+oR+djXfSOoHPrj/c1bH8V9jwygBT6Gw1YaAEbON27YmhSWrB+
	 jvPxSd9tHi0LDQgjgMcalddTudPw/cmNEt2jQawrK56akETVmc3TKB7/b0E/Y09eWQmAT
	 gilyWKLF1GVDMu8mRyQEWU4/vXInJcP5WVwpB3owbW5fiHIY8FYOSjIikMwTDLlUi5MzL
	 yqVvfND/KOh7c7mh0OrP7i4OrcapqU64WEeqiJYY7OWWkIY3qmiL0ES8qKmt4RNhtgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289019;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=kCvkiAU/AE1brdStBY096b5jJkpOV5BB1EU8LXRmXwsuqRQyAh2Dele+Y+QBfAGl2lf3
	 mGUQCbHRDbCNe9dJjt9XUztTZv2D1jGGY43r3RmZHULbR9yWEUDquKjKACiu76AvbFKPJ
	 RvvPvI/QMJhcTDksUkDFJ1P2fR6RYtzuFom/hi5LXcw4EO9z314Z9vdyalYQ/d5J72b3r
	 JuewlqiGS5v2zsaa39DUhHAGctRgDCAB/9q+Zwcrmyj3QMZpX86VwVo3LX8UJn7l96IZg
	 yRkwqcU5gPWj3IlPgBqQ4YLRsgJtFNMfjfcaY9i1PzzZbmSb26fSm+LaBzlVUsl7fmQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE6481F0089F;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289019;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=auBiWIK/Jn16hGySQivLe/h24YZibN7yRCeMySbCLrQe0dN8TW1JLP0amCqcuzBPn
	 ugw86n8fmV8o5nA+qMzyJIDqp1NaqGvdQCGezZsKFLP4fl9SG4gOmUQ6hsCgmEGcPl
	 cn7EW7922kg4x9BGcFLhx0F4ZDK158Qzg6aKENrAiTkRomctusd88ipTJH6cpwMvQ/
	 sdtKv7OyHjaMq2JTK1SgoPPD73wQGLh67j1PuS527aa3WtrhxPbmiqo5IKvSbxcLjm
	 t60ztHikMoWM0Oce3MjyT2OfMdVwUkOcgeji9ageDwp3nFbfO60/J28Q+abTSi5Fs7
	 /qBJgJMnyXK+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 06CFE488B7;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:37:01 +0000
Subject: [PATCH 7/8] arm64: dts: allwinner: orangepi-zero2: Describe the
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
Message-Id: <20261110-h616-zero2-dt-v1-7-05506d760f21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289016; l=1094;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=koI5LGgxBRvtt44PpABti87vN3ELbNOlU9mgjrDscGI=;
 b=oEX/FmZHomOl+iCF0b554Eyi8+pe/+6f+ODCdqu2Zhe6vCVkvYvrYRcVVLfavogj4oiQNwsSZ
 W3LvZ2qsiTcBsQOI/ypPhTSrc/bhfWnmpOtEuumRepx40D3QY9EsSM4
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


