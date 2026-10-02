Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B2B4E4C2C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954961; cv=none; b=POiwqwndz2xQHtHiNhjXlN87BvpdtJbIXSZrtJzI1HghvumIHOOVa2A15VgvG1Uu0/bSlmu7j1kr9+ypClb4VVsA2DKnjGBmxgEL+0F+K+e1QzWbdcRidHWxbcLi9UAWGt2ZSl4wwyiiv97H4/8VTgpwNOjPZsmba9hUQRuvWaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954961; c=relaxed/simple;
	bh=54ePFJJR+IwUxVMAVNmi2k60M2mNg+EsCKTtGGzR7yI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJivmaw/JGN2U5hdlkDnQ3tq8lHoG6wgjResUSiaQCfEpUHcty8Ks2nJPvCKCWXG4GgSC+WwF6UuSWHj6IW50cJPXkKTNBrsc3GeyTcInEzYajB52t5EZCgYq+8NUW/iiOAgLL1981gGuhNG0Ovhcf7NkuEL4WMMdSt0V/OlkiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J35BDYS/; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J35BDYS/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d84150dso2975156e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790954957; x=1791559757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIdmawnhAVZJnSURXMCc94aNfjDRUXTkCxpLGWSZGCY=;
        b=J35BDYS/ayPBOtVKhHYoZWNteG8+ONAJZEbcef18iUniwmwG7k1psDL8SZb5MZRepF
         WfgLaaveevr7VDIXuibcQNZSIHQe2CnvJc7dtGs53X3HI58mOaGnQKcPL7oTeEX3DUNu
         M3h1v0VLMU3Gv9ANWuDFQr0n78ie1cf68VPAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954957; x=1791559757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIdmawnhAVZJnSURXMCc94aNfjDRUXTkCxpLGWSZGCY=;
        b=JzEOzLsZ3HVJjj8B2UpfFHFMISTcGNQDTZNIc80jbt12Pa3J0luAioQVFkba0OWye1
         iqo6oP12moWomxF+YuDKXyO1BV9XnCXPr0k/ZXQzXoQBhHRmQPPE48s1pqpi1cqUEe7x
         37ZNhGE3qwH28sTRyd3J5Kx/LpCbwoDvw0kKUi99nXfTDjIchgwavFimMLzNDCrPa5GA
         bosPQKU0atFu9IrKFnXVC8yLTcVvmZMtnA3CViq65lrPKi3SE/45/2sodO8oh6r9FdpL
         jiRRDRwPMApYg8kC5ZwUUnlIQ5CJvewvaQ+vHxovu5psn2TJKKbhXjpSkctbGJqrunAS
         gAVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjEAU7aAhWw7llm4iU3zV5DDt8E28ZKftR0zmUC5TW9dNpmf17Kg/JM24hMjYJq8vGI1B7J3geV/QVSJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQGSgNZLWlItlbdWw5NPEnQSNQzkLIxavJbr61UjWSDe9O3GQ4
	pcz08j+O3Mq4L0P2UA6yuXzMy7t62Kt3hRv6cOtPjRK3hXTvE6/xU6GcyB0Aik6HFw==
X-Gm-Gg: AYBFou29lGlF6BdHYKLpOt2yDZ61ODw7MoVeSURKXeHSvc5lMnq2dPS1a7hZupdhjb8
	8dpo4N4viZdreDo/Kb3ju1V8RVRdLcWYTM8dtKs4/P3BqooAidvgNiQqftyqxitmObjPPGJpYHE
	ZH6C7SWZqDZUqLl5CHOzyzt+npLr2Ld9cJ8DLp7msx6G0mIbl1NLDWE4C6EHFgdrPLlEs7pSBZ5
	f1N75F2wIKFsmkFI9HYep5CS41a8vKPfCmz0bT3lgMB/Aef+hpEiVxSGP8oEovAT2a5sm6vVmOq
	TNgR/OOhCaEZwWH0ONa4kYj/6eLkEJtDRzAehPdFKqsVcZefB5SdtDlpti1SCJPESA1vmNE6BEu
	7AefH6XoMWkqnTcFf47N+SA5enKTg6it9ioOQY7urZaiBsBjOuQP2YFUfTAB6SowFrZy+87BSs/
	BmAbq2iBOG2yEmeIH3GCr5DKQfhNAevVy+DYQKn6l3odDU+e4KE258L0upTmZvRh6ENLJ1h0HUM
	sG15kcY2Wq+vtfwPaB/QzvfJSFvR3qXuttkAyKohTOwmgbi9UMx6Nk=
X-Received: by 2002:a05:6512:2c93:b0:5b8:d078:da8e with SMTP id 2adb3069b0e04-5bb9bb1fc92mr1076895e87.28.1790954957449;
        Fri, 02 Oct 2026 08:29:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c718f62sm835544e87.12.2026.10.02.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 02 Oct 2026 15:29:06 +0000
Subject: [PATCH 2/3] media: uvcvideo: Convert one quirk to a per_device
 check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-uvc-sorted-v1-2-65f52e4d7e16@chromium.org>
References: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
In-Reply-To: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

It is the only quirk that does not use USB_DEVICE_AND_INTERFACE_INFO...,
convert it to a usb_match_one_id in uvc_status.

We could probably just use normal USB_DEVICE_AND_INTERFACE_INFO and
ignore the bcdDevice version, because the code already checks that
interval needs to be > 16, and I would expect that the newer versions
have fixed that.

Since I do not have access to the hardware this is the most conservative
approach.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 -----------
 drivers/media/usb/uvc/uvc_status.c |  7 ++++++-
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b789bc55e02b..049566a4e5f7 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2740,17 +2740,6 @@ static const struct usb_device_id uvc_ids[] = {
 	/* The Imaging Source USB CCD cameras */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x199e, 0x8102, USB_CLASS_VENDOR_SPEC,
 					1, 0) },
-	/* Bodelin ProScopeHR */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_DEV_HI
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x19ab,
-	  .idProduct		= 0x1000,
-	  .bcdDevice_hi		= 0x0126,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_STATUS_INTERVAL) },
 	/* MSI StarCam 370i */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x1b3b, 0x2951, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 97c939206302..6f8eaecad3dc 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -254,6 +254,10 @@ static void uvc_status_complete(struct urb *urb)
 
 int uvc_status_init(struct uvc_device *dev)
 {
+	/* Bodelin ProScopeHR */
+	static const struct usb_device_id bodelin_proscope = {
+		USB_DEVICE_VER(0x19ab, 0x1000, 0, 0x0126)
+	};
 	struct usb_host_endpoint *ep = dev->int_ep;
 	unsigned int pipe;
 	int interval;
@@ -282,7 +286,8 @@ int uvc_status_init(struct uvc_device *dev)
 	 */
 	interval = ep->desc.bInterval;
 	if (interval > 16 && dev->udev->speed == USB_SPEED_HIGH &&
-	    (dev->quirks & UVC_QUIRK_STATUS_INTERVAL))
+	    ((dev->quirks & UVC_QUIRK_STATUS_INTERVAL) ||
+	      usb_match_one_id(dev->intf, &bodelin_proscope)))
 		interval = fls(interval) - 1;
 
 	usb_fill_int_urb(dev->int_urb, dev->udev, pipe,

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

