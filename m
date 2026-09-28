Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78C2D7DC6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599224; cv=none; b=dVsMbfmvpwI4AgLyfk/MueOdteZFY915OoskNzb9wZo8VLgs8QCdUG6uOrOUG25Da1a+yJO6V/Jljuugjjzlneetolf88RW+2b6Gn6n19clQ+UF9RlomJCObSm7sa+OvYeSQTuwnpz+OlULi03heS1z78EF+bncZNXSHtVd4s9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599224; c=relaxed/simple;
	bh=WOy8hd4Mx5kriQeClKuCInFFVUIb4kVJZmUqdR7ADuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLdDEonWPUDpM1wl/h0MEKNcd2ZQGO6Yu/XRS57ozWnt6Skr41f9j/wSh6Q8w0beTIIo/nahfr75fHprUnyLORvVP3hpnbNQ2SfjbxRca6LLTBg8qT5rbG8in8cBq4b9zvH1XZkmjNHtyNJCH1jugk2aY+hIsXpchQNuCswyPxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=absvM4n2; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="absvM4n2"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso1584214a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790599221; x=1791204021; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FjvBduPpcHg5g7UX6XHKxThti5fwrycXnGczEjqFwo4=;
        b=absvM4n2dvO2UzissFcpsCHjt+HyLjZcoa4zqKEpCRO3PrVALV8PQcroKSlZlDVgR2
         n6w6BYTEGZ/byIFjAaQCZrUYvaO9SEp6hvz8b/hU2zxoi3PckDXGapmRS+l4IQbGc8Ie
         t1kmLlv7vrEEQyyrYuGt0dqvMvq26ibB1Xc+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599221; x=1791204021;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FjvBduPpcHg5g7UX6XHKxThti5fwrycXnGczEjqFwo4=;
        b=j48GhTzhNRvv3s3uJCR+r7hdth6jNmxRgb1+M3IZwvZrvFS/VezK661uKGxRNTfRp+
         DGsBb68MUSOqIh9TQ7UpvSAX/7KVkKe5ytG8BRXRdHw+appaQIX3l4bxn4SLG13o1k0T
         BrpE3SFhWOIa2x/2OMENXcFBZ+4e1Hhtl7clsPfGlB9rJtfG3rDwlEXeyhJLcxK7naq3
         EvP8elIy9up5NmEQKGOExmlzfT4szZinRrwkQhSjVtya0oW+zXGuB+w/RJ9RPA80cqfv
         5fqyFKTgdxnzwHUv5eILgt69l4Bqk4abOt8y9KEcskAoIlWKXbv4F5mXprL4sngikkd7
         3yGw==
X-Forwarded-Encrypted: i=1; AKwUvByWXuYQTQJ9TOyh7er0d84qKmgcKGGDXYEVp4+UurIEHsgBGwBr4EnXdUQwl70SGNsbzTjRgYf6Vx4eQ7c=@vger.kernel.org
X-Gm-Message-State: AFuF++nwNJGMv1XNpvbJ0cJ/WvdudyAfInpNIRYpUl/AG2DLMKTv4PN5
	9cG9j7201q6nQteTQ+fcjghGFwrkvTPULP6/ZgnA3AuTih9DH6WOD5Z7Yom/LD0YfsNwM/yEHWQ
	PG6k=
X-Gm-Gg: AYBFou3PKKSYEKUNT5/SSccBz9rLxLRSCbdXoQ77xZsh2fvFprqFEuANGW32r9y5EqE
	TBLl7tRrEonqWzXF0YOaNfOY2AuAj8M6UIy0LMry4X9JtG565P1Ethr3mWc0leHfcpJYBVX5aV3
	DtOd3/Ipob59iLW4s969dCK3MJHgk4WrwwdxU8+qQsgwhB1xJ3kUeXAgOSONzXi0VvdDFolkllE
	L06xCpd/l0XLkxIkYsAVU5Vrgk9Kr5IqLACL2w/JYbItmpQD1Uqi0d+sn1LNalY4ZhD8VUn/dLd
	ie6C7M93iaiV9C+xRrkiQyf62/RZO1EpekKTZZZ1tLPFGw5BWuladlL6soOGP5gLOXQsX+SG3vU
	/dEEii8bkHgFEwDVuygHR5Pg1ynPd48Udbr8r4H0+indygsrNqEAVxv6BprZDPqV2roSeTzZxOb
	J5XIixD7e539wkBndd/Ljb5ZNMVJYiqSruZlprBa0I54kDvI57q2+l7sc7LiyFCZCq43uf6LpmL
	VjVmYp1GYrJrfuiXR7zhjDgMGj8z3iUOd4c8Q==
X-Received: by 2002:a05:6a20:1446:b0:3da:bea4:6215 with SMTP id adf61e73a8af0-3de26c5bd4emr8386210637.19.1790599221442;
        Mon, 28 Sep 2026 05:40:21 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78794aa7fsm4480105a12.24.2026.09.28.05.40.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:40:20 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso1661141c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwD1A6kqWK+ye2VRhLGT7p3Pt/lQ3+3jS01T0Bq1Xk+IRaQMsI/pvxiG139+45PZExC7VMCnaS+iQxQDMM=@vger.kernel.org
X-Received: by 2002:a05:701a:ca8e:b0:145:15d:5313 with SMTP id
 a92af1059eb24-146cffbd9d0mr10018814c88.25.1790599219248; Mon, 28 Sep 2026
 05:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-5-604328d8a0dd@chromium.org> <20260928123822.GE157191@killaraus.ideasonboard.com>
In-Reply-To: <20260928123822.GE157191@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:40:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCuNuA+rRzj-1eczTWNswtWmOTGBc2QstZf=E9YfVvE=Wg@mail.gmail.com>
X-Gm-Features: AclHuK_LCaks4KQkDQZgyLZnibSvz9Z2bAlYgnRveZBn7M1sZqkNDMY8C8mErJU
Message-ID: <CANiDSCuNuA+rRzj-1eczTWNswtWmOTGBc2QstZf=E9YfVvE=Wg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: uvcvideo: Force UVC version for Avermedia GC515
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 14:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Sep 11, 2026 at 01:22:29PM +0000, Ricardo Ribalda wrote:
> > The device announces itself as UVC 1.5, but it only accepts UVC 1.1
> > controls.
> >
> > The camera can probably be handled by the automatic uvc_version handler,
> > but it is more correct to add a quirk and keep some tracking of what
> > vendors are more or less compliant. Also it might be more robust if we
> > introduce more UVC version-dependent code.
> >
> > Bus 003 Device 021: ID 07ca:1515 AVerMedia Technologies, Inc. X'tra Go GC515
> > Negotiated speed: High Speed (480Mbps)
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2 [unknown]
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   idVendor           0x07ca AVerMedia Technologies, Inc.
> >   idProduct          0x1515 X'tra Go GC515
> >   bcdDevice            0.10
> >   iManufacturer           1 AVerMedia
> >   iProduct                2 X'tra Go GC515
> >   iSerial                 3 5313180000221
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x03fd
> >     bNumInterfaces          4
> >     bConfigurationValue     1
> >     iConfiguration          0
> >     bmAttributes         0xc0
> >       Self Powered
> >     MaxPower              500mA
> >     Interface Association:
> >       bLength                 8
> >       bDescriptorType        11
> >       bFirstInterface         0
> >       bInterfaceCount         2
> >       bFunctionClass         14 Video
> >       bFunctionSubClass       3 Video Interface Collection
> >       bFunctionProtocol       0
> >       iFunction               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      1 Video Control
> >       bInterfaceProtocol      1
> >       iInterface              0
> >       VideoControl Interface Descriptor:
> >         bLength                13
> >         bDescriptorType        36
> >         bDescriptorSubtype      1 (HEADER)
> >         bcdUVC               1.50
> >         wTotalLength       0x0059
> >         dwClockFrequency       30.000000MHz
> >         bInCollection           1
> >         baInterfaceNr( 0)       1
> >       VideoControl Interface Descriptor:
> >         bLength                18
> >         bDescriptorType        36
> >         bDescriptorSubtype      2 (INPUT_TERMINAL)
> >         bTerminalID             1
> >         wTerminalType      0x0201 Camera Sensor
> >         bAssocTerminal          0
> >         iTerminal               0
> >         wObjectiveFocalLengthMin      0
> >         wObjectiveFocalLengthMax      0
> >         wOcularFocalLength            0
> >         bControlSize                  3
> >         bmControls           0x00000000
> >       VideoControl Interface Descriptor:
> >         bLength                 9
> >         bDescriptorType        36
> >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> >         bTerminalID             2
> >         wTerminalType      0x0101 USB Streaming
> >         bAssocTerminal          0
> >         bSourceID               4
> >         iTerminal               0
> >       VideoControl Interface Descriptor:
> >         bLength                 7
> >         bDescriptorType        36
> >         bDescriptorSubtype      4 (SELECTOR_UNIT)
> >         bUnitID                 3
> >         bNrInPins               1
> >         baSource( 0)            1
> >         iSelector               0
> >       VideoControl Interface Descriptor:
> >         bLength                13
> >         bDescriptorType        36
> >         bDescriptorSubtype      5 (PROCESSING_UNIT)
> >         bUnitID                 4
> >         bSourceID               3
> >         wMaxMultiplier          0
> >         bControlSize            3
> >         bmControls     0x00000000
> >         iProcessing             0
> >         bmVideoStandards     0x00
> >       VideoControl Interface Descriptor:
> >         bLength                29
> >         bDescriptorType        36
> >         bDescriptorSubtype      6 (EXTENSION_UNIT)
> >         bUnitID                 5
> >         guidExtensionCode         {55be8e1c-2fdb-4f7a-bd8d-b9b1108d20c3}
> >         bNumControls           24
> >         bNrInPins               1
> >         baSourceID( 0)          4
> >         bControlSize            4
> >         bmControls( 0)       0xff
> >         bmControls( 1)       0xff
> >         bmControls( 2)       0xff
> >         bmControls( 3)       0x00
> >         iExtension              0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x85  EP 5 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0040  1x 64 bytes
> >         bInterval               1
> >         VideoControl Endpoint Descriptor:
> >           bLength                 5
> >           bDescriptorType        37
> >           bDescriptorSubtype      3 (EP_INTERRUPT)
> >           wMaxTransferSize       64
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      1
> >       iInterface              0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            16
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  1 (INPUT_HEADER)
> >         bNumFormats                         3
> >         wTotalLength                   0x0303
> >         bEndpointAddress                 0x81  EP 1 IN
> >         bmInfo                              0
> >         bTerminalLink                       2
> >         bStillCaptureMethod                 1
> >         bTriggerSupport                     0
> >         bTriggerUsage                       0
> >         bControlSize                        1
> >         bmaControls( 0)                     4
> >         bmaControls( 1)                     4
> >         bmaControls( 2)                     0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            28
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
> >         bFormatIndex                        1
> >         bNumFrameDescriptors                8
> >         guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
> >         bBitsPerPixel                      24
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 2 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        1
> >         bVariableSize                     1
> >       VideoStreaming Interface Descriptor:
> >         bLength                            62
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           1920
> >         wHeight                          1080
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  9
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)             83333
> >         dwFrameInterval( 1)             83416
> >         dwFrameInterval( 2)            166666
> >         dwFrameInterval( 3)            166833
> >         dwFrameInterval( 4)            200000
> >         dwFrameInterval( 5)            333333
> >         dwFrameInterval( 6)            333667
> >         dwFrameInterval( 7)            400000
> >         dwFrameInterval( 8)            416666
> >       VideoStreaming Interface Descriptor:
> >         bLength                            42
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         2
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           3840
> >         wHeight                          2160
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         333333
> >         bFrameIntervalType                  4
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            333333
> >         dwFrameInterval( 1)            333667
> >         dwFrameInterval( 2)            400000
> >         dwFrameInterval( 3)            416666
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         3
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           2560
> >         wHeight                          1440
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  2
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         4
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           1280
> >         wHeight                           800
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  2
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >       VideoStreaming Interface Descriptor:
> >         bLength                            38
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         5
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           1280
> >         wHeight                           720
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  3
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >         dwFrameInterval( 2)            200000
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         6
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                            720
> >         wHeight                           576
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         200000
> >         bFrameIntervalType                  2
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            200000
> >         dwFrameInterval( 1)            400000
> >       VideoStreaming Interface Descriptor:
> >         bLength                            42
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         7
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                            720
> >         wHeight                           480
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  4
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >         dwFrameInterval( 2)            333333
> >         dwFrameInterval( 3)            333667
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         8
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                            640
> >         wHeight                           480
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  2
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     0 (Unspecified)
> >         bTransferCharacteristics            0 (Unspecified)
> >         bMatrixCoefficients                 0 (Unspecified)
> >       VideoStreaming Interface Descriptor:
> >         bLength                            28
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
> >         bFormatIndex                        2
> >         bNumFrameDescriptors                8
> >         guidFormat                            {43564548-0000-0010-8000-00aa00389b71}
> >         bBitsPerPixel                      24
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 2 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        1
> >         bVariableSize                     1
> >       VideoStreaming Interface Descriptor:
> >         bLength                            62
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           1920
> >         wHeight                          1080
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  9
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)             83333
> >         dwFrameInterval( 1)             83416
> >         dwFrameInterval( 2)            166666
> >         dwFrameInterval( 3)            166833
> >         dwFrameInterval( 4)            200000
> >         dwFrameInterval( 5)            333333
> >         dwFrameInterval( 6)            333667
> >         dwFrameInterval( 7)            400000
> >         dwFrameInterval( 8)            416666
> >       VideoStreaming Interface Descriptor:
> >         bLength                            42
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         2
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           3840
> >         wHeight                          2160
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         333333
> >         bFrameIntervalType                  4
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            333333
> >         dwFrameInterval( 1)            333667
> >         dwFrameInterval( 2)            400000
> >         dwFrameInterval( 3)            416666
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         3
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           2560
> >         wHeight                          1440
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  2
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         4
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           1280
> >         wHeight                           800
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  2
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >       VideoStreaming Interface Descriptor:
> >         bLength                            38
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         5
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           1280
> >         wHeight                           720
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  3
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >         dwFrameInterval( 2)            200000
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         6
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                            720
> >         wHeight                           576
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         200000
> >         bFrameIntervalType                  2
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            200000
> >         dwFrameInterval( 1)            400000
> >       VideoStreaming Interface Descriptor:
> >         bLength                            42
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         7
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                            720
> >         wHeight                           480
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  4
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >         dwFrameInterval( 2)            333333
> >         dwFrameInterval( 3)            333667
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         8
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                            640
> >         wHeight                           480
> >         dwMinBitRate                 33554432
> >         dwMaxBitRate                268435456
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  2
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            166833
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     0 (Unspecified)
> >         bTransferCharacteristics            0 (Unspecified)
> >         bMatrixCoefficients                 0 (Unspecified)
> >       VideoStreaming Interface Descriptor:
> >         bLength                            11
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  6 (FORMAT_MJPEG)
> >         bFormatIndex                        3
> >         bNumFrameDescriptors                1
> >         bFlags                              0
> >           Fixed-size samples: No
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 1 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        1
> >       VideoStreaming Interface Descriptor:
> >         bLength                            30
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x01
> >           Still image supported
> >         wWidth                           1920
> >         wHeight                          1080
> >         dwMinBitRate                314572800
> >         dwMaxBitRate                314572800
> >         dwMaxVideoFrameBufferSize     4147200
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  1
> >         dwFrameInterval( 0)            166666
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     0 (Unspecified)
> >         bTransferCharacteristics            0 (Unspecified)
> >         bMatrixCoefficients                 0 (Unspecified)
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x81  EP 1 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >     Interface Association:
> >       bLength                 8
> >       bDescriptorType        11
> >       bFirstInterface         2
> >       bInterfaceCount         2
> >       bFunctionClass          1 Audio
> >       bFunctionSubClass       2 Streaming
> >       bFunctionProtocol       0
> >       iFunction               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        2
> >       bAlternateSetting       0
> >       bNumEndpoints           0
> >       bInterfaceClass         1 Audio
> >       bInterfaceSubClass      1 Control Device
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       AudioControl Interface Descriptor:
> >         bLength                 9
> >         bDescriptorType        36
> >         bDescriptorSubtype      1 (HEADER)
> >         bcdADC               1.00
> >         wTotalLength       0x0026
> >         bInCollection           1
> >         baInterfaceNr(0)        3
> >       AudioControl Interface Descriptor:
> >         bLength                12
> >         bDescriptorType        36
> >         bDescriptorSubtype      2 (INPUT_TERMINAL)
> >         bTerminalID             1
> >         wTerminalType      0x0602 Digital Audio Interface
> >         bAssocTerminal          0
> >         bNrChannels             2
> >         wChannelConfig     0x0003
> >           Left Front (L)
> >           Right Front (R)
> >         iChannelNames           0
> >         iTerminal               0
> >       AudioControl Interface Descriptor:
> >         bLength                 9
> >         bDescriptorType        36
> >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> >         bTerminalID             2
> >         wTerminalType      0x0101 USB Streaming
> >         bAssocTerminal          0
> >         bSourceID               3
> >         iTerminal               0
> >       AudioControl Interface Descriptor:
> >         bLength                 8
> >         bDescriptorType        36
> >         bDescriptorSubtype      6 (FEATURE_UNIT)
> >         bUnitID                 3
> >         bSourceID               1
> >         bControlSize            1
> >         bmaControls(0)       0x03
> >           Mute Control
> >           Volume Control
> >         iFeature                0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        3
> >       bAlternateSetting       0
> >       bNumEndpoints           0
> >       bInterfaceClass         1 Audio
> >       bInterfaceSubClass      2 Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        3
> >       bAlternateSetting       1
> >       bNumEndpoints           1
> >       bInterfaceClass         1 Audio
> >       bInterfaceSubClass      2 Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       AudioStreaming Interface Descriptor:
> >         bLength                 7
> >         bDescriptorType        36
> >         bDescriptorSubtype      1 (AS_GENERAL)
> >         bTerminalLink           2
> >         bDelay                  1 frames
> >         wFormatTag         0x0001 PCM
> >       AudioStreaming Interface Descriptor:
> >         bLength                11
> >         bDescriptorType        36
> >         bDescriptorSubtype      2 (FORMAT_TYPE)
> >         bFormatType             1 (FORMAT_TYPE_I)
> >         bNrChannels             2
> >         bSubframeSize           2
> >         bBitResolution         16
> >         bSamFreqType            1 Discrete
> >         tSamFreq[ 0]        48000
> >       Endpoint Descriptor:
> >         bLength                 9
> >         bDescriptorType         5
> >         bEndpointAddress     0x83  EP 3 IN
> >         bmAttributes            5
> >           Transfer Type            Isochronous
> >           Synch Type               Asynchronous
> >           Usage Type               Data
> >         wMaxPacketSize     0x00c4  1x 196 bytes
> >         bInterval               4
> >         bRefresh                0
> >         bSynchAddress           0
> >         AudioStreaming Endpoint Descriptor:
> >           bLength                 7
> >           bDescriptorType        37
> >           bDescriptorSubtype      1 (EP_GENERAL)
> >           bmAttributes         0x01
> >             Sampling Frequency
> >           bLockDelayUnits         0 Undefined
> >           wLockDelay         0x0000
> >
> > Cc: stable@vger.kernel.org
> > Fixes: b400b6f28af0 ("media: uvcvideo: Force UVC version to 1.0a for 1bcf:0b40") # When version overwritte was added
>
> That doesn't seem quite right, this patch doesn't fix that commit. I
> think you can omit the Fixes tag. With that,

Without the Fixes tag, how to I let stable know until what version it
should backport the patch?

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > Reported-by: Edwin Gatier <edwin.gatier@protonmail.com>
> > Closes: https://lore.kernel.org/linux-media/CANiDSCu4AW=JZ9FS+Ny=DK_+LqqytGvSe+V6aVncRiGRiyDMfA@mail.gmail.com/T/#me584c35c4b523ac455925a1590a3de8efc354349
> > Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index adec9d1aa653..bbfc409c5167 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2847,6 +2847,17 @@ static const struct usb_device_id uvc_ids[] = {
> >         .bInterfaceSubClass   = 1,
> >         .bInterfaceProtocol   = 0,
> >         .driver_info          = (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
> > +     /* Avermedia GC515 */
> > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > +       .idVendor             = 0x07ca,
> > +       .idProduct            = 0x1515,
> > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > +       .bInterfaceSubClass   = 1,
> > +       .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > +       .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > +             .uvc_version = 0x0110,
> > +       } },
> >       /* ViMicro Vega */
> >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                               | USB_DEVICE_ID_MATCH_INT_INFO,
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
