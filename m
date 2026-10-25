Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.9.219.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792970793;
	b=f2fiG6YqNhGbG5I2RcDor3NUVL6pANW5MjWecQ1RY2DslaJp+nAWQx7Y3XvBoeAEnvBV
	 TczO4PSDOBdV/vtq0lK24oXbUp0incjEH6xmt3XodrFgO7LbLF5NySgkXUEGq1Qvxu4Ft
	 qNfHQe/hIhueC7Zb8/7yXmiZMxKskmI29jZPEKrhOeZc+EShVWhOnVDJnCH3rKGY3XG/p
	 BwpzJM3ucMkagLLggRoLy+YYTISAr0RREr2Cw1EJ8e0t689cPRXy9PB+6knac2wZ/mRM+
	 bEXBuzCC/ij8Cdu38lhGB5DCBy1pUIAarQ8VHm+ic/mkNQr95lR7PgCYm5NFtyMb3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792970793;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F8SSWwIQr/956j4W0PCqOgcXt68IW1mmcql9Ib0UKK4=;
	b=By90ZT1cQtHjr0IKFc4yxsPEPjyjYZhFL9GVcLo/zBpWJuQ+8M4a2LpZmjMH+X7JZk1e
	 jfbWNTepY72fvhH832kkl/zcKysOEFd+1/ySIr9HbqDKBFBW2aRQ+aVAUpZZDIgqE/Dag
	 /lfw9zdF49sSkPSo4Ujg6vP+BQp0DRaXf0hIO5HgeRjtc8rGoDQ2UJwtBfmRC8nvWgYMT
	 PT+8F8H3SQgqY5qLJrzBlPVTCMcazluGWUPlunCSmRdc8MHBrr9ibYN4PkbWt7ZlQ6D7M
	 VKBeMhlF0ZwpMpfwD50sAvTW4UkiBlZuP1KOvjyTHl+PWlXskjbPhUkT1fWnSD0HSgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=manuel-herrmann.de;
	spf=pass smtp.mailfrom=manuel-herrmann.de;
	arc=none smtp.remote-ip=176.9.219.86
Received: from mail.0x17.de (mail.0x17.de [176.9.219.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E4F606A31F;
	Sun, 25 Oct 2026 23:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E4F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manuel-herrmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manuel-herrmann.de
Received: from itw.netbird.selfhosted (209-98-142-46.pool.kielnet.net [46.142.98.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mh)
	by mail.0x17.de (Postfix) with ESMTPSA id 83DB28001B;
	Sun, 25 Oct 2026 23:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manuel-herrmann.de;
	s=s20260706; t=1792970778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8SSWwIQr/956j4W0PCqOgcXt68IW1mmcql9Ib0UKK4=;
	b=Q3A4Xhb3bksQTygHRupIpG06F/YfdVuuIztuuo+qA4dqctRJdwpyVeouOqfBTqyBAbZdd1
	CjeyeLIJeW2NPCZHorAW6gRF0NGnPbvyAtuZ+o0CXIdJPv1KAovyrektdwT6Txrid6OpBX
	uyFdbTLpUlljvW6eahfZMlt3NVuPkXU7qPiuGepSIDH6DYl3ROGX9A2rKYl1wCexP+cKjI
	D7EFTp3z9NReYhqF9KVSH8YJNsZ35WWC5TzghhzrOfL7pmCnn7JrfU79az6Ukqc4aQi+hh
	me6ZOeNSfJqn5gtn4J/OgNB1tFbTvoYQAcU33HlH6p9vOrn69LByanf+f6r8rg==
From: Manuel Herrmann <m@manuel-herrmann.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add support for NV21 pixel format
Date: Mon, 26 Oct 2026 00:26:07 +0100
Message-ID: <20261025232607.386258-1-m@manuel-herrmann.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025200645.GB1001933@killaraus.ideasonboard.com>
References: <20261025143522.327365-1-m@manuel-herrmann.de> <20261025200645.GB1001933@killaraus.ideasonboard.com>
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

On 2026-10-25 21:06, Laurent Pinchart wrote:
> On Sun, Oct 25, 2026 at 03:35:22PM +0100, Manuel Herrmann wrote:
>> Add support for the NV21 (Y/VU 4:2:0) pixel format to the uvcvideo
>> driver. This format is exposed by the color camera of the Creality Pika
>> 3D scanner (2bc5:0c0b), next to YUYV and MJPEG. Without it, the driver
>
> Could you please provide the USB descriptors for that device
> (`lsusb -v -d 2bc5:0c0b`) ?

Sure, here is the output:

Bus 002 Device 009: ID 2bc5:0c0b Orbbec 3D Technology International, Inc Creality Pika
Negotiated speed: SuperSpeed (5Gbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x2bc5 Orbbec 3D Technology International, Inc
  idProduct          0x0c0b Creality Pika
  bcdDevice            4.19
  iManufacturer           1 Creality
  iProduct                2 Creality Pika
  iSerial                 3 AWR3861007J
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x02fb
    bNumInterfaces          5
    bConfigurationValue     1
    iConfiguration          4 Video
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 Creality Pika Depth Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 Creality Pika Depth Camera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004e
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
        bmControls           0x0000000a
          Auto-Exposure Mode
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            2
        bmControls     0x00000200
          Gain
        iProcessing             0 
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0 
      VideoControl Interface Descriptor:
        bLength                26
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {a55751a1-f3c5-4a5e-8d5a-6854b8fa2716}
        bNumControls            3
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            1
        bmControls( 0)       0x07
        iExtension              0 
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
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x00d7
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       3
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
        bNumFrameDescriptors                1
        guidFormat                            {20203859-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
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
        bLength                            78
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 98304000
        dwMaxBitRate                589824000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         100000
        bFrameIntervalType                 13
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)             90909
        dwFrameInterval( 2)            100000
        dwFrameInterval( 3)            111111
        dwFrameInterval( 4)            125000
        dwFrameInterval( 5)            142857
        dwFrameInterval( 6)            166666
        dwFrameInterval( 7)            200000
        dwFrameInterval( 8)            250000
        dwFrameInterval( 9)            333333
        dwFrameInterval(10)            500000
        dwFrameInterval(11)            666666
        dwFrameInterval(12)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        2
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
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            78
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 98304000
        dwMaxBitRate                589824000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         100000
        bFrameIntervalType                 13
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)             90909
        dwFrameInterval( 2)            100000
        dwFrameInterval( 3)            111111
        dwFrameInterval( 4)            125000
        dwFrameInterval( 5)            142857
        dwFrameInterval( 6)            166666
        dwFrameInterval( 7)            200000
        dwFrameInterval( 8)            250000
        dwFrameInterval( 9)            333333
        dwFrameInterval(10)            500000
        dwFrameInterval(11)            666666
        dwFrameInterval(12)           1000000
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
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              13
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               8 Creality Pika RGB Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              8 Creality Pika RGB Camera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004e
        dwClockFrequency       48.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       3
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
        bmControls           0x0000200a
          Auto-Exposure Mode
          Exposure Time (Absolute)
          Roll (Absolute)
      VideoControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            2
        bmControls     0x0000165b
          Brightness
          Contrast
          Saturation
          Sharpness
          White Balance Temperature
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0 
      VideoControl Interface Descriptor:
        bLength                26
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {a55751a1-f3c5-4a5e-8d5a-6854b8fa2716}
        bNumControls            3
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            1
        bmControls( 0)       0x07
        iExtension              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              9 Video Streaming
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x0105
        bEndpointAddress                 0x82  EP 2 IN
        bmInfo                              0
        bTerminalLink                       3
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     4
        bmaControls( 2)                     4
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors                1
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
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 98304000
        dwMaxBitRate                589824000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            250000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
        dwFrameInterval( 6)           1000000
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                1
        guidFormat                            {3132564e-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      12
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
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 98304000
        dwMaxBitRate                589824000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            250000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
        dwFrameInterval( 6)           1000000
        dwFrameInterval( 7)           2000000
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
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 98304000
        dwMaxBitRate                589824000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            250000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
        dwFrameInterval( 6)           1000000
        dwFrameInterval( 7)           2000000
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
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              13
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0 
      iInterface             11 HID Interface
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.01
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      33
          Report Descriptors: 
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0100  1x 256 bytes
        bInterval               4
        bMaxBurst               0
        wBytesPerInterval     256
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0100  1x 256 bytes
        bInterval               4
        bMaxBurst               0
        wBytesPerInterval     256
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
    bU1DevExitLat           0 micro seconds
    bU2DevExitLat           0 micro seconds
Device Status:     0x0000
  (Bus Powered)

-- 
Regards,

Manuel Herrmann
