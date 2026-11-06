Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999074;
	b=1sWauYKSRRjd7P09LgebMuN/6Ifo2waZL9PZj22D0QmdgAG6aTs9sCL3CQX86cC/QoFX
	 811avTds2lGYQu8iqap4GM82HrHOlS9sKnC8Wttjac5vcqi0vPyzsyA9pvtKZTOAhzmYt
	 HsfgKZ4nXHbMtZNkcq1liSkKq5YfyJndOz8L0/eNUj1tcz8r25Y3lvZ87DjtrssjN5iDn
	 qn2UvkD5tNxClDCdanMYClyogvd9b5hgdHs0R8w5I5SLDHmJ41ERGLr641dU7SM3/xBy2
	 XBozKuc616SYpp8r1zSzPu24gLzZhS3XcIuPQcsJP/LQInoEbzRwP1AO4sjf9Y5y/lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999074;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=C8Bj/vOdToLYdeQCtg2KHzCECUKrUX5sFTGEc1W0N6U=;
	b=ctkI4Qkg1O/qbH68bIP5VA93JNU7md/cfzKxj6cUpoWh59OLwqcD9/sFOvnfv4cJk+Xh
	 uJotT8+KwbsV/ZeaH4MKpLyl4ciMCd2qeWgLOOuB0Ix6pAxMyb4vVh1dvZB1+tqhzpmo/
	 mZOmRrMk/JVdeNeiFLCS2KMYLTm9YU6q5AMGhlPb3r0YLS8TCQU40mdSkq6FFB8q0fbfP
	 knwuCJd8ZviAsZIae6SR3ZLyi7smw0yJZZGffXbwoWRcYfmEfKueVcdW7M3H2sV4xKZSe
	 Rybi6smoFubHKajbcm3mhdfun3ztm86qk7ewIiiw2EA4OYfBHD97HJND0STpCL9GfOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=N6DNO3Th;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC4A606D828;
	Fri,  6 Nov 2026 21:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC4A606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=N6DNO3Th
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8Bj/vOdToLYdeQCtg2KHzCECUKrUX5sFTGEc1W0N6U=;
	b=N6DNO3Thk32qunzHrJSzmMm3+w6N5TvAAgOQYyfslw2Zxpnd0TCGg4SSQXg0mvwA+qnk5N
	ZblXCBOHrhjnXFnJytS8BfSvCp9xgshhlQmwPlwUCORVqwP0cit7X0iafRIe4y2cY/FPv2
	LHyhUMNyH+V4AWH6YV31xH99wYJM7bI=
Date: Fri, 06 Nov 2026 22:04:19 +0100
Subject: [PATCH 10/15] dt-bindings: iommu: apple,sart: Add t6041
 compatibles
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-10-22f4827b4ece@cyberchaos.dev>
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

The SART IOMMU in the Apple M4 Pro/Max SoCs is compatible to
"apple,t6000-sart".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/iommu/apple,sart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/apple,sart.yaml b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
index bf35ead191ec..f79242f112df 100644
--- a/Documentation/devicetree/bindings/iommu/apple,sart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -34,6 +34,7 @@ properties:
               - apple,t6020-sart
               - apple,t6030-sart
               - apple,t6031-sart
+              - apple,t6041-sart
               - apple,t8112-sart
               - apple,t8122-sart
               - apple,t8132-sart

-- 
2.56.0

