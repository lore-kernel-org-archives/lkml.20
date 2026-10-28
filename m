Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196365;
	b=poh5mzNXxumml6ynCxBvLKZN8mXCsjWvZ3Wsqzb03UTqBSi1ZXmFnzfetKeFUYhs/0j/
	 VKZeTmx/lgGG9UMKi9/0AEEzsiufYFipcll+Vgo6FbqLsirUIZJZLtjQQL2rxhDIgBNiB
	 1EpiZn4A3ZZu8YIxz5Xy2TBJkFRjtJqcUbW+fJ6z1U4Bi1t1uZ+wgCmYYck+sDyrZU7YO
	 nzZpSk3lCS3kxwXzsmD9l4wTjGQrHKTco6EeVQYqW7QxknfAnj/kQfkPJP5HyajqPDxfn
	 gDEJHvYeRXorA77gIGHym09h3I6G9IwRvU5Ui9oDz7d2u1Vjt51LeFG+meuv0xEaNMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=ikoc6DFgjBwgOQeuMypB42RVw4IjKfw4s92PGRRugEd7qFXDmTR31QC3nHlv8skudJ+b
	 m8IG8HWBqB3bXWJ7zcghA5lwJeFi75Z3Og3LVsAFsrY2hcHewxvGZwW8gIg74E5d98FcX
	 EouPYsLhTA/IF4JI73BdDznVKpa9sBaMbE6MRJH8Gq7N5pRq96ECKuURZRQv8x2Vez/zG
	 USc+z/wMVyuRY1O6uq8iNPgl+lPazn2SNdjFgeWLpUP5zKIWSvRtp41MtmO4JIe2Ysb9u
	 CeZbm2SaevNHJXJW34cEYmKqOzgMjGgW8xqza9FZc51+sJzwJfy3ZkVn13VeKj2GW8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YydVNc5M;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6224606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6224606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YydVNc5M
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8796845e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196363; x=1793801163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=YydVNc5MceqShSejrFJ6Nbtu3be7qW5NHv4WumUtkz4Pyxan9pBuYLGklrIxcec97j
         KqLu41w2R98DMnDnh/e4Rs7oRHTyIP9bj2QzNmoftVEs/c+kL7i+32izAwqh1kWkcRu5
         HhiEO7WglZ65/Ao+0d0mvvNZkv3vp+ZvmGJRTXtT28EPYId3p8pmirSeu+6ajrV/P9ko
         9e+eKG4VHqzicDn8IocsbMBCLapeKesDE2TiGYLjIpeOAISEDmM7Rhra31uclXHTia0v
         ILWRx1yTrdS10eku7/MBgnRNPoJ9vdg+b+EL4X0pfTqEd/ZDY8y+QXGKFGD7QYyCgvQM
         THvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196363; x=1793801163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=ted53gL84RbSL50KurBPalP/Jpzf7jXsZpinndcvHs47548MqP1AWKjdSPgqc02K9+
         WvxNe9ucxrc0RszNNKOdy8uZxhzZjgR54HBZpLx37ZlG5p2HMfwnK7Z6NL3LEcXNL79v
         lPMn7CYWwQpm//T3cvdIrDn8x0NZI0xxKCOwbwMN2YXPBUCaArS8BNtlcBGosEkJIfFP
         0Qzxy0lzLUvpznOA8ygLUPCeBxm32tHa6WzTqej0oAWfscBhIRX2+06N7m16S8Xa1cV3
         tu/iFSIaHHbKRoOTVqx1WiAWtnTqrjxFajBcdx368gowpNcecbJxWIAc/2KvHm1MIOIs
         oQTA==
X-Gm-Message-State: AFq9FYIyInueUNR9Oz0xMW5+YIgKar/sdCCEn/5TkfPeEnJ/8EPIoN7k
	FgcRxJHnIQLzZCmGZjAiBlsqFFPG9jtdJ0Um165K2iXuwum0g31oASut
X-Gm-Gg: AYBFou1d7bA28dS1+tr7rA0VkmtesMw/KN08ivAZrp5SwLagJdJ1RjyuiJx1hTTqlKI
	r8h58sQOJx5S++A6oOkOBKhh465kRKxbcZpwcEr+6gy9D5cpoVnQomxb29kUuI1lJPlkWE0ZrMu
	BOE8l97hJ7/OXsQixkk/WA2q3rZdU6zl4LYqTj23aE1ieQdeA/fgiB5pY8zulKCz9PjVBcsAXzp
	ZFmOrLXhO524Uo6G0azKM4GUOCK2QKMkthN7W0+Gxeipj/O1VCVSqNR7jsE4Nml+FIbZPI6vcw0
	/FrKTM+EmY0UBegN69fea8RmDT4bXinM1H/ZQLNqfOBqQ8AF7iYgRen3VMOTHgGvF9ncPXd0qia
	G8A+o52JSQnB5yhCovleokpjeQiwEPmijtCkrCGw6gKDm0+OieU2aBeuZWgDnJpuotfXenxa9DR
	7lmZUzTsVxncJKvJE64R+7ZkVKM4BE1JIBB8kCSmsuqu+Ys4Y1CvhPv3LXRLELoDuRq7yD1Igv1
	BO9jloZIPy9UGwt3agXbswKXmT1TLnqm16Q8dyPv8QaX7MlSn6PsgoyjJWwATIbdphNq4d4MEDz
	dedil4jPtmtQr5wMTZwIW11bbwiKeTkohoOAk0ksZYbAFn56eivrFfeZaUw0q+pd/V9ha08BMik
	DDXOplYB9pFKnn1DwH13YL45VQafCWxrK9F8Hq70V0OPzPl1KG6F9llc/oFkd5qBH78TqGUaMDf
	CALjg5aFTeQr+oyzo=
X-Received: by 2002:a05:600c:5308:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4a96855295fmr50429605e9.35.1793196362728;
        Wed, 28 Oct 2026 07:06:02 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc08fsm45906435e9.4.2026.10.28.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:06:02 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v2] powerpc/dts: Add Device Tree for WatchGuard Firebox T30
Date: Wed, 28 Oct 2026 10:05:56 -0400
Message-ID: <20261028140556.130612-1-lefteris.koutrakis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028110951.101614-1-lefteris.koutrakis@gmail.com>
References: <20261028110951.101614-1-lefteris.koutrakis@gmail.com>
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

---
 arch/powerpc/boot/dts/fsl/Makefile        |  1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts | 23 ++++-------------------
 2 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index ebbf301e1..0a5c8b596 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -45,3 +45,4 @@ dtb-$(CONFIG_GEF_SBC310) += gef_sbc310.dtb
 dtb-$(CONFIG_GEF_SBC610) += gef_sbc610.dtb
 dtb-$(CONFIG_GEF_PPC9A) += gef_ppc9a.dtb
 dtb-$(CONFIG_MVME7100) += mvme7100.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
index 546e98938..6e9ec7f90 100644
--- a/arch/powerpc/boot/dts/fsl/firebox-t30.dts
+++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
@@ -4,30 +4,18 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
-/include/ "fsl/p1020si-pre.dtsi"
+/include/ "p1020si-pre.dtsi"
 
 / {
 	model = "Watchguard Firebox T30";
-	compatible = "watchguard,firebox-t30";
-
-	chosen {
-		bootargs-override = "console=ttyS0,115200 rw root=/dev/mmcblk0p2 rootfstype=squashfs rootwait";
-	};
-
-	aliases {
-		label-mac-device = &enet0;
-		led-boot = &led0;
-		led-failsafe = &led1;
-		led-running = &led0;
-		led-upgrade = &led1;
-	};
+	compatible = "watchguard,firebox-t30", "fsl,P1020RDB";
 
 	memory {
 		device_type = "memory";
 	};
 
 	cpus {
-		/delete-property/ PowerPC,P1020@1;
+		/delete-node/ PowerPC,P1020@1;
 	};
 
 	lbc: localbus@ffe05000 {
@@ -158,9 +146,6 @@ sdhc@2e000 {
 			reg = <0x2e000 0x1000>;
 			interrupts = <0x48 0x2 0x0 0x0>;
 			interrupt-parent = <&mpic>;
-			fsl,sdhci-dma-broken;
-			fsl,sdhci-ahb2mag-irq-bypass;
-			fsl,sdhci-adjust-timeout;
 			clock-frequency = <0>;
 		};
 
@@ -410,4 +395,4 @@ ath10k: wifi@0,0 {
 	};
 };
 
-/include/ "fsl/p1020si-post.dtsi"
+/include/ "p1020si-post.dtsi"
-- 
2.53.0

