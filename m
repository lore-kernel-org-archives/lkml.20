Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5238F4F55AB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564429; cv=none; b=toYzDXDItnZ2q03sIPhQzaGAUzZLX5A7qL2gnIPo6wfB1xwhEI6PB5lZwe29cC/uUgVjVX9s/qe69Y1uaF2RyBvgy7vRPMPGNlf89J3DsbMrpkACENN1FYV0UHGTKWA6f3YpC3b2vHaV8O+qovd4JZcR6HNu2zX4QpLi7FCrFWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564429; c=relaxed/simple;
	bh=ITEH47kZLzhgpz+XPj8tLDQWf3P/3eMNHuqVkVzkFOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxIKUSFH2GTrzCC5ZayHrbI2J50iDI3GyH/nENEkcFUHcUrD8xNnYyl2jSL/nRLYzj9x0qMWXX4MyxVqkCl/ILNlZTKlIeHOaFwZjfKULD91HzilKmHwFabuKJhhu4az8NmEW1rNYF+AIKWppnrRBUvELlnf0Yh8kTtZ0AmTwP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEmNKKK4; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEmNKKK4"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a810so70991a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564426; x=1790169226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTowUO34akYDMoKwYg6M5YQFPaJFFtTDHdbH85GqPmo=;
        b=aEmNKKK49AjS4qWGFth8nCO/0rLL0zwMgzVQ7R/Cdrxv0ejtrz0svyB7yxlJ4UzokT
         KE2M1Z6ZXwghhjV0aM8HO956KBPLOGtr8sVjxg6HLSqYBZRCMyKoBd3mg57f/Voz6GOu
         708bDtMrupCyWjl7Wkcz9TaO4ejpIskBXejKR2J2oYKVnOCdgLKUNcM8WKIala9qfTyR
         uAa59FJdVQ6IBUMf8eOqmFmod7uVWpf90xz//opMbmPZa6rN92llo2PWI27WckvqColM
         kxKNLISTf6iZW8EsHBvYpG5iyeDTOB7odVumjLENq18I57bHswSlsHPrFDBURiwIkvtN
         Wx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564426; x=1790169226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTowUO34akYDMoKwYg6M5YQFPaJFFtTDHdbH85GqPmo=;
        b=s/4sVFcPSbb1FI4+FYI5gtpErgLMdHUYF12+sSNxzO5mQwetNgks+dfJKKDb9/JXtz
         AmTnFNzxdiO5LOpSTtVUT6fEeUsiugDkBfOM3HsNsD62FyjY6ZR+EBJbWvhtqzQ/L7JF
         BM4OUDFiGcJyxQsKeVgxLwKj6Xgx4rGQpgImXacGKasPHvymqwTX4sjqCji6Tszt4Ozd
         vJeAC8XGJ7K6zSq7+h9B6asmXILLVOHeXh+zmlHfsF1epx4SwaNqbke5XQP5ALPCaUJ7
         IcfUYOL+MBC5M3aHWfa8mnI8RdQveR8mAXSSA3eR1syPTzPJylAiF/rtQrdgEQVr2v+s
         ECSg==
X-Gm-Message-State: AFuF++mhWfUDRKdLdEj0+j4wx+lSG48tCH8iJJ1GbGMfM7IkWUNil4i8
	+5u/cF4LnrF6jY77eFSSMXqueoEYvmK0Y7A9LYCbgGV7lRZqhJ+fXkRU
X-Gm-Gg: AYBFou3EdMNhLS1sASTcfw7Qd3vwsitgUPrB5r8kd9Zcv96bKkY8IDsZMvz9MdqRyQW
	WYRKYInGXXXxWPLT+rv/8LLgMmFT9dpDHLWEPlRituPc+iavQ9Dh+rsc//Ey0Twon2vxuamWqUa
	2RrNv+mB1t/3p/T7Q0PzKdJ3P7oL8/0UoSCfjlA+RXj0XdoRScL34OGF4gWVOJEMPUlTzKLL48U
	847CTKrR8L68u5Od9oyJ6IYrkJIBcQC3tVHbWJRembVREy/nFulcCHv7Eu2/hH4INtjSnnOXqjk
	0VZXFnSzO9BiIrii1kodw+6lkYJ2Mtk+Ilv3z5JT6moA2+briQUiqkwlbdzKouY7rIlM/wp/N9k
	orpnTI7EsqLQnaIYFYaz26V1k6+2lkaHImNOvdH7cRuc8323/f2FMUvnIy8Nx1c0etqwiUMCYkr
	ITvcZne8iLzJvWeh1BYjI+5IkiluZMWnvt7MnBK2VhpSbl/0kA/4rIvFBhV3BCm2kt2Z/6LADEg
	r2hshctOuk=
X-Received: by 2002:a17:90a:d444:b0:39d:fcef:e241 with SMTP id 98e67ed59e1d1-39e1e2e2daemr4310853a91.2.1789564426450;
        Wed, 16 Sep 2026 06:13:46 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:13:45 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:28 +0530
Subject: [PATCH v2 3/4] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-3-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=3261;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ITEH47kZLzhgpz+XPj8tLDQWf3P/3eMNHuqVkVzkFOg=;
 b=H8QfJexEcJgwy5BT8ZgCZ5oHcOwyw0O8OB0qGHVYkBjj6C/SmmHUGP8t8eE+H1sRxnAMoYfzQ
 nq0VNU85OtmCwS7zz1Nt7OJDka9x8ryCzUv66RONJEg63oB0tXJZwQJ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
Tegra-specific regulator coupling properties. Update their dt bindings
to reference the shared nvidia,tegra-regulators-coupling.yaml schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++++++++---
 .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
 Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index caff9dc0b2bb..798d27099401 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -99,7 +99,9 @@ properties:
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
@@ -112,7 +114,9 @@ properties:
 
       "^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -125,7 +129,9 @@ properties:
 
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
index 7118c34961ba..67fbe7d6dc1c 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -22,7 +22,10 @@ patternProperties:
 
   "^(sd[0-3]|ldo[0-8])$":
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    allOf:
+      - $ref: /schemas/regulator/regulator.yaml#
+      - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+
     unevaluatedProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
index 90c39275c150..6768fc6ea0d3 100644
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

