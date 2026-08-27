Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4CB4A13B0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853439; cv=none; b=Uy+oTtFbY7gYYXfy758z7vuNSJy5Ul9+WwWc8je0Ry8JJYdKKnnQJpFTYXHOnuGGIfZbcTpUlTq249YR6OjAkhFCe+1Eqzj/T+0Oj+ZBZA2xzUg3KvzN7DzvrXQIp5jOcayOD/V4wuvcqFFyIiyO66Fxyvy49EzO/5WRqqP8Qw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853439; c=relaxed/simple;
	bh=DwpfIZ9abh0DNAFJiT1jAMoD2RZMfTzrkuxAF7tz3Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoIwpQ7LCoY6rqJ3fIIMApIFe1uC0WLtOiYQHMC8JHZcHhhxgBsBVnaRFPvEHAAjiwFcrxWcICk+mnjhtCyaxZClhi+s1cv4IKG1Np5+4ypWppT3IH2hO9cYmRgQfOOesjdEdGeU5IC03w/bWSBdwhWpsgjL2X49oHjPfiJxi6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLJOrilM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLJOrilM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso278265e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853435; x=1788458235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLDuvyO/Qczekuq8Y0r5RqsladhskyfTIKRYuENMqB8=;
        b=FLJOrilM4e07HosKRPSgs28LuqyzR7QINzM0+zc6L3de3cQJx+c6dSqIzyaLmK5Lxs
         wfgUuS/ruO7AASd9iIesBEQQ06pOkS4Kv0pF976s4xQm6PTt/ek1Zzbww2vGTrQpM4qX
         sFs3xMtSi0QucsUaDsmhLrGVtUwgTB/g1Gc2jAxV3JBT4NWX7wGvYBNN4ywSiIF+EFCo
         fY9Sxhg3er3u2xSRNsvlajRBBtLjk66+Gx7TK36KzVhZQ3kuj9jBJzfFrz//YPfHReT0
         8jdax1+bNp/49O1ASGcHFolPEf3ZRbGsZPmLHjussmQk9I16hBC/Tw+eYE/kgXPTY5gB
         oXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853435; x=1788458235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLDuvyO/Qczekuq8Y0r5RqsladhskyfTIKRYuENMqB8=;
        b=Rp677yr5MZWLWxBwbQ08SoJHKyv5RxjTM6tRd+4SCUob4isc57w+tqF2/EdVS9FGEj
         OKP31RxA4WDoSjwCqnikiapkUNYy+xxppmlrTgDjFFkFuXB+lBHgkANaEdxmSSEOrH2I
         YaQz9uCQHkA071Zlc4dfJts0JqAzEffAfKV+AS5U38kFYhj8hM2XsMrh+CKvYwX1hJWe
         7dGcuapwNAcHUTTpxturpTPkyWHdHH6bMlpa3E6QtUvaI16bpdn59PKFs3biqj9L7YE3
         3Zh4bUJaztI97MyFm13ybM3I1wyNdKcPB60SAXxmMa8saUA1pjj15ycB/Z8kCe9XozcR
         dIPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbXgUzyoeAG/1J2bO1CnG7ifDxGkBzYwa9aZmvzf7cI17TJWs+CzhhiWP9nDeAQy18NAJs32ndLS3hNTM=@vger.kernel.org
X-Gm-Message-State: AFuF++nvPEGIe9R2ZixLXY5N1YYjCqHnsy/CxRa6FtghK9BcS/uCyIX4
	m6+3LHuVJ/izNCG8A5nBsO/pKI5Q5UEl6L5ikOL4U5jFkjpHW5OSGGUQ
X-Gm-Gg: AR+sD132sPduNdj4disn+YHq6SmhgixElSdu+Sy3MONvJ+SQe06K1xWVtI7+vvcm8HW
	JDTW7POf2TQm65H9mi+hBgbItUH1LFr3YFKCqpd3zJ1JRvew4XMG+1mJ6idvxhWmUtjk16lXksx
	oVJ7XH7zrRhuTcxmLJL5h3lgsTs/SluikUDik3lJBrdoUIJ1savbYsI4hK9iFgj2MkotGr/26nm
	iYQ7azBkqBE1R3eO+jAKerWCuo5+YRvzwl/sEmx2hN5xpyR9xz7THJkkbYFeKBVASrlOjbBf3Ox
	5fOu+PN1LCeE70XCr9u0s1Fqrir8aKWXQYlw8U1Kr7c0619+QrW+ZPB0dlYa5pQVbyQzMTZchgX
	H9Tdhp51iyoC8leO6aBzraJYCf/j/JOdptG+8cS7PMABowo552v/yl5nzu9DXuO3YGxNd1ZLFzC
	7SgwVDY5HSqz7f2L5oLknrPfdCn6nCpo4bm8H1eODmcC0ksxgFwdheOLvk3JQ+7CamyBT2GSw1I
	rwTp2xTJc2yOuaVi3CFNogOrWKAF8hPcxYyGcQkF0oMWkBd7JA9ClA=
X-Received: by 2002:a05:600c:3b28:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-49b91c56cdemr10031975e9.14.1787853434420;
        Thu, 27 Aug 2026 10:57:14 -0700 (PDT)
Received: from il-orgads-lp.corp.audiocodes.com ([134.231.187.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm82921295e9.4.2026.08.27.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:57:13 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH 2/3] usb: octeon-hcd: fail the probe when the USB core does not respond
Date: Thu, 27 Aug 2026 20:57:01 +0300
Message-ID: <20260827175703.1549-2-orgads@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827175703.1549-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the USBN clock/PHY setup did not actually bring the core up (wrong
board reference-clock configuration, for instance), every USBC CSR
reads as all-ones and initialization marches on programming garbage,
ending in timeouts or a wedge deep in the FIFO flush.

Read GHWCFG3 - a hardwired configuration register that can be neither
0 nor all-ones on a live core - right before core initialization, and
give up cleanly if the core is not answering.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -853,6 +853,14 @@
 	 *    USBC_GAHBCFG[PTXFEMPLVL]
 	 *    Global interrupt mask, USBC_GAHBCFG[GLBLINTRMSK] = 1
 	 */
+	usbcx_gahbcfg.u32 = cvmx_usb_read_csr32(usb,
+						CVMX_USBCX_GHWCFG3(usb->index));
+	if (usbcx_gahbcfg.u32 == 0xffffffff || usbcx_gahbcfg.u32 == 0) {
+		dev_err(dev, "USB core is not responding (GHWCFG3=0x%08x)\n",
+			usbcx_gahbcfg.u32);
+		return -ENODEV;
+	}
+
 	usbcx_gahbcfg.u32 = 0;
 	usbcx_gahbcfg.s.dmaen = !(usb->init_flags &
 				  CVMX_USB_INITIALIZE_FLAGS_NO_DMA);
-- 
2.47.0
