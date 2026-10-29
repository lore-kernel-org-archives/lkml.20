Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244675;
	b=1URH5RRr4FMfbPI4NZiAkVR15CECkQwUGWsGDb9mLcBio4DSMKvfs55symyN2v5IHJc1
	 to+k4KX5b8+ZF/gIm1y68G7JP3pal1npL4/3OZuin5nGGkB8rIjSUzcFxW/XG3Qxbvsao
	 Te6VPK+8AyHm3Ep92Lnm7K+U0JBtWwH/kdMD6Ndv2LQo12KQSzf0f2DkyafH1jByke/7D
	 wHjSNuNzBONjzq2pxdcWPunePCUnNpxP43ctJma43xA0XfnWUUHvg7BGHJEfUD54Qvrqg
	 Pk5zRtzZcDIQ3Fq95o6srzu38CHY2pEL/Qval6KFWavc0+lzHUu9FK2PPWoRQMmA2LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tXqVgIHedAkUX1I4ngPnM2GuJZyv0UpTtxGtSVGkbxk=;
	b=4wkaIVSzHo8lJu4U04TGnKkubWVM0bAYXw1mdCN1a2TySXXXIuxaejrjvm1jrUJrAHlR
	 cpnLMwMonp9m758ekeETBlNU212c2Juln4DgBmkUKdm0ZumrzQcmjltcjC5tDBwHWrhOs
	 xkQPY1qm/7Gc8jPGQNg7MDIJlsJRR8PVgSt+UWGQnHTAXdt0n+lSs8Ud9v5c3kXdz6KIB
	 TNbr6ExA/rlNryPpDWqYR4qa77hzl76St9jzRZe0LYOkVUnHBhkeXjnCLH5pEa6oWqEw0
	 XgMkZx5Gd8BNiyDXKigaaFFSUq5vbAUCp9qlFBsThfO2RxpYbnh/yTM2psjOnemZ0ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYX39ZuJ;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C18B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYX39ZuJ
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1433847a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244675; x=1793849475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXqVgIHedAkUX1I4ngPnM2GuJZyv0UpTtxGtSVGkbxk=;
        b=zYX39ZuJSN0UsvntbvUpb3KShsqH1yk55dbvdt2Ka+E4wcr6yk/MDMhfutRbsSFuql
         4/1q6devLsWltIva8YOiGifbaH9flU+l1q2C+XxTND0Q1PD8eEFBcC7fAaw1J8v4CJDP
         3uEYqGgklov6SdcABncf9CrYparZY5XTulR67I2EGT/ZzLdYG83GpdDJ5hb96X7U8UYn
         ile1SN32hs29/bhF+1b+MuzM6CeRocE0rxEF0sMc8yM5RhEuqyneQ/lksigYB55Jau+z
         ZuYx36Ip5/vRYeseQTofc2UjZFBifXUJH6pKdf+16GsVIVdZkfp6tAmdGQc5PyV8Ru+Q
         4VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244675; x=1793849475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXqVgIHedAkUX1I4ngPnM2GuJZyv0UpTtxGtSVGkbxk=;
        b=qDXsbqB29e/fVoVh6duuiYzt2pGgmdMWU1gHeuuTax7tdJYAQ0t1maZ/aornJj0IFH
         +3by7NrJlPz789a8wSY/Wz+n5pXyktxoPtmLmN1DibTH0lLIBCGhgcWbMWrQm9cFFl6h
         EUd69Z+vUcfCQ+gj56wh0tK5tdBFI39LfJI/Ez/hVWYas1tTqPPsmmbbB4ukdVA+Svcg
         tLJmETrR6zRwoD1oaNbdTiZLbuOLp1fZsUStQqaFobXSm2zDApjWy5Md2ecXZML9NmOw
         zFGdCwTVRHWUohViPtMhPzvwSdnkoEnzDExyvqnC51BtK9mGaq1xCfogoaS02WCwhknw
         LYIg==
X-Forwarded-Encrypted: i=1; AKwUvByyvkZ66QJX0K3HTNZh4HTDgDKzdQqHTQ6RuxvuqBLWqqFJnDSnKzAH1qD+vC59No+d50aNyQ/s2xqIMjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIT2Sjt7kE+MG3YJ6EfDKKl8tNikZYemMx0/Vi5jGgfPdEkFEC
	SWcaTfXfm8A6mwsUOj2kh8/PWSKE0suvJmnSVE+7byc2B3713bqehWIXq6Of5u0T
X-Gm-Gg: AYBFou36IExJKw2nt2RCPrJn+j0Ovnc7fen+FNJMUvSL5f25XXE9UAvFIXzc5tYcr5a
	xRW2ereFSDZczU5vDemAJtTlrxfRGLgHUUEdjHbiuMKzo8wJvohN1jp1c4q7PW0asvtnnYY6ILc
	e7PGYT627BpW1VoegFkxW2msdZWAQoUSnWoYacbBgXI2eARA8zFPIrRUT8hghqazzOuH1DaVypE
	sMamaHe4nHMTJDeCQ2gZ/KeWfxNeF1cGodmjtLbPayCMV95yYOUDIDul3QEyBWw6CgNTaq2EJyz
	+MfvtimZ+PFrjP719NZ+dl8/RDPIkGwCMVRodRAjXyjNXRNQd/J9MHz9wZuo267+SgrLU7mt6lT
	3MRabyUMHx/bPV5XxCTc2HcqX3MCV20BnZhHdy/54ovlNuJRiIcxaYhZvnGkHAnr4HeWARjUuaV
	s0VOmXGNKfMwypUCoWa6UyoTjzbAA85mNVNOooos6e267P6Q4/K+ZvF1VR36TUALtFh/bHGx6V3
	KIgtBGoSsj5iMOLDyTLVksN/U5hVCjyXNP963KCPZapFk6Rsd+MY8e8lBdA++Q+QkorHytEA2aW
	nvW/qN12NSWswrAbYCi1BKX5V7yq5zUUHE4XJ1O20NUNpzDUSBqD1iGmWZFM3fY+KXpfFH8sZnR
	Vg4Hjh2U3w37KbIAoeBUwLso=
X-Received: by 2002:a17:90b:1343:b0:3ab:2236:6b3d with SMTP id 98e67ed59e1d1-3ae5822fdf8mr3208481a91.27.1793244674909;
        Wed, 28 Oct 2026 20:31:14 -0700 (PDT)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e898317sm1824393a91.16.2026.10.28.20.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:31:14 -0700 (PDT)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK camera
Date: Thu, 29 Oct 2026 11:31:06 +0800
Message-Id: <20261029033106.7374-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
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

UVC control requests issued when preparing a video stream sometimes
time out on the HIK 1080P Camera (2bdf:0280):

[   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0280)
[   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 26).
[   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110 (exp. 26).
[   58.592967] uvcvideo: Failed to initialize the device (-5).

Adding a 1ms delay after each control message avoids the issue.

Introduce UVC_QUIRK_CTL_MSG_DELAY_1M for this device.

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
 drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++--
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc7..c720d75 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3162,6 +3162,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
+	/* HIK 1080P Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x2bdf,
+	  .idProduct		= 0x0280,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_CTL_MSG_DELAY_1M) },
 	/* Insta360 Link */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a..4667f86 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -35,13 +35,19 @@ static int __uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 {
 	u8 type = USB_TYPE_CLASS | USB_RECIP_INTERFACE;
 	unsigned int pipe;
+	int ret;
 
 	pipe = (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
 			      : usb_sndctrlpipe(dev->udev, 0);
 	type |= (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
 
-	return usb_control_msg(dev->udev, pipe, query, type, cs << 8,
-			unit << 8 | intfnum, data, size, timeout);
+	ret = usb_control_msg(dev->udev, pipe, query, type, cs << 8,
+			      unit << 8 | intfnum, data, size, timeout);
+
+	if (dev->quirks & UVC_QUIRK_CTL_MSG_DELAY_1M)
+		usleep_range(1000, 2000);
+
+	return ret;
 }
 
 static const char *uvc_query_name(u8 query)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4..1426d14 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTL_MSG_DELAY_1M	0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.25.1

