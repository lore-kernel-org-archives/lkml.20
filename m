Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797106;
	b=2JQ69MMD6wjX4n/R6VQ0jeOGGHFufPBLinxN156z6m5Er5pRuqRYsuT0E07YV3w6AOH9
	 OJCWbzmApZVUz79pTbFl34suYjeu9J4IZLpuT/bR7Ead73wd1Gmb7eX1ZqApJDnCE44VP
	 wKafEAmhrXKaxLx/yyn9dO09mG/GdKv5zfnWoHA7dCegS5na90A44Oe7eGbM7jEvUNCRt
	 87aFyXW1l8eJ4knlzZHXeSqkGhO54zq3rtKKhfU4uY95ok+v+dD+E9KiuaGeiuuioe9ps
	 W3vzQGk6jIzewCtGwOT8GDTmuVrO4h//pYbdJFQjNAqVW5joHjWjBdxdlngKUEfeQ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797106;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=YIgqvqCft0xzE6fzVQNsWse3GOw0O1bdbLixEWZhIw4=;
	b=ltotZRQCh0YYcGcCEVGWVWuRFJkmQRqXHnaco4/uCe8owSRjN16ND2Xv6oVz+64EMOSx
	 iZmYrUjexqpawMzhAIHB38o42pRBNVO8ZBqT4epOXjLRbV8R6OOaPAHhGcc5Eq9zxd33d
	 oBboVDuigpu3AQxP/KjbQz0ZSLxGg0sUU6RKrUZKrppJJkS9UNYg5ZYylao5db9JKC9w+
	 wSoPuMDoMhn5BrBffotKLOPsLZCUHCz4nkO5On6SjgnLkwkif3AHSMYOhihxEAtohJTOA
	 Glw4mNscShibK8oaqLeFO/tPMiYAvpaJIv41CVyfDzPS9xAVfWSubkqoPv3DVBPx2gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IiMHMaBq;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48255606D81D;
	Wed,  4 Nov 2026 12:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48255606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IiMHMaBq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1DC2A4E413FB;
	Wed,  4 Nov 2026 12:58:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6C9B60770;
	Wed,  4 Nov 2026 12:58:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFD01103283F6;
	Wed,  4 Nov 2026 13:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793797102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YIgqvqCft0xzE6fzVQNsWse3GOw0O1bdbLixEWZhIw4=;
	b=IiMHMaBquYn4XPoKPA/llTOGNiibdyjbv2MPxlLdiVvooWJhe1/5XfotEx6Hu/WRM9nAlv
	f7pyx74GqT9UvleOeb+5jsYNVN8Q1Zoer/o0faG4PCx4gs7JPEjx5PcwgqOXez/da282JG
	BQakXeuzqx4f4zkDziBGiydcgF/u129TG7gATgwTB31WtC53MGHZoHIydUjZ4M14Qj1qHy
	ImWNTKPhex9WWzQ6DfoJn2jLi9d0BVeDcivmPQYc4o8OTmFW9S798yuZlwJpIKq735icMl
	ngT8XxOkeoQDjn2u/XAHIXf2n91y9nU6aLyw0vGFdu7bvXuYoF8QAlMQUNAU1w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 04 Nov 2026 13:58:03 +0100
Subject: [PATCH v3 3/4] MIPS: dts: eyeq5: add MSI controllers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-eyeq5_msi-v3-3-2866f732cd38@bootlin.com>
References: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
In-Reply-To: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the two EyeQ5 MSI controllers. They use reserved-memory regions as
their doorbell windows.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index cec5ad8752285..bc6024fa1a132 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -309,6 +309,28 @@ gpio1: gpio@1500000 {
 			resets = <&olb 0 26>;
 		};
 
+		msi0: msi-controller@5840000 {
+			compatible = "mobileye,eyeq5-msi";
+			reg =	<0x0 0x05840000 0x0 0x10>,
+				<0x0 0x05840040 0x0 0x20>;
+			interrupt-parent = <&gic>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts =  <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region =	<&pci0_msi_reserved>;
+		};
+
+		msi1: msi-controller@5840010 {
+			compatible = "mobileye,eyeq5-msi";
+			reg = <0x0 0x05840010 0x0 0x10>,
+				<0x0 0x05840060 0x0 0x20>;
+			interrupt-parent = <&gic>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts =  <GIC_SHARED 48 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region =	<&pci1_msi_reserved>;
+		};
+
 		iocu-bus {
 			compatible = "simple-bus";
 			#address-cells = <2>;

-- 
2.53.0

