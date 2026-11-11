Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426042;
	b=b631v/mEROyCTiSxTeRSTB9oAfaPhxuTVV7b2L7kQqrAHb9zkCh3+DOtiUAbF9TMyCdo
	 JupVyLQf2mM2Ml//GUj1yQ8iMkIpDKF36drepYmdHPNJBi/ln+eWk0Q3esXIv78MJEcz7
	 uGWl1dYclLAbu2DjfGpGxwRY7CqErmzElZLVdZ7XsOHRYxgMElAsY33ypcfeFmOhpb4rd
	 kSr/V7rYKCSiQTrkwCQlPrr8hn5+J6TGQl+22wIKnORW21Z/iw1LmlHM63/cjem3jX3as
	 VZTHv4IjRSVClYpNLh73dnzAYUG2N7CltVjdnnB+sSCd0eDcvnTbljjFNbCykxBc+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426042;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Poih9dB3auQAj++shuYGBNcxyMAxKrzMPsxjgIYbSBg=;
	b=2q4KDVKKidinhfhnh/5mM2yRaoE7+1ZGeOvGhMqEg9ri+/4yhJmlZUAyPMvSq/eNe3AI
	 Iw9cajfkeXz247OS6n84CRlKBBDsSt6J+V7YgnURlcsFBBQxD3trhfa3Cvnd4WyHE0ee1
	 gvDGqP67HjHNZi4xM+CZxXmJKffbjn/rTafIIiuVmy9R1P3ModvulRVYEwNr9KDVE5T/5
	 iTkP62SaiJQ5lOuqgFRA0/VGcNNzDDtjcl50kEInuCMXTAd5/2CjdssyMB02mzPOpxZ0Z
	 b95l0dD4gfDEA3F/ulSHuXfOAJZfjabXkQh3GDq0zuYex7xSAxWIvJHsEcJEcG+KHEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCpov68u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693CB607008C;
	Wed, 11 Nov 2026 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCpov68u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3B21F00A06;
	Wed, 11 Nov 2026 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426042;
	bh=Poih9dB3auQAj++shuYGBNcxyMAxKrzMPsxjgIYbSBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hCpov68upI2Hr/vcZo8JPCB73zJAAw4Aa9VSkxpRQX56FIfs+PeKuoAJibDNybEYC
	 K8EPn4GtkKZK0CLUJYMIh8a7A0vkKIJf16oMef4tsPBQkLBuaDoujxXELi4b0kDxgN
	 lPf/kNXlgFU19TqA1MSELM1yA1UU56Dsy6g0R1GGY1of3LA1xJHEMOb0L5fum8hjOI
	 EtcgZ0u5zat18owYkYfMYR1QH+bJsmq+xhr/VNIQFsGfqPyDt8lbnrh1pNEsguouZm
	 H7P8vRLiTu/Wy3v/2jlgtPW2OVKdy23tIEPZzUDWNilRzkasA0BYLyf2YckXE7pVxS
	 SzeVc9EW8Hb6w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:21 -0600
Subject: [PATCH 11/12] arm64: dts: hisilicon: Remove obsolete HiKey970 PMIC
 GPIO property
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
Message-Id: <20261111-dtbs-hisi-v1-11-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The PMIC IRQ driver obtains its interrupt using platform_get_irq().
Remove the unused gpios property; interrupt-parent and interrupts
already describe the same line.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi b/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
index 299c4ab630e8..12f1f972ffde 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
@@ -21,7 +21,6 @@ pmic: pmic@0 {
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			gpios = <&gpio28 0 0>;
 
 			regulators {
 				ldo3: ldo3 { /* HDMI */

-- 
2.53.0

