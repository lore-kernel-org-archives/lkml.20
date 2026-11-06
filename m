Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999079;
	b=gmywgc6S0yCoSXqypGaKcUwDsx6AlHMZuuD4Ouuk/yZBec9RnkNy9qxoAS8+dN+4K00m
	 oKA+1pgmM9v7ln4nSTRGjVLeIHz3rFVGYebZH0OEJ/PBbWVSETZ8E8+/ok45eBw8YiEP8
	 RFzVt+4Rg5or/8GroKZkZ9/f4rtiDs8SMOwLy/kDp0RjychzFl7FGUKyDHwzNzR97DK0V
	 KsPw4bW+6/RT9zI+4Du9q36r1p6NW8B6sS4PndfYb58w7WYMY4qg0ZCLqgobc5Hpb4KP1
	 4umG7CXw0lthzKPW/0s+qWY+B/+Flpf+TKENK5AIApk+Yq+Ytb0qfBBgsuZzs9DD0cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999079;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=5triKr4rWQNxHPSUFjuxeCn4xvtnFfYzHmRmVnByAwk=;
	b=ojk4EBdOPkbb0s2zIl6gbs1uzkNR//qmCr3OCEZr2UTlZD365q+O5pbJ43OBmzqt45SS
	 GK9Adsuas0/ujwP4ia203f0P97VMiMne8a/cxo0xjsZ4/1owbgzO/VJaxAaB81G/9V+c6
	 py2aTKSohT8bbAVkCcMnJT6t98u8Op5WhHbYi3HjFvFGnpfEBG9FbCFJhxgowUAPmEwMV
	 6kP7geCXypZhDlclJke881wy3XCTCAxB3i+LmpDZzabQhS9J9sus+3d3mAFEpWVbhPgGy
	 c/Q9pz8eh/WlpRmbLypZ3fB0FHNzdh6/1z9LZEJf70U4YoFpALJ47m+Ou10Ee7nQpgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=vAzfAhT2;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C431606D815;
	Fri,  6 Nov 2026 21:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C431606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=vAzfAhT2
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5triKr4rWQNxHPSUFjuxeCn4xvtnFfYzHmRmVnByAwk=;
	b=vAzfAhT2ifQjmGW+amZ6BcB6Fz40QRShUJXE5+S9b6z+HcRyks+HCN7kZEsxwF57sri++p
	wFm568xmArVEGbbPHZ0MGesOhISUJdqr9deTcTCCXldt4ig/zBQzndDwka73IYS01HlmGf
	miqonh2HztGmhUOeiKdtipCN2Qzg0/8=
Date: Fri, 06 Nov 2026 22:04:20 +0100
Subject: [PATCH 11/15] dt-bindings: iommu: apple,sart: Add t8142
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-11-22f4827b4ece@cyberchaos.dev>
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

The SART IOMMU in the Apple M5 SoC is compatible to "apple,t6000-sart".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/iommu/apple,sart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/apple,sart.yaml b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
index f79242f112df..e6482453d6da 100644
--- a/Documentation/devicetree/bindings/iommu/apple,sart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -39,6 +39,7 @@ properties:
               - apple,t8122-sart
               - apple,t8132-sart
               - apple,t8140-sart
+              - apple,t8142-sart
           - const: apple,t6000-sart
       - enum:
           - apple,t6000-sart

-- 
2.56.0

