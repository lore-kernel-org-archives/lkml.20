Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570200;
	b=kyrFdYQH+Zp4eWChvo1ZcESdgs54PhLQJPAlFSqTm1x0891SDDFxM5yEBgJ/Ggkr/F35
	 /Dm0WBwOWOAPU0SQUialDMUIwsWMD2oRqUalP0cy5aD7KYQMS6F1zx0Q9YKFvCIh1YvaJ
	 OKWt6ExwDPK2vfDxnbXxKpTdYuL0j77uYeElQr1tQw51Vj5XknJ7P1WY6xMEkANH9uj8g
	 Jad/nGz/0A4Utb0sCt2BmRBUvL45PP4vGzBTKyjU/8HHmiOlzCM32f7CjcO6SSYTApsV6
	 EHfPmkERBsk0FvTdr/pd6Swkx7p+x3x/kbEdRRYLoWHTc1q9y5NOr9tKIEATEz8cmQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570200;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=8r+7XF8F7JmD8GZ10igNH1KanuHgCZwsM4pGmySSqBM=;
	b=YzKn0qODyzTFQlaoJOilXROep0X4bEB1/mFgCkGMzH2GNgCAd6UPMY5Zzm2bC9pnkKlM
	 BSTIhlq2XmgKy63YSim0V9Da7XE5hCu+hrF0bWFHYraWE/SpImiWAHUmGnszvPbUC7f6S
	 uZn71yj2kJIdStXFQEJeDsfSDYqS8DJEbOUY76UJmcH06FuV2BJ7pBpdN3kZyjROmgWPl
	 IxIbaOyvSFhFMQB1pXqawyMKEIxLPmFtilK5fmsh1zfwc7YYvGkEPJVRYco+CP/ckIy5c
	 ZUlNJxWwRznfBe5RKQ1yHcS7UDd+Wgf9dffqnZo0CsMOnmbKUFZmf7LjFDi7ao/SuSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GmBp+SEp;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C12606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C12606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GmBp+SEp
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8EB374E41294;
	Wed, 21 Oct 2026 08:09:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54581606E3;
	Wed, 21 Oct 2026 08:09:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 860E110328D20;
	Wed, 21 Oct 2026 10:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570194; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8r+7XF8F7JmD8GZ10igNH1KanuHgCZwsM4pGmySSqBM=;
	b=GmBp+SEpVQdaSMUt2gN5cLotsMaVupQdOyidh/hWDkTJchli1M4Vf+Wc37kCiuPoyPTSO/
	tYx0wxyEnd+aDuutBACkSwCPTRkvH0n3BaL3hO+qs8OTtOg98JH63mD+sXKU2N/Pn7rMwq
	VcLbgnPZ+vyL2vvWsAescMW+vAi9cQzbQw+6dV8PEBM8oAwgI1Jn2N5pO9cjCW+XO5auzg
	aPuH41O7L/hdpISRDcla5E4HeIvsGzludw7uVXZhT64RHc1o6Hm4VC3HYUpzD3KuzP1cK6
	jQoLnt7j6cv7KjKittDRZU3LhZ9+/J8ChvIA6TD1foh9hXLZo3A+ymNnuUIBIw==
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
Subject: [PATCH v5 1/6] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
Date: Wed, 21 Oct 2026 10:09:42 +0200
Message-ID: <20261021080947.3747284-2-richard.genoud@bootlin.com>
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
