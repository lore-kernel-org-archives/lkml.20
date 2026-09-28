Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2F64E77F2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609063; cv=none; b=Gp6Afn/R6I9/WbA82q3xd/FkL5ZwqyZ7dtjBQbDxjwNYagzsdnkooVD3T1jh++kAI77ul0cwjP8k7+v4+Hx1VyvOfXNCjEnQwRs2JPJZEvdlsgWr26mZrgGs8FGFLg74YCglnrJIgCMFrzvL+28KhUuGmlSIstbZuHcTyYCC5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609063; c=relaxed/simple;
	bh=Vg1lr7DZN3CZimWgNvaHKZuHREsCrdc2TfUIOcM8wzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWVEcZAijncLjay8BlCPmn3KDA9xqYbaU7xqwgYMtEjyko4PReWV3AJIyCv+i8n3neWRCBYukcTbzUaoYnaOgME8bwvH4w0fc7U84Z7xFIGX/dLpDuLo53n4H2vS5wt2Bq2mv7xmAt8KRq2VvXBhGS/YK7wg8JRt77u47F8uhGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptZbcaQ9; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptZbcaQ9"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a8878695e8so9966757b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609060; x=1791213860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gC6G+EntBmwmRW+R7tG2BBUtzviDX/dQF9SXy8xgEDg=;
        b=ptZbcaQ9uTEOk9SVIwdkyXRf0BKu/1OQMclSE9PJKabSuytNvDsYyDgKZZ8G4sg0v+
         dfk0oV3aN8+DHwIkiiQB2geBYRinNooBfIiCtkMjMJFHQsrVietlL9a+TTdcGu3xm/Io
         pXd+hXY7D0pZrroU8SwIwEam/YkdEeptTDaSsCY5SzGwyX7RAaTmkpIgNzRbmskJiN5m
         3CDmZoQwfCt0HzHHMsION+/WPIJASWFtm85XnWEQ42NELBSBUvUuUiugQ8tevnq4FcoZ
         +SLiE/Y9oj0mMvQlyd6eOm6GX+O1g/L+7i8uRbHIz2OcLutea6PVsvcrO8novfeSPIX1
         qfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609060; x=1791213860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gC6G+EntBmwmRW+R7tG2BBUtzviDX/dQF9SXy8xgEDg=;
        b=mZZ6N1Z76P0uDFPR+TEjhsC8rwXnarCruFBo1UwBwGK6DYuIzlcn781nXDONrs6Lhv
         +R4J+ymZjjf6vgJ9QBELpk/Cn93J3HSl+u++1jGaMGFO/rzEYZBv7LZl7DfVoXfpbrRe
         mnDyNHp4ul2rvS6ZluJBJZPjM0+t1HcSKfjpJPE6vbsuPpnNKg/lnKBhZtNOEtdERmGU
         tCc3H+FqoGTDDQ1oh+3XlMBKYqvFfpgxKDTIpI7tvrtFMtOkD4ixsflUYowEnniho7lA
         fszrpc0iF4kePKOPQKj16v9J+UpIDrwtR8Hgz5XmGnpj+Wr5ke2RktRGZCO5iTxE9YmE
         IdjA==
X-Forwarded-Encrypted: i=1; AKwUvBzi3FXckhgCSVLra96mHNiqs3SkRVPgUEP32HarrbaQAprcOT1YRfXHVYCuzx/J/BiPxOhfBTy0Y0ooE+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVQduvzPcHgAT1WaPQurThfvP1WB65JGhDwdML5MhWk6G16dfr
	3V+nnUFX+BYvHx89q0pLCrj6XtdHqv2WkpbLZsnHMW3r6g3v/h+gS1rm
X-Gm-Gg: AYBFou0/m56/B6zkaIbOmbFSP3QvGFWK8FJ8kvFgpsJrDzKg56JFzJL3iTKPiL4Ub4C
	+hDnXi58ooHiB0YQLnPyZ3fH4ypx39H+l8aGUeRZi31ev4vhCTkseOhhK/zRXekKs0ZOJCrNTqf
	PI0fb1xGIFORYlSt+o+Om0N4wh4ry/M6BcQG8hqZVUmdfyc/bO2q0UCwVhF8qjrmR1S9zYYK8bD
	QCTvucMeVcdNr4Q5eiE9uXpXojbxlJemdTb3CbAhvtFF9uLIxQPxhdLRIPj1TVinG4gMRiO+OYI
	pBHkybTxTSocVmsMY0HvlCiyI3KAlfbCHzLVpfm8b1uLgl00puJoQz4uvGGi0J3saOKAWAsEXaU
	7ISe48I5uRTEEb8o4P5J69pIXpmAADxdbABkMJ1F09oIzwi3cZV0p8ikTiVof2J2BM7Wmpoo6ZC
	d7g0ItWb0nXjtjpJ/D6wzrbdDvRWtJp4qXnagGzXqbHCyaZ6nxDVikk6mcgISjzln+5SmsmDMhO
	LXGy9fzuSjCbYeaTYZYyxsp5Pdijgu+hUHRdn9muSEpdQ44DUFn2g==
X-Received: by 2002:a05:690c:6e84:b0:8a9:693a:326 with SMTP id 00721157ae682-8a9693a0d81mr28243677b3.7.1790609060361;
        Mon, 28 Sep 2026 08:24:20 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f882ddsm45777777b3.21.2026.09.28.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:24:19 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v3 3/4] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Mon, 28 Sep 2026 11:24:15 -0400
Message-ID: <20260928152416.766957-4-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928152416.766957-1-jordan.mymail@gmail.com>
References: <20260928152416.766957-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tiny 2 (3564:fef8) reports a GET_INFO of 0x03 (GET and SET,
no AUTOUPDATE) for CT_PANTILT_ABSOLUTE, CT_PANTILT_RELATIVE and
CT_ZOOM_ABSOLUTE. uvc_ctrl_get_flags() then clears the
UVC_CTRL_FLAG_AUTO_UPDATE set in uvc_ctrls[], and uvcvideo returns the
last value written by the host instead of the current one.

The device changes all three controls on its own: gimbal moves take
seconds, and its subject tracking pans, tilts and zooms without host
involvement. GET_CUR reports the live values, including the current
speed for CT_PANTILT_RELATIVE, but the device sends no control change
events on its interrupt endpoint.

Add fixup entries restoring AUTO_UPDATE for the three controls. The
fixup replaces the flags, so each entry lists the full set.

Exposure, white balance and focus are left alone: their GET_CUR echoes
the last SET_CUR even while the auto mode is active.

The vendor has been asked to fix the firmware (support ticket #8220)
and has not responded.

lsusb -v (device descriptor and Camera Terminal):

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
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 64c90c380d3d..49ea6a6bcf57 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2876,6 +2876,18 @@ static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
 			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
 			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
 			UVC_CTRL_FLAG_AUTO_UPDATE },
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

