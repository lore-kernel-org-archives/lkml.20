Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D868485CD9;
	Fri,  9 Oct 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531114; cv=none; b=pyLcuVxdqN3+sbU+IncIm5cvLjQwHsE+g+w5EiIT/pTEqYWCoivI3z4DM7UrB3X0YzULYyI5H7LN3jzJRL1rw2x/R+gAZeynkeV1h4ddRPapxcmgQFKkEyUzmvUoa0xRfYgpwn4ifGjyPjxMu98c9FpQ1BNZD7ddvMtBl1U8B8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531114; c=relaxed/simple;
	bh=NhXTB+6LQeBDPdlKhQEBituQTc95+pqg5YH7EZfmLUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTSE7eDCR9Q+DM6oZZqK2ecD7egBDILBShhbALjX+suV8rStF4jNOR2Y4wva1NVKiDmwgKIWWGXWYaVCLBcVZ/nUOi0bYS1mO7wCB++PX3DVcCo+bBLtb1LPl8KrKBvoQtrCGrvIU9bDr+OdnOEOIL931vWNUG9evJ5FpLcSFnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=fs+RQgX6; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="fs+RQgX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531061;
	bh=7p7Pb+f3+26BR0KMgF8tnopJHqF0TPOrtCKj4Okhm9o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=fs+RQgX6AXFRdD2R4LDuy9zicYdoE4yaALedb0JHLt4sPbWP1sogIoSSu28awQQL5
	 FhvpzDHEOAWyid+O1RoKdlUni211asvVHj50zBYd/1k3HaP19OIvI9ha62l85hbLN/
	 EmVabVWG3gqTrukvxC6U+WlI/Na/hcQKH9ygCZNA=
X-QQ-mid: esmtpgz13t1791531053t660bfb2b
X-QQ-Originating-IP: VCxC+5I2cKd3v0Tg6Ce0ivbkpjssaFlnRXCjG3ieLPg=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4421076834129497525
EX-QQ-RecipientCnt: 19
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:31 +0800
Subject: [PATCH v4 8/8] riscv: defconfig: enable ChipIdea USB controller
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-8-2d98e5324d9a@linux.spacemit.com>
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
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1116;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=NhXTB+6LQeBDPdlKhQEBituQTc95+pqg5YH7EZfmLUo=;
 b=5G7h71JRfcTH8+q8Jt3C+HsDPfIS7L19HLjcIT7C60ceRyrmz3ilJktQNv1Jsq7Ost00fFqZl
 CaWaRj57P8LAZAmM0IHMMUvTgjms6WeKg4W46tF8Rj2X0zQL+8iQwdo
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: M1Pip40V8LC0nEsuemIAQh1ja7KjJaSLePZ+qRLEJxGRMBcQwwMPpAyg
	sjblPj3BTLkxa88Saht66KUvWzF/I3Sq/Pcrq7gjusBGSp2wFPcLnKWi1HAjLA4BYYJRvPQ
	DxqpXqapUOl5DMWCTW44Xo+okdQjmkDnm3FfT3bDf6kMG/vJvZXqI9aXnTCkc1+g1A/y6OZ
	W3pT2yjRCxho8f8uqGRbJWQYsAcuzGDAQjCofkRRO2TNAG3zsRoumclF5T8aajIjnGgiLob
	xCIPfyxhFhvkiP2kh9Td/wCTT8HsKZE+0ExZPxkHmWOj+seT62NGnl383UVplohqIorVL5i
	8jcRNDxiDBKLeVs+LBi769irIlIW5cMeMLbPqwVQofCRKIVg3ao4s9dkw5GZpbAJ7UPPap6
	mEaAvBp6aYx8DTxBg8kaxBBJE3M3SbNj2BZX905mVmE3bYaeHbOyVlxcnPS7TQkDCk8+4Ih
	qwL3YWrmM2OlBKA1zpf1gVGu9kbdCDCXxDwvKRNfaaBW/I6luttLuDot6DjkcR5CZhNoJak
	Jo0vicI+2NEKG3K04GxtWiYktB6T7OiM5oqAKI4uP5KWx02YlZH/WUDGtlMbve4DfD1XGni
	Zqh5VHmOLeHoIWhwBaRIHInkFpLp/km0JjgBewVmMAo8gZpKJGFgZiY8ysW6DfsOKJVIckO
	CHcCDeNETYMLK0jp4+Jx6SPObYLFlSMJwYochYaE0Wv/Nk4QyBrNEkJnFgGgDADekNXHnne
	uWU1dsUtxK1jEnUkFAN5645ps/MqoOXuw3f1EpKHS3LE8n2knh6R38v0BmPkFbDB8VAVPmZ
	k+xLKmNpaG2Uh0l3GprdO8r05PlHHZMnAvU3LZaLTR1HFCLresnk05THK/z2ezRjGsUyOnN
	+LskdZm/AwgYPcZ4k5C3L0maG8uMjdfFFY+BjsTTsnYvL7WHA3rtf2QjaYfmq/qWMxqxDit
	OJ8vuCYHptj1Xc36WZ0+zNmx+A1sSTsiwG5DxffWt42RmWVO7tpd3dTWBDqykGMTGdbmv7T
	cjvDqOx1JUHmIM5TZ2Oul6hT+Hc8hZChPIYsFiao9KM0VYQcUv//AiAidZQAJQbtzYHCrsi
	KVS9MmkD+W+agPMsFGWXnrQb43yNdIvSDjSrkAn3EPGi2hHXmxigos=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY
as module to support USB2.0 controllers on the SpacemiT K1
SoC. The _UDC and _HOST are bools that decide which roles are
support.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..9a0b3847ff43 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
 CONFIG_USB_CDNS3_STARFIVE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
+CONFIG_USB_CHIPIDEA=m
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
 CONFIG_USB_CONFIGFS=m
@@ -272,6 +275,7 @@ CONFIG_PWM=y
 CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
+CONFIG_PHY_SPACEMIT_K1_USB2=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m

-- 
2.34.1

