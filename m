Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737742317C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109327; cv=none; b=c6lXNh4wJvYI3OiCldWw4Ii9RyciOOclK9CQzl+/UjmYvltjhozHjnZCIicYXDsGgmSnIGMUTdA0RJXNHk7Bv5HlIwmaMrwm6hTerooBen9GvMaITaggG2ql3i8r7NrbTB2vWvCCO0qV9FKFcOQ1Copu7v9KM7oxrpJnRcWxa2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109327; c=relaxed/simple;
	bh=FcdlSDzdUHeLk7zXnkTujjlaMpIZtJvTAJ0MR99MbXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZQ0Y7/cgOg7PojZUf4Zp3FrFToW7rzOYplqPbhBB5v9b/cHJZRcJ9lPtZT9Q0MUDQfIBwkLoP5qhudFW84rYKXbdcoefTUTY4R0c7maN1+6H8nCgBmtDT858W41b9NsiY+gMt9yGde39KI4OBRihtJjUAu3KfpKK5LT+PEQIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5jpUf5r; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5jpUf5r"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afd5b1678so429844f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109323; x=1791714123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9juvpA1LuSjQjypWT3wpnGjBUsPRSPUA2tivnHQSsM=;
        b=J5jpUf5rCKzabzf5JO1ylTiC1p6WkF3ifTg0xWi40u4ttY8QQ9NoEQlJ/VX6xahzjF
         dRAq6FwUW929qiLmL+e2dzKDJ0VsBiJY1YE1LrOhJb6RKHNQ/SUUnqocCQ3ACPh8hd8V
         bqm5+oG5cU38PFXoJuKvI9AThFPkwKerTxr8zqmTd97NNyHarmPj/j8Y4uiwy543sSqr
         8LBhMcZTHViHchcV4R9wtxiZaC2hiVwOb0+uEk6YsrCw78KQp5WSmsc4OxaXsc5ewSAn
         nH2EW3b1V2vWj+J4h1yy10v6AbnVof6+TxNCWJjH/gUJWgSH705UelLaU5fDwHWa20zA
         JgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109323; x=1791714123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9juvpA1LuSjQjypWT3wpnGjBUsPRSPUA2tivnHQSsM=;
        b=ySyMsmEIY5lkrKLgheWbM5nvCZzusF9hiD8HVqhc3hAF3HQmK3EcyuZwxgPSboKkUW
         Bd3UT2Csx5sWUH3Z1el+wBZhcG/8EMmQT2fjEtgEqTN28YhBrLbF69ZT322vsk/hksQR
         z0Tz4Vpr2iC6dK1s2r4if8G3QO2G3Zllsgs/6VxXDCaQZUCUdLkb2TkFJqzF9dx5mxk0
         2yHexVp0LNIA0A8Yo9Wrd+2pzfUxN+7JpB5IcgR1Mw55otcLi/EPm0dcPa6eC9uyS+/A
         2CVu1hFJujyKgdeGrpLt1GpfJ49eV7ScTWodk0utR6nN/Xgd0vCQvmVsiCUN3KazwaSr
         PAeQ==
X-Forwarded-Encrypted: i=1; AKwUvByNVO+BZiAQeoUD1qErjeHhw5ihsf2/9dR1+2cKcFWYyIPNJujSplSvTc4spiynbLeD8tCmhKUPTrGPoZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqmXkOobp8G/DkfZw6+Oa97j8vc8h93MDwByP3lYlLu4HnntBJ
	7AyN6NIeIMIGlX/4dbyjkXf8Mxxp+MzBb+eO3/lWTGPpWJWlPRW30K8C
X-Gm-Gg: AYBFou2orSn+9VFWuw5bWhBrm+MSfIC8gwn/mW6Zydqfx5uqRihltEomrn9VFXpXsqO
	GmO8CXebCEptsu2mptJdKfGDAw6KxMAJVt1l2fjVzdOJ7uUQccPG4UkORNhPeew5lXGngmmPdpS
	IBi78O2qxDkCw6XXITuY2d3SaRBC6HVlNOEZat2rLbjWTAs18E4PPMX54jjT806ks7ML/gkwTdL
	XhNkUkfu+UmZN34bSX0RZeSasNMBYeH95y9IvVlF0Lha8PKsDOnFL+f9kHDrEEaXVSgOUqzuZBi
	iSZ2dqcuUZ0ogIyg/FRREDWRD6jwH0ToIY4wIm1UoPXFQ3ln/hgjAZDSOT3xWitMIgCGGDIJE8y
	qWy+/glzX6UitrymHrRullFZQDPmX5rIEy/CX6qfd5oWxSN4L4NJ+FO3gZWquS/1MfZb/J1oxEY
	J1Lboq4YsnkWXfw0ZtcVdnuiRQ6Uon6jkS0DK4hUzciCQ+e0PKW0Gg5ZvT4nRfYkZw1zDRN43gj
	SyZC1Lj0eV6IwxvtoK58FtJHp4gSvJi5vUaY3VPhxovPx9YFEKSvPrfwA6Kgi5+XDX95ecufLGW
	2MM1NYJ6
X-Received: by 2002:a05:6000:108d:b0:487:27f6:a4d3 with SMTP id ffacd0b85a97d-48b1274ec77mr9525780f8f.35.1791109322990;
        Sun, 04 Oct 2026 03:22:02 -0700 (PDT)
Received: from pablo-macbook.tabby-carp.ts.net (128.red-88-19-81.staticip.rima-tde.net. [88.19.81.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm17101811f8f.10.2026.10.04.03.22.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:22:02 -0700 (PDT)
From: Pablo del Arco <pablodelarco1@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: monaco: Add EL2 overlay for monaco-arduino-monza
Date: Sun,  4 Oct 2026 12:18:49 +0200
Message-ID: <20261004101849.34191-1-pablodelarco1@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build an EL2 combined DTB for the Arduino VENTUNO Q (monaco-arduino-monza)
from the base DTB and monaco-el2.dtbo, as monaco-evk-el2.dtb already does
for the Monaco EVK.

The board boots under Gunyah by default. This DTB lets it run Linux at EL2
with KVM when the boot firmware is set up for that.

Signed-off-by: Pablo del Arco <pablodelarco1@gmail.com>
---
Build tested with CHECK_DTBS=y on top of qcom for-next. Not boot tested at EL2,
the board ships boot firmware set up for Gunyah.

 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e0..859586cdc 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -68,6 +68,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
+
+monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
-- 
2.43.0

