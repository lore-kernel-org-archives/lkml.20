Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.19.166.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603716;
	b=TxwqyW0gNTlRpL/NhWBqWyoQZlKhEJYvkTCx2kN3j+jB8NqQhzbx2VUoZFR7Bd8TWI5W
	 rkI3muvjuNSQB6HNUQY7QIbCDGHPbW16/a8LH5YY1SxTIaCF7zDOn0q0DHIJUIr32IsxE
	 6wk/lgOkyUvlb4MMjAfWPua8Cjl8fwuccwInsPznXVzmyCBQIzQtBNwPx7rxrHJC4++EO
	 ocgiyLOStc77nK9svSbmGtgeFsThMr0W4ODwdm+Q0yxwi2oU30qaOj3v1HOhnhDkMHcQ6
	 1nh5XGc0lC46rhDn927O9f6pNFqLkaGj4mqwLgp7t9Z2ITshuKW98dCoeQHKOdURSLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603716;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n2LWARo8MV/mGVlauERfT0VhLpTZNjWKl5HGBOJ/aaQ=;
	b=Ge8f7ja1xp2cZTgHdpudu2mGhV5ogQMzEo4QSVwWdXDXVtKkXgQVV5NErjgNqBiPoAR1
	 a1J/18cIu3r605y96hK/JdelWZqiLeGEtI+KSRpJYDFX1dg8Ajn+3N9KN5NRoP+HFOr2j
	 qRM/CmImBJOhCM8wSXwxHMzLo0RB6jmbPwOGStilr5LbuEbmUit4sbwiMi5vZo1Qu5vQs
	 q9Yf8NdSCB29uIC9znEHBKHdTGlG0y/bvIil95ey21ECvVN/C4jrSMVCcbNS1Ny4Qh6yg
	 ENICdPE2ANuowyCLEdaHde1eAvIjpVpgtOh7eGSXXDNlgcXvAF9rzhNjHfF1lqPxfeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=Lnw43Rjo;
	arc=none smtp.remote-ip=192.19.166.231
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE9160A3809;
	Wed, 21 Oct 2026 17:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE9160A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=Lnw43Rjo
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E52F5C0000E4;
	Wed, 21 Oct 2026 10:28:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E52F5C0000E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603715;
	bh=/JqeKYtSECU+27WszWV5PvE5N7tLSEr/HEiedmI/3Fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lnw43Rjoo7WMEr5lSbFj+3+vUdKB08znfjLSjETJ50yT6sgV+7DuXEtQ2zV0BzNii
	 5mbjcEFbF0NLteDVHedAHhh/fI4Sz5z2E8e712JupZGj2Wnx1f2narVR4IuUmsulAU
	 FR2MJFmpzaRm+uLS2m7/F6WZkXF0oBLCgq8GuI8A=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 4DA3FAEA2;
	Wed, 21 Oct 2026 13:28:33 -0400 (EDT)
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
Subject: [PATCH 8/9] ARM: dts: broadcom: Identify the NSP EHCI controller
Date: Wed, 21 Oct 2026 10:28:17 -0700
Message-ID: <20261021172819.668120-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021172819.668120-1-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
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

The NSP SDK programs the EHCI FIFO threshold to 0x00800040, but the
upstream device tree describes the controller only as generic-ehci.
This prevents ehci-platform from selecting the required initialization.

Add the NSP compatible to select its FIFO threshold workaround while
retaining generic-ehci as a fallback.

Fixes: 1d8ece6639e1 ("ARM: dts: NSP: Add EHCI/OHCI USB nodes to device tree")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index c3c33f18b92a..b3f0190d0d86 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -325,7 +325,7 @@ xhci: usb@29000 {
 		};
 
 		ehci0: usb@2a000 {
-			compatible = "generic-ehci";
+			compatible = "brcm,nsp-ehci", "generic-ehci";
 			reg = <0x2a000 0x100>;
 			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 			dma-coherent;
-- 
2.53.0

