Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922A84E77F1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954963; cv=none; b=iL+xaCs0kKBT9bdNdbs/CF9N874fafqY9wudAqNs1HtAQVP/YOqjSUBWNrJVyaup/X4F/N+0Og/oqyt3ay2hu+6MRGP0onSZBtnwQqOsvJsZr2hQJNnKdNNQ29a9J6hLT/TnUWFbzIDAJ7d+VLln58gbkqUlMAOkbIyDQGNLejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954963; c=relaxed/simple;
	bh=+OBjYQGtLlurh1faTG96XQPXKsb0cUKChMpKN6GSHpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7VmzKSpgkC0aiQOeIZxfzjRL31P6graMO8eChOD7l+Ud2zReLbjiAIptCQ5ITDQsdk4IdguJb3UW9y4b6/8l9buNDuKXNBIfDpDjtap+XxxLeGNEkKiVrQo18RlnfFuRlvqC8njchk3wg6100zL2XVRqfafzi5FKRlSH/2N98E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fOgg0TlI; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fOgg0TlI"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba379d8804so3805627e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790954959; x=1791559759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUCbF1X+LhYYU0qbeAvTrQr5Hsx9TGU8eackVdXgsqk=;
        b=fOgg0TlIKXJDPlWMr9E9RjPiaB72Z/pnpsB10yY8y1GHGMz31Lc0JidCDcc1X5CyQD
         grudkemrmsHXQNCRZ5fSacIfMwUrchq4Bkz9YtqJdgy2AgiJAtuISXWbCLytxZ29bttJ
         6Dy4fbfrCcCxMDIiqRGkdQjGQ6Oj9uxA5ZTq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954959; x=1791559759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUCbF1X+LhYYU0qbeAvTrQr5Hsx9TGU8eackVdXgsqk=;
        b=Rc1+QLXVGuKgFGXPWP+MSR7RrRGS0FiQ8ITYE5KEf3cFh8XnIDeryVc0KaOxfoxVEh
         aaLnhhZWul2MPXbglIkPXDpHWq+8YJEBZ00zBEmf83BAwGJvJdjb+siJMF/2/UwiLwbQ
         7y2eij5w0vwX8kZT8pKHLlhFi7W7wuAcO2wTRgumYjbsbUoaIy1KlERwStSomxwA0MKl
         k86S5Fggn9IVL8BPkPzPKLd2YdG5shDdEI7E3tTJaj/V0+QaP4M2lpr0LKodcg5omRsa
         8QDxAernsL/RxB8lOQCieVuxpLoTnBgNgaIDisO+S+RXXyxLMBIvF485SeJRCWkqF5iJ
         sqig==
X-Forwarded-Encrypted: i=1; AKwUvBzLBCkjZSnGAPJL9i/Kwn5VYvm2/GsUse5PrRYRQRV3lYCLjrOwUWvjBkiLlRxMPP+mntK40AqcLxF9kPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlrgz3IimIr4jlBCkxMGbmzwglg/FiMmdTHeioioGk1x1GYYA4
	/eRYrizpWovLYrRPFBcXVhL2FRLGjVSMj5Es20ibzvSrqdKVm+82iHWh3O48ei2EyA==
X-Gm-Gg: AYBFou1pyoBhWE0xEthvgFrWNyBdu9LwdIWrjX6YhqmHUIwNIol/DzGgoiMFFmQ25ru
	obmm+AzfksjJNHfitmL4OTrTPCdwQuwHO12Miz4aUOgY0P2zbf8SzzpW3AoUBK6D1KFgSJwuyWe
	NohqR6gVh84jHHVsICiWjCPGGA5wBc0Ju0BxK1z5F2d9LLg+78jNn8xp1ySKYY3uOfj1UrlXl2I
	P54hjoE6fpswGLG59rPLNjb+uWYobb1nZwqtIO7oM2dowQlguNc1jgzEJYy3NCY8p+UaWWhahGI
	8Vezd/9R9eqSIdGXTcCUQv6j9eNkNwuaLZLvi7HdD0boK8DYV0P6+IUQDR0YIWYr1MrEH3WxOnK
	VWC/xO0t6Wn71eCatkig/pr1KwYj+a/iNlUytFYj4lTLyAA7QYmExyJ+7elm9awOWoABfqJadxD
	OOVGnIELMGJMawErRAMIHJzRbg7lCfOmyJZmMKIAsFnrQzNDwDyTSpHYmfW3e4qhPkpPos+EVwW
	6S3gonKMaQUmlDyodXGQoRRzxzCGFJAjP8VdPRTc0lpdO3D+/dkDO4=
X-Received: by 2002:a05:6512:b96:b0:5ba:43ff:3bc9 with SMTP id 2adb3069b0e04-5bb9370edcamr1375179e87.3.1790954959625;
        Fri, 02 Oct 2026 08:29:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c718f62sm835544e87.12.2026.10.02.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 02 Oct 2026 15:29:07 +0000
Subject: [PATCH 3/3] media: uvcvideo: Sort all the uvc_ids quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-uvc-sorted-v1-3-65f52e4d7e16@chromium.org>
References: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
In-Reply-To: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

We seemed to have some devices out of order. Fix them.

Also, add a couple of auto comments to help the CI identify what parts
needs to be sorted.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 049566a4e5f7..45267a59003a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2550,6 +2550,7 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * Sort these by vendor/product ID.
  */
 static const struct usb_device_id uvc_ids[] = {
+	/* keep-sorted start block=yes */
 	/* HP Webcam HD 2300 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0xe207, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
@@ -2582,6 +2583,22 @@ static const struct usb_device_id uvc_ids[] = {
 	/* Logitech, Webcam B910 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x0823, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_WAKE_AUTOSUSPEND) },
+	/* Logitech HD Pro Webcam C920 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x082d, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
+					       | UVC_QUIRK_INVALID_DEVICE_SOF) },
+	/* Logitech HD Pro Webcam C925e */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085b, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
+	/* Logitech HD Pro Webcam C922 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085c, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
+	/* Logitech Rally Bar Huddle */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x087c, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
+	/* Logitech Rally Bar */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x089b, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
 	/* Logitech Quickcam Fusion */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c1, USB_CLASS_VENDOR_SPEC,
 					1, 0) },
@@ -2600,22 +2617,6 @@ static const struct usb_device_id uvc_ids[] = {
 	/* Logitech Quickcam OEM Cisco VT Camera II */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c7, USB_CLASS_VENDOR_SPEC,
 					1, 0) },
-	/* Logitech HD Pro Webcam C920 */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x082d, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
-					       | UVC_QUIRK_INVALID_DEVICE_SOF) },
-	/* Logitech HD Pro Webcam C925e */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085b, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
-	/* Logitech HD Pro Webcam C922 */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085c, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
-	/* Logitech Rally Bar Huddle */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x087c, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
-	/* Logitech Rally Bar */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x089b, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
 	/* Logitech Rally Bar Mini */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08d3, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
@@ -2810,6 +2811,8 @@ static const struct usb_device_id uvc_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x1156, USB_CLASS_VIDEO, 1,
 					UVC_PC_PROTOCOL_UNDEFINED),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* keep-sorted end */
+
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

