Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999070;
	b=ilEOnB6EUEOLn0O2noR4eYM65lubzNeAuoMjDQ0RyqzpZbE/tlVRIo7cBxTk+7+ZEi/T
	 gBDYwmpSoSyzX8d4JaFupU2LS+35q7nmGSry1jVDg18tdUVJhTKGGW7J6Zv6Av+JkajY2
	 gdTKm4h2iONFB+E5ZkOhGFtArP3DbxBaL4viVZIOlExQgdw3RzlogetYkOVu+vhPOk8E9
	 6bJMUlySjnd8t9lpjGabS3UpeF9KlGM7P1zQrdVJoBnOQuHBAoH6FLzIQKnPQjzTTSoiL
	 t44pWXUxQJECryf1rklaHXc+j3x539G9aYFwU+qxGfAd1QxcFXWmBGHEALoOqtt3OqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999070;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=xvD/KLvtYEzoiFwqKbyo0GkTrcq4CLL7Gr2fpgfmDIY=;
	b=eTouTglqHJVkAQ/WOFIkDkpiNe2gTwV+8rD5f5zjNXJAwFFA3cn8ljEzfoldLHs6oZUc
	 nsrOllmUoz5ks5USiZbZyZ3x6P9UdBUp8lQ/sgJ0z58xhC/p0huPxdh1ze2k9n+OE0IYa
	 yALgtDjri6IexS1SX0t64n7Q0E8C037c5CVRkrFkv/8BOeZ32FoxU5OZhylmkBidg3Zez
	 F32FiCSDDbYDw8Di4Ct4e/5iIVHp9gSUmb0h5culpgcHiLLcvZs6xHMAYYoRY+0iXOGDg
	 jFoOKfV30j/jJAVabBFhkGEV+J6Dna/SFGzJdCkgG4w8gpfnmmgx++xQj0nN/xo0eLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=fXlXlhX5;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD575606D827;
	Fri,  6 Nov 2026 21:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD575606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=fXlXlhX5
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvD/KLvtYEzoiFwqKbyo0GkTrcq4CLL7Gr2fpgfmDIY=;
	b=fXlXlhX5bD5LtjHsCI5pubLHLhPoYX3jc50h1blHQ4cGmSsmQteeJgBptsLQYrJlmcVvUk
	sJkHbvyDEV1wdgwvlfZnPS6HeikihFK48KbsXWi83DndvJfK41ufwSl28Ls/hylrZGD4AW
	8ZwSDknTuitCE2rRVagcYVRaxEDTxOo=
Date: Fri, 06 Nov 2026 22:04:16 +0100
Subject: [PATCH 07/15] dt-bindings: mailbox: apple,mailbox: Add t8142
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-7-22f4827b4ece@cyberchaos.dev>
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

The mailbox hardware remains unchanged on M5 SoC so just add its per-SoC
compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 1fb943e0b587..dd1f0bc1830a 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -33,6 +33,7 @@ properties:
               - apple,t8122-asc-mailbox
               - apple,t8132-asc-mailbox
               - apple,t8140-asc-mailbox
+              - apple,t8142-asc-mailbox
               - apple,t6000-asc-mailbox
               - apple,t6020-asc-mailbox
               - apple,t6030-asc-mailbox

-- 
2.56.0

