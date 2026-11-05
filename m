Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883871;
	b=eiD5TiAjXUfWGOgUH/UxZsrDTUaaDqKafSm84UkAXH/2YAZb7VfOQGo5F/Vupu0KeVBu
	 bXlDzkhan13E4T1b0bMJuvLRslF9IgmXySoekc6gAHkn1kGKyJh1IpGpEXIL/V//5Rxj4
	 pEHcvCVtekYmw7rVpbKR4pLBCNWnqLLYIUi84gju3lC103yyiZr+np/Y2lSk9ffxJaD8u
	 iUWPkMLrXL6K0WU4vf3RSd+0TywXYeNSeKYyW/1ZHaKlDImm5PaeqeDBZSHgUL8ST1eof
	 8vFhQRniRT4DtJvurgJR1xPn9TH4wTa1QCkEXyDTxbsy2MPTN3k7FFmW8Fe+0xxOMlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883871;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qUQJdCDrRqnIvXLVpD8XTl0Bo54PvOPr/Tpz53Dd6Nc=;
	b=CshmXmOnwh7aAJ5pCiboCT6+/smHICAf3HaOMx9cRG2wAiNE6L4C8SxZGJJ5517zhYPm
	 /1arrkXOSqIcdcrxmFQq+y5Mj2FkcOLeVgWbmqd9BRv/BpGM1X6tH74Kf+9bHbVAK5oka
	 yA9fNs3llGPlMRha0hrosbe/Zi0LZGv98IfAd58edoCfOdkpkpuvkYsPvjUZawo6/pvbm
	 SOkqLYtniNEa+2ApdNXJVgvzOVntF3I8IZNOyXTVBFI7axn6pwrStTgAvWk9158YbDddx
	 5PTZItlcLdvfxoKrYOT4x0VbHAGsuInjBxR3KSLHlhaq2TMe9LLL/zHIUkdYbqXIn0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="eHvUG/zO";
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBDB606D81B;
	Thu,  5 Nov 2026 13:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBDB606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eHvUG/zO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=qUQJdCDrRqnIvXLVpD8XTl0Bo54PvOPr/Tpz53Dd6Nc=;
	b=eHvUG/zOMLNjImA0Rm6/V64Xc5uaPJYmRa5PTGSz0/FgAAb2PiY7RzWHNX5ukR
	u33pC/CYSMOqoa/qgyV6T5K20S4Yg1UKBjKcw/Vf+/wYicVXpkn63+c1EBNaeWHy
	zqezkhLhL99oLUCBIY4VRuj8tc8jQzSMH+eG7HM/r1rXM=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD39xKpfuxqIBOEEw--.52808S3;
	Thu, 05 Nov 2026 21:03:39 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Thu, 05 Nov 2026 21:03:30 +0800
Subject: [PATCH v16 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
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
Message-Id: <20261105-quarkpi-ca2-v16-1-b48eacb64a60@163.com>
References: <20261105-quarkpi-ca2-v16-0-b48eacb64a60@163.com>
In-Reply-To: <20261105-quarkpi-ca2-v16-0-b48eacb64a60@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD39xKpfuxqIBOEEw--.52808S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr43WF17Ww13tr1xKFykKrg_yoWDXFbEka
	4xZF15uFWrJFyFgw45Aa1xGryqvw42krn7AF1UAF1kA34qkws3tFZ5t342kFyxWr43urn3
	Crn5Ar97XFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3QufDWrsfqu13QAA3-

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..db93d97eaa95 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -187,6 +187,11 @@ properties:
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

