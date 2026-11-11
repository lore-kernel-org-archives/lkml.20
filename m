Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376813;
	b=NFSU/DzR+YBo/ESQfk+jSNU8bwu4vwkCCp3poSQ7dprdJr7YZna3YRRgwqsPw2XA9Z3p
	 t/8+sro/TDDV7t/6X4KSmfj/9fauOwngDQBBIhWqzxS30DoIg6hh8254bu1bLeIwbrIz7
	 n14lfhWDiEy4IwiPQuhLks+xVCp8fUxm75xzSSgaBPrDDCWeeTSX9Ubk5I8tPYYFY8bvG
	 Qv0i6EHvUlNAQT2HZwOqyl7joRwrcm/b3c4NYshvbeRvuCfuFaUbWU5bKsg+0BY26IBJj
	 VzbTQBFwKxTI479ADbLjSFLLCQMWdpjWZEFmu3zciC1LqLmJO+RmdB6InXqTZO3HKJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376813;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	b=AQ+fzUS8laLEalUdCbyGkU+RghQxqzmb56LsBxAbctkvtrU11ABEY3dJdmx1IxoCyW6j
	 qowtPYXYBBIhhtvRCrtihEa5wFyPt15L+ZT1oUVvcJnmCoPhfwIf7GKPK3v0H39p0JwGB
	 V7dcXd/iV/M6axtIPEkWwMHSU6sih0qekP9b2vaNGZhQ1Air7xZORhlRPo+jqgu5SGAMw
	 j8mu14RWVenTcgaDgPYs9vT0QGfXC/EjuocQHlA5j/dZD49gs7+sJJql4dBQgpHsxleKO
	 wYK9pqksRSV9U3o8AbzrefqXfZSxAEnn1Qzanc/sfHSIoOTfWRLc/ZsMk73glMIOlSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ecdl/MeD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2880F60A2635;
	Wed, 11 Nov 2026 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ecdl/MeD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376812;
	b=yglmpTgXW2JjoA734GLaWmIJWwpQf+WjP8bMzfbkSQssh2gnRn3wIVhPTNJiX8Fz6Rcd
	 /O7M2IgxQ/EUPOquN+HKGNgdLasxmYQlxfd1zcQsUjGHO8D0PUHpfDOBNGyoSYJnp87rE
	 ebcx/wfLgMBuF0R4jMkO78zyrKququpR0kT26XoMPPGD9Ulmd8WQ9uqmM7w/yMQl8iAT7
	 GbzEcEd7StF3htCDyaoFmYJ02L4tIBqlVqZ0/veR118IEBukuq21h4qTRTP4BsBsl8JPT
	 gR5yO0NfgDaSWZNN1+IMp9HqGDc6VcntFSD8eIFa7D9+hB5ZprAUyKhSKNCjUknIVgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376812;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	b=vHzXR+sNoBC2/UHTlBNlBjtGrP7N9CoHl9YikhfsmnlbUkzpu1Bqw3q3z4FGIlfe3fF3
	 14rXPo7gjqhVoMH2368cQzobsfBFKc/5xUrTVZL+PRYOg7saV7d81UHPSPK9AWMygFgbV
	 PsGlqh/C7AePEmV2oFABLYxVUP+eupAhZdRGj5vF5WeDESfF9Kmc4vVc/GaKuq3DsGzCL
	 od7MS8k+S62+gt5HpZTPx3ZklvIBIOq0O3y7MnvFA17XeCkaiD2Nx+RL4t9GZv9RSiamP
	 irXrzn+W0TnUGexVUDnpxseWhCug3eH+JHe5IfMtVa3nRgyFDaATdZGYgjGAnH4g77w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72FB81F00A11;
	Wed, 11 Nov 2026 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376812;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ecdl/MeDRxmI3lZxfEq3nNRcbWthtKp0isfMvPOoN3DBF3yIQH/FwIP+a/RiEaL0i
	 ye5OFFx90sBqxVTPdZPHgWkvBU9OCA5fmrSmFFBtuJgIjsZAGEnR170W/khIiwgSoo
	 1hf85p4jRLkMzbs+QKOxT3RMyKKo5wxYJw5bAhF4cO14905cnqvUeQt8rehozZl3zA
	 Gva9J6a/wmT+EV4X7/beIm/l7/3H26KmtMiWuyaGdydqIzSjK9zN2r+IGhNFYSXvlM
	 hbRO/E7nFZe87mNwPXCnIFGjFHQE1BAlKu6YVf+ghRozFfKbW3x5JFHRU656jP+V7s
	 CNEFW6Z5Lh0kQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D991C48DE6;
	Wed, 11 Nov 2026 06:00:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:10 +0000
Subject: [PATCH v2 4/8] arm64: dts: allwinner: h616: Throttle the GPU from
 the GPU thermal zone
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
Message-Id: <20261111-h616-zero2-dt-v2-4-88d8030fc975@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1929;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=teKOTEf4Ehrd6NI/Dk5AeKkHXxd5JXaOLzoyVTpHUvU=;
 b=yLFaEEpDYwt79KRRJlMNs77BbAvA+Grb6wuXB1bpgzTknfwSRX7R7k2NrV9OPxRVVmj+4GjOV
 YQAEUhYQFk/B9ziyWUJ5X2FmVKg5IMjlBU/FfcSV7WSMg3MK6v7HKah
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The gpu-thermal zone only has the 110 C critical trip point, and the
GPU node is not a cooling device. Once a board describes GPU operating
points (panfrost devfreq), the only reaction to a hot Mali-G31 is
therefore a shutdown.

Make the GPU a cooling device and add a passive trip point at 85 C
(2 C hysteresis) that lets the thermal core lower the GPU OPP. 85 C is
the CPU alert level mainline uses on the H6 (same thermal sensor
generation), and is below the 90 C at which the vendor BSP for the
H616 throttles the GPU (it maps the GPU to its CPU "target" trip).

Boards without a GPU OPP table are not affected: panfrost then
registers no devfreq cooling device and the map stays unbound.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 68bd6137c316..93c3b8279241 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -162,6 +162,7 @@ gpu: gpu@1800000 {
 			clock-names = "core", "bus";
 			power-domains = <&prcm_ppu 2>;
 			resets = <&ccu RST_BUS_GPU>;
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 
@@ -1124,12 +1125,24 @@ gpu-thermal {
 			sustainable-power = <1100>;
 
 			trips {
-				gpu_temp_critical: gpu-trip-0 {
+				gpu_alert: gpu-trip-0 {
+					temperature = <85000>;
+					type = "passive";
+					hysteresis = <2000>;
+				};
+				gpu_temp_critical: gpu-trip-1 {
 					temperature = <110000>;
 					type = "critical";
 					hysteresis = <0>;
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ve-thermal {

-- 
2.55.0


