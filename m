Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920879;
	b=hnxTyCjR3Hz24pC5HLpgPmDv2cEfGL7HYCLqLE470rHW8LUWKoD6hiFk5rPMcV2FR3Dz
	 BuoCacyBjs0OhbuiZfWfe2ozho8TR/wB+l/Ab8rQs8efuVKWJZh+IBMQdK3dmS2/HM3mK
	 B+RRIEPbWO3UAsVUJXGQTf7lywBEuOHqgFAgVKYGg2eLHF3tuyCH0T5bzMBNuX90l2Rtx
	 NsxJr/C9i9YuOKWTko73eOQ/jkV2QVJPX0yQdV7Ju1zCTpy+zbW42ZkfEk2x/czfedvu3
	 0Osu+ep38DjH6g4ygud0bfcYpKwOiKJh27lvy5Ac/4cI4xWjCQCwcNkC1T/cUzXZlow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920879;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=8r+7XF8F7JmD8GZ10igNH1KanuHgCZwsM4pGmySSqBM=;
	b=0pEbLAzNoCrk+bUm6q6ly343OK+GesZHi4Xjm7xWjfGDq/86y9PZSv5XbNJXIKJTKfmv
	 o0OIhsYfy5pSu/jS1642L0HnXOKUvufX1P3SZLHN/OqRugWzIuxS23xY1WrgPsas5/z+8
	 KbMUz3GW9NvC6x+GG6jcsSRcAyy9/GRdz/Xbx7KlW77iRR9IkUTxa6FnWFp8XXo2/wPcN
	 I1izUwgqP/qaAVgaSGDYIJI3dl0KOsWD2dDbwLovKaRSndGapAO/3dlBmS5mJnrFWQXAt
	 9jQch+rd9G8AQclAXYbFbLY4TODO0ESXuoQfsqA+g3c9DR6XF6MtZ+MxSDtxOZSGqaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JYTTJ9Tq;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44460A261C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA44460A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JYTTJ9Tq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B4C3C4CBCC;
	Tue, 17 Nov 2026 13:07:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C3975FC81;
	Tue, 17 Nov 2026 13:07:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 707E111BC0026;
	Tue, 17 Nov 2026 14:07:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794920871; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8r+7XF8F7JmD8GZ10igNH1KanuHgCZwsM4pGmySSqBM=;
	b=JYTTJ9TqyNPku/NwWDLt6DMR3bgB0fD0IJvJsAPEFC+3xiXmqccdzofdZ9klBHrWXt1+Wc
	zml+PcxtLgGJxsxEJKCn2VJlla9O4+0AWcL4mw61HZIl2vxGqTUnWdC7Mprz1kszRxmZ+J
	tJ3Dfy9ca2fykK9e+kDQHkJGSSRiRXmmasWBEBz0xkO4DxRBbtqhmUz9mxH6JULzzt4EXC
	9OfQYUriunkHo0Mepaa56rbkl5tXmARQWP9FOktJjr0OH8qtkE66jplNtjlBGqfrHPtoVk
	UIqS/gGhv21wZZe9vXtubp+EJ74MvzLWvsQ1APIzm9IumGnDZx8dexyRtGI2uQ==
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
Subject: [PATCH v6 1/6] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
Date: Tue, 17 Nov 2026 14:07:32 +0100
Message-ID: <20261117130737.141993-2-richard.genoud@bootlin.com>
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

Declare a carveout memory region to store LPM metadata on Jacinto
devices.

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

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 14e6b2f817b3..af2acd429974 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -155,9 +155,10 @@ patternProperties:
         description: |
           phandle to the reserved memory nodes to be associated with the
           remoteproc device. There should be two reserved memory nodes defined
-          for the basic layout or 6 partitions for a detailed layout. The
-          reserved memory nodes should be carveout nodes, and should be defined
-          with a "no-map" property as per the bindings in
+          for the basic layout, three for the Jacinto layout or 6 partitions
+          for a detailed layout. The reserved memory nodes should be carveout
+          nodes, and should be defined with a "no-map" property as per the
+          bindings in
           Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
         oneOf:
           - description: Basic layout
@@ -174,6 +175,12 @@ patternProperties:
               - description: LPM metadata
               - description: LPM FS context data and reserved sections
               - description: DM RM/PM trace and firmware code/data
+          - description: Jacinto layout
+            items:
+              - description: region used for dynamic DMA allocations like vrings and
+                             vring buffers
+              - description: region reserved for firmware image sections
+              - description: LPM metadata
 
       memory-region-names:
         description: |
@@ -192,6 +199,11 @@ patternProperties:
               - const: lpm-metadata
               - const: lpm-context
               - const: dm-firmware
+          - description: Jacinto layout
+            items:
+              - const: dma
+              - const: firmware
+              - const: lpm-metadata
 
 # Optional properties:
 # --------------------
