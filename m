Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA3440F72B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358021; cv=none; b=orMdt1y70OHS8Zo11FCAQtSbkhKV2zQCnYx1D9aQNg1UIfqrkx3SqhrxD5e9FnEndUKM2YnQo1sM6o4KQNE7oNDp9WA9AaOk981iVujZzpyDH6BnKZBU8arTvfsbM7Aw6cci6O7agYqnU1RTDUhB2W70vp0i5oJr4wkVQ133IGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358021; c=relaxed/simple;
	bh=gHXc5vVBhh0VMQqWepgZ4VCObxga9kkWUFdI6aOi2Zk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BURFF3L3mRl+HSyCy15aShJHvQTyUy4wKV0v7g/iqibyMvd4zeiyRjXKvGL15q5ySh4bvycy7Ouyy2tempvL5rlESrvAkX7cEk6NnVid9YEEwYXOO/WXw6gmjz1jzeBsFn+Ntqq2Ay/LNBDNRjtg7YhYvUw4MQ6rxBuxmOErLHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ/Ia49b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ/Ia49b"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso31340555e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358018; x=1791962818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uizv41/IVC5pvt4ZD4nGKyhTPzmnLZ/+xC43YC2+lGc=;
        b=kZ/Ia49bwufnpr8/+2WZMmO8eFr70cLpXL40NabSTyPd6BQnsY5ei8APS9bETtMN3p
         owV7ZQYDcUmIll4IfbfZ3v7nE2+qWDkLqAxtniPt4eU5r0zVrwLgfS6RruPwOt6Ejq0C
         grS5E5JSRMpd45GbJCc0I+4641bVVxs756LgjeADL+U9U1V6FpxxHkjsVV9TLXT7Czm1
         rSCQk1x5y6n5ZDedybL4RqF3VQhrCEvgnKHfn0UJYpPJXiUqNm4tpOezLehGABQob5r5
         jWENxhGzb3/W0kdeT/XuD/ptzbElVknQMffedinFKDbCbf/vkzwmZ5LNHHqHeQTadcLV
         nWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358018; x=1791962818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uizv41/IVC5pvt4ZD4nGKyhTPzmnLZ/+xC43YC2+lGc=;
        b=pmMhdDIprgBb5EjIuzftJvV0ltxIDTlaPJn4pWgquo0L6D9SXTbQR2gUjRPFQ5nyhh
         KYvIVrnWmhLJlURXMvzFsD1pob2ZzUccRV5znd1lsTEfAOClMGj3SElprPmVLXsHXYHG
         TlV5bkZrSHau6hnlVYhJdRgFFhQo2AVaF6XXK4ttjZAngssJCp8Zyxd7t8/TG+qgJBa/
         B75jvjqmHEuGBBK2nCP70xyGLg+KC5LyoG2r0R9YbpURtRiZihGDSkp3SZdVTefaKTMb
         JG9VjAWA15Fdg+Hu5vM3yqcm6XdOeOaqCfxZlPrtIm+TNH3MEWmmCrOhAOFkOpyrS22/
         rXPA==
X-Forwarded-Encrypted: i=1; AKwUvBwHTyZth8MsXIlDNwEZItnRKcaiIU+8jryThqEQT0ONYOGRsf2hDlunKp7Gm38nxgmT1DnNfrx6sjFGN6M=@vger.kernel.org
X-Gm-Message-State: AFuF++lolCxmbVlK1j5SoMKFiafBgYR8hq2syTICeSaq4C3JteuL1X+7
	FZTKamgActodP5AlCxUEQvpbB+0NxqAjQ3pY2JU0xziNrmZMWPXgNpvr
X-Gm-Gg: AYBFou3TpMPmyRW4Fdhz4D+BBuewPZH4iIDM/DN5dCU4p1H/UNKVoUVBYaPJKXpm4gq
	wmBwGssJpOJXSFNaoSrWtrCzo6QwlQR5HVGweIfFpaDKp8x6XFUzDhb0ROPv3qdGRQ69v6d4UKH
	+X+ZDkS9I0AN0/VxVVETLVPxvWYejb+cz1k5tW8v3p6fVDeyJ95MLXYlvynHGs/C0yjyp5LrQQS
	lK/N2Oq/eW/7t7nriH2NiM+QI7obJAz3Z3Fv2UK09GiFMRW70KFgYKlWbpKd6vVan0zf5msQ77T
	5Ki84Es0Z4T3L9Q67HOY21Q2KYUXf1RBLyr6doCPLomX4yogN83TnGAebsB5Q/m9O/vdIrAb6lL
	VHsN3QBH/p6i86FDUhuhj2SyUa9dCnNkMl39DcbDmS9pT05DoadqFKsUMyD4TDZ1N6rBHp3Zpzn
	d+gMz8lHyyzch+imv7a9dPENzIorMW8xeSpSN6wyK468tppgq3diRR34q5k+U+Wmg7jdtBmPZq5
	9y8vB5u
X-Received: by 2002:a05:600c:674a:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a1800cd6c5mr17268485e9.1.1791358017994;
        Wed, 07 Oct 2026 00:26:57 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:57 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH RESEND v10 3/6] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed,  7 Oct 2026 10:26:42 +0300
Message-Id: <20261007072645.1618147-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index a92fbd3..542f27e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -58,22 +58,6 @@
 			interrupt-parent = <&gic>;
 			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
-			timer0: timer@8000 {
-				compatible = "nuvoton,npcm845-timer";
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x8000 0x1C>;
-				clocks = <&refclk>;
-			};
-
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
@@ -137,6 +121,13 @@
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -161,6 +152,15 @@
 				clocks = <&refclk>;
 			};
 
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 		};
 
 		apb@fff00000 {
-- 
2.34.1

