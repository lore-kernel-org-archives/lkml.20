Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDFF526A8F;
	Tue,  8 Sep 2026 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861009; cv=none; b=F3XevroEq9UCS7d3ivsimdm7AkOrMMROaf14hxfykks/f3tdudfwxss6tl9Yp1Vdtd776SRO5tkUs13F2PRrJfqnsT4Cia/nfmIxm502BNlUT6FDty4ieGpmln5zTsOhPN9QX9LZUeI8pzKEsTz99RwgIXADcWhilAdd5ePfprk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861009; c=relaxed/simple;
	bh=GPWLpmaRDDt3mVA1ZEPJfXPaZTyfIi/TrBRNSZQi7lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0ubFwunEjNkKFgf/ShJXWxnJ2DG4VnpueW3cbNIvKqIbXkPIANXMcYYXbITiSe8mbW1JVIwubpA41Qnu4wKpuML88jsvhmK+8tNu4LqVT+thUsYgAbszR8Lo4R1nyQC8nvF6Zl02NKocgGZTlu2aUhOkxnWSzBsCwRzc36FDTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=l1WmM1Qh; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="l1WmM1Qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860959;
	bh=/BNkqzuX02cWhuJG/NBOMRq7lwA2Ms/b7iNVif1Gnmo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=l1WmM1QhbUQPoExrFh+LPTyQ6+FqfAJzCCp0W6wuB2V5zQq0GhbSS9ALOSZapO6kV
	 vogsuhvX5XWx+yK3PoG/4du/SYoq47giWSzLSpDPgv6tUcAhk4mjTCY4AvwCAqW6Me
	 KNba7+q3/EV0/katbA1wznuyLaDG/7zJtqVkcdSc=
X-QQ-mid: zesmtpgz5t1788860952t5e5148b1
X-QQ-Originating-IP: h5Cgcf4ei3ZQWW1PdQL0N7LIMCWcdJmyqjcubY9j15w=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:49:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5232426988612340040
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:46 +0800
Subject: [PATCH v2 9/9] riscv: defconfig: enable ChipIdea USB controller
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-9-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1038;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=GPWLpmaRDDt3mVA1ZEPJfXPaZTyfIi/TrBRNSZQi7lI=;
 b=QvtTY1HFJEMOR3xKMv3s1ibDIr5WwrGhp4cEq6CTCDYtcWhgtdtS/CJMJFI94FKM0vO0wkiQl
 akqU92hso/UDeObGvDnOaSXh76YtAxuBTW8AOLsiFPWDjChYW15BRTA
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NlN1EawlHQc+vk22C5Lc1bVvq4nBAf/4YUpljqWd1ZUmNXaDJ65kWERF
	EX2P/fRn6hHTouxIn6DHb9NGIg0J8MeRqYTifeJe0FZR+Nm5nQUZcgZImlC7zvDzQpHbnEe
	WZWWcjNCgnURuOuBOhn4I6k2uVg67Y2ppeeU9KZ11bIx2I8/I8pUi+xOnqkmNQZ8qIEcsWc
	kODljubl6Bbbf4XsxfSiu2sNkxwG0qz9L4RFKRm8sfiLaQtD+qfb5BncyoXwsZnEFnpDLXj
	xq6WrvI2C2ByvFcysEQC6tuc3s1K9/s4EWUAV8SBg7ncT0xvjplcvBtJvVIHDKo9Vw+QkcL
	ap+/9j1UiICfs/TucX3ELAgJBKtrsgzczzQ6uva8O+ZeLd9xImXwP8V7qS47WuEtq3h64F1
	qzrKeOIG/tjZkEVsaaPi3XpilcrlbYTLQNz6qq0mQIsrPZ19bwOyGL4p6qUymfcasXybO2e
	TSYpMUAUYxJ4ojUHyQ4503crnTQekf0D8HnMO8XioJ2WISDfqk/pHpUu/KHOKZW1nF5HOpT
	RIJY3Jah02/6vQaGcsPPNDNyXgGqmj9TgOhG1blEVQvDv7oUTUKyptp1yrBce9V3Kp/DpOS
	fwodueF14TqjAhAnmK3MEAEIkR0g51oyeWqIXUuxsnfp8PrImFJk0Ar6Oh8ssaGHt7LEIia
	ow0MzsndmO2IFRvYYIM9VENxjwqWzuiZfRTkCUdR/18p/hNWVImnRf1L0YgUfeNLdrduTE9
	5xljpgq+IiWWJauV32yEO9b+c/7RAj21775CYUMYdGY06DjUCKFE8krX1i45tR1g4y3mmJ7
	Sh2EZRjz0CSc8PyyCNhUDpdZzeZk8JMDR1RsDEwig1nvVlZ37Q9nYvENY0LRngYES0vWRG7
	P6xHiP/5m7x7JSQG0eKz95sRrSYDLUYZXlCA2k1AHdWsKx27ilQhBii2WtiCcKlai1Dqsgf
	RRes2M2DHTarPq/VvBrcHcEUozveehU3SpJ6AvyKZdpmhY8mQQuO9JhSWUq/+zYYsmB/VCl
	3lDzsa8P/7KxzWEuRVIYmiuZLfO5hbuBzhn6/mcIf36LfcUFGwt5mhxAT3HEJIIN1pnu+Gv
	F60OXqWbT3ijNb5XXoJhGj6xOLc/t/26C/WTtWGczVQK7FCtaKT3mSi6edYhdeUlazDw8xb
	Z5EiD2IZqDFjgqxqzfErkKbhNfVeKEdov6ap2wv4Of/EJ2xOQPUHoZc9QQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY to support
USB2.0 controllers on the SpacemiT K1 SoC.

Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..5b556488de66 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
 CONFIG_USB_CDNS3_STARFIVE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
 CONFIG_USB_CONFIGFS=m
@@ -272,6 +275,7 @@ CONFIG_PWM=y
 CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
+CONFIG_PHY_SPACEMIT_K1_USB2=y
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m

-- 
2.34.1

