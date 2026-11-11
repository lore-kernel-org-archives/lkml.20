Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437003;
	b=OjcaBDriVweqDQTsaQi28r/cGgqmnmXpa5zpth+syFyVDDJHhks1uasPg+859Wp/F5C9
	 Q7wFXI8K7ayo8LkN6eLEY/a/zxchekMNCnVldzqUP591XDe3hTLOQhkj8EuoTn61NJVfS
	 iLbA7oQ86B7y3bOXIJor8ThlsdIC1sHrU2lB1dGPpzdY4JuWO9fPxQN3XdBdr3YHzNpJI
	 V9c+XVSx/Pior+Bk6dOLhqGnBcXDEYm0Df4I5BCdLfMGQ6s9sIuFQmx3fNOdKe8+GD2Ne
	 PhtcoHWUVSQtcJ2cZAonw6ka/UoXMCVSekWWybqtEmxaOLiZKNrlfwnNGTDjAH51RCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437003;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=izp26nvx9wc5IViJF9WfgnBu+cgLDrOEH0/MefbUalk=;
	b=LxkfOBNJ+dPqyxaRqGuXT52O8Tnh5EHTY2IyUSKRZIT/uunDkrGFhUzy+Hxissjfpw6s
	 +OXkKUWhQSIGf0J6nEVhBnaBkJp8PnZcHZSriugkVURRYWBjR4hQZ+wkH2TySJ3N8rN/6
	 VbAxva94HOJeAsxeU3/V33VyfeMDfUC6WebIkEy/rrGEgmGqMHCskKbSWwbHsCbZA7/Rd
	 19K/rYQLWUQfNZ6TVwnjxSXCeuXWdqzerGPwLbts46sC9wu8vcIZdbQL51AGfGe8haMok
	 3NSZucvSBYHNSmhOWueJHJ+z9l+ykw9kgkinZnboQewOfscS4JIHdTLYyXsjbw4q/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mzoSw5hT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABDF606A8A9;
	Wed, 11 Nov 2026 22:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mzoSw5hT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CED1F00A07;
	Wed, 11 Nov 2026 22:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437003;
	bh=izp26nvx9wc5IViJF9WfgnBu+cgLDrOEH0/MefbUalk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mzoSw5hTl8QsWO7Bcd88PjwbDCRc9wctopgbdcNn/gMnEsDssHjNhk7pZkuuzLvJU
	 ngvWlaHZpzsCtOBORQnizo8jWT9h8EeMH3Bbqxvy44owz7iRaMzFoZE1st6MrVu87c
	 QXTt2Kd6EmKq2DPSy+4RHD6r89hQtNwJL5Yzzi+CTzBBiJlD5TNdMjd+YLU7W/5iVz
	 6UB0Odn7kR7AkUCxxblcYfk0/7uoj+Iia4u6ueXOLiyvXeMroUyk6Dz2+UdrtwmLjs
	 5amBmLnI3/cQ3t2cX8picgJ+2tvzACZBOc5Zzitt6VwM+xymUqC4hyYCoDbP788sK4
	 x9FlCVpEOzeyg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:03 -0600
Subject: [PATCH 6/9] arm64: dts: marvell: Fix w25q32 compatible strings
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
Message-Id: <20261111-dtbs-marvell-v1-6-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The w25q32 SPI NOR Flash is a Winbond, not ST, part and is missing the
"jedec,spi-nor" fallback.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 101d1518e28f..0de09d126104 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -590,7 +590,7 @@ &cp1_spi1 {
 	status = "okay";
 
 	flash@0 {
-		compatible = "st,w25q32";
+		compatible = "winbond,w25q32", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 006293931c78..067951cd7449 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -361,7 +361,7 @@ &cp1_spi1 {
 	status = "okay";
 
 	flash@0 {
-		compatible = "st,w25q32";
+		compatible = "winbond,w25q32", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
 	};

-- 
2.53.0

