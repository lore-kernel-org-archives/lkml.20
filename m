Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B344379ECF;
	Tue,  1 Sep 2026 04:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238275; cv=none; b=PyzPsWOjzWZ3VZ9DiYnZ/tSGgDqH2nzynQrTcsHoEp2vxmJfhwvfwWJo8N/N9eIhzRin14p8Qln4dyCe/gH08GuE5C8dUIbpj0c3jjkxmoSnoCWGvDFdeOyrPjBgylojWaNp6eFXGxSUF374Ie7hEyAPZIefkwMCGHG7UlyXZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238275; c=relaxed/simple;
	bh=1MkT4pRdCNtSDG1XUw7xEbJUEhJgevcrVIRyRxD7Kyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjfedMoHRCX/HjB8rJ+jfN4uaWGhg2cLreT1llMwu9o8qhBA3yxlQ6/jes3V1+zj5QjGCEHRn9Irje4oMkKVxBmyMvXeRXtn2lBf8odCBiFquLSepiSQChq2FQAkBzd2vR4vSDz5G/dTNZZVq0ZoxXBJORv3DMnZJAH1hEfVCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYP8NGMh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYP8NGMh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5A41F000E9;
	Tue,  1 Sep 2026 04:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238274;
	bh=6JLN/BdioSVZWWncPP6UZfuzXOw81lIFlyYD7YOucVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FYP8NGMh2ejErtsaAFQFgftBn1mlHMXdXKfPamLprXJs4/N82EO+1a+4Wj9RnAZJ1
	 dUVCc0HECwBiypfxpFMyEqwjb7t7Yb/6vZEjUphoCj7K/TqVj5KkfewrQzSOtQgDdM
	 hDmclgPQJTv46hZyasho4jm4ZLwcRuyHYTW0Rirz+0H1FPypOVQU3vFLRM4rQXly6O
	 167zbaiSKDGLnrjhCdajOzv0WAfU5JKRHG0pq+U+ZSsNhMwDd5zOFUQyERnfcOy7oK
	 hbxHDUQosJnI1lmc6+b/UIXJejNSr1LqfXNPVJzXU0tznnPUCLX4vQyr3M7bp7IaPH
	 0xrheMj2E/2iQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] regulator: dt-bindings: mp886x: support mp8864
Date: Tue,  1 Sep 2026 12:31:22 +0800
Message-ID: <20260901043123.5401-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901043123.5401-1-jszhang@kernel.org>
References: <20260901043123.5401-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MP8864 is a 4 A, 21 V synchronous step-down converter.  Its
register layout and voltage transition handling are compatible with the
MP8867, but its selectable switching frequencies are 600 kHz, 850 kHz,
1.1 MHz and 1.6 MHz.

Add the compatible and chip-specific switching-frequency table.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: Codex:gpt-5
---
 .../bindings/regulator/mps,mp886x.yaml           | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml b/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
index 374a4f6b1e23..6cf7c1c3c0c3 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
@@ -4,17 +4,30 @@
 $id: http://devicetree.org/schemas/regulator/mps,mp886x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Monolithic Power Systems MP8867/MP8869 voltage regulator
+title: Monolithic Power Systems MP8864/MP8867/MP8869 voltage regulator
 
 maintainers:
   - Jisheng Zhang <jszhang@kernel.org>
 
 allOf:
   - $ref: regulator.yaml#
+  - if:
+      properties:
+        compatible:
+          const: mps,mp8864
+    then:
+      properties:
+        mps,switch-frequency-hz:
+          enum: [600000, 850000, 1100000, 1600000]
+    else:
+      properties:
+        mps,switch-frequency-hz:
+          enum: [500000, 750000, 1000000, 1250000, 1500000]
 
 properties:
   compatible:
     enum:
+      - mps,mp8864
       - mps,mp8867
       - mps,mp8869
 
@@ -33,7 +46,6 @@ properties:
 
   mps,switch-frequency-hz:
     description: The valid switch frequency in Hertz.
-    enum: [500000, 750000, 1000000, 1250000, 1500000]
 
 required:
   - compatible
-- 
2.51.0

