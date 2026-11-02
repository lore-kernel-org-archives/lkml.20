Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649335;
	b=15Ux5yguwBSDjm9lOAnuO1qlW+8ASwxsGKLIywB5w15+YZyv2GU/m/NhP5SyA9qyGaUu
	 X/qb/x/rpCKkyLVG/leAZZBUkXX5xf2WLznasOd8aABvaHzYglY0Mmhp2vpUKr9WqJgWu
	 JTwqLKumRxsh5W6tQF8p9g4dCL++Q/G7t7nIrSZU7DUeTH5gA+biC+dRSZZRW4rEMY+pS
	 rhZRMGxBISkxNf2SlGf1HgU6E4wMErH69UW6mzlrXB9OUlAQZ5CkCsj1jZgXTuuRbrMnc
	 zvLHZVTrngdXpmR5iC6ZdDFxDxdA0/VOGlyyFiPkwuNBb7Cp8KjUr37qBTy82CRBH1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
	b=wzsJzLQ5GrmtBJGkaj3b3CsbhkXt0iikWWTp7UTqidc3K7709VDIj8AFoWuwJZiU2VmI
	 8jLv+PujXX9ZjjmmXwVqdFfTgya8L+jAzJLQIXh/uzNyPofatYgyAtmaIUBs8vYUOTPN7
	 5XeJGCDKrBshhclZMzRamr758jDe4x1cEMw5PCEocNfFMCX/8idNmFh7GVhfnyH0/jzaY
	 EgUJ0Mi8L0WhSHyXE+bQiYQENGgqKr1vlebUfPgE9yi6CWBV7RKBVQC/29OPm6rAWGJnu
	 IzN0oL4ghhmGaJYRl5xCRkm9zQbxkEX85xjDMFp/GgeWGkPc99khMjy0UJgbkQPgSrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0v2zrD2;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5CE608362A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5CE608362A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0v2zrD2
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed0b68895so2392696fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649334; x=1794254134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=n0v2zrD2lqLetQ6g3G84j20Rrtg/R1EP9jN/aHEIfgZP25z7gO2ZiQxGvXCAE7GDlB
         61uXlfWq0KeXatPXZrGQcxfx5KL+qjl8Ea8WM/L3qjtgjFdav0xCeQmqtuo+ejzDfhpx
         ZOL8zs/i0qg5II8JNtCgUXbfm5Jm2IJwsRRbNHAHl90VZxkVOlJVtM8GdtM6oMynlics
         0uFSph9+DjaLchzU0sAY4XQtKaKLVol7oUBYq5ozo6dXkvpkhMWXaTyvLOU+BTE/Ze5I
         d7hmoEYvvJIvxp8JvzIee4YiwllP4XOaLmYYcacxwt65DI3unOeBTyBdgIMxk0iQDoht
         vlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649334; x=1794254134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=RdiorTKFA7re8NnUftexaPr47bKLNeIuD1DyGm3tDHh6wX+K4sroOcqyvpqylEaOtp
         Oh5vzvxQVlALQQXnkc1eQ1dr5eD2s+YYl5GpLCCMyALRlgsjdWxyAwke0DYIuXYY5C0A
         PwLLgrunQdEM4wx9LBE4Kr1gzJfIJPI6YGZ3quRRQiPBe0mr0SwGFG/Kp3cmUkj02yBv
         HJlyYq+A0TFOUGtzeclQMf7a4fdsc6q6nk4RqYFnnoHJ14bd/T2ggJzU6sdPiPG/hlzC
         UZPatLtGQZJhwpyQ2q+TRkmj3Ohrpr1PZdS53x0N+v5yhdlz66I3LHe8LuaUnNiD9duA
         JBIg==
X-Gm-Message-State: APuU4Z9kImrR8zYS+TkeknjogQxR5k8KoW+P9Mbf3bsyGHsnUv0K4cYx
	GOL7AgNxAki23Xx7d+QQu85Y45XU0NGyEQdSAnYEBN+6YP6UW9LTFEgO
X-Gm-Gg: AYBFou26Scf1e7ylrxgCOEF1wgR4sabVHkLOt01+Rtcnn5Vcw4HggBS3ZmJqhDX2TPH
	tiSKDaThD2kh1gsnhUl4T85KInL3MBZbiQFpZCTFcBOSrhg+DTilzjGzPk4z6Mus7acNKG1BQXL
	rk4F2i5V2VchkYN6EeDq4TZSAzqCRxbpgNeEzYg2rWDmU+ELJa1tn0bO4hpKqvg8C4/X4ssZ6Gc
	TJ1yepO3qsdpgIRjXDlGBmsZIhZF/YN278f5B5N5Uo1eF20QZoPUrQIqQGNCgog7H4TG04JG4xx
	m/6s/hg2+xs+q6r+H0rPaerhLsSpxcliqwgrWX56KmyaQI8GsAZtgniNSywRywOIZEJ5EF8F3MG
	WL2wWPjYK2WkL3uuYrRsZMikVPpNBFu5EZVenM0GILBISqhe9qqseP04vJJuctCsC0+D6QayG/u
	RwZYgrXZDhWDpTGu1eOuV+/e2ypJ5bNplo1GP1R+VraLoE6bzomTzpnk4xyl0QSFqqr8bWtzRIh
	Vbbkhw8IE5sploCF3tc68fE20aovYndZgwEXM3NEwM2XJ8t7iRiW8PKI3/H8rxC65f+wyIe1k8O
	2WRGzR9QXim6BLFFN9cJHSEXlzGL+BrMgZPUcjbzYqhCYk2/HP6hd7mMBhNK3RBCwXeMW8vat+T
	8lO2MsDyp32NTLUB3GOIo//TMTmVeAK5VHiR4QLxo4YktxTn+Xid3lyf24FS6/aBHNl03KIalxL
	7K8aZ1tPJ+suQAkotJrRtfb9lAXn1YA7euRrzQzPgJfOjNERtFC5roidg7okpA7kzTn5Ag26Yh
X-Received: by 2002:a05:6871:6687:b0:439:a524:a29d with SMTP id 586e51a60fabf-4a9072ccffamr6663890fac.1.1793649333719;
        Mon, 02 Nov 2026 11:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:23 -0700
Subject: [PATCH v6 8/8] arm64: dts: allwinner: a523: describe the UART
 integration
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-8-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC and the
Allwinner receive-trigger mapping. Each controller supplies its own depth,
so the same compatible covers the different FIFO capacities.

Retain snps,dw-apb-uart as a fallback. The common SoC description supplies
these UART nodes to the A527 and T527 boards as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..23340b9f58cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -390,7 +390,7 @@ wdt: watchdog@2050000 {
 		};
 
 		uart0: serial@2500000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500000 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -403,7 +403,7 @@ uart0: serial@2500000 {
 		};
 
 		uart1: serial@2500400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500400 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -416,7 +416,7 @@ uart1: serial@2500400 {
 		};
 
 		uart2: serial@2500800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500800 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -429,7 +429,7 @@ uart2: serial@2500800 {
 		};
 
 		uart3: serial@2500c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500c00 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -442,7 +442,7 @@ uart3: serial@2500c00 {
 		};
 
 		uart4: serial@2501000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -455,7 +455,7 @@ uart4: serial@2501000 {
 		};
 
 		uart5: serial@2501400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -468,7 +468,7 @@ uart5: serial@2501400 {
 		};
 
 		uart6: serial@2501800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -481,7 +481,7 @@ uart6: serial@2501800 {
 		};
 
 		uart7: serial@2501c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

