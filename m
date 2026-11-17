Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920885;
	b=G3uYeA48b5hQ5355vEsE+ULIFQ1rzvpOS1dOnW5CtrKSONfPN96wUOI5m/0b3CsFyCYk
	 5H6+2mMFjSc/fp+ORyS2PP75BtKLI1rsSsmjE5UgWNW3BIvNBeL6gRi/gQaA/LOAKpe8s
	 V8YFVdel7KO4K8UPIPxbrbR4UY3qD7ghlEX0q3y01Jd1zOB+knWRBt5xIaYQDn8XaZNZq
	 T7s0+bBcZd0atrl3JcbVmlop4GioyTn6KWtbh/Du2kEK8kmJwgS5cy2gTWdPnAdVeLLmr
	 DgOrF3r3qEm38Nn3KsmLQV/1eMsiKc3VVJSyj3OEarPjC4l3xLg0DNM/P/0TxkQjXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920885;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=bqWTaa9P4726wAp8OdJXg008Zn0xKz5pVT9+3dq+cYU=;
	b=Ib7dKL5m8qWGhUNQOX+Yanvnf05690xS06I5RpoQPOpCqBgYznMvCcc4hncPuYhoo3FF
	 7FaVvxRj8xDwUWmfSsvbCpS44vFdKn6rHn8sufuzeGgpBHGMHerDrRgR4ohuW/QjsHH90
	 WrUstiBbc5QWlEfnBOgIi8+fSiTflv0Z6o4ZXkwFwnkn4UQl2XXiA+9pXssSraOSuUdPV
	 QN9c8zy8lsNABaFX3+C9Rep90gCciylDuzS43D1PMH4Az43UqqEP5y79+qBt2iMcLJNul
	 JDcfCies3J2gjO2GlmANBDeS9R4x9GVTfmxiQH8cIii5Wr5oIFMg0B6QUqeZpcPWk3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="le4mf/cZ";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601760A5BD2;
	Tue, 17 Nov 2026 13:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D601760A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=le4mf/cZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ABE1F4E41570;
	Tue, 17 Nov 2026 13:08:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 796725FC81;
	Tue, 17 Nov 2026 13:08:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 978FF11BC0041;
	Tue, 17 Nov 2026 14:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794920882; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bqWTaa9P4726wAp8OdJXg008Zn0xKz5pVT9+3dq+cYU=;
	b=le4mf/cZHfULkdhAPvE6dKt2IjjqZk3Fwnsi/geXhlmKtv9RFJtXZtEsqZT/Z1zQHtKpuo
	OtPvqdOai+o0P7a2+eHkaS9BSz/xzr+EJpI1jEXfzaY8gLGCMKeoFYY01ouqGjHaXMdydl
	LVdxMB7MXtUeK3+wC5hQpQrL85JmT0uVJLjIUl/yEZgB8G7BJcnH/S3a1iN4jySM/zX8cl
	bABGkoOwpq+RnmyCADT/6zzS7ZCqZYDlq8+6hlPsmvSVDgy1sG24kTLJbwtfiZJQ8chcqo
	TvA6jAUx3q3ue7eJ0d5LfcNU0FwpoIL9WhMTBzgiLVIYPj5LLSLjspuxX6I29Q==
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
Subject: [PATCH v6 6/6] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Tue, 17 Nov 2026 14:07:37 +0100
Message-ID: <20261117130737.141993-7-richard.genoud@bootlin.com>
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
 
