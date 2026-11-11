Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437004;
	b=Y/P4JSz3T12DzfRFgcap0nlUjD/nA75zIwowb6QJDnnD3wL72Akf9XWahcJzGrESbLr1
	 81xRxFPOelC9IDj0LQrNOW/aM/TVVUQL6pN0sDyZbISmVM8vTIPnODHY7eEOAA8mkzDVq
	 fWjvuB1CHo9GjuLnCEgaI3ez3dKm7XzYzKe0j4gQi0vZEXYmO50TL0pRnOIzeA6SN+esf
	 xW4zBcjlkPyMtV2DILORVgnp77N7e613fZ2MLL8T03KhHCHswIpsKwduVgBDCqule5/Wn
	 2nZ3SYII/IJkHd8YbaSq0Ma/0s4LIPL8MsG9hzHkXctFypLT5/jFNM1R3wCIaHh3RnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437004;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=UeJIGxY5ErXXyutQODurGJuOPaEIwFDPftosdrDquo4=;
	b=Acnv+pIRy4y7QovSwmCjV/p2xQsN22nRk/wbWS0IbFA9QZWrVg9vLBLLyRolENfsrGvX
	 DyNM9GF1B13KjttmAeWHxbHTvf7J5OsO6GOPnUdEK9NicEhknzOvSihN8FfBTf7IAeuZp
	 wGZSaMefDoHzhIgFor0DgWpf0Pj8ZURMvN/6lrxw/fvNQkggDi+37SKZdQUsvz+ZrdlX7
	 bgB7OVTqikVd69Jy/ZNOLS+uNeJK8S0hzCpHlYowNLu0nx0em5vKkLBg1iJs6UstMkg8Q
	 3l7yHRhFmfN0DrcdAkXkJ7GT2cy1q5iS7NAN7qr5kEuzkm+POTdGyP0S1hGeea0U4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFJg7ifo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6764A606A8B0;
	Wed, 11 Nov 2026 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFJg7ifo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6F21F00A06;
	Wed, 11 Nov 2026 22:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437004;
	bh=UeJIGxY5ErXXyutQODurGJuOPaEIwFDPftosdrDquo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UFJg7ifoWir3FpRhZXf10gK6sJsDWAE5nZot4uimGei2FVwGbQi09RGw73Va4/wCy
	 76nLG8BPhPOXoMU7zmhaHOUQazwjcZVOU5QoonImdFlRDiLwxFx/Ih7akKV/yk90Oo
	 q3wE/bPd/7UyGjGI/wWgQVOhQYncjO9kbsr57XEJ3BWbbVa+0rSrlsqpC7RxMh6XCy
	 3Np5yTsPSd6D2cnFlwGMrui98dLeTo3QhZTbh9ALkBBptdn0OIdagl65R10xWXrr2o
	 K4bOjoYrXRd9j9/lRn2ISKR2BOGK/ldbg2RuHCUndP9CdDu+lODBrzhbpYLBxJI1yd
	 voJgfnzH4qCHg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:04 -0600
Subject: [PATCH 7/9] arm64: dts: marvell: Drop unused USB 'phy-names'
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
Message-Id: <20261111-dtbs-marvell-v1-7-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

'phy-names' is not valid without a corresponding 'phys' property, so
drop them when 'phys' is not present.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts          | 2 --
 arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts b/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
index a7b6dfba8af5..5823b25e5faf 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
+++ b/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
@@ -28,11 +28,9 @@ &cp0_comphy2 0
 &cp0_usb3_0 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy0>;
-	phy-names = "usb";
 };
 
 &cp0_usb3_1 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy1>;
-	phy-names = "usb";
 };
diff --git a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
index 71c225221617..a68c958fbb30 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
@@ -89,15 +89,15 @@ &cp0_spi1 {
 &cp0_usb3_0 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy0>;
-	phy-names = "usb";
 	/delete-property/ phys;
+	/delete-property/ phy-names;
 };
 
 &cp0_usb3_1 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy1>;
-	phy-names = "usb";
 	/delete-property/ phys;
+	/delete-property/ phy-names;
 };
 
 &cp1_usb3_1 {

-- 
2.53.0

