Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391372F8E8E;
	Fri, 28 Aug 2026 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932629; cv=none; b=PFD8paMsvqD7PjD8o69EIkQibkYlfDLtbfdcgD1++RM7SMa6LzM6BAYOq3mlAvpDeSNYxqrk/sMFCnJfwM0HOnACcmEMcc7lFK9V/QzFoEHCsFkW9CuNMpD9wJFS61QGu3mLbsgUU23EMWh3Rx+yzz1h+gopNGsegTJQtqqbiFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932629; c=relaxed/simple;
	bh=E3XuLBAenGQbjVfmjvGWeq3KfYSr+unWVEaNLenotEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpOJM0DXOt/cfQ9CFqYYBescuJ/nYupIbY2K/ihcna5c74PJ7i8Nr/W6ac+s6PQRT9Ct+A1cvTXJ5tgdeoEKTK4lOHw8289FiFsewNPv9pTsexIQz5wxeGOat1W4doR+bl13ajVKVdVFZwN8JhNS6Dfyy0SSoIo0DWUKkpfs1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hWVvfJA5; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hWVvfJA5"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FBBD11D0E8;
	Fri, 28 Aug 2026 17:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787932622; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vBG7jRv/I+mblA7u8PFmX/FP7QUNIzlEbJnE5pTv4Qg=;
	b=hWVvfJA5ae8H3Lf6Rtf52kWK9+0Vwtsyp3HL6Jjp+MLVdVN7WKzEUpP7WcK78WVKk+Gold
	CWQoX6Z9z1NdIc9jVTwSUuHkmSBE1Gz/cWU03DexUfB2yuBByeXkChD/xF92PvyW0FdqZ7
	cBcSNLhavVVhrqIFaaSn83ejiQ+kTPNN8MmDUeIQfYPc+b7bDg8cPCYXkV0Ngzk62sYI/M
	13V0nfIaC3/O02ax/tiChf1wnuO0lzJrMwQgZlCgGopyGR0rlpk8KRCki2dgCxly9iFUgB
	MzAnsk4H/QoJ3XMtMCVlDGJDpzXLTUu5tAyDJq2JEnVzajydC4cfFQvJydgaUA==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 1/4] dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
Date: Fri, 28 Aug 2026 17:55:45 +0200
Message-ID: <20260828155647.353877-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828155647.353877-1-marex@nabladev.com>
References: <20260828155647.353877-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document SoC compatibles for ST STM32MP23xx and STM32MP25xx series of
SoC, so they can be used as more accurate compatible in SoC DTSI. The
SoC uses access controllers, therefore document access-controllers DT
property. For details, see access-controllers/access-controllers.yaml.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
V4: New patch
---
 .../devicetree/bindings/usb/generic-ohci.yaml | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 474a84aa32d0f..71537d268b075 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -51,6 +51,8 @@ properties:
               - snps,hsdk-v1.0-ohci
               - st,stm32mp13-ohci
               - st,stm32mp15-ohci
+              - st,stm32mp23-ohci
+              - st,stm32mp25-ohci
           - const: generic-ohci
       - enum:
           - generic-ohci
@@ -67,6 +69,9 @@ properties:
   reg:
     maxItems: 1
 
+  access-controllers:
+    maxItems: 1
+
   dma-coherent: true
 
   interrupts:
@@ -215,6 +220,22 @@ allOf:
         clocks:
           minItems: 1
           maxItems: 3
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp23-ohci
+              - st,stm32mp25-ohci
+    then:
+      properties:
+        clocs:
+          minItems: 2
+          maxItems: 2
+
+      required:
+        - access-controllers
+        - clocks
 
 unevaluatedProperties: false
 
-- 
2.53.0

