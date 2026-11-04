Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797108;
	b=HIOf69Iiaq2MCmL2ioujE9v85E4OKm0b6mFsgP//BDGrjJ4l2uBURM+qIYSTnYlJ5s9M
	 1fhrKOyhJplAmEAzOpM/MkXov/xeRlQlI3S3j2YlsYkUfD1XIbZSVO/nE9tgOtK0AuLA2
	 TSqPhA/AjciGMUgUxVJLoC7nFY5frtNvanG0PSlvBtLM5G7UIvdptHTrPUD7YwA2SBoMt
	 HDIIr2PfFG8kJDbflfuLoA477BnRIGxCvwBB3Kdgv0uHJg8FRMZe36xJnqKCVrWaYJtWX
	 dV8xa+WrDEMbvgP94c6bAha9cn59r6x4hLBtAxYebOF58CPGirKJsTjz4p7L48VJ3Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797108;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=0ULfN50HyjpLjp5IRG0eyWI+pr2WdS5GmuC8LQCIlJUrJoFM6sQsJiTdclh9DvqxHLgM
	 zw7l8DhUcTRC3Y6VuFXNOF58MckgxY6UGhqa4gznTRSpm8ISGqZdGSOC6VrpKQQTF9LCZ
	 e+VQl+fa1bGFQk6tXDuOfHoZoKcDf7SwsLJ7QTOxpydu43QqQupQ8nGowEIg/D8L0XmlY
	 ooOalLobxIRZxvnyG5osqwhzR6mdUsf3ZbJqZyo96YAPDyns/93pskPUKE1CT6xygvQh1
	 Fy645FdcpT9MqXGgp+6OjxkXfEo3WnLwXtBK6Fhe97nPCB6kmCmdHjKBaav49kGMXgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ppmQog05;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335A1606D829
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335A1606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ppmQog05
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E84441A09F3;
	Wed,  4 Nov 2026 12:58:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8DAE60770;
	Wed,  4 Nov 2026 12:58:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F1FB103291F6;
	Wed,  4 Nov 2026 13:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793797105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=ppmQog0544qg+PHX483FrjV21nuhSQoV2zqTyxCmraipWI9SzdBN6fsg0rAlfv3EptugsJ
	BIYh6L/sEaRtYuKt6sTBNy6xSo1XOhKj5Q83/az1xGMVWVpIz9iNrAGYntkr1l5ubVmSyj
	nMkbG4jzpT5DEdsNC0FYTtJdHupuzLLkT1gmyKcVAXHdapfd2Y8gcxMngQ+VWmGPCZRQDc
	XDCGWI5bFBTNexwBv2v6S+3hnLHI3uIfYDP+ndsFejOj5tIuHFf2JDLn55E9Q+E2gR53l2
	MQTUOINAqq5PTjhlMwxUdhd/2MFFZni9ce4fQ2rCJVwCCc2CthQf1LQi2o2awg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 04 Nov 2026 13:58:04 +0100
Subject: [PATCH v3 4/4] MAINTAINERS: add EyeQ5 MSI controller entry
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
Message-Id: <20261104-eyeq5_msi-v3-4-2866f732cd38@bootlin.com>
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

