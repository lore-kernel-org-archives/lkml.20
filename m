Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792446724;
	b=xtMqsTS0/ULJNa/lAMse9CNLdcv1EOxlglA61I+4+NoghbVqCmBFbEuKeb9xNBaumyQ/
	 eDsTmcCLdxAoOX/wDu0l35rh0gogJ+GTnyNTNm2v1VDR8DmQSo0w7p3pEZ12b3y8Oqq5v
	 NUsXuRJQODJvsYOEXMYz3CgmMHvbaNzGzJrNwbX0X4ukXFOqL8St4TQXuBaK58nvbU1rh
	 y4rFYRJjJHVZFJQrO4bwQYyU3lPB0oRUDUlRYkLBUa2gvzCYEMEOdTVpFuglwqikkx6wt
	 xMKXoGmDOTSqlr6DWEhC5+R262VjLqVviJB3S3b3xodZFWr3DshhqAYCUY5pdl5LT9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792446724;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=229bktF/t4K4pyCM5Cj95EqGyJ2vYACAnwGMT9QBk0Q=;
	b=R7IV4cAFeACw9vG/7241hLIWAxEVQsb64H/UlDrMGMjrmWtUfNWV9L67SuOQU2j7DnHK
	 NBbhdZSzfWPXpU3grSl8y+Vnpv6vCJ9iiYYfZgmNydFf9xbsgYUfJp2Gdi/xvuKzQ13P4
	 iY8tkhUi0iRgB2nIZ4mUQp9ZCGHh5+9F3XxTuOqQBTskqHEwaiUYLr0OJER1KAvSkHgpq
	 Xx+OL6nib7QdyLWv0O4/1wYykvPzH9nms26D6bg2gXhamJG7N/yYcMr2fvzKlSfU65UDo
	 T64m39BsPu7XgHLCdGDe8lzzeebby24zMWQfB6L+eKJBmti/g/lKF8DvSWAy2vHHO6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mia+Cm6+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21CA606A319;
	Mon, 19 Oct 2026 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mia+Cm6+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792446723;
	b=EcJIzq2B6Xs9kEz1rzogTOli1aPa0trk0uiZOOkz3McEK7Fr2JhCKufv0wUokndECubr
	 Rofn1/fVtRUttl4qPv8I/HXSAdWW35do74nRshKXFyLzsW332O6laizE5V25tcSqDVX95
	 RvchjY0UXN2KQ1Qw/w5LnYeW5f26100BEcjLkk/eKyo81X7FYYnHqQVu0wryc9pyiYYvg
	 JhF7uaxkkvY/w773moRhaq2xa6yLG5pQ6Ew56YFlFl6w7IlKhOQpM4F1nIDtAjTUnGX3w
	 2AhrTowmjp1fn9lD89o51ZS/tgvNDEmRywSbVtblYUXM9IhYYFZOQNjLiE/Dylzb2Sg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446723;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=229bktF/t4K4pyCM5Cj95EqGyJ2vYACAnwGMT9QBk0Q=;
	b=UaFV0fc6S6o9p0lFJQTReDB0jvO9n4mE23tio3GaQ3CJ5csvjMGjtBYFxk3G0jllr1A2
	 2e/gAM0OtjPRDbg2jUjcM2pva7o2e5voojI5QlhZgdmw0vLlHV4mBaFIcUnjSk7tVt7to
	 VDvKT8BH0iqQhsx5d/tS0rvAE7q78QMUUj6GJGHQLYZD+z650mwcdrfdxKF5IoZTI1F+w
	 koYf9ng0skQNkeW/E04+OMdauT1j9eKsWqX2Icn2X8kWfcStpwyk5XcMMbX/al6GNt36Z
	 IAGCsXeWvzYVq2vOUMp7jZrevuzUOVoeSk9PTXgSVkMnqAL2CpGII2EjJgU0FPyN1qQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D69DB1F000CA;
	Mon, 19 Oct 2026 21:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792446723;
	bh=229bktF/t4K4pyCM5Cj95EqGyJ2vYACAnwGMT9QBk0Q=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=mia+Cm6+HDmn9HFtdKtmEUut9YpyexTaQXadGCigrd47X/iYVEfiy4QejCTFekWWj
	 v3JMR13M7ZTMuCUaiXVXr+F0G5UnW8X8y5R+9tXnkFksm3yUbHq20yqYLY0Ro/yahY
	 PK2RRLX7BqwyxLyRR7OoSLrPbU3e9LWwF27pXFA9g8nuk8TXQ5b/HJ0fwOWLGTpSqE
	 cN08f7jYioj9jtSIwnO/HCCSviFwhESFsCeBcP+AsvAZH+P2XD88pn7eHQW4/83uvY
	 Gb3NQ8fMdm1eqgM/oa6gFPG9tp7vgzxrcQmGIF1uXXx+k4JEGmzdqOIcMtuXoffyUE
	 7bkDqTL/fu1rw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A1C6400AB;
	Mon, 19 Oct 2026 21:52:02 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 19 Oct 2026 21:52:01 +0000
Subject: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: wire the RTC
 alarm interrupt
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
Message-Id: <20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv>
X-B4-Tracking: v=1; b=H4sIAACR1moC/x3MTQqAIBBA4avErBtQsYiuEi3Uphrod4wIwrsnL
 b/Fey9EEqYIbfGC0M2R9y1DlwWE2W0TIQ/ZYJSptTIK52BRroBucbIiy4ne+CbUzVDZsYLcHUI
 jP/+z61P6ALS5vPZjAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=gqWYjjz0xRwzUadDg123AIW6B3N3BYaR8H5aIi6Ymss=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnXJjIKXTE26pG/dCvY67j7dRmrhfs/i4TzbTrct3yua
 I/1ioTnHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiAacYGRq+7Jc36d0uJfho
 TvPjvC/5dvMu+lTmaF/KDVVmvfH3z0SG//Vbzm33EYqv7Dlr5Tq91WXqRR6WnFnvZqzkf9swc51
 4CDMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The PCF8563 on the OLED/RTC add-on board drives its interrupt output
to GPIOX_5, pin 4 of the P1 header, but the rtc node does not describe
it. The alarm interrupt is therefore never delivered and cannot wake
the board.

Describe the line as a level-low interrupt of the GPIO interrupt
controller.

Tested on ODROID-HC4: the alarm interrupt fires and wakes the board
from s2idle.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
This needs commit 5831f5fef100 ("rtc: pcf8563: pass the driver data to
the alarm interrupt handler") in the rtc tree: without it the first
alarm oopses. Waking from s2idle also needs commit 5b6e2a46b80d
("irqchip/meson-gpio: Allow the GPIO interrupts to wake the system")
in tip irq/drivers.
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 5f15c2299509..25a8a60e152c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -105,6 +105,8 @@ rtc: rtc@51 {
 		status = "okay";
 		compatible = "nxp,pcf8563";
 		reg = <0x51>;
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <IRQID_GPIOX_5 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
 	};
 };

---
base-commit: b44e2be772f866985cafdf90355285069ea68495
change-id: 20261020-hc4-rtc-alarm-irq-b2b8c68d54f5

Best regards,
-- 
Igor Velkov <iav@iav.lv>


