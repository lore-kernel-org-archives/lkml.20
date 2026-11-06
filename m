Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002248;
	b=S853dvXRlH6Z1Gl1fmjDizW58CdlpoCxlFbKh0kp+LRWAAmHxP/0G4zCnI3pjxo5qRpC
	 8GAIAeDLMm8EpRTp76j6pnzzkHM1z1RhH7JrzxSTh+gp9ULsCSH7oVnGa9SfyTqnYR0ig
	 69VgTAKDiKF0T1tWXXXvLDoHhQuuqsJpRWpBByx5pyQxrYGPPlRhte9WcpHS/Y/OG97tc
	 F2aj1016cqApJVM2F6ubyYfmN4yzK1x0IzGfwGUWo3CB2bk8pbTm9qfZLA58qeWRMFlq9
	 3aoG6zIxSiptguRtvfhpvKUZmBarJgVoh1YloeTRxDYke+AxBj6mNp3IKGdSnNt8SrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=J6FGxaE+BKZWzR9xhh6QXS5FUiYExw1VU2q+cVJlNMA=;
	b=Nv1CrdKENSD+oS5ase6/pK+SIcgqrIwY5Pl/tCUmDFkUYi2hiBowZ00LShRhT7RIMrtp
	 m+GjTaqM3cS+uyV//GvK3JPlgG3xXiL/rp6ka6Bn85JE8kBlZDi9MjfxozxAt6FEvDEyJ
	 7B7w7xAIbzvyIgCHDj4czDDx+SPK+y/J/yIW669KtAWDNwTplSrd+eDD/s2BxrrOkjPjG
	 GIvBucYe28tTlfGlE16yHollYnQqJUw4zApwlkP+BlOat429BlyTsp9WMnaQVue3LuwCK
	 tSl4H2mRjzGbpZVC077OTHHurxeSFE+t8Vb1k6LnvWtwcD4wnoEYas2xTCtwKLF4j0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=iSOWaYN5;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57448606A332;
	Fri,  6 Nov 2026 21:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57448606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=iSOWaYN5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=G/mSckIqYLymBWxges+EZZ+zPguC1KkQ7jjJsAjrooo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iSOWaYN5Aj4TZS+pbET4koN2DAjIheUhWCZ/Dg7IvuHYEs9CBLb5lr1AY41RZJtuF
	 w53sj+B+T/DW+jYX4JwMS+ut40sNFn9En04eQknokfUHHOAKuScdmJkB6r2GiXwTg2
	 sOglD1WRoHe0Nd5GqVGaedjl7Kh/lRfDFpf7ez5oSSmNqGe5q58WbVdXmZpjK0EZXE
	 Z0z73wRbnYNMGKEz9xZpK41TM6HVufGivYphaGkSmHUlGHQ1UMAcCFBCaZrUMlhpFS
	 hBXMYONYYUtSfwLK91404KH5I9J64r7OBlfWlbgACNhdDb5Leo0DWzPQ72GiGOib/n
	 AopcM2wCHHvNA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D64817E094A;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 15AF6480030; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 06 Nov 2026 22:57:08 +0100
Subject: [PATCH 3/5] arm64: dts: rockchip: Enable HDMI sound on RK3588 EVB1
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
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-3-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=G/mSckIqYLymBWxges+EZZ+zPguC1KkQ7jjJsAjrooo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTT/9SbKdXLvJ8/09A8B/5V1FChKcudzVx
 qMP1DRTHGxNk4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k0/AAoJENju1/PI
 O/qaF9MP/2cX/bGPiQ02ZI6INneWEKUKwMzN36Jsa4/ByhHHpuqosM58H4sN12Z/ymxaO0Im+8j
 SaBeJijiyCecrLpRcZjupQuRdqbkVeVuq9Lx9/Rz7MklFiYu1RIUIkAMhoyeqLwzOW0tccPlNHB
 QO840NkqKUFPHxCVLR8UQe0X8kd+j2Mb5N1q+KOpTiNmMA28PBbI9vA0yi/6q1UWiuZGxTHAQ5v
 3muoDW/PcvuwMFqNxa1ZNmZsfxZR653vbfvRlmrOWCdcGcKjb6q/KpmYAACNJGtnsqpHN9sNqwz
 gRxS7IKgNcZx5wm+F2Uju2aby9fmonkDnsBxYJ+OLuQRHXfS+jt1WKYSBxb2gEZOvqkFYJh9Mi9
 GDEGHaVl9MDcJXt/xscQM26SEplvbOiJqaSlSIFp2+PzPEMouRpdqiiTIFJtb0PkxkMEvK1XH5D
 6rIjxrcnxqedutRYD1YO2kAEG6cLph7k5aKzCOkRdSh5+gLAoFS9IRe96w2ZKPmYD30e+HPWO3H
 cPcDNYHrxF1M6H4f0Ww7UHDw1J5FGH9xkQizYh9iOcgl9kr3uXxYAyiG9La9gCHgqTRCHJWbYCY
 2j6s6PA/81upLHdC/9L/d0Ls/VcZlFSXS1Wq07QqdHlL2s8/D+4JbBfNRONYEjGFrdXvyCeTpfk
 ExPDUMPMTJZ6NPj7l8B0t/w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The RK3588 EVB1 supports audio on both HDMI ports, so enable it
accordingly.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 6476d9e3be6f..6a95a8bb6fb8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -379,6 +379,10 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdmi1 {
 	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
@@ -399,6 +403,10 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdmi_receiver_cma {
 	status = "okay";
 };
@@ -514,6 +522,14 @@ &i2s0_sdi0
 	status = "okay";
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
 &mdio0 {
 	rgmii_phy: ethernet-phy@1 {
 		/* RTL8211F */

-- 
2.53.0

