Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670E953D9C8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170272; cv=none; b=DRGbU1kMDfC9nH/UJMOOo+hbiGRoNSm3qGfsn++Q+ujqB5vttQAgT7kKPc3HVAG5aLsNWkvQS2wuubEejXzT1p4rJq2AZPw05JrSPOaQIfUUVgEgX6eNP+eqFMaLr+6rk8b4fxsOiKT0Cw2HwXIHoZ/Wlt0nnCreKv5gP3I5jbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170272; c=relaxed/simple;
	bh=RfoITBHU/34UblaJczsB41NK5NQZH3g/VaxCKH1Y1A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7jo9MmLWoLPZb5x7v0Vjpj7kCLCC1DzaPQtOlkv7CU2TDjRE05QMU9eml6BUmyHx+3K00wDS6rlOTBTDWkqIctrxzAUrVYf7uF6iMYiutP1OrUDN6VPHafXBF5wZBAaPkh7HQd/UcdMzqdM7q7EHv0+2CiF8Z6SeDwkuaQMFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIKFB+8l; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIKFB+8l"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so116009a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170271; x=1792775071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLJ8r+Qkw352j8qkFr8FpLRJS070PYdeAw/tFXJw0Kc=;
        b=jIKFB+8l3+DwwqfX3kzjjhpslR2BFg7T4zPTw+L74gl9IP4iXIiqXXrFJzjhVKGusm
         ogf3CdbvLiQLGH+lepLqlWYN4YAAJSucvQnIXQ2BNYfGYXcTrjPp6jjFQSlCQ1a6OIkQ
         +MWv7WpfJwPi/T4LHmgtRhj2+gNvC4zvjSyxEgxH29dKTP/k6vux+cjkVw91qnM/VTBn
         AN8LvFgNJg7HKLGvR8kGMoRBKrJ+VUHsAyVQSWb8QSWkzM+nW88HL9bWFT7bLx8uhVCg
         zVZ9umEJ6b75ldMNEmFzvahf1BnTKgCec/hvcT2kmfW0neJb8qXdyCX5jd4O0RnFGdgD
         2dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170271; x=1792775071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLJ8r+Qkw352j8qkFr8FpLRJS070PYdeAw/tFXJw0Kc=;
        b=mQoNc19HF8gXlUaOPUUot9peGVIGiXSXVtoXULADAlzLk4omz//2rbYM4/KVH0+V1G
         2Ba5u6D28OdIkLQnxpCY1663j0OYnRteE6zJW9XKkrp5rGLofC6Y1GJ3YM/sewlKH56t
         RQc81PQcil9oIDfgV6MEC+wVQgBx00iQklVtbqaSevApbUBsexmyEvxlWJfCgp9IPGkR
         ZtIplJnFnWPPBrYIfqBNKLjT6ncr+cmjiPni59jxTv40gNcOBMf0YlA1IELGDjgujsig
         2SWd5kO3CuG63iqHO6MuDg9KrsXV2GZWzs0mQfcMFF+aBMz+yKErt9nFokvL1Cdn4k9p
         3juw==
X-Forwarded-Encrypted: i=1; AKwUvBzGJ8UsPCwkDYYah/COR/jhLtuvTnDHo2rRiVIZdRMAYYxRGBWQSqEU5uOBs6h4q5xr/FARO+zQuDMi9TY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLChdYXF2deEOcyia90YYHiwkhw7sB7VuDZ6/KqZ9Dirty9JiBj
	/nOfUmshtQmFPIQkp2Qf7SEhXRYLRlJchQX+6qU12qY/GkFIxf1+8Gh3
X-Gm-Gg: AYBFou2rbCy1qYRsSfuupLejV+nKJ2r6SRyvnmpEs+etLZ1TSNF43JJSqFvrsgRABZ8
	8H6IKQdixMnK3U3UnmlC3kGQWE3hipU1WfcmqQ8p4ATxnpCrQA/W5mczA/OZuEhoC26a6v4mAQL
	4NKcWgLCgS4Fl+H1hubLp7/+b8AkMz02MOPiPV4nWhebzRlwuO17YDbCNvrvwCGK4xt1pJy5KwM
	gMxYnywbmvI7fjNbzu8xflFk8C9USSTmKmRKNSCL02rkuF396sReF69i1o/R60xuD+WwN7DpfNm
	9PlfxUPhPYXD6JxtRMY0P6X3U0MkWeQ8FTXQ3PLeMOh4b7FDDJUy/kDlw8tXdDAcmMmKqKbqCF9
	mMWlPWGFij1DjAQ/tyIWbvwYLBqV2CM2WbVai6tmc4d3wyM3wyQSfGxQ22PAqbxvm7aM0nPtNrq
	hJQcKqok57NG97jFTxu9uPFiWNnFVolSNQjNor8oB48B4vULjy76pF3vI7M4XBYZN671KzF17Gi
	9bsUIXDiGhe5+M=
X-Received: by 2002:a17:90b:2cce:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3aceefbf76emr320123a91.11.1792170270459;
        Fri, 16 Oct 2026 10:04:30 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([223.104.67.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm9928587a91.0.2026.10.16.10.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:04:29 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-kernel@vger.kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH 1/5] Input: joystick - replace strlcat() with strscpy()
Date: Sat, 17 Oct 2026 01:04:07 +0800
Message-ID: <20261016170411.51025-2-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016170411.51025-1-shlomojune6@gmail.com>
References: <20261016170411.51025-1-shlomojune6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pxrc and xpad drivers build the physical path by appending a
constant "/input0" suffix with strlcat() after usb_make_path().

In preparation for removing the deprecated strlcat() API[1],
replace it with strnlen() followed by strscpy() into the remainder
of the buffer, as commit 34b228b739f5 ("HID: usbhid: replace
strlcat with better alternatives") did for the usbhid drivers.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/joystick/pxrc.c | 4 +++-
 drivers/input/joystick/xpad.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
index 52d9eab667b7a..9abda2394fffb 100644
--- a/drivers/input/joystick/pxrc.c
+++ b/drivers/input/joystick/pxrc.c
@@ -121,6 +121,7 @@ static int pxrc_probe(struct usb_interface *intf,
 	struct pxrc *pxrc;
 	struct usb_endpoint_descriptor *epirq;
 	size_t xfer_size;
+	size_t len;
 	void *xfer_buf;
 	int error;
 
@@ -170,7 +171,8 @@ static int pxrc_probe(struct usb_interface *intf,
 	pxrc->input->name = "PXRC Flight Controller Adapter";
 
 	usb_make_path(udev, pxrc->phys, sizeof(pxrc->phys));
-	strlcat(pxrc->phys, "/input0", sizeof(pxrc->phys));
+	len = strnlen(pxrc->phys, sizeof(pxrc->phys));
+	strscpy(pxrc->phys + len, "/input0", sizeof(pxrc->phys) - len);
 	pxrc->input->phys = pxrc->phys;
 
 	usb_to_input_id(udev, &pxrc->input->id);
diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index feb8f368f834e..4f2bb9ca74936 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -2045,6 +2045,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	struct usb_xpad *xpad;
 	struct usb_endpoint_descriptor *ep_irq_in, *ep_irq_out;
 	int i, error;
+	size_t len;
 
 	if (intf->cur_altsetting->desc.bNumEndpoints != 2)
 		return -ENODEV;
@@ -2060,7 +2061,8 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		return -ENOMEM;
 
 	usb_make_path(udev, xpad->phys, sizeof(xpad->phys));
-	strlcat(xpad->phys, "/input0", sizeof(xpad->phys));
+	len = strnlen(xpad->phys, sizeof(xpad->phys));
+	strscpy(xpad->phys + len, "/input0", sizeof(xpad->phys) - len);
 
 	xpad->idata = usb_alloc_coherent(udev, XPAD_PKT_LEN,
 					 GFP_KERNEL, &xpad->idata_dma);
-- 
2.43.0

