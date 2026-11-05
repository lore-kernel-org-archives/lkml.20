Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867043;
	b=Y3WFV32+mr4DbOaevL+MIJBLbzqURVdiDfkHF+ixlzSRYuvveqv1pjnn8pXdoYOy3weR
	 EFXMRKeBF2y79pOZelpCtvMy73CzduKLM/5R/IOTBa6OF6g9NuEWNkCHBzg/uZbftpVk9
	 NueBO+pzOrl+HN9EX8pzVQRrgxEhFNmfAutYwp9tjDXHYGD+yV63nrVdHBnmqyGyfL0US
	 FJfmcTtuMQppDeDfMQiMK4kl1vJosRnIxMw+EW0xAevRCZmYLHCzCosaeJLyBP9fsQs3m
	 9QGFpP0c6cNfDRnk7GndnT8pn1L3GtBTqjkS6dl/MCV42XinaBTHPwKzKZE/rWgyt0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867043;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=hwd03b4oCgS4GqFIi/9dUHS1Ps5EbCjQLunVnbEDyFY=;
	b=MCBDHHPW/T8qvlBSBTy1v9NW3dj8wLoT5xbFCa9i0kU1tfhNtDulsvg1Esyn6tXnIGdR
	 6WckUfmAt0R11G5RnwYpzpQ9gRjt477cADSrlo7J/uGvA4PQVqJJ6s3sFUFCCdKsfLsL8
	 R3hLWqTmFbLCHigrST97iQH6fbUjcPzoj+y5NmivJXTgpJbKyA9hjfX5ANGi6k18dfK7F
	 1pTcn9R/rDhkaeTMMiDvvzbcCQCKs/vJB0yIc9Bc9353KqpUbGBdF8ATJ23szqd6BVU8s
	 MYhtoFpaDOnbqt0w3BjFUr00LChRVIvbBH0w9mhhEqMnNeFJJ3rFbr0IqlcPljTWArA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=XNlX2V8o;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EAB606A332;
	Thu,  5 Nov 2026 08:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EAB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=XNlX2V8o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867037;
	bh=hwd03b4oCgS4GqFIi/9dUHS1Ps5EbCjQLunVnbEDyFY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=XNlX2V8o4gxK3fwbJgrgpL8iXki47vuX4KP7v9thqTMj9CI3L38lkcsLESfYC/WKY
	 F2pTDaHTm4Wom+9YX0+VFkwKCVtk3qJpQnzQGTcEMTZjGYYIKD1Bc0eEp65qprdx59
	 zbXCsAAcNUkcM912+oWTY1xr4WZazKnaCd5EH6/M=
X-QQ-mid: zesmtpgz9t1793867036tc136d1f8
X-QQ-Originating-IP: 6MV5lNBqxWrrQ3epTJah2Gro7KiiQX2i2TCR0ZaOn8Q=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10439336763918379975
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:46 +0000
Subject: [PATCH 1/5] riscv: dts: spacemit: k3-com260-ifx: Drop wrong SD
 card vmmc-supply
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
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-1-138b39d74602@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=LrvbgmnWcLNmZtDiJKa0kTwRdFCDSwqAPnOekOW136M=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbIX5vY+V3WV/lSvwUZKn2XLjr/hFboWOxwrVT2/Vu
 HF2xUGejlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIlwv2X4X+mgKxP1Oez0areJ
 h7x729nvznmxfOo17eOfnV9Kzs3Tb2VkaNY+ZXfg/GZZ0TDRo7WcpbITTARvKN0Sm8n9vsHt2zY
 DHgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NKN94UTY3sl7+o7zXrGgWcyHfUL7wNRqGZyWYbNH8C3Mc5LRoSsGojsg
	8bWmSQzBbfcWO0V9YTbn1R9qkrzYT4b/NeyX4xKUNavdvszO4wvrTquG1NE3ZBlIVuMONcC
	9wvJa680R/UtNrnbz2lwP5ZNmWkfGbC22FU+nSNmz9CLyKbwwn414GMMD/Zsu+rxYyRrs/n
	H/2jqSMTljUjYqIwM0jMaW6FdCmWDh/yOhkoKGIrd9SmFxpBsGaBDCfvocKZPxorjkcpWFu
	vaKfIkColZYAB+gdDg3PymOZMiYqPY8rsovNgH3Vo0iTqV5LpOJh16IqvVYX25F2bAUojMj
	pJKOpke5zJr/Hj7rekCd/fAzvqlXm0zJG5To+ENkt8ldjVqHgGVDLTLHF9SLFPoZ7UHGXbC
	HRctdcqTyTuH4pWgoSuDChln5YNyK+Aty8qT4GTrpJP6RBM2km6XzuT0fTrafCs1cg/+3Dy
	9lwGMGqz2kRoMSbyQa5sYWLT51kh1T/RULKI2WlNC+Y6Yql7Y1ldc/xI6Oh5RvosDmPyZ9d
	KYxtxb0aeFIDFwxb6zJblwadbu0U53bAoOudfUZd3K3Obyd8Zav9G16iCIiHMRf84gqpB4g
	RqSfOHdpCnh6rMPjfi6nX2cyHPUxByB73FT3P7JtqP6i7BAUNGxeQqXvT3yDdA1IxVxX4ab
	4mrL0Nr4tI3P8PJOgu9rJaWJGu/cpL+eMxEH9CqivSmDwH3onom5Y3oyBRuPxcvHhDNW+ET
	v9azD+245hL7FtMlzgzDdxFUkNr6ZtztN7lOt1yuxskO7nTdM6Y8BC47vO9CKoimG47dusY
	5cOxhk0OXt+VHtgdQ/3gvuzdcLFsJSOEGURKeyb62t1CBTshuB5fvM8U8JYyQMWVijIR7Ro
	10g5dep56Hmo6TAU4n2TxsrYB82Qecmo2G+4b0Jgjo4UZ8YdJOzG6iwj8S5AowkPjYVXGFw
	9CWMxF1gGPYzJ/NSVb70fETTblMRSJjpMFQ44QzKHrMK/UJU2/GazquNiz98kR+Keam8qRs
	VzCJXpJPdkDYkeEq6AwrcIU7woPAyLlWSqhYVpys+TVV81Q/OCDNdYbatVhU0NiBpIjKuyH
	DC7f3DWlDtVEeuq5dj/922js5wXWKsL+f9TTkWyTSBX8olZ9za+W+Y=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The SD card VDD on the K3 CoM260 module comes from a fixed, always-on
3.3 V rail that software cannot control. ALDO4 of the P1 PMIC does not
supply the card, so referencing it as vmmc-supply describes the wrong
power wiring.

Drop the vmmc-supply property. It is optional for a card powered by a
fixed supply, and the SDHCI core then uses the voltages advertised by
the controller.

Fixes: 055044260e7a ("riscv: dts: spacemit: k3: Enable SD card support")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index fadcf28389be..6e295bc6f196 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -122,7 +122,6 @@ &sdhci0 {
 	no-sdio;
 	disable-wp;
 	cap-sd-highspeed;
-	vmmc-supply = <&aldo4>;
 	vqmmc-supply = <&aldo1>;
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;

-- 
2.56.0

