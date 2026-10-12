Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F13D1709;
	Mon, 12 Oct 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786690; cv=pass; b=jUHEE/WzUhEVcOUKywYj4e47UkzOutWB2650Kugb5+CB4+6cVJYEyNk7mwoIKRmgBh/55hdITrDbx0WovsdNh8vc7K9oJ/ESSFDvne2I0XjaBgCRY2mDyEkEd1L5zjUltetFBhp45hK2Xn/oJZleaLwdT9Q2/W+vy/G4Vh7yGNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786690; c=relaxed/simple;
	bh=423yVuUc90HmONuXNkP5wWTzTYT7Jwx2uAIEP4GzfrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqI6ttgGIajngNeqFoAH7wKYfPZGNrSWdQT1jV73K6S09kp87GPO0c+EEqNcR9a4wXkG8LmT5Z6E9QDAGRjRHquItNvchYsfOHuvSVHtdFowuvdOGivzGKLVTW7TxJwCRee+vYzo2e7WcnlneGK5SCHhSXRnz/lh7sOQ62f8yXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=FaJOmfKQ; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="FaJOmfKQ"
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5CD9B2004B4;
	Mon, 12 Oct 2026 08:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsfldqW0RoQzYlaDX/r5s4QUZHIjZI50DQvuMjBx9x4=;
	b=FaJOmfKQlac6JSlJVVODHNe9WgvGuZ6EZIJMYMrAg+lvD/UIop/8y9y2bPXwC7ylQMW9oJ
	3XTB4Bn1/QAMTh2SQV1MBldsWkOOiUk5Tv1AebKlGjUgVgW/rq5d9W7vAsSqThEUcdbWIb
	R+641BZWOjwCVGEhqewwUdP0lgUEk1qqsEiXGmy0A29EykqliOI42aPRb6keOSd+rGgTyz
	qNVxI3OGjntokJXkmUxBPTg2mifVU6DYyiRiS57/EqIx3UoqdGsCtOCz9Y1w1IgPdnWjg3
	NSrb+hk9XoYVPW7zeUdGxLNAIrEfrL66B3HQ2MpWPPqWIsps6FTgpSJa1Li1UA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791786679; a=rsa-sha256;
	cv=none;
	b=gKwTOkX6NNwiyu/Pvlqj1fNVcuj8edA7RbQTMq1mA7mp+SNtUXMdi48wTHt62KzjO3Xw1N
	LB/ZTgOJuSAnaLwpCimUIhxX0QAkGVhuU19sh74HZqHWTLPRyGPt6IN+3NpdBFq/DVjrqo
	a+v3M4Jwo2KrLY4HhU3lTePMsKZ0DTJekiPBAzSnQlUFyDYm74GWTcxAuIc8O7fY1hiy3d
	tpRqoic0JdIVXqMjyXpLXHgP3wf7JRJ4RKbGdOKmAoAV8t2pw3QqXeCCPbAzSy8fScpbcm
	FJTD2+5fWWSCR4rMUSXVsBXXFqgUn215glEUbMbbeCyfv27LxZh8xzQNZmguRg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsfldqW0RoQzYlaDX/r5s4QUZHIjZI50DQvuMjBx9x4=;
	b=XtLxnbEke8Am967qB6tABpLuWwei0xC64wjPBLIqcyDNufAlSmUH6Znzu6tmrtSdoy8HWA
	WWILs+U2Sw+4me9wyGOwbkPKuWqQikPbWHXhXEx0XQkVueunvx2L+Bjw5ueziNmaCCs0Bg
	Q0Fgxyyl4mz6uw4xWoMQvdf/2eD4AVrp5FsYZPSaGYnJsRN2sSJTArRbwhyhJGEJalour2
	lLZJ3e+o1UEhvydD+S0pvf2tC9EzHQhWw4WmpTA8CwxFJt8gMJtAJCpzS7Di7ZhsDASLQl
	XZfZl5+sC9amgQQ8jhiZdyYt7al3dLf+1fIYQ6x7o7juLByStOR0hXac2QnSiQ==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Oct 2026 08:30:30 +0200
Subject: [PATCH v10 1/4] arm64: dts: freescale: imx8mp: skov: fix sort
 order
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-1-0906e57486a3@pengutronix.de>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=423yVuUc90HmONuXNkP5wWTzTYT7Jwx2uAIEP4GzfrA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9aZum0G9yOzWgUux0QdOHL8ymeFLTOvn3Frdps37cMsu
 dp9jFdvdpSyMIhxMciKKbKoLKzgE/X44Bk5TYQLZg4rE8gQBi5OAZjIdm5GhnZBr8CWiy8S260D
 b0rVm9opHIuN/714+aNzcZadnzganBj+Sjx9l9l66Z3VRsn4vN65hqLamaIKHXmeeRLtU85qvLD
 gAwA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

The imx8mp-skov-revc-jutouch should be alphabetically before the
imx8mp-skov-revc-tian variant.

Sort the entries in the correct order.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..475e1ad9116e1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,8 +707,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb

-- 
2.51.0

