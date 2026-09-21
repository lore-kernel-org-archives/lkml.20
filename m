Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315A47A890;
	Mon, 21 Sep 2026 23:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033321; cv=none; b=Rt0BSfbmBFhfYX80tWVsSXtuFOcFTWUp9UaPqIL/b3keN1Yr+kfH7rrPAaM4ZBG2SkyGTpLtqt/ooEAGssXMFA2a5SPxdDBI8MYlSsjn+hxsYaFTeA2LJt/6Vcbdi0TRqnrowFI6VGomA5ValrtIFnxRBHOmho7rnn/Ec4skGbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033321; c=relaxed/simple;
	bh=foqcfU+eZ+yZsyUr0SA9FJttmu6TCVUWLQCiFjLVEKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PL/PgOYPwHrNYSY2awzGsx3MgXA1L5lgDubgUkqZl6OB7DlQqZaakiv0foP4dN57fauOun12XEJa6+ReHC5S4azKLDddlPsWvpCoB5Sw2/I8K3oatW0gS8HnajGBpc4PzXEbCBEgOBE5TZosRoVs97i7ZHVwzUFXOl1PxwncMRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+Odly0Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+Odly0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20831F00893;
	Mon, 21 Sep 2026 23:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033311;
	bh=0RupzW/FT4LhbQh69ipSTT1xqE9hq20qRoC+mBiNiws=;
	h=From:To:Cc:Subject:Date;
	b=T+Odly0QoARTmc020X2sVMY3PoJrbSZfvfK/xDUBRFoBPZQ/Fo7mhFz4uxvr1xio0
	 yNFuGR6Beo/B3aBjiQyxxay5r8jGCUH6jTBpDOLeuiOMAsDOXjD2JCheDyxPCghZ+Y
	 1YKYF8LKXbEO7VRAn9e+QzA0TEn8uCwLf7CmJcSb++wTzlIeKpFMK5v+C1teAga3pZ
	 5ZqS62rThiBPDoNPZmGzcLzipngzS27EA6tfzsx8yHImXggFI9BG2g7FrL0VjHPc2A
	 OqVoXnta5PCzM4PjrHMktSmKM5THFfv6ceMchOzf3jkuX4aaRReqqYZCzzsbgpu3NL
	 PUyDLCagGfOeA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: cci: Allow syscon fallback
Date: Mon, 21 Sep 2026 18:28:26 -0500
Message-ID: <20260921232827.3138193-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow ARM CCI-400 slave interface nodes to use a syscon fallback
compatible. The MT7622 DTS uses the fallback on cci_control2 while
keeping arm,cci-400-ctrl-if as the primary compatible.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,cci-400.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,cci-400.yaml b/Documentation/devicetree/bindings/arm/arm,cci-400.yaml
index d28303d909e1..a4f086c2f9c4 100644
--- a/Documentation/devicetree/bindings/arm/arm,cci-400.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,cci-400.yaml
@@ -45,7 +45,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: arm,cci-400-ctrl-if
+        oneOf:
+          - const: arm,cci-400-ctrl-if
+          - items:
+              - const: arm,cci-400-ctrl-if
+              - const: syscon
 
       interface-type:
         enum:
-- 
2.53.0

