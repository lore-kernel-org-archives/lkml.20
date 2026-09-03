Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518DD4A5C52
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439248; cv=none; b=usz2BmiIV1zuKfXeJTSxaTsQtCj2dzdVfBIpTjMwnTzne7QjJAcZHnwQpv7JO3+K7OLguuCY4j+1yOtCtLs+VWV3iyv/vzZZA9d5UKp3nF3ndewhGgdBbmK4jvRIqsk24DHI81+AOcwC7kJTHbt6diCWe+o/8zzJpuVFnEcNS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439248; c=relaxed/simple;
	bh=ZwJXMA+1QA5TucBLp3r/RzMpy1IYlsUW+V3ZnaKwxIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLxADqh7O8cgIb0+HcanlQmiYQqc1BwgZrkdjR76Bh9NvvW/t8qXnhh7pTTKmh3aS9sYzInDRWW3Fp4aLl5QlgeWXOZ4lS1Db36/5k0TpXlSNZN9KylMZFSfvFrwdQAoqTmnoZ9I3KJ23YN7JN7GTAWcLgH2ZKhb2hQEOjbke44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OBzIGRQ3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OBzIGRQ3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1553858f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439243; x=1789044043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=;
        b=OBzIGRQ3rkbS/quQIlL7memWXfJbDSne3c+qZ6w2V2FP0p/w6HBTLmd0acNS6hcX41
         apVoZiomw47LVhoqk0uCXXx+X6ibMJ3UyE5foX8gSmEE8Oe+XOi5/BslUZJUwM+lr76F
         Yxa/AoTuqsGFyfBtXC3o6JKaCyi44DMYJJY/LntKwCqG6o6blq129mIys6bYZzXOuwzN
         vQFivD1iZqcSNXmj2x8w++VHG7pHhAsq2XB7u7xJvAK7AsaUL8v7KeOSu/2rGnbQmDAJ
         jQH8C/tMHNXtLrURmwRYYhJ7XvBzpLpluWYKKLO19a/1sht9TjwBZGq15EgACn6brYBi
         akpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439243; x=1789044043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=;
        b=WUcB158rXDEihUsFphtF708HlfgctM3E/kr6Qnp2bs26j1wSquN3jH60gusSoOfOb2
         PyIbKjeOxH657Nbd3ncLJC9twQSwNQw3hFREOIZQ9sFwwvAnCgNnxg+E8/DuigHERWix
         ILAuGPVsLXRfQxmKZ8GrKJ0WTjLCXMxuMe5e3NimBu1kdvX+4h6WdthKvkwMw1bXnjgg
         69ucMJxOY1QAC7Uwkrqyeqza9gm6TZ2xQA+rKMbISccJILJo8EOfOpoUVBgDyeK+I3P4
         UzxwWlPFpaVMuZPITolQNj0EnpGXahHdlTzJdCBceHv7GtDmA6JNDeprp0lPjOvB1lsE
         oWNw==
X-Forwarded-Encrypted: i=1; AKwUvByOOyf69XQJiWoZ8qmsVAe58yhf64AEC5JgohOBcKF25tCFGT9Hrl0GoEIHPuY5vvfleYHpEIQhFMplL2o=@vger.kernel.org
X-Gm-Message-State: AFuF++lTAacFQcsBj7gV5z5vDZWvu7u/hm8RAIwuZczzBEN+xfXbi6hH
	cKD8oXSC8Tko5hkVa7x6ePvSqtf8kJ/RK6hdiHO0AgljO9PCBVGQfluOiaxGkSx/NpQ=
X-Gm-Gg: AYBFou3sLJVmHihoT08v3e43JdmBgEiAdkpvePH9eRVkrHP5DeBhOdX5g7QI9SRNR+f
	lHFQa95hMnDclNVI4Y5YlCl4luZMrU9R+5E2Kbd8ngciNkW5BAknObALgRLTPevkiw0d764bjYw
	T5Ggr7fneeErfEJdr9mkROE/j2PQZI7IEd/fuCmoiZMKvWcdgRe+GWRKiYRFUDFk9Zv9WO5/pOb
	lYn8NfO7qzFBl5hMyJkP/moFEG8JXELaOXnhwFn0UvmPqYGw58Bp0+7XGOOS2sj21JNaYY/jAvB
	MTBvG+Avknm2BiFMOay5mdjMVzCYVZ4wweTIEaFQJ0TiX2UmTvPPWQeYMBrPskagDO9DuhNLdkQ
	n2Njvl8ADns1WWYyfa9WkTyoAgbO4D7foEjIt0DE/PUdO/Q98O9/wtGlAW4P8nObCptFgdWoU5v
	Tc83no6fhybenihHqGjbjaMcqTF2XGCPT4IZnIrHUo5GQm/Wz6vDXnk+Ha8Q==
X-Received: by 2002:a05:6000:41d8:b0:484:3621:6341 with SMTP id ffacd0b85a97d-484913b97fbmr25937634f8f.15.1788439243626;
        Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7fddbsm12989384f8f.11.2026.09.03.05.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:27 +0200
Subject: [PATCH v8 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ZwJXMA+1QA5TucBLp3r/RzMpy1IYlsUW+V3ZnaKwxIY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWYvKTfdd5hBzeW4ieFW+qNR3z9lQ5qnZXP17jQyd5
 tzz33yjo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYSU87wz/jCsTNnDzlIzmWQ
 UX7RohDwqKEkcu5ygxm3Nyx7aP8z4wDD/0Lt3VXK/InqnK/+Sy6e/ffjY/vz0WZP1qg8u5DtGfX
 TkwEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 8a8dec80cb30..3d1a2c5bc464 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.55.0

