Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0854F4753;
	Thu, 15 Oct 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070531; cv=none; b=kU/NX0GMs4CwwYyJb7fnZ8qJc2UkslEIkJLuhv8Q7cuQxtIbPUYiAh5oA2hSXxMx3PMea7mmDmv7DfEZMkS7517/P+n8VPMPNh5v4fEgoSS3M/0AK2zSwh8TXBQbb84+rwgm7/gxy89R/KawvhdrMGoL9IdNFjeIRXXY/+/Wa0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070531; c=relaxed/simple;
	bh=72zWqaeDl4nLOLtnMsKwa9rz2e7NI7gjjXJbDg2f3a8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eeG9KvRFDrukHyKU+nN4Izvy1IZ1+Di+RmnQQnD6SzUPzwR+2aEAE4L5rwHPyDtlsniCeGB02zmM1RsmKyhTA+souVeneL7vof7dCbC9YY23tuftisUzy5DFMkCS5ug/14RgMtXSaFYOn6q4dLtRfpkSJ6TmqoYb4t0tCM45R7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q5yHAGRY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q5yHAGRY"
Received: from [192.168.1.215] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A8B62F8;
	Thu, 15 Oct 2026 15:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792070403;
	bh=72zWqaeDl4nLOLtnMsKwa9rz2e7NI7gjjXJbDg2f3a8=;
	h=From:Subject:Date:To:Cc:From;
	b=Q5yHAGRYwxK4vo9XtrZKD+X+aku3maDiDBbONg6/kRVX1Ug7ePhOC37mpb0sZWi5L
	 ZR0yKnex5wZ7qTpqLnflxPXr8Z6oIn85ClvhTWUNKFINYRvsq4Zxhpdh4R70oWCquY
	 4tJGv9cfFiBt3HzyivjuoTQMe23Dw2KE9EyfdUuQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v7 0/2] media: i2c: Add driver for Mira016
Date: Thu, 15 Oct 2026 15:21:48 +0200
Message-Id: <20261015-mira016-v7-0-828c931c5550@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XRy07DMBAF0F+pvMZo7PEjYcV/VCz8pEZqjOwSF
 VX5d+wimizIcqR77l3MjdRQUqjk5XAjJcyppjy1Qz8diDuZ6T3Q5NtNOHAFI3B6TsUAU1TrYJV
 VXKIXpKU/S4jpem86vv3e9ct+BHfpvCdOqV5y+b5Pzazn/lrx0TozCtREAIYhggb/mnwwNU82m
 +KfXT6TXj7zLRcr540z76K2aAbQYYfjluuVY+MW9GCUHtErucPFlg8rF319lCBBOIbM7XC54Qg
 rl42LcTQojB04iB2uHpwBkytXfb29xUWvPEr9D1+W5QcKm3cC8gEAAA==
X-Change-ID: 20260902-mira016-77eb6b6253d4
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6816;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=72zWqaeDl4nLOLtnMsKwa9rz2e7NI7gjjXJbDg2f3a8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBq0NN8ZeHtMbZ9kkUH8HebFU8cmyJOTcDSvz6Gc
 AtWckCpRxmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCatDTfAAKCRByNAaPFqFW
 PDpLEACMX9jKvVE11wRzTxbzX3u/6FmNveTu5ezpBrQZWjbDGewG7TP+W+7fcyP0rr14W36V9Uu
 Z6Mp7DBJm98liTEBBoE7mUK4nlOX3FdHfRhjjHon61sMsxLXEUZJR2wZXzyoJqHWflGsuGBzoQ/
 jYwcDTq2BGJgBnQOskqMPw66K6uQdn54RjkffIToRfc5ussgZHjrqyQfjEPFKsEeUunR7b3Owp9
 muLv1zo23PsZ25iOsoPBJJytX95/TGqgmELZxPCc50/2Cr/N4q7UrPTsNSC/Wc5NEITSaxLOvC4
 FRySy5H4XEQypv4edbUcHqzqYHBgKWQhL3qYTpHoQBOmJ0vJkYW3ZSBhzURxioRmZxuIgYKngvc
 VCLw1rKImaOkW2wSJtxuWurhQ+MjPTuh+KtI+13Z4rSYKtkkkNq9iiubErGvH+gHhp6lYE+8+t/
 G4RhH6912Yz9pDQtgAh/wPXipCHZfG4v9UrSQBz7W9N4766g5jBqNA0PRAWA/qRwjheK4TlsvgW
 BBFD47BjZPGEofdJKgU6GfypealNHbqUvQ+jbLBtXyOOqLvjGL83uk/siAo0VXD6BhNhozfhnSx
 If0JZnIZPDTJod6M0301puZ0602nFxPeNScKVtc+qZGBmWt/gLYqrjeGucqCju5NKkHogj9ouQI
 4+PVYuDcWMLczFw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

ams OSRAM Mira016 is a 0.16MP NIR enhanced global shutter image sensor.
It supports 8, 10 and 12 bits luma-only image formats with configurable
gains (only in 8 and 10 bit modes, with the 12 bit gains fixed at 1x).

Add a Video4Linux2 subdevice driver for it.

The Mira016 supports binning, skipping and embedded data. It would be
an ideal candidate for the new common RAW sensor model.

As the model is not available yet in mainline, this first version
doesn't support set_selection() and doesn't support embedded data.

These features will be implemented on top of the new RAW sensor model
once available.

CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1767338

$ ./v4l2-compliance -d /dev/v4l-subdev2
v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38

Compliance test for device /dev/v4l-subdev2:

Driver Info:
	Driver version   : 6.18.37
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev2 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 11 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev2: 46, Succeeded: 46, Failed: 0, Warnings: 0

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v7:
- Fix power on error path as reported by Sashiko
- Link to v6: https://patch.msgid.link/20261015-mira016-v6-0-177ecfd6d357@ideasonboard.com

Changes in v6:
- Address Tarang's review comments:
  - Remove unused macros
  - Check for FORMAT_ACTIVE && is_streaming() at the beginning of
    set_pad_fmt()
  - Use mira016->dev where possible
  - Fix pll_m_lut[] and row_length initialization
  - Remove repeated writes to register 0xe000 from sequences
- Use the raw regulator APIs: bulk api do not guarantee ordering, which
  is instead specified by Mira016 manual
- Implement soft reset handling according to the sensor manual operation
  data flow
- Link to v5: https://patch.msgid.link/20260930-mira016-v5-0-499a34ab8204@ideasonboard.com

Changes in v5:
- Rebase and add support for struct v4l2_subdev_client_info
- Call pm_runtime_set_suspended() conditioanlly
- Remove start streaming from register sequences
- Break-out ROW_LENGTH configuration to a dedicated function
- Remove start streaming from register sequences
- Link to v4: https://patch.msgid.link/20260908-mira016-v4-0-1950504c131c@ideasonboard.com

Changes in v4:
- Address Sashiko comments:
  - Correct XWIN and XRIGHT registers sizes
  - Correct pll esc_period calculation
  - Do not mix gotos and cleanup in endpoint parsing
- Link to v3: https://patch.msgid.link/20260907-mira016-v3-0-b078a6793d65@ideasonboard.com

Changes in v3:
- dts: remove labels from example
- Address Sakari's comments
  - Parse endpoint early
  - Do not overwrite firmware parsing errors
  - use div_u64()
- Link to v2: https://patch.msgid.link/20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com

Changes in v2:
- Address Sashiko comments:
    - Do not overwrite cci_write() return error codes
    - Don't call mira016_calc_row_length() in init_state()
      - This would re-calculate row length at each open() call and modify
        the sensor configuration even for TRY states.
      - The call is also unecessary as:
        - row_length is initialized in probe()
        - mira016_calc_row_length() is called by set_pad_format() for ACTIVE
          states already
    - Offset the gain codes by 1. The gain LUT tables are 0-indexed while
      V4L2 controls are indexed by 1. Adjust the gain index before accessing
      the LUT to avoid and out-of-bounds error
    - Free the control handler before the subdev state during remove, as the
      s_ctrl handler uses the subdev active state
- Link to v1: https://patch.msgid.link/20260903-mira016-v1-0-af0013ef070d@ideasonboard.com

---
Jacopo Mondi (2):
      dt-bindings: media: i2c: Add Mira016 image sensor
      media: i2c: mira016: Add driver for Mira016

 .../devicetree/bindings/media/i2c/ams,mira016.yaml |   97 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mira016.c                        | 2358 ++++++++++++++++++++
 5 files changed, 2476 insertions(+)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260902-mira016-77eb6b6253d4

Best regards,
--  
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

