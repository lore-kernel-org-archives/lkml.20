Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624851;
	b=2VwMU8ZsngkMM+BFAhYxXMExkesLWJ+M7TPDInTWw9Rj282gnmlS7DisKOOHxOMPMjfH
	 8sIO6B5LxZQqJ3oVY9UazROwPHJiccGTY5H1dbdgQA18+Yc3j/1LnAy/tPcpTHQ6Hp17Z
	 H+kjlFSmIPGkz7LAoM9mgxiM1ou3BO5Ohj10xhtP+i9cSsJW3OlpcietOg4RTG9jOffPk
	 +nhzgv3TCTrHFH1m1mwZFiPhWEXlBoAAPurV4ErbSX95Xm3buXHvCf7nPycQ17E+l7btj
	 RTFZ/pIgqTx4fCzLBC5/rUaacqF+fufdyeiOlNVB/DJU1Xa35mpq8ZHcMiIkN0LiZ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624851;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=vd4UujPDzA0eLjqYOmoFDMFIfeJnmHMPRcAx0AsIvgQ=;
	b=R/CRBsN4wAFOJQpTxWu3jJvBO4r+yABV73P+P4Wx0y00B0xMRoSinHCgxszaoOqOwScf
	 p6OOWjyz4GW13j9rJvCSulRnooeIj7xSdAGgtTjmVnCxuhTb5cCHt7b/0iiN2NvE3M/9G
	 YaItd87rdnZzx+FRxvS9ly1LAWJjjQOePGbZqhHxIz08AaAgt+NeN4r8vKK2KOYIrSD96
	 FuVXym0JzzTZ8e2em7CD3htwEztqjP4MjrGyno++DX4QfwYZMTHpFuPbVn51o1QH1LEZz
	 HdkWbMBo2Nc0UM0X9yXuHOO72ns02t0oq4ERQh2ozHn19014agJ+PKmSJgo+//XsilQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="0VPq/ysI";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287B606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8287B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0VPq/ysI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 451B9C4FECD;
	Mon,  2 Nov 2026 13:08:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E52860750;
	Mon,  2 Nov 2026 13:07:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBCFA1032909D;
	Mon,  2 Nov 2026 14:07:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793624844; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vd4UujPDzA0eLjqYOmoFDMFIfeJnmHMPRcAx0AsIvgQ=;
	b=0VPq/ysICkeaWSFbmA2Cpjjku3uMcIXbrCA+Yieb6NrUIyEwhfNMaSCEApKtwxx6JIR5tv
	v73EdDBT5m8P0CD+ppA9lLE6EnQ54U0a8OSJLrUZvQ+3z4d/XLbH/3L8HIy58XNVRMqR+l
	6ENXlj2a6bzkbmLAJgm4Oz4y6VtZx/pgXtXNBVWDmjbND/24bLG70/YG3Ruy+B9yJC7WWt
	sDWPYxTHMoCS9JFGyAE5lPM2GBdRohTcKSzEHvUNj6Iyr5KA1fUtMovj787wHm0OPIAJb2
	crcW/O2izhLhv+jgjnTwiLQ3r3xbBtz/KShvvvMHnkLQUKk3sscBrX39kHLjEQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: rtc: pcf2127: Add support for clkout clock
Date: Mon,  2 Nov 2026 14:07:09 +0100
Message-ID: <20261102130712.25104-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102130712.25104-1-herve.codina@bootlin.com>
References: <20261102130712.25104-1-herve.codina@bootlin.com>
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

PCF2127, PCF2129, PCF2131 and PCA2129 provide a configurable output
clock on their CLKOUT pins.

Add support for this clock considering those devices as clock
providers.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
index 11fcf0ca1ae0..11c0bc04f304 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -27,6 +27,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
   start-year: true
 
   reset-source: true
-- 
2.56.0

