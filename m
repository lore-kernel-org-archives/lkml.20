Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297518;
	b=UnBCq8ZmuJX6iUNFutjWX2ihEClFc8vuWqSNEO846l6MMkSulD6dE6U0cH3v/qPMPZuy
	 QuUsJcEGfDUOECLgsoFObQ62re7x/FMIu+w3PnDMxxtXd0k1vcdm+se5VqzA7Q/qj28Mo
	 Udq4KocCuuq7FNgsiyA+HrtjTRAru7PjbD8siyCjo7RsuPKlAilsHOLQ250OMgmqUcK24
	 K6NMN1V5ZMV5LUxgrF/v5ylCnNZ6UUMgHRESCSpRIZrfZiT1iY9FFSKSfz0YyKYqRhzBG
	 SnV8jcIweScqibj2lnbn0ugnFJtJcD7GXB/IywQJBxOz5k8xUxFq0wMireBYFom41lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297518;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=teyQ2+VYGBxUxxmzECjiOKDl2bPB0P335b7uU7olMrw=;
	b=MXRoRiv/CmOGQqGgWbB1QoVvScyvYweA5mGRr66jvWKIpbrIE6paaEJEtrOF9rHXcsjo
	 neF/17bjH3x/7S1BaaVOOPAnDA4RH2i+O5Q78J77hB0Kuh99Vz8sCfVip/99K17ZcWGoF
	 XxKnwKBe7SfvuuUSbx/HVVYKkGdpwx4JWlStB/gN4gPFWthzwtb2onBa6lCPJGG0Ukbm2
	 oAvwPYiAOoyEbaTaCQkiZH32tIA/SnzdXKD8Gw2sHTIqOnKP5kuq2bJ9NtIaLmNRVxkEZ
	 uzK1pk03AveZLaBY8+Ajj8l0cfq+HJmaUHetoOES0IZn4Xc6KhMYXqYEtUTksrdNLaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CmLgLlEo;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7F260A5BCF;
	Tue, 10 Nov 2026 07:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7F260A5BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CmLgLlEo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CmLgLlEoRUalZxWNa4Wkchc+Uy2HRqEEstdryFGeaCi/nyyEGEU4CxVnyEjq9NqR8/Y2J8BcNiivU
	 4YlmI8KneJFS/KLO0UILeNn3PI+UrcUa5A97qPEbL41oFtcDuaeHAsxRTNtFO+XDdB4yDV9xiKNJza
	 Yyfn1hOgUsEcIbe8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af2cea85c6-6c6be;
	Tue, 10 Nov 2026 15:58:36 +0800 (CST)
X-RM-TRANSID:2ee86af2cea85c6-6c6be
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acde2;
	Tue, 10 Nov 2026 15:58:36 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acde2
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/22] usb: isp1760: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:16 +0000
Message-ID: <20261110075825.24946-14-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/isp1760/isp1760-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index a64190addba6..e09d509b4de0 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -94,7 +94,7 @@ static int isp1761_pci_init(struct pci_dev *dev)
 		return -ENOMEM;
 	}
 
-	/* Grab the PLX PCI mem maped port start address we need  */
+	/* Grab the PLX PCI mem mapped port start address we need  */
 	mem_start = pci_resource_start(dev, 0);
 	mem_length = pci_resource_len(dev, 0);
 
-- 
2.53.0



