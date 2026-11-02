Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634076;
	b=y88E305W0gGICWs2eAVG04c7T3stQLmsa0Lgjxfwe0JuCgYTiB1Ak6WPMfMkzH0TKlFc
	 yfQUQ4PYtjJvlgvs06xuZ+nKpI1FXutZjULHuVJskJuAyUJcz4BmNvutQlG5kUAJCWMKW
	 ZcrwxyqKf7F7dUWDVIVrbp4wPQfU24D4AiRlMnQh+fQrkBQKF72YYkl0SrCZyDK2dw9Ie
	 VXgVw6mpw1tI7acumJ3cJGeqYc4nCiBMtzkoahyuGB+l3tI7QhApjH35o9PNctWYRkRBW
	 hc6pFdQwjpUq/WtjUKh+zHlXOnG+LonFIB0p4XApYe1bwnojm/p/GW68Djsa7Sr7NRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634076;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=7RB0aQ170QWbQt1olwfSEj/M8xmgDSopHSlP7JzynLU=;
	b=UyqRDTQLofE0I1OwZPG7MpWTJrkdWt/we5sv0yrl0JN25rSQzZZnHVyyhbPg0Fbd1Lxz
	 OoT44mGB5P4GYPUcqTZL2P7eY0uF7EbHw3vGKW4DdsEN8qpqTUyHTM42rFHZb5pdfuNWI
	 ekV/yxhxutZEyF3I34QtixwJZOPtJpIhCUQLvSgKO6m07VKWOcyw/gb5Mc768o0gez8W/
	 JrBqWQ+5ofweqzYepCcD+jTTP10zX+ZNSTeFbJ93nmJdmsDAikFXRrI5z57JaTAfQ4R/U
	 CUP/x3gMAODPd3dhGu+NOrBJYszQbGqoyp0uli0hrUkXC/fY+/pSMUPAsp5vVDA++LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=U6mNLpTS;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8286072C7D;
	Mon,  2 Nov 2026 15:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8286072C7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=U6mNLpTS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=7RB0aQ170QWbQt1olwfSEj/M8xmgDSopHSlP7JzynLU=;
	b=U6mNLpTS1KsSzZXH6WEp5pLq0NE7zqRcz+3QpM6i5mUpEnkGfIqWySwSZIvGqI
	P2W37B0T8bTd7N3G64R2Cnzzq/sxqnOonAIJ1oRtkZKJNkBFd6k/1oy8vSitUAX3
	geAy6nqh6RFuoFqo5Kv1HrNOHwVc69syVUuDnSaIvMV3o=
Received: from 4F-GAME.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCn74XvruhqEea+DA--.56588S3;
	Mon, 02 Nov 2026 23:40:33 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Mon, 02 Nov 2026 23:40:13 +0800
Subject: [PATCH v12 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
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
Message-Id: <20261102-quarkpi-ca2-v12-1-d749d9bb2bf9@163.com>
References: <20261102-quarkpi-ca2-v12-0-d749d9bb2bf9@163.com>
In-Reply-To: <20261102-quarkpi-ca2-v12-0-d749d9bb2bf9@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:PCgvCgCn74XvruhqEea+DA--.56588S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4UAF45Ar47WrWrZFWDJwb_yoWDZrgEka
	4xZF15WFWrJFyFgw45Aa1xGFyqqw42kFs7AF1DAF1kA34qkws3Ka95t343Ca4Ikr43urn3
	CFn5JryxWFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+RG8KmrorvF-gAAA3c

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Assisted-by: Hermes:deepseek-v4-flash
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

