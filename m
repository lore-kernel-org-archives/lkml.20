Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384811;
	b=dbD12GVxInRJa/n28hbKuiWzq+r48py1bsRymP+ekhiqD2B3fAeS7+hQRvwaGb41o//i
	 DVsc8hw2jkckX/oQfzmo1WLAGnvogTTmgveNTLy853fPlNCcnvxfB3YFxLBhZ3sHIH5dB
	 1jsdPmXA/scBWQXxWTVaxRHfAgdsZnk4ym1ZIPyt/YtBTpJI4CGcQNsJwLYVkQdx4r0gv
	 rk/BIXag+glymgkdwjFJdYJrM/imSL5Q1ntU2HTif3rdLIrrdJz6MtA3bV10LIrq0DvXY
	 g9nutmNguNEKAr4wN/zMcOlIjj2d11VaRbdFtVYnybPVh6Vqn7gElAKhGi/+9ejBFlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384811;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lAg/rA31Fjzgoh2uiDz7l6Qf0Xg6tOGUdI2JRwAMBJI=;
	b=RIAQWrJzJPBpskxBk4MihAaY/RrI1Q0KJP4OSbPnmedqPnxKBZCGEDpCnl2sIiNz9aYs
	 w9Z64iVJ/elEliJZzrhQ7tUQuzbyz3ARfBVY67n1A0Zk5jTvxoNX8xhZww1iGEoKDgU75
	 HFCypgC1MdLGVBRzbFuAGUK7jD0J0C+r0sN/aGJ7zPvc2YUyIcZSq/VXlJEBM5UvnxTVe
	 CMqIY1Qe1VoJjBjQ59dJ8a2l1Q/VleK0O3Ff6h/w+NiojuCBpa1mZDKvRJLjhRcbvSRD/
	 r6AIWgUrCMrkjhyARvHwyjGO2Mnm1/gD+gXodCupeJo+LYHE77bDKyXwfkBGPbQZWow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HpSV8DBv;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD47E60A261A;
	Wed, 11 Nov 2026 08:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD47E60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HpSV8DBv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HpSV8DBvkFUOhF9nBlsiuNrlT2S0+CMQ5FEfFnPgZvDAaXp4a6CR29PRaLrKm6KfJwAMajXLz/YUj
	 vgEjV1FoNIV6HsGpKCXaM3zxRGXjE40HxK/xSjMByJYp1U8uRkpLC/ntkkqoAXAKFMjKRWCqvyBUis
	 F4uijleg15BopXNo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af4239f48f-a30ca;
	Wed, 11 Nov 2026 16:13:19 +0800 (CST)
X-RM-TRANSID:2ee66af4239f48f-a30ca
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af42399a3d-d4b4e;
	Wed, 11 Nov 2026 16:13:19 +0800 (CST)
X-RM-TRANSID:2ee46af42399a3d-d4b4e
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] usb: gadget: f_hid: fix get_req leak when usb_gstrings_attach() fails
Date: Wed, 11 Nov 2026 08:13:13 +0000
Message-ID: <20261111081313.16626-5-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
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
index 426bc1743cbb..861b43071daa 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1191,8 +1191,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
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



