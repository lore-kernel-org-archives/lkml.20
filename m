Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837557;
	b=0eO5IdzweHBb59LsuQCyivy9YNJO9f53ZtHqDZMKV+OpbZRsz3zyjG3GT6hXVPds1HJQ
	 0iC/THNk9ixkwGIRdFdxV2AxViXb5+OGK46J+pERgC3d5v+z1UNgCgHuaKxNFEP/n9KpI
	 CvbFHEUD/tRlDT8COLcoca3suaGqRTF7Njohm/9MPqD+zSF7oAmMYG7WUQ5CxJPOuY8Da
	 0/EjRMtDgAJCuAXbRJcJG6cA515NktbJ9gtw05dEGk2ejHloKYyM0/AuCtLM3NxR5/TaE
	 Fv1bqfbcCeZmpoEOqlFWmh4ok8J7+Ne/qIwzzKlLPYx8KmQNcNSFlzSrGsqlV6U7lcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837557;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=YIgqvqCft0xzE6fzVQNsWse3GOw0O1bdbLixEWZhIw4=;
	b=et8E3wvSKv9WcQj14HiVjt1qA4MWYh2pr3Wl0/xM3ty3djP7f5YrWMQrkeT4bE0Q6CrH
	 8d7HjuSKyJxjv02SAy8kC+1KVDwjolWQXQzkTHEcXe2rlRzmypMig9btuQyNVsMowgnD1
	 BID0071ItqIuyUAtov3kgx1yIGVGDilIqYSn1/8LHjP1q5JyC4RiJMhoVbMPiDxzEv5RD
	 u2kSFc7KS/IA28MY9CE3lDOVgNJmJSi8qmff5OuZJjR0k5GxmrxkYbMX2BrBeFNqR1G6B
	 uY0w3dUma2na3OoWgfSNipfebSBVjbV8lDFpYTeikhrnOPFXN5IY/Ae7swkMDYAViZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2O6q6pVC;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A886A606A886;
	Mon, 16 Nov 2026 13:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A886A606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2O6q6pVC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 833094E41600;
	Mon, 16 Nov 2026 13:59:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 563526023F;
	Mon, 16 Nov 2026 13:59:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1C4011BC0298;
	Mon, 16 Nov 2026 14:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YIgqvqCft0xzE6fzVQNsWse3GOw0O1bdbLixEWZhIw4=;
	b=2O6q6pVCb12IoAoTB+Ls8FQRtjIDkpN9GK10cwb1Msm+D/AJvIf19rJXsLJ7ZT4Zv9Vw99
	5Ursr1Bk6LpZiryS7OJ/m4EzeTPbx6TC2Tc2xNOM/YONh05TcGh05yMUDjCEe3wnyRnI1n
	v6YTNx+Oi7BsQTUe3YczfOFq9LiRpQYVBZ9AyhVmk3BjPK9XjtKrYVmiIZTMwhXABMf4Hk
	w8sive6Lc7/9nHauwdKQ+Pvj8LK/4nvYaFiv6Ea/TGqhGn97i/lj9IMpfi8G820djJrMbk
	HXxounEewNpVj6AfziWNm5sgeqBvpgIPmE2o/X4lcdUSnbjS4wrAn44LBJ+l+Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 16 Nov 2026 14:58:40 +0100
Subject: [PATCH v4 4/5] MIPS: dts: eyeq5: add MSI controllers
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
Message-Id: <20261116-eyeq5_msi-v4-4-2e1233b014b0@bootlin.com>
References: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
In-Reply-To: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
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

