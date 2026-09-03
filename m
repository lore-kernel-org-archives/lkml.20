Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824EF4A484E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439242; cv=none; b=SE05U7CZUdjSx4yJxghmLsIIRxLSc17SaSVHCBmXF+8HK6NXN4Mv6PzyHxpfj+MhqG4Lz/WpstGTgPmgCRaZ1rD+UShgUWO72itdSdriS2mllls1RTrLhRIeC+omvY0dtNLKIZrkk7K/sTK7XIZwdQXkp+JlJ7MzZIodRMKjr0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439242; c=relaxed/simple;
	bh=Fwl8ObuLky5qFvdgJbDIgRGjpmOwOd7ZlgsEnJiZjoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWS44RTPaTbBbFocSklCnylVl7IdUwGaEFhURanjlFNC/rjOoDJ6vJYukJ2jwi++FMsPzPj5yl5yyCs1mJy03VJfTjVH3F2qI16AH7hHeKb2hhlePQFFeDHZawZk7+9bFX4+b1om3HsSzdCS6BmHi6SI1NhXyYg30Phj5rA0EOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bIyvtmEo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bIyvtmEo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b9320423cso23295615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439238; x=1789044038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf3srD7fS2u+LExYvQV3AaH8PE0aJrD98efi0HfByYg=;
        b=bIyvtmEoxPqKlrXkuuRCuqPV5hjNLDcXVRg+0mfuSoUK3iq1G/tfJBImrqJxzoB5VM
         5drqrh6MawnHVbIB54/+2GDDwSPRJJJPG5jd68Df+Wb+V+b7AvoF9mXNdf3pVlRHmIC4
         /DpegOK2ftuHKykQjml59Kdx0Jl1Kn1cCKYuhDZdQaWdTzhOHFCLhAJG1EMDZ46XsCuq
         SE6W8pPwh49pA6CjhELX6Uv9Oy+rA+qagS5gErMD7f+RTa5zXX7IPjxmVbmophFhroC1
         8j4ntD+mN2BYRWGE9UZDRuAqQ23oN7xpZ9eagupoNCs7WiaELNCXSbEVURxMJwuFJ9gy
         ctaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439238; x=1789044038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf3srD7fS2u+LExYvQV3AaH8PE0aJrD98efi0HfByYg=;
        b=nizbhen5ePne/SZRRbuhfCeHp2yyu1QPCtjsTcGHpjgttKycExWtnV+2rhuyleM+mm
         m/HnaKfGHe5T+7kjVTQIGYUoO1Kgh24TbqrJ5ydJqZUtBiaH2ghSMVXzG1JUhhejetWd
         16Pzvvp42BsCiD+SwGmWXTO6je/Ge3gVGgSHA2P7jOoGQzcMp0M5Arab/E55y7g30dKn
         hMttodl5EkSuFX5xDVpPIn7kPS5x5t2ml8ABMKWwIAdGpbgtBlgmMT6jg5Vcmb+nATId
         4yjds7WPWUxcFp241YeWyo91a+TQe2x3A0DElsLDdxbDghUbBQSWNEdvdneTg2iX50rh
         I3rQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjtbuq5yoaKTJuCXapUM2bYac9T8CNc3jPzSULNK5B0o7rOwzoY06PycKunOSr7mMe+qXvsSdA0dekPLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kj3e2DEEJUP1bKDS9A2MqRZwTEGNDoluct3Wk4ZBwL5li8jbuN
	V8CUuEb+SOJI6Cs6Knwgu5ql1I9SBrwQtvKlYfNB0jqbFQZAK+asYEcnK6nxLRRAyIs=
X-Gm-Gg: AYBFou0V8jyqo8VWKh0WLMYxKm3yt1cuYtktns0SiooF+ys7xCcHSaKLQdbOnF+zall
	YJ5UP7Lit5XB4UXIBqxzKOVcQZ1StxsTa/sJROcDlKFVP0wLklJ5uuaHi3pZsgGv8LKuuIm9HEj
	t0DOd+AyuwOWZjB/IY6aGn7r75fdKPiW5sjCV4nE4Y0M6T0c3nVvo1Bm7DpKVUO9nGRMo6QLUJs
	wUa8HT8TNmY3B8e2P2xd4pNIRNulrUpxNfo139iUczKUCFZABfXjSvBhnhV6BbdIayNctMB0lrb
	SNop240tVXWFnCDPhWuNSKLVOdQ/pmJJWjvCHjX1Bom8ShhvkUjelkApjtZTinlT/PWBdzEXBb2
	fnAlli4FqgxGNzFExMOhXrmdE6v2N9ZKPJYyAOjuksNx9dVhIam0t6v7tOhcwsLSNTL/IiekAUQ
	88BJhDuZWIDxYYY5gXDP3Pywc8Lsc4glLEBOlHd4Qv2uUtctWWLYPVsosqQg==
X-Received: by 2002:a05:600c:3e0a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49ce5810b5dmr269244445e9.3.1788439238198;
        Thu, 03 Sep 2026 05:40:38 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm67325465e9.8.2026.09.03.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:37 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:23 +0200
Subject: [PATCH v8 2/9] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-2-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Fwl8ObuLky5qFvdgJbDIgRGjpmOwOd7ZlgsEnJiZjoE=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWX13m38JvXyxaOLpF8sv9T1mFyhlVLg7f8/H89XW9
 6ac09Wa2VHKwiDGxSArpsjSmRia9l9+57HkRcs2w8xhZQIZwsDFKQATib3AyLB3b/u3p7cOyDzI
 PHJdzf+pusOLH1fXNLbt/3nzTpPn8yv+DP/UK7O5j8ed923TiFWVste9n/qrbPPpCy+V90SFFGq
 33GEAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5de..a8c794d07343 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.55.0

