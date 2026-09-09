Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE43C276E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983111; cv=none; b=WLsS8TMQY1rnzOIyrqlHLqtOCRul+OG6pQmyIZyp3sTDzFDosj7C4VDjbPc0JIL9NZs6tZaIin2FhfaCkEJC872uRZUxSOP8XAijHOtlYl4bFbCdc8pWMADIH5W4FYBbEbr3fj0Mar3MkVvMhUTMLMgqEV8TTiltXFVQqg6Ghrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983111; c=relaxed/simple;
	bh=0y025r9lJxiRcW/iLpA9OxbVYRTdff8PY3nw4oldHX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyGS92pFgDqghJL5tp1usSeFtD35LAqbtSoraiY5NrQdpoP/kn4eMnAaudLU7cDZOw8a7mdhUR6ZwNWTS4mn8D9dmzKOD3zXk18CRq0Gw0ZtywQti5UOdIdVdhxdCIo0YQ1Es1HoIxxLqbQ/4JN90pJZfS9waFI4SGCponLVKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=aK8pe1JU; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="aK8pe1JU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1788983103; bh=X0mabFltmY8N5fYnc1jDn7dWJ/h3RCMBvbFE61H6sEk=;
 b=aK8pe1JU+EWly38n2l3IIVGMWlz7q57FrHwKegRvi7AKfkOVQCiLhgDUvwplYGcsBtdwCSjS1
 EJ7Sk6hV3SxyGIuoj0l4opceS1LeSSN7GEJ5TSjWZHU7nvIy+Q2prJeXbdkpwU+VrG+JzQrJ5Ks
 2UMbeQNANiguTlWePZlwUMs=
X-Forward-Email-ID: 6aa1b7395382f19eb5d6c7e1
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net
Subject: [PATCH v4 1/2] dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
Date: Wed,  9 Sep 2026 20:44:49 +0100
Message-ID: <20260909194450.183693-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909194450.183693-1-tturner@lineageos.org>
References: <20260909194450.183693-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos850 SoC uses the ARM Mali G52 GPU, document its compatible
string with the appropriate fallback.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
  - no changes

Changes in v3:
  - Add Acked-by tag

Changes in v2:
  - Introduce this patch

 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 9db9f84ad964..ece2b637cd41 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3562-mali
               - rockchip,rk3568-mali
               - rockchip,rk3576-mali
+              - samsung,exynos850-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
       - items:
           - enum:
-- 
2.47.3

