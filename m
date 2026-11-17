Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920880;
	b=dzMp/hxJOnoljk14VNiIxlW6EEjaOvhrApGOHgtujg54jLfYwXYi/OkqjPE56csnzTbV
	 t+6A41VDkV5gJD9LazfDuxCjDUOuxottEwclrgw3Z+Hx1Z/3tN6QSyASoXnqUdZ5qx2df
	 22KEQ0h8XnfO6XcSe5YaqAX7q6nWB+7CGJ3aCB9z1JWddR74QcGu8g2ooLNQkOp5aKHDP
	 t4LzZc7oJyx6THOR5vwQgudDyRrOxMMnEUv11/+htIvlMf/wyu7+TK9RKWbMNDsLrZqrM
	 FJdCPpyR9eP/+bdxk+ZA6YUxka2WPeWiJ0tqimMVc/p3W2uiqNoRJXzbBLFPu/L6Z8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920880;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=xUALyvtUXYfkbKIvNlqiBzpv7vLH5wP8YCmHD2a1OBQ=;
	b=y7NnpFdwOWDZpQqNqN/IZsDqxXSIAzKCUOE45bxrL9UG5hf7BpZ64i0e5UglMVDLU909
	 rKjLIMBW995RsNtRj7B03n0RliZbHfZb8q78ZUG6oHhXmWh8mFp0VDR1nOZjRO6RUBP2V
	 sMEJ7heU065Qw057Z/Ei5S1ZR3l8ihOxlbu+H+ZAb6/p9Zg8SacsSADZGWxYjOVvVW/0H
	 Woq/acpRSlRYCHGFYjqYDh6LoA8KeQKA1/spPT9UQEc5iUWUD27gT166kxLqDXA/881DU
	 EQgvk3eWO7xiZ2hbDwcSl/uI1l4yVJ8IctaduxqxQ56hi9RrSiPmuND9dzYtvFV8xjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TUzYBapA;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFF560A3824;
	Tue, 17 Nov 2026 13:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFF560A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TUzYBapA
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 09A4A4E4156F;
	Tue, 17 Nov 2026 13:07:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB89C5FC81;
	Tue, 17 Nov 2026 13:07:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56AA511BC0024;
	Tue, 17 Nov 2026 14:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794920877; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xUALyvtUXYfkbKIvNlqiBzpv7vLH5wP8YCmHD2a1OBQ=;
	b=TUzYBapAP77zC1ftvdhFx3XxXtYnogSdOAGGb0OAmAPmvsMu6oSQFrRJIRzAhTXKcuipL/
	w6smXc6HF1AV9zJtGXTxEfx6mph4vYK3FmUQMgqYksUii8CRPa+rs4RnNnbXDaAYL/Y03B
	15Es18bRO1XTKGFdOnqxaMw3BJgsm/strP4B6Z7Kw9GuS0CfptxZW9/bhfqFmFhDfmWIq6
	X96TKIPrK6X+IfDUK+VcMmu+OOBnrfTYdq3kiJ+hxVbS7LDNnRaIRWtXCJUtcczXQ2J1pY
	OJq2eDPc/o1YXJWOPnbap+Zy/mQmGvoAoEHjppgAUF6vM+7idShsC7aTdT9+Ew==
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
Subject: [PATCH v6 4/6] arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Tue, 17 Nov 2026 14:07:35 +0100
Message-ID: <20261117130737.141993-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117130737.141993-1-richard.genoud@bootlin.com>
References: <20261117130737.141993-1-richard.genoud@bootlin.com>
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

Declare a carveout memory region to store LPM metadata on J721S2.

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
 .../arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
index 5253d028da09..010d20d56927 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -95,6 +95,12 @@ rtos_ipc_memory_region: memory@a8000000 {
 		alignment = <0x1000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@a9c00000 {
+		reg = <0x00 0xa9c00000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -189,8 +195,10 @@ &mcu_r5fss0 {
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
 
