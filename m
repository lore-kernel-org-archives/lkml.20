Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3C4A499F;
	Mon, 21 Sep 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002421; cv=none; b=Hf9ENIPTGoUcNIUarXD8QYHgPzLLelMew26lnS78O3zyvqY84AZ/L+4F4Jtb93EQU8PpSxteiW9OM6UHpfOQYSO0ZJ+ZvewX0mMiWN8jh55CgVsrWSDM8hnvRfeUparqcowIC0N4vAUAvOI2EB6nk8N3n0BWRYhxpMnWI3BaXF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002421; c=relaxed/simple;
	bh=QTGXIPmcHuM5GiY1m1pIuIOfZWP7jATqjBAuo4XrEy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3dK76CGnLXpGR3CvMy42u0Tq1qQSWYGqawrSUjlLJsOgqzUkZMX8oZLRUlPqfzOajGZ2eGE62P1YexWVLEhSZzIGkk2KGlgtnTxgVFnVjsbcvR2AZXM+2bD8/J7xOhj8AmsI1nW/JDCieLp7o4JIwIwzP/Nr3u6KLcu/38+rYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hdEPRSH8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hdEPRSH8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D809B1A0815;
	Mon, 21 Sep 2026 14:53:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A55D75FFB2;
	Mon, 21 Sep 2026 14:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53A7C10329080;
	Mon, 21 Sep 2026 16:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790002416; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gco7GK+iV2C1g9gQkUNs9G3U8mloXNXVjk8mlpk2Iwo=;
	b=hdEPRSH83fM5YEy3/ygfQ1tLabQAX9TlucnsvA7Ot9SVas9UIbyKdi31Kr/xHG9l/Wceuq
	RxRv36wdzxdwd+jDA/dGe2DxkkKx51nf3mTu8xb180RYct59KoAmNWzLN1vdVR4m5qwWrE
	infkI1/l3VXND6295w0bvALI17LMaviAJT8c6tcwvm/C//Jk7FRFn6PkEoyH19D3LriXy0
	lx1Vv6f7GQosH8NzN+e2m9nAYYya/chUiuJDHINxXV5KR6M8EfhqgokHsWZFxg9mhQyOUB
	N7j74a6EoJw39B/riqOYu63PILOzDwJ00c24vBC9EN9JgCtuUxNDckcxiUqxug==
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
Subject: [PATCH v4 1/7] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
Date: Mon, 21 Sep 2026 16:53:19 +0200
Message-ID: <20260921145325.300025-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921145325.300025-1-richard.genoud@bootlin.com>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
