Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793060443;
	b=FC7hu1LiUvdjKVxjs0VzWaASJwwiAVfF4tqLCv7K8YujGhtbO502YBNUexV9ICBo6Ejs
	 22XyzTu7Any06mIw1uGmATUGtHjV2C91jN/HBpIZAarsenhvbSUOneSj1G1ODrNg7JWq4
	 84rl7ZN3fY32fygJJBltWddsIz7zF30kkXEcS+/I0K5AzE0nH7bB+HOq+VKIjiue4ythV
	 omJ5Qe2N6NNvZxgUNOiNRnIHk4vxdzss/5CoBqpJh+kFQchVYTft+GG6781h26QTkfbvH
	 +ypFovtKsZcwtyvfOmlKMh/B1KJxywZG4oEmJ9ZjLpDQKwHPVIjq3aTS2OYDSm2s5RQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060443;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IuMC/ItzG/Q2x0sIFmWFkQOqzTArFu2+LT0DtoyhLhs=;
	b=fBluET6jNeTfEFnQTmsYSlK43zNamXoRV2mryrm0kEmgkT1Ro7HRszkK1WOSsxH5tSjT
	 sDIY1RxRCks6qXzP4hW8XVJ2BOeew/U0L1yf7EmmbTvR51PqAEmCu804eSR12T6mwPZkT
	 v0hRqNo5xIS5J1Tvhrq3clQRbOLkB8cZEMng1NEPMHrTl9pHcHRCBXrmDsVbOXQxw21q7
	 xbQIMP0hAtHskrrEZg1DNR8h/Jdkyw4enaApcaLnZezcbtdAD9IGCUIj/SkgjQHhc8Dnd
	 l61wAGpLYpH8JZy0WlkOJ9VxEv12UM3TYQJOjV7PonkjJLUzojxLUT+jgNW6ELt5V1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJ8H00hp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95846606A31A;
	Tue, 27 Oct 2026 00:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJ8H00hp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793060443;
	b=RUElg6849JaUip0HaRuKn57fk4c8jLZ3H4mITajTe2nOXeguFiikSfYzDopB20bi+3kC
	 4+aUoiWiJzaHXjAfo4rIMc2NkDZCy0hHzUAhNPIgwMgTJP+1QviGJA8pWL2hd8xnOFXGi
	 FQkHv9iCBS0cmOXjaANeTI6YpiFM/h3QipPX0jL9aqTcCmbD6msSynaaytpjtoG3rFypG
	 2nls33m7bLECiTTj3pVm8Xd6LFm81Y/UhiTWlZA6dpEfiUhmgQnyLJKAyqYO11uuXNSGL
	 +jKqUk4EatYBmvyMEqhvIIsl2CiIyhmZAQGu234p0a2KPVV9xhhzcaZTQU7vmEGEmSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793060443;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=IuMC/ItzG/Q2x0sIFmWFkQOqzTArFu2+LT0DtoyhLhs=;
	b=itMPSyvxErzTUcXWGSB52bYunuOdH27PZVicC99i/01TjuXFLOTHqZOKujobKJ2tAzDo
	 oY8UMULViarsFjFLKNUDqOOR8o94IVjpV36y1pebOTR5jyoZj4pP62F1OvDOii5UHuQON
	 HyCnXpeigOmHKpIuF7yKK/XSA8aCjDRGYgZVEuIlF8GxM2KtY9/E2Fh+piOUFg/rZcap9
	 ggr0t9LM8cyFspoTT5Bej2CF8k6aX40qNFnlH+gf/AXndbEvv/9p57udpkhfnCdkoHmsd
	 Ul91CeUtT7yBaWUEqJHaYaCTsqKbYUDWRVuZw89RKrAWH9UyJbMvlTSO+k3FAWHHi+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF7841F01825;
	Tue, 27 Oct 2026 00:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793060443;
	bh=IuMC/ItzG/Q2x0sIFmWFkQOqzTArFu2+LT0DtoyhLhs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=EJ8H00hp5gx+7BMOKxFE3wfzhE+6IVGPv80Xc5H+f9ub637LBxOr9HmrFHnrfvST9
	 eMkMEEB51CLZ0+MZHJfK8NQtEa0/Kt45GLNoZUVqJUH95+dR96uo+hZYxMnS45LqhN
	 hBHhjJBbBd1/89rp0e2gGC6ImgcE3PRgxxOj76XARttZJum2OKem0sLZlT0f00lM1u
	 plic+WHebZRsVK0x6zv3q3Ip0hb5JVoXV7hye2Q20fzj8d+VIjzs25mpKhhWQVzaQC
	 j/nW+nuVhbBrS0IZnhLLLwskXD0ZaB6DXk3IgsB9qN4QsdkmgfshTbve+p7Ucf6voD
	 tWZmK3hL0yxzA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3EEC144F11;
	Tue, 27 Oct 2026 00:20:42 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Tue, 27 Oct 2026 02:20:40 +0200
Subject: [PATCH] arm64: dts: rockchip: Add the watchdog reset to RK3399
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
Message-Id: <20261027-rk3399-wdt-reset-v1-1-de9615abb0ec@iav.lv>
X-B4-Tracking: v=1; b=H4sIAFfu32oC/x3MSwqAMAwA0atI1gaaFj/1KuJCbNQgqKSignh3i
 8u3mHkgsgpHaLIHlE+Jsq0JlGcwzP06MUpIBmtsScZWqItz3uMVDlSOfOBQ1MESUWl8gJTtyqP
 c/7Lt3vcDe+b2R2IAAAA=
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Artem Shimko <a.shimko.dev@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=YfZXV/pwUDuzE4RfqVS8zgmubems4bbmhrrE9YcpAwk=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn330We1c2qfCG7W7WJIXnL8s+XeMrZffpP7bbrWNY0u
 6tuYqhfRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZhI9kyGv8K3etbdMbWcum1V
 8P8zlvO3iarF3nyiIG22Q626KPLUd2eG/6UXO0sXHZkaOKPcrEHV3oWv98XP52uvr7+wyvlWyyr
 ZTwwA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The RK3399 watchdog at 0xff848000 is reset by SRST_P_WDT0 (bit 5 of
CRU_SOFTRST_CON20), but its node has no resets property. Its clock is
gated from SECURE_GRF_SOC_CON3[8], out of reach for Linux, so without
the reset dw_wdt_stop() can only set WDOG_HW_RUNNING and the watchdog
keeps counting through s2idle: on a Kobol Helios64 and a ROCK Pi 4A,
s2idle longer than the watchdog timeout ends in a watchdog reset.

With the reset line dw_wdt_stop() can stop the watchdog, and with
"watchdog: dw_wdt: manage reset line during system suspend/resume" the
driver holds it in reset while the system sleeps.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
The dw_wdt side is applied in the watchdog tree:
https://lore.kernel.org/r/20261024140854.25664-3-a.shimko.dev@gmail.com
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index c46e58d4af0d..7b71b24c1f51 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -1748,6 +1748,7 @@ watchdog@ff848000 {
 		reg = <0x0 0xff848000 0x0 0x100>;
 		clocks = <&cru PCLK_WDT>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
+		resets = <&cru SRST_P_WDT0>;
 	};
 
 	rktimer: rktimer@ff850000 {

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261027-rk3399-wdt-reset-c58d2111609d

Best regards,
-- 
Igor Velkov <iav@iav.lv>


