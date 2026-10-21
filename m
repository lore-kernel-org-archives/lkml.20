Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570201;
	b=C+jzfUuS3Ssji3M/dymnnsWfDXtAaN5tgs1HYU9kJ8bbBllqwcDb71s1gTEeF2auhB8s
	 vNEaTJMvQzc9fpLA6j+7qNKPq3nwvE5lJ8O44FxF1DOadWsbdhNcYSw8wpgbS2F3uGE2B
	 hRevgsl8hWD9A96Lr3TGTy87zhgsk4rKUpjOo9jlyyOPf/LWYvZviKBC9Y3tx5EyJpEd5
	 yVjaYJauuZYv05hEyhiTKI6MavwmNSOxM9vv5vUl3+bcH8nkVzB/TJyFkpHoP6e3+mZE7
	 X1Cxn4tXUAszsqB3LlF8RsxeVa6ZRIfcShrOWUmsp2HARnzYbUZZQ0Akl3PikRlru1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570201;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=fEXjbUD3amkNKeHH7e/GPwXDSWv2ghLrxMI2EJ9KtIY=;
	b=EJODCwlGXr2xuym//HQOKiDr8ZXq8kNGEj4wmotw5P5Ox5cZzOK9KlewhxtfafW0cb7l
	 VZwtL+PVL4RhPDwtz/y1f7xZpw++XE8At/ryvsHKXEo7cl/f3oje22f5mskRDpG8DmKrB
	 1r9FSOnhUbn9B/hU/M4R4MpzLFaT/RuP/gLFnxzptfOUWiaSUvSyEc54HPEPJP9vbGNPZ
	 yNOR5CVfmjjVZoY4uKqe4IlQC+xfoir61s7CGgG/P48TkmY46WzcknupcK0G4dvtbVeEy
	 51JzwVhfu+vLXY0NNRySk+CjpYPsqfhY4SinTngeYJwrPL7kX8b8ouoGiX8ha/iAEmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hfZxj++C;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F157C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hfZxj++C
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6F43CC5CD72;
	Wed, 21 Oct 2026 08:10:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94C5F606E3;
	Wed, 21 Oct 2026 08:09:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1C8910328E21;
	Wed, 21 Oct 2026 10:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570198; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fEXjbUD3amkNKeHH7e/GPwXDSWv2ghLrxMI2EJ9KtIY=;
	b=hfZxj++COO30Y6He1mlQ9CUgaHJhZugGpb2dNXxe9A+218tWpKHXpr2UqeZHaBSW7OPaW7
	W+zUCksd+H0RzxZflkehnBWMTcPk75aMjcTBFON6WvoteSa/wbaSTu6RakIsMtb4QJogCr
	n7CimI9rIQpXEzTsiBOqv0j+VqTSM++bl0EMYHtGsOY8VKdBsD2iVq42yIJPHhsJAB8Wde
	W0GX/bPmRchUWvZnWqVUOThQM8kCDFdha8Y/DdjVG5TgehOUTADzsqBidGWEqoocKwLS40
	Hh6VHHR4OySqJHL19EljqWGbypON9oiYzakAU0xPvc0ckddRJrEoncvvDcd/CQ==
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
Subject: [PATCH v5 3/6] arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Wed, 21 Oct 2026 10:09:44 +0200
Message-ID: <20261021080947.3747284-4-richard.genoud@bootlin.com>
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

Declare a carveout memory region to store LPM metadata on J7200.

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
 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
index d65f68c7d432..a6043970715a 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
@@ -47,6 +47,12 @@ rtos_ipc_memory_region: memory@a4000000 {
 		alignment = <0x1000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@a4800000 {
+		reg = <0x00 0xa4800000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -99,8 +105,10 @@ &mcu_r5fss0 {
 &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 	status = "okay";
 };
 
