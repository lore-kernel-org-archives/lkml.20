Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185802;
	b=nPlPyQRd7cvEE99kXuuEk7c2E+RAu1jZSjNF7WWIg6SHPRl8SM8woF0Zl/pOBsjC77yk
	 9PCc3G2uIYrTcfPt0wQLolOYoV7y8llyFLfA226jjVnGPGfR5s9PYk8nVIvcCsKxcurFZ
	 4dtaO8uN0Xsd1v1Gvu4uvwdnLgFvUfCSyWaCbJ0D4Xb58csZMK9csYOcfivvYx9IieuxR
	 lHg7N0TQQme9vsLzCNjFuKUlzFsqIcxhXeed7i9CUcDGcMBFHPilkF3DVwMGpcA1wTRL4
	 lgBxZ4TwiJvWQfrPmahiHzAaGgZ1RlvcyxxW2QZjI79zdgXSU+awnXvKyFBed1VI/Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=pqi5w5GN027UcJlUWuixMK/Rhgw3C4581L/Da8gPU9WhB4DRKXpxhYJkO7Ql8nGD+uKj
	 YGH6MGOL9RrmKa0zNH51NePkk6o4y9bnM2VD+XGZVs60I+oByNDzbsgeZF+oAZ3HIj9zT
	 k0p5v2vFPk3UdEHQ/liMdnI4zVwGNaPzIu72fbSzDY2kFiu+qrN/W/8j37aBFuPZQfjvK
	 yWCvFAhl8fpElohO8VaeicKoa1/hILaf8uM3g7dfb8gQXV2zm6DP3lA68dpWgIC016amr
	 sbEDbMmF66XAJtvCCNo64B5HRlLgAMzh9k54j/0i46bbWu7TonHhG03GvPSc6BfnBcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPj49Iuz;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752BA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPj49Iuz
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso717456f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793185801; x=1793790601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=xPj49IuzuZ1wi/oN8i5dMxmTGVoRVIXeRSPoIADYD0M2mQ2Aww3v2ag3C1IsfgcqzB
         cJjAxwHLh1ALNoimrVgexgVW5M4Di0vy2bWet40KIAVfZMRResj12+ytwvGRx/xMQ+tJ
         CEEbBUxgPKpLAvE//+2z8yyPz/O+YqCZpkGCAwuJ9J+0B0ZgFWZmdZ51Ckpw7dL2AgHK
         xK06TcNgvCq94dYq2OFd5EURo7pd/4RShU2MPeekiKacRKCCKmL+zXpPXuozNMo4rkKz
         BPTDtNaI/MID6Fx+2V2hu3ehUyMmvsrv28jUf7upwQJ1Vi7PJeen6hxxF/l9tIqRLK8f
         p7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185801; x=1793790601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=iRVkKtsPbpKA0D2/N3hDIrqzFSoKx2ePhUxcqA+Fp35Vj4kjWjm+rCCwCoxUxxYMfa
         hgaYxM6RyzWjyLsR5KWEKYfgkYieI8HCC3d/f2vL9xWR2c67biyjPa6MHIuDXNV+x4Fw
         yH4gUI659DXmrQqKE/cf+AVE3bFgkHTiN9DpRsVITpUkG7xysCA33O+T4JFfcbGrsgVG
         MvfcbBmeTB4w24BhwExGxxpcpUVnDSpYfXI89DXXYhDWPtZdfdFHhOMKPFLekZT8QAdL
         3TGGV/b3G3rPETqeZ924xt/mJQpthiG0uICmHgtDhduRfORoEFV4WI2DSEiARZlVvDBN
         v8fw==
X-Gm-Message-State: AFq9FYKJGuzrK+jQUoWuhoYigLtSo17pWCiQreAVRAx4Ds9IdTZjNErN
	a48o0LJumSWBoXkb21d88mXcGGCzaqVHevViRqwofdZY8NuGMF6WNGEl
X-Gm-Gg: AYBFou0ymme+dX3JiN9KTbIfcM9q0EY/OR/SczPE2y6JClfKadsWKQX0hxfCyn71277
	LdjDVcc/TMa/He4XwQykw8rl4eZOjydntlgVZwNzDEIN8F63DLjEj0g48QbBovKHmAGdaGpjpNa
	gGwEPcQXoXMJqIsYUlY9D4hETw7G6AYCA7n6ZYT2tkNcniaBhkph6c42i9Ck/nFqHxsva5f0gUm
	lTuCyG9TtRchtVRhSS1UVz8t906yluFVD05/f9w2CTPz2YmsEQjvS07ESm5hb68qEmgPjVuT39B
	b3faQvKp1Hpk29qpsXYceAnKUWYA0cbrEJkm4AMw8PAHKU+Ywl51vcG2rpKq6e2X8WXCkhOkTsX
	gd6uOnVxUQn7LqpnLZ3rKdoJKROYR/3GLMfE3//JgguLhdEvkES4BgknmYoL3IVPvMsGnKUJ56Y
	MW4GMizh1sirmIlq2I9Ia0roImtVpKtCiNBBzWRf/xw5kjVvgbuK+TjubYwZVH/lLSh/V44DFRJ
	r8WPSukiDHqtSY8cCv/Hv/dmuLYXaZAOj1xFhp0pDhHoCffrk7o5gOMPEyv9CIWFG6FvtxoRF+a
	55NL4uQIMFNGLhn5SkDjDH8Dntrpvf7AjP6umLPMOZ9KIRtLJhuGG5ysU3eSYrDKZQtsX54dXdt
	L08t9o5BV/nxShEaoXOtZiqf2/wD2yXRMFRDWA6c9C6Od2mNt9w8kwUJuqXQTK7wqysZe409gMD
	XEmuj+zoclLVb0ils=
X-Received: by 2002:adf:e009:0:20b0:48e:5550:c64c with SMTP id ffacd0b85a97d-48e5d44e556mr3706276f8f.14.1793185800762;
        Wed, 28 Oct 2026 04:10:00 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm27760519f8f.4.2026.10.28.04.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:10:00 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 07:09:51 -0400
Message-ID: <20261028110951.101614-1-lefteris.koutrakis@gmail.com>
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

