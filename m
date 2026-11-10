Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292881;
	b=aumNx7c7XvM1QTPfQ6C4PKtm1U4VJaYQ0ZDFtIOuc11xtpp0zFtWjVQOUt/L7dDvxcnq
	 1wdBfLarU/jLEuILCqNnMhf1NrLjNXU2vqiTOTIZDKR0J+tNruRmaYBEQRz1mbx1zqIPC
	 j1r0jsYXHd1mxj1Ve25WmvZ0z5eLtjACJe7DSCtJLc/bxdGIemq1O1QLbC3seOOdfk3qV
	 RVjdI1h9k3l5PXJfXZADjNhtQF7Hwj3OoyxEVN5mpHF3jbYYehAfjaT+scwC6XBhMhKxf
	 JIpjQfWRAInBaNSSVq/ezpSm19mVjClYPzq3NTY1cXE0fwxd4TEzZLHe0ol+91yj1pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292881;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E779vxBqds6yPR6ZwX/UxnHoDlIF7E6mtXjWmN/CZEc=;
	b=wtb+wEtiuY1gq8N775Ko3SNIMTBA/R/Aopgj7L9dzXsCl1+HjcapgfPSqAgq00RXyn1u
	 jeOI9ZumnzlMYlsLDMEqVG48jABoJlI0bWAxyS9CGgq0yBwWUPsiw7y/ojRx/71nlcpsz
	 MvmpS6hCI5uU0BMnQzqVhSPqoID4O1vMSzxb5hazXq6hgtQvnY+Ck+pRm/nZ1PNNAdNBJ
	 WDaiewedSdUgT7bmlnix4gQEYNbn2h8WQCy/qrIMnykzrsnaOvAyPoEEMKe0bZqbzLupB
	 7jr15+W/KPeKbM/eJbPYcuGYTjaB6myQGFd+ChNrRllGU+8pfOIDOyK96K+gEEjL5Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EE1606A326;
	Tue, 10 Nov 2026 06:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EE1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rKQDRXENjeIXrHubJoXIVx2qjK0Scybh69WM2FY5RUxhhczVE0TdOwz3dUW4T1hznusgN73qrm0GR
	 wntBev/pHbrUaUuPjyH9ooX891kJ+vGL+Aq3rn+Lgfr/gD1dr20FVAzOHTxf7Gr6zL2oa9B+Mz6XZU
	 QRCjjm12cRLtkgFA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af2bc85d4d-c92b9;
	Tue, 10 Nov 2026 14:41:10 +0800 (CST)
X-RM-TRANSID:2ee56af2bc85d4d-c92b9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa100;
	Tue, 10 Nov 2026 14:41:10 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa100
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/22] usb: atm: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:44 +0000
Message-ID: <20261110064105.20335-2-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/atm/ueagle-atm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 61723e7ab351..d569ee93b493 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2189,7 +2189,7 @@ static void uea_stop(struct uea_softc *sc)
 	release_firmware(sc->dsp_firm);
 }
 
-/* syfs interface */
+/* sysfs interface */
 static struct uea_softc *dev_to_uea(struct device *dev)
 {
 	struct usb_interface *intf;
-- 
2.53.0



