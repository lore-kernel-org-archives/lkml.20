Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445776;
	b=L3eQPSxh+VNQ+8LICpadzYGrDT3hbeOC6vI/xGOPnjzLDO/DKn+cq/5Zr4IKDekzCA64
	 g7zvgEkN1IdNO3oUBrNXba1lpEL1+dHrXSgfmWLHwp8HQ+Uwn1RTQ65RB7S6K9KoRszM8
	 WSjPpqqWHx28WKLH+d+EX/oxlSSbOZz/9NFKPsfMuGD29QuW8svVl1ws4I21LkRBZ0PPK
	 gKXenfQEB/p7ybrplmPObV0SsYYrLv7BS6miKEmUqXDizO87oF9oUOnAjEVWm2qOuXDsP
	 jwzr74zrWcMPYsE+JV92TIste2nFpLOB/Oc4mh6/Bq0MI12X6frLZ4n6p37cLRMxP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445776;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DSyV3BLb68FJd0SgIwqaYRGBX11Frg/gn7J0MnaZLwE=;
	b=zclzOY6322HhGgxlekgmdIXmbmYK83KO2Aqy5HyEOTzCT9fhmy0PnW3Pq5Op32Zi6Q+1
	 YOGD7vNd16TsvD3WC1ie2fb1jVCwCc+A32MleQuwkwmqdCdTwWWePju267ZLHcIc3ZvLq
	 pmgjPZJ/mSevmcCtFLa5I6AgL5Ud6BGwPbP4CzrZEKKGvXBS5VGj1azWUnxklB9pvavIE
	 Oogp2ChI+y0ipQDaWuBtlzGpXE4V52FP1EfhYBVYBcGPWowNgZ92aksFTc4EgVbFb4B/Z
	 ksxWuLVYbiLhzOOH15qrQoE4rHkvP+dZX3b8Qq0HnH0s5swZuZPrTniuX2wzWjZ+NkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=xUUVkQmF;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9BD606A32A;
	Thu, 12 Nov 2026 01:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A9BD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=xUUVkQmF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=xUUVkQmFsu6icWBGLZHeiffTLTEUv8Ds2OEB2XtH/aLsOfu4MGjdy7WM9uNWQ94GtaJE9diMcusoQ
	 YVDIPwlgZg2v6uWtZRWIaKSFu1p4jlbAcBMmgKIq92v4lcLXvKpIR7d1qwOiErozrNjI+cDtKW0mTo
	 v6V4bH1646kL5d70=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af511cc8ce-dc2e1;
	Thu, 12 Nov 2026 09:09:32 +0800 (CST)
X-RM-TRANSID:2ee76af511cc8ce-dc2e1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af511c8154-ec511;
	Thu, 12 Nov 2026 09:09:32 +0800 (CST)
X-RM-TRANSID:2eea6af511c8154-ec511
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] usb: gadget: f_hid: fix get_req leak when usb_gstrings_attach() fails
Date: Thu, 12 Nov 2026 01:09:28 +0000
Message-ID: <20261112010928.23716-5-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
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
index 8c2adf392389..af68684fa720 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1184,8 +1184,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
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



