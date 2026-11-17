Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919191;
	b=olRux+PVKaY7dBri9YYgiel0PYrQQ+OK3T37p9nrv9FRK/a1P69LJjyt8VF+94YthKBM
	 EPKnyOQnS7cj+dV+WpbTLk4jecWFvC7ATXfWGcdVibIQG3ntaydI4b4aucX8bgr1mq0su
	 lfVzNMUZDyqNEdmi8ea/ud0KElXhIoqgGGVXBSKSijSGUzf6nGMCUlgUFa5tc3VfIkiBG
	 8MoVkuZzbSrRKKK/oY5HmSEK/fT8Jf9szZ405X+50Zkh5SmPOpiKltN/2SBYaBYn57O7f
	 +iQpJ8Ms1VTclhtJ8QkoC154Ah6rPkebMkmMEEyTJM4Xicoow3H0m2PHyBmZy5S5HIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919191;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	b=H0gYh278Dm2WUwxjSfNd90J94qyVTQmQBzfqag+KgIXLV0Ka3f8g/ObFQ0PYwuY40uxi
	 0PYV+/4t2ZAj57BN4oRl1/iY4Xb6aXAeSnkUe8Ugzrk9WpJ9Z+J0tBTtc4LJGTXlWFpD9
	 Hfz6pH2X30rGiJxl+bplOG0Yxc8mQDsuYrgcSb1Isj6rBSWu97sd8uVGedaERO2NB813f
	 vzmP4Cr9et3KS2kkEw8JEg8XBqyyzptCBlCeHXWC85XkV/xNwQ5+FhOKgjqcpXty3OgRQ
	 rjbgKRyenGTLeOZJQXDNUxnK16aaJ4TVORPN01Yzz/4lZvs4KtJs1R/vuKmO7jTzvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WTjj4JUl;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1067606A332;
	Tue, 17 Nov 2026 12:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1067606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WTjj4JUl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919139;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WTjj4JUlGsyYAkgMhQHzo5eKzYXzlMDEF+tTE+GlM1a69cOp1QBUhRV+HCCdMUdg2
	 ZpiwSbcWqaAWFFj0+UAchs9zVOpZpmIGP4PZaDMLnBYJdzdoM3TEGFbvhlfoFQ9+8M
	 TyA3SDv8aLPEIWE3Gs/5Oi9ISgQSBlzEUej47cz8=
X-QQ-mid: zesmtpsz6t1794919133t2371a5ea
X-QQ-Originating-IP: 6ydtl4G31wbLa9v/Bzv5QTDg8QDH0bcupB+OgsrMpM8=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:38:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7029049940140104590
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:43 +0800
Subject: [PATCH v5 1/9] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
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
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-1-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1574;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=vJgNan3VXHrPIUL1xi2lNNcRCVH0/pu/PtlpRHIGzOA=;
 b=TKYkmXsQGomavDrUhG7EYK8cKbVQ9OZVj+07fN9tkJ3MNab0ch0gRCxyPH/e83ABECXAhvWzs
 JB2NnN5VornD4C8pphTwkA/Rv+Ro/+nNuRJ9HztVrPYKuwhyLMA6w0d
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MKP3LwvGEIjIy0pNxPZZGHYSqGTfoHcyg09LKEj1X+f57wtDNlyzM1Wk
	sUa9xK3R2leZo9jkSOrVS3UJNca/mbigl4EZOqfsMgKwBGqgV8B5PDAh9VFV2GRhV3XDSJI
	iovB4iYRWIvrfYzmTKULXn5joGQZG8Ee2DVGRyEuCdCojdb+UT5PtK+QWbONmTbe6zHai+P
	6BTDYu71LdXgkU31tUa5Iw4+sHfl+yRHNuo7F+bthE6Bw+CXZnTJC0z+O56ChvYTLzt3lga
	Ark+stGkxWaHIHBDecgOnoyz/pMK24RiXpctYOQcpLG7AVSffjjLs5jKHHziVE3VKWFnVbF
	Z3MNYWSt4enRCDNWedelmm4egKwBY0KIHeA6sW05PpBWEOy2eESgGmz98fqHGgBxnoMp+G7
	M7WCJc6Lq4rzchYgkWrMe9ri2Iv6M0wunwraWIcFPqSqz1sdhrCyg/9uyPi+lZCxAZmOVCX
	X9eu35rtqP58TB3VnGP/0fKI7s35NIkuzzyILQkPs1s7g0uNajWyS7rh7Wk5AwTYVAa1Qno
	TSYrn34R9n67XO/35Q+94tHtj/c15qHf8WgXNZtuthNtbJDb89n3whAcImBKFCOxoZuQ2+9
	eduVJdDBYAP0LQevfGUFClGPlrISOdzym8Jd6CuueFxJxEKrZ8IS5EGH3yIVcTihT2OBEU6
	99VlJy0JAVQhD33KP2tt/adIdqiGQY8z2+rxOhQlyAKsiiW1U12Y0z1w0C6h5Crvw5Ic36p
	dz2Jo+9IKIyu6UQT6+peirRNfei66qOr3dplx7lwe8K8zxjzOG1S3s8AWiCmToB2SjdTqHT
	o0Gcorx6eMvYDs2i4QwPSgXcp25LZrmOhTAPsXcP2ZrK4LCnP0iQ6LcRPaMEpVDlu0oKOF2
	aqA77Aq3e4GCnctgMwKkJ4S6eVRUFmMia0UBSzc8cjpRnQPjJiEUSV94cMRJOvlTRvmdMpr
	DmTFgYWFAjprmYEE2dmq2wj4q7ZQk9oki4EIN4lyGJJYAnQ19dtZCdXHLqhg4lA0UzaNVZE
	YxT49L/hOZUijCeZYONAYfTAmKXQGrDOylGxDZOOtTo9QGGPEmfSXyigOV+k3P1A90A0yuG
	UghCvNsjl2HgP5tgZtmQRZxbw8l44p2tbQmz9iX2p80qxJa6kDaVuwILM2BrBnbhWweTM6P
	oh4ye9iUWOXgkhE=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
has no internal OTG registers, this requires flags which disable
related features set in platform data. Add a compatible string to match
the platform data.

Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
work, add constraints for it.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..5c2b7eb1a6ff 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -25,6 +25,7 @@ properties:
           - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
+          - spacemit,k1-usb2
       - items:
           - enum:
               - nvidia,tegra114-ehci
@@ -113,6 +114,20 @@ allOf:
           maxItems: 2
         clock-names:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-usb2
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        resets:
+          minItems: 1
+      required:
+        - clocks
+        - resets
 
 unevaluatedProperties: false
 

-- 
2.34.1

