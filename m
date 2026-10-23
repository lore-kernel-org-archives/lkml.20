Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792720617;
	b=LMz/dfBeKvtYWKe4rMAQjqAspmh+TtqLs7MV2KfJMghOdIs6T7E6M7G8UruzRbrL617T
	 TR7riupmrUcP9iXgpXdG37Z5c55vqgOla1Y8MPFci/3fHFWK0K/LH2UMfwZrBGCFz3Meq
	 tmgtK7BUe8efDrVMtnXHecN93lZWBccAcggpGuMUAfIhobdOOz5ksmvS4KsTtfHCuQsUl
	 St69s2XUCrX8xtYlgtK7SkdX9sduYa4eZJQqg2kS2SBPf2rXvJeSrri9Xy/idmH95+AwR
	 8oeENCc2caktY4yb8r0PrCvVR63XnAchKK/sAUTTt6g9pSJL6CAZlI3MB/cSo9czd+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720617;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	b=xlyqHrDCxTlie+NahKDKxpnXShJrnljUx+gRSICJUF0jvieYutzIv9yCEQ7WHDcx5699
	 ew5JkPQu/5CNTWu7VZoPLFlj0d+QOSWdwVUapiah+IQYHrThDvfsa/uferHc1um2pfQHE
	 H8ciKy95Q6BDQcj+A0PEn4uyBQaynIKRYByQQLLhcCu6Ev6z681AauQfCbzfs6+7D6fV0
	 YUMrVU5J2koStypcTTfQvLf+8XMkCTlnVX9Ld7ugTiRF9sX53cO7dRbAB9l+0+jTMAH8Z
	 IHvCBX8z9Lwu8XSwy/0735VKZ0eNHC8k6Y5cRNHjdGZIzq+ngstrlvaHQWwjtHYnAgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7mIabHd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39DD606A31D;
	Fri, 23 Oct 2026 01:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7mIabHd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792720616;
	b=qZebYwdNEKwhm7OI+uB15yb/T0SCpzLSz10iFX6UK10tiwvk+Vsv2hTMWkqyOswbhHFy
	 Gr45/adKyf+vi9yE3Ru0rX97umNdj4ZShQ4JEjtKdK30NyCzfOGmhYtGh7W6EweUuh5ub
	 TT72qKCTLqw31sD/xXRIU0akQRRP/kEA77apKhLx2NRWzZC+P5GpJpXrQ3l8z79hCPTQ1
	 SvwgB14a6ux5x8jaYrLR1xqy8sPVBj9rSK18qsVDGSCuzyUURtaXQnhnUCq6HH8QuuJhg
	 mfuJgqV+onegVLYb0OJLp85CqtL7gYeirHY878bWvlFOUryv1gpGn5owaSC5IKAzqzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792720616;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	b=Y8U8luhV/GKxHlAcJmFaim2tIJ8L8Ns0luaHN/fXOTyp5nUbKrxZCLjPfDsBR267smEQ
	 0OuA1LbyPt/xxvFBW+Xq3O8z0EWZZTdpJk8eixw/SB9VYx4TqF5RHzWrnmTcwiIAjX66P
	 5OP1eAuNMjdfeLlP157aV9p391hwldpFF0461yQdn81tRrZAFYt+nIuv4X/clWdyjeaoG
	 LoM3LAQCp+VKl2wH4sYwJDJ6ddXUp+hR+plsOy4k5liiUisaBauMheNWwXlqexIxBk0Rl
	 wTQWcyYHnbPTIj3FEdVhfmPvCiBC2zXRx42noEXxk14jkb9CCljAKMSgBHQZ7ZHBmNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C47C1F031E0;
	Fri, 23 Oct 2026 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792720616;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y7mIabHdzV6z2KGIPnxp705MHHUnxmT0GP2Jfovbdcy7qTAQ40N4miwU1KHgbWo2C
	 G4YB9IvzJo1IafNpAlQ3HkaRoAIvfJsUKTmPUzC5/4/3rCvsps8mI6Ke/x5hA+1WKo
	 Tm4+m8YLOMPVRN7zciWg43sl2GT6/UE69VR+Wnq4mZIGWK9kJQ9OjTBJpMzHbIMeT5
	 09wR25kFxJtqLMPzhJ/LGmlo7kTqHRsupIRNBK33hJU/7VmuvUuy+gQwUUpsgSxsRx
	 4GNiNlQBZT19vhjSX5GbsCl8YetmjCZO772R4AhxcIT4EyUYbh9r7mmJeZTbPhrIPM
	 7U1JAoYse1rzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E96D94217E;
	Fri, 23 Oct 2026 01:56:54 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Fri, 23 Oct 2026 09:56:44 +0800
Subject: [PATCH v5 4/7] dt-bindings: timer: Add UltraRISC DP1000 CLINT
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
Message-Id: <20261023-ultrarisc-dts-v5-4-af79dbd6ccec@ultrarisc.com>
References: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
In-Reply-To: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792720613; l=964;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=H5nCeqGhgsZIHGD5OQKUEdhmWR2MLVPLwQY1q4JBFrk=;
 b=n5uhlSypA4p4aXoYVjzvbz9AEnBnRmoj57GAOM21f/j4kSd+WxfYzE5Ju0OXSKYsrAwq4MxGo
 zxGIJLN1aEtBgDI++i/Vika4R3P2eVluElpoXF8iE+neIcBXS9vdPI1
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add compatible string for UltraRISC DP1000 CLINT.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..878f267d089b 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -40,6 +40,7 @@ properties:
               - starfive,jh8100-clint   # StarFive JH8100
               - starfive,jhb100-clint   # StarFive JHB100
               - tenstorrent,blackhole-clint # Tenstorrent Blackhole
+              - ultrarisc,dp1000-clint  # UltraRISC DP1000
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - {}

-- 
2.34.1


