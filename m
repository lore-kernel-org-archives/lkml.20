Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5782C08BB;
	Tue,  6 Oct 2026 04:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259664; cv=none; b=QJldus6W0DR3KF1VE51BP3m7XdG2cBHknIod/6FblITHl349YC6G6/VjVH6oE7t5lCaol88QOLCeTbjytsS/9xWwFBtHBqnmUi5rMSF5Au7uYfrpjqaKNqYEZMW1A2jo7fCJreBzfFeNzmxajaJnszJPqu4t2kfMFgx+9pY1u0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259664; c=relaxed/simple;
	bh=IuRMhv2jXOqbgtx7SlN/iDd6kXreksPF+78GGWe3Akk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OkIvlKwUuXS+Usj07V+hFUfLEVkahT9uIprt/3DYRyvRY2Q+VGXFaajmUKoO0+RQu7VyoQUAdR6FIgq0NjCkDM5wnx6BMjd3N/LyWXTZYFL88pflV7NN2Aq6pZxWIPD07GO8TANk9Gkp3d0wZBCi0E8G5i/639jpakoD9P0Gd70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8hHQHIW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8hHQHIW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C2F1C4AF0B;
	Tue,  6 Oct 2026 04:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791259663;
	bh=IuRMhv2jXOqbgtx7SlN/iDd6kXreksPF+78GGWe3Akk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=F8hHQHIWrM6FkMdjsU9ZukyWBirQYIxjm+BQuAKWOhTtsQsqm0UvMLJogTMaJKpeP
	 lWIWrsJ3QkIQ+XNCymgvjEc5udI9zDDHpeTSDtsj9jd3xE7SBkG3GtRyCBQezo9fWd
	 EwxFl054u4AxiUJ1qRm3u+NukYZvejoMaZnm0Fgj/Me0AdqM8pA5krEBr2YVsyPEhC
	 AIFMYEkl4X8889NTXWOD8gu9wZ7oMXeRUDK6P3/5TJ2xaWnQ9H/OOpR68lqGH8xebd
	 zhpuLKkkzMrSBi6gJBDt7HmQzg4hgwrHMrrufbEa6s/PiEXBHnsAoRY5vLKWoPiReo
	 cByD0GQNF+NGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523B4CA5FFE;
	Tue,  6 Oct 2026 04:07:43 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Tue, 06 Oct 2026 07:07:41 +0300
Subject: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
X-B4-Tracking: v=1; b=H4sIAAx0xGoC/x3MMQqAMAxA0atIZgOpBBWvIg61RpulSisilN7d4
 viG/zMkiSoJpiZDlEeTnqHCtA04b8MhqFs1dNT1hqhH7xh3G/C2ziMzObOOA1tiqMkVZdf3381
 LKR+zsn5WXgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=RH2EmPkCmqpHmBH5/Nm+KxSPkZ0CLeL9qNXnqDOExA8=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlHSnjrMq7GmxkqKHTf/7Dr0qH5Lo/TzkdMu9G00Ug3u
 ef4ZKbzHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAi9w4w/JUwXLBOWb/u8/mI
 RW1/1N66emlnWgYLWV532RWbHxQuVsnwP3ZCR5ru+QlMVm+KzjjLxl27KMF8McCl7snvo8uz1hv
 c5AcA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

The fan connector routes the fan's tachometer output to GPIOX_7, but
the fan node does not describe it. pwm-fan therefore registers no
fan1_input, and the fan speed cannot be read.

Describe the line as the fan's interrupt.

Tested on ODROID-HC4: fan1_input reads 0 with the fan stopped and
rises with the duty cycle, to about 4400 rpm at full speed.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 5f15c2299509..261a42560a5e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -21,6 +21,8 @@ fan0: pwm-fan {
 		#cooling-cells = <2>;
 		cooling-levels = <0 120 170 220>;
 		pwms = <&pwm_cd 1 40000 0>;
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <IRQID_GPIOX_7 IRQ_TYPE_EDGE_FALLING>;
 	};
 
 	leds {

---
base-commit: b44e2be772f866985cafdf90355285069ea68495
change-id: 20261006-hc4-fan-tach-440c1b874a04

Best regards,
-- 
Igor Velkov <iav@iav.lv>


