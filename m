Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DD3B47D2;
	Tue,  6 Oct 2026 17:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306497; cv=none; b=La7VkfOAJCRIhQG454IiQ0N3EEIrxcDtwAMpWdSZzZkDDKI/Q5kwfmm/oqsVjXIlOIq40Mk/uzn05jLP4rzk4H93R7GZFJOcgW1Ff9zzCIH2wpqI9RTnhDgCVZ1H6QE/2Zt/KTOGklB3n1ZYqpCZE0d1DOcg3NGwO17+zYtlWl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306497; c=relaxed/simple;
	bh=2VhwS7uw2Z++4Dsbz0kj4i+d3dB/KB/XjgKBqichXKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OdhzwGMTqGGQpE9TGVMs/VkW3Cusazff0BkOB6miAQcEPe8YYZWoAP+n5pchldlw6XGnw0niQExgOb4ig2ML960xRxZhHJadmcP4c0m58DBBHquVC1PAQbVg0qcjAUUZ1+Mdlh6Y3jgr04a6MqYMfg+1UaKjmhATWle2pqHdAVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KDi6f3/T; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KDi6f3/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=UTt+5FuHrUx1tCjYQAe2xq5MHeqwbx0v5ma8SnHJEo4=;
	b=KDi6f3/Tu6Oz28pOKPSp9Yp2ac9XsjbaoeRD8xG6bildMbQ6gchO4sdG7VWwiw
	zCllaq4jRg+Jq93Cc0wvX51ylR49X0Od+VWmFniNzmxnbgawXOcndBgr03+pezwh
	ViQRLwkyVE+JLZrVQlrBsUWOcMFq6UCIFOG6tl533XHdA=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz_fJKsVqPjBSCw--.19378S3;
	Wed, 07 Oct 2026 01:07:24 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Wed, 07 Oct 2026 01:06:26 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-quarkpi-ca2-v7-v7-1-a84c6d5d6ef6@163.com>
References: <20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com>
In-Reply-To: <20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wDnz_fJKsVqPjBSCw--.19378S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW7Wr18Ar17Jw13WFy3urg_yoWDGrgEka
	4xZF15WFyrJFyFgws8Aa1xGFyjqw47Krs7AF1UAF1UA34qyrs3KFZ5t343Aa4xCr43urn3
	CFn5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiOzV7UUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+gzJN2rFKswN3AAA3Q

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..a3191bb909b2 100644
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

