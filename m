Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794508525;
	b=Wv7vfTjD7VaueaAVkjOCbdnoQbWE/Q5VSykMDkwttrTWfoLc7zcrdH7vLzRj/smea/gP
	 FRGKjAemyqmRGAWnQLxRd11C9sp7madHMXY6zhaZ3a0rtJQg74TbWHEGWqma0Chj0MjFR
	 anXSS4uBpp3lq5V1UeM6BdIkszfgBRjB2hMjWQ5SMGd/DgJGI0qQUC86oW6SJuI/Ny9pG
	 2JMiNXpWfRVbK7d2SvEdg8Vs/Z95Hxk7JwvYQM8d0HxiL6BPJIgz4EDKwTj9f3tMJYFYG
	 6qQsWNN1vTbN5z+OTXVpsFjhi2iWwrKfMvpA7Q82Kdef2o+5bSvs7cYZvHFecEdMsHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508525;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GgK64frVD9K5IVuLbjzzliKVcQ7pvJjIHqZw9D+YTzE=;
	b=HTc1qUsCmsCZBXXr/mX8JD9+oCjwTa3hdxbYAPwmWj+fpdiCNaTO+MiPRuZPGIfhzhif
	 Nq4cCFG5nxmYYLsh3uFA5gs1Kp10Aa0twynuL6/A5eDbzJUZQkLyrFnqG7e6L6JkyaZE3
	 3tdKRQ0NHNCZtmLNEWBVgMQMQ1yVH4zYttIzEq5y55hjGdm5nZA95GuFymn3tEJvJ2uFu
	 BVsqP0NabnmJaM8JN5d6s4N2WsUIOpeOkyo4VTFrh3tSuUjLwCDnITVPOsH5xPCvVsdfL
	 G2eiGc9V5xwEV8uH8LE8IZbTKjNpla2NPq9bY/OLqE5JJjdWLGiO4VUKQ/EYm/nMUhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3hy8zCE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B40A606A31C;
	Thu, 12 Nov 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3hy8zCE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794508524;
	b=LSWvLnya06BKnKU4VBF3eLI1jKg3XjMqrqNxbB5dYEkNuGyVFvTQTARs2Ou4blT/q1AL
	 Fo1fdjh6sjIWyrnf6ehsfN00oxE9JyLdoh8FwyyROFjzx2r4tikMQsQWseSTrCU6Cmmsp
	 lGR232q6CsYLvxXLyA/NIGMyv1BHwiAWwcXQf4uzLEatSj6tu7C59klNKyYEKGGxbNdCa
	 E+ywxHwQcz/DGMR2Ful978TnnyjULHRgb93y+AssNj/g6taLkIa5wWVIgE7lepENgHr4U
	 oFOer8cLOmBB3fih9qemcSHjC92ehVtk3QxP1l2SeFx9vcO1GStMiVgTL1zoPsKFNsQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794508524;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GgK64frVD9K5IVuLbjzzliKVcQ7pvJjIHqZw9D+YTzE=;
	b=WcHgpUMKPlCr0dx8kU5y/ytHt/qOH6+Hb+NLcP/pCC0FBW7Q11Oog9TM5H7VddBbATms
	 3EdxrD/0bSaADoIIa68DwszdmR1QZeoOXYnB78TgjqG6nwZ/gR290jf+FUMzIQUkQvvHp
	 /80Gossw7MgSpv5I3T2qRePKRmhSTfrpTjG/4MMg2a7nhmqIY+QYDyqK9/HjBQqvF0ywl
	 wo50EmQaXcbm7NPaBcHLBSAqJsXM6CVITCwyoJmfm7T2v1MFMGJ/XfqHWceKs8pc5LRBJ
	 IUlvWlf1K9ajcIGSnSAfaEn2mzgnNG18RdzLzFg7VvyGXNENwAdnh4aklnVnlxxfA2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 540621F000C4;
	Thu, 12 Nov 2026 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794508524;
	bh=GgK64frVD9K5IVuLbjzzliKVcQ7pvJjIHqZw9D+YTzE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=I3hy8zCE+Zm5kBAY/dZJ7/p3Cx7Yq8zGuE9fOQUXJhYdnUmIo7zp7W6OczVsv/aDM
	 AH6zmmgpcjDXxes6MyRSqIoVlz847YIe/sRC4i3xoIsTw2lYnxrXCYhX9Ces6BPr2l
	 yQ985T+leHLgFwM8aWRAcyiUCuxZwtlO7U5M8jRoGcrhcIy0jG6HIrbuVdsFkPA6Qm
	 v/9IiY8YIjciE0eRHUQ9xlZdT3GH2w7gqpM0NPUWofBfns0GZgZZc04LK/OeN/MeX8
	 9vo0juBNeDLHyyMpPYZgZebECsgx8DuPMt9GuFkOymUlhsdWeMk04y+dEIRNAgBNm/
	 NnphsqlmsnDwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A04394748A;
	Thu, 12 Nov 2026 18:35:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 19:34:56 +0100
Subject: [PATCH] arm64: dts: rockchip: fix pcie wlan chip on
 rk3588-h96-max-v58
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
Message-Id: <20261112-b4-fix-h96-max-v58-wlan-v1-1-7e918fc85b88@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTsJMwKhXsW4KGUKY7SaVoGEc
 HeqLL/kvX+FJFElwaVYIcqkSV8hg04FuNGGQVD7bOCSGyJi7Cr0uuBoGnzaBae6xflhA3LNZ1e
 RL43xkN/vKHn3L19vh9O3u4v7/HKwbTvC0Tj4ewAAAA==
X-Change-ID: 20261112-b4-fix-h96-max-v58-wlan-2523c41f099f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Alexey Charkov <alchark@gmail.com>, Alexey Charkov <alchark@flipper.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794508523; l=1890;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=ls/b1TaJr55nJIaXg9urdpu9Pz+PccgRCIwOKYKwuzY=;
 b=l3ZyBULPRW1p+jSeI4lEhokzzAiNlGuxxpGKDusbTYb0Khn8w05MIb1mv2VuShv1r2Qr/5UqA
 XsVJy3jpg9VD1L3xa/Jbje78bpPdpYYqcqj3eWgWgyF4IUDfsxeiUUZ
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Correct the gpio used for regulator-3v3-pcie. This pin was found digging
through the vendor dts. Also add the this regulator to the pcie port so
it will actually be enabled.

After this fix the BCM43752 shows up in lspci and WiFi works with the
correct firmware.
0002:21:00.0 Network controller: BCM43752 802.11ax Dual Band Wireless LAN Controller (rev 02)

Fixes: b53864811b35 ("arm64: dts: rockchip: Add H96 Max V58 TV Box based on RK3588 SoC")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 3811f9a73bb6c..e869f7ecf93ce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -79,7 +79,7 @@ vcc_1v1_nldo_s3: regulator-1v1 {
 	pcie_3v3: regulator-3v3-pcie {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pcie2_0_pow>;
 		pinctrl-names = "default";
 		regulator-name = "pcie_3v3";
@@ -319,6 +319,7 @@ &pcie2x1l0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_0_rst>;
 	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&pcie_3v3>;
 	status = "okay";
 
 	pcie@0,0 {
@@ -373,7 +374,7 @@ pcie2_0_rst: pcie2-0-rst {
 		};
 
 		pcie2_0_pow: pcie2-0-pow {
-			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-b4-fix-h96-max-v58-wlan-2523c41f099f

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>


