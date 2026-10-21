Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591572;
	b=IsYPXFiGFpKXny1AWrj8RoiULyTjSqKJos9uLcktNIgfgawWBpL5OkiMmQokxb7hgYAE
	 ad4b7V4Ft74Am1swM8UGV2Gi7lAzWPLRkT6Ipe0XAA9N9JpEy8glHuhx8KDvFSdbJJt8m
	 r3WQcl+49UZH0oqVRUEbh27dp59hshONFYu5ipMY9uhYj3kut/TBVQwQGinrZPM9Vxcyd
	 58cho2WhIua8q+gHnswl0P/uM78SfEWUxpL10OKhzmAAs50vOwvM9tTISCcI6rm1E02U0
	 +xQs/YjOlC5VPYpUpnT2up27xrbjZMdSbUizCZM8U+SBPYinUpBcTGaPVvvdRap+DAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591572;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=UTt+5FuHrUx1tCjYQAe2xq5MHeqwbx0v5ma8SnHJEo4=;
	b=MuWDJ0nEjXce4oNX4hgz/DkNQsKMlinf1ZCtksCU8vODldPp4zTPvSZe0YHK7Gv2nC+2
	 FByDln9ehqVCx+FMfgUQ3ns1HWaS4Al/v1yWBSHpkRLGsTH/Rki661abwLh8SBSNGzoBy
	 cl3Ls+lOwfSqZolTYyYv//G3h4v/YeqGY7mLlyqlrJrZ/Dgr7etso8yTwBbLOnh9fa332
	 VDXDzFi07RPp83nD7uy+kCc1jlQ+Sln1wm0wfKIxhjLxrbGHQL/9aNEF8exje5hUvS8sb
	 IHSIpKdAu/M4PJCwg9cq1vft5mNQAFEi7Ta9qkOc+a2l2zGdNK7HdEWizxvTSP3HG4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=K8jwJSG0;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79D606A319;
	Wed, 21 Oct 2026 14:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE79D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=K8jwJSG0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=UTt+5FuHrUx1tCjYQAe2xq5MHeqwbx0v5ma8SnHJEo4=;
	b=K8jwJSG0UuH0ErGa/Otekj2N5olAKTa0KMBJj+Pv3m9rBC6ED4uedBoFr9mH7u
	66EOkAJj3B0I2b12mXeILZ3KTFFWVmA3O48Cj27uawu/GATG56+vm0QfrzbM2MLo
	eyBdRElCmFp4m69IE0YmYwQeaTaz3rMp7eLjZWMZsZt+w=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnD6anxthqXSXxBg--.24760S3;
	Wed, 21 Oct 2026 22:05:31 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Wed, 21 Oct 2026 22:05:21 +0800
Subject: [PATCH v9 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
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
Message-Id: <20261021-quarkpi-ca2-v9-1-b75006b22bc5@163.com>
References: <20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com>
In-Reply-To: <20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wDnD6anxthqXSXxBg--.24760S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW7Wr18Ar17Jw13WFy3urg_yoWDGrgEka
	4xZF15WFyrJFyFgws8Aa1xGFyjqw47Krs7AF1UAF1UA34qyrs3KFZ5t343Aa4xCr43urn3
	CFn5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_rb1UUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+QytG2rYxqxboAAA3g

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

