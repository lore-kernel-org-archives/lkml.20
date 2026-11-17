Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919861;
	b=QcHWkM1mMcMOoYcAWJm/3FlzQygFS2Z+LEWDiVGwyqQ8JCLGH+aWhYRU3sCiXtBaWyb6
	 Fx8cX9VSUsYN8DsCUV91REo6zxoNIhlebomQAVQ7sOq4j96E8LN4ruuA+l+1yBj7Yn4ie
	 Px9Lu2IdsqkganMfwzmY9pxgjY7A8UF0CdmEYRuwNNmdE0VkSBe2546qa6TxW1x13Mfgn
	 gCVZfI78UbsKbJfT7r9mXp5l44BaLlc7NRfFFyOXe09aOvjRnew0P6sHP2xZWDwwt+3Xx
	 PYX2cBiXt8wgiNNqhoFsYatplawFR9rr7DteVjeGcUf6PidWuKUgo03IkGg4PZa211w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919861;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4hIkeH02sUtZInd36UZqvTnWUstZoEP6D/ZazWtiVwU=;
	b=vwLVmkyxsV0Y6jrme6ZnMu+f1/Irw2O2SYkuogSFKS3jl2udEiUdJ4pe16pig7T2+DMu
	 vIAysS9AAAu6Z5+npODHp+c2sQD6bjaAGYq15H9tGGSQN52t+HbYuNLEtWpGX3vAWWQhc
	 B5m5OMIvdpg/Y9YHxcXG8s7qBz+z07o/10R/28XUIq6pFebiEqi43/UB+w6tlHQuGqLLL
	 HoPGyGliiKfNDVysi7lwLR3o2z6JAdjniBo7gKkEy/VnRB2GBChgPVPhbzhZhz8qaX2Yo
	 OmWEAJvOtPVlsxan23s9zgrEHfNub8AMoKIQo5qp5yAG091KOkR6uMr6vMj8sDGedlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MYdaX4kD;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5639B606A885;
	Tue, 17 Nov 2026 12:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5639B606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MYdaX4kD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=MYdaX4kDEyTQECY2I6UgoS40GmhA7J2zdH9x8xQj5tVJmORF4/1tT3vpIWyp8akXtYjf4DZmdckA1
	 /6b6f3cseXq+5iJV5O4zhIwaplMZUbMTQ0RYYpWncV+ZlGrCBOaf/POrV0QdgyVruhx7y7vjoqvFkr
	 0s8gZfwoTZIpliGM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afc4db1764-aacc1;
	Tue, 17 Nov 2026 20:50:57 +0800 (CST)
X-RM-TRANSID:2ee86afc4db1764-aacc1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[123.121.1.242])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afc4dad71e-b1c16;
	Tue, 17 Nov 2026 20:50:57 +0800 (CST)
X-RM-TRANSID:2ee66afc4dad71e-b1c16
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 3/3] usb: gadget: f_hid: fix get_req leak when usb_gstrings_attach() fails
Date: Tue, 17 Nov 2026 12:50:51 +0000
Message-ID: <20261117125051.5646-4-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
References: <179486710796.2938203.13522037990167268712.b4-review@b4>
 <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
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

In hidg_bind(), hidg->get_req is allocated early; if
usb_gstrings_attach() subsequently fails, the function returns
directly without freeing the request, leaking it.  Unwind through
the fail path instead.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/gadget/function/f_hid.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index d864a0d4bb8f..0416bf4ea16f 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1177,8 +1177,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	/* maybe allocate device-global string IDs, and patch descriptors */
 	us = usb_gstrings_attach(c->cdev, ct_func_strings,
 				 ARRAY_SIZE(ct_func_string_defs));
-	if (IS_ERR(us))
-		return PTR_ERR(us);
+	if (IS_ERR(us)) {
+		status = PTR_ERR(us);
+		goto fail;
+	}
 	hidg_interface_desc.iInterface = us[CT_FUNC_HID_IDX].id;
 
 	/* allocate instance-specific interface IDs, and patch descriptors */
-- 
2.53.0



