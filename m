Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.19.144.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603707;
	b=FclPfbgiHQu1yqD8xFh3Jv2ic+1yfU7DtaXTl8kSSzJT51rzeGi75Rln8n9c2WgptuHm
	 zthYKwkXM+NqtJWkhaA1wXjechUZWUa9QpTJ22WlBzG0noKzNlZfRZRxf/C76joreim5x
	 GTPANcvavnRcxCnt/JZStiXydV81N5IbJQoVL3A8dluB5c3hpiJPw1Ei3XabeejqSCgFg
	 9g/8nDntNtO8YQnjoG6niy+K779YbOUgkmAx978PjJHQwhb/SuVFP8NijIb0GqepeGV+y
	 SfkkajpLVkUWgX/ioEpAMpxKCMgDHhPgmsnecmerIRU/aKlv6CC+P+JOXxNv+kblweg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603707;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZdsRy3FdNj9Kswl3REe6DGR89Sl6i9oOncs6NvWhlhI=;
	b=QQkFJu1SNak7kDllOoUatLDTJLuMp6wwVpCzeFXl84UTlxtZQHmn+zFZGjTYnHmU+Gqp
	 AelYEZOCWr94UsKKH73H1Vz2dwKH0v/idXRBCbcVIIblnAtDDgVaHauQyOKcLIqTNyOSy
	 U3YFvT/SACEtYkXKeuZPBGzLviv8xlmZqKfp7G1nYASaq0m9qvIocx9IuDssOWZPZjpYv
	 HxOuAUFyQltnIw2xgHChaMufwyxPYixdDHun00A17a6gql4k/JeraZCrg7BKwFmlxvT5U
	 lPMA9qoAfZr91+QQ7cjz+ORXBBKjC4TFbuj4dUlO2ZcvNTCi3jV4ywOXV7iwrKeO5uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=NDLGehXr;
	arc=none smtp.remote-ip=192.19.144.205
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA3F606A337;
	Wed, 21 Oct 2026 17:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA3F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=NDLGehXr
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6F7EAC0003DA;
	Wed, 21 Oct 2026 10:28:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6F7EAC0003DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603705;
	bh=FtqWf2DPt79qNMVOTUeCCsa1564XmuQp15xUpDs450I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NDLGehXrkry6eXTAIRQNMA8nxMTkQq0yzevWo0m07xo2UhCstGiPHLXmUIOsqfXGG
	 I/+lG7M+N/lQZ0/zuKsgZfpajrtZR0/88GlnAxSDWWuAOT9oF3HhJxgpJBF3jpqmAU
	 /us/ByY8Wa7wOwOPAwS8FH2SJ/YMqU6V0Lqsn1ks=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 0DDD9AEA2;
	Wed, 21 Oct 2026 13:28:23 -0400 (EDT)
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
Subject: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP variant
Date: Wed, 21 Oct 2026 10:28:11 -0700
Message-ID: <20261021172819.668120-3-florian.fainelli@broadcom.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Northstar Plus uses the Northstar Bx PHY register sequence but also
requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
clock enable.

Add an NSP compatible with a required USB2 DMP phandle. Describe the
shared PHY relationship with EHCI, OHCI and xHCI so initialization
finishes before any host starts operating.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
index 7fd419db45d0..00d69b86cbff 100644
--- a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
@@ -14,6 +14,9 @@ description: |
   Known B1: BCM4707 rev 6
   Known C0: BCM47094 rev 0
 
+  Northstar Plus uses the Bx programming sequence, with coordinated USB2 and
+  USB3 resets. Its PHY is shared by the EHCI, OHCI and xHCI controllers.
+
 maintainers:
   - Rafał Miłecki <rafal@milecki.pl>
 
@@ -22,6 +25,7 @@ properties:
     enum:
       - brcm,ns-ax-usb3-phy
       - brcm,ns-bx-usb3-phy
+      - brcm,nsp-usb3-phy
 
   reg:
     description: address of MDIO bus device
@@ -32,6 +36,13 @@ properties:
     description:
       Phandle to the DMP (Device Management Plugin) syscon
 
+  usb2-dmp-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the USB2 DMP on Northstar Plus, for its interface clock and
+      reset. All USB host controllers must reference this shared PHY so that
+      initialization completes before any of them starts using it.
+
   "#phy-cells":
     const: 0
 
@@ -41,6 +52,18 @@ required:
   - usb3-dmp-syscon
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: brcm,nsp-usb3-phy
+    then:
+      required:
+        - usb2-dmp-syscon
+    else:
+      properties:
+        usb2-dmp-syscon: false
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

