Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.19.144.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603713;
	b=SDGHuIf7+5Eft5J83Z/27TXb5q5gO+szIF4ojh2tUuigldR+srrNaV1KBY0SD2uz/zb/
	 lPIa6Jp9EmXf3WRQDFVn1jo/UvEQHpHhZ3xaa1vnfHdV5cK40d9lmM0KXhha3c6DV5nfZ
	 Qw0Uz+x8RPkpVbQWrp49u60GxfyfPehLdoY8xIZzeR/ph+MTmMiDDJ+aACZPLr7ipEOxU
	 LbiSYusqNn97nXYhtGelPKQkiPUl0Pi7G9QaqEcFmM0d7xBhA3ngh8i/xi+Q5+9SBHHpf
	 qZ6tSkYITQUYHQ6DG2TJVVkBSkdlpnGYAXzESSCa03beLXw+BqFuyynBjZyceBW9P/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603713;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dzbg2zxNg9TMlTzssEP+a2X6U+i+DC/oc+2adV0rwBw=;
	b=OM86HUpoUlJpLh2E5wW/boVm4Hql0CUv79SJjHWqAPas4eGIiuy8bOgBHphSmK0+xpKR
	 auud+QNjYR+ilV/YJEZOC7rO7PaMm/IPjE41DTvL5Dg7cFIOLhwv8P0NZIbhEPKV8S4hr
	 +cRaPna/FYlN7IvMLiXQIeuxQlGiTwpG4kYUi+OD6JNvSDll9oJP7D5frYRCGu1jcllQm
	 OvvXRLTnY61KPzRSdge3xCtEH3hBSmomF81ArMk+fdAJcVLdvgtoJM74JsmFFX+eR1gvu
	 iTFWJEpuTtyhLGJSgFDaUGSuoP2Bit0Rr2RD9VwJMRXdsNVt7JKa+ifblYW2vIk8iKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=khv1zKk8;
	arc=none smtp.remote-ip=192.19.144.207
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7D5606A324;
	Wed, 21 Oct 2026 17:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7D5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=khv1zKk8
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 99FA5C0003E3;
	Wed, 21 Oct 2026 10:28:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 99FA5C0003E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603711;
	bh=mF4gui/hs6R4l2uxd1JaFeVQL1X3LWEiSwJpnujsdW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=khv1zKk8stqHXizhingF94HJhdnUtHqv58PX1v25j6cQ171ay5Zm/YleJckLCW13t
	 FRZtSEqPjGJk1drnM92w8NChiVxjfmGSyn/ZdfVoJgiv5+f/+aTpf8FLLs8KiHDoEF
	 ERSbFdsmCA2qJm2wEXQEUmv7Al4jywgmLhQzwhNo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 385BAAEA2;
	Wed, 21 Oct 2026 13:28:30 -0400 (EDT)
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
Subject: [PATCH 6/9] dt-bindings: usb: generic-ehci: Add the NSP compatible
Date: Wed, 21 Oct 2026 10:28:15 -0700
Message-ID: <20261021172819.668120-7-florian.fainelli@broadcom.com>
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

Describe the EHCI controller in Broadcom Northstar Plus SoCs with a
SoC-specific compatible. It needs the same FIFO threshold programming
as other iProc EHCI controllers, which generic-ehci alone cannot select.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ae9fb70d0212..6462772b51dc 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -48,6 +48,7 @@ properties:
               - brcm,bcm7420-ehci
               - brcm,bcm7425-ehci
               - brcm,bcm7435-ehci
+              - brcm,nsp-ehci
               - hpe,gxp-ehci
               - ibm,476gtr-ehci
               - nxp,lpc1850-ehci
-- 
2.53.0

