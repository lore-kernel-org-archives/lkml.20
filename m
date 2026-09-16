Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920BC4E1C71
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592149; cv=none; b=RyPq7+iOxd+k6Hv2CYx6n9NxN3aJXcWLBYJ3JUhMlOHvnFMfy2nl51aXTMxqSbW3rUmzlymPEezp8MUnN4Pqz3MbASbl2QtaUmCzLNY2Tyxsr0o6tJZDWCfuhyh2LSkfDqU63uLhLaBjEYJx93f/RLCqlJiSSeKRf0ASL478iOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592149; c=relaxed/simple;
	bh=PBPiQIo8DVA9GfJbDJP8O+uKszi1R7VtU/d/vA7zh/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=laceBICLxAQQGzpL3Amq37Z2cCNg/HNHE7pQbCg+mGELTbrwhtOX/jNPc1Vm580JZ8E4ToudCj/XSY5v3bAupqSCvm9mwh8097F+F5eViOK6Oh6Q4GbNMOQigd/SbYMr9fqqDIsyfbGZ94OZ9Ruoq/lax6EPPwlNCtLgkqYZlbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=fNEYRTjn; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="fNEYRTjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789592139; bh=mhzeGGOWspxEKNtt/Z47b/hluKWdnAB0PnukFa3hiCc=;
 b=fNEYRTjnPwC5117rrLCWzrm5rg/KzkVhMfyMV/JflmjjXA7OFXMLmsWTjyTBCHwdNbk+fa4SQ
 ly/XLw2CEvPgMrjevlWm2cHU6qOikXUZvHxb+jh+b0aReEPNBTgCEapmKa1SCFHHnXYQEReZdMd
 noRSjSXKDQTOqUtnxMrypTU=
X-Forward-Email-ID: 6aab024407c281602cddbf31
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzk@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	semen.protsenko@linaro.org,
	alexey.klimov@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
Date: Wed, 16 Sep 2026 21:55:21 +0100
Message-ID: <20260916205522.159393-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916205522.159393-1-tturner@lineageos.org>
References: <20260916205522.159393-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
based on the Samsung Exynos850 SoC.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
 - Add Reviewed-by tag

Changes in v2:
 - Sort via alphabetical order

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..db19a686f490 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -232,6 +232,7 @@ properties:
       - description: Exynos850 based boards
         items:
           - enum:
+              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
-- 
2.47.3

