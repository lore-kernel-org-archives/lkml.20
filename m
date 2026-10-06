Received: from mta1.migadu.com (out-214.mta1.migadu.com [95.215.58.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89032175A79
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258384; cv=none; b=mXOrnbyTfDGOtBaN3P98QNWKXhSwuIHjXBKMKUDjJq6JfHOLsbN+rLJ+QNVFLkmM1Gd9VTGuVPVCizeTedVijdhvlav8prfwcpn/mkFWmZliGJ9tsy+2ltvgIhDv3UrXSmG1Efar8bzdQnzw6MfDO5RtKeMi7nKt4GFotush/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258384; c=relaxed/simple;
	bh=nFjlgxhY7Rvo0zb1h70e/XjB4qPNBScv6CZ8wfjVAX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjWXGM0jWci5NCBX1hSwg3zHXzGpMtJDSOeqRLMh16fcA8teFLu3ZmpTFSPD3gTeUIwoRIu0CgnfSvzztRhXrIaZNFAPH/ybo698WWIZV9mWZDR0mqCfKgdqnfz2A+5J1hvjyGFOfppzU5T9TIt7+rl6AXAPDpAUD41YldwlcBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=mGPJy7r5; arc=none smtp.client-ip=95.215.58.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="mGPJy7r5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nFjlgxhY7Rvo0zb1h70e/XjB4qPNBScv6CZ8wfjVAX8=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791258379; v=1; x=1791863179;
 b=mGPJy7r5d5xF36MXGGNeXwsQho+SlzGO9LBYq2IY3RQ+qvSyGeN+q31CNuydChLFKvmXHO63
 9D1pumjA9aLCooJB8TAoEFZNd4poGaFYO9oIQzb27gPuPifoRx7FFx9F1A8YxJaUYIz44D7Mpy0
 fzVO5S69lFewjC5NG4smfY7TqEbuJjUVFQeyqkOuR/AhOnkw1aXMKVqMH9c3ywEsRTSTpPym870
 Ri0ryKSoQ0odF6JsH5sWISpPONTESUQLkgOZ4eqVTQXOCCHHz3RQii5iDS0rQ8kfVhCjGmI2/JO
 K6AhVxvtIlUvCwPUbpapa5MtE96Q4TKvCdyFKJWQhj2Mg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cfb5e18994b067c1;
	Tue, 06 Oct 2026 03:46:19 +0000
X-Mizu-Trace-ID: cfb5e18994b067c1
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 05 Oct 2026 20:46:02 -0700
Subject: [PATCH v2 1/7] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-aw2013-aw20xx-rename-v2-1-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791258374; l=1024;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=nFjlgxhY7Rvo0zb1h70e/XjB4qPNBScv6CZ8wfjVAX8=;
 b=zSmSxXI6VLX/nrQtyy4Dc75QeVIWHvRm0cbHnYNM1GDirjBvaC11sFrkd433zQRNhEa4glphh
 JnadzL5xwECDxTgmxf5dWcz4JOuAzKXAifMvOShtVV2lKwP0/9r5b4m
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Very similar chip from the same family to be added

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index 26238446f2bd..1ad165cfe34a 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW2013/AW2027 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.55.0

