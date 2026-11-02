Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597006;
	b=aRvhSF41BOaNv6HNK/pDIDioni9THWBUwMj2ic3acSMTcjZmFn4JF+B89aXlKg+i2bBu
	 cLnWfVO5slbr9LO7mSelt0qi+jlg0AwvEQ90dPB6tF69gK/dZrMZPP5ylkney8w8W8rj1
	 cJgjeU0Fbxna3LC+Ew0NH8nPYbMIJmc+PKzor1bPjB2iQjGYaEPpN5HQzSbNMGdxGDZ0Z
	 G5hoG9azziRw0gbSK7xI/6SiPwJlcjWgqbwtzapi62X0RkaYT9AQYdSO72cxciHu7/69W
	 RcNehyV1R+5vZ8yKsuvrNmnI6JF3sAJZSjMm46pxOMjvHQ5Xu08DP1Fz3+vWR6hKKyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597006;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=QQCgfQS+dk4ms3w4Px4H6ZmM2kHQWBk6zLTn53JwSDc=;
	b=2IYth36vELtBPXta8OAB+nrpXB07yOGn/Jt/vW0XmGYSXkf3PYjfnZkjM0B9eFucK5Bb
	 eZrh2R+Rhxk1O2n41Aa5RzXkYfmVO7sghXcxiHv6ukh34ysrdLbouaDxIueo5C0o2sESK
	 hc8ynxaSk5+quz+GmYiq3mL1sFQlHe9m4twR7YV4av2XUkfDlJCCaXs9VtN3CPszwFOhw
	 T54V7d4lxP74qThCTkYLzCNICJ38JYY8yvihfoNx2IZvdpvbFILPSUqdtej/HD/Xlc+t9
	 q/cpK+6l+HJ11up25aW3hEQ9S7+Hbd1IAi02k+umgZE+Y0tvmjBtzLlEV39vT3tfLKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hS5e9iIv;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE82606A324;
	Mon,  2 Nov 2026 05:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE82606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hS5e9iIv
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E333110C2AC;
	Mon, 02 Nov 2026 06:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793596993; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=QQCgfQS+dk4ms3w4Px4H6ZmM2kHQWBk6zLTn53JwSDc=;
	b=hS5e9iIv2i6pUmc8znxKj4a6lbrTHRAgFTnWJoSdCVp+DaCKq4z+Y9ys0d1HYk55cXJ9iN
	GzTnOV3bfnu9XXerhL37930ZEKxqjFi2fta81JJGFnfxc/tEkYD+3H5WIRdKCSYMHV+jvv
	iqnJJwvhJoZsUh4tnyaBI0DMwgBsHau24JRCtLkAoPaf4aq/femPzhayv0uWQsCIgYDq+8
	3A7EP6VM3CqVeiaW3RaRLI0UV5dLCNAUtUeeUB1LEzlxI6qunA7GrpV8evQD9EhB+jY6ej
	5yl/2NxdnAiJHHznZw58Hh67zPX7JS9j3M4kjvGMzfdA+tX+M1ZYOEC9H+fHSA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: stm32: Fix STM32MP15xx DHCOM SoM PicoITX overlay application
Date: Mon,  2 Nov 2026 06:22:37 +0100
Message-ID: <20261102052306.868349-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Generate the combined STM32MP15xx DHCOM SoM PicoITX and overlay from
PicoITX instead of PDK2. Fix the Makefile to use the correct base DT.

Fixes: 77a5fde00b9a ("ARM: dts: stm32: Add DT overlays for DH STM32MP13xx/STM32MP15xx DHSOM")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/st/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 10c5d75f6169c..f699d37254e24 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -94,11 +94,11 @@ stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6-dtbs := \
 	stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtbo \
 
 stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx-dtbs := \
-	stm32mp157c-dhcom-pdk2.dtb \
+	stm32mp157c-dhcom-picoitx.dtb \
 	stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtbo \
 
 stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
-	stm32mp157c-dhcom-pdk2.dtb \
+	stm32mp157c-dhcom-picoitx.dtb \
 	stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo \
 
 dtb-$(CONFIG_ARCH_STM32) += \
-- 
2.53.0

