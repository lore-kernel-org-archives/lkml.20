Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399305;
	b=wsb0cs4PBoEGcSIN+NFqxrdoSqZU1s145ehz6bccGyviJuPqpe9nDa5fGlTcIsJpXDBI
	 Ux/n20Q+0adAaEOsv94ZmYxjJnmErMebHzTYEEZTcGSVNBnqi/65c9FyF65vs4N4epiK9
	 s1/l9d/o1p+5vpNxpJy34rjtqPCfiYoECOnJkANVB7K1vhMkaM5r852dW0AZSRQeH8I+G
	 YGw5XPz5ALZIVD7W/QXLWpR0IljY6v0yqR8ClBQH23/YOjj0K1+fpmqzCXIv0QiLVpWta
	 lrf25SYP8Qsdbv0Q9dTJpIMwOjGHpOEgxVrbDI1n0OZlKEfyAyCx+jfIV5QSTM068qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399305;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Mailer:Content-Type:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=mwUJvTtyC5sbesnsFwyKi03f4PynGWBUu785Gpys8rE=;
	b=hrFTIBavGep/8eRAe9v8xjucXVVjndKxLDJ3Ycb/wgEPUh2H6H20kCm+MaCryna2iREn
	 fIfM/o6isOhMhLMv+54Mc0sp51rEWbvT+PnpfdQViUo9kDxQlySE9FWDhSlg6SGsvCy7x
	 5fReSTXpH99ro6pkBd0cipUPFNgsjbcEw7cLL78UjBW8FKy7MaXSKzo622cTA9adLDA2M
	 yDYEJvciL+CmeauqvM9pPltDzyZzz84oH+57LIvTnaBksRI4JrElfSbYNRYMv9OYGiBnK
	 oNumTTxSL4nBxBaqG11eyqQHtYURHyWRxyY4LptVdc0Wg0V/VEU8LKQ4JWNYf4ww+zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8NI2ohN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83960A2600;
	Wed, 11 Nov 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8NI2ohN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399305;
	b=OPV0+ODt6p5DbFXDocrrvjnT3FIDFOTPm9abH8rX5bjeV/VLq4MZsYnJyPSJwCSCjuyd
	 LQv6RJl+i9AOYYNqPzd9qH9eYiu+8zTV3iK6n+8w/YRqhNI/R/1003Q4zlpf8FV+R6h3W
	 KzExIMaCw8d/e6hD2XeOmfcSs5LBH1BsV9kvsPLLOc9j22rP/LSg0VjFY/ggKcHc+LQ41
	 Cr4BFM2eyhyIu2Wc+Yt+RSjnrlhR++2BQa186o49i5n701E/jFt7vofdWNxmLXnkfWwks
	 AJpnLUr+hta4KoVHutDZnJkXaQk6qd1yuSAxjtkPggywacbI06gM8NHK+2v1euzB+3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399305;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Mailer:Content-Type:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=mwUJvTtyC5sbesnsFwyKi03f4PynGWBUu785Gpys8rE=;
	b=CzysxNuOTHB/1+4af9SxoysoK/54dIg9cRxrCzmh/9LyJ1PtL5QuEEjhkeYGHgl2Xncu
	 b5RQvBV5R7o5KuqT4xV3TEqQwZQD9XdDS4W3s9iRGiDPzX87BkPAHTctLQFLqCAF3Q80a
	 3JpKDINjqAuL9jDAKzgbPE4RfolzjLa52vd6H8AyT6jLj0R/vu9D4I2y/7LXiiqGSmAWE
	 eiHEJ5vAifdCZ5cwgepp+CpyCBtdNTAtjL0avCh13CllRQJ5vdvaVxQyJupuNFo0ncRDp
	 uremnP0M6N8WPQ2zY4mPu9wQrlJIB3d047LUgHceIqepZmyEdb1f2xLo0WP8/kHEtKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBE5E1F00A08;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399305;
	bh=mwUJvTtyC5sbesnsFwyKi03f4PynGWBUu785Gpys8rE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=Y8NI2ohN3HQHbK3B40HF4n9Yog0Szh+3jF7pJMJhGtsNP24XZ4LEAyOtib3QfZV/e
	 9zO4Qx3ZOJd1DpVIOfabfGuhCOPxDl4yDsZzvmQuX2+kkZUSt8VIsK4BnJ5PEbPlJB
	 y2JevTlWqvTlQ0eooMPI3U/HzD8443/lPRfOJdeNfJer8mXWZh5NWqWWDwJo+LuxZ5
	 Hty29HkKLJAnWMserIASdnC3X7k/MUvC5p1N+Zy1KVrPFYKrz69Yj0sexTsocKWMGg
	 VLHJGDcvbDZahZI8Qqu+irCh8rmy8pQqqDzbIvktcHUaFqpaliPFJzn+QPzRO4gd96
	 cAvuyzbZ6oVOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3F3D248F92;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
To: heiko@sntech.de
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sound@vger.kernel.org, luca.ceresoli@bootlin.com, robh@kernel.org
Subject: [PATCH v2 RESEND 1/1] arm64: dts: rockchip: Enable audio on
 DFRobot UNIHIKER M10 V1.2
Date: Wed, 11 Nov 2026 12:14:34 +0000
Message-ID: <179439927464.86676.4421939132317972846.audio-v2-resend-1@crepuse.com>
In-Reply-To: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
References: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=founder@crepuse.com; s=20261012; h=from:subject:message-id;
 bh=xlzLLRAxNlPSYq2hZGjl4gVBzWPQJrF0KJ1HKORoHvI=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFlfYrRWp7M7Bbz8FX1Y9Of1eUeDDNKyq5buPKV+jX9p7
 JnaaXvtOyayMIhxMViKKbLMFmUvP9S84trcCU12MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx17ilGhoaAyctLXF/v3VAs3eeY+vlTd+meF4lN3RWzBPtijPNOCDMynHNq3fH
 8fZt/hvKOJstrk5jOrvrZbz2tXCLzxImQiTWyHAA=
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
Reply-To: founder@crepuse.com

From: Mizuno Miotsuki <founder@crepuse.com>

Enable the internal RK3308 codec and its I2S2 interface, and add a
simple-audio-card. Route the onboard microphone to MIC1 and supply it
from MICBIAS1, with the bias set to 85 percent of AVDD as used during
board bring-up.

The board does not expose a speaker interface, so no speaker routing
is added.

The board uses codec revision B. Support has been accepted in the ASoC
for-7.4 branch as commit 157f7cba77a9 ("ASoC: codecs: rk3308: add support
for codec revision B"). This is a runtime dependency; the DTS uses the
existing codec compatible and bindings.

Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
---
 .../dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
index 270ea970c95a..7adef454ea89 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
@@ -54,6 +54,26 @@ sdio_pwrseq: sdio-pwrseq {
 		reset-gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
 	};
 
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "UNIHIKER M10 RK3308 codec";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Microphone", "Internal Microphone";
+		simple-audio-card,routing =
+			"Internal Microphone", "MICBIAS1",
+			"MIC1", "Internal Microphone";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s_8ch_2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+
 	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8";
@@ -117,6 +137,11 @@ vdd_core: regulator-vdd-core {
 	};
 };
 
+&codec {
+	rockchip,micbias-avdd-percent = <85>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&vdd_core>;
 };
@@ -131,6 +156,11 @@ &emmc {
 	status = "okay";
 };
 
+&i2s_8ch_2 {
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
 &io_domains {
 	vccio0-supply = <&vcc_io>;
 	vccio1-supply = <&vcc_io>;
-- 
2.56.0


