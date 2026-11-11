Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367001;
	b=F0b0g9BNCClVVOlRpzGBc/rkTv7ZGeeOiBOa/wsd6Rm9HC1Rs0DJ9eMugyPiq693f+QP
	 ko4EjLx2Qcwonu6pF96LDKuGeiMxpw5LFPQ33hLhsQJzI7Ne0/YeUpRHjcdStiPVUmfk4
	 2aUPRzxM1i218VOjpEEdZgPtZIuuMV/9CZG/CCqh77dguGdyOv1YQjxqwrP06EPt7wqLW
	 8/FXXigcguGkCDac4rXH+16nPaENQRPpcwCjV1MpkiMbM0SoN+KTmbseG5An+sep2z93p
	 V/VIFqOOJRNCva9rRVvM0hXdE0sCL7Td6fSpFQgNYdrbB8QepawQPRn5ZvBO0d96Grw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367001;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vIdB7wAGTDno1mkd5UAv6J4fMESffp+CURdrKQrYqXc=;
	b=TeX951lk4yCA4xTMnx6gJThAGj96xCf2cVFFV+6AaxPG/C1Tug4CBhQPq0940dcAbfe9
	 3KSVj7g09zhVtd1AGj93eSXDpsw+yPkgOC8bn/p7V9aaLqnN/yuLQBiTaFB0g0TvmrnA9
	 zxd41LeC6i0NhlTj7kbYTgVXgjbudhWUjMA7WEvk950OQcc0K33SkqcenCr7+yulbGpHA
	 tEpd01Kovg5a6xHAURxEUwsBDLz3j6LmhJEniO0nti6HKF/e9Clb3YJ0+WoY2eQOc4WVe
	 D4C4hZ/jt1zIv+xriYh2dLTOIzjLLAL8VNXKQeNZ8e51KN+QYrQPwIW8YEGmv9myPzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60507606A32A;
	Wed, 11 Nov 2026 03:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60507606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 11 Nov 2026 11:16:29 +0800
Subject: [PATCH v2 1/9] dt-bindings: i3c: Document generic bus timing
 properties
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
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-1-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
CC: <tbevis@amazon.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=5440;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=8s/hr6LcKW3NUKIBczctmPCJ8HjrQqgS5f6q5QtjoUI=;
 b=FlOfxDc69OfnBYiNjbNnDOlB8QH4CyWBzrYFdBodKoQ84m9YOrKRgkHL6hjd00qQfHcB1ohwE
 H/lyP3vDKA9DFQyTelYKL3ZOHLkbahJCCDWoMq0Ki5fkRanbbLzjbZW
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The push-pull and open-drain SCL periods, push-pull SDA output hold
time, and the tCAS/tCBP periods around START and STOP conditions are
normally derived from i3c-scl-hz, but board-level trace length,
pull-up strength and capacitive loading can require different values
than what that derivation produces for a given board.

Document properties to override each of these independently, naming
them after the MIPI I3C Basic Specification v1.1.1 timing parameters
they adjust:

 - i3c-pp-scl-high-period-ns, i3c-pp-scl-low-period-ns
   tHIGH, tLOW: Table 87 (I3C Push-Pull Timing Parameters)

 - i3c-od-scl-high-period-ns, i3c-od-scl-low-period-ns
   tHIGH, tLOW_OD: Table 86 (I3C Open Drain Timing Parameters)

 - i3c-pp-sda-hold-ns
   tHD_PP: Table 87 (I3C Push-Pull Timing Parameters)

 - i3c-cas-period-ns, i3c-cbp-period-ns
   tCAS, tCBP: Table 86, Figures 144/145 (I3C Open Drain Timing
   Parameters). These carry the protocol minima as constraints.

 - i3c-sr-p-scl-low-period-ns
   The SCL low period held while a Controller stalls the clock in
   the T-Bit phase before a STOP or repeated START, per Section
   5.1.2.5 "Controller Clock Stalling" (Figures 19 and 20). The
   specification describes this requirement qualitatively and does
   not assign it a dedicated timing symbol, unlike the other
   properties above.

Any property left out keeps the derived default.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/devicetree/bindings/i3c/i3c.yaml | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index 5603f2e7807d..30f65fd1afa7 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -57,6 +57,82 @@ properties:
 
       May not be supported by all controllers.
 
+  i3c-pp-scl-high-period-ns:
+    description: |
+      Push-pull SCL high period override, in nanoseconds (tHIGH, MIPI
+      I3C Basic Specification v1.1.1 Table 87). When undefined, the
+      value is derived from i3c-scl-hz.
+
+      May not be supported by all controllers.
+
+  i3c-pp-scl-low-period-ns:
+    description: |
+      Push-pull SCL low period override, in nanoseconds (tLOW, MIPI I3C
+      Basic Specification v1.1.1 Table 87). When undefined, the value is
+      derived from i3c-scl-hz.
+
+      May not be supported by all controllers.
+
+  i3c-od-scl-high-period-ns:
+    description: |
+      Open-drain SCL high period override, in nanoseconds (tHIGH, MIPI
+      I3C Basic Specification v1.1.1 Table 86). Open-drain timing is not
+      a function of i3c-scl-hz; when undefined, the controller uses its
+      own default.
+
+      May not be supported by all controllers.
+
+  i3c-od-scl-low-period-ns:
+    description: |
+      Open-drain SCL low period override, in nanoseconds (tLOW_OD, MIPI
+      I3C Basic Specification v1.1.1 Table 86). Open-drain timing is not
+      a function of i3c-scl-hz; when undefined, the controller uses its
+      own default.
+
+      May not be supported by all controllers.
+
+  i3c-pp-sda-hold-ns:
+    description: |
+      Push-pull SDA output hold time override relative to the SCL edge,
+      in nanoseconds (tHD_PP, MIPI I3C Basic Specification v1.1.1 Table
+      87). When undefined, the controller uses its own default.
+
+      May not be supported by all controllers.
+
+  i3c-cas-period-ns:
+    minimum: 39
+    description: |
+      Clock-after-start (tCAS) period override driven after a START
+      condition, in nanoseconds (MIPI I3C Basic Specification v1.1.1
+      Table 86, Figure 144). When absent it is derived from the SCL low
+      period of the applicable bus context, clamped to the protocol
+      minimum.
+
+      May not be supported by all controllers.
+
+  i3c-cbp-period-ns:
+    minimum: 20
+    description: |
+      Clock-before-stop (tCBP) period override driven before a STOP
+      condition, in nanoseconds (MIPI I3C Basic Specification v1.1.1
+      Table 86, Figure 145). When absent it is derived from the SCL low
+      period of the applicable bus context, clamped to the protocol
+      minimum.
+
+      May not be supported by all controllers.
+
+  i3c-sr-p-scl-low-period-ns:
+    description: |
+      SCL low period override used while extending (stalling) the clock
+      in the T-Bit phase before a STOP or repeated START condition, in
+      nanoseconds (MIPI I3C Basic Specification v1.1.1 Section 5.1.2.5
+      "Controller Clock Stalling", Figures 19 and 20; no dedicated
+      timing symbol is defined there). Kept separate from the push-pull
+      SCL low period to satisfy that requirement. When undefined, the
+      controller uses its own default.
+
+      May not be supported by all controllers.
+
   mctp-controller:
     type: boolean
     description: |
@@ -67,6 +143,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+dependencies:
+  i3c-pp-scl-high-period-ns:
+    - i3c-pp-scl-low-period-ns
+  i3c-pp-scl-low-period-ns:
+    - i3c-pp-scl-high-period-ns
+  i3c-od-scl-high-period-ns:
+    - i3c-od-scl-low-period-ns
+  i3c-od-scl-low-period-ns:
+    - i3c-od-scl-high-period-ns
+
 patternProperties:
   "@[0-9a-f]+$":
     type: object

-- 
2.34.1

