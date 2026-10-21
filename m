Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.19.166.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603703;
	b=wHhIGxTmdZOw13pDcecwktBhuV9ur6/E5oxANzJueZD5P+WhD7qGdhlztoYQo1QZJSkE
	 H52Kf88G0zX32BTIS3OIfalhESobM/1J23fpnBvyhlzdrq9HSxPCs5+XSmDJygqGqsDBS
	 BMdt+5PmsY78QfbTjmz9t7z424GY3iGDpRvU9tVvQH4TaPs6826VoiyiG3J3kUuW6LFih
	 U72RPHcIgJ8wNFe0vIWw2AVIK6kbMAbAdLNJ5pEoOSwzHiXcgU2u6aJwX9gkCDSAPXXO3
	 vYVX3d8vbF0Dct1/s1+gBPa8MZqmWHQck92fvNfGY0Y+S40+mlQnMf8gDjMCbQHQxyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603703;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MIpBpQhGsJfqDkD2YXhEXuJPTwolIV4HSDydhYKKDxg=;
	b=2q3RTtYkuTdghMae9Ob/dUtiCdzgGE5jIjnqU47YVOrZjuGbTp0URyn7xUmPaHB3Ls1a
	 ovG4XLFRwEzx/80zHiCLWRWbEBVRN4axCwI2+P927jXz8jK0vqx/gEP/I96o0dSl6LbS8
	 wSJnlOgGVqELBXvnZr6AxHUBQ89L0CZVFII3ZJSPyOLyWBJ6cwgH0WMXXs6cl+WKzLxEo
	 hM0Er/f9jZ33MEvQ/alPiauFo27SkigYrj0L/Fh3w3PaUCGPU0f0kqhZucU+fNSa144Xx
	 XYFxM2PpBlPEZ/IisJZZ+PZm8lo0PGaFgjBHIqa2XsrmxbKFVo9ik1ZRB/A8dDWgbhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b="f/p7JIEB";
	arc=none smtp.remote-ip=192.19.166.228
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEE3606A31D;
	Wed, 21 Oct 2026 17:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEE3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=f/p7JIEB
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 98A71C0000D8;
	Wed, 21 Oct 2026 10:28:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 98A71C0000D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603702;
	bh=7YXMz6ICeOkY0HuKXHTL8W02G5699zBtL4gEQsBoYnI=;
	h=From:To:Cc:Subject:Date:From;
	b=f/p7JIEBqH++4zlYLGD6SWFdY0oXIIRoTNs1R11XWJGmkirvfaQMZgMncRG8mXRq+
	 McWOCcjKdsDHBLsUHe7eN7BcwNhzngDRixdRRTnsRExYaojm2w0zJ5Ks6HZAhO4OlO
	 XCQTmuF2uZCc1QP6XTlMmFJYQxX/OAc1gcLHLuaQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id F131CAEA2;
	Wed, 21 Oct 2026 13:28:20 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 0/9] Fix USB2 and USB3 on NSP SoCs
Date: Wed, 21 Oct 2026 10:28:09 -0700
Message-ID: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to the SATA patch series, USB2 and USB3 on Northstar Plus SoCs
was broken in a few different areas:

- the NSP variant was not described properly at the USB PHY level which
  prevented SoC-specific initialization from occurring
- the lack of DMP registers meant that the USB PHY could not complete
  the initilization and instead relies on the boot loader
- the EHCI controller requires some FIFO tuning which is similar to the
  XGS iProc SoC, otherwise DMA transfers eventually fail
- finally, the USB controllers are non coherent

Florian Fainelli (9):
  phy: broadcom: ns-usb3: Propagate Bx initialization write errors
  dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP variant
  phy: broadcom: ns-usb3: Coordinate NSP USB2 and USB3 initialization
  ARM: dts: broadcom: Add the NSP USB2 DMP registers
  ARM: dts: broadcom: Share USB PHY initialization on BCM958625HR
  dt-bindings: usb: generic-ehci: Add the NSP compatible
  usb: host: ehci-platform: Set the FIFO threshold on NSP
  ARM: dts: broadcom: Identify the NSP EHCI controller
  ARM: dts: broadcom: Use noncoherent USB DMA on BCM958625HR

 .../bindings/phy/bcm-ns-usb3-phy.yaml         |  23 +++
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi       |   6 +-
 arch/arm/boot/dts/broadcom/bcm958625hr.dts    |   9 ++
 drivers/phy/broadcom/phy-bcm-ns-usb3.c        | 134 +++++++++++++-----
 drivers/usb/host/ehci-platform.c              |   3 +-
 6 files changed, 139 insertions(+), 37 deletions(-)

-- 
2.53.0

