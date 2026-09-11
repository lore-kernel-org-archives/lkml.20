Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1C48822A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132966; cv=none; b=Bd8GgAsNyA28Y7oxDzFBa3ZJ3vJdBr1V3gzZl8nVjpU6Q0N1XKJ+ggCfeTDO7BY8kh64z62QCIL7cSVAgcAlq6SW7jQ/loh5zUMdktoVfzE0ZRAWPG4KS7Y8TQBYkt8qAPkbnAs8O0XeQyz+l/JzytTiiRkITqjAMflwmolaNjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132966; c=relaxed/simple;
	bh=2Z7oX5Mivlb1Jr/Rvv2p4IzppeF6NVctsHMnPInMaWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kEaO6ljzfXA9rwG396lLkbhwaI2cLX6p7wn0OirZb4pA5OmarRKylNmxryT8oVi5Sy4WLzXlMO7kHeb5DulGDNNvwpVb3VUgeDyUbXykc8cN316gXNhYC1YC6khgR9EjhJ+LpOlpeZQ29lTphcahRL99IJNn3x3oixZghNrk/r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UcV53iS4; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UcV53iS4"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a5938ab935so7411271fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789132960; x=1789737760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1i7FufBk3oSHRVLUNRMCx/VKAD00aWygfNdrtryjXk=;
        b=UcV53iS49+q6JTM7gm/BAi2LhZ3iqS69iDS7jvXfncP23azNyEW1rsPc8EUnp7aWcn
         OC0/7w9XnBU9/1qq/rCXGxOu8Y3LPP/6LdPhRoMWigXx3JEGpJ+buA1d/Wglv5xRZY0X
         qX+N+l/28JIHgzBgVg/I0EEKjJB6jfcgdB80M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132960; x=1789737760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1i7FufBk3oSHRVLUNRMCx/VKAD00aWygfNdrtryjXk=;
        b=r1OYoehKF+D1u6EcEaB9z98nd36rtEPh26np4wk1Yob+0zd3nHMmk5iznXFj108H2X
         5DGmhhFT5/BpKxzshRAXAsSymuT1Llwv/UM4hSU2fxrVPnJiWNIJZE0USc1wLdX+b0Vt
         n3wX2gPLiUrXDn1G/fv4NB1FMqYNj4UrGd1Is/xnKY8wtLltk6svL1CCTswsNeVQPwPY
         ocr6hCzdMmzaBbE8lMxnly89+9V29NS+wCST8urkp19BuhwluKdTl+dSr0sog7BTIJIe
         sY6llkmaGP0Xn1oFf4l/Su5cpyxu+pPrNaDip2LaZLLVvRzv4mKWspUz/CgYNtoNJFPC
         f2eA==
X-Forwarded-Encrypted: i=1; AKwUvBz6dubDBjKXGNEr4FXcGzxY06iRUwnOmXkds1tI5+tiktH5tREAtzY65Z2etqnrbbI0MRyHweB8+sebTIE=@vger.kernel.org
X-Gm-Message-State: AFuF++lOmybYJZovEoYKwWZ8u9WnDa5Mytf84o+Y+dtPXehxk0wIDBky
	izXKdsYWns0IuK0ct6KzhCHmXzD6QIMt0HZ1O0eqWAS/XrPZd7bzNNgODfwXkhRBNcvjQTE7mTs
	LJGSlJK8a
X-Gm-Gg: AYBFou0eIqv2U4k+5Ri2iy6kGJQ5Lt7VTI6hneZN0zSCxLIYCvq0Q3W8BuHS8imFXgo
	qei4Qfo/KyqcDN6gStIJE7RTannZUIRs8wMMkAFuRIZjE8QNYCCZDqe/HjqrZtHEnpmofG4DIUu
	dysHwwczld7YJeQjcQbggugVsK4N3HC7hngKFBqkHODg75Hqz7YtzKG/H+9XRHtgEQRBJLHcXxD
	vTybW9sG4N2Pw88wsa5SdTJUc692MuN2kQFhQ1Y2B9+dQj71CdJdGU2tuihX/NlAB/zD1n4XvsF
	OrI7ss8qaKuVCaQMwHo2EuvxMCtsculMJyzZm62OJgehZWZL4FdMSCXLKpyl9qXHGpFE4qTv248
	MOfhVmsDpXKgIr83XdNNhzHr8/a+ZxS0mpEy4GoPKgHJwdInyPFGCZs2ZvY2VrqppUiYYGcvLoZ
	axIONmV39f24AT7+WXMbIdwn7H79V5M1SGetjbboQbXiTzcw1iE1FwK3ngYhsnEG2S4PQ6q1ZOz
	Z8Xk6aTEnk9C3VnYZxnbgMV+WPIfWC7ngcOrYI2qavpyxS+n/+n+Z5c7a5l
X-Received: by 2002:a2e:a7cf:0:b0:39b:128e:ae68 with SMTP id 38308e7fff4ca-3a5a4f3e418mr4574021fa.0.1789132960467;
        Fri, 11 Sep 2026 06:22:40 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm6677511fa.6.2026.09.11.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:22:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:22:29 +0000
Subject: [PATCH v3 5/5] media: uvcvideo: Force UVC version for Avermedia
 GC515
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-version-v3-5-604328d8a0dd@chromium.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
In-Reply-To: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

The device announces itself as UVC 1.5, but it only accepts UVC 1.1
controls.

The camera can probably be handled by the automatic uvc_version handler,
but it is more correct to add a quirk and keep some tracking of what
vendors are more or less compliant. Also it might be more robust if we
introduce more UVC version-dependent code.

Bus 003 Device 021: ID 07ca:1515 AVerMedia Technologies, Inc. X'tra Go GC515
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x07ca AVerMedia Technologies, Inc.
  idProduct          0x1515 X'tra Go GC515
  bcdDevice            0.10
  iManufacturer           1 AVerMedia
  iProduct                2 X'tra Go GC515
  iSerial                 3 5313180000221
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x03fd
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      1
      iInterface              0
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.50
        wTotalLength       0x0059
        dwClockFrequency       30.000000MHz
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
        bmControls           0x00000000
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0
      VideoControl Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      4 (SELECTOR_UNIT)
        bUnitID                 3
        bNrInPins               1
        baSource( 0)            1
        iSelector               0
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 4
        bSourceID               3
        wMaxMultiplier          0
        bControlSize            3
        bmControls     0x00000000
        iProcessing             0
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 5
        guidExtensionCode         {55be8e1c-2fdb-4f7a-bd8d-b9b1108d20c3}
        bNumControls           24
        bNrInPins               1
        baSourceID( 0)          4
        bControlSize            4
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        bmControls( 3)       0x00
        iExtension              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
        VideoControl Endpoint Descriptor:
          bLength                 5
          bDescriptorType        37
          bDescriptorSubtype      3 (EP_INTERRUPT)
          wMaxTransferSize       64
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      1
      iInterface              0
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x0303
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       2
        bStillCaptureMethod                 1
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     4
        bmaControls( 1)                     4
        bmaControls( 2)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                8
        guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      24
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        1
        bVariableSize                     1
      VideoStreaming Interface Descriptor:
        bLength                            62
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x01
          Still image supported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  9
        dwBytesPerLine                      0
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)             83416
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
        dwFrameInterval( 4)            200000
        dwFrameInterval( 5)            333333
        dwFrameInterval( 6)            333667
        dwFrameInterval( 7)            400000
        dwFrameInterval( 8)            416666
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x01
          Still image supported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  4
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            333667
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x01
          Still image supported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x01
          Still image supported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x01
          Still image supported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  3
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x01
          Still image supported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            200000
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x01
          Still image supported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            333667
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x01
          Still image supported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                8
        guidFormat                            {43564548-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      24
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        1
        bVariableSize                     1
      VideoStreaming Interface Descriptor:
        bLength                            62
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x01
          Still image supported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  9
        dwBytesPerLine                      0
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)             83416
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
        dwFrameInterval( 4)            200000
        dwFrameInterval( 5)            333333
        dwFrameInterval( 6)            333667
        dwFrameInterval( 7)            400000
        dwFrameInterval( 8)            416666
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x01
          Still image supported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  4
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            333667
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x01
          Still image supported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x01
          Still image supported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x01
          Still image supported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  3
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x01
          Still image supported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            200000
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x01
          Still image supported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            333667
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x01
          Still image supported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 33554432
        dwMaxBitRate                268435456
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        3
        bNumFrameDescriptors                1
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
        bCopyProtect                        1
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x01
          Still image supported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                314572800
        dwMaxBitRate                314572800
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  1
        dwFrameInterval( 0)            166666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
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
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0026
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0602 Digital Audio Interface
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 3
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
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
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
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
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c4  1x 196 bytes
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

Cc: stable@vger.kernel.org
Fixes: b400b6f28af0 ("media: uvcvideo: Force UVC version to 1.0a for 1bcf:0b40") # When version overwritte was added
Reported-by: Edwin Gatier <edwin.gatier@protonmail.com>
Closes: https://lore.kernel.org/linux-media/CANiDSCu4AW=JZ9FS+Ny=DK_+LqqytGvSe+V6aVncRiGRiyDMfA@mail.gmail.com/T/#me584c35c4b523ac455925a1590a3de8efc354349
Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index adec9d1aa653..bbfc409c5167 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2847,6 +2847,17 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
+	/* Avermedia GC515 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x07ca,
+	  .idProduct		= 0x1515,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version = 0x0110,
+	  } },
 	/* ViMicro Vega */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,

-- 
2.55.0.1007.g17ff1f9808-goog

