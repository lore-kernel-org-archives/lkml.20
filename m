Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F0147F2EA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936055; cv=none; b=JyKT2Y5AeDy+kYJh1D4qqivyYt8k2YbDTQhYWI1xvETFC9IOlIt5l8PP/ptEhvlXcyRP6UF6NRXkCrUEXFdrUAw5feE9ONsFGRNKfb1ETJnPuWFGk+OBIxL49gDoRuDMVs6oEK8PvnfYI28QFxn67zcAbYoRnp03iM1e+Ycirt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936055; c=relaxed/simple;
	bh=rQqysgQUa94z06q8n+8z2d8GjipPWKuwxBorVa89r6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgrPboE/2ryq8HfDghzMITMBS1qKpg91qx/qk+jf4dkdlpW0hzzxPnGwV+jxcOF1eJJ79oKJSgPrpheN6uXExHMlAZL/BRxp+p2wivEF9K3MV2P/Q2WKb96IjdNb6C0Rwq6y+65BYNWMf2FxBGUJSPEteVYXkZD2++Q1FtLz4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyOH/Xhn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyOH/Xhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C134F1F000FF;
	Fri,  2 Oct 2026 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936054;
	bh=lhjdl37GDUBMRb47JZV9OhuPI3ojzCjErOq/RuEXr6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lyOH/XhnQ74bbRDWFIwtXdAj5WyhZ1LLDRUegzUypRDe2f5VbLZLDL3HWqfDbsKC1
	 XOEVaSI+LrXYLUCk7dDVKC3cC6K7y0SQwyaIkwc+b/T8b5i6Vk/8XLephVLzMbWACc
	 ++8mL5tPtH7Jpny+w21kDO6BVpXeZmEPhyt7ztYLGolZKUJmh6KbwZflQB7WynDLWg
	 Q9ivmD+tVOGqmNgx471iUv20MWoRxciGDpv+x5RI7AR4X3Yu6bY5MeG3+g+/jIBOfw
	 I+D288HWymRsC0e1vex1H/gS85F+9aaHPj0Jjq9g9jxDTTaa7+ZzK7389NcuZkc/bj
	 Q042ZtAjPeH/w==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Judith Mendez <jm@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 2/9] dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
Date: Fri,  2 Oct 2026 11:13:45 +0100
Message-ID: <20261002101352.1084447-3-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101352.1084447-1-srini@kernel.org>
References: <20261002101352.1084447-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Judith Mendez <jm@ti.com>

Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
The uniphier-efuse driver can be used to read AM62P efuse registers as
well for GP_SW silicon revision detection.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
index e27cbae2d63a..d26b3d2a3eba 100644
--- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
@@ -16,7 +16,11 @@ allOf:
 
 properties:
   compatible:
-    const: socionext,uniphier-efuse
+    oneOf:
+      - const: socionext,uniphier-efuse
+      - items:
+          - const: ti,am62p-efuse
+          - const: socionext,uniphier-efuse
 
   reg:
     maxItems: 1
-- 
2.53.0

