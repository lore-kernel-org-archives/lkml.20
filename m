Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5D247140C;
	Fri,  9 Oct 2026 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531099; cv=none; b=aAP6XkV9LBhBKmI5WMpt0RDLz3Be8yBYeF3ASvAdLHq96fOVG88Nz1B4y4ug9zpetnthjEjoXNo91H5tyP6GlLal0AlkdQj0xqpA20c/3t+0Bz2xYhabP0YqbtVXtLEs1+ZO+PlpGS2MVwVWX7pdBqhGM8xxR7vwAcLkfKjGMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531099; c=relaxed/simple;
	bh=vJgNan3VXHrPIUL1xi2lNNcRCVH0/pu/PtlpRHIGzOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9uovxH/SGefXrDagDQ85Xef7tX3+dp03i7gtIE+qXh3avD5drxtxcsXvZBhXN9d8sMdaSD3xi7AQqTNYqYomC4WTfIbyUOfzih6wR7b1Z2gav7/QbeP7P2xqh+v0XxWS6RoHAjiIrrWtZbSyM3ua9ehO1SMq84yDGvUHr0IOYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=XNUQsiFy; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="XNUQsiFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531038;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=XNUQsiFybJfb8GOUgjS0GOc+WwgD5NzSD2lA8ObZAH8f3zQMgPlx8AA8rY1wl+GSw
	 ocpmgbzvnR+Y11tKJE0gPwbEEJDnJIOEzkQirz56d3z3+1m8HCaOYRyjcVn1jjBMXu
	 iEGYfOC6BhQCd0kS2Nj6cNxec0CFHKaIjVvq9fwA=
X-QQ-mid: esmtpgz13t1791531030te91ea3d4
X-QQ-Originating-IP: GG4F2ullY74Zcb31mcORZE2+mBiBAStiIiUm9OvXucQ=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18415433431050836106
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:24 +0800
Subject: [PATCH v4 1/8] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-1-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1574;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=vJgNan3VXHrPIUL1xi2lNNcRCVH0/pu/PtlpRHIGzOA=;
 b=+OeOzx25lSmWLBlsntQ3Q20ZIemLbGeUyRoRTeLDri726JgjOjbjWGJ3bZMviwvhrFS2AiFOO
 1lQjxbCoGCqDGVZQQGnLZQ44Ppx17V3MZDMG0U4QI9PwRvH0xHMtiBd
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Njm7hxZIEajZJSZcEk86J/60G5hi0Yq+EbXRDxVp1Ar7+Jexr3VR6JaD
	Pdfyr1ocHCaUD6+FmvF6eaFYlAFFLLiq2SZSBhe9fX15YdtqrdwY+AvEfaTkB3cl9gQgihA
	9aaas1v2yy3we6od3zJteVVzF84E+BrUlzTMAt0DeAZWof+s3y0ycKPfQ3blC6jbOtx/c4t
	GyXMULxwwWknGxzm8U6ya4ehb7/n7YPYi9HrrsoTH8q+CMRZehczuKHPBk/SB5aHQhc4S2U
	BXqYDrXpOrDwmgUVeiuQ7VPz1foADgVN7IU8A1Xo+4/u5SNZzB1ABZT6ZEryda/oQmgnHu/
	2Mcjk0UNskvy0jW7dWSgLQCJ/4SIuhlmjmIpLIRbsBx4vN1BdPXKhTJ4YYyqz+IZtLqfMMz
	MWsazHhDPxm6XsAwSROZaUqzIxlfP1LwFWGsL7uPNFMoa60JtQw8EI9t2vHtOLQbZpY888P
	+nn6e8ftBCrrWjp2T4FZkRS9gdNucbF0ZpPSrI95xFJGmoMOkfH+YGdqnR5CAVp17uDLyTG
	xtNtSb6LTK14QMaeRA42HqsfGl+fduaZx9kXc/LswvqOhRsOYLSt0wknS9ygQw0uQutFjZe
	Boj09CGaU2aBsmapocNP8/fXJQBaco65/NfpHxUwBmcznSLZZQHw/dCb+HH0HGvtSgHUXKY
	yhvtwtbr8T8iQZEg7rNxovQisDmfQXSTEXpw1s8gGhzqj8II/Qr4dd6O75w8o2TgYSSYSgR
	ybIkruR+slr/gg8nl2a4Ndesr+rsRTF3463TFcNOOEhdoA7wajgJS+ySUqa+1p6JeoXTxEH
	3tNWTh1xXMy4AxuQhUtLas4PY/0GYq5q96GUUKL71qrelfuhgiT6pIqoFnLAf7YKJRWvlig
	rr86aYDqPiEjEl98k+S62imV/cLEmxVDS7b3Y1F2XOCTenReuR7dSGY/ioN0+af5B8DffDy
	yiufB2HxdesamE8fkAFZFSY13t5rzctudGDXC1+O9rUiPKys37sMRH/icZ60sNbU7CbDVo3
	9fcmNTzevIvPDr4KKGpV/fK5olcrw87N4wIdxdtATrRj6qsKxYIFEatQnKEWlibx0zlkNhB
	JjciRsoK7P6hLAY1/F8JtCodGqF6B7OMo+XWFo+9l87FRVJYDEWuGo7z69y58N6/SeMRSbo
	WTAXP+oTuhUGICI5iQdqQuofzqOdvh8Bc5dB
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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

