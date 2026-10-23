Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=42.62.85.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748565;
	b=1h7PsHewuKkho7q2TMjSh9yv3ZTNLPw8gVIfW3XOagX3u77Md1kYTHODGkmUKmiIyD8V
	 PW+hdYrcT60zlL6zDkf50xe/vebqCwdrLqcrFGclPbe/9YOfAgf4L+5ZAnZpalBbFaCJY
	 pr5XrRhYozqb5MaRZAa79ghtGLwxMChVmCY2AaginD1OVr8P7D0mRF9j6rcCR2Mib0u/5
	 gt1IpYWNqXpDdG26srw0GM++UTxobOLiWP6Xhtn0nxtSDRlhQgr32Snou87DEG+BQ8Hz4
	 9Wgs4MdwPk/VkRGSdlHyqgoesFjXSzzmbEtSfv0gEl7qyOWjHbPzS6p85kOD4uLKbNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748565;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL:
	 DKIM-Signature;
	bh=gXU7GfdClp8EMvKzN9b2G8rNOrp4bCPCGAI7/C7Kz6c=;
	b=EjYcKc6poYt1ru+2Q0uZwqEAssy+drxXA5tGoQi9YGtj/ZfwMVuRzGxfR6nITnN8oSoV
	 KadNRVGjTaod7gEASfI6h7Od0KJyzaiMrIITckIsepqXLv6lg6bDj4uUZTm9en4OKg33P
	 JDo49b5kmLUvj3F5PPdLrxEA0arMNIanii+uoclxpAt70QqozlOhHCV5rmQLWNMjZFwFw
	 lsB7PNYFf/NeADvFZWrrHx+riFGKjBWYy96ZWwmu6D4UGj6rJ+7hQQh1YjL2tdAO0w4+8
	 orJXiFvflknfRpfhDkmN0T0vRrVIVn98hQCrjdIdz9p5iJg0vk3OK+SiDL/tXr2hyqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=horizon.auto;
	spf=pass smtp.mailfrom=horizon.auto;
	dkim=pass header.d=horizon.auto header.i=@horizon.auto header.a=rsa-sha256 header.s=auto header.b=QIMWCCYP;
	arc=none smtp.remote-ip=42.62.85.75
Received: from spam01.horizon.auto (spam01.horizon.auto [42.62.85.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6EC606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6EC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=horizon.auto
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=horizon.auto
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=horizon.auto header.i=@horizon.auto header.a=rsa-sha256 header.s=auto header.b=QIMWCCYP
Received: from spam01.horizon.auto (exchange003.hobot.cc [10.69.1.10])
	by spam01.horizon.auto with ESMTPS id 69N9gUtI024070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Fri, 23 Oct 2026 17:42:31 +0800 (+08)
	(envelope-from guohao01.zhang@horizon.auto)
Received: from horizon.auto (10.9.0.252) by exchange003.hobot.cc (10.69.1.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Fri, 23 Oct 2026
 17:42:30 +0800
From: Guohao Zhang <guohao01.zhang@horizon.auto>
To: Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin
	<fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: gpio: dwapb: add snps,native-both-edge
Date: Fri, 23 Oct 2026 17:42:19 +0800
Message-ID: <20261023094220.2989225-2-guohao01.zhang@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
References: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exchange001.hobot.cc (10.9.15.110) To exchange003.hobot.cc
 (10.69.1.10)
X-DKIM-Results: exchange003.hobot.cc; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam01.horizon.auto 69N9gUtI024070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horizon.auto;
	s=auto; t=1792748559;
	bh=gXU7GfdClp8EMvKzN9b2G8rNOrp4bCPCGAI7/C7Kz6c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QIMWCCYPZWuJru7idr1+F9/36PqzB0z4/zhILDBy3uOi1YuGLLfmRxtCkOhPxMBB8
	 fX8Yc7h3jjPqVjavSSizDcG7JU5pxd8RUWX0m/JOnCNvEwUyw15RA1NWRz+g8INH3h
	 cYdHhUawIbZUYZokBJsrIOVapgH0FXLCCs9UmnX6qblZvsIkBpf/lW4tP0e5V90QIY
	 JiCDlQ6xjqbWDTs6kPZd1ftB7HDY1A79bglOdf2Dzw8yxga1ENCLSkCsxg9UPE94kF
	 uaQiVJJgrZRxfBuaNhf2/vH8KEG4vkjCq0BMVtykAh1tj+GUVid22Juk8bTAIlT8qS
	 +Ryo5Hr2BJhSA==

Some DW APB GPIO IP instances are synthesized with the GPIO_INT_BOTH_EDGE
feature, which adds the GPIO_INT_BOTHEDGE register to latch both signal
edges in hardware. The capability belongs to the IP instance rather than
to the SoC, so describe it with a per-controller boolean property instead
of a build-time option, which could not express a per-controller
difference in a multiplatform kernel.

The property only describes the presence of the register. Controllers
that do not set it must not probe 0x68.

Signed-off-by: Guohao Zhang <guohao01.zhang@horizon.auto>
---
 .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
index 5506953..e229afe 100644
--- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -46,6 +46,16 @@ properties:
   resets:
     maxItems: 1
 
+  snps,native-both-edge:
+    description: |
+      The DW APB GPIO IP instance was synthesized with the GPIO_INT_BOTH_EDGE
+      feature, which allows detecting both signal edges in hardware through
+      the GPIO_INT_BOTHEDGE register. When set, IRQ_TYPE_EDGE_BOTH is
+      implemented with that register instead of toggling GPIO_INT_POLARITY in
+      software from the interrupt handler. Controllers without the feature
+      must not set this property, as the register does not exist there.
+    type: boolean
+
 patternProperties:
   "^gpio-(port|controller)@[0-9a-f]+$":
     type: object
-- 
2.34.1

