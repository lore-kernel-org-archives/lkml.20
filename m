Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867047;
	b=HelfVUvz0LeH2Ytz7OS1vUQVMn4Al/zXckqXecTjv1VGPWRjhh2QfsRFVSCQofGHgfsC
	 wJRTFUxKeZnW0jCkwW1E2FA1Ga9sFfU3TosrBghA0DxSK+IbuxxDuoyvBePuaa7VBP4HS
	 N9gcz6nWNWyWVo0YVcNxDQ7f827xvpw8OjKrgvhXBsCDJCwVfPJzdnVxI8TyeddRwAvSj
	 kuR9bzI2VubyKQtIZd1sIwnfhzFKFD2YNQAuNSmUBAacd4ngnQyYpZtBntXApYYB9x/r6
	 vgejxMD2/zOeTihVti7GWCAIqTOf/PLLH1TBAg7j3acTmgt8js4C9JUM/eJBaetf/yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867047;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ex5QciF8HsRuD6/z7Bnz92BFaI2r9RvhM5A2PdC/ryk=;
	b=S3lZQFe5FxOjlOCoIu3jEyskvRA5UnehViZHLQdVdeOQ5oiwVFwTgepyc6o7g5PZ/q/t
	 2TZvx+Q5O62HqbXXHMoPsuFHCJx8hKk+NQDaePkOCJ/xcVvv+P4D7qTlkAkB2EEmmrZs3
	 ANXVzHj9yjvXOWjS9IECoEo7TGK8yMfgC0JYosfiwmv0Gwdj7HSYtPSjatiVk2PErB7ra
	 UD97fmWwsLF1LCXysIVb4Jk9Y03sf6APVRM8wlYgcovr9jznqxWIgyaaJ43s9ZSl5+347
	 ZzgY/Dr4eNn/aNqUURPlKoSAUiPONg8rZOXqYDUAijAT0VZG00VH9+ln9H03VZEA7Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Z7Gzv1pN;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5AF606A32C;
	Thu,  5 Nov 2026 08:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5AF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Z7Gzv1pN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867041;
	bh=ex5QciF8HsRuD6/z7Bnz92BFaI2r9RvhM5A2PdC/ryk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Z7Gzv1pNIRsi/RHiP4FKeCMUkVPycGpijYIRBNV9Sm5DI3aBOZQqehKfh0Sv5lSv3
	 w32LwXTVCdCpycOpAAfPvRce78S0CWPJHoEEmteMwtz27vlXcCw+wccj6pbi8sPeYx
	 iJ5yFiNdjF2vrth0utiGfNiOe4WW7rMFH0tKcPf4=
X-QQ-mid: esmtpgz13t1793867040tc4a0437c
X-QQ-Originating-IP: o6lwSprFVEZUSfcqPwVGLLBhBzK/F2cLTxbydJuQmYo=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6585883940759934299
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:47 +0000
Subject: [PATCH 2/5] riscv: dts: spacemit: k3-com260: Move SD card to the
 module
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
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-2-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=FW3v+X/LP3K9lLC4PILHOwlmTUeSvDKD94xp6NZYOuw=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEU+GO6Z71S3biWL2vpfdyr33M1fULEsTOfj83188
 teffDO93FHKwiDGxSArpsjS/YBnW4FPlG2BQKEvzBxWJpAhDFycAjCR4GSG//lqBhuif75SK2DP
 b71lcDZhr8OHgH8zj/I9YYzX3zclN53hv4eEAX9EG9fedYWtMwKvOPJkBK/8bNzxWn5BTqPJ1AW
 mvAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OJbo4+U79zDvIBaq/Lp2hRBVs4PWVXwKoO5+Eg8Wz/eheP31kxVRyaAc
	Bqh9D/uKG9LMXj+gUS8MyhIYfrSbIQlO0scSPwVynPtR+g8fD7HchvsqJIYdc3GRaX3ecM4
	kaOstvSKS/Da7WFA1CtRDsOqUWrnxQPX5MY/kvMLtp/lrQF/NIy5C/jHZ+pCkQtdCWbHntZ
	8LXxlL6OMjirK3JCgU/lJluu26HHRJwkY6LLdSIv2F7BU4n9Bvq+hvd/vfspiyvdBTekU/Q
	AUtM2D8+gKjQ5n8AWorm4FY10Nde6wlcPwv9HwpgOVWpOfaWCsoTN3I0kPBlvG5Ar3OIQNz
	Cd9HrG3strRRhcz80BAIlNnL9gy6MaePXY0QYBEFNCULejyFJgGRzUpne6iHwB6XNcicucr
	P9faS2t6xmvee3jDX9d5XSVGhddC0AxVZhXeqtVUbDY1R/7uP+X7AXPq4XkWUPqp94RdVvq
	RI+UDirsYznlCx0yBij8ZlwsyMgAz7vlqbmGKBvc00VLGRFfTxMWjn9NWPcJg7WBMcsp1O0
	sCpEvSN+oZbY6wRp/0lZBoNad7QZikcrVr8cZQpi6JAjxPErd3rif3eF1/i/fDHHZn9n2Mo
	xXenKIwF6MpMRzCrGRs7ZF4bwEQIaW70kydaUX5qqaxmCj4p2ZAqQiRKfgMpLv1TzwBotnS
	nilq+KTz/8P9P4GPzfExg47WIK3eVe00soqrrmB65j0q9YT51w7xXtaVkQ1dZDqUm1MzB+7
	NXgee5snv/UdTjFPlcSPY+DB8uLNjDoZ881Dz9kZBdEg6sS+Gx6tcK2FZ76kZR92XITs0Rq
	/guzEZ0x2TToDszIBky/3XJ8KBHRXmAHgQIGMX59DCpCrt756rn0ZZx7bRBk9zRKBNt88LM
	7sEmq1ZiYin9x41m90dZ/JrkGacizcLFge7ijl02pZ/binOyeHmKbMvc5hS/iCv1eLuSjsV
	ycPpXbePvsIEBtY595DqjE/Gas4jm5nWAxZS8SGCDApw06xBHXlaY3dqJYO5i5OFqDqDODT
	aBhPYvSJuhhaovqjlNex/2fG4qiPUqXuJku1cfvpbDt5ya6ln9DMuNgi3//aCS/zBh5FdSR
	yWkcxlysBgqxphWCZIHYzCLd107np8K6gV/p5L5E74j2/9gacVpr3b859MVTb6DHsh4jOLY
	hVhqE3W/EUv0WB4=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The SD card slot, its power supply and the signal-voltage switching
circuitry reside on the K3 CoM260 module. Describing the slot only in
the IFX carrier board leaves other CoM260 carriers without this shared
hardware description.

Move the SD controller configuration into the module include without
changing its properties, so every carrier using the module inherits it.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 17 -----------------
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 6e295bc6f196..38809d01df82 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -111,20 +111,3 @@ hub_3_0: hub@2 {
 &usb3b_u2phy {
 	status = "okay";
 };
-
-&sdhci0 {
-	pinctrl-names = "default","uhs";
-	pinctrl-0 = <&mmc1_cfg>;
-	pinctrl-1 = <&mmc1_uhs_cfg>;
-	bus-width = <4>;
-	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
-	no-mmc;
-	no-sdio;
-	disable-wp;
-	cap-sd-highspeed;
-	vqmmc-supply = <&aldo1>;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 054bfff7413a..f2df797a2c80 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -233,6 +233,23 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;

-- 
2.56.0

