Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794781807;
	b=fL28BdhR3ae44vZJvMgWdEsZPN2/thAgLDkLBpgGk/FgWebYB7Wcqm4X/Nrw7ObiFU0w
	 pMWjoZVk6oj5N4vXQR4rKUpzyYkvKOAmB0EADOYwBJie2vU5I4kuID9/6NDMNPN7x5MXm
	 gIBcCFkz1pD4KV6ozXZicnNWCh7a7cCPzYJmh5gePQH8vXS0cOGLhd7YA3Pjd+x1te2W9
	 X4G6idm0H9q/NcSA+t2xnujx4sQu98djuMC82HHxDbpfu6c1SFPtLdVpgntIC5zlbAJB+
	 GLdMqSoBGKhJVm4ckD58t80lB9We1ZllMziON5JDWu87nbMGfy9XbvQfHTlZNhkl1Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781807;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UkiklBSmigTGFwB3QGp5YCKUqwJdvyqJPa3i1ak1MZQ=;
	b=zPQaRZyHrSwUtKhpA+ivQcveMStUW0QeHQVLJvGtMpW+IxrlOPX/FX7WLCpYZm0VAwP3
	 rjnBM+tyxyxv8lwBLpJ7JSe0fTE6xcbqJ0LmHeYw3wFpQuXTFQ0tz5UmLB6wpck8U9Qr8
	 TVV5QHpPUZDRXCjX8xY+YjR2bsl6FO2x3tyYFfpIkjritq3tv2eWzui94Ex5PX4VUnLI0
	 p1kBes7QlEs9QF6p43aGi8AmY7IHMXd1VnTR0heCCYdvl2gI4rLOoiJJBK6Gy9cS5vlnb
	 OIsfjBiMcsgzvv0ht3/Y6x5zEcOU5taEzKv9dIjl+Z1hpvItCNKzkF3jKZgTIkEZV2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q1+k/83u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F98C606A323;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q1+k/83u
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781807;
	b=dmf26HyWukgAprFEkSlfsNpgDQXICvdQW/TUfDQgI9lR4QAPa6F38bLN0GeI/XpM2e+o
	 4nYP4c1Y6knHYve0WOemxi8R0hhY9L5IbmY0KbsVhlU4HGq2CRO/ZxQ5vynghXmJIrtZL
	 a+lGXVMm2BasHhEmmQpoabRhlM0nm4WKfVg3FF0t3a9OZg+vAE8Ero5sb23eIeB8SiMMJ
	 UyIYhYvt9WZ1mr7kGSq7FxGUvPpN8O9wBvUHTozo9aum+c8ZF+S4sy2NzBbc7Dfe1+lTf
	 1Qr71tWrfzq3UzwGd5x4MdmdnRWycMGtwhETVqpeRhYu84ho+yGXDFRQisORdP4lHrw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781807;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UkiklBSmigTGFwB3QGp5YCKUqwJdvyqJPa3i1ak1MZQ=;
	b=mHIImkop5QdIYtADJA4jCkOJB4yLgdPM6NIuAsS9zHwStduktaS2uwOu/n1S1IaVlEft
	 zeBJVCdaCTpRC8ba0gP/caPVh0ixiI7Z7gUTQYvBBr9SKzS0eNyDeIIA0bO2IPLZoSFjH
	 6xfSP1bdBncoU//0vo21umo+jr1T1yWBgv5g9Hl+N6uZFyEQtmwMKhHmNwPBhsi8UsdUd
	 48m5djhHr+bQVU8vYB7VcdzCnTX4yWK0H2xcU99ScO1t8lJ1wydlbG4sHDeIVYTnSVqEL
	 8Vcs5D/yFMrDzl1u3CKUw0HzVWkB741JSSYei5WFGkJQIhiXS4mIbgp4Og0Wu5cK2fg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7D9E1F000C6;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781807;
	bh=UkiklBSmigTGFwB3QGp5YCKUqwJdvyqJPa3i1ak1MZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q1+k/83uIokbGty9IfQqgd6b28ScGGgmrFr4Pxu2GK5UyaLagznW3xG09WYCPFtKS
	 WGtTx81CLmgpKLtfBWG7P8yqCjCMUiaw0hE7NGpYpwXuDR/gjZrNUtuff/tZYWDGEQ
	 QH1caldzFK7ANgdCcpQwdt+2/5QowyTy5BNPHn/WuHf/GtbtDOUxYxT8YoQYFGOuOr
	 w4Ujdn4gTx4CYWkJxncePQ67N8V9mwCaa0K0zQ+zk9FqJQGv6EDw3H83DqNmjXGSF1
	 s4G/CvffQfaQ0QyooUIjvIE2690JZ5hpol+XL6B5vzaPrs+uZm+Wjl01ZnMKYOslYT
	 pKd9PNq5HkIOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7471D4A224;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:37 +0100
Subject: [PATCH 2/7] arm64: dts: amlogic: a1: Add ranges to periphs pinctrl
 node
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
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-2-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=oskDA3lqc2OXkomXgBBue1EJY5c1W7W4Jw8yaVrxwc8=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9Yvo5RVdYkvJ4tUbw67vWqhh93cb+1r5UT47rxjZMpg2
 T1/5Yt3HaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBEDM8xMrxjb5z2kPWilo1Y
 f3tE0mJ7l2mhck3stosrZJb+utc+k4Hhf+CBy0s3WEb9X5u3ONJ+r9ayk5c2egcd3n5p9rxkmzu
 SArwA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Building the amlogic DTBs with W=1 reports the following warnings
for the periphs pinctrl node:

  meson-a1.dtsi:131.33-483.6: Warning (unit_address_vs_reg):
  /soc/bus@fe000000/pinctrl@400: node has a unit name, but no
  reg or ranges property
  meson-a1.dtsi:131.33-483.6: Warning (simple_bus_reg):
  /soc/bus@fe000000/pinctrl@400: missing or empty reg/ranges property

The pinctrl node has no reg property of its own, and its empty
"ranges;" does not describe which address space is translated to the
children.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6f6a6145cba1..f59495c1885a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -132,7 +132,7 @@ periphs_pinctrl: pinctrl@400 {
 				compatible = "amlogic,meson-a1-periphs-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x400 0x0 0x400 0x0 0x198>;
 
 				gpio: bank@400 {
 					reg = <0x0 0x0400 0x0 0x003c>,

-- 
2.43.0


