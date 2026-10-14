Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC8E4E36C9;
	Wed, 14 Oct 2026 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980252; cv=none; b=KmJQIEICQHr54mgwzLFyE1sm4qq/WpGa/JTBJA43LL21G5hNjHk5vxYJLLkodgrNqvxR1nB3yBjy0LTiWGVXZNlzZVsQPiw64H6v6ZlCr5otbI07oTwy/7DkWpJjMFJeZCJHltx5SAjmQauNuZmja3Mm60Cyx6TvzFMMP/KIaso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980252; c=relaxed/simple;
	bh=VwGEM9bG+gm8aZY+vx8GaLjgb1ELCuBd2Ygqztwzy94=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e7BOjBM9qrccyKSywJFiM5cvCOVuW+TawyfDRCZ5usEkFZr5AaLwojztal9cBxPdu5Uj5iTZO2+hm0Ny3KAO6amiQ9jzNapYRWdSaa458sa62anzsjBZXutYrsN/IPk8VHUYiD0BN58ERCndNTG0fCFnKLM4HoV371aMQZdMnRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=IwFLJlPj; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="IwFLJlPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791980250; x=1823516250;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VwGEM9bG+gm8aZY+vx8GaLjgb1ELCuBd2Ygqztwzy94=;
  b=IwFLJlPjqETJZHywaDx1VgS4yfiwAvrHZ4+6r79x65j5Ja9REgeArjdH
   OxdTZ9q3pQuxEHlozx8zYx3GOyq/FVyFrMuEzjmPruUG4a+NhAxrJ+QjK
   rPe2Ys8p+rpEKCeL9qTOUnH92zq2I1ir0b4IC5kvBrMtr+ATyJ9rsNCGE
   1mvO6AMm5CxxGBHvigwdhThEWGk4dxnnP+VVga0V+2RQbHoLd5HothxhW
   Nlf7tifznt5VvQFz5JM4AYTD4s3Wma9jG7hKdPaNP+kCcHI5dT0doL7jk
   vCFwcmi1447mRu7to9M0VXXuuJ57ffesvK3vngeR+NLPQNcBDfWRyd1Kp
   w==;
X-CSE-ConnectionGUID: AS0fM4N0TTu+W0y8BvP7CQ==
X-CSE-MsgGUID: e/ISQjFySC2entXgr5BMBQ==
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="296441734"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2026 05:17:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 14 Oct 2026 05:17:28 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 14 Oct 2026 05:17:26 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] usb: host: ehci-atmel: Use dev_dbg() for debug messages
Date: Wed, 14 Oct 2026 15:16:56 +0300
Message-ID: <20261014121656.1634-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use dev_dbg() instead of pr_debug() in the probe function
to provide a more specific device message.
This ensures the log message is properly associated with
the corresponding platform device instance.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/usb/host/ehci-atmel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 65747270fd88..b6ba7005be69 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -99,7 +99,7 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
 	if (usb_disabled())
 		return -ENODEV;
 
-	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
+	dev_dbg(&pdev->dev, "Initializing Atmel-SoC USB Host Controller\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-- 
2.56.0

