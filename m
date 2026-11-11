Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436997;
	b=XZwmlgoHuxf5BxTfzR5KDLBd84vUv5Wr/gQapn2qI2YXnS40xdybiQRB2quEwjvCVSpr
	 KVMnZGSTceQ0Xx1aPTbGmtsib82Mi0DsewkXK/bmGaphLhUR9Tnga3y1kGGMoSigyBarL
	 hcdscuqVH6VOgRi674ijZSWueCFthzZvyZvPvGRdgX+bPbCefisc0JN+g3lIjgRbo/gTZ
	 bIkpoO8qGZj46WSlsfspWiTIHdQ16XMuHUHVidaX4q/qLyv00oVI/XdnSzl6I2H08khBy
	 FjSHP9uXag+qhCpa6VXwMwK9v4/APiz6abXK5Jmv7TsMIqWxAlSY6xZZOYqDsSoh/ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436997;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=h7bCszpq0n0gWj6DI+tjC7E3+LNbnjacz978YYbgIjc=;
	b=EDMXCX5pRKzoWojS6db9CuNK4SG5QcJ3dyulHi6ZGuIUY6/q+zY5gQxuwqULScWr4JHk
	 zD4mMfXZSCzCybd3rd++hn9QNmwvA43c4akcpuS0NueIZGhgR5JpIll01SKkOnJrS55fX
	 dCJe5P2rTWovRN8aXDI6u9FFWB7xqFbF5kHTjLzqArNJnf3CftnCHiCjkPfJV/cmLnluD
	 sjZkyjruTmKDCDOsyHjbYzGSg/4ikKPEjsbk+I8B7bSiH97qiSJWeVkQLpOzL42qGB18e
	 pLKW1gVX8DaHmTVQEDNcpFCwDtuuOX/c55cWZBwOFBGqSs3Z6Bp7otxjF571OL43HtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ieaEY6fX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A4660A383F;
	Wed, 11 Nov 2026 22:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ieaEY6fX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2379A1F00A0E;
	Wed, 11 Nov 2026 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436997;
	bh=h7bCszpq0n0gWj6DI+tjC7E3+LNbnjacz978YYbgIjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ieaEY6fXfbMKqzpHj2WISul8cuukvFWzzZopah9l/MZl+VUjT1yoOPN3dXfLuUaMa
	 I3MtVK8xXM9K1QZO/UwR3/Wyu8drx9w66e+uackh9VtrkAn7t3iHmsfWlrdd8Pdacb
	 r0k0FAztw8uQmfUefhczD6MYRoWvEOCHFNbznuGbXhFqjMyneQS7uuEx7nQHHK6z1D
	 6OExRJH7C/Calsmjud71ydVBw6i+AMXgtQ8VE5VXNHd4NAOX6Fftmly+B+bJOYCoUF
	 bl2fbJt+dugOSlof2VBMqBEE9OdsL7A2aieEbXZJ4y0Wc2UOjSoyNzop+Wq5N4YfvB
	 B0UIIDW2UY33g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:00 -0600
Subject: [PATCH 3/9] arm64: dts: marvell: Drop unused USB connector PHY
 supplies
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
Message-Id: <20261111-dtbs-marvell-v1-3-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

'phy-supply' is not a documented USB connector property. The generic PHY
framework only retrieves phy-supply from a PHY provider node. These
connector-child properties have no consumer, so remove them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 1 -
 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 2 --
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 1 -
 6 files changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index bd00e7df87c6..1ef4689d5f18 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -284,7 +284,6 @@ &usb2 {
 &comphy2 {
 	connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&exp_usb3_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 3add6506ff20..f5a53fad66e6 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -224,7 +224,6 @@ &cp0_utmi {
 &cp0_comphy1 {
 	cp0_usbh0_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&cp0_reg_usb3_0_vbus>;
 	};
 };
 
@@ -238,7 +237,6 @@ &cp0_usb3_0 {
 &cp0_comphy4 {
 	cp0_usbh1_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&cp0_reg_usb3_1_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 90ae93274a16..4efa2a1dbda7 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -599,7 +599,6 @@ flash@0 {
 &cp1_comphy2 {
 	cp1_usbh0_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&v_5v0_usb3_hst_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index c7102f74d4d5..89e6f35f310d 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -170,7 +170,6 @@ &cp0_usb3_0 {
 &cp0_comphy4 {
 	cp0_usbh1_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&cp0_reg_usb3_1_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index f2d278d171eb..006293931c78 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -370,7 +370,6 @@ flash@0 {
 &cp1_comphy2 {
 	cp1_usbh0_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&v_5v0_usb3_hst_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index def25d51c4bf..06a861f83ad8 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -491,7 +491,6 @@ &cp1_uart0 {
 &cp1_comphy2 {
 	cp1_usbh0_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&v_5v0_usb3_hst_vbus>;
 	};
 };
 

-- 
2.53.0

