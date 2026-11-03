Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718720;
	b=O2AZCYFwZ0SuZVLKMyR1RIRQ55SwhiRuB61G0tkctCjAtXXdWbsbtn1JDGV2frnbTPjg
	 D/Lv0YrYQVONahszTiqPpOwMe1EU3ApaQkBJAqfiTRAgyN93qT+kZ3a2TYh1Mbyp8mHai
	 sfzWMO48ajDz3oAlKlw3yfDJaAyzuyyzAtRrXqEO4CWJP43yVi55zxu5q/oTh6H/I60FD
	 W81XNA7QAteJ8LWGTs1yaR1wWXwEwNtf9ovS6UX5sm8Gv+D9yEVe6qnWYcWqQ2KEmvSkK
	 b6fWycMBP53wIXxOaA1iwkwYY3NRMwxpF4YbaaFrZCxsUBpLWjn/fjnWkNf9yqhy7Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718720;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=yGb/61y9dkyB9MrYGCIo/Wr1qP1fqSYSE3vu/mqfWqs=;
	b=MAm1qOi1IWNs0Z+iPJffagDeWrYxwROX20F2oRTTppO/G8AqPYxnsGsMlK5jxDHliyVR
	 5Q321KpymPG6LY8Z/aaWbowlGrTVzkPSdagJ7UI4cbk5328768FWhXieriVcZkeYvzURj
	 APvFBs3UbfL7hWmZzxsZPg8ab8GbePa8nyohHrJnwdq4JncaRvej2oUhuMCBPujl9uR3f
	 1eroW2O7NfYVm8Zsvmy2+h+8e5gS7gHJdGLWA7qfr/M+DLljlAd/CEvVNNZdnIdfUChsg
	 Asi3J7iD+xwDpl7NOtCT5o4RO71nH66NtRAIYiD2roqZk9++PS7kDNyYJcLRbpA/5bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SmBTXIbX;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA76071A2A;
	Tue,  3 Nov 2026 15:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EA76071A2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SmBTXIbX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=yGb/61y9dkyB9MrYGCIo/Wr1qP1fqSYSE3vu/mqfWqs=;
	b=SmBTXIbXfYcCeT5yGNY1z/9RIOPcC8uK8E/yHxwP93vLcwq93tq32n9grdEBP2
	kYFSaH6VbZsBttNeV9Q9lIyzLhgZVt7OHRsd2EgiNep4bWbV90bhNmvsC9Ni8KIG
	wURycJNLGFUscMn/wFcYIAI5xQuvrbO48BO+4Opd2nUoM=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3NzWP+elqrXnHFA--.58335S3;
	Tue, 03 Nov 2026 23:11:14 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Tue, 03 Nov 2026 23:11:07 +0800
Subject: [PATCH v14 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
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
Message-Id: <20261103-quarkpi-ca2-v14-1-290990440b67@163.com>
References: <20261103-quarkpi-ca2-v14-0-290990440b67@163.com>
In-Reply-To: <20261103-quarkpi-ca2-v14-0-290990440b67@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD3NzWP+elqrXnHFA--.58335S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr43WF17Ww13tr1xKFykKrg_yoWDXFgEka
	4xZF15WFWrJFyFgw4rAa1xGFyqqw47Krn7A3WUAF1kA34qkws3ta95t342kFyI9r43urn3
	CFn5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+RK3JWrp+ZImiwAA38

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74f..a3191bb909b28 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@ properties:
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.34.1

