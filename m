Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628772;
	b=A4f/gop0ST58yz6XLtiJfIiWnOMl5ZXlpfnc9hTjTGlBsPCSccpf4r7PkVp+NL9StR/4
	 oXbT1SLQdMRwqig1dRivqp7fQeTm/ukFJ+15uZhwLTD8vW4aaNKG2T+R+m+1KQfu9Biso
	 LrKaNAmtYxcj1rSQ3/DeSNUrf0wTqpMZRblAzAzgVChxvGMazKIw1rD9DUUOxMOP/CIQz
	 1OclDM6tC0Cpy2gWHeu1/7ugSH9XrrC+E+K1nHJcyM/4BiYq5u2TyVjTyJIxmkSZT23Am
	 D3X8r4fhyg1d0LBxFkk5ifKA2nZGkITpurngXNC2GNutxjD4rQALdImcOk3YaA/VbJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628772;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D/s/xAEdSfZnDwTpORRC9ZOWyUJ6URsuayyvBKPDTOE=;
	b=G9ctUu7SEPuaafG36oMwYXDPc45uV/6VJ/rcD7Aw+kHCwedfRMiiYewVCOkWEY48iFpB
	 bmR/ugAXnoviX2tvsbipGTX9NizGOgD/FYzuuMBF0Rah2LTHOmUiNj+ueDPWhd0GVAA3G
	 NJZKKzqVeJ3nwYC2j5g1gM7RB6xWOkDH2t3tq6OwSnyE619YgbyB9Tc3Cx705w5fkHieQ
	 a0h8Md1jJ6u7VjI4gaTl+3Y7N71QvuoSwEF5qBKs5YLj6EDvrOW+CmoTObNQQBql1tNeU
	 JC1oK31YZN1h2oOkT39O+VC8DWmMjNUfhCrY9YHDxIKpIBogb4HY0PoxJ1H7Tq98mFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3JNmNZw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD334606A324;
	Mon,  2 Nov 2026 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3JNmNZw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793628771;
	b=eEZAX9Ttz2wwWwo9eHii6lQUxATqUdV24TYpBfMmnMPlg2JwYSozUnOLOm05HdOS9NWb
	 pxSC9XZ3E4bBjqNS656kYaD2Kb3jLtcMjXKnsvskUmda5WpTyO5UA9FPEyUipj9r00I8z
	 5SQ7p1o5P07gtm3SWeypM+aWE4hEfkR6THNqRT3BbkKQG6ILMfzRUcW77RW05n/gNwwzQ
	 VgogA1bNr8m4Iq0oCvUKus2wMSDIPuameJIqyj6wUSTMAsPeOnN5Z3IlNNe116lhQ+Alk
	 YbCHGhoXn4NVFX+6LrsaAs2nFbnXhXIxNIjTe9Sxz3rfvkte6SLMC6SpX8PSK5ItXsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793628771;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=D/s/xAEdSfZnDwTpORRC9ZOWyUJ6URsuayyvBKPDTOE=;
	b=tf5s65H9m+wD4lmi0yzmLg+AiJLhjfEJcwkALG3emXaLbgxg/GpjLQgCawSmF6r9BBaD
	 SmDMlBK2kjWKUub9x0FTBl/vkt8mk+g7R1LHUZenxX/gNJYIN1fnLx6dJ6ygvU/H+Pamn
	 k3KRgJKrdHVSqrROWoMR7HudZev0iPGpwiF+LnU9wbdtpfr8TJMlJ1t3b91S0AIYdU6lY
	 FVXDGQ63NMgsHLhxbYg/D9x8JIHDwsZZq+SZB8ECXUPF0qAz6Rmi4V2QNo5eKCiG+uRdc
	 6/5qrzIbR1AA9YbPXKxTeyIAzGnprpySmeNqgWM6kNbnAsqBu0lZDMSSZPs9slsL+og==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D84BA1F00A16;
	Mon,  2 Nov 2026 14:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628771;
	bh=D/s/xAEdSfZnDwTpORRC9ZOWyUJ6URsuayyvBKPDTOE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=f3JNmNZwLkDGwt9N81tnnN+iXXr+Zd/ceba9muRmc/gVSGMF9i2qfuQDTZncTKAVR
	 IVqv4SHAbxGRERalRrhNgIYA94kgDoqpj8DRMX9hzxks9jdA04jrEAcSEpTf4uLQV6
	 BSsuOjbaUatyLf4QUADAARPvJWqzHKHbjwyaxD5tGmyoun0NUw01IhyaM70S1iWjkl
	 TYlmBUXzTv7MpcHKsvHOdzhsCXbQ3JOnz52peSXcp4jSrofDLeepN7QWi9uloYxNkg
	 NyuKb1w6HojhMaIIERDbCxK1ZdxTjRf+pr7iNrQcrJgjFp9XntcbbeaXmM+ghcs2oS
	 vATb3iTRFJeyA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 37B3B4653F;
	Mon,  2 Nov 2026 14:12:50 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 02 Nov 2026 15:12:47 +0100
Subject: [PATCH v2] arm64: dts: freescale: lx2160a-nbxv3: fix the TCA9539
 and 1588 line names
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
Message-Id: <20261102-for-upstream-nbxv3-dts-line-names-v2-1-58f234e478fb@free.fr>
X-B4-Tracking: v=1; b=H4sIAF6a6GoC/5WNSw6CMBBAr0K6dgxT8IMr72FYtDCVJtKSGWwwh
 LtbuYHL9xbvrUqIPYm6FatiSl58DBn0oVDdYMKTwPeZlS71GbFEcJHhPcnMZEYIdkkV9LPAywe
 CYEYSaCqLGs3J1nWpcmdicn7ZH4828+BljvzZlwl/9p96QkC4dFeizureNO7umOjoWLXbtn0Bv
 fftTdAAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vincent Jardin <vjardin@free.fr>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793628769; l=2803;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=hHUsd9bJRSMGNR0btcyRpbeMGj6quxgOVoYnLHWHvS8=;
 b=XVxrGbzLj2cVry+PSQYRRhZG1x8x3UrZVxwbTaBtdBhzXNMFdnb2kVkOfErzEd2FTDTgnz4HE
 yIovGfitqAKBx9UEb24BZjbAVkxYLcdVO+RCqW6EsWheUXFhTFYmLR2
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

Some gpio-line-names do not properly describe the board.

The board CPU's RCW sets EC2_PMUX = 2, which gives two GPIO4 pads to
the 1588 timer, so they are not GPIOs anymore. Name them using
lx2160 function with the altfn: prefix this file uses for every pad
muxed to another function:

- GPIO4[14] (ball M3, EC2_TXD1) is TSEC_1588_CLK_OUT, the CPU's 1588
  clock output to the DPLL's reference input.
- GPIO4[23] (ball P1, EC2_RX_DV) is TSEC_1588_TRIG_IN1, the CPU's 1588
  trigger input, driven by the DPLL's 1PPS.

The board-ID TCA9539 is a read-only 8 bit register:
 - P00..P07
 - a test point
 - P11..P17 are wired to GND
There is no 16-bit board ID.

Only the names are updated: the 1588 timer is already described by
the CPU's dtsi then the CPU's RCW muxes those at CPU reset.

Fixes: 565b6713a460 ("arm64: dts: freescale: add Nodebox v3 CPU Module")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2:
- Better explain changes (Sashiko).
- Link to v1: https://lore.kernel.org/r/20261101-for-upstream-nbxv3-dts-line-names-v1-1-7c8eecb2da9f@free.fr
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
index 9c5588a75cdd..34e02102c214 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
@@ -206,9 +206,9 @@ &gpio3 {
 		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
 		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
 		"", "",
-		"ptp-refclk-in",
+		"altfn:tsec1588-clk-out",
 		"", "", "", "", "", "", "", "",
-		"u1700-zl30733-pps-out",
+		"altfn:tsec1588-trig-in1",
 		"",
 		"ethsw-mdio-en",
 		"usb1-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT pads: one wired-OR net */
@@ -254,14 +254,14 @@ gpio@74 {
 		#gpio-cells = <2>;
 		gpio-controller;
 		gpio-line-names =
-			"boardid-0x0001", "boardid-0x0002",
-			"boardid-0x0004", "boardid-0x0008",
-			"boardid-0x0010", "boardid-0x0020",
-			"boardid-0x0040", "boardid-0x0080",
-			"boardid-0x0100", "boardid-0x0200",
-			"boardid-0x0400", "boardid-0x0800",
-			"boardid-0x1000", "boardid-0x2000",
-			"boardid-0x4000", "boardid-0x8000";
+			"boardid-0x01", "boardid-0x02",
+			"boardid-0x04", "boardid-0x08",
+			"boardid-0x10", "boardid-0x20",
+			"boardid-0x40", "boardid-0x80",
+			"test-mode-tp1500",
+			"gnd-p11", "gnd-p12", "gnd-p13",
+			"gnd-p14", "gnd-p15", "gnd-p16",
+			"gnd-p17";
 	};
 
 	u800: gpio@75 {

---
base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
change-id: 20261101-for-upstream-nbxv3-dts-line-names-93b121a5b440

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


