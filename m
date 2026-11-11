Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436999;
	b=lMQH5KqGWxqLlcUJtiatmRcu9sN7cUvNlfJ0wiUXIG5eP2dp5Tl/5d1NIUBqxyM+QJ7F
	 Ztvzq56JwlfT51tfU/J4K4FrXoq7l6I1d/teyCVBuhNX5tkz9aEw2U0CIbfnDyMNSa0UT
	 D6tZ5Y7zQJjYHbGLpWLCAtQS2mNtxtygHnHWwCRVloY0JPU6Tt1tdq1TO3fDJJhZZQz+c
	 utRKqpejYBmX76cH6oMslxMMTAYEl+aX8oKJ9WZ+rl+2pyMMwNb+K/49GHHGwvQMjUxSk
	 54ijtio0eQU5E1JespHTNdBQAMxZ4pe2kpn9gZ4WL5/vJTMO1+OhIBqNowoDBZzkSpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436999;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qPjiFEL/KvMKPxsB3qj3BGsroSuozksKUttzqOJzzek=;
	b=sdzo6Cg6e3n7jugC92HfR4z66/T0UzQut31gLyTE9PAPiMfg/g583IjC7W7d/Hs73HoI
	 bpKO0dlUZn+F8fnjRzOr+/q17Lx1FW1BR+gl6+FQtxF5094voKuDHhyQEHzgDcubaMxcu
	 6m7rtRbTjCkod62tSp2S1P1lsta+cwEPFG8hjkvMXSI2dtHcR1CYZEY9I03hKR8LRgx5F
	 jlVno8/7TSbj1EO1tm1l6OrQCqIzlD8OKcqi6q/s4dd0OYrrdetLq/iSUXJRetNPgsZ0u
	 kS8WX10zznAsOIyJhgShJ86yCf6zVvCYUxwKJ853jfx/0Vc6o/g+zXwg2ISeJPXan6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=We1CzFn3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3560A5BDD;
	Wed, 11 Nov 2026 22:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=We1CzFn3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C88E1F00A05;
	Wed, 11 Nov 2026 22:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436998;
	bh=qPjiFEL/KvMKPxsB3qj3BGsroSuozksKUttzqOJzzek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=We1CzFn3BL1WrJhdH9qzHLb1osxrR7Ct1iNxIYzDWZ/5LIppsoV0zRmk9Vw6zvt5M
	 9B0wrQDl/VUlIX/E7EQlpHfc3yBPnzo2ndFSBRiHUuLe2nx1WMW7cS5n8FwXeVdVt2
	 hF0sxfNCb9T0f7a9DM5fYEFW5I2gVrVRJmWQabtcm2geLxrgs9Z4BJXDOvo+Gwx5J8
	 3v6E8q84gWWZzZJ06kf9JGpKiUqSNlDft1dZ3MQfhTlT3v0HZ7XlN6lsz0ExmSbtcm
	 JN851I8IIMXrXSMBMxvTv8MUD1Dirp2BsJrEcCzcVMKJjpPr91hf+tnZKCzc7Ai8ON
	 4k0uOIhfj5qpQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:01 -0600
Subject: [PATCH 4/9] arm64: dts: marvell: Drop SPI max frequency
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
Message-Id: <20261111-dtbs-marvell-v1-4-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Remove spi-max-frequency from the CP0 SPI controller node on the
CN9130 SolidRun SOM. The property belongs on SPI devices, and the
flash child already has its own maximum frequency. Plus, pretty
sure 1.8GHz is not a possible SPI bus frequency.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
index f95202decfce..7200f72b934f 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
@@ -106,8 +106,6 @@ &cp0_spi1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&cp0_spi1_pins>;
-	/* max speed limited by a mux */
-	spi-max-frequency = <1800000000>;
 
 	flash@0 {
 		compatible = "jedec,spi-nor";

-- 
2.53.0

