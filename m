Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999069;
	b=0GYToAbLXxvKZuUsktZz8cyEYijBD+Cfmx7NGzGD5TlriZulrA5R885RURdarLaP4ktp
	 OH1Ex8IXZZpLY5ISn+i7gdDW33RUDiw9j1q5rg1YksToJKBVTB/HFHTeyPiqaWeXRZnQJ
	 PYgHPTtuR297Y6fDOz8IGHqZAgHVdKLaLjJ6OB/S+9t3bZ73d78pciWmwCimnoJL2P1a1
	 iWUuLtaAqmMJ8BjFnspjnLj8OUC9XUEJCvPfYXHplGtucl1p1GVzimphuewdKg1Z7+yYe
	 g5s9XWM9BAxkkTaUt4yqNeoyseKyDiJ3iUAmbZtokgZTGUOWFiivQCS1248tiy/NaEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999069;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=ddnr5qvPPl/HxlXZ9HHFc5uA4X90jisR8w6d6yMoDBg=;
	b=NIIO5Id9Pgr9x42o/mALDMOdT2ztHFMAy4NeGSbiNrgeY407xylJk6AVLzv11WdnnIcZ
	 SX9o3puadjAN5f2fdf81DZoCFaMARpiO3KZ4n9jCfUwCPGOoNPQecGtSma5K1XJAZqt+G
	 dJQcgJUWMNA5yheJcqPpWdHW0PLRxARL42PYaSIi3bipAjRcHXgAOFoEfezOsc4joy+M6
	 y0lzxYvRQZJJX5BIUs97QIab6dlUms/lo2K5iT3N8TRkFrE9TKf0N2B6/Ur+BGMyn1bNz
	 CvX6wrwz/KMiyX+RAjtrqmUBMndFOuBb09quSBvMdyBNf4eA5/5Q4VsNfYp3f68/e3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=CLUWhORe;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE53A606D80D;
	Fri,  6 Nov 2026 21:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE53A606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=CLUWhORe
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddnr5qvPPl/HxlXZ9HHFc5uA4X90jisR8w6d6yMoDBg=;
	b=CLUWhOReOZ75tCdwICAwTletu4lCk7Crxsie6V8PjDp5e7QJXk3IhmmuktwkYyO0p1rEs2
	VLqNrWphbnill2k7zVdhdxTdrL0zTQVlu89YwnTzvLh07lKrQOB1fe0NfUx7OrojIpXl6p
	hTiTGNM3Xn87MUyg5CJamXvfXCXhEKo=
Date: Fri, 06 Nov 2026 22:04:15 +0100
Subject: [PATCH 06/15] dt-bindings: mailbox: apple,mailbox: Add t6041
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-6-22f4827b4ece@cyberchaos.dev>
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

The mailbox hardware remains unchanged on M4 Pro/Max SoCs so just add
the per-SoC compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 774f63f0839e..1fb943e0b587 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -37,6 +37,7 @@ properties:
               - apple,t6020-asc-mailbox
               - apple,t6030-asc-mailbox
               - apple,t6031-asc-mailbox
+              - apple,t6041-asc-mailbox
           - const: apple,asc-mailbox-v4
 
       - description:

-- 
2.56.0

