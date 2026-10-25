Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792931049;
	b=vb1FcpLAi7jwDJz0+uPw8ZUwC998NpghU5LxyaeFziQWT26rF5qY2SqfoRa+raZ8o0Nk
	 eKaXV77Pfe+6lv2D+XwZbJn/xq9lVa/X1liA3y+RLU55LZkEyGoB+uMs88/fUGgsDIlhf
	 SFDUV5gfvum2WPpKd7OJsuDPzWnh579ebpA1uH1oFkXj4jd5QCxWmbn6NhLAXzQovCfrj
	 mpyBiwEGOwWvpRK37mi8OfMT9aKtpveYv0H9pDx8A90mfQ/E/Ii4gJ3xohSM4ZgawT90B
	 fBwccwwecIXW9H/39TnK3KDY7DPOW8ca34TvY06f/VaSvOmu4uskBYwEYiB90w7rwYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931049;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	b=QWwjhZJVOuQsknoBYdsGkV66LM4wbuBq8C0gaGxv7flEE2O9XGD+whIkMXxWJEw55Vii
	 Mz/RenzQYEvrJ9O1+WtxMqGhkmA7ILti4QQ9MQPEoGQUw2PUexx+ebfnV6auB6ykL1Tgk
	 uk2zHNraycJxnH+VgXHF6ke3XTen8iCglBXIwjJ+8/R7+OrjxdhbYzo5Ac/ilT64ETppG
	 gLoAIJjfToq7G/XoGupAmxOPMitEgGEkZRNnlM7B8i5unCiMZBtsUtkoe2mIDYhpmf6Em
	 of5Njp7JAxW1C49/BWl9+3JGm03/EsT4gRklUi692qEg0eooXJp3IOmSSOCkiw2v1lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMn0UGWY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CA9606A31B;
	Sun, 25 Oct 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMn0UGWY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792931049;
	b=3BorcKOHxwYE7Rfq0dooSNWwCO3ZNfdn/bnMrzf4Hi3277dNaN+xAtdkclj1m9YUP7ja
	 BD3/kJkodVfuWoPtiWAzxGv+vJ8AahoyByTCMFLZvbEsUHFprSP6xi3Ruvs94snYMCF4d
	 c6Im6fpl2eHsuxUaSz/i70NIGuOW92l+3HYvLSL/dmKfk4Xp4laTi0qzwx1FY67lgK1bx
	 j2MUvO1y4cxtIAdh3VnnYzu5ECHvqhQgGcKX61VF14x12Y6xCn5r408hLSmQNekiheyPL
	 Fnj7/ZhlrxHr5Ez4K+Jgj9gOlW0cOqEfh8EworGplRlABZ9DQXUk7OnCS+qiyEQzdOA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792931049;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	b=XYm0N+q3IzOtFcD/x5EgY2TBNpz4lFlqJ8JFWrzxZWp9leOzMt+N98w+NL19aQo9T7YC
	 uXnYuRJgwQi8M9ANSXtjlI/4sN/pXD2DSKRth1SI9oW9EUtXvyWWUuV2CQsEmMtML6hX5
	 M2/pLeS88EPaXB3UOdrvSL6amvj+FAPHWeL8yhD20T6NkpwwExvloFGtogq2jNOJknBUG
	 Z7x1ppPVEN1n8RIbWgldGXSKP1MJmiGxGh6dml9LcYltYjCvlL4Lp+6dzJJViUBazAgED
	 hj7hsCZjczTieQHx2W0W6uB+6GU/KufQKesjzwPM+EEEM1cPQPz6g2twOhLpvMn27KA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B22271F01828;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792931048;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fMn0UGWY51qv1l9R5FFAp242yE4F4bY8OizPG4LWbcSvLCQllX/uu+O32mp7l2Exj
	 eA2YRU8zaLhnAV6/OnkGWthts+LLxH1JmhHQscFMqgml2SEtOzA2rGXTVMQz4VAv5e
	 GtzAGZOZDg0sw/xF3RiRzZLJZPcuY2RidgwYpOfdZ+O5YbayRPSKaXyXy74d+IJdit
	 8helhElBVSAHxK+s4jFFibgSfqBCSqUCVSG1P/WVfY+whh15wPXXOqhErVvTid3GmU
	 LwofHhxKfCk3BK5tyzqj+zegSiwZJdsFK0w48VIZaBKaXNhYnH7HeUqf0Mr8fS2Yl5
	 Z1uOn7INhSOHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3664C44A10;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sun, 25 Oct 2026 20:24:04 +0800
Subject: [PATCH v7 4/7] dt-bindings: timer: Add UltraRISC DP1000 CLINT
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
Message-Id: <20261025-ultrarisc-dts-v7-4-621eca2b8790@ultrarisc.com>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
In-Reply-To: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792931045; l=964;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=H5nCeqGhgsZIHGD5OQKUEdhmWR2MLVPLwQY1q4JBFrk=;
 b=KpjRiQn0LwxFjhg+GYHft2ko28fks36EjIOjjWGtF7aQUa7mQo1Z1ZJPXLdrLtDMJHVpgk7v4
 //neWzmTGdnD4nZ/rhT/VMRAGG2YHzJTyEre4WtRVsv6t48iPDPr4XP
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


