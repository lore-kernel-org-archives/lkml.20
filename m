Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F5C4973A8;
	Sat,  3 Oct 2026 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057702; cv=none; b=b66nAF7NrhHC1O1gtzkeDKvL7BkIJUiBxZLKVMvaojOtvIVPflG/ItcRlfBlylKompr/uPQaw3cnklpv1kJc/VUYvJ/1M7PaDWHMqcwKjN+mo3LTPkDCol1f4gyHTkuiThCXe3NQUu0BQGguxu3BG3eEV2SFry0Ojkc40Fh8hiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057702; c=relaxed/simple;
	bh=atpECOG+sM9hDZ2fjFr7LCR6ql8ndRwWg1AtG9+9U34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hGEPJXfG1hUuA+MTC0K2JgQKYx+kRJQbFb/7pLHay0umu3oBJwOC71d8P/urRvtG5Kaax8gMdK8rgiZ3k+ab99Iu1C0gzsO0QH9YftrVXk+jGOUDt5dsz3OYfEb8EHY2hdlDZp3KquOi0K+pBG1WiVM4Pe2wCGfC+4FWJVXdFEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=s3y7zaA/; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="s3y7zaA/"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791057695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ujjA/EfqFrllDMkLjfG6+3nwCZQypQgUzS75H0VKhkU=;
	b=s3y7zaA/vOa/6nJn9RV1/S648MlfyLxv6NYSbtwk56kRlvGiddXt6T4G8FGyk/cDSkwh3r
	3w70x96Kjew76d2ZtIsu6Zr6+zQdiASBIgvvRG5/F8EvxvhK1wzVHx0A4FQ90cPAms3P2h
	KZJCA0SFLK5aozVZ+TwtuDNKCBtrP3w2aNMLr9iWJjy3dL4v+Mh6qRocsMQLTqYnwFqxZi
	vxo/xeTgHZjOaBPPNaEFCI/9UeNBevdDVKBXe94vDT604KmuyR1V/jIsLH/1VLT44toa7c
	7xOEzQjFm1Tf6HR99gmDrS6izV+UxHRdTgYsZzuLZ3InJgD40n7BWHuf0i9QpQ==
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add the MT8188 MFGCFG phandle
Date: Sat,  3 Oct 2026 22:01:30 +0200
Message-ID: <20261003200132.866240-2-michal@nozomi.space>
In-Reply-To: <20261003200132.866240-1-michal@nozomi.space>
References: <20261003200132.866240-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On MT8188 the GPU timestamp counter only counts once a register in the
MFG configuration block routes the SoC system timer to it, and the
setting is lost whenever the GPU power domain is turned off. The GPU
driver has to restore it on every power-up, so it needs a reference to
that block.

Add an optional mediatek,mfgcfg phandle. Allow it on MT8370 as well,
which shares the GPU and the MFG block with MT8188 and its GPU node in
mt8188.dtsi. It is optional so that existing devicetrees stay valid;
without it the timestamp counter reads zero, as before.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../bindings/gpu/arm,mali-bifrost.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 9db9f84ad964b..08c1c22a270cb 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -122,6 +122,12 @@ properties:
   nvmem-cells:
     maxItems: 1
 
+  mediatek,mfgcfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the MFG configuration block, which routes the SoC system
+      timer to the GPU timestamp counter.
+
 required:
   - compatible
   - reg
@@ -226,6 +232,17 @@ allOf:
       required:
         - power-domains
         - power-domain-names
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - mediatek,mt8188-mali
+                - mediatek,mt8370-mali
+    then:
+      properties:
+        mediatek,mfgcfg: false
   - if:
       properties:
         compatible:
-- 
2.55.0

