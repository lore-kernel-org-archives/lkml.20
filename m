Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437006;
	b=UzwZUFNdIfxFYTcnAlG7TX/iMN/rNh6Ddo4jV7cNBLoANg6fgkVDEdC6vAiRu+BcdITa
	 ap8UPSOqwt+n+N+r+kwLbO9+viJzTdHVvj9NE67KjBbA/G+3btOQa3eI5IkgDwBpU7gpz
	 KBa2yZ4sXZYRZTSWcfIKfQ7M9bnV5BldkKd/xAnMh57L1e3ywUl9w8w5E8XuSg1JATA+B
	 u/5oNGFKUQNghgROAva650h6D0RrhgXkAe3dsrQXljvjdu78LkxgZb/AWJ0uoG/F7tWLX
	 BQgWOdSME0vLRUhJTDGOuU5drb3ZN+PwUzjdxN+3caFDg9vATgVaclSNBr7iRpciYww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437006;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=cX/Tp5audNOVGhUTi+88u7YfX7Lqy3DYIOIRzLRbeyY=;
	b=bVvVV+EU9fd9LQDReuk8RNwdKrUqEbAToG9UFYaWVd8qzuhZvucXASqJzN7O+nXYeZdK
	 OWR5o3kdMhe/6oFhjynqijQEDD6CVbay0jwRNnvCgvMkHj3eo24U+dp6OnK/QB210Dn6N
	 95jFD0WxNotn+3Rp24GlML0I2QsWSl0Pw728gLYB4fKNOAFGYenXOz68IZHdRJJeI7KPE
	 qTlQnnYLJG6G4qN1PuwRUiBty1SWPq23TQ8Sym8Wokwlp3/PBwK8INsvkAaJyVo5GsTiY
	 mvYP2/zS23k3nxWbqdpDFAZOO+yEL1b9BW9/pXTbq694+iGCOxof4Kj/628nnB7pf9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buUpJwfg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CA60A6F74;
	Wed, 11 Nov 2026 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buUpJwfg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D25E1F00A06;
	Wed, 11 Nov 2026 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437005;
	bh=cX/Tp5audNOVGhUTi+88u7YfX7Lqy3DYIOIRzLRbeyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=buUpJwfgTYkO2rE+o86IT2/I+go5KxcIEK5OFkI5mIqdAWhG0kDrMe8TzKEWNWQAQ
	 Sb9qv+WZH0H9h1N0aGnNZMYa/pXxFL00OWoytbDOe9uieJr1wXS5Dmoyi1l399+KJf
	 XTfzvvmuoLASW+nOPknvvpTg/l0fTb8nHEBji1tRn+//ZPoiddA7aWEjtO3CjHvPOW
	 jMDY8xvAXX8Ub3WvMZXdAvaOv05kHT/Mkea61tHwBDpTt7S4DkHdVWa9xpTdSEOmW0
	 Uus4porQjBSWgoZoM5ODpN2S1WHLKIr3OH4eGoGcHX7JE/6WNNNWVL7m1rHEfr+pcu
	 4cfBdWCQooe5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:05 -0600
Subject: [PATCH 8/9] arm64: dts: marvell: cn9131-cf-solidwan: Drop
 st,m41t80 reset-gpios
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
Message-Id: <20261111-dtbs-marvell-v1-8-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The part has no reset line nor does the Linux driver handle the property,
so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
index b6aeba7d0a61..0b079e1428bf 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
+++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
@@ -252,7 +252,6 @@ carrier_rtc: rtc@68 {
 		pinctrl-names = "default";
 		interrupt-parent = <&cp1_gpio1>;
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&cp1_gpio1 13 GPIO_ACTIVE_LOW>;
 	};
 };
 

-- 
2.53.0

