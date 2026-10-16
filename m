Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30AB47DFB6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149659; cv=none; b=Q5jb4t9qi/9dEUWOcebWp0sElaAPnZRK+1+Is86XjubmfPLqP3Url6w49n0jJE9Qt0i9gbTz8Y4yEXJkarBTV52veknHkkrLcgd2VPUOyWSvPrTGt7PyRHWd/AjQCvjaSDOxiOEXQx2hXZJuv8fKyqrkcOex3zAx5O2ZYiA+94s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149659; c=relaxed/simple;
	bh=K3HFfRXhY985XKq73bUHsf8IzVEDhqNJgoVBj3Mi1vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=To203TCdSeQSY6zW+BSzyjGRhb6WcxUvMPCHA+WG8CIvj7LZaznFB2R3gH/JO8lkRs0Ltpz5wc7lrm5W8qkpnLbIw9F0pOV6zqjKy/iO9oOgyVpG01ldX8eLig0y0GpoHhx8OBECddHAkOCCzMkwaD0srRMxctuecEKeAekgK9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=FC+OWePP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="FC+OWePP"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e9aff12fso41902866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792149648; x=1792754448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RP6t59lytBlT9EpuEl094ip5/Z9ytw4aKa//LaCI6yc=;
        b=FC+OWePPP9UlnSw6nwfJIstHxvVUaOAgxrOH+GxV07P4pOfcNWd/FpojR6NP5Djgew
         fnevroSh+3r4d8lwpxOPSqbe3gHflKi04HGBukfqpm1HvPh22cAJxc4gNMfpvHpWfMXU
         jbQM4zUEGDnQnsx/QX62K+BeMRwfcAQk0JMwnx6ygV80eZndNIcy8b/omcQvAI5wBGpL
         SaD1TeHN/41H5cW18B3+6+H9LvsW59lPhMdlVAQKWiWLXZAyTwoCEbhm883f8K/0U3HJ
         dX21USz6OzZX/U/AqEYmIzRFPTVkZcnfadis1jAhVbXKGFxYm39iVJ/UKl/h7mVpB5Qi
         tH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149648; x=1792754448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RP6t59lytBlT9EpuEl094ip5/Z9ytw4aKa//LaCI6yc=;
        b=BQOhSiPgxAo+GGKw2fLbfzzB+jBvkAD7QTGj6wqTHVC7y4Vb4B6cERO7KI1AKwnhOu
         H6gZ+4nCwTQDlxMLyLPPb5UAFinLlQscw9kKfLzP3TtY0YnnD/+THheHNk3Rq60NT5DC
         a01VBXccN+MUY7aiK2G8nINsLcDtA3xGyT/osEHp4ipsAB1qar89K3v6xcSSICMs6bsI
         ajY5yw/p8Wy24wKDgQcuPN84s8EnSQNa29DcyLXFhTKWQs+NCmv5oRQw5ohsOnl4nxud
         b3kJFnWuWsZGmofVw8iDi2B5kYkU2PL2/YEeo+5ETmZclMFLqtztRMdEoLXwPJOHLJzg
         Vp2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzL1q6UOaFKjgQr7ev26v4Hf8++qoKIYJ0NYxxztZZxKjTPJqY9RV12fFyj4YKYJBgEEFiF1C197v90qRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwSw/skAmiMxuj2ncera1alUrYnW+QAT3HQoMxRoQzNaSLuM/H
	Dr6/RO9CDaR+0Den03xp8OsJxKZW0TKWGAoDZxutGIoSxCXO+TztTH7EIY/ZFtp6VG0=
X-Gm-Gg: AYBFou0pxZwyOiu4cGtGQVcvmynr6bYRS6+x4jr5pmOWM1pVvN7KKniVK1CtEQE99KD
	N6MzgACqJWgMZIpG5vvdd4nV4usfKojjeFwPp0aKvJ8Mc837Yay4KWaPWvAAo7sn086d6svNZLt
	24BOdyMaUdrUXAYn0/JYMROLZYE/cnd+XxZAfso9VfWtK52F9/2ai+QRta3jVc6NieVn3y5aPDG
	M6gm1cdJLezWqKt6NJHIj8+yvfWmfvZNllOXuQsZQFGDR2bvRXBlruqn6T4i/YxJsuV2Td6mdKq
	g3VcTMRhLrW6jhfRPsVSKEyCoymSqF2TxkK4ceAiS806BzeagzKSLUs/CNQDO09Errxjaqgm6Br
	enxgTY7Q5P3bsXgwLOAxtjYzdJgvWpfE8ydzlysDaoBqEL5wCzhk5E3o04jaU86YjLuVPgrDIGZ
	YjDfDInn+9xBRnPEJ/cqiIy3wfjzdHWVmqNcwwbIq32SdQGtPKox4x022jIZqLiI2M8WqS43uwJ
	CCuxHNINwC0t+nzmhVluCuc+c5fWTJRVdkqxSeaiNqzaNRkJfLEBtAvqShBlouAoDhqQISBF2Ak
	zGAagLGLbw1C9u6XnU073RV8/u1c
X-Received: by 2002:a17:907:7212:b0:c2d:bd95:874a with SMTP id a640c23a62f3a-c31a9fd3559mr1982434066b.17.1792149648629;
        Fri, 16 Oct 2026 04:20:48 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-194.xnet.hr. [88.207.15.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm63947666b.11.2026.10.16.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:20:48 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lxu@maxlinear.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2 4/5] dt-bindings: net: maxlinear: add MxL86211C lane mapping support
Date: Fri, 16 Oct 2026 13:19:35 +0200
Message-ID: <20261016112033.949026-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016112033.949026-1-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the optional board-level mapping from physical TPI lanes to the
MxL86211C analog front ends (ASPs). This allows DTS to describe wiring
that differs from the hardware reset mapping.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Define the lane-map property at the top level for type checking.
- Describe ASPs as analog front ends.

 .../bindings/net/maxlinear,gpy2xx.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index a0dfb6192d81b..4323be300c721 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -35,6 +35,7 @@ allOf:
     else:
       properties:
         vddp-supply: false
+        maxlinear,lane-asp-map: false
 
 properties:
   vddp-supply:
@@ -42,6 +43,21 @@ properties:
       Regulator supplying the VDDP pin. Its voltage configures the MDIO,
       MDC, and MDINT pad voltage and must be either 1.8 V or 3.3 V.
 
+  maxlinear,lane-asp-map:
+    description: |
+      Mapping of physical TPI lanes A through D to analog front ends (ASPs)
+      A through D. The array index identifies the physical TPI lane, while
+      its value identifies the analog front end, encoded as 0 through 3.
+      Each analog front end must be mapped exactly once. Omit the property to
+      retain the hardware reset mapping.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    uniqueItems: true
+    items:
+      minimum: 0
+      maximum: 3
+
   maxlinear,use-broken-interrupts:
     description: |
       Interrupts are broken on some GPY2xx PHYs in that they keep the
@@ -91,6 +107,9 @@ examples:
             reg = <0>;
             vddp-supply = <&vddp>;
 
+            /* Swap physical TPI lanes C and D. */
+            maxlinear,lane-asp-map = <0 1 3 2>;
+
         };
     };
 
-- 
2.56.0

