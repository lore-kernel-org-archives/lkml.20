Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570217;
	b=zH+PxmM7myHInsGC2g3lr6Om/lp94RN27GuVSTfyTmAuwkv8VI1/md+x22t2BgqvWOut
	 i4jHWdgHeUqMPFDUtao6WbekgqZ+KAB80Ex34nMyYEi3K5XPlaVc+j4hT/glIkegQP3B1
	 dQl3q4L4s+IZcuOGWRMVWtjyZCgGTesOxuO5UU/TXGUs5UgBEOdhKXe81CbmQIhQOJ8S3
	 FCp1uqD4k7GXix2G/Nhi+X/axlR7KYNs9EgsG5Ubf1K75xNG1CfeilS5dazbtIJm5ir6M
	 glKFt1Ivx/A57+wfgKi3ucsKn3cnrwntjO0ARyQ4je4j7IioO4rP6lwcS0XAkWYFlYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570217;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=bqWTaa9P4726wAp8OdJXg008Zn0xKz5pVT9+3dq+cYU=;
	b=GQUjnvhkZgIK6hqDqLIuSjku96SUCLFQOjzfDhopvDt5lDcB4L62BJQUbzZg6G85kzmh
	 2ynpXM+LVqMFvE+Bei+4q+EUb1ZKiaSSXkGw56ESbJXXSu8NCNsty8wAPz56yhlxSgU0+
	 PVjTtgykCSuEDFcOl8fzFuI2n5UJLhigUg+zCwlU/h6QoJWs9VMRa/lC+xRy3vuo078Lo
	 akgyqjLjGQKJ0JK4wZqq6vYxyGVwa9I2+TGnrO4qK153MmGDnEyvO+T9n8KQr92S32RLu
	 2w/LpoEPY8/VY20fUuuh+jGXeU/IrPCebs2vq+JDdBhe/eMfNUXotak1ZNohbblz/BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="y0S/RrKN";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C243A606A334
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C243A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=y0S/RrKN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F8461A12AB;
	Wed, 21 Oct 2026 08:10:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 739B5606E3;
	Wed, 21 Oct 2026 08:10:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3480F10328D20;
	Wed, 21 Oct 2026 10:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570203; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bqWTaa9P4726wAp8OdJXg008Zn0xKz5pVT9+3dq+cYU=;
	b=y0S/RrKNhqFYDMsa5YlUvosTTw8RPGfPTAnyHD+87m15WubE26bwtA9LQ+H/PJuZcgEw/e
	X3wfjsKZGR+Hd9x05A4CvCXeQnBol3GBDPOLcNjKVnbZnHt9DnaR1uGgi/hIRAOcxeF/em
	FFjaLz1tSGLBNxgWbRcTD5SJ43z+4/9Ny696aEyv7HkJQLe5Zw5v9Tlwp65GRocIC3nwUQ
	1OIDAKEEPVUCLnAi8Yle0yX5YMrcKT2+9nLpT4es1O8T+c/WuNe/pNwcMZf2ce4li470ZA
	I8iOWsmvdffhC9U35C4u0S1E8Z/WOYSIF2vThKAsJ3dBrj05da5ZPLyQ0KfCXw==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v5 6/6] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Wed, 21 Oct 2026 10:09:47 +0200
Message-ID: <20261021080947.3747284-7-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021080947.3747284-1-richard.genoud@bootlin.com>
References: <20261021080947.3747284-1-richard.genoud@bootlin.com>
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

Declare a carveout memory region to store LPM metadata on J722S.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
  R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

As this is used by U-Boot SPL, bootph-pre-ram is added.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index a59c3648d805..5d8499a33fcd 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -59,6 +59,12 @@ rtos_ipc_memory_region: memory@a5000000 {
 		alignment = <0x1000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@a6c00000 {
+		reg = <0x00 0xa6c00000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -122,8 +128,10 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 	status = "okay";
 };
 
