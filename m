Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202105;
	b=Xp7GANsCWqzIT5wCY+hILfYE8jQEye/FarZKu6c8aCOMRYFm6ce4KxtZswAByEI0YvtS
	 vC+vnYtH1U3yhbfIJdp2D0oP748pUxp/NzAg8Ne+dJAInPuEIKZxCAO+T64pzLS2gQV0Q
	 OybZpYsEgPZ7f8/p//KPDv99sZ2Ejp/9bGN4nFoOF7USgujGOOdUbJIETCrjBUFmfmGvh
	 +iSWVQoFUcxIam/bSugkUMFDV06QWUi2G4pAlTpsIaEmwlb2Y/D7DuaGc+wh9RMH9KEIG
	 PQ9jasC7tt8s28Xq8kOpEO1twe50TALHTs4j2+6PXOzoB5GgHtcWRAqW378CmTIBrpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=J2bEtrWBfDfYL33QiosqJnqpELJTBa1jvKEfuVNlrC4=;
	b=EOVYVvvnm7uMpvgs65gqSb8DhdMJyqRajBFwLW7AKfEFuULZyFm24oIQtr71Zx879hD2
	 04j2s1w2sZhgj55K0Zkes1dBfvQvb2ro/++pg8lKqN2xEWQ31BWyxUq2F1gkjj64awNv3
	 1SpTLIhB45j2qgzRRcMAKUHPjt4U/SI8kRXsTNSpqsDpd4y0d3sS9fHHl1WJaG95ij7/V
	 dFeD5q1AI4rhNQLivkxLmqgTBdd9xV1Tc/ljwUi7syRGkPOwtjdGucFwkmL06KGfOu4eQ
	 5Hhbyj7lkLyTEiwPH6vUlvpdowigRA9+XCzZWmjA9Mb/43Oom3etls1T8lc02/yFWFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	dkim=pass header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=k3Wnav6y;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D08606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D08606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=k3Wnav6y
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0B0022C0715;
	Mon,  9 Nov 2026 18:28:16 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1794202096;
	bh=J2bEtrWBfDfYL33QiosqJnqpELJTBa1jvKEfuVNlrC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k3Wnav6yN53XiNxMRvdymPEaGEp3hU7EtWD2vjRrMHAtPiSLkb/0yRlEBJnRAbx+e
	 6WZiNWvQZGsGnh3DNhTM7OWrV6v7waIBnZbsxHE8F9j7CdC3Iy88NmHT6wHw/R0Rxe
	 QgBW8GOWdhTRULZxHvQxUSvtbi9M9KjXOheqLT+D97rlfbt1EWkFonrCzyr6Ln6GeJ
	 Tzje59LKc3Sw34Gj8kA+cn473IcOH3VWvJ3rC7iwyDJn+OhPO9DqwAIhrOD5XA+o6A
	 e91y/ZEUQanpEp5xJ4KFspn+KOA4dG1JZ7/zuB1YC39AUdHdMoAgzmYkvVnLqHuVlM
	 Hclp2OlHAyPiw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6af159ef0001>; Mon, 09 Nov 2026 18:28:15 +1300
Received: from joshuas-dl.ws.atlnz.lc (joshuas-dl.ws.atlnz.lc [10.33.25.13])
	by pat.atlnz.lc (Postfix) with ESMTP id 624C513EE6D;
	Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
Received: by joshuas-dl.ws.atlnz.lc (Postfix, from userid 1634)
	id 60AF35B002D; Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-kernel@vger.kernel.org,
	Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH v2 1/2] dt-bindings: gpio: realtek-otto: Add RTL9311B
Date: Mon,  9 Nov 2026 18:28:07 +1300
Message-ID: <20261109052808.3035449-2-joshua.scott@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
References: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=S4h6w5sP c=1 sm=1 tr=0 ts=6af159ef a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zJRp6_cAMcgA:10 a=e4oTj6BZHg8653bzOkkA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The Realtek RTL9311B is a network switch with integrated ARMv8 CPU. It
has the same GPIO controller as the RTL9310, with one bank of 20 GPIOs.
Add a compatible for it, with the RTL9310 compatible as a fallback.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
Changes in v2:
- Add the RTL9311B as its own compatible list, with "realtek,rtl9310-gpio=
"
  as a fallback, instead of adding it to the enum used with
  "realtek,otto-gpio" alone

 .../bindings/gpio/realtek,otto-gpio.yaml      | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yam=
l b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
index 33c25df7b815..a337345a1e90 100644
--- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -15,6 +15,7 @@ description: |
   of two banks of 32 GPIOs. These GPIOs can generate edge-triggered inte=
rrupts.
   Each bank's interrupts are cascased into one interrupt line on the par=
ent
   interrupt controller, if provided.
+  The Arm-based RTL9311B has the same controller, with one bank.
   This binding allows defining a single bank in the devicetree. The inte=
rrupt
   controller is not supported on the fallback compatible name, which onl=
y
   allows for GPIO port use.
@@ -24,14 +25,19 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
=20
   compatible:
-    items:
-      - enum:
-          - realtek,rtl8380-gpio
-          - realtek,rtl8390-gpio
-          - realtek,rtl9300-gpio
-          - realtek,rtl9310-gpio
-          - realtek,rtl9607-gpio
-      - const: realtek,otto-gpio
+    oneOf:
+      - items:
+          - enum:
+              - realtek,rtl8380-gpio
+              - realtek,rtl8390-gpio
+              - realtek,rtl9300-gpio
+              - realtek,rtl9310-gpio
+              - realtek,rtl9607-gpio
+          - const: realtek,otto-gpio
+      - items:
+          - const: realtek,rtl9311b-gpio
+          - const: realtek,rtl9310-gpio
+          - const: realtek,otto-gpio
=20
   reg: true
=20
--=20
2.53.0

