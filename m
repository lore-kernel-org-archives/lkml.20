Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197110;
	b=J96cuc/1QHYwnLPyaLV/5t+S3tuDQAoByG5+AMk0uhwNENBFsJJ21mmzIzjD05msaIb8
	 dNBP1CF/+u7G698DRZr79xM7GMDwVYWOV4EaqUDzNmcspGCXzGYeyiRwQqvZgn32mF4GM
	 TWlFBXDmIn34F+yOjJgN6hAIZrSh6WYjkTXG8NR9CvzrmvvNTysFgqs3KdEhcWxGpwgEt
	 fQAeyfxcEYTWAs5BHBTI0/qdGZ3b/9YnTJEFdtw46QcUVzzNdZDZXN/SQaofmY1DrvxOm
	 7m2zQZEQyzOm7NSWK1GoZVGPDfypBO763//8Rm31ov/ncJpETkfG8R/X7BvDvEAEn1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=ze4NDU9yeY6qUUiP1wjyqejr/ybSL0YEEiMxo21osWO2m7ABeRELOBxG6/E4c2bq09H+
	 M+2AGnlhbxhPgLb0P7OXV3f7Kuo8G82VP+i9keYEu8QC4kDavgnvMhaKKA9HseR9AJK1s
	 DRj4Hq++tMrQ3IZZacEv68z5jvvCk2Duebq5CQBCVS5QWuK2geoh8S1fRfG03OKCMvNR3
	 4Q4qp+7eteOLYSyDrXuEzwtmO6btAENPT1Tn5oxWUxhJ3Z+m3oFKtWUxfiAribRV6bNmS
	 n0RmGM82fkuf75vVEIdWfc5fe9lZdgpyESz+bbUx++MEyY5X4IAtJElAiaqm6jH+D+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZiRYbUw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FAA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZiRYbUw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so710797f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197108; x=1793801908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=MZiRYbUw3vu/n705zdVdufSW6EK6eIz97/8saxgeiKk8iXED76RAEEbra30G3ZabfJ
         xzDFmrUsihijre4Z9NbVReIgAttNVps8dkruAMlUu4nrY/6jX9pVT/UMPQIPlSmjywS8
         0HsYoGcrDk6vQDoD830jbDdUWuKB/KvFcizhqQmJaLTYjQx59opSnIeaAlQBKthQl51t
         EIODiMd7vrlNHdTSuuXyKO9jWlF2kA5NH/b6AnUvlqI4/nlONrxyUxHt3bfcNT38u1GC
         B/F5ZEflqt1dX0tX9YbpWlVIH9m6fKYc9e1gna5YNrSnVZsSWuiwEiGg1yTH0B7DFMK3
         Hefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197108; x=1793801908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=trGAfc6f3kgYSWlv0y7p/GGjrLaDTj+2twWq/CFB+7PHLsvHOnF99pAo1iF3bvFBBI
         GrYZW9nYejNLKxBBlwHVyweiB91rm0xlq+xXW6nEgbHuAG5+/3AiP5YV5AkAzf4aiX5J
         9TCjyS0MhkoOBuhWmRx5T1jhqAXSnr/e4nGyAjTgPAfe4D5uFPBq/JbDxuikNDiKKZtc
         Vit4qV9n2VMnHzhAwXvBH74mB3Rg4ubpZG2Q8IFFHdt9qsh+ZdsdfW/8Wh8xaLczlt/V
         1g9wE38Z66JeGs5JY66a+yt6w7nCxrih1g68Bq6rmA0sxQTMDg26/hWKFVxdK/SaLOs6
         Bqmw==
X-Gm-Message-State: AFq9FYJiPbf1TvZsTJe33NeJmCFWckOf9ZkvunjlTc7L29LpCdlYYGO+
	JyUXAJBcqkmr8S2RW7qbcQqDBYxlZ7ifGzl5gT8AIjB4TcxRT6KogQJh
X-Gm-Gg: AYBFou1BckbUyJW0EWcVaiIx5d2jSGfnMY63Ji4ZhRjm6RfdxmK2Vfsy7QxkjLoD1Yr
	6rotHW8ftUF9QN0mYredMtOh+ncF1YhCDa+M18DyM6wix2+bxAr2iWYl6T9qtwqD7ikG4x+EIwo
	m1fNFV6arp6mQLFmtFnSmIRscbSV8sV6f7VZCya4jN6WSsJr4kRSSOn/cS0BXlCtB7RRAdFbmI0
	bwXVEabcuWC5YMfK0lA/eAvzBTWPA/bd1tczC4Yfy8zDWIqdpfRnvOEwvMHKPhhtgT5AsPfaRhy
	7sDoZ2Hku/r240lYVvrTLoUTDM8rHzBqlwa5vGEftVh8WQh5H2VZca24Iu+Wb2IVtH6SDRJHOFZ
	0loSrFSSmSZs59FxbvXbP40PUhmruGcRsTJ0L+j34uRGjkMzmQXxQyvqa528uwHFLW84+jItpd0
	LvEpJqyL4ggoSGHCRRroz8Vl3ZKSFKKCGstLpyJ+OsXMmVOh4hPPE6AemnkJYdJKgXjQR3x76ch
	EwdFloZOgDWfDaqVlzo6KekuI2WWIRm/QLQCzaFqTdF7zYKySoqdTacmXiv9h8BsOi6y3VvRYPe
	sx5/ElRA2SC5zJpxkDD1uJXUszG60Ajn4cip9gdCNiRedytyLL0DeA/9YdMQTRu3eBKMjnOIHDI
	a73dpwODB7HIxVjg182BBVj3bAsRHrRNSUHL7ZGtoZUaufpvUPQ6bhSS9lh5EtzwYkAjPagaA5Z
	XQSMfbtZLArdJBM1Lre4odku1NSGNL3SZgCrIS
X-Received: by 2002:a5d:5611:0:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-48e5d5909d7mr4371586f8f.11.1793197107788;
        Wed, 28 Oct 2026 07:18:27 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm27122688f8f.22.2026.10.28.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:18:27 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 10:18:22 -0400
Message-ID: <20261028141822.136982-1-lefteris.koutrakis@gmail.com>
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

