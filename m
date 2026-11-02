Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638273;
	b=P28Mlx2H4lJ58mhaval3NtWGDAcaFZ7YYPtRI/rzvn8pwSGiBvoKkhuIG0flYa3DCtH0
	 pIP5Q7Rjw/EcwPHdEW3AP5obwHIsIhBjB/cu7aCJGppe3c6Yy8RCZxYZ/XFrRYUA3B44N
	 qs+T08d+vPwXauIblLIn5VPkA0QHADhV52iKf/jU70UV2dLybKygjyqVyPpMSgLhn5TOe
	 vPjbuiqIOvWquqXXO3pnQDw+56N+bTVjWvjZ6PHyJyXghUOOniseloE+5gNdpZcplH1Qp
	 2TszXcmuvJLxUnizCK4a5vfPzH2sVMBnTEzcfg223uck6sE/70aS4WrjujKRqrEFNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638273;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=eUmKjW/odYdvWtbakFcQhCclxYhR4G/KrksL3aYL5dHut01iNMAoUXOxaIyELNMDDIWF
	 0VJ5l29H4Rbiz2Ro/e4mKm8WAT6J2B4EEbn1WSsRfhiNtu6tXBKAHTS2wmaGZ/Fe0gr58
	 nc7b7Oe05rBuFf+Rh4wiwUJ9qQ94G4qLe5TyhZa99nw2ZzY1t4AjTCyWk0sZ1Iwf4vWIt
	 bu6vC2ZVNI4ZPxBFcwaEf2nPi5I+98tOuN3CZCRHpf6XQu5QH3dyXDdEzm+tXZjlaWN03
	 X9DrXjkSpbhK+V7t3PDBGALbmIiZV8Tj0DwmwsBmEgGcu/GKOkSi0p9od2mjNvTjDgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=In9z5Xug;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2113A60771EF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2113A60771EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=In9z5Xug
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C86EF4E413C5;
	Mon,  2 Nov 2026 16:51:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D72E603D7;
	Mon,  2 Nov 2026 16:51:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CFA0103291A1;
	Mon,  2 Nov 2026 17:51:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793638270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=In9z5Xugfco9oqHHldbFtah5xTShazdz/fRl83+bTGwvEOrjAGRqIsI307ZRDWNLXGSvUV
	XOvjHjsYFU4Z5mKTdvtZYyW7okryon9JM7AcipX1zn/+zzMOC7wiYDjvjQjqNT2eDBd4dL
	tezldPa2WKvc3uMI05pj39DUou8AKsjrmer7RAmOuL4OzgkW0d3+xp4ushu++bb1MWV4Xw
	0GF07NZ3fWwXaQZKGt/h/PR+qCs8XOow7HKIoUPaZgwMFDQaoRFXz9QISh4QFC//7IS4jG
	O8oclGM46kVY4iLnUHWn3/9gT740JDMS2C+CUTvXkoFhLpYkEqkeU5YC0eywIA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 02 Nov 2026 17:50:41 +0100
Subject: [PATCH v2 4/4] MAINTAINERS: add EyeQ5 MSI controller entry
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-eyeq5_msi-v2-4-4aa3d3608064@bootlin.com>
References: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
In-Reply-To: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
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

Add the EyeQ5 MSI controller binding document and driver.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..ca3a32790261d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18769,12 +18769,14 @@ M:	Gregory CLEMENT <gregory.clement@bootlin.com>
 M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
 F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq*_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq.c
+F:	drivers/irqchip/irq-eyeq5-msi.c
 F:	drivers/phy/phy-eyeq5-eth.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c

-- 
2.53.0

