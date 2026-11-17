Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920883;
	b=gt3c5GaJ84t5Z0+DKQscwogX3K2YMjlklXeyy7w01NDaE0xZoAOPw/DjTZxMFAKjR8nb
	 NAYqKqUFT4et3RLgGtX442lTLdTLWrExX/gAS1dowihK6Y5+ZozLjSDidTAhU+nUNiAu/
	 Wu/hRyzxVoIzfokSFjWAgKL44PKJN4osbc7lQpg53YCgTmNF9tkH+ESEGCR3uLk94O+ql
	 yCdJLANwBEgJYIcC/UZtDBvAKCVl47tdr7uEEUYV76H/EzFEJ6yEwA8B1h/z2InNLLBYW
	 Mc03dbYHXT47cZXqcEfYEH1CbzdFT2M/CSs8DGpSNDVpHoKsnznCFv/S91w0AeQUYKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920883;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SqFNsIwVcZQX2pXUfvu+dQXNAKF9jBtpuYD02f+jmKQ=;
	b=zHrZQmeZYW4saKP6+fhnc2+GaPVBYpOYo46rYR0wpq9a0pIPnvsfRQ8fdfv2pK0sUfjV
	 Jq2soN92bDLUNYi9Srjm6Ub53W4pygFLlKGGX5LLxtgDgc118+/z/bsFC7bINBw7rB/mv
	 1EYFZs7FaqaUVWDYdCswTpA94VvPWUcJD6bPSPvuBLoW+iR6lYq9xQdTnG9tI6bh/u2kO
	 vjznWIAcAOYiVhIuRT9Vpluub4Y2piz66+SNOmsQM8E9FXcHPsF6i1zTdTMEP+XyYj7hc
	 YMHizc3LZKsGnYXhqpoFftijf+ZOlsOP46byRIBVisclB6om5Zauss0Rs61LctfWknQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="RCF5n/kF";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2960A5BC2;
	Tue, 17 Nov 2026 13:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD2960A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RCF5n/kF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1E5D4E4156F;
	Tue, 17 Nov 2026 13:08:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96C2C5FC81;
	Tue, 17 Nov 2026 13:08:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D1ED11BC0035;
	Tue, 17 Nov 2026 14:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794920880; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SqFNsIwVcZQX2pXUfvu+dQXNAKF9jBtpuYD02f+jmKQ=;
	b=RCF5n/kFAxJyaBeR0pPSro1pEy0Ys0nz1Du3QqTMLYxgqsHb0zUV/IpB118lQwx+aAbzo0
	sxhVEREslfHxp6Pu2EFJKQNww6CJix676TJ2STI1aBwUDhL0vxBJl7/5t3RNDk8Nd3BckY
	MKpwKLzfVnX4q6A+wly0r9iYD2lLFV0iujmDYsK6wKBBYdVG/iYcRZvMuL5U0/Fp/nDf3D
	7q6S95WT/hsK28rhbuKftlIGNXq20r65DxXQiFASpkqYHgJnjqFvypf6FSlBoT1u2+Plp5
	btJy7tAjVUjFzNAfuLT3aCMKsJKCYHy0P/SwtLiJUT05m5EsCiy23a2QPUUAZg==
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
Subject: [PATCH v6 5/6] arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Reserve memory for LPM metadata
Date: Tue, 17 Nov 2026 14:07:36 +0100
Message-ID: <20261117130737.141993-6-richard.genoud@bootlin.com>
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

Declare a carveout memory region to store LPM metadata on J784S4 and
J742S2.

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

Suggested-by: Udit Kumar <u-kumar1@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
index d08fd3ff8a89..51b2d11ab5d6 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
@@ -6,6 +6,12 @@
  */
 
 &reserved_memory {
+	lpm_memory_region: memory@9e500000 {
+		reg = <0x00 0x9e500000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
+
 	mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa1000000 0x00 0x100000>;
@@ -261,8 +267,10 @@ &mcu_r5fss0_core0 {
 	status = "okay";
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0_core1 {
