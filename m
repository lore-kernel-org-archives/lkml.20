Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A83E5A0E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374603; cv=none; b=dIUfaf2rMVieHXMIHEBhHMsRRxc/rDPlaBdSfMKfgVJK3knUJt1Wh4CjuyCDV3xEYm5kFFGcL8dVKGGby4RXp0FtZwVQgge35M3Ycsbl1o/nytX/eGOQuOj/zcuIQj0hlOqnMq+184E+w4fN9XCWUC7d9nBwllFon2rnUGFnLKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374603; c=relaxed/simple;
	bh=5Dm600bPPTKtyrUOHXhYpa9N1nPifHMEOCkAWXwfLx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJBosyT9LVcMgh7RrL60QkQD+kq1kPY5k/jsRlKlO4Ph9Nu+4P/3YN6ltCxPORV78MBKajA73Mc0Z8phIKJ9EIpCzYfkWlGZdy/qUaCs2yToaH9I+xWPhMY0svaYKLgEwJ57KdaUlDJA9nZn/aTqPsFpBYo1LkGNkquJmlAAWgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrHk/JKV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrHk/JKV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso14308415e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789374599; x=1789979399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygduNeN8JV9frRntM5qlOGqrIEENJQh2+4j84dc0190=;
        b=MrHk/JKV63eWsxXiwSMvRuGT9aF54r77L6NN2Luj95rMcl3Am0GjHA+4DzQgUyqf2C
         VuvHggZLyn5mmhSl+zUxjp6VhtRaw0Fye/KwTycMwVm90J8Wb+pAiK/Mn4BIgTRZZky9
         tHXHwIdXB8BAqbA3jb4UQlr+LkpW1xTIwRmfnK3OHTQ8TEC3xhFtouihYCdGYDTb52jd
         4032Iycp5cc9Th/r/M3bQt3mvQ/8mSgZirLH1jFuiYFa8o88JmgY7KnZvHjIkPMW6h/C
         MzXMSWJ/qzwVrpQ02nAW23vNsokTTjHVUNrYneumOmVhXA52ByPb7Is4Xztlw3Cs69xf
         zeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374599; x=1789979399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygduNeN8JV9frRntM5qlOGqrIEENJQh2+4j84dc0190=;
        b=osaLsZuOsgWgzaoyANOHiDkAsZ8+Cpa39mrh4MdNi5LT7kly1n/5NGBtgYHVCXp0zX
         HbKZiONsH116hkqV+wgmxAzaAOmRnW7kpYaExrIYv/KQIRw4c6jQ6kQQ4T7SkCc2w0NS
         EvIshSX4Toa+ecoF0KnbQ5qHDv2BJYiNMt9VcheCar3ba+iVfhm8FsArvwVCw864CEbY
         IRP+3/8c7ZAHtINZHZmjOkRNB+njZlzOtryS395GYD7FabGMpPuYUMYCsPLkyALshB4f
         nwKmOFAnKe6FX+YrzfkkO7yiQ8qPlJyLb6DRA9WY66RBsX2QnQWB2lJqJ/P7FJ9o3Rfa
         OVsw==
X-Forwarded-Encrypted: i=1; AKwUvBwsA+m8omKY/x131t2S2h+GR1+QjgbiQLsXP4rGZXZqGB4r1aiuQuk5LYOSbAt04Wrm8V2oOmywAMmt25U=@vger.kernel.org
X-Gm-Message-State: AFuF++lEnJ3x46e6mVzBW59dzjMoDxgvfTFYQ4sO3YUQJKXP93ZvgK3f
	4rXTJAy3T+u1T/9Dh6ZSzsfJLF0ToEDJgYLOLDRN6JC4JqhS9E5ZP+Ms
X-Gm-Gg: AYBFou1awa9pYJteETbvdID11pTL5GqoYgrznouriDairHQwSoKbmnHibnIAl2VWvtv
	0OeR7aC7r7X/Sa8xT4Db9NllFO8yX1E9LZUxJh1rJd8mmEMtwPVls0P4e6AsIM2jFeSUcpEQ7W+
	ok2fWJRynHESvplaVnqzdIVP2gea+zdTDuRIl3h1Y7nH8fEv7ddKKdMaNUl2eeAi1zVTdKnRH/v
	crZS0stTL2rQf81ZEYrpXQepAsOv6q8vRKLp88udLV31gtSTD4xbLnX07gsc+gjVXMYxYTUTHrb
	J3Y6FWjEc9ubYIGj3uc5TNlh2lbHNpFr3mXAT1Q1Z7zaHJpR0STzRk8hCBVrbiP5YMf1X9s4x5b
	IWCGzUKg6y3KtKKyEGV3G8QO7ilfPFyZ0fX4a/R5Ttnq44EXlRvwGQqeETBBRiuC5pfuxVv7FuX
	gB7Q4TAxrn9a1Ou+5+YezIRIl0U1d+VdyqvO7gMdng3OOc2pFwg7BUkDmPjXeKEgUDdnq9Drfyw
	ojqdg4NXtaGhdvgvA==
X-Received: by 2002:a05:600c:198f:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e7a66b2c5mr24553115e9.10.1789374599199;
        Mon, 14 Sep 2026 01:29:59 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm23378826f8f.30.2026.09.14.01.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:29:58 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 14 Sep 2026 10:29:50 +0200
Message-ID: <20260914082950.9393-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors, the battery cell voltages and the CPU fan
speed, and drives the keyboard backlight. Its interrupt line is TLMM
gpio66, falling edge, for which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

The binding and the driver are under review separately [1]; this node is
inert until they land.

[1] https://lore.kernel.org/all/20260908183403.2107-1-okerixx@gmail.com/

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index ecc8c34..30dcffd 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -652,7 +652,15 @@
 
 	status = "okay";
 
-	/* EC @ 0x70, irq = TLMM 66 */
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-slim7x-gen11-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &lpass_vamacro {
@@ -983,7 +991,7 @@
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	kybd_default: kybd-default-state {
-- 
2.55.0

base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
