Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739F335564;
	Mon, 31 Aug 2026 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218316; cv=none; b=CKmR0FwxGpEs5DLbtrWrcBG6hwUHT1m6g0dqm8/0NOKyWITYf6A60SAmzrR5gPRoxalAg4q+pPRc4WF6LfeEWRzpASfHYXyduiESHbvhwV26b94Gj0c2p74yi9MxcU1cZL3vQdRR0MAuYW3bQhP0oD5xLl+OA8NT+2MdAyqvxGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218316; c=relaxed/simple;
	bh=CizeqQl0jEY9Hyl7j3l6LuapMyu5VfGh1C/OToiGvBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxhrqSPmxGL653v+cWA3P+cjrKw0oYB/j9SLn7A4Se6s3lZlNZ+yL39o3iz0da2li2N6GWB0QkNL6jmFFzWaeBE2EHMgPVUYZbVvdrmtqyE5J6hafpE+uWuFtIkx4BAyI8bwTfBEyNTdP4UGxgft0HmAZ8PVk6QW8xY+H+u3Yyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ZseUJG03; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ZseUJG03"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8A6D11C9D0;
	Tue, 01 Sep 2026 01:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218309; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0qi6QZxFM1X4x0ZGUk8xdwpwovEki0Xze7p5nR3tV2c=;
	b=ZseUJG03AIc/PRV55ue4uOSpJrc0YH9T4xHez/zSQsJK2n6+suqI1M/EthXJ26MTsjtBpR
	RRgyK7RdA7ESygi92Px2Pde1Yn8RHj4Kqg1URmcLdnxyMhTz1LS7uEOssK1mXgdDAjijeq
	AVqi+yCbD6AweMlhZXsR7kf4TtXtUWJV+q5QYU6oDBafSeMMwu7HGiZHoow2BZuXuZfAO0
	B8cJOHX7FOgmAgYMLVmGG6hSEAQzo5AJQXqOEvSvL/Mw/KB6M8CQRVlIMfnNzpUxYLX/mb
	zSkdPxDAxExRpH+6hw/WIOTYLEklkWKk6mCJ50CBnJJmb6sDXKEnj4fQnEy37A==
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
Subject: [PATCH v5 2/4] dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
Date: Tue,  1 Sep 2026 01:17:33 +0200
Message-ID: <20260831231814.137120-3-marex@nabladev.com>
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
 .../devicetree/bindings/usb/generic-ehci.yaml | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 5d9dfea8e2160..908b02d9175e0 100644
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
@@ -195,6 +200,23 @@ allOf:
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

