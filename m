Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713488;
	b=rDFHc8NZlOTSHed+/B7Shqw+OTYhprRz+F+ALdkE76bzJXxD7a+igzWXW3+7prFgmUF3
	 WTLo3kLQ9fc/qLxrJjxrdZ04Sd8L+6G4yQxcy2OMPn4NnUphq/+Y3TyjFDfIU+CB+hRX9
	 YPEpu2Oe2ys0sDap9ZHJl94I9ENHsDbJVPC1OvS1wNQ7tMEkSOYK59NINkGw6D6/afjiH
	 2rXDgpUz86hU41fIcHMsmh3QKKnDPDq8qKNvozlZUCEKB5oeuy7pMQBmHSyps2MIjaDWd
	 smAHMHUD4x2E+3YWXK8FYRnyy0gVAZYapWpnGfoLiUwQUNdTcd0ViBIFCMaWj9+Q3sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713488;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=yGb/61y9dkyB9MrYGCIo/Wr1qP1fqSYSE3vu/mqfWqs=;
	b=WOqecwwyNyZu98Mrg3CNBmM9T5wJa66NBXlwTBo4GEzLRCVeQL95gf61PpfyOHXqZ8LO
	 Dp3fyl3Gx9GeWB2CmO4dZMDK4r9hz4BfRxL61H3dPCqfTOOCICU+TDVEZOLZ2zUWoRAy4
	 HeM9ujymjsRTOmSjEAWJ6I2Aq9zwB8ttw80OuW16EF65WUs77TieU3/8no9N7Wfb9JvGn
	 6J03Ma3QlOwYhl1AXOziVnxT2MBzb1KGezE0vOyFsTEbi9nb/Lo3WwJmJOCzsUL6f7ZhW
	 QLmMzuCtfmCd7WtoO+8a3qdNu+A2B9Z852RBG6fSMsA/06ABEln7W8XCH07RCLYh1aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Up/t/UXz";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A874606A326;
	Tue,  3 Nov 2026 13:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A874606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Up/t/UXz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=yGb/61y9dkyB9MrYGCIo/Wr1qP1fqSYSE3vu/mqfWqs=;
	b=Up/t/UXzE1wj8e1N6/ueAZWqz+yt6DUj8m+a2tNNvF/9sVEUrxbc+YvbhPkzsw
	mH8pMDbEMNad/Xo5dHqW71VRY9mmnb3BuMPLeC2WeA9GLPgsXl06ABooFIWBL4yc
	whicKmGM4slLIq2KHdJDMzfxRpuTEBwkadEi6y616cFNw=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHNzkg5elqJ57LEw--.46800S3;
	Tue, 03 Nov 2026 21:44:03 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Tue, 03 Nov 2026 21:43:59 +0800
Subject: [PATCH v13 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
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
Message-Id: <20261103-quarkpi-ca2-v13-1-ad8c30cdb67e@163.com>
References: <20261103-quarkpi-ca2-v13-0-ad8c30cdb67e@163.com>
In-Reply-To: <20261103-quarkpi-ca2-v13-0-ad8c30cdb67e@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wBHNzkg5elqJ57LEw--.46800S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr43WF17Ww13tr1xKFykKrg_yoWDXFgEka
	4xZF15WFWrJFyFgw4rAa1xGFyqqw47Krn7A3WUAF1kA34qkws3ta95t342kFyI9r43urn3
	CFn5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+gOWBGrp5SNlLwAA3k

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

