Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999066;
	b=M1pmbUleBoAsP9+uQtQiPHUrH+6jQCba6hYGlN0oZPzuNMJmAgfefuWSEhzK3oe8VwYr
	 CVqAZE/f9x3znUjwSbKBtHp3te+yllqcpvw8oNO4QATy5ciuRuJziSpQJAHhKblkwJsKp
	 bhUHpy3qE/3wtWxl5OuMHbmJ/KcX5bBLrCmFNe7iRFM6aTWW/zGROP434TCUaMHV54aex
	 i0LnHjrX3K1bGQZRAf7eLvHhuVlTnKwl7leuEqMQlCBklcITJplPGiOPOFVjIeneqCXwo
	 iHlpH0AcaEey6nRo5YWQrQy5dcw8FAnrwyEkWB8UxZ+OCYa49F0rxdCSYYd0Zb/Qveg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999066;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=LdUco0IIu2WNvQ3HelRhrLk7d+A8em9tLh77azy1Ojs=;
	b=HiEW3ghe+5V9BXHIWkCdUy4UcBEu0CuEnG/nRdqkz3lTOzeayKv//ys2IS/daDotVNwK
	 GLI8HVluB/pN/1A4XEaT8VlJbk+yTzNs+YCvZH+jR7LB0VPsCWp1jNeUHHFmFfOe5pIJK
	 52X1dtP2SNz2SaIUk2cYnJoL3elNII8fo0+8YS2V5QHrv9lIGPLaQzhaUIzrkM5FWdA6R
	 eBbBHfkDzCyu+ozKPxa7jf285Z35xAzgZdHa9VvfG4TIdTrQyxUmBWcmGf3dZOdYx4lOr
	 lQS+5/cDvp+b/dLnbRtUkqCner/cB+JXykadkHr9g3O/7MAm34fFsczDLSW3/aJvZsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=p+fE5CBk;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E15606D802;
	Fri,  6 Nov 2026 21:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E15606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=p+fE5CBk
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LdUco0IIu2WNvQ3HelRhrLk7d+A8em9tLh77azy1Ojs=;
	b=p+fE5CBkiybwX3xjTAfsxh2AJzYlxQQ+I0ripjHdQey8ogzQCsJG+9MRMoAA0H4Pm0LXxD
	YLEsBX6tCJZeS3ggeMWF1xagFdu+ncq1PyB2ZQ10VjITwhZCW3NjQ2M2nErQMBq3V+cqAZ
	2dcjQSrRQ5BPFQDkRS5yMtXpSUmExeQ=
Date: Fri, 06 Nov 2026 22:04:12 +0100
Subject: [PATCH 03/15] dt-bindings: nvme: apple: Add apple,t8142-nvme-ans2
 compatible
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-3-22f4827b4ece@cyberchaos.dev>
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, Yureka Lilian <yureka@cyberchaos.dev>

"apple,t8142-nvme-ans2" on the Apple M5 SoC is compatible with
"apple,t8132-nvme-ans2" so add its per-SoC compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index 24c2be3b9544..b8b779f050bc 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - enum:
               - apple,t8140-nvme-ans2
+              - apple,t8142-nvme-ans2
               - apple,t6041-nvme-ans2
           - const: apple,t8132-nvme-ans2
       - items:

-- 
2.56.0

