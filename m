Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAED30BF6D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308761; cv=none; b=P11HFBefu8gGCXpWzK/WCthbwlfwV/YqDcOXKfdVWkFxJfCWFH15qUSARBEa9PBV0ATaz7ZFn2bkmn1UuOD2LddFX0aGskmYwLeYWkASivqtKsPFlsxA2TLH++X/l3pFxW7+WM4NQ9RC50c/wuRGGxWhKkkldnV8JdN4U3SOsl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308761; c=relaxed/simple;
	bh=fHIem79VEQd6VN+J7Xr5Z2Z52DwKbCv2aFsKkIIRoIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FfTmrEHEXvVeIzHBW371cidBwlwujZ714oBvGvaSZlPmYAAdGs/bqSNgpzX73aQ/0ZTN52pbpOGJoUf79pZN4xbUViw1uAwuSKzUdkkzCOjj7YXmqIKw4/Tnm/cHV5siawdQAuiD5dnTwtAkVI3bOMxFq9L592Kag5ZSDzRQIbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTv0O89N; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTv0O89N"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8623b1e7cb2so7877907b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788308758; x=1788913558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMkDLgdMNZJUh64SAlWSMLfQyj4fAJxQgv3yE+ZZDPs=;
        b=UTv0O89NMArCClJ+4YqwKWsYF918IWerVKy5XUanXyug4quJtiAAYB+WOou3+dWDo8
         4H/InzwIbQnOlKgaa9QXLOANjW3UwK7NwxyoaOCFt8m7d/7owT8hJZx64FNEkiHkdG6X
         fZIqKg4yxxJGPdjdLFIlfJzj2rVgez+FjR2EQAUbH6M05bdr2KOIXLkZYmO8WX7xujJe
         j6nYTEdylKD6xwTLouxYBE6z04m+MH6V5MrbiM4BgzP/Oda3z+9wP8HszMQZp0+V3Yte
         a5TYWJxaNsze8RPGsllitfeoQYFjYwwIZE5g29DOmH+iD1QQLDwCciKmb5wkTltHaxFM
         bsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308758; x=1788913558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMkDLgdMNZJUh64SAlWSMLfQyj4fAJxQgv3yE+ZZDPs=;
        b=j66OIfakKim9LNBhCNl4Wc4NQg0H01pOxTG1RBPewJTzXDsZGWXYTNTQvZtPSnXrgg
         IV0oJlzEDsrTX8aNZewFIQNxgunL6M8b86twx84H4i92/o5agnk4xDER2fd6A8AS4qHq
         QcF2SZqdpcp4TBvLcp4Lnnxog1jKfPgU17xkk48+H6iXD6l836589shoSv1qCcGqFPjP
         3GzhoQtP0yoY8Pe0er+V0SEaUjagHNSDV/iVMncWoXvbv4fNkQsnUnZAVRQQQh2USDUI
         vpurUwfyybFNx6gvz5Ys6o/+iGmN0TyBDeSyAz1p+GCSlTQE5DUwNTPsclN5W35/W8Q1
         6cDw==
X-Forwarded-Encrypted: i=1; AKwUvBwZoAqDOf7PSCCFPx++gy14zDNqqX9h2K9rxJMur+Jb5zTrVwix3qldbyjlVeThA0wq7XhQlQJ0WnPUhA8=@vger.kernel.org
X-Gm-Message-State: AFuF++nW814Mfmg9OGwhX/uHyqBOgmcTIhSCiSui0pB9yqMbD4e+oCHU
	nOBOt6T11cQJiDcNCNisLVN1qqh56jYWVt4T80uuxY76/kvSwaobGHDW
X-Gm-Gg: AYBFou0upjfE9071qizVejkYNqQ/aNUquJrzsHoxTPqK+VOW5JuObwGVMVSU9djbppZ
	1yOutSjAdQs89SDUsKK9rnE0wvCaEvNx6PzAOvI+xOpLmWuqVNqSSqcdzeOz8hQkeYEZRw1L/Bo
	87GDhLGEvR1oh/ij7U6SMHR2+W+pUEZOsLDJWtcHNQKShlBfTa9pch7sQP4+BoJSfLR3qkMPSLq
	KufaZn1Gjj1EPaBb+r/L0y5gjKHu6SbjH2acK/+7AhtoQwr4l+VPOkxoWKz871YcKnVaYOsDyf/
	+Wom+WxDM8wB3PuC6W92lDz4RSEpoMyf+PeNunNenoZn3hZ+AgdQaPlEKEXDiQoeJl/lA1FNphP
	hW/R30ONKum03hcSmKoETiV1phGI63cnmUa85OTWqhmZvdp/MptoMZjp4SRHzlP+FUAMoBZH85Q
	wOq6uuuOWRqTwRlhVCiI/VsEh8PoZr1lxBvIhZhwvttAq9RD0EqTi8Tr5UMtA5ERNy71PAB+UQa
	kCJkJ9BnDXT9UDrVN0DK6syzgg9U0RlbhOcazajRfU=
X-Received: by 2002:a53:ed8c:0:b0:66f:1ce2:db1e with SMTP id 956f58d0204a3-66f9bd41734mr273445d50.35.1788308757806;
        Tue, 01 Sep 2026 17:25:57 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98656c1esm755344d50.11.2026.09.01.17.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:25:57 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Tue,  1 Sep 2026 20:25:53 -0400
Message-ID: <20260902002553.34839-4-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902002553.34839-1-jordan.mymail@gmail.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tiny 2 (3564:fef8) computes its GET_INFO capability byte per
control, but gets it wrong for the controls that matter most on a
motorised PTZ camera: CT_PANTILT_ABSOLUTE, CT_PANTILT_RELATIVE and
CT_ZOOM_ABSOLUTE all answer 0x03 -- GET and SET capable, with the
AUTOUPDATE bit clear. (The byte is not a constant stub: CT_ZOOM_RELATIVE
correctly reports 0x0f, CT_ROLL_ABSOLUTE reports 0x01.)
uvc_ctrl_get_flags() takes the flags from that byte, so it clears the
UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entries set for
all three controls. Without AUTO_UPDATE nothing clears ctrl->loaded
after the first read, so uvcvideo serves them from its cache
indefinitely: VIDIOC_G_CTRL returns the last value the host commanded,
never the live one.

All three controls were verified on the hardware to change autonomously
and to report the live value on GET_CUR:

- pan/tilt position keeps changing for the seconds a commanded gimbal
  move takes, and changes on its own under the camera's autonomous
  subject tracking;
- zoom follows the subject under the camera's AI framing (observed
  0-71% with the host issuing no zoom request, matching the vendor
  status protocol's zoom report);
- the pan/tilt speed control reports the actual current speed during a
  relative move (a commanded 80 reads back as 78, then the deceleration
  ramp, then 0 once the gimbal reaches the end stop). Without
  AUTO_UPDATE the cache would report the written speed forever.

Add fixup entries restoring AUTO_UPDATE, alongside the flags each
control already has in uvc_ctrls[], for these three controls. The fixup
replaces info->flags wholesale rather than OR-ing, so each entry spells
out the full flag set.

The camera's other AUTO_UPDATE-flagged controls were checked and
deliberately left alone: exposure, white balance and focus have working
autos, but their GET_CUR just echoes the last SET_CUR (the firmware
never reports the auto-chosen value), so AUTO_UPDATE would add USB
traffic for no benefit; there is no auto-hue; CT_ZOOM_RELATIVE already
reports AUTOUPDATE; CT_ROLL_ABSOLUTE is read-only and unmapped.

The vendor has been asked to fix the firmware (support ticket #8220,
2026-08-04); no fix is available at the time of writing.

lsusb -v (device descriptor and the Camera Terminal):

  Bus 003 Device 006: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
  Device Descriptor:
    bLength                18
    bDescriptorType         1
    bcdUSB               2.10
    bDeviceClass          239 Miscellaneous Device
    bDeviceSubClass         2 [unknown]
    bDeviceProtocol         1 Interface Association
    bMaxPacketSize0        64
    idVendor           0x3564 Remo Tech Co., Ltd.
    idProduct          0xfef8 OBSBOT Tiny 2
    bcdDevice            4.09
    iManufacturer           1 Remo Tech Co., Ltd.
    iProduct                2 OBSBOT Tiny 2
    iSerial                 0
    bNumConfigurations      1
  [...]
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x00023e3e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
          Exposure Time (Relative)
          Focus (Absolute)
          Zoom (Absolute)
          Zoom (Relative)
          PanTilt (Absolute)
          PanTilt (Relative)
          Roll (Absolute)
          Focus, Auto

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 64c90c380..74f6e8039 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2876,6 +2876,26 @@ static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
 			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
 			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
 			UVC_CTRL_FLAG_AUTO_UPDATE },
+		/*
+		 * OBSBOT Tiny 2: GET_INFO reports GET|SET without AUTOUPDATE
+		 * for the pan/tilt and zoom controls, clearing the AUTO_UPDATE
+		 * the driver's own control table sets for them. The device
+		 * moves all three on its own (gimbal moves take seconds, and
+		 * its autonomous subject tracking pans, tilts and zooms with
+		 * no host involvement) and reports the live values on GET_CUR.
+		 */
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_PANTILT_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_PANTILT_RELATIVE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_ZOOM_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
 	};
 
 	unsigned int i;
-- 
2.43.0

