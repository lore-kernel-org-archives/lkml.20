Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.19.144.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603714;
	b=NQCz7cjswR9crfBJYK6P0jUZT1VnHfaPRBxJ21rZ2lIECJU3bozPAOY2FVaFsqS2IZp7
	 gaDYRqcZj+lykN9amWN8M/xPyMpC8lkVTt7kglZ5Fe80HX7ApJEpQ6D3AxIDnCv0YetJS
	 zQMCu+wbV9Q29XS41esRMhyFr8B4UENu+Bm0E+i9Ah1Jgjago6gG3vVNlmx7ty8rQT5Gy
	 KQk+6Q2A2XN+B70dRtuQkO79AhQgma/s8csRFh7rUFS5311wazMc4MKRkXXMjdWRfvmDt
	 szsIHkZ7nVmtrCVSZ7xXEa/axAmDXa5CT0aLC7J4ecglqVvfZ4PAZ0E9G9Da0oLeo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603714;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zyXSnCfTEpnOWhw29g/QqZpDVx5J0zovKESBV3rbdb4=;
	b=jRMtdfTXA/NES/p8f6hmV+Yqeb7vxkgu4WPm4eFVFivwuPtbRdAzJ6K3+sNW54+4wn3i
	 Cmvz3nI1g2CHbsaGfC9zNSO7arjDSMSyagt5QKnxzqBTFNCxeCY3pBx09XjDcvjR8JfRo
	 kRTtejV1HPi9fpteAyh/BB+1DKQcvHYCsxerYH4k86X1uGbC3hL9pwoJXlubx5p/u5R2R
	 G+JyYkSW/T9sJG1lXYKlGKyqgHiIl5NjZOlPKqj1zbaK/pb0iz8XattCZfgDcBlEMWFjd
	 ORkejfM8d+ZosJPR0leC0+J2672XwFpDaO7cW0O3P9NQoNwizEjItO5i4dbtKWiFidw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=DW7hxfy0;
	arc=none smtp.remote-ip=192.19.144.207
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA360A262C;
	Wed, 21 Oct 2026 17:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EEA360A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=DW7hxfy0
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2A884C0003E5;
	Wed, 21 Oct 2026 10:28:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2A884C0003E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603713;
	bh=dHCSdMsKqyCCI6GLMa/Jp4jpFOGO85lAaVNk+lmmcVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DW7hxfy0ofs1btHVKM726OVnB2rSKN1VroBvKVgv/qpcubeKZWhtxeMCXl6sk/E/o
	 xu3uKJIMz/5ye8udxYsDFGH1OZtovNNq7SzswI8U0TaHDJyTxANJcnbJszD+kc/xqT
	 PXApdyECN0+q/RuhHmvKQmVbVDgnov6VP5zZzzMU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id BCFADAEA3;
	Wed, 21 Oct 2026 13:28:31 -0400 (EDT)
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
Subject: [PATCH 7/9] usb: host: ehci-platform: Set the FIFO threshold on NSP
Date: Wed, 21 Oct 2026 10:28:16 -0700
Message-ID: <20261021172819.668120-8-florian.fainelli@broadcom.com>
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

The NSP SDK programs the EHCI INSNREG01 FIFO threshold to 0x00800040.
This is the same setting already applied by ehci-platform for the
brcm,xgs-iproc-ehci compatible to avoid problems with large transfers.

Apply the existing workaround to the NSP compatible as well.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/usb/host/ehci-platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index f61f095cedab..9b7188d9c288 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -77,7 +77,8 @@ static int ehci_platform_reset(struct usb_hcd *hcd)
 	if (pdata->no_io_watchdog)
 		ehci->need_io_watchdog = 0;
 
-	if (of_device_is_compatible(pdev->dev.of_node, "brcm,xgs-iproc-ehci"))
+	if (of_device_is_compatible(pdev->dev.of_node, "brcm,xgs-iproc-ehci") ||
+	    of_device_is_compatible(pdev->dev.of_node, "brcm,nsp-ehci"))
 		ehci_writel(ehci, BCM_USB_FIFO_THRESHOLD,
 			    &ehci->regs->brcm_insnreg[1]);
 
-- 
2.53.0

