Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1DC486B85;
	Thu,  1 Oct 2026 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886932; cv=none; b=s/wnqaVLG+bp9t98KY+c4DgM9ZhhSZwkD/GypsVFy0YjfeTjUnOUs0sNs8Rh3ZH8FI0AGFisssPLOp3QLkaY95cz1UGZPKpeJ7fQcE8RP325nVbAs6ZYOiz3MLP3HOz9ScYziV2WTjPduUbrQ1w+X21gb/1Iq+qx4IIxUDslufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886932; c=relaxed/simple;
	bh=hB41yiTeB7yUdgLmPck4QL6QQEw/Im8eycw8rMjdcpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfME2jHcIvp1194lr/XU70SAnqGxznhuRBG869mnXd77d393I7tobPL5byvVIzjlAaI7LJ8SgYafeH2nIiMGrBaa/dFbGMdsz9wWc2Ql5EV4xC54+6DDwpPqI7PcgO6WOdxAedXZ02FS2CtPcgR4H9QwmeCEjExoZX5QiSdYaBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=Mn/r1KrY; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="Mn/r1KrY"
Received: by chaosmail.tech (Postfix) id 11A6F1C8DB2;
	Thu, 01 Oct 2026 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1790886422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+zwGGV7ihofYpqOYK7iJnQ5635HlS3lYL7TQsZckEE=;
	b=Mn/r1KrYyIcdpuPGXO+80+SB7lNpz70rHhIFeJuW7fAVUL1p835Vym0NQT8cU4QdRQ3/pT
	EiGLINwMST7UPSD5N0TVK9dJb04L47dO2J+TVREU0eZxBJ+bJ6+xZ+WTy8leSMTBAluO5m
	bok5r3ZdGFbXY8b+8PChGqbS8YEUp/c=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 01 Oct 2026 22:26:56 +0200
Subject: [PATCH v10 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-t603x-spmi-v10-1-ff815c66c73f@chaosmail.tech>
References: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
In-Reply-To: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790886421; l=1694;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=hB41yiTeB7yUdgLmPck4QL6QQEw/Im8eycw8rMjdcpE=;
 b=tYhSRgI62c8w8T20AZaKQqeBjXJreQT+gRgFVKrGaSB/3+I5ouCmKpMi6hulQIqQPHBMl2rHn
 rrdlPm64MPwAi6OfKNyAkHP6IUqoDWbMAx81Afvu8z178sVlPebNPPP
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Reviewed-by: Janne Grunau <j@jannau.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

