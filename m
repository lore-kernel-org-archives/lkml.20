Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1E502548
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632230; cv=none; b=rfjYIsAtvbkOVUboYvd34qb6QJXoMafg/bdvZoSfd9L73XlkjS1a7uIyOPR3Zqtu8v3vtYt/V6NchGh6f9xun1dQpldgodpIhmk6fHeWh/NswPfdXYh+WyZFupOmLfqafmIyCU30tdD50X3MBFJb15uD1Ib3ad9zfyrY7nVsYtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632230; c=relaxed/simple;
	bh=LKmbEz8M2C8grOmuW231XHJdV/pzULFAW23NjWBMT3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCdz9I1I1DuItO7ehE1Lr6c1vP4W6Os9uA51nrTRDcxxCXLA0s8Ojq255uJAZhsIW4VzNnYPXlxTYJV89r8mnuwefaIklWgVDEaAGzYxO6FHLX0aavAjOPpJxYCmYQ8f3g9SsLvWkhEwyCX4Vn9Sb6gboexs07CikyVMRoRPaMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=As04MeoR; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="As04MeoR"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a886c555eeso31630997b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790632227; x=1791237027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsH5K1+qfZ45TAG9np/1XKXlf7vp/uUIH1dYS+ySYqE=;
        b=As04MeoRDTMmmO5d0XE1po8yB27opzonhlEuThaK9x9zavtUrdsoNgFW8wJwWQ4rOi
         RWu5bQWsgNcFHjmvHINbXhb/Tu8dvyYHZEhq2G0Symk8hJrh0s8ZutGkzmI+HJstcNzY
         MEEf8A95rh0i3PgV0rRHAqFmgXKgcLOks+3cIbBbVFkxGFSGA4ELrcJBOvlhjox0Fn8v
         9SqM9936ZNxETuWCPRNAb4+EyZgAlf9bTUozYcQc4DCGdF9jIRzODTlvZNC3LoHir379
         +QanAWdMKbbUdFu1XJA/Zehd8VUeJJ+zM67ujGQ0zQZKzewuAykHlPlaE/gaJMbMSitc
         7IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632227; x=1791237027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsH5K1+qfZ45TAG9np/1XKXlf7vp/uUIH1dYS+ySYqE=;
        b=GcUE/VDByQrF0FuhnUPiJDThWTrvZY2mCXmt8r1+bKk0EbVhaeEhNQyYdgsLGkrhEi
         aaO2pxevS6pEdPzulY2WbN/yNWxphwNaRgmf4jki5lIwQObcQjqC0Q4MNaNonhxQG9TO
         y+ES/RJBkq7HJzBOJaZ8o80uI4GZwEQjBxaq7FKRPGpzCuF9Dic34Uoc0XEdOemSntyb
         N7T5O+uY04f0xlLVAGO2i8nWxpvKXBb8vHyq0Ww/+viK/GDCEmnCFOKf0YskV3GV5/Em
         nYSGp6DZtDVxILvsgLcdQDH9cImxUCMQedVwzTlw4GCjaxItCZR52Esgx1NcnwREnMVu
         z6Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwdfgHWaWYfvGDgXjfV+tS76gjvqD91qhp4yOgAVQqFJ+0wZyrchkhYCjtLrNHHnskNucrKYIAkKFc3sjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL68JHTVyC8tU7adJGbTa4/GBhQvS43B3mbWfUsEuAcsKuqC+yn
	yIdOti6k+5i31t92zAKCrt33ye6V2rFbedb3V+K4c2k09epMz1PkgVMa
X-Gm-Gg: AYBFou1Woxis/dpVCNozNuIHnqdui3pinrAs4dDoabyqF4gbgsGwdHyM+BysBPC7/ZW
	YfegkMmb3+gxEKfGbLQTnuRTj4JkbgcSJwhy4PqHG4vqPnIDMazKWaBBTM5rgdWhhnnh7xSxh0w
	FByDOampTIROSoDfkAA29UhfkYMNasiid+ajiS9ZMc+1G9fyOKXTD8CkfcXi25ayeX5DNOaR7oj
	7aQxHgLADoTCOFr2mTNmcxT0qmLPBkZtSnN2aZNQd0OVyCsk9TJX8JPFg8BgBgpSsfOe0dtPcfO
	2PQ41kVdOi1NqPNRkDr9xpBOC6/mpoV19SXEsYZXx9XZ2srxtQ4UxyvHhqanJ1+1+QKErwB05OQ
	xBEnGL8Kp170uidXipthBGFLCkeOgr7QNyuGFejoK9aM9X+86vjER8t1ZwgZvF4p2BHtNp3DR7n
	McoIyBt8Lb9GMmRjH81NsyzLwj6ZCtKIn979zN3JMqUZBwYyz7wXQMPiGNVZo8JAug4icTYya2m
	41sZiYsG2idpck6a4VVzWBTuKSEP9/48Ufp6CC7wWKxRLBqbI1XZA==
X-Received: by 2002:a05:690c:6d82:b0:8a0:6e6a:1300 with SMTP id 00721157ae682-8a86bdb1fcfmr37374667b3.0.1790632227349;
        Mon, 28 Sep 2026 14:50:27 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a861012f4dsm50897647b3.37.2026.09.28.14.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:50:26 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v4 4/4] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tail 2
Date: Mon, 28 Sep 2026 17:50:21 -0400
Message-ID: <20260928215021.819064-5-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928215021.819064-1-jordan.mymail@gmail.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tail 2 has the same defect as the Tiny 2. Add the same
fixup entries for it.

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

Assisted-by: LLM
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

