Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B154E7800
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609064; cv=none; b=Tj5XUMCnx4NY6Ul778okdD858rO7W6f/BdHfoTY4iUlkvH724pOJm2p4B6ejoM97f5bMMBlItSU9BL67iHaao2U+gNR1WjTrNltfX3Tmu7sRnGc6rmIIZv5v7kHxBLSH0WMKkPkCSJ7F76uCGUNqdDwr+gbyKSQHYUbbIlmydgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609064; c=relaxed/simple;
	bh=dyMLIIhtRf796L1heZxwAoB97IRGUiGWE3cs34LMKBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3+57cVcyru1qgIVW65b6N47KIqHJi3Ju0ZRxFRIz/aE5nNa/5wTr+lZaAFvmGkkTf8gTa0wUfLwZMmrbFXLLktp2Ao7OFovB7fQP0Ik4LSLqwPmr+K0NtQAtdXu9YvHhW0udAqG0U4awY33A3WtKN1Lozkho1Srm4hwFfm7YnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8abMq62; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8abMq62"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a886df36f6so16428617b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609061; x=1791213861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8I37KR0AOjGA5YhlZkBOHcbAFH3+6kbNF/UPG8VYmE=;
        b=S8abMq62X9ehXXRc/tS3CqfY7rJmqjjli0Oulz6fsEu5SlUxes3GZlGkcgGvA8Nwbo
         Dhk0A27dskW1zuHqICoobcncPe9Ve9pBlX9ROmTUykbvAZxdQhl89Lx8ct3A0yPiRxK0
         OsWA47m+Ei+5v6hNfcCSqy95sbbftjtHUU4HAzvHZVCtglSsTO+Ril1OWdyW/xPYNv94
         pCof8lBdoSI1Vh8aiub9eUANJM3uesCE0beHjTtO3fDgl9Rag++RQAMXVHmEjJ0CbP+A
         rNqjWVDe69VllkhQ+l5UqPwHtT537v3hUNwzFqlCd8g+Ha7qmhoUBfArcN1ANJVnZ8wY
         RDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609061; x=1791213861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8I37KR0AOjGA5YhlZkBOHcbAFH3+6kbNF/UPG8VYmE=;
        b=mietuzDMRI98QUjUw6DsrMo2YgQdO2V89wN8rz3Vji4lnZXxotC4zHQxMweeJsfw1s
         7g9sq1fAYd0owEyah09mnQlXFh7dHvXMvzy81+Rcc+DSRmdRB9Pp7COIQvraUDtOogZQ
         BVLNCxVR9Q6KSGv6xPPPp+HRA75Qd5cACPlMEZzPalHUAcRfbvA+LyScws7UW5isqYrH
         o4nY5g1L1bcO4B1mDFma2QV8POX7nKjyKXo/3A6si/Hg9GEmkrZuZfcaZ32W0xMWVjPU
         b/3Rguuo/iKieI1VtsPu/4yIXiRZaOxQSJXUYTYwvrynTwq5dvv/qBbZd/iW2pv/6VqZ
         tsuQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/83TMdkwCFDyqPSpMIMEnNUbx9k2LitUFYC7jfpq/4pchmRHU4JNs1OT3RsmtC+hObQrzjmzVQnszX5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZI8fzIMpA9jA/itl/ugBa0i0auGqFlQkhHLyUqttq683CF4ZF
	XMiNJuahF2pCDQKPnGmtcEu47cORc7A6DgvzG4m740Jw5zHr5LJDx9+Y
X-Gm-Gg: AYBFou1B6NasUWZ/FDqoF/d8pqoW3CqZEU9RXym58+WDYSbIzm76KdSCP1+2mJKp0j1
	H+2Irj4rme80xmg25eLcPi9baCeCMFodnf95iUQvx9B7tSNd/qDzFWL7b6Xz9mUsLV82cniRsrD
	pjFtd18/YtkyGnoA1Krv9rFlacABbhMtOe5bknfFwvpVbkv7GIiln5lxNhCJcawlxfOgISBwLDc
	KTRdo0YDUHLV+BzcY+zRd4Xz1jBtfZ/U04luLfwOUuMLmwOfSt4PSf4AiIUqXutrTKsGGFPLBnk
	Xfor45UrbjQmPcv7TK2Fk1jPAaeIVSH6ppt3RdIwhc+SVfGO/Hn2Xo3EMrLkHO24yrzVoUbjiVA
	QbIz+5EgFM9XNzef6fdzTgge8PXFzbLobUWELKOSQOWoQxSq+OsVqjsN7XMV5O6oIRcy7G1hdrR
	6VNa0rVXWu0j04NC5KPiC5Xu9cqXtCsMZ4sjbTSSzGskErkVPUrPNXvsbTTATuVQeGLIWKCf+EK
	qRQh4mdCvVEPcu8d2YUAXCeC3EvaoanbU3QvLppql3vlRby74Td7g==
X-Received: by 2002:a05:690c:60c1:b0:88a:99a:6ef7 with SMTP id 00721157ae682-8a64e81107amr65370017b3.29.1790609061206;
        Mon, 28 Sep 2026 08:24:21 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f882ddsm45777777b3.21.2026.09.28.08.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:24:20 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v3 4/4] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tail 2
Date: Mon, 28 Sep 2026 11:24:16 -0400
Message-ID: <20260928152416.766957-5-jordan.mymail@gmail.com>
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

The OBSBOT Tail 2 (3564:fefc) has the same firmware defect as the
Tiny 2: GET_INFO reports 0x03 (GET and SET, no AUTOUPDATE) for
CT_PANTILT_ABSOLUTE, CT_PANTILT_RELATIVE and CT_ZOOM_ABSOLUTE, so
uvcvideo returns the last value written by the host instead of the
current one.

As on the Tiny 2, the device changes all three controls on its own
(commanded moves, subject tracking, and zoom changed at the camera),
GET_CUR reports the live values, and no control change events are sent
on the interrupt endpoint.

Add fixup entries restoring AUTO_UPDATE for the three controls, with
the same flags as the Tiny 2 entries.

Exposure, white balance and focus are left alone for the same reason
as on the Tiny 2: their GET_CUR does not track the auto mode.

lsusb -v (device descriptor and Camera Terminal):

  Bus 002 Device 003: ID 3564:fefc Remo Tech Co., Ltd. OBSBOT Tail 2
  Device Descriptor:
    bLength                18
    bDescriptorType         1
    bcdUSB               3.20
    bDeviceClass          239 Miscellaneous Device
    bDeviceSubClass         2 [unknown]
    bDeviceProtocol         1 Interface Association
    bMaxPacketSize0         9
    idVendor           0x3564 Remo Tech Co., Ltd.
    idProduct          0xfefc OBSBOT Tail 2
    bcdDevice            4.19
    iManufacturer           1 Remo Tech Co., Ltd.
    iProduct                2 OBSBOT Tail 2
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

Assisted-by: Claude:claude-fable-5
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 49ea6a6bcf57..202c2c95432a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2888,6 +2888,18 @@ static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
 			UVC_CT_ZOOM_ABSOLUTE_CONTROL,
 			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
 			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfefc) }, 1,
+			UVC_CT_PANTILT_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfefc) }, 1,
+			UVC_CT_PANTILT_RELATIVE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfefc) }, 1,
+			UVC_CT_ZOOM_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
 	};
 
 	unsigned int i;
-- 
2.43.0

