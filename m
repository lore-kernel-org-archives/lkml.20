Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002248;
	b=q5jyWdK/k8KR+YpddJaPCtY3532KTYKeOWikTK2/JR0zc/2cQbPl1havT0VTkyQTiPq+
	 BL8MPbD6PAKAXljBDj+++PDPCBLZCJKan9S+dE/hFYzpsOVwsPbThB7AgGe/MgkgM7zvo
	 n3/oh8XrtsVrZ5zvwoXwXSJqg+T4e9RVoQqNvjJmXsGl7828P4ezWRPuy9jbbkRQmL89t
	 FbQZ2Vqd3nuzu5+GZC05tnDpFN4CkHpFZ4sGcJZf3LfUUkvFscdYC6rkNFOtAL5qFXA4K
	 KYA8nFo69TCpcC+jblyoyc42aisuRv8N4nd8iKlXO09lU69Z6+sazBTGq+LAawCZUqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eEdHcZ5bk5oFnMschdSM1Q1llPmwZSjuajB0JvQyNh0=;
	b=Eh701gN/0d2qLOFXKMlt+ahG+8AXmWEQIR5WROmSnxH3x8SQy4+TL0FpFa7rxU+KPrdy
	 zrKYlQTBaNI3nCrKeim6GzlL6L65GoPs5c1El0T2RAwPngKki6IkErx8yKi8ZyMceMysw
	 I7lJ5sMi1ut8r8XYZrLjtbqAmWoAa+Nmp9rX8PMOlqBnabew8t2FtC4JiW0QrOjdqeWRD
	 MpiIVE1lFqMblhxG/qn5NCrcwxgcgoysytS1hL6dOD3CXEJFE/KAjr+J6ARRcH6pXYrBT
	 QHpWUbjiE2zyMJ7B4i0xx+uJg5oSgnigaYbuC+z9aeRVDN6Lrd8d5mS8CJfvIhz5BmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pBffYMiJ;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758F606D806;
	Fri,  6 Nov 2026 21:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5758F606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pBffYMiJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=q2L96RZ60cbuyzKR+jlRIdp24LTnJ4KU7VVBXZsfgOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pBffYMiJEL4qpB8IPcyAwIQNVXcFlfmKhOPHCudKZW1UBg+/8XqXrDdnv9FNBCyw5
	 NjADLX7YOx3uJ+2oAdRlHsMGTdrpzCwEvDCHqBa+1ylLHpWQ/PAHi5DZrqJxexrb2s
	 3EvS7YWmzEpRmEL599llqxI0v4YxYMzZFzN2UZBFhCLo1pbtW+pScv3ksYLudVOYrL
	 VlX34Wlv0VbIH9m5q5EnoDMmyEI5r+k6ovP9SkOX35oUfj5av9+B/tkEBht+4UGfLn
	 IWM3aKaNVuvXFKjnG+wy43khsvx/neIPKsG5ZJB4a8dHQvBP03FRHz9qZFfAGlgRHm
	 OICGU6MkEoVbQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5989917E038E;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12ED2480029; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 06 Nov 2026 22:57:06 +0100
Subject: [PATCH 1/5] arm64: dts: rockchip: Add missing PCIe wake pinmux on
 RK3588 EVB1
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
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-1-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=q2L96RZ60cbuyzKR+jlRIdp24LTnJ4KU7VVBXZsfgOY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTT9Q7rqoWchJ0M3nVrXKDhUEF7ppZXTGf
 tETOliRIiIgHokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k0/AAoJENju1/PI
 O/qalHIP/2H4u7L4Hv/3W84depaMQ/Rnbnd6IMNcdZHtI3vgpUDUJtWqPTjeuGAJkA2wcBCBlV9
 B9dpRNbp1z1hpkXfOW2i5RhT+ExvjqlTDG0sUAK3zBg8rw0PFvWMJ9n4vnO8TNPg7QIHsnk1mlc
 4LB0tWLusBO7PD5wpizvEpYMm+vS9AXjuFCfFpe40fZJnwyE6T2uYtcig+GiatCKfl7DeVtIPSK
 pYdv+vqyQbw+WyHoKKvPIKtHqIOOGtFA5EsSk4lX2uLbKw/CNFB5XS+SRPGUFl+0/9VgYyHbpTf
 ftxBRIKt58x0pVv1zzn6/d0ITstuVnFur4/9nvA8BrcxpaOXP6DTH+rn33I0ZokeZizWZQhBnmB
 C0KsivwOLroRwS0tKGR2AXt3nDEeKra5cy2s0wFm+g/xonmEguN4m8AYU7+8iCNHmqgO03fBEkc
 WY3/SUEOnSdc9gvmM6i0DXZAItHIJztMzwdYkGAmev+CbDQsU2ft9z53X7GPt7mknxSPPxjP8lA
 GoZe/o9pceNXdbRciI+yKneLI4HSzagNDOdjoYcnxCkXRFcxrvcOiJoTXMNoto019T1ayQxSLG1
 54jNd5Stv4GxcJHvcUFi4QbKWEvhG45cWgkkneG62tCKgpdESs53klcoMz1AzVGEGI3WqIF0ZEh
 gO63Co6oqp3a9c0sx53Itvg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add missing pinmux for the PCIe wake signal for the onboard LAN card.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 8969b56f3063..87e624d1e094 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -555,7 +555,8 @@ wifi: wifi@0,0 {
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_1_rst>, <&rtl8111_isolate>, <&pcie30x1m1_1_clkreqn>;
+	pinctrl-0 = <&pcie2_1_rst>, <&rtl8111_isolate>, <&pcie30x1m1_1_clkreqn>,
+		    <&pcie30x1m1_1_waken>;
 	supports-clkreq;
 	status = "okay";
 };

-- 
2.53.0

