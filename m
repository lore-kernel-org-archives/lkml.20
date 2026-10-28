Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793224441;
	b=jD+YBzML2JOeSu9oTHqBjGKbT/dSYfM+AKsa6iTW9I2bCYkRXUX5eRfGTriomX9ZgZlO
	 muZHEHgtANOeX6Nviwq0PDydpci2giW1wycKhHItmFtjRFwyWdm1oKQmvB6GCLSQ1eWpq
	 Rhnsmhbc0iDzPC4n66jqQWgQ8JfYb+xab7CvkBU+/NX1/mkhHTYeHuqnDQTwpmeta4iqw
	 kU0RaqMj8Iemf+2ja6l2e7e0u6s7sM5UBmplQiOGJ2Uh3DTlr0tBluTog8QXGBFEgoHlQ
	 A1Ot+0KCUmo/3Qme2VMsVKkqAPgDVASgrr8kmGjb5xl/G2hNjjKYEH8VnSTW3jStE5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b7n8oaqAAARaMpxpM7FHSqtyS7J3IBf0szAe/7ZuLEg=;
	b=iWaSHIm3vsOkJEhXioOheg6zz6K618/MkWoBrIe9PeYVRGNlX03ppLd6eautMTlZH1ZE
	 gUQMhtq6VpEaRSqkaF3GkEgY6ogHa0YZVr7pMa/syubLXbkiFI6z43CVu8CW55nD72vBr
	 UQti1ilT5wxOEu2exxMdiX9g6yhzkE0fviwGzwhMt370ZTzGcKEYp9zSnAWc/UdhVINzH
	 l7IfbQoY5Pmx5IkU9AjJpe5fN3vaC4BjFPq3VDTAEK2bT87/N3srfdQAusPVM5x7Wh0cz
	 4PyKaSOnMiK0ZESVrwE6p5pcev58ZngDWZfQKBhhY5a2KVF5CptICUk8WZvFAxckSjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YUhmvcZY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE1606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AE1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YUhmvcZY
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so2119481eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793224439; cv=none;
        d=google.com; s=arc-20260327;
        b=W+HWummsx7NNmm0spkadnn4UFZDwIHOg+5N5QetWRPoIX+ej6JYLosk8JC66zfxVIF
         rdl0/PDiOogMSO/gGe2wC7Yr+0DABcK2zsJsY2dqbn1efuRFpvK9fhHzEA3z//kRv23F
         G53UKYaRXpvvjCpgLJlZkavPvCmSwGWxAwemKDnpUqqf5Eb53ONTeXeUOqAyNqN+l2y9
         vKNg5uGpHVOg9pY8TMUYs9eq/u5z54+A2FOzzz/XAet6TzTaJniLUQ0Jo7NThGBpUcZX
         geNzS0qtgv0TgZ5yt76u6uzH2l+z/ARTVo2CNa22hAO0A7dV6r4ZDhn93ArbDtjZ8zld
         GgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b7n8oaqAAARaMpxpM7FHSqtyS7J3IBf0szAe/7ZuLEg=;
        fh=Jz5rc4o4g27msFlUnoTZkf1efgvu4D33QACLS3ivp38=;
        b=OohO73sLDbOPagpJ+BP7NLhOvvucjI6yNI5XursncA6JoytP2BPYLKy+iVfep+z98C
         5yqplbTXXg64QKjNiEjKcFn+ZNl5dpIJ7hQ9v07zX8/iwMc+fw+sI21hegyccVEXzK8b
         27pVkfxqZLDSqikCZh2zyoJDYhl5TCjmHIiOk+H/OmrrgehfiJwvi+gRO3EgoU+s+duR
         sjlissDi5vox1wcV8n2iqBGuCT67yP8WQHEvZhXxE2SDbWn81KPpgdQg7bA5ukNfr0nD
         D0nw0oYbVluUEwQz5WP3bnh28zHivgrZOQ308jnvn0d+g9rE2w3FXqz4lEYG/sX9NEqs
         h12w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793224439; x=1793829239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b7n8oaqAAARaMpxpM7FHSqtyS7J3IBf0szAe/7ZuLEg=;
        b=YUhmvcZYQPUWrcPgEwz5+qVIlFjsxa3k+Sxh35aMpocNiq1+e4Q0CU7FW1a98vJRgM
         MLGraKRJRGFjX37X2BRTVX+GwNOSQllJ/P+W7giJtItOdzD25YblIj7Oq/iNul1Cbvv3
         xbQDQVVhhnLHjEIrl96TMlMFN8KC7VESTcpkKWh1Qm5eKmt6Ov7BxlbO3LUNtzNwO/NF
         XnHt/76IKs4MBzyu8U45T9z54nMwUvlpQh9Eg7PdUiLpt3tl6wePRVHFITKbzbtSe1QJ
         8TBqonW82MBcFLizypb25AlDS+pN/oJdDViUViPsK20UQBTFJAB0L5NjZ2TpkrXjc09O
         HK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224439; x=1793829239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7n8oaqAAARaMpxpM7FHSqtyS7J3IBf0szAe/7ZuLEg=;
        b=vLe1X8frtiw1HggGQSY3ZevSGjPzzhuz6z+eytUtuywWxIhWa6ahjlGLElawjTBFed
         t3boa1ICo3rN3Z6gq6abRHNfCzFnl5RksF7s1JgB8ZJYOMPZJfQZiR7lDppRezheRCOa
         +QDRiQlSb4q7BHReDIbgXsXRLAp74Py44gLvSIpi6CQjv6twYlYu5q6AqSql0uk6+5H+
         nxBs6AmLsjZ1L++Jj+wfNGTq1cblV2IKwICIk7XOKAb6x82az8O/rgQstAInmhal4myj
         UCBpRgsb15lh+92/g64jE7Xy+/rBBYymyU+G6HAaID2/h8iovu4MhDevGabn2aIRazaz
         EK8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlXQbN/ibnaZx+4ytVAlMgpkwV7XNdbyzhihcsfUZWQA0VSAmwlk0WXKXBZ66OOZ7BLcHbg4Et7FBg6h8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8QQ3DzRANWskt8D1hXFZmt/vnHeV1PAtUNZYf5U1fFG6sg7zz
	PpsSZgMX3Bb3FXIFknLLtuJZUYEbH8F9cg8L3jF+MLi8oJHqHGEJDENx9TCrMRD/fBmaQCa2KBR
	OAKgOuh5YOcgXiWV1sJldW9LxfC3fKkQ=
X-Gm-Gg: AYBFou05+4Jx2KeOdh4R3E63HpBkApRJ9BB0nOZgeiBxC8XuzDDHPqg+8BwiFG31wyR
	ACpdqGeDVO4GDDXzQNYSDfTpw0HDSKQihoaIl14y5yIy9v452KNtRo0eaZnZ3crzjyv3sHIV8us
	YaYKmSLkQZGi55LoMXTXM52ZZKm0uXJSGSUnJ2oEYYVGbPmO31guBsn7cu7l+63ergDLZG+oAwt
	os27/oGWHXkjXa3zcu7Bp2yfGDQGzm047TFP4LE/uZ3dcj6m5P4Rr5MagJQU8phucEI0CrPMK/g
	EGQkJhfxPCePQrbT+W5XJNY1kUXIL8QGgHiqDYnoUYD6x7bLVdKx9CqE7I+bd8RJgspW7qwA7dV
	+nEDR8a2euViKEokejj+Nwkp+z84WzmE+Fi7TDvULLZsTlliXFZppUpnga0JqxavikDkYoQ==
X-Received: by 2002:a05:7300:7b81:b0:351:1bdb:e3b7 with SMTP id
 5a478bee46e88-36a203afb76mr6340291eec.15.1793224438901; Wed, 28 Oct 2026
 14:53:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+2YD=Nxe25n8rmM-DS+w+Pg0N_YtOf_znJXNMi77SCwk3OUyw@mail.gmail.com>
 <20260925205706.GA697101@killaraus.ideasonboard.com> <CA+2YD=P3pNVi=GJ1qoqnsgA56Hg_N6iT_AXGPDBHn9XToxh1KA@mail.gmail.com>
 <CANiDSCsuiPN=9PNb9gckRwgZXMEouYTac0_DgbO1Mti+p2zH=A@mail.gmail.com>
In-Reply-To: <CANiDSCsuiPN=9PNb9gckRwgZXMEouYTac0_DgbO1Mti+p2zH=A@mail.gmail.com>
From: Perry Joyce <perrygjoyce97@gmail.com>
Date: Wed, 28 Oct 2026 21:53:46 +0000
X-Gm-Features: AclHuK9Ecu7y5GGiiFqMslhv3wQC-tXAwpiSNYeJ-KS0Wa2JrI5vdtteoRd5hFU
Message-ID: <CA+2YD=Pz9NorGP=PFu5=6d_uX1v-UxgzsVQ7VG93uoPt40pbMw@mail.gmail.com>
Subject: Re: uvcvideo: Logitech Brio 500 (046d:0943) needs UVC_QUIRK_PROBE_DEF
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hansg@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

Thanks. Full output of lsusb -v -d 046d:0943 below.

I=E2=80=99ll have a go at sending a patch adding UVC_QUIRK_PROBE_DEF for th=
is device.

Kind regards,
Perry


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
        guidFormat
{32595559-0000-0010-8000-00aa00389b71}
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


On Wed, 30 Sept 2026 at 07:27, Ricardo Ribalda <ribalda@chromium.org> wrote=
:
>
> Hi Perry
>
> Thanks for the report.
>
> Could you provide the output of lsusb -v -d 046d:0943 ?
>
> If you want to try, you could send a patch like this one (but with the
> right quirk):
> https://gitlab.freedesktop.org/linux-media/users/uvc/-/commit/056dfb7bf8c=
9d62367bd600a175e072692df67a6
>
> Thanks :)
>
> On Wed, 30 Sept 2026 at 01:13, Perry Joyce <perrygjoyce97@gmail.com> wrot=
e:
> >
> > Hi,
> >
> > Resending in plain text as requested.
> >
> > I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046=
d:0943):
> >
> > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).
> >
> > Kernel:
> >
> > Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17
> > Sep 2026 07:33:37 +0000 x86_64 GNU/Linux
> >
> > The webcam otherwise works normally.
> >
> > Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:
> >
> > modprobe -r uvcvideo
> >
> > modprobe uvcvideo quirks=3D0x100
> >
> > After loading the module with 0x100, the device initializes without
> > the probe-control error:
> >
> > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter
> > for testing purpose.
> > uvcvideo 1-3:1.0: Please report required quirks to the linux-media mail=
ing list.
> >
> > I also tested this across a reboot with:
> >
> > options uvcvideo quirks=3D0x100
> >
> > and the probe error remains absent. Normal 1920x1080 MJPEG capture at
> > 30 fps continues to work.
> >
> > Device information:
> >
> > idVendor=3D046d
> > idProduct=3D0943
> > bcdDevice=3D0.21
> > Product: Brio 500
> >
> > Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?
> >
> > I'm happy to provide additional logs or test a patch if needed.
> >
> > Kind regards,
> > Perry
> >
> >
> > On Fri, 25 Sept 2026 at 21:57, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hello Perry,
> > >
> > > Your original e-mail was sent as HTML, which gets silently rejected b=
y
> > > the kernel mailing lists. Could you please resend it as plain text ?
> > >
> > > On Fri, Sep 25, 2026 at 09:31:42PM +0100, Perry Joyce wrote:
> > > > Hi,
> > > >
> > > > I'm seeing a reproducible UVC probe error with a Logitech Brio 500 =
(046d:0943):
> > > >
> > > > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > > > uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).
> > > >
> > > > Kernel:
> > > >
> > > > Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17=
 Sep 2026
> > > > 07:33:37 +0000 x86_64 GNU/Linux
> > > >
> > > > The webcam otherwise works normally.
> > > >
> > > > Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:
> > > >
> > > > # modprobe -r uvcvideo
> > > > # modprobe uvcvideo quirks=3D0x100
> > > >
> > > > After loading the module with 0x100, the device initializes without=
 the
> > > > probe-control error:
> > > >
> > > > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > > > uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module paramete=
r for
> > > > testing purpose.
> > > > uvcvideo 1-3:1.0: Please report required quirks to the linux-media =
mailing
> > > > list.
> > > >
> > > > I also tested this across a reboot with:
> > > >
> > > > options uvcvideo quirks=3D0x100
> > > >
> > > > and the probe error remains absent. Normal 1920x1080 MJPEG capture =
at 30 fps
> > > > continues to work.
> > > >
> > > > Device information:
> > > >
> > > > idVendor=3D046d
> > > > idProduct=3D0943
> > > > bcdDevice=3D0.21
> > > > Product: Brio 500
> > > >
> > > > Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?
> > > >
> > > > I'm happy to provide additional logs or test a patch if needed.
> > > >
> > > >
> > > > Kind Regards,
> > > > Perry
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
>
>
> --
> Ricardo Ribalda
