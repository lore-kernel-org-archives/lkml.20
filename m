Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970B335564;
	Mon, 31 Aug 2026 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218312; cv=none; b=QKm2Psq0+xG5MyXTKJTZqACzO9Lr1WcgMYxNSi1h1qusxQuQANycgVNxlx7ecL+Vnj5UA9JQpYK3tKWFTxqKw7DHP3WW62ern3Vt/hz88YylE6OS1ybJXoEh7fn+RqQGZ7rR0puQVVbwVGv2NaX3ciE7xvpwQJ9l2B9ucfQZgBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218312; c=relaxed/simple;
	bh=EfnnXMqEC8qBocyc97e1x9bHcnoRloON6S/uCSLO+DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuDtvZyRid1/1cDnLZB5ZiKQXomRregtDDAshyvSHkZlflkDv2bXaDaH1P1cMRLAqEgSXkUmplECQiqsEUkUfZm690PZn93q0bUO9wvYUigOY2HlnG4+F9Da/SmzBhuspRaSjxFhURIdixxWiJfMvbtzXsMo+U4Qt16Q0eDgUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=MQcMKOwk; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="MQcMKOwk"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B6611CDE1;
	Tue, 01 Sep 2026 01:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218304; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EJFmrBKMnXrWypnFCS1VTSSpdz94ljm2XVTUsWwwI2M=;
	b=MQcMKOwkxf8IQ9XCLQ1GTfRo6ykFSbNr8629GxG/fPlKGQYszgNqr/DJdESF6GgRTf1Sac
	7Qa6fuCcR4De+sRVVL8HJmpKabN0OJ/4HXWFG0fSXdouQPflN7A2Wsgu2l2gl4m/qWqLyM
	J7+aU/fK2qnXrKoWOCQwVrd7T/kAd1Dy96vLfctKk0eu8ya4rpS3Yi72R6sP8KlGbhZpBr
	1CON8cwEAHP/y53H/lmLl4FJDaN3Qaw6XRwBNY4YiKMmJOVoMKTENmNvfuUIqSEVYF+P/1
	4Wvd8hYdq7ljrfB5apRXYDF5V1uEoJhBA0GgBvUSLHks9dvDPxZQYPbX0DLrXw==
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
Subject: [PATCH v5 1/4] dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
Date: Tue,  1 Sep 2026 01:17:32 +0200
Message-ID: <20260831231814.137120-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831231814.137120-1-marex@nabladev.com>
References: <20260831231814.137120-1-marex@nabladev.com>
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
V5: - Fix typo, clocs -> clocks
    - List clocks entries as list of description:
---
 .../devicetree/bindings/usb/generic-ohci.yaml | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 474a84aa32d0f..7a8c3c2318153 100644
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
@@ -215,6 +220,23 @@ allOf:
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
+        clocks:
+          items:
+            - description: PHY clock
+            - description: Bus clock
+
+      required:
+        - access-controllers
+        - clocks
 
 unevaluatedProperties: false
 
-- 
2.53.0

