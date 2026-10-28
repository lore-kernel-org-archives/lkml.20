Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225013;
	b=wMM6Ka679wtP2GrffQXt6elvWj7Le61yNpyAOWxIj2Cqo5MPoe/wPkJmZRbGUOePsI2y
	 a9gVgkQOoyeAuLXobcMginimNZVbGsKfsiEPyQkSpwuGkbvcRBIiMJjiX5bMiBXJU9WOj
	 24rzWrz0hbcO7e6a0wTVwRsqiPByQz/RtxvWmKEzIZ/R64xauT9jtLOLLpXMNZuZt1UQj
	 hK7nag9pc9kWhvbzfYwGhY2n6MNpHsqMjE1uCfI3OBV/K7reeHxzc7V10R+FkebCJw5nA
	 4Pwne+RT4X53d3L7GspnVUDm1sxcrHchSbNePfkSEUp/h6amw8g7qqf+yQezr4N+DeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T4EUrvw0glQ5B3Dp1GrA48pRZyZ+JNjMcONG6MJ9mUc=;
	b=br4DIk4oMX6hxp5fsILruq6mkDjZZicp6ThsyF8qBQKtFDCLuhJGEKxyLSqZcbSbmqU1
	 YnrFW+uhcjfzxrbTe4TyRXC1fs5mToh5PAxnNgTEBGcxjmsK6xK7BP2GpOwFGiIgc2jEx
	 EJXGj3+XtTCCBNdI882taluYwv00WTk6Rp/0wLeXc/jWW8oUp9I05Niid1R4cMRVwyhxK
	 g+I+rWJn558fozkGifIVIhvlLy5Wv0CX+3dIeJydnjUs8GdNuyEDyMl6U8WCeODHPQWO0
	 1OppA/fQxTG884fF0TI2IaIxi0ZwlrIXGO5NfXp/96/c/dbXl9lvc6/AKKvhzdQZnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOGmkUnf;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE431606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE431606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOGmkUnf
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so16624355e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225011; x=1793829811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4EUrvw0glQ5B3Dp1GrA48pRZyZ+JNjMcONG6MJ9mUc=;
        b=gOGmkUnflIwE5H8rvy9P+CAIWQTgP5mkb5siyBkKcKIt9rHNn/3ueOzOJdqWKfTh+2
         KfE8Rt6p1gOXFxL5ERggnFzWoToJVNfVdopi0WmjJLRd+rwE3WpyZYc7mOdWmswwoRAn
         /fI6nlBti7rgdwtsrmTyq42pH4w0+6Trkyhwbk9MhGUxuJc82UAFJ2FPunilEwMR9ok7
         cXw57rRs/BbV7vUMJslnGjYNz2IofTeaSxcymqDHT95UiN1ULfAYbqG5pKkjXEiBfxDx
         4fvKDkuZAxdSbeOBBXsahoTFPjovdpT1nrFbMk8ip5CVYWLRIm1iudEn9RD75I7VLK85
         3fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225011; x=1793829811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4EUrvw0glQ5B3Dp1GrA48pRZyZ+JNjMcONG6MJ9mUc=;
        b=eHRRTHUSsHRjlB/mNfymc9E/YnlAbftCr20MyTql+I+Tn//d53iEoaxajEs5abgL4q
         hS3Xqus5PnLSlbGq9J613kJuFUp3VvJ9R63kNCBnTUpZ4yVvf4vhgWegP86scauLZzyd
         mFMUzC8bzhi7BcIbHo1lOr6LfA1Y4izyMJs21UYv3SgjT4iMaaF5WP4e653ZLXZCByL5
         Vko0MxOe3TSU0M8q1xGouOaiVLfrKl7EKoPHbjHZTQVgJqam341TY1hek27/Ut5MEYoJ
         302Rgf3D8tTUiVgN5Z6MTk894Vh5j7lPIA5VDTyZsIA+2d1bI5XyQiqMnLdkQZ9n9G+H
         TN+A==
X-Forwarded-Encrypted: i=1; AKwUvBwqT+K/X9m0FY5daBJ0hG8ndnSvWz2BdBjwRlLeES93TbSgIQij73ql40zYiaSIF8Lucu0Y5P0jOpnALPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLyxbUkiSVQzs/3UAwcV+Yyzo7K0PYy/5JvayKJrheteivm611
	wcFI+x7YA9B/qzAlfmYAAgXSkS2shGeNYiimDiqPODhww1P0lC5TMUW2FvZZLjc6
X-Gm-Gg: AYBFou0guokcaS/8Fbdd+gzcAfuSUyLDE2rZrcj+1BTk03ROoMSt/ylaTamIukJ5RKN
	ihwUAv9r1KbwPfNw8008+AwAn6CANRja3LJ1mUEG6yScbMGaCRFy1ROBaKuHwSUOS/yxStvXsZP
	iV+e8fT2aOyQcIqD27+bGVsuaWWPKDgf5V8FX8RTVxRH6Qm/esfyJv/lHjUYJZvGbQ1iqHHUQbM
	6IJsi6r7Qjj62J+u5hUYdXOqMeI0euQVqjUDzvHQT+2tosuxdmWbKBiuU2avc7yV9SsML7lDpZs
	3haF/Sn3mIP2Xw1hvRjqjh+6KICkyK+OQu1AjP8snYAeEIPnisL2JGkNMVKcRBYCQ5VGLlIpoJ5
	917NPYhdsn5vu1E/pomwmjLPScyQXO4OqyXzmTj0gCNgVJod9+AUJcAH1Fi6Bc/ygWA0RUWSFdQ
	y0xnFZCq84C1Mq5+woswELvim1HDtk4Oysl1LheINjJJcX48mcq/N8BHZ/mTVZwVwJwiXlQ27e4
	BJcq4957R6PbDSfAIJMMHCwjpehY9phYrQhOp8wAD0jaMgXtUF+SRL4ueCs/RyqEHLGPG24o5Ge
	9sPKsdqt8N/kTVB0gRpNDeJuv23wsPpj5A==
X-Received: by 2002:a05:600c:1991:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4a965dd3290mr83912555e9.10.1793225010697;
        Wed, 28 Oct 2026 15:03:30 -0700 (PDT)
Received: from desktop.home ([88.97.255.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm38873330f8f.49.2026.10.28.15.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:03:29 -0700 (PDT)
From: pez <perrygjoyce97@gmail.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hansg@kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-kernel@vger.kernel.org,
	Perry Joyce <perrygjoyce97@gmail.com>
Subject: [PATCH] media: uvcvideo: Add PROBE_DEF quirk for Logitech Brio 500
Date: Wed, 28 Oct 2026 22:01:09 +0000
Message-ID: <20261028220109.95107-1-perrygjoyce97@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Perry Joyce <perrygjoyce97@gmail.com>

The Logitech Brio 500 fails to set the probe control during
initialisation:

  uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).

Loading uvcvideo with quirks=0x100 (UVC_QUIRK_PROBE_DEF) makes the
error go away, including across reboots, and 1920x1080 MJPEG capture
at 30 fps keeps working.

Add the device to the quirk list.

 Bus 001 Device 002: ID 046d:0943 Logitech, Inc. Brio 500
 Negotiated speed: High Speed (480Mbps)
 Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x046d Logitech, Inc.
   idProduct          0x0943 Brio 500
   bcdDevice            0.21
   iManufacturer           0
   iProduct                2 Brio 500
   iSerial                 3 2419LZ50AFL8
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0a22
     bNumInterfaces          6
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
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
       bInterfaceProtocol      0
       iInterface              0
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdUVC               1.00
         wTotalLength       0x0126
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
         bmControls           0x00020a2e
           Auto-Exposure Mode
           Auto-Exposure Priority
           Exposure Time (Absolute)
           Focus (Absolute)
           Zoom (Absolute)
           PanTilt (Absolute)
           Focus, Auto
       VideoControl Interface Descriptor:
         bLength                11
         bDescriptorType        36
         bDescriptorSubtype      5 (PROCESSING_UNIT)
       Warning: Descriptor too short
         bUnitID                 3
         bSourceID               1
         wMaxMultiplier      16384
         bControlSize            2
         bmControls     0x0000175b
           Brightness
           Contrast
           Saturation
           Sharpness
           White Balance Temperature
           Backlight Compensation
           Gain
           Power Line Frequency
           White Balance Temperature, Auto
         iProcessing             0
         bmVideoStandards     0x1b
           None
           NTSC - 525/60
           SECAM - 625/50
           NTSC - 625/50
       VideoControl Interface Descriptor:
         bLength                27
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 2
         guidExtensionCode         {2c49d16a-32b8-4485-3ea8-643a152362f2}
         bNumControls            6
         bNrInPins               1
         baSourceID( 0)          6
         bControlSize            2
         bmControls( 0)       0x3f
         bmControls( 1)       0x00
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                27
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 6
         guidExtensionCode         {23e49ed0-1178-4f31-ae52-d2fb8a8d3b48}
         bNumControls           10
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            2
         bmControls( 0)       0xff
         bmControls( 1)       0x6f
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                27
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 8
         guidExtensionCode         {69678ee4-410f-40db-a850-7420d7d8240e}
         bNumControls           14
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            2
         bmControls( 0)       0xfb
         bmControls( 1)       0x3f
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                28
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 9
         guidExtensionCode         {1f5d4ca9-de11-4487-840d-50933c8ec8d1}
         bNumControls           19
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            3
         bmControls( 0)       0xf3
         bmControls( 1)       0xff
         bmControls( 2)       0xff
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                27
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                10
         guidExtensionCode         {49e40215-f434-47fe-b158-0e885023e51b}
         bNumControls           13
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            2
         bmControls( 0)       0xba
         bmControls( 1)       0x1f
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                28
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                11
         guidExtensionCode         {ffe52d21-8030-4e2c-82d9-f587d00540bd}
         bNumControls            8
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            3
         bmControls( 0)       0x24
         bmControls( 1)       0xc9
         bmControls( 2)       0x81
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                27
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                20
         guidExtensionCode         {a8bd5df2-1a98-474e-8dd0-d92672d194fa}
         bNumControls            2
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            2
         bmControls( 0)       0x00
         bmControls( 1)       0x80
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                26
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                21
         guidExtensionCode         {5a6d654c-7e35-4d4e-810d-069d15e0f79b}
         bNumControls            2
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            1
         bmControls( 0)       0x03
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                26
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                22
         guidExtensionCode         {29144c1f-658d-4f47-a40f-0ed339428bf0}
         bNumControls            1
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            1
         bmControls( 0)       0x01
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             4
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               3
         iTerminal               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x86  EP 6 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               8
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
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       VideoStreaming Interface Descriptor:
         bLength                            15
         bDescriptorType                    36
         bDescriptorSubtype                  1 (INPUT_HEADER)
         bNumFormats                         2
         wTotalLength                   0x0733
         bEndpointAddress                 0x81  EP 1 IN
         bmInfo                              0
         bTerminalLink                       4
         bStillCaptureMethod                 0
         bTriggerSupport                     0
         bTriggerUsage                       0
         bControlSize                        1
         bmaControls( 0)                     0
         bmaControls( 1)                     4
       VideoStreaming Interface Descriptor:
         bLength                            27
         bDescriptorType                    36
         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
         bFormatIndex                        1
         bNumFrameDescriptors               18
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
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                 24576000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            160
         wHeight                            90
         dwMinBitRate                  1152000
         dwMaxBitRate                  6912000
         dwMaxVideoFrameBufferSize       28800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            160
         wHeight                           120
         dwMinBitRate                  1536000
         dwMaxBitRate                  9216000
         dwMaxVideoFrameBufferSize       38400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         4
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            176
         wHeight                           144
         dwMinBitRate                  2027520
         dwMaxBitRate                 12165120
         dwMaxVideoFrameBufferSize       50688
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         5
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           180
         dwMinBitRate                  4608000
         dwMaxBitRate                 27648000
         dwMaxVideoFrameBufferSize      115200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         6
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           240
         dwMinBitRate                  6144000
         dwMaxBitRate                 36864000
         dwMaxVideoFrameBufferSize      153600
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         7
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            352
         wHeight                           288
         dwMinBitRate                  8110080
         dwMaxBitRate                 48660480
         dwMaxVideoFrameBufferSize      202752
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         8
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            432
         wHeight                           240
         dwMinBitRate                  8294400
         dwMaxBitRate                 49766400
         dwMaxVideoFrameBufferSize      207360
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         9
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                 18432000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        10
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           448
         dwMinBitRate                 28672000
         dwMaxBitRate                172032000
         dwMaxVideoFrameBufferSize      716800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        11
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           600
         dwMinBitRate                 38400000
         dwMaxBitRate                184320000
         dwMaxVideoFrameBufferSize      960000
         dwDefaultFrameInterval         416666
         bFrameIntervalType                  6
         dwFrameInterval( 0)            416666
         dwFrameInterval( 1)            500000
         dwFrameInterval( 2)            666666
         dwFrameInterval( 3)           1000000
         dwFrameInterval( 4)           1333333
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        12
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            864
         wHeight                           480
         dwMinBitRate                 33177600
         dwMaxBitRate                159252480
         dwMaxVideoFrameBufferSize      829440
         dwDefaultFrameInterval         416666
         bFrameIntervalType                  6
         dwFrameInterval( 0)            416666
         dwFrameInterval( 1)            500000
         dwFrameInterval( 2)            666666
         dwFrameInterval( 3)           1000000
         dwFrameInterval( 4)           1333333
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            42
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        13
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            960
         wHeight                           720
         dwMinBitRate                 55296000
         dwMaxBitRate                165888000
         dwMaxVideoFrameBufferSize     1382400
         dwDefaultFrameInterval         666666
         bFrameIntervalType                  4
         dwFrameInterval( 0)            666666
         dwFrameInterval( 1)           1000000
         dwFrameInterval( 2)           1333333
         dwFrameInterval( 3)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            42
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        14
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1024
         wHeight                           576
         dwMinBitRate                 47185920
         dwMaxBitRate                141557760
         dwMaxVideoFrameBufferSize     1179648
         dwDefaultFrameInterval         666666
         bFrameIntervalType                  4
         dwFrameInterval( 0)            666666
         dwFrameInterval( 1)           1000000
         dwFrameInterval( 2)           1333333
         dwFrameInterval( 3)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            38
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        15
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                 73728000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval        1000000
         bFrameIntervalType                  3
         dwFrameInterval( 0)           1000000
         dwFrameInterval( 1)           1333333
         dwFrameInterval( 2)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            34
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        16
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1600
         wHeight                           896
         dwMinBitRate                114688000
         dwMaxBitRate                172032000
         dwMaxVideoFrameBufferSize     2867200
         dwDefaultFrameInterval        1333333
         bFrameIntervalType                  2
         dwFrameInterval( 0)           1333333
         dwFrameInterval( 1)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        17
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1920
         wHeight                          1080
         dwMinBitRate                165888000
         dwMaxBitRate                165888000
         dwMaxVideoFrameBufferSize     4147200
         dwDefaultFrameInterval        2000000
         bFrameIntervalType                  1
         dwFrameInterval( 0)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                        18
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           2560
         wHeight                          1440
         dwMinBitRate                294912000
         dwMaxBitRate                294912000
         dwMaxVideoFrameBufferSize     7372800
         dwDefaultFrameInterval        4999998
         bFrameIntervalType                  1
         dwFrameInterval( 0)           4999998
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
       VideoStreaming Interface Descriptor:
         bLength                            11
         bDescriptorType                    36
         bDescriptorSubtype                  6 (FORMAT_MJPEG)
         bFormatIndex                        2
         bNumFrameDescriptors               17
         bFlags                              1
           Fixed-size samples: Yes
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
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                 24576000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            160
         wHeight                            90
         dwMinBitRate                  1152000
         dwMaxBitRate                  6912000
         dwMaxVideoFrameBufferSize       28800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            160
         wHeight                           120
         dwMinBitRate                  1536000
         dwMaxBitRate                  9216000
         dwMaxVideoFrameBufferSize       38400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         4
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            176
         wHeight                           144
         dwMinBitRate                  2027520
         dwMaxBitRate                 12165120
         dwMaxVideoFrameBufferSize       50688
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         5
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           180
         dwMinBitRate                  4608000
         dwMaxBitRate                 27648000
         dwMaxVideoFrameBufferSize      115200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         6
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           240
         dwMinBitRate                  6144000
         dwMaxBitRate                 36864000
         dwMaxVideoFrameBufferSize      153600
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         7
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            352
         wHeight                           288
         dwMinBitRate                  8110080
         dwMaxBitRate                 48660480
         dwMaxVideoFrameBufferSize      202752
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         8
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            432
         wHeight                           240
         dwMinBitRate                  8294400
         dwMaxBitRate                 49766400
         dwMaxVideoFrameBufferSize      207360
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         9
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                 18432000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        10
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           448
         dwMinBitRate                 28672000
         dwMaxBitRate                172032000
         dwMaxVideoFrameBufferSize      716800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        11
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           600
         dwMinBitRate                 38400000
         dwMaxBitRate                230400000
         dwMaxVideoFrameBufferSize      960000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        12
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            864
         wHeight                           480
         dwMinBitRate                 33177600
         dwMaxBitRate                199065600
         dwMaxVideoFrameBufferSize      829440
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        13
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            960
         wHeight                           720
         dwMinBitRate                 55296000
         dwMaxBitRate                331776000
         dwMaxVideoFrameBufferSize     1382400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        14
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1024
         wHeight                           576
         dwMinBitRate                 47185920
         dwMaxBitRate                283115520
         dwMaxVideoFrameBufferSize     1179648
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            58
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        15
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                 73728000
         dwMaxBitRate                884736000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval         166666
         bFrameIntervalType                  8
         dwFrameInterval( 0)            166666
         dwFrameInterval( 1)            333333
         dwFrameInterval( 2)            416666
         dwFrameInterval( 3)            500000
         dwFrameInterval( 4)            666666
         dwFrameInterval( 5)           1000000
         dwFrameInterval( 6)           1333333
         dwFrameInterval( 7)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        16
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1600
         wHeight                           896
         dwMinBitRate                114688000
         dwMaxBitRate                688128000
         dwMaxVideoFrameBufferSize     2867200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            54
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        17
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1920
         wHeight                          1080
         dwMinBitRate                165888000
         dwMaxBitRate                995328000
         dwMaxVideoFrameBufferSize     4147200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  7
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            416666
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           1333333
         dwFrameInterval( 6)           2000000
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00c0  1x 192 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0180  1x 384 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       3
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       4
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0280  1x 640 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       5
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0320  1x 800 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       6
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x03b0  1x 944 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       7
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0a80  2x 640 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       8
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0b20  2x 800 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       9
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0be0  2x 992 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting      10
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x1380  3x 896 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting      11
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x1400  3x 1024 bytes
         bInterval               1
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
         wTerminalType      0x0403 Speakerphone, no echo reduction
         bAssocTerminal          0
         bNrChannels             1
         wChannelConfig     0x0003
           Left Front (L)
           Right Front (R)
         iChannelNames           0
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             3
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               5
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                 5
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
         bTerminalLink           3
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
         tSamFreq[ 0]        16000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0044  1x 68 bytes
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       2
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           3
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
         tSamFreq[ 0]        32000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0084  1x 132 bytes
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       3
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           3
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        4
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0
       iInterface              0
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.11
           bCountryCode            0 Not supported
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength     246
           Report Descriptors:
             ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x84  EP 4 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0020  1x 32 bytes
         bInterval               2
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        5
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
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
     wSpeedsSupported   0x000e
       Device can operate at Full Speed (12Mbps)
       Device can operate at High Speed (480Mbps)
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   2
       Lowest fully-functional device speed is High Speed (480Mbps)
     bU1DevExitLat          10 micro seconds
     bU2DevExitLat         256 micro seconds
 Device Status:     0x0000
   (Bus Powered)

Signed-off-by: Perry Joyce <perrygjoyce97@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc1456..4953b7b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2745,6 +2745,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
+	/* Logitech Brio 500 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x046d,
+	  .idProduct		= 0x0943,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_DEF) },
 	/* Chicony CNF7129 (Asus EEE 100HE) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.56.0

