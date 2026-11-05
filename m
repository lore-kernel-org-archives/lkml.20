Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867059;
	b=goQjBf8sM8gmaAKAdc46tQoGXdbEwQxGWDR/29ai23MTcDDt//Eg5uXopNOqpLGsKeMi
	 Im6Zw0V9CYVxkKKizU7pXcjbAT2ia6nNub+9w+I4g05eRBBBtpPFYkvnMw6TetRQ0WNxm
	 0SWbe5qFwzKZaaIFAn4TeFnA6vMKMO9SUaX37NU5VCjF6eLXR3yHyDEQxCoprid5de81b
	 ehzYzcxZwHF01FL6ZiWlVmyciHWEF9u+6ILBp2ZcHoCmAfsTsHMSllnQdW3ExS/z9fyvY
	 y994JY5hrbSrt3/EJ7bAoHujAdGxHj63NgMfc+Sl6TRcRt7uJcyKbOC0iKJioz1G4xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867059;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=BeP9abbyuRADpO9tnoSCSAKZO63Jhkhje3D0pWwoNIw=;
	b=aQI16z5OB+aWYdEJPAXIPtAuOH1cj/p3n4kHFOfF4suCZkdPAWcM9983FfXB00waCt2t
	 ukJh9D6lKwWrm0Fv2/u63HNfZqUU/kRKtcpz69tjGkqYn7A/KJX3+IYrcL0ML66OuvX8u
	 n3MJlv+rmu6KjI6vqGM6Y021T0eCaM13U58Dt+5PwsaGIwM2PSaIejLzbKw8d+OaF8kwT
	 hAhzxfIqdoLbeAB6Y6XVvIcWfvYXjf6ST3IVniFdamUkHvskTN2Uu/aUCv1Boix1GsWMH
	 NW44KiZAEqlL/bYm2a4f2QAxQgY8NBUNW5CUXh8kVW4uA+SHtucKvcT6+mcCKB/3H0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Iuz2OVSs;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7685606A333;
	Thu,  5 Nov 2026 08:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7685606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Iuz2OVSs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867053;
	bh=BeP9abbyuRADpO9tnoSCSAKZO63Jhkhje3D0pWwoNIw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Iuz2OVSsP8SPiXTU/qhyEhZS6w2BtkyvrKE8bfjLM5H8pWcujjQTzO1QecB1jIxJE
	 o7/8xsnk/ew+1gnya7zy92QRi8gAaYRkCMmH/y6BwtwQc468ApghSaGdTnxSO/QqLA
	 wg/0NDbGAI7m1iOjYMx/Yh6CE/L+so5mGImlnfNU=
X-QQ-mid: esmtpgz11t1793867052tca6bfb24
X-QQ-Originating-IP: feuNNwSfwKUpywoniGYAh6GBHSA4qT2mk7H4i1Lilj4=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3347373038067916414
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:50 +0000
Subject: [PATCH 5/5] riscv: dts: spacemit: k3-com260: Set Ethernet MAC from
 EEPROM
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
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-5-138b39d74602@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=qFPgZ4k0mozVoqhTFNoQ7QRNK6lvGtsHRAAIgvK5R4g=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEWuzf34v61HMVzu9qcVXXnaf8Mje2Mi26c9/9S8x
 +d4ngxrRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwET8mhj+KTK5HtkWlH/5ysTk
 6JAG2aLCSxecgjNOJzAzrJ1Sep/tBCPDtqTcmyJ1VqFVLFkRz9c/2uO1/tmC9IssPKfPbb764Ps
 iRgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ObGqnu1uf9U4St7Z7FFq5uIvvNVYZr0+pFdybbVRtD5EF5aReAmx6dmq
	hrdHHaAL4VhFgwDZMNXe2lRtU6g8fPTydO+vQN1+rOPI5ZNassUUhU4hBPnwlOmjIFVA+OM
	QXiGxIORIhSD3pSb69fj/SXTXuViZXO3xZos6UKESUjlADztVj2vQrE+ZMBak3sSk7PD2K0
	20yzftOqNWIdgQO/dEApHxtsi40/I8uCPKF+K1CRhhqJWxZ5aHXPogHZJATUuKE38eB593Y
	tSZ5Z6XoETepB2cZDFQ6+bMBYpDrZ1t/aOzHZ5IJBf0dFKYGchLw7hPlugbk38u+velmK6z
	kOH6EOETrDp7K/0N7X322lpUq/2hUxrsjGvVrtU9CJYwb4gNTVNrxwyBJpE2RVuWYb4UVZn
	TGpyD7wxJPNh/fcon5N3uxzycW0N88Z8+OMxJ7HCn/PUnhURQMcF1QP8DJy83pUXkaWbsWP
	+qENCWjIC2KDae8voxJyMNE25epWx0sPLmdY/gehNy35s8xSN8tRvSZZg2JRPgTURocb+VJ
	LUAkaT9YIxzz3vQAFPtl93IcC8btMpALdtxLHpyFQB/KE3kxsJueztd6+tEMVhpXxKrKNwM
	oNBEtPixMTDNZxMpmAXNhxSPVcJS8fvawVTW3LCXGRhGA0YE+/OgqXFw1CR3DORtVF5GdCV
	T+KwQVJuw2xgFkW/etYPRKwVLf142sHouesDkzI88hJwP8f+QDPBTU4F1eqmehAfJPaJvKf
	mBCz7Va9v05uIbLrDyWqcTzBhDHfkThnExzY9mEQ6YuxFve2lUMgyUudcqLHpWCVAWGV4bC
	0byoN86Bvj1AV9YMhHEnxvzYQoAiCD8dws+h3Rtur5VZxBPbbqLq4AGxtryT8awgnDtL7+g
	92YYWit9wucrK2zSgdWySwcjfw04qYXbUhxNZQe0lHU6vadRggWH6iMO1cxl16MEUbUD83a
	q1F6MhwjQzqakZGGO5hgjGQ51BMxvKvZq6ULgtq9XWxCWadydttfNkxtepogaKT5K3PIEms
	Wbe523A7bzXdC8bIZgTcm8lXTNq3COA8oLq3UqotdDhd5HeBDq0QnOzi6J/NK5sLXk0OHkb
	HytelMlnZu11/CJ6TWzdsioj0jcQXDp/Y0nA1a7kCLwKNZVxcx/u78K6mvp+20Bdw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The EEPROM on the K3 CoM260 module stores the board MAC address in its
ONIE TLV data. Assign it to the module's Ethernet controller, so that
every carrier board using the module gets a stable MAC address instead
of a random one.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index f94607cb2eeb..1f5c958c9d6d 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -42,7 +42,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
@@ -216,6 +216,8 @@ dldo7: dldo7 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac1_rgmii_0_cfg>, <&gmac1_phy_0_cfg>;
 	phy-mode = "rgmii-id";

-- 
2.56.0

