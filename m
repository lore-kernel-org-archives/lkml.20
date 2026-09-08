Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B157ED8C;
	Tue,  8 Sep 2026 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885006; cv=pass; b=WvIbQ7JznWHWkCoAVnww78BOIMx1WkmLneWc/DughiytXxK2jXZWUN1a4XxY4ayg99woIxm+DsdCi7OTZF/CAfkXAHF8tTY6mY0OpNHe8CBSvJIhe8Bvzyi4Ri12U+sKdeivJh8fXepcsuFXxhF9L/ZWGXCzYsAGtNUJqdXQVkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885006; c=relaxed/simple;
	bh=guQvgJL+i2yMWqW+sqtT+I2+RFzEn3+LbYcQKlU5LLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vig/D3UOMMuefmsL0QF/3OYrkHrxFCTq2R3+hY8YlkEoekSX3xjLedJlHVoMnv5oIRYNvGVN1nSGQUMMXXollNJwUjrToDm+AHrRHVXdV9GwSDYz7HecEismnjwNfrAQWZSF/4/mVtcHD++77LSHjOLEq1dBK7tJQNEWSYhNPOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=PG6ZZqKC; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="PG6ZZqKC"
ARC-Seal: i=1; a=rsa-sha256; t=1788884975; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GvH11no9PiDQpCG3zF56uF8hvrr+hJBX6nG93Afn4/llRvrzbUGkCrcIwUgCPpq23vtXyg7OTpL0NhPs15l8CRvTMPlt5ROy2vHA3K4DanXu5viu8I3r36w9fwJWM8mu9SaX3K2MmBr0Ca167zynJWk8ULTQpIi0Px98LPrLjPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884975; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Ivy2h4Be2PMjQHoNZULax8EWFCNj6CIwvlu8TFP1mY=; 
	b=IMbYAHn+i5CP3kKxDAw9yPdR1yrPhkC6cZC6SJkjh2CWgdYDTK1Gj7k3b4kar2LhvUf7R2VjBAFGi1O+OKwaZBXzjYdgPAx/5BAAxhiLQhgNprLVlsVi2LiwutZgAHUAPPUir1MrAiVpm8OHFN+zO0/E6+QYYYZ0AjLxpv/HVbM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884975;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=7Ivy2h4Be2PMjQHoNZULax8EWFCNj6CIwvlu8TFP1mY=;
	b=PG6ZZqKCJNkkWBrRHLvYmwfzvP0PF6nXoHmCQ3C8R7FnB9EQofKJhTiUOLwIuWlc
	F2WKj74UPyoFI24+oYHoWPfW05iJmG0EXwEnkSMGPKuT671D7NVDUUdvCFOkNO4mppd
	faKUczY+swl7N1SHOcIvoL9TkePnUT5qUikwj/1k=
Received: by mx.zohomail.com with SMTPS id 1788884973229662.9652143897716;
	Tue, 8 Sep 2026 09:29:33 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:45 +0800
Subject: [PATCH v2 2/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-mswi: Add SpacemiT K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-k3-aclint-v2-2-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=guQvgJL+i2yMWqW+sqtT+I2+RFzEn3+LbYcQKlU5LLU=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmB9716fVqsxdH5a5fnFGge6TGWu+9CRkTqhYsVqVx
 SZvzcSIjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACayYCUjwyyxw086vXtq9vEK
 B6U+2D417lnusYueK45LGn8T2eTnvYfhvyvjFY5pkjmmWSWycVbBqhyPIyUWPK/W5+FJad7fP6O
 NEQA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add support for the SpacemiT K3 ACLINT MSWI, which provides per-hart
software interrupts for inter-processor communication in Machine mode.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e..d17f5613612c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: spacemit,k3-aclint-mswi
       - items:
           - enum:
               - sophgo,sg2042-aclint-mswi

-- 
2.55.0

