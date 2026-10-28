Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196602;
	b=OUHYBRDC5Cb0upD3KN32YkYdUg4Ecl7ERKk/i47SW34oifRid16QoJSQGy7bukqQBk9+
	 5ONYifTGu8K6DiUSMA4lXKoUXKXAYamJw2eLvPNF+Pqm5xK8OINUbAyEacVrLs7EZosKB
	 /jDvpISlKgEsIfL+Ti6gz8VeK4wFzPno2MA2F8jqclee7GhQfy+c60i8IzVJowdF3iYs8
	 9AXpNeEC3xv1eh9TmSYVmXT4W3fBZ1fnk1U8O2G81IpN7nq5OKMq79nZ3HKUu02Mg/Inl
	 zwqDc2aMDahpIe8ckgipk7KzQPLtZy/+6zq0xDrJeoH/zkiQJQuURxAe0Ps+nrLQk2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=Dsp/bZfc63YiqbgUUe6WK8dmMGwOlVC+/lZUK1GpEJsf0k77aL/tWY1SoP1yzFBY2dxK
	 jO7Tykd0chVIP9L/y4vVY73mCGBnIhmEcAJWgOsYtQSimwPe3qYcTg88ewOVS4ZOKB5hw
	 WESZd1rAoeF8M3xDG0+lVouB/psXeO9LB2SC7WR6ECjdguyXqMdpr9gyUgUUy6vuE71j/
	 lcqI0yva+HYsisGtJ9Me8l5MRO6i1g1L0YQG9VG6juAytniHUYGoTHQGNCaqIJ4j0+mpT
	 RTb2OMrfCkKDvimH55/wX7oDTkyzp1KdM7lHXjm/FWtq2NapOe0E4UaU+V2yVC7vjpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fItpK7tU;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF85B606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF85B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fItpK7tU
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8402245e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196600; x=1793801400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=fItpK7tU+NEmkJyPe0T8FEJf11agbSjrURWFXVx78eaDbD9REl9rKSTwCb7pIWizIS
         gYvGm6zryzDCc5+aCvSRiAa7yaXh/cPRYBVf9m7yWUUmTMCnr+8qJm9Rp4op7fBAr+KA
         EqrZrwjhpoXrsLMX7m/hcQwcyQHVOMhwsed1MlTgXTDOzaXBBMX5rSePJUcXOpn7qgwY
         Nb0ZGQmWYGBAAk0ecyYcJir6SAHyU28IcfDC9y6kfWqaaY5hgNQ+Fko361DvZpTHRUQG
         ANS3HbdamnRppqwAqykntd85DHoKLF+7eQFbRisFCIzigQHJmg2SaRlERbWJ2tFL5k86
         TvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196600; x=1793801400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=2xvgNSDBm0gt34sJ/kNyNXPsoPtA+syggbRRQG08/JOL5AnWyfDuh/lMMHv7l/c5Mr
         Rv1Nix0iprqajRQ20ahl5VTaNcWqGVfW9RqcnWTTlQRmVX2r1eiV5D7rO0rq1GhWAMqe
         04H0NkGJLRnPwTLEVokZTx0Hynom+6+FmrtzMbKLzzZIGGeYeGoO7CjJ6cpKJZ7QEJUi
         lZmdK4VKL+tUW06qQLPU99v12StsyPfDKiciJ/oC1Pf8Bcs1BdaZV6u/phNt1bq+Lwbt
         vZTixfaxnoUZuNpceZQur00Jx5pK2ZiXdNYOBXS+/M9J+GYmiBjicI7HgSGpnHLXrQyE
         J10A==
X-Gm-Message-State: AFq9FYLapXQ1oEAOCt40+UKQd8xynDuK4hoRp8M0iOXQPlS9AQXAAO9H
	K60W/DO0/dzLeyYkslB2Vw/VaJZ9M4qfkiqTj1r9oSJixDxtvhtNP/ah
X-Gm-Gg: AYBFou0IVPVrnbJmM2py7eAqH/eEq9hBTmJ6NjhuxiHsKINsKd9eVgoxlcPUtV7uB2Y
	xWEcPR37QZqyUckYVi4VIDEni8EqF85irGofATKUohuTkbtU/Sztnmoowp1XFnC5ddly0K+u7bP
	SyI3Ki5leaFEMzDK0zIlSj4LMstyreJw41eYOccMLiK9/vX8VqgRp/x7p4Af+gz2DT1549Xyy15
	8lrwXJ0+zMiXuD/JfFxqppysXsYl4WNjDsTSkO0f0Pyoux+AeeUwOhlG7zbRfaghR5fJ1/jqy1+
	w7wEV/KHHYnjyOWpm6+gno1ng0vfR9pfbRJEAm7F9ddEnKsi7g2mIT5mTD/8F3oxHurUWOCS5DZ
	qgnng43Ccp5S4Xd8C/lrNA/khRAhPIaBSkCoMTRXYN0t9pVQmlizzP/SVfepLHIrMXdiVKrQIwE
	MVqVE8My868fQa4/HxUqBl4kewCPri0PPMnTYslaC3KVHoc0wh4Tphf44RYRftfk025Jovo0B4/
	urnLC8qfwZzp5wectpZpTae8lQDYex2eFp0/cC76g6/KR99OoATmRC6giJ1xHgSoRDUToZTTVVo
	Xp2uwIELrwdCpScKVhTG78NTtGZx4vfhkXHF3jXxSTe7GrVQqeBqXrutmoZZHWUCmYLEa+tP17q
	Fdw8iyoShvqL1muyURbVjDmpAQ4KWXPEHaCCPcJjQSURGDIPN2kStixyNWdwCpbcx+QLUlxbuqF
	htp/MOSJJMMwaWetZsFU6VQTVaNcbqFyqMv40p
X-Received: by 2002:a05:600c:27c1:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4a7c385745cmr111726335e9.4.1793196600041;
        Wed, 28 Oct 2026 07:10:00 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm28585676f8f.54.2026.10.28.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:09:57 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 10:09:51 -0400
Message-ID: <20261028140951.132607-1-lefteris.koutrakis@gmail.com>
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

