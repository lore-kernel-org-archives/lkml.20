Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022030;
	b=rkEHFxxpNts6tgn99uVL3ot6R2eW11Kl6BTk4dfhF1niW6hjOChLF6djusCVDt3xWoDO
	 1P9x+1T6vQXjUjKjQKWNqiH3iTVsZgas3iZ9oaYvKg7/r1StWCtp7j34TBJtCeOgWqW2H
	 fhxs2+yxsg/3F8jq0NUULkOUJsoixag6hw+ETEyhxmf1M9xwzrmSGZRxM9uzGmZBiY21z
	 tUBlOGTWYbV80J2wQ7bdA4qfpPSLTZtlKWFrC+X3TSs8xC3hYGwUBQ6S5N7n/lFMj4L+r
	 CGlZOrLG192fyYYuY2KbaTbVZRM58bt0tRTfk6e9cOpxDH/MPyQ7VcObdoId/NlW1kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022030;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=24ivy98Nb+0GCxYIxoSVFTKgFdRPh8s2EZHT1CRlH54=;
	b=iRuF9Ac74hVC0GUjFoOfgxikD9HgfAHSb9r5YfC3lyUs1F8xvFK0CCIDqRg8nfQ6zxi0
	 d5qQyTYbNIPRWNZIa/+0z+NetwY4lfI7wkyvtKTOpIQsCEGr+d87ZqEF8LiGOh1PePhpu
	 ieQutWIKqXg3327qVAMZStiPb8ISwcrHTyPjx+JLwAttsCKzyRLhJyXvYPD6ZbdXG7o9r
	 RBimQPXZqUl77JvaQCe0Vj2trnDsFqfxl2KgYswff9zb8ef12YqGLjdOAsZd159El77u3
	 mIF/3+J++tuKTfSdZYBLAUwzzksghFR6iIkTDv4mSt1nu5qBJtu6w2vmqKPJkBnDN/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ToEhdHJz;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29407606A31A;
	Mon, 26 Oct 2026 13:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29407606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ToEhdHJz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ToEhdHJzuRGAuRkWA4M5shhS15275FdX7FJkF8c3nCAA2OtIuJHzkQEmn7abuCH3j1UJwi281+we7
	 chE12L53I85CMDKXNrxs+t8X5AGsCbGUj/5g6QLyu7AKiv+vQyHVlqkAyyv/5dWPw+8NrHrl0s0Hix
	 1yqEqCat5PUSM6qM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16adf583a041-2aa1c;
	Mon, 26 Oct 2026 21:40:21 +0800 (CST)
X-RM-TRANSID:2ee16adf583a041-2aa1c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66adf5843b7a-b3de4;
	Mon, 26 Oct 2026 21:40:21 +0800 (CST)
X-RM-TRANSID:2ee66adf5843b7a-b3de4
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com
Subject: [PATCH] USB: ohci-spear: check clk_prepare_enable in probe
Date: Mon, 26 Oct 2026 21:40:19 +0800
Message-ID: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
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

spear_ohci_hcd_drv_probe() ignored the return of
clk_prepare_enable(sohci_p->clk). On failure usb_add_hcd() runs unclocked
and the error path clk_disable_unprepare() would unbalance the count. Check
the return and bail to err_put_hcd on failure.

Fixes: 1cc6ac59ffaa ("USB: OHCI: make ohci-spear a separate driver")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/usb/host/ohci-spear.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
index 5aeabb051..9d93b3f86 100644
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -80,7 +80,9 @@ static int spear_ohci_hcd_drv_probe(struct platform_device *pdev)
 	sohci_p = to_spear_ohci(hcd);
 	sohci_p->clk = usbh_clk;
 
-	clk_prepare_enable(sohci_p->clk);
+	retval = clk_prepare_enable(sohci_p->clk);
+	if (retval)
+		goto err_put_hcd;
 
 	retval = usb_add_hcd(hcd, irq, 0);
 	if (retval == 0) {
-- 
2.52.0.windows.1



