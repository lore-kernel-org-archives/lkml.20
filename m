Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.19.144.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603717;
	b=2qnpxXVdVN3yg1j6qcf7NxzJW6tGSu2PHxwvcyUKwbn9k3iXmNpEcAJJyIV296X98/Z0
	 p+OTvJBSHf4b9Y3kpG4DDeZ5zudxAZjKgMvS+YE4zxfqLV6xSFWs3hKw+opAur6PVNOis
	 6BszSJxYQJ9nFQZM2DhCGHZCAEUwq1tw8Cmn9eD0WHo0fIpigNR+ImSh3NRMP99YPNlqZ
	 HaU1+FkfBjGytTPtKWYMb+S8N7wJxeqPGivirxnAElQOv4hCeQoHTLjkfsy+8dUiCjRn7
	 9Gtkj1bsvvgV+oVwxi0g3fti3SkDr4hNHikOpWCUb8A5T9OZuDj7yxmjrf+1xRl+CDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603717;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i5y9Wn4Q8THM2bDdoKlwdiambKkhALCwKJfsk0HKSgc=;
	b=4zP9llRPapB2TXoameczglKEaWBL3CaL9LLf8zPYVgocNLnYca4auwTU4svJqov+5VX6
	 aST/UhBgoYev8+itXbn9JrSeGCOLgGxhBlWJdDNCnRkOaOo6n61PS0M3x0oBj1xM3oD9T
	 wW53npZyAwdbsK/Z4tqtWSnE9hEgmk81YhK8e1wpn3HOJ7zUBjwEipVAjfpdXtt++eZp0
	 nqgedG403O2ybIYP/H/PkggqiNxDT4aS9nraxtx/91aVhsXZI6KiI9zvhOFYFlcE0xzLb
	 vdskFSrYvD57NrQjDFzBcLwmsjGVN2HYKmfbfwYGq/7XcoxVjMF5FuBeegBHnzbHJDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=ZAW7RLwH;
	arc=none smtp.remote-ip=192.19.144.205
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3740160A380F;
	Wed, 21 Oct 2026 17:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3740160A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=ZAW7RLwH
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3D950C0003DA;
	Wed, 21 Oct 2026 10:28:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3D950C0003DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603716;
	bh=juJmb3giRDQiI6RF7yM2p8q0loJJuWRb19tphTj3ShI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAW7RLwHNMSk0voMvsDayy3hczNulS5nYCZWZGgbr94SPc0mIRXzpqsaBm8xTiSOO
	 ogPMtJb6co1VGRcC4CgUPTsqpg1DTBVvCWIWD/y/IzQYLMp8AjrmQqVwJjc472VSMX
	 ptycaSPhJjoT7fjiCcjc6xCApMChr2txpor/8vtE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id D00CBAEA3;
	Wed, 21 Oct 2026 13:28:34 -0400 (EDT)
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
Subject: [PATCH 9/9] ARM: dts: broadcom: Use noncoherent USB DMA on BCM958625HR
Date: Wed, 21 Oct 2026 10:28:18 -0700
Message-ID: <20261021172819.668120-10-florian.fainelli@broadcom.com>
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

The USB hosts on BCM958625HR fail when using the dma-coherent properties
inherited from bcm-nsp.dtsi. xHCI aborts commands, while EHCI and OHCI
report fatal errors during enumeration and stop servicing their shared
interrupt.

Removing these properties restores high-speed USB2 device enumeration
and SuperSpeed USB3 operation on the board. Use noncoherent DMA for all
three hosts so the ARM DMA API maintains their descriptors and buffers,
as in the downstream SDK. Limit the override to the tested board.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Fixes: bbe526f55b60 ("ARM: dts: NSP: Add USB3 and USB3 PHY to NSP")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index 0105afeca748..c896c390f042 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -86,6 +86,7 @@ &amac2 {
 };
 
 &ehci0 {
+	/delete-property/ dma-coherent;
 	phys = <&usb3_phy>;
 	phy-names = "usb";
 	status = "okay";
@@ -130,6 +131,7 @@ partition@4000000 {
 };
 
 &ohci0 {
+	/delete-property/ dma-coherent;
 	phys = <&usb3_phy>;
 	phy-names = "usb";
 	status = "okay";
@@ -255,5 +257,6 @@ &usb3_phy {
 };
 
 &xhci {
+	/delete-property/ dma-coherent;
 	status = "okay";
 };
-- 
2.53.0

