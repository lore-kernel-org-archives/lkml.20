Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B29E47A0C7;
	Tue,  1 Sep 2026 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258557; cv=none; b=aiNpzonK1PeqqMPXkzk6Xt6gbGJ/dRu0RyNJWgXw3XfktJYQnkUuTRJRTmATrHxOQQMMysfZiJaDbrMjBxT9pUBK2X/NIa1pbReofylAV5s9vn16TK1vplCyVjFcxd9GHf8uOoMFJrkviBTDWLXvKkCnXVhivifAw2hyA6v49Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258557; c=relaxed/simple;
	bh=wJ6qMGdtWseMryN+olkgWbpeIlNs0TZJgF0HHFQ3wY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=faQC12ym/yjnS8XCokqsFbvLaRrdS0UGXGPhfNdiqYFt9GwljNNBHJfkV0wZg0tZ6zj1YCAhwAMRmvFvcxeh/NTo+p1mTQmCg7Yoj6VlTrPtvt1diHOiPLNEWhR85V6mjPPKUSWoF2SbR0O/VGyNvrbRS97K71v81T4qBWLpNt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=MNLoeZ5h; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="MNLoeZ5h"
Received: by chaosmail.tech (Postfix) id EAC6D1C9E37;
	Tue, 01 Sep 2026 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1788258546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWYplxL+IFJcZcCneD2+r/0ef0SLk31zdprdUCdU9es=;
	b=MNLoeZ5hRT5JlpdeU4JIxUeG7+TZgUy4eEckSG0s8zEaBntnN9z+CKW8xjkYq1Eq2plw2T
	18wZTOtojjqGPj22K+jUvYfI0xlb5DlX/B0uOKBb1JYFJZDsxB/87c4sgznt7i/Pxc06mL
	k8kIpZfrSSb5q85S2h2k3sjLJ1oU7Do=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 01 Sep 2026 12:29:00 +0200
Subject: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
In-Reply-To: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788258545; l=1641;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=wJ6qMGdtWseMryN+olkgWbpeIlNs0TZJgF0HHFQ3wY8=;
 b=MNX7u2QC4+yUol5yMtS4HtxtDidjaHab/xDgxLrcJSMFq0dSJY54/GI/LZzHNoUmsF95qrOui
 5/cz2rEqaneBv1ksENf8TzwHA9/AM9HrujfXosVM+98ftQjP12UFUth
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..4e73083ecec3 100644
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
@@ -34,10 +37,36 @@ properties:
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
+    - interrupt-controller
+    - "#interrupt-cells"
+    - interrupts
+
 unevaluatedProperties: false
 
 examples:

-- 
2.55.0

