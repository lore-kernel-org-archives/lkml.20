Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE492D8378
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308749; cv=none; b=a1nODV7DBTo4K6xAj902NI6AGJEhWLLFvKkOigCqXBrBQaxj16zYxwC8C4GyhVP/kLLetvGMsJk4Rahn8Xn8nA1Do33G+QFCem+iPn4/yvp6DOioYuc1k2coCuI+MA49oLBPHTH78M3cxtl3XpIrw9Qt/AEu3uEVr9h4Ft0Hq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308749; c=relaxed/simple;
	bh=qdp8ZUmWIyTFN9kYMJax7x4tuVN2GSr1+45zj9Ev+7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STUZxO9Q02rtGXiK4TFdxpqelPm7n/e/dR/pLemv0cEEWf2wdsSJ1RaoOEpSXRiaFvWFEZbDT7tYkX1WXpp/eWPsEX0smJEE6k91+dw1g9DSpmx2ie4tzWxgQ0Pqsn3CbPVdK1DXnmqgNa5iPnsCC/0YM5RHxf3V6j+rhn3Oi88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjkreDFC; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjkreDFC"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66f79f58123so528264d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788308746; x=1788913546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCyh0Enz9iERtL3xf+dXRbeGJEawF5rmeFrYZFyl8FA=;
        b=NjkreDFCnLYygt8hjNK8ArdWD4LaBrxw2PELEEckw3SZGezXiVviP8v7elqCykhNga
         8/I3ksr0q1hOh/mlDe3aqM2Xv5IaF76ldZVKMDLoz6wIqmVt+eeHb3TfVe/69l4GdR63
         4p+HNH3wlKXbB8soCm7QiSU/8T4fojfRfASrmopqptemiuVZRAPPbJE7mzIs7r2veaNm
         HVr924eXzeSqaB47r/8cfDvfFO40u5N+JBHaL72N+8WDQIOpI+G75R8zHNlPqj6kyVw2
         mxzrHGH6KlStE5hNcSof9RF9OZ+j+x7WsnQ10umsh2aJ1MkhJGaTZR3h6PYUZURQoQRA
         ftUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308746; x=1788913546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aCyh0Enz9iERtL3xf+dXRbeGJEawF5rmeFrYZFyl8FA=;
        b=RmBaZNrwG+/GNAdwvsplOj4TdsFwDrw6RIpv/PP8qgDKiq8U5LocveAK3Ue5f1i5U1
         mhkEUpGMpc26SqG6zMHTFBAhmsYGEuaBYr2bB7QDo4ckMFbktx6sSP1oZsnxfHijja6o
         OGg1KF3BUZnc+R9Gruy8H9Mhpl2AkXV6amBrkwOwNo0mFL/Yikt7zVOOOoCzxtEcEv0d
         qRIvM6EeBIfrqim2GS9nwf7PUJjTj/SnRr4pNywB7cIew0wGc6SUN5jGAHoZ6/a8iAlM
         QrjUJOly+JFyZDQI3e3Ufic1uBvdeOnM0R9uAwD8cx7TWkosrPQ0x6lW+Yrk+xmA9aJW
         E/kQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOXwY5WkZBptLmTLy9/CcvJ6H3lbYP7p0s1LMMtHre2YGnUcIm2CNyHVFUtgsVvG4vxdH9oziJIWhEUj0=@vger.kernel.org
X-Gm-Message-State: AFuF++mUdut4SiWV4NoywkXTduMxfiYMxv11KN6Vaw02iHkbdpD3AYfK
	wPgSr87bg7IqizExhm/zuA2CSnNhJcWs7MoO63VHsy8gsWeZ8ealO1t/
X-Gm-Gg: AYBFou3vbAJ0QE/dbjoTcfH3WZAvZ8AtuN08lwzk6MZwlM0WTh0xVNc5+0ATYksE8Mp
	SPB7IN/RY+iv5yH0Sdvjvvyr+Bbgwz5n1oMC5c+RQOKy+C6nI1obgWz6MJFxaYXCc634HuG6mpd
	aZsC/1cF/hARcwbk9FJL3O1cPQOVSDPd7WWZpvcSovYh+0W7TbgZU96f5YVrP2oDsCLxMRs5Af7
	teiXO8zVCEP/6DYYYVOJcGODBp6nft56y+BEtZO38VVp+beVPw8twnxmCjgjN4MpEeGorYuX2v3
	mBSEKB1sW+otNDcfx9G92Ga9XzC+x1Qgxk/rFGk5bGa5/vG4tr/ccIduuI12jLkDYGU1soV2ZPv
	IlxNuzDigl35Ch6L0Jwdvgiww9Ep7nT1acP5tdraDnb/WYFsNh643k7EfagFJ95aBRWVby785S5
	8W66UcZqqMiLnTYzH27NxdcnREY/sWgn/1PQIgS27ZxACCg3cCfsZ86EL6ae2ERliBPWF4EcX/C
	P7rWND6CRwxSaxIpTvZmtG2E2Ugqep+rWLmsMtqvag=
X-Received: by 2002:a53:d005:0:b0:66d:1be8:9f08 with SMTP id 956f58d0204a3-66f9b9361c6mr306532d50.16.1788308746189;
        Tue, 01 Sep 2026 17:25:46 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f986b612esm735766d50.21.2026.09.01.17.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:25:45 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on OBSBOT Tiny 2 pan/tilt
Date: Tue,  1 Sep 2026 20:25:44 -0400
Message-ID: <20260902002544.34798-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCufacRzHcKaotop47qz+0rFXixLM3u5pgNzfWJDzR86BQ@mail.gmail.com>
References: <20260828152557.653475-1-jordan.mymail@gmail.com> <20260828152557.653475-4-jordan.mymail@gmail.com> <CANiDSCsL0kffzysq-9ttk_po6T1uYA5+JwDriMbdD62K1zZQLw@mail.gmail.com> <CANiDSCufacRzHcKaotop47qz+0rFXixLM3u5pgNzfWJDzR86BQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Mon, 31 Aug 2026 11:42:12 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > Could you reply to this patch with the full output of lsusb -v instead
> > of a cropped one?

Full output at the end of this mail.

> Sashiko [1] has pointed out that there might be other controls that
> will benefit from the UVC_CTRL_FLAG_AUTO_UPDATE.
>
> Can you double check if that is the case? Feel free to add is a v2 or
> as a follow-up patch.

I checked every control the camera exposes, in two steps: dumped the
GET_INFO capability byte for each control, then tested on the hardware
which values the firmware actually changes on its own and reports
through GET_CUR.

Two more controls need the fixup, both verified live:

- CT_ZOOM_ABSOLUTE (GET_INFO 0x03): the camera's AI subject framing
  zooms autonomously, and GET_CUR reports it live -- I watched it move
  0..71% with the host issuing no zoom request, matching the zoom value
  the vendor's own status protocol reports.

- CT_PANTILT_RELATIVE (GET_INFO 0x03): GET_CUR reports the actual
  current speed during a relative move: a commanded 80 reads back as
  78, then the deceleration ramp as the gimbal approaches the end
  stop, then 0 once stopped. (It reports the magnitude only, for
  either direction of travel.) Without AUTO_UPDATE the cache reports
  the last written speed forever.

The camera's other AUTO_UPDATE-flagged controls turned out not to
benefit:

- Exposure, white balance and focus: the autos work (verified by
  forcing a wrong manual value and watching the image correct itself
  once auto is re-enabled), but GET_CUR just echoes the last SET_CUR;
  this firmware never reports the auto-chosen value, so AUTO_UPDATE
  would add USB traffic for no benefit.
- Hue: the camera has no auto-hue, so nothing updates it.
- CT_ZOOM_RELATIVE: the firmware gets this one right (GET_INFO 0x0f,
  AUTOUPDATE set).
- CT_ROLL_ABSOLUTE: GET_INFO 0x01, read-only, and not mapped.

This also corrects my own commit message: the capability byte is not
the same 0x03 for every control (zoom relative reports 0x0f, roll
0x01), so the firmware does compute it per control -- it is just wrong
for the PTZ controls that need AUTOUPDATE most. v2 follows with the
wording fixed and the two entries added.

lsusb -v:


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
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x03d2
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          4 OBSBOT Multifunction
    bmAttributes         0xc0
      Self Powered
    MaxPower                2mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 OBSBOT Tiny 2 StreamCamera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 OBSBOT Tiny 2 StreamCamera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x0050
        dwClockFrequency       48.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
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
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 3
        bSourceID               1
        wMaxMultiplier        400
        bControlSize            2
        bmControls     0x0000f7df
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          White Balance Temperature
          White Balance Component
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
          White Balance Component, Auto
          Digital Multiplier
          Digital Multiplier Limit
        iProcessing             0 
        bmVideoStandards     0x1d
          None
          PAL - 625/50
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 2
        guidExtensionCode         {9a1e7291-6843-4683-6d92-39bc7906ee49}
        bNumControls           19
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            4
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0x04
        bmControls( 3)       0x00
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             7
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              6 Video Streaming
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x02e0
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       7
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     4
        bmaControls( 1)                     0
        bmaControls( 2)                     4
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors                5
        bFlags                              0
          Fixed-size samples: No
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            62
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                995328000
        dwMaxBitRate                1990656000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  9
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333666
        dwFrameInterval( 5)            400000
        dwFrameInterval( 6)            416666
        dwFrameInterval( 7)            500000
        dwFrameInterval( 8)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                1327104000
        dwMaxBitRate                1327104000
        dwMaxVideoFrameBufferSize    16588800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            333666
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            62
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                221184000
        dwMaxBitRate                884736000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  9
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333666
        dwFrameInterval( 5)            400000
        dwFrameInterval( 6)            416666
        dwFrameInterval( 7)            500000
        dwFrameInterval( 8)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                294912000
        dwMaxBitRate                1179648000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1440
        dwMinBitRate                663552000
        dwMaxBitRate                1327104000
        dwMaxVideoFrameBufferSize     5529600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                2
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 55296000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  5
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 73728000
        dwMaxBitRate                122880000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  4
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                5
        guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     1
      VideoStreaming Interface Descriptor:
        bLength                            62
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                497664000
        dwMaxBitRate                1990656000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  9
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333666
        dwFrameInterval( 5)            400000
        dwFrameInterval( 6)            416666
        dwFrameInterval( 7)            500000
        dwFrameInterval( 8)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                1327104000
        dwMaxBitRate                1327104000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            333666
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            62
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                221184000
        dwMaxBitRate                884736000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  9
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333666
        dwFrameInterval( 5)            400000
        dwFrameInterval( 6)            416666
        dwFrameInterval( 7)            500000
        dwFrameInterval( 8)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                294912000
        dwMaxBitRate                1179648000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1440
        dwMinBitRate                663552000
        dwMaxBitRate                1327104000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       0 [unknown]
      bFunctionProtocol       0 
      iFunction               8 OBSBOT Tiny2 Audio
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              8 OBSBOT Tiny2 Audio
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0027
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames          13 Capture Channels
        iTerminal              12 OBSBOT Tiny2 Microphone
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               5
        iTerminal              14 Capture Output terminal
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               3
        bControlSize            2
        bmaControls(0)     0x0003
          Mute Control
          Volume Control
        iFeature                0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface             17 OBSBOT Tiny2 Microphone
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface             18 Capture Active
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           4
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000f
      Device can operate at Low Speed (1Mbps)
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat           1 micro seconds
    bU2DevExitLat         500 micro seconds
Device Status:     0x0001
  Self Powered

Best regards,
Michael
