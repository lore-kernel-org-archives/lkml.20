Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773343;
	b=3VOx0D834tGwPAqerFN0v8I7aV1XOU6NqOb4k8spgHigdKiaaaTJoSDdsg1nW/wpgj0z
	 TB3kyopZWidFmV1xPiRSrXl7VvDlIPqgRcqNGe4FqgP+BpaCk/ef5+8EXgrigG3SienHx
	 udiMsXEZRdpx2PiastMom5ZlRWQUm4PQYNa67IplHX6ECCF9S0LYqvwGnktj3dyMKYcKW
	 SbFH7wuhDK8C8c0CkTJOFgL9bCSk4tlACcs0/DyzGWU5v2gn7Hl84Z2QmzkVYKcbIDvdM
	 uO7zrPbBtjdwGHoqCdJdpgKXNqG/zb7YrTFDucma2lrLGcIczzObq6kQZDn3gEtzWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773343;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=RS8HQHUDLvu3L0nrb3s/fU2QFoH0d0vm0L4FG+93668=;
	b=v6GdtIv31EaBVI+n5d0LWQm3GwRZTy6ems9yKxfagTgM5/xv2un+OI2Yi7LjM3TsHGdx
	 O5z8yrMIKcq470bW0JzOZj1i1NhZMSdbgrTyot9b9YRP150ptQcCDbYWykFOHSy57U0wz
	 GAqOBn+G1Pr1gwksA0aMy0dDRfpFnUdXGkx0xHhGOIHLoeZF3LK74cPDE+TBzwahSOm1Z
	 wZOwMBPKz2H3+CNs7D++DlSf+sseB4xGeOmrpQ+moY3tKIfKID+JkeyypAyek4aaX5lrB
	 ExYrgNl/wyoGE96BwKFpRbHaKsmqTGRwLorfxT7q8V0CHZX8KMfxcBq9UXDNheCwnMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kyBSu8eO;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C70F606A336;
	Wed,  4 Nov 2026 06:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C70F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kyBSu8eO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793773325;
	bh=RS8HQHUDLvu3L0nrb3s/fU2QFoH0d0vm0L4FG+93668=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kyBSu8eOnUa/hchg0kPrXLwxS8MMab20i7KIlv0tUDph3ub2RHaQqo4EzNr3rC6gk
	 6Kyua+09/U9NnzhEShVsckw5Brel3qRaxKhGaze5wFDRcyl2AxrO55oNQybNIIj86g
	 d8pdboCXPiBzEstF43JyppSGEPS4XwGvvf6tWCEQ=
X-QQ-mid: zesmtpsz8t1793773324t7b13cf52
X-QQ-Originating-IP: dr7aZKcoVFwVL1+V7P+P4KXa9jl1lrdr29Yc0oryszw=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 14:22:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12024928077256599196
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 04 Nov 2026 06:21:50 +0000
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add K3 BS01DCMA
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
Message-Id: <20261104-k3-bs01dcma-v1-1-794025247e4a@linux.spacemit.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
In-Reply-To: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=805;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=ghUSxoaLZNOHu0bC2sc85BOdFzkkpY7rTBR2ijIXN9s=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmvzrOkpwVlnbM4/vUeF8PfiuOPbm8Ii78qo2rGe2qSx
 oLDvVY/OkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaiy8Lw3+elvNzu0+yn7z7a
 8T+VtXEKa0/e2Sd6/V2XAv+6nd4YJ8vIcITn1d0FupuOVfmvPHfyl9W1T8ud7josD/r6zehuYma
 GBTsA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NlrfLQhmr2s5GmGI1P9u1XcYpYiSJDqxyLJA39CXWppOHgImOOKYAVwh
	X0/1rtS1zTOWrB41BxfxK+cq5JBsNRb08WVXeanwn5NqlZAI5RM9diI8EuJGg8Q5i5VTMca
	KpUZBZtRqJMgVpbuRzaeket6qV7RS/xIoigyIOzpRBhdx0uOcidBysw1G9qiF/eeDkuiYbj
	/sZX6lwIVsiGMNFY9izq0cA5aLKKv5ih5A4XSxcp+W5ah7t4q4OLf800EGWS6YuLie03YVJ
	WpKwUyuSox+eGu9LQtODLFCleqRe8a2lvXAj0faCxRXuUmIWkMXhi4pVmwpJTIrIE14t7d5
	dkB1CF8HxU4IgST+Mb/KHWRraL638fIA0/djH0QOWxtB58STaCKE1IrbjisNiDGLr9+nmoo
	YKL84I+YjIMFVhEDCFZ2lYyWtYLf1vvKNO1s2C7Rx+2GNjy+HiJ/SeccssEB/Pw8ng1hR0I
	pLsnDu1TyGFbAU8p5HackXvVDm3npFMgkEIuGK7/F5sL1LBoh0WNDPnZbZ3tXREMX+W5Vva
	6fHyornakBMe89wSMExUauXvrTQ+xK+IrqBOtbyXbqoWHnFMwnNcPMS6dWnOwpMsWugq4SP
	Ow5yKOVGusMkuvP1EOVlYZib6R6+L22fyPONcbl+lv0aG3bjFmfcGleBJvBzhx6FcZK6AvE
	NSPt1VuHqPpJzILj0XCyN5XReJJenj7YoMonVAkmUiVoDVKGgUv6vM7NLB7azkionwE34nb
	h7bqM3Tj71ropa5VVBZnRr28QhIIOdjB33ifGrD60fCkqHG2O9DTrdHo7zUcSvklXnequHR
	1seSqLVWCWl8qlWBRz48+y2B72j0rwuGmgfQTCyrfxUKbsq8kZImIKMtWYNRNA+dLoKbh9p
	3Y51jmCo3sfiPgRgj8JL6XYWfSvItY7W+21NkFNm6F8KC2XOUb5+fuKHqLKDbFX5s0c7uf4
	9xmXqj4jo4LwkMz8GUrkMmw8EvKpFRGh2B+4bH1pc6jmKjMn6HhwJAYfyceMzt+EZNechH7
	poTH1B4mwUW2qTrxelKEUPy6XJomW+iV8a/G2dxM/hrb9xclV5Wn4DtNxRpRpAmaXrAcG+l
	15fsjONEOkX5vtrl5RiNJeKplQYaL4R37uIaNBkXfi1pi5HFNMq49W9E+ZRP1z8bw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

BS01DCMA is a board based on the SpacemiT K3 SoC. Add its compatible
with the K3 SoC fallback.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4..5023093ca2eb 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -35,6 +35,7 @@ properties:
       - items:
           - enum:
               - deepcomputing,fml13v05
+              - spacemit,k3-bs01dcma
               - spacemit,k3-pico-itx
           - const: spacemit,k3
       - items:

-- 
2.56.0

