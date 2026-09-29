Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08762258EE9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710241; cv=none; b=SjSxQDrfPsjn0xoJfxkLopdVFNAZtILYgoclzBCGZrnYYwDh4oTDWDazQXFod+WNgflGO7LfYlNH5g3QYzLn9ATttaZblD4btU9te8jrmjSYSlUyvVbRQrWzdxDdG+GT6wP5KObw7TrCd1RnlKz6jfY7+Lpm0aQcTwaseKd7+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710241; c=relaxed/simple;
	bh=nrx9PWS3jdg4LqtwUbFvGTGJFxFJvxOwGLbJH8e2/5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtkOs+27v0zVoDqtAwNgyQf7YydqAIK8snw3V+Mx8WIgkiyxhiw3LRzfD7nJ18QEEX/fC4trAMYQS1GKMm4UcX6Rj7bgNIzvxgN+Vzss1ZSA8LoodIeEZVxo1YFpcYezNMMiKWUbXiVJGTaPzPCIru/98mc2Mm+jPGvVqdnzfVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ilkfcb6O; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ilkfcb6O"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b482f7b79so119168eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790710239; x=1791315039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGAaNaI6MWU2v1/hJGrbMcfgTrexpu3RiGohYIJGhaw=;
        b=Ilkfcb6OyshPQXEBGtaEJSJ1dv9XJ9CxDccKXWcweB8ng4+T8xje3vAAuhji4SVv2O
         fJkClxt+wSVYxG4GqBsEhlm8be1H/FpyKJCkrWUfcdJIpJk8UKWHjG9Kqjz7Jg/THJ0o
         DA2dwnx0hqUDXf/yipGSnWVghQ1mfCBuz2JpzoWY0hMzTwBMRQeLlfXrB3TuwCpGC4rN
         8pEeGe0yubXp24A7AekqcJXGru+rsS54gYcWRUqtiaJilvk98O2qjuk+uqFiYjjYlBhg
         +X5C1aCJCsRfRZnCTdQKU6KBPuHeI+h+zKe0PYax97W34yfcudQZzktn3knuN4lHSq7b
         eTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710239; x=1791315039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGAaNaI6MWU2v1/hJGrbMcfgTrexpu3RiGohYIJGhaw=;
        b=dc/qN5cPs5y3yxo8i/eRroNFJ3lvTNO/M2O5+hBjOj9Fd2JINz/T+2r9vjF5oENlAy
         JprHD0mPoo3ijUmcLcuMPMXcce3tp7lBzWqujUUTLSh758SU3bBm/FsqbUJ5N17VccXq
         iSOfKgryYYeL7exiUiulKEuxI/V3bfgrcqiP251EEti8iENoWSf5LHk/sng1V9mKK+CN
         UTnZNamf08ujUatLt/zOPLB39+GoBr/jmb2bwtbnpmS1MEOK1qffwuEFNJKdMvYzA7B4
         p578evPFXFC7EavE8AMqeUNqUZVkHDtqtctS6JoDrSi/edLkNeMzO/8VQFZI0h2AWEb4
         5WyQ==
X-Gm-Message-State: AFq9FYLKd/huksrkH7T5oGWOveADASrssD3ziPf3cCEcrCXr6jQOmGjQ
	0iL4ya8Ta08KgqTf0ssxYP6MpD20w1GKG9Qc4qJO5/NROuvZMz5vdKUM
X-Gm-Gg: AYBFou3ScNks/rdfboRjnBGC41ax7O0DJ4WGsNSzNuWNah9qKpgSSk2h62ssaUww8Ic
	kUG4S77XiW5wNtnfqJnc97RJZtCmrmLI+UkgGwyYSfYUby8XTbWhnLXFcywv8pyS9wLwoDETn9Z
	ZfRuaEG9DgpAtuKSbyDWW1O3YkQVe4HdZkC+9MDb3MgBkeu7Ewx07YwpX5MG+z+NdrggIesQEzd
	PyHpZdfYf21fDvL/xPP42WUSArivU5b8DR2NArdxOtmSRK1CxRZXGXZ9vB98AO9S1xMEzhCI1oX
	1QzGbfpWbnWBUDnF+kY5BvsXnxjK4bW4fzzBsSmlzXOCURVov1/Nl2O2uNEiooP3Mjh4o7scuEL
	b7bfS9dGc119d3y7dFeTiq7KRYEa+nY3gJsSpeFgcCZwNHMNxjOrG+UIooarcpJ2R4qAyfRXeFZ
	IIbBsesSgampHJ2KtlyrTJiPU19u9lgvRmBCqLgs5m5aWGXrIo+FqTIg6XJp60jxi6wkKa7ODO4
	FobFvCc0lmOr/MijRte
X-Received: by 2002:a05:7300:ce8d:b0:343:fdea:9a0 with SMTP id 5a478bee46e88-34c666281edmr481185eec.2.1790710239128;
        Tue, 29 Sep 2026 12:30:39 -0700 (PDT)
Received: from [10.211.86.252] ([2409:40c2:5054:69f0:5c6b:5195:5b7b:d414])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386b6bd9sm1275349eec.16.2026.09.29.12.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:30:38 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 30 Sep 2026 00:59:43 +0530
Subject: [PATCH v5 2/2] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ti-tps6586x-v5-2-aac0273b5da3@gmail.com>
References: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
In-Reply-To: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790710190; l=3317;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=nrx9PWS3jdg4LqtwUbFvGTGJFxFJvxOwGLbJH8e2/5c=;
 b=jYVGRLN1rCeA5gBW8wN4yvy44oA+AyGQ8yWRJ8UyoIAUYvVfFwjZ+r2YOpUhCx40CNPw75Xyn
 0gbgWBw5Z9ZAXobjAizQU1JdNpDASKvErGkmpZY2poMs4sg3Z394ON6
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
Tegra-specific regulator coupling properties. Update their dt bindings
to reference the shared nvidia,tegra-regulators-coupling.yaml schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++++++++---
 .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
 Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0cd..209dc97909bfc 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -97,7 +97,9 @@ properties:
     patternProperties:
       "^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -110,7 +112,9 @@ properties:
 
       "^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -123,7 +127,9 @@ properties:
 
       "^ldo[1-8]$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
index 0f2901cab8afe..a2778c35919b1 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -22,7 +22,10 @@ patternProperties:
 
   "^(sd[0-4]|ldo[0-8])$":
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    allOf:
+      - $ref: /schemas/regulator/regulator.yaml#
+      - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+
     unevaluatedProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
index 90c39275c150e..6768fc6ea0d3f 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
@@ -20,6 +20,7 @@ description: |
 
 allOf:
   - $ref: regulator.yaml#
+  - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
 
 properties:
   compatible:

-- 
2.55.0

