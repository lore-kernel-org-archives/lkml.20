Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.92.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443646;
	b=vte0LEM9bDc5QaFUvAxYfUdUdHphvDjn6soCZAyu6hfPXriAXFJRXhSWq+Jaen7SQsyU
	 U5jaLyOKXlhnfxVBFMIKMzzKOvqX9wVDGJDxvBqzca7wYwBT2V/xUkuemzS0khG+8qxlF
	 cFjC3f4c+gjBB/peACKL2X/mkQbfS00HY0FthxsOfM6n7aXkqAZvJXBe+0gn82vnb2esZ
	 uDJOtZ02bHfGDGxO51Bx3uCKVl+69hT1K61TNZEYH2OO7lCoO1dcl+uotQAOZ1Ur1yZtv
	 apAcEjfcEypBxXEk+9n3avpGuTbSKcctj+F1bDgJrkRy5XAVl12vC9QfrW5gUQhmJfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443646;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RVoXlCSb6jIMaGtRjcozIyYGAhMCZqne31Hnbkv4d2I=;
	b=T1wlxFrp3dawXPV5ZR7F6Z0sB4I5tcIOw501rHF/WQ8eK8+WySHVE3BThKRPVPFX6lWD
	 +l8IUUcIbveGTn3Ba2ZSPRh84lmGRH2wIuZPmsUUSD0mndECVl1Q6L0eNn8GV8Y0eG8QU
	 70F+Zne4Lpuyvh/U1NbM09SwSV+hqBgxsfSiez3kabEzFu7xjq8mZDT3xoWy3V6KmCmZs
	 CHI4O3vzsfCyclyyEdbvTDOP8N3SzoewNLERQKUyENbfgMmyMlTWU9vQIa18gBBsRKKXC
	 jLb80W6cR2xQACo/OTjjzOyrvt/UsC0rijvpjzHm3W2EQQlRPgW47TQxbA5Mh8vCkBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=Kx4Q5+8w;
	arc=none smtp.remote-ip=88.99.92.76
Received: from mail1.rojer.cloud (mail1.rojer.cloud [88.99.92.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619B6606A322;
	Sat, 31 Oct 2026 10:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619B6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=Kx4Q5+8w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793443643; bh=qvU369dgJvWvyI9h764kYcAsK2/h8+Rf6mBdDUM83RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kx4Q5+8wIafwfq7pjfVQyW/ZGJ+77yFFS9JAvcNP93q4zEQUycKnO8T0nzTks+hP+
	 Vjo4lmaZHHmRPQCNOowTru6bcpvQdyCWoWfgGzNFwAEiAxYR++dwA82p45wMxvEYqb
	 hcgc33eCwom7TchARkkYvYbocItbiB/dRniXC/U9jmk7R8IzjiACRPSPCF99OzAkaV
	 vJ6jLSGI9/fIcZPiyqvzAmouaQZenVqypC5tnYyFFan9iSAF1n2aE4Ivn5Nlgc/9dP
	 SgXA47ls+VaEHrz7e9M0gedBWg+IQQ0+ZDe0a5SLkUvPpay6DdeFjY4mi57zIRVbPI
	 i6gONr6YsJUvw==
Received: from nbf.rojer.cloud (unknown [85.98.52.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 3537B2168C;
	Sat, 31 Oct 2026 10:47:22 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jin@mediatomb.cc,
	shawn.lin@rock-chips.com,
	jensenhuang@friendlyarm.com,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
Date: Sat, 31 Oct 2026 13:47:13 +0300
Message-ID: <20261031104714.3271017-2-rojer@rojer.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031104714.3271017-1-rojer@rojer.me>
References: <20261031104714.3271017-1-rojer@rojer.me>
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

The NanoPi R2S Plus inherits its io-domain supplies from the NanoPi R2S,
but the two boards are wired differently. From sheet 6 of the schematics:

NanoPi R2S (NanoPi-R2S-V1.1-2009-Schematic.pdf):
  VCCIO4 (U12) = VDD_PHY_IO
  VCCIO6 (H6)  = VCC_IO_33

NanoPi R2S Plus (NanoPi_R2S_Plus_2309_SCH.PDF):
  VCCIO4 (U12) = VCC_IO_33
  VCCIO6 (H6)  = VCC_18

rk3328-nanopi-r2.dtsi describes the R2S. On the R2S Plus this leaves the
VCCIO4 domain configured for 1.8V while supplied with 3.3V, and the
VCCIO6 domain, which carries the M.2 E-key SDIO signals, configured for
3.3V while supplied with 1.8V; the latter prevents the optional RTL8822CS
Wi-Fi module from initialising at all.

Describe the actual supplies. The vendor's own kernel uses the same
values [1], although there they come from a .dtsi shared by the whole
NanoPi R2 family, so the schematics above are the reference. Tested on
an R2S Plus: Ethernet still links at 1Gbps and the SDIO Wi-Fi module
enumerates.

[1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835bba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-common.dtsi#L425-L435
Fixes: b8c028782922 ("arm64: dts: rockchip: Add DTS for FriendlyARM NanoPi R2S Plus")
Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
---
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
index 4eff0503928..6ba4a74cb1f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
@@ -29,3 +29,8 @@ &emmc {
 	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
 	status = "okay";
 };
+
+&io_domains {
+	vccio4-supply = <&vcc_io_33>;
+	vccio6-supply = <&vcc_18>;
+};
-- 
2.53.0

