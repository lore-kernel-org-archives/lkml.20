Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8131B114;
	Fri, 28 Aug 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907555; cv=none; b=Fm1Qbngcy4WLXimEoyosucIqNjKzrXBmHuYKfH4rS6W7MwszDGPvX8xwZSpsuHcuSkjVPX8IYVGHTQms/ktiCeOkk1JHKcwwrWe9P4bagwbCeC5rdyG8NvoVWqYVgAvj4SdHptTuyx0w/jnzo1h+CntaH8bFuFvErrJ1E0b0wUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907555; c=relaxed/simple;
	bh=l9SbAnlWZkh5y3/Jt2jLmujwt/iglb+nl42d9KhKbcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbb2jiT44aUU6KZkihsGi7JWRG7Y7VmWBaTGQnTgTSXr+KgZYYVlowQ8J9FwUCt72/gehePfT6jzLi+zdieLG7AkvoG9ukgN/uo6jxi9+i3BiJ2MqcGLX1EIreS5TvA/NWSJHxsqZfrJ2nupPXcEU0YM0vIQ953112Y5wIZ6zhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=M9ls31GF; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="M9ls31GF"
Received: by chaosmail.tech (Postfix) id 4B02F1CC005;
	Fri, 28 Aug 2026 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787907545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlG6+PUtIXZNwnf7x0S0fxthA7NmbjioQPaAPnBJ7dU=;
	b=M9ls31GFjmt8LCfrUUNc7Ri029gwjvtGZralr2btExEbGWHWzbnLkbwXBm+ZbO9kjFlS0b
	OpyH8FrBTzLvzZyxDiUEHv7ANfM0lpcXf45aWAMhFj828x70UL81jc+jU1HtVaD74RlzFd
	lvB+pLjdpc00quRM+3ZwHSZmnc8FFXI=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Fri, 28 Aug 2026 10:58:57 +0200
Subject: [PATCH v8 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-t603x-spmi-v8-1-708d4d12e0fd@chaosmail.tech>
References: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
In-Reply-To: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787907544; l=1674;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=l9SbAnlWZkh5y3/Jt2jLmujwt/iglb+nl42d9KhKbcQ=;
 b=iK66TXlyqc4dLyt60dj3klyet2zYmXW69OmBSTI6wIFZT5EDat66QWM/T1UL5cUPwG0QHZ8t4
 J1e0GAc9AfDB+oN8l4b87DLcQPnmUiC6GxaQeeeR4iM5IWjLQFpxu9c
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..09d383bb4fec 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,10 +37,38 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - apple,t8122-spmi
+          - apple,t6030-spmi
+          - apple,t6031-spmi
+then:
+  required:
+    - compatible
+    - reg
+    - interrupt-controller
+    - "#interrupt-cells"
+    - interrupts
+
 unevaluatedProperties: false
 
 examples:

-- 
2.55.0

