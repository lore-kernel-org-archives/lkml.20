Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196797;
	b=tuKCoK/gAJcPSGBvjT7+3oQEZLEZGYRSCiHJIGjfSwPT4cYTWMShHIqnccHGy1jPlbnj
	 wTV0GIrxiFcLpE6mCZfBJ38rvjjedSuDTdxHPvhXfNZ5es4XU0e4hQKFG35hw54Nj2lsf
	 izv373BHzSTm8VYa55huWLF/kRLWTmbqlvR3EK3qsVJakcOPVSu3ma8T9YILopT2gtoGm
	 6L2ElGdMx175/8peXhFEVEKMOgvWpqYLAcvZCP2EbsN6rg3Xf/iQ6xYsbfd7Ioa8yUmrx
	 DCkC3zG8NcpMyvh00CjVeRBdEDuBqokvML/WkWpSO6yIuYKimnMTOZuqANZCVfNbShQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=R3eOrK4nkzv23LSt1ktsxDkst3oY4Li2dhB4G1LkWn7difjz6H9RjtlhAqB5DpLx6VwG
	 APfRm47/D7/I2qJzOsjAHCZdaG4oFr3QzYsfYMrjVU6tbbLMwITvlbfnaTaRc6YbMaNkl
	 sDlV0odqG/1IOSRcA3Jg4ZYvScEOAHEbKVUAoCcJ+AxPV5lt2Q776jSY5h969+myAo/t1
	 yrd2l40a/Smc6N0SgRq11nAWyeR2lkCS0VXwKEtxX2gTqrcIqEwkHXxwfBfSSA9oGvQsP
	 LbDom1SnYK6sAuZIdWq/C2HiKIGuWZAk0wg0Wh+aO4peu/UVd9B/0EXXZ1fCYDXr8IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEkDtrmf;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D95B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEkDtrmf
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10872285e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196795; x=1793801595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=PEkDtrmfhMSjaDzTEf/MvI9bOLokhLgNz/E7QNmjEAdRx937x4dYTvLxG8iuUrOkGL
         t9xNhkPV+fE9JAnuUkXl7kNKg02md9by5LhLYpLeMz1sMKarNAthXiw00M6bMl4ymhr1
         vD90R9zuLQL5fM0fOMeeetGEt8mDEMZCzVN0XOqYAfGjN15XLl1Xkz+iHy/ypoxL/WCn
         qqzDky4eendZqbKth826VX0dTG4122BpMdNQMS9Z1CLxGE1qwQFBKdfKbMmx8u7geO8S
         GUZQUpeYeKIEicQT0h1JlIb8Jpdh/eMZLADcK+Vb0c0EYretsmGARby4lqKl+jiLabuG
         QKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196795; x=1793801595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=y4b7g2me30Ap1gR+8SMHVfiD5NS1r81265UWvviuVsnZH7SMjlnzODcDBE3FzJ4+7e
         fuRXMFJOSPkhqK2E4rEfMSSJ9BwQ3Ad84PXN/xqiCuaiC4Yj24lL+k5DSFg0dpvopUpY
         0b5MOUCj+RBaSX2VhxP8n8ylOseJKBntQGQQodmW8/txp1q12mXnCqE0XDR98RQ13cQg
         6tDg4g6qIKUEq2FCSmCg2yyjVh7tlUV5NWq+Jjn4MJPme4KqxBD+3Q0MvUKpGpzYjliK
         XIGcxMGAQqm35BNSlaG92KD8+6zHJ+n1m7hwqsV/h8Dvb1UQe5vIS2+P3plHnJhfhxPl
         ZgAw==
X-Gm-Message-State: AFq9FYKTHyfilddBv7KQP5BFWEXhfjqpUyroXfIchwt5uj9MLiyDkOk9
	aIGSbiKzqD/GFw2qbLIasVOKxRVga2jUkz0Fc76tQCR8hS7NcJnmMz7s
X-Gm-Gg: AYBFou2LUMRruiYQnJEXtYxwhsak3YmkDfIERsRKtBGlPwVOy2GYyc0ASTZbrRoIM2y
	Q6Qfr/K+PiSM3R69+U7DH3vOxxfc1g7RitOrx5JTprS5tzqW91x05Y7bH/mbtfrlgAuHrWIhDih
	eOq5MuV2GpvX585zvhsBH6dMwNdNR7txNdLtVmi9xprW5PamI/11tJWKjNoM3aAmXX1MA5sNA8J
	zk5IrwzM4/VYk4M76YyfR3XtX+zArbp3R526JBcqt7QxsgdD7qf+yrkNvElsszUc25qWOWg+/bd
	hjQ7c7yTHzH7oIxdAj6YQ0ZORmcR47UfoHfKBCqqmHm6TbOkHl0Jl3TeQ90vXywTtmXnHz1sQ1I
	XZeNQELTlnQGvytP0/1TtXTTvm+AWNdF5M01l26S2yP5wJENpJmUE1FjftWgZeelt6PYeyYgdEd
	7uVyFjbmu2/JOSqW1BqLLnA4Q4TmBpwNU3p0Ts+HpcDwUjbfsqS6imT4Ffw19I+oWdhjfvzoa5I
	SEx0LUhfuNpbAaisQZkl9rcwGdBLG0ASYy/JFgZCNFZO4n6xh8yCh17mwT+nWNl8ZpPWR2JGAXm
	CaA+k4bQwpW9ApJmRCxjtCWKFTtYgvjjaElmrFrFsoffKJbXa4wHEa7OVWZgYOO/s4CCxmMjVhj
	a+uY0D8mZMbM/3+jCqxFuSwtVGZulzod0y5k+ymD6UJSaAx3RatFxHklhyznMKpE6AHMNOmgT6v
	nOBnva3QtJSsLX9KkXJuPellBlo3pSX1faEFKA
X-Received: by 2002:a05:600c:46cd:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4a96695ec9cmr47593595e9.15.1793196794362;
        Wed, 28 Oct 2026 07:13:14 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm28345768f8f.42.2026.10.28.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:13:13 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 10:13:09 -0400
Message-ID: <20261028141309.134256-1-lefteris.koutrakis@gmail.com>
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

