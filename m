Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE735E1B1;
	Fri, 28 Aug 2026 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932634; cv=none; b=JgaUSRnMhqpb0gbod9CwaxmBg0mvIkWA0Z6phpFLSRVrp1Fe/JeyOocgiFXxegAqBS/tDU2Ja4yfE3TfGpwotAMcMHH6yPJ4S4kOhgr2xzX0AtGxURxAK6EDFfXmnwY5mVuKK3OAit11AxIElz8YS7UExBnrZ2HhUhMj1KfB7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932634; c=relaxed/simple;
	bh=XtXQ8cbDYs9afRHqeLuHRHp7EjqRg00ZpbiAcvgbArE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkudjxu1UP50dDk2AI4bnGi1sEOcixlgiYeioARIlF5B5oIXiZ22L3xC6RxCHmlgSqpzMPl4bRElrR3Ubuavpj3Ps5TN/lJAFA8xiqOwV0IpJA5yL62xhQkJginwQYPZPY1wcbWt8rDHO3HQFDbxjvicEcvWOWXs36kwHzWyj6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=DCg7lc9l; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="DCg7lc9l"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9415F11D132;
	Fri, 28 Aug 2026 17:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787932627; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vJSjjDjQ0wdkS0l0mGl82POQsgBcPy5v+GQQmLa8oqg=;
	b=DCg7lc9lKXInxZqr5+32Ia5ZMs7JQFpxqe7l1OX7Rl/V6CwK6iSXbE1FvmiL5ig9k22IPa
	lEa9Tb3yiOP/tldPbhJhTpahxzS9GRPaTh5YNV7+wgTzQGXGyROiB6VtfIFaey0i9kHwn5
	xe7R+fvB7C3CKrxFnUo3HFRWDcMAfCfFd0YLpMBgafICsA4GC1Oy7FT2aPa9IEGCMZiwkU
	2XeDGIKpR99GOF9FmZpvMqxMBB3cJ3sYHkY5IxJIaTdLw3/e9s8YVGekzb+RZsJ3TmkF7u
	+/TMdXY2vTF8K8314uot2bWkUXKZR/iKOMzljFqthDnihfKKNMIzE2cljvBrZQ==
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
Subject: [PATCH v4 2/4] dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
Date: Fri, 28 Aug 2026 17:55:46 +0200
Message-ID: <20260828155647.353877-3-marex@nabladev.com>
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
 .../devicetree/bindings/usb/generic-ehci.yaml | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 5d9dfea8e2160..49149b9d067af 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -57,6 +57,8 @@ properties:
               - socionext,uniphier-ehci
               - st,stm32mp13-ehci
               - st,stm32mp15-ehci
+              - st,stm32mp23-ehci
+              - st,stm32mp25-ehci
           - const: generic-ehci
       - items:
           - enum:
@@ -82,6 +84,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  access-controllers:
+    maxItems: 1
+
   dma-coherent: true
 
   interrupts:
@@ -195,6 +200,22 @@ allOf:
     else:
       properties:
         clock-names: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp23-ehci
+              - st,stm32mp25-ehci
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

