Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C863489FB2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936061; cv=none; b=XmdQpLOq+CMUSjc0yT9XrqNxuSGpecRdfWXEi4XUo37QAhE+Zi5OhrOrzFKwL0Bh1aLyMGOcNurUFJm4dym7ss7PxF1WaORtZmbtb7LmiL4T/H0He8qWDblKIdlZd057nqySFCVbT2AS4t94DYno/EVpCYSP5AoFU9UFAqkstvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936061; c=relaxed/simple;
	bh=pS/ySpfH9ufcJV9ZmekTwrItJh48dUJXJSITcOqJ1Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsNILg7VMgdmF4c4brWLY1wmhHEWk+1lgg2d3cOaiM178JQklBiGeTKPVcC2YPxJ7i3ITxIjNVJ6SnBXbg+zMpSTSSOK+cI7Z6aRPqrakEy0NBpmEpkU/tUL5MGYyxZyzRnB7RKn84fJ72rASg1qk+EOTd352vUsW643+sAc8a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5CYiWem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5CYiWem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA511F000FF;
	Fri,  2 Oct 2026 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936060;
	bh=HWt3cXRXecfRFyDZUzqP6Vj6DVSqHh5ABYYIKmFkqJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m5CYiWemVg6aK5y88yLMjifwO1/apNRVA5oSgPOHm0flYDL9jcy2Qohhzq9rAuwkP
	 pk7SEw1twoKV/QGrlSD1fb1/fQoMyt/IulzK5dtTNBavuH61l/jh4ewOWUzXjZ3tZ5
	 ynVrLPnGJDXgVYx22hjVpwYEe8zpN+5gNxCqfRJdMIINov1RTbgj25K+tmlVLL4a3D
	 8PfNeiSFLTczKKLUT0b8m8xsH2ytgqCFN1mZ0HusxPRy11jABXLf7Xf9lJAWY3xcJF
	 lLB053T7BKe0RGmExfejz/4GOojVfKFhKps6rToBPC6icO6KDMS84uAT3mTJOABoJ/
	 eXqKEPFA36BSw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Roman Vivchar <rva333@protonmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 6/9] dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
Date: Fri,  2 Oct 2026 11:13:49 +0100
Message-ID: <20261002101352.1084447-7-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101352.1084447-1-srini@kernel.org>
References: <20261002101352.1084447-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roman Vivchar <rva333@protonmail.com>

The MediaTek mt6323 PMIC includes an EFUSE used for storing calibration
data.

Add the devicetree binding documentation for the MediaTek mt6323 EFUSE.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..d2de227ae7a6 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -159,6 +159,23 @@ properties:
     required:
       - compatible
 
+  efuse:
+    type: object
+    unevaluatedProperties: false
+    description:
+      The efuse is responsible for storing calibration data, such as thermal
+      sensor calibration.
+
+    properties:
+      compatible:
+        const: mediatek,mt6323-efuse
+
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
+
+    required:
+      - compatible
+
   leds:
     type: object
     additionalProperties: false
@@ -307,6 +324,10 @@ examples:
         interrupt-controller;
         #interrupt-cells = <2>;
 
+        efuse {
+          compatible = "mediatek,mt6323-efuse";
+        };
+
         leds {
             compatible = "mediatek,mt6323-led";
             #address-cells = <1>;
-- 
2.53.0

