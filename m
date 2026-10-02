Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9204D4886
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954962; cv=none; b=Ou443D3s5mBuPO+hn4JNl15cZa+K0ftDCtpPM5zWSrHxEggwe7FGgicRgf4inpcGJPfWhRTewd4tlDaR0PE9oh6i/cuxSFB/5ejThlNWugx22+qYLLzjZCFpmaDb3B3LHbBjl610iDEFtaNt5vpoxe3nUnGqaFfqpR9h9B+NJus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954962; c=relaxed/simple;
	bh=C3b0hl68c5nHwqC+N1+lPxn/qhqirxUrDbQpVTagJGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwCVvYy38PcJdNciPOCK9lqUG+DHQ08VQ0lOGr3vkcLaeaSFapoMuQQwldK5TUN71nNX2/eDOyMvcUyPbQjB4jnhSv+FOJ7GuDl2PwUrW38kzt2lWz3p8AebGD37/quukoCpehMOjZqHZcCpXMi/AIx7h9Z0Uo8+28ksE+uFdn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dx4TlKqb; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dx4TlKqb"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42966d5fso2237409e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790954955; x=1791559755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NavrGiND6WBsryuL36QmsM4AYgCY3mjUuYp7o6rCeqQ=;
        b=Dx4TlKqb+1ffXguOfgS+3OKsvJZkWNyFqaKBKnKoE6UrY/hU6yjKS5VS7tXRM4hxs5
         mqkED0a1iWItiqC/VeKQ9dqyiWhSC8XYJvYqEmHFnDooHLom0Vms58SA5rf+lvCNcIj+
         ADLnKqBkqeQscS8sWkFkuFoC/tzmjk5B4eIJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954955; x=1791559755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NavrGiND6WBsryuL36QmsM4AYgCY3mjUuYp7o6rCeqQ=;
        b=zIBUkEzVb0IgC3zVhOuM4bOcH52Khl4c2V5ogyY+0I6vsDkwG6G4PEcCAu4t1ZIYQk
         YCSyXbkWBBJ0/YsMKBMXUQjC9RTBrmfIJpzC3x+74b2pkmpFnWBTLkBXlabNAJWJcIFS
         PX02D++F3LD/aHRsWU2/IliiJUK1S8YP92d8eNmbhDx+vtn0PUah2h/PmZCeAzHlU6Bl
         SUfwwX2BT9ORWKyDzRtwRXpnll/Kt8yo6qoqugJC0SopF2yj/Lr7loW0kV0YhPe+ANxa
         S0YuoTlPkLHROULuahpa3ieDvQ5vDwNc6xSZtzyvvZiTViBexul8/zZiRpGs3F5/F+Si
         UBIw==
X-Forwarded-Encrypted: i=1; AKwUvBw2mN992Pd+GotqMXhl9utXQc/mLn0rkMXIYDOyUtkA7uwAksTb9zV+tib7OdoQVSDg9HgzjFfYU6qcy1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7d9w4fLeG5z4vOZyHcHIfI4/tQxyc1khHx8V9G6Hg2jAZ1GNE
	72IXmygEpafiYRCQeK4w/kYXz7MOVP5vgd4UDmxiAPZXz7P4wOUUC4yKj0HSbCmLnA==
X-Gm-Gg: AYBFou2DP/43oAM76BI07toLad2xrkj61ngezXEeCU9ex3a8hDFrlNOfxv/5CkyLCOC
	QrSwTqJXCqKIBu3S8BabkH6BbI1ZlA0Bswx7CkWjOM3OoOMCn9ap9YhgTbALcaRP7B5shRC5/4e
	vJYFeFARoKx8RvmH0Rnd7Yi6XqMTKvF73lDXvnSj7hbW5YIq/N5zB1kfdTm63+SvYtAr2WRKcEp
	fV7R1hoSSISX0euqiM6jFsuXpJGbBnM1kkbZY4hk9jZaP9TMKlCLLzFy6W77YTaIX8+S/dT6lF0
	RjdggYU+xsW7nYYs1BnDR34PpeROWuyrLv7MLDWomVdahIADrJLbhFDeR6FQ4f71qzZJNU1hIIE
	YUk34nqp0xOKGRSyUfmxxhJ57wVwJhxcJuwplK1uAdUHYFT4ZZxg9LlHsFofQCoSLodBaRKjqLb
	rcfIxC5CgYTm4Etu3O5TWbZbZZrjLKpXhb+/S3AsEdtRANnibgm817pMD9+PuZawvOy+sk+1sl/
	lx9tBv881UeG2zUnckx6h14GM9y6ScD7Talp0WSAhVp8QzvZ1lQYtEJIrENJtGjXw==
X-Received: by 2002:a05:6512:340f:b0:5b8:f333:db97 with SMTP id 2adb3069b0e04-5bb86e73f99mr1162873e87.0.1790954955379;
        Fri, 02 Oct 2026 08:29:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c718f62sm835544e87.12.2026.10.02.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 02 Oct 2026 15:29:05 +0000
Subject: [PATCH 1/3] media: uvcvideo: Use USB_DEVICE_AND_INTERFACE_INFO
 macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-uvc-sorted-v1-1-65f52e4d7e16@chromium.org>
References: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
In-Reply-To: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

It makes the code arguably nicer and also add some structure that we can
later use to automate checking for the quirks ordering.

It also introduces a new macro UVC_INFO_VERSION to make the code even
nicer.

This does not introduce any change in the code:
$ diff <(objdump -S drivers/media/usb/uvc/uvc_driver.o) \
       <(objdump -S drivers/media/usb/uvc/uvc_driver.o.patched)
2c2
< drivers/media/usb/uvc/uvc_driver.o:     file format elf64-x86-64
---
> drivers/media/usb/uvc/uvc_driver.o.patched:     file format elf64-x86-64
$

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 704 ++++++-------------------------------
 1 file changed, 107 insertions(+), 597 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc14569716b..b789bc55e02b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2539,6 +2539,8 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
 #define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
 #define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
 	{.meta_format = m}
+#define UVC_INFO_VERSION(v) (kernel_ulong_t)&(const struct uvc_device_info) \
+	{.uvc_version = v}
 
 /*
  * The Logitech cameras listed below have their interface class set to
@@ -2549,556 +2551,195 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  */
 static const struct usb_device_id uvc_ids[] = {
 	/* HP Webcam HD 2300 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x03f0,
-	  .idProduct		= 0xe207,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0xe207, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Quanta ACER HD User Facing */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0408,
-	  .idProduct		= 0x4033,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
-	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
-		.uvc_version = 0x010a,
-	  } },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0408, 0x4033, USB_CLASS_VIDEO, 1,
+					UVC_PC_PROTOCOL_15),
+	  .driver_info		= UVC_INFO_VERSION(0x010a) },
 	/* Quanta ACER HD User Facing */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0408,
-	  .idProduct		= 0x4035,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
-	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
-		.uvc_version = 0x010a,
-	  } },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0408, 0x4035, USB_CLASS_VIDEO, 1,
+					UVC_PC_PROTOCOL_15),
+	  .driver_info		= UVC_INFO_VERSION(0x010a) },
 	/* LogiLink Wireless Webcam */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0416,
-	  .idProduct		= 0xa91a,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0416, 0xa91a, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Genius eFace 2025 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0458,
-	  .idProduct		= 0x706e,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0458, 0x706e, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Microsoft Lifecam NX-6000 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x045e,
-	  .idProduct		= 0x00f8,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x045e, 0x00f8, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Microsoft Lifecam NX-3000 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x045e,
-	  .idProduct		= 0x0721,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x045e, 0x0721, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Microsoft Lifecam VX-7000 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x045e,
-	  .idProduct		= 0x0723,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x045e, 0x0723, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Logitech, Webcam C910 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x0821,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_WAKE_AUTOSUSPEND)},
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x0821, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_WAKE_AUTOSUSPEND) },
 	/* Logitech, Webcam B910 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x0823,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_WAKE_AUTOSUSPEND)},
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x0823, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_WAKE_AUTOSUSPEND) },
 	/* Logitech Quickcam Fusion */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c1,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c1, USB_CLASS_VENDOR_SPEC,
+					1, 0) },
 	/* Logitech Quickcam Orbit MP */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c2,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c2, USB_CLASS_VENDOR_SPEC,
+					1, 0) },
 	/* Logitech Quickcam Pro for Notebook */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c3,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c3, USB_CLASS_VENDOR_SPEC,
+					1, 0) },
 	/* Logitech Quickcam Pro 5000 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c5,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c5, USB_CLASS_VENDOR_SPEC,
+					1, 0) },
 	/* Logitech Quickcam OEM Dell Notebook */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c6,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c6, USB_CLASS_VENDOR_SPEC,
+					1, 0) },
 	/* Logitech Quickcam OEM Cisco VT Camera II */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c7,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c7, USB_CLASS_VENDOR_SPEC,
+					1, 0) },
 	/* Logitech HD Pro Webcam C920 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x082d,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x082d, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
 					       | UVC_QUIRK_INVALID_DEVICE_SOF) },
 	/* Logitech HD Pro Webcam C925e */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x085b,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085b, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
 	/* Logitech HD Pro Webcam C922 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x085c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085c, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
 	/* Logitech Rally Bar Huddle */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x087c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x087c, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
 	/* Logitech Rally Bar */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x089b,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x089b, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
 	/* Logitech Rally Bar Mini */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08d3,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08d3, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
 	/* Chicony CNF7129 (Asus EEE 100HE) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x04f2,
-	  .idProduct		= 0xb071,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04f2, 0xb071, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
 	/* Alcor Micro AU3820 (Future Boy PC USB Webcam) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x058f,
-	  .idProduct		= 0x3820,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x058f, 0x3820, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Dell XPS m1530 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05a9,
-	  .idProduct		= 0x2640,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05a9, 0x2640, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Dell SP2008WFP Monitor */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05a9,
-	  .idProduct		= 0x2641,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05a9, 0x2641, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Dell Alienware X51 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05a9,
-	  .idProduct		= 0x2643,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05a9, 0x2643, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Dell Studio Hybrid 140g (OmniVision webcam) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05a9,
-	  .idProduct		= 0x264a,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05a9, 0x264a, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Dell XPS M1330 (OmniVision OV7670 webcam) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05a9,
-	  .idProduct		= 0x7670,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05a9, 0x7670, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Apple Built-In iSight */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05ac,
-	  .idProduct		= 0x8501,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05ac, 0x8501, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
-					| UVC_QUIRK_BUILTIN_ISIGHT) },
+						| UVC_QUIRK_BUILTIN_ISIGHT) },
 	/* Apple FaceTime HD Camera (Built-In) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05ac,
-	  .idProduct		= 0x8514,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05ac, 0x8514, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Apple Built-In iSight via iBridge */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05ac,
-	  .idProduct		= 0x8600,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05ac, 0x8600, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Foxlink ("HP Webcam" on HP Mini 5103) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05c8,
-	  .idProduct		= 0x0403,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05c8, 0x0403, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
 	/* Genesys Logic USB 2.0 PC Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x05e3,
-	  .idProduct		= 0x0505,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05e3, 0x0505, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Hercules Classic Silver */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x06f8,
-	  .idProduct		= 0x300c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x06f8, 0x300c, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
 	/* Avermedia GC515 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x07ca,
-	  .idProduct		= 0x1515,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
-	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
-		.uvc_version = 0x0110,
-	  } },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x07ca, 0x1515, USB_CLASS_VIDEO, 1,
+					UVC_PC_PROTOCOL_15),
+	  .driver_info		= UVC_INFO_VERSION(0x0110) },
 	/* AVerMedia Live Gamer HD 2 capture card */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x07ca,
-	  .idProduct		= 0x1570,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x07ca, 0x1570, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
 	/* ViMicro Vega */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0ac8,
-	  .idProduct		= 0x332d,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0ac8, 0x332d, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
 	/* ViMicro - Minoru3D */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0ac8,
-	  .idProduct		= 0x3410,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0ac8, 0x3410, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
 	/* ViMicro Venus - Minoru3D */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0ac8,
-	  .idProduct		= 0x3420,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0ac8, 0x3420, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
 	/* Ophir Optronics - SPCAM 620U */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0bd3,
-	  .idProduct		= 0x0555,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0bd3, 0x0555, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Sonix Technology Co. Ltd. - 292A IPC AR0330 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0c45,
-	  .idProduct		= 0x6366,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0c45, 0x6366, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
 	/* MT6227 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0e8d,
-	  .idProduct		= 0x0004,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x0004, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
-					| UVC_QUIRK_PROBE_DEF) },
+						| UVC_QUIRK_PROBE_DEF) },
 	/* IMC Networks (Medion Akoya) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x13d3,
-	  .idProduct		= 0x5103,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x13d3, 0x5103, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* JMicron USB2.0 XGA WebCam */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x152d,
-	  .idProduct		= 0x0310,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x152d, 0x0310, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Kurokesu C1 PRO */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x16d0,
-	  .idProduct		= 0x0ed1,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x16d0, 0x0ed1, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
 	/* Syntek (HP Spartan) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x174f,
-	  .idProduct		= 0x5212,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x174f, 0x5212, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Syntek (Samsung Q310) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x174f,
-	  .idProduct		= 0x5931,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x174f, 0x5931, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Syntek (Packard Bell EasyNote MX52 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x174f,
-	  .idProduct		= 0x8a12,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x174f, 0x8a12, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Syntek (Asus F9SG) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x174f,
-	  .idProduct		= 0x8a31,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x174f, 0x8a31, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Syntek (Asus U3S) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x174f,
-	  .idProduct		= 0x8a33,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x174f, 0x8a33, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Syntek (JAOtech Smart Terminal) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x174f,
-	  .idProduct		= 0x8a34,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x174f, 0x8a34, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Miricle 307K */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x17dc,
-	  .idProduct		= 0x0202,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x17dc, 0x0202, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Lenovo Thinkpad SL400/SL500 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x17ef,
-	  .idProduct		= 0x480b,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x17ef, 0x480b, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Aveo Technology USB 2.0 Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x1871,
-	  .idProduct		= 0x0306,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1871, 0x0306, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
 					| UVC_QUIRK_PROBE_EXTRAFIELDS) },
 	/* Aveo Technology USB 2.0 Camera (Tasco USB Microscope) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x1871,
-	  .idProduct		= 0x0516,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1871, 0x0516, USB_CLASS_VENDOR_SPEC,
+					1, 0) },
 	/* Ecamm Pico iMage */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x18cd,
-	  .idProduct		= 0xcafe,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x18cd, 0xcafe, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_EXTRAFIELDS) },
 	/* Manta MM-353 Plako */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x18ec,
-	  .idProduct		= 0x3188,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x18ec, 0x3188, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* FSC WebCam V30S */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x18ec,
-	  .idProduct		= 0x3288,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x18ec, 0x3288, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Arkmicro unbranded */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x18ec,
-	  .idProduct		= 0x3290,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x18ec, 0x3290, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* The Imaging Source USB CCD cameras */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x199e,
-	  .idProduct		= 0x8102,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x199e, 0x8102, USB_CLASS_VENDOR_SPEC,
+					1, 0) },
 	/* Bodelin ProScopeHR */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_DEV_HI
@@ -3111,205 +2752,74 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_STATUS_INTERVAL) },
 	/* MSI StarCam 370i */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x1b3b,
-	  .idProduct		= 0x2951,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1b3b, 0x2951, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Generalplus Technology Inc. 808 Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x1b3f,
-	  .idProduct		= 0x2002,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1b3f, 0x2002, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Shenzhen Aoni Electronic Co.,Ltd 2K FHD camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x1bcf,
-	  .idProduct		= 0x0b40,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
-		.uvc_version = 0x010a,
-	  } },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1bcf, 0x0b40, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_VERSION(0x010a) },
 	/* SiGma Micro USB Web Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x1c4f,
-	  .idProduct		= 0x3000,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1c4f, 0x3000, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
 					| UVC_QUIRK_IGNORE_SELECTOR_UNIT) },
 	/* Actions Microelectronics Co. Display capture-UVC05 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x1de1,
-	  .idProduct		= 0xf105,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1de1, 0xf105, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
 	/* NXP Semiconductors IR VIDEO */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x1fc9,
-	  .idProduct		= 0x009b,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1fc9, 0x009b, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Oculus VR Positional Tracker DK2 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x2833,
-	  .idProduct		= 0x0201,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2833, 0x0201, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_force_y8 },
 	/* Oculus VR Rift Sensor */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x2833,
-	  .idProduct		= 0x0211,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2833, 0x0211, USB_CLASS_VENDOR_SPEC,
+					1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_force_y8 },
 	/* GEO Semiconductor GC6500 */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x29fe,
-	  .idProduct		= 0x4d53,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x29fe, 0x4d53, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
 	/* Insta360 Link */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x2e1a,
-	  .idProduct		= 0x4c01,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2e1a, 0x4c01, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
 	/* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x30c9,
-	  .idProduct		= 0x0122,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x30c9, 0x0122, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
 	/* Intel Realsense D410/ASR depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0ad2,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0ad2, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D415/ASRC depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0ad3,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0ad3, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D430/AWG depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0ad4,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0ad4, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense RealSense D4M */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b03,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0b03, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D435/AWGC depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b07,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0b07, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D435i depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b3a,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0b3a, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D555 Depth Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b56,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0b56, USB_CLASS_VIDEO, 1,
+					UVC_PC_PROTOCOL_15),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D405 Depth Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b5b,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0b5b, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D455 Depth Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b5c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x0b5c, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D421 Depth Module */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x1155,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x1155, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D436 Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x1156,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_UNDEFINED,
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x1156, USB_CLASS_VIDEO, 1,
+					UVC_PC_PROTOCOL_UNDEFINED),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

