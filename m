Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F404CF468;
	Fri, 16 Oct 2026 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179628; cv=none; b=bEgUzRsdIw80O3uiGWQQZm8dt09TynNhpJyQmjl2xNTkvChMLmcOscGLAveadNWpm2LIxI0R+xdt+3O0j0h5Zpn1uyiaRjVqVY3/zgycvBvlkavFNdehhOPwOv45RXgAVaGK/Soy4Y/G1P319E3PQ6AJegqImvUPMuBEccJqMVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179628; c=relaxed/simple;
	bh=k/c76XXBcfG9NanY8zp+PTCUU1QXLnsBW7ZR4dilcAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pd+immZ2r05GL3blA88aVPp7Kcis8xHv6LHatqxUBiMvcQbgwx9uzhWRw90T58xwiocK+9BzLZA4BVSAX7iesVYNb+/ElJYbYjDQ6LPuX6WuIA7VBfWqtoMKYHpL4RLy3EABT41SOv0KJCtKgaPANH5keeDOwH9MbBtCq/X+lrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVYV0oY5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVYV0oY5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8B01F000C4;
	Fri, 16 Oct 2026 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792179627;
	bh=N843NjftyAf2H4tDNVRM9/GyZ96/ngYIy8102+G+dLI=;
	h=From:To:Cc:Subject:Date;
	b=TVYV0oY5wGhq583AxoHmcW/YZaZ/QLtqSz1QfOyzDUcoIcuk69q8BTVS8P0nsR6Va
	 8cc9OpWmktR51btKv9TMieOjgld3RKP8Hm4ymbIYhVw2j+tj76spSdtgXYPv13qZ1a
	 Z8GfeiRUb7MBIdzrmGI3uXt9D3WbQdEXcYaZwiL/OSKuSBWm99b+azOHY9YDvqktM3
	 3X6gl/RpjlPOfxLVXYqpbGeeRMRNV0JEGBkAbiWa4on8ZTf6gmAMx0QAsd+9I4mLnv
	 NGW18/HiO+2RM5rrdE5FcWMiIgi9U0cYKoPK1ljRg9l6flSMOMwwF4UTZqbxV+UtBF
	 bzAWWPZVds1vA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v3] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
Date: Fri, 16 Oct 2026 14:40:22 -0500
Message-ID: <20261016194023.235703-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
and matched by the Hi6421 SPMI PMIC driver.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Drop erroneous 'Fixes'
v2:
 - Drop "gpios" addition.
---
 .../devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index 6a824351834e..0dd37c40eeff 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -24,7 +24,7 @@ properties:
     pattern: "pmic@[0-9a-f]"
 
   compatible:
-    const: hisilicon,hi6421v600-spmi
+    const: hisilicon,hi6421-spmi
 
   reg:
     maxItems: 1
@@ -66,7 +66,7 @@ examples:
         #size-cells = <0>;
 
         pmic@0 {
-            compatible = "hisilicon,hi6421v600-spmi";
+            compatible = "hisilicon,hi6421-spmi";
             reg = <0 SPMI_USID>;
 
             #interrupt-cells = <2>;
-- 
2.53.0

