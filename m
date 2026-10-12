Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702548D897
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815731; cv=none; b=q3tHvPLCVEkAl2NccXtF71d9xey4c2FyfrcKsAonoYXpfAWwR0Mq2Jgp3EkI7n8uMLwoK2kYoQZiio7q6OOpMaNq2G5F4U+FVXoedMA+dyegf3rAeYmq+Gene95OZAB5xumL8WgQ9Dy31YJk1ZKULFcliig9bMTkgsQdQg3p64I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815731; c=relaxed/simple;
	bh=1sKl84+ZX0RE0clLN2hzi9Lgy8W0Y/335FJwMaJepSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3S0dVhN6w5C1BYlGd3lhoKjCKt3QG4Fmm5DBmMv0ite7skSn1hwJS4UUNE4wQAQ2o9vJn1L5eWtXldkXyQQ16ROn+FaRnGtFOWGNIPlBQhKjpZ+XvjIpNndHmpJ2uyyQuB9ftJJhkuWgqlTy1X3nvE2U7DdYaQyEJAZuhtM10M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmITBXsl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmITBXsl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1369443f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815727; x=1792420527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xc2ZP2Mf8IeBEvBxsIEOfmMfh9NbACnb3aJjvNwqLoE=;
        b=XmITBXslHD6ydAvaDpoh6hkTJcrvKa2K1RwxqesNqOtvthenRARzaWYUXrrr9kjdnG
         wJaD7bq7j64J3TqqncrFx6Kf1yfziOBXJB+5pvmD5XD4kmemv3H8Gjgb6QI2kXSfVQyT
         Vfk0m6zpGCJntpWQLmv//ZSarUyXsxj2JkDPMkdqDPg0hnsu/5IMqw6fdUbKAvY0fuHy
         mFgNkvE3wgxeq8qm/dlYnczNBjpuVewFzWzjsBZyuC4Ib/NW5O1776wI7jpyWnzpwW0f
         NRwIBSJDuLoAxQi7btawo4Xy1WI5ruxCvosKxuO4vY1r1NMOFe7Mw0yOlH0c1gaiZQ/3
         H5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815727; x=1792420527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xc2ZP2Mf8IeBEvBxsIEOfmMfh9NbACnb3aJjvNwqLoE=;
        b=Jlg0xrD5kO3mvD1nhBKNTxb9zB6pKMRBVSqiLw4QgQG5L8D6xZaA+pl4ureouz0zPc
         Z7VfLfNwn31hizVi+mIzMv5idgWNn3/3bCuJcDrMOz4HHExzIJs2o4AFEve51ScIwcm/
         2r4BnOh/8QjkftN+ntwvaYfw0Q75/Ifnkqzv++AB8LSCd9EcX9uN9dZmYsUaca6jRM18
         Gu+dZaC2ta5suhwDMDjebyc5Su8NSKxQKgunlfpPLjdOQH4qyNDKPrPAQe+xBQCY23Nf
         IPQsAgEPabH//4heNWp8zuepSN1Qjo7rF1oUigX+GnTL6FzHYSUOK4B0kPvqTVwEBwvo
         9azA==
X-Forwarded-Encrypted: i=1; AKwUvByUhNO00EiZaz9XjafhtECwUXMCctnJBL6VTn5FzC37VjHeO3vQnjVZ9OBODmQgshqV/uWe6XMLNvMxl60=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIQ8NCWnMu37RWfdfq988KI5f6wG65MQWgcOTmbzF45TISWXe/
	Kf1+Khvc1Ik/G73BMOhvMbnhKpB9kUm00okJ7yKOf6mvvc/LrgwPZmP4/bwY3mHYIMSE/A==
X-Gm-Gg: AYBFou2egGLeEGiwQXRPuvSkU79xe+km3N1xc+xiycRGxB8rxQ3um7LPn31CzklPWWc
	LJxjdDe+Dk0RtEZCcp59XSfWE8OTR2ONG/qAlJPwLhHjC6CvRpsetwpwmHTjQxOkXOrj4WpkJ9x
	zrNxvE8xT++Mo12w1J9EUtHfOXL+0pUfBlCQYTtWNOv6LSfSuqc54Y2YmghwkC+vf2MQmn6J3nJ
	+9q/wW9OtFj+TFUrQf0banYSmqU+gbfJHxeV641+QhkDJRCDCbUCZJxJ3E6Yz2qeSVJuhZMJaoJ
	FSKMSwZC0ObOFnL0MsbBiYdXm+Fp4917mTIRb5KzPqVcblg8aZb46vzdO0yA0T1mwp24AIns69m
	yze4h99r0xhdfbBA7zDTmufKqSFPf2iqX/df+GF6kCeOONZ/W9kdSplGVWzC9AFyzqOfSSzY2c+
	9forb0dBg/HtZOGyUmvHpZZ1gSTL8TyBnMn5kdZ+d2pYPs4N0V/PVM1EtBrkSrk/9KfO9eJ5/9C
	X1nxiGEEo0N+tRk/XClom1qSOANSXwaNm9IpkKAR0XQ/jUmnVnox2aLo12aViT5Zio3PVw3kqX1
	BiZ2r0pRjAuvg5gSLtupCCTSk+pPVJ3beVNrTZVDw//2tHbikN3w3Hq9Zw9W33b4aG6TCFEUSHm
	5QnUeklX77AVDriHzN/QWrK/ragGytlZtcH+nrDUbZeM0dHUVwFuPKalmOGM5Jsmd
X-Received: by 2002:a05:6000:29d5:b0:48b:11d7:f3cf with SMTP id ffacd0b85a97d-48dbad4b747mr11642071f8f.54.1791815726973;
        Mon, 12 Oct 2026 07:35:26 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20899559f8f.9.2026.10.12.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:35:26 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] media: Add GalaxyCore GC5035 and GC8034 sensor drivers
Date: Mon, 12 Oct 2026 16:34:36 +0200
Message-ID: <20261012143443.34897-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009072733.39877-1-nicfio@gmail.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this is v2 of the drivers for the GalaxyCore GC5035 (front camera, 2
lanes) and GC8034 (back camera, 4 lanes) sensors of the Chuwi Hi10 X1
tablet, with IPU6.

Laurent, on v1 you asked to make the drivers configurable, with analog crop
and binning if the sensor supports it.

This version does the following:

- No more mode tables for the geometry: the readout window and the sensor
  output crop are computed from the crop rectangle every time streaming
  starts (patches 1 and 2).
- The crop is set with the CROP selection on the source pad (patches 4 and
  5). Vertically it is an analog crop: the readout window gets smaller and
  the frame gets shorter (the GC5035 at 640x480 runs at up to 106 fps).
  Horizontally it is the sensor internal output crop instead: narrowing
  the readout window horizontally gives black images on the GC5035, and on
  the GC8034 it goes through a column register that gives corrupted images
  at many values.
- 2x2 binning is there on the GC5035 (patches 6 and 7): the 1296x972
  format gives the average of four samples of the same colour, with the
  same field of view as the default crop. The vendor sequence changes the
  PLL, so I measured the link frequency in that mode: 176.3 +/- 0.9 MHz,
  against the 175.2 MHz given by the PLL registers (with the same method,
  at full resolution, 420.7 +/- 1.5 against 422.4). Patch 6 adds this
  frequency to ipu-bridge. On the GC8034 binning only exists in the 2-lane
  vendor sequences; with 4 lanes it breaks the CSI-2 stream, so it isn't
  there.

I kept the crop in patches 4 and 5 and the binning in 6 and 7, separate,
because I saw that for the IMX908 you decided to postpone the crop until
the common raw sensor model
(<20261001133138.GM944070@killaraus.ideasonboard.com>). If you want to do
the same here, patches 1-3 work on their own, at a fixed resolution like
v1, and I'll redo crop and binning on the common model when it lands.

Some choices you may disagree with, and that I'm happy to change:

- set_fmt changes the crop: for userspace that does not set the crop
  first, it centres it on the default crop, as ov01a10 does. And 1296x972
  selects binning and sets the default crop back, unless the crop is
  already 1296x972: libcamera first sets the largest size and then the one
  it wants, and with binning tied to the current crop it never got it. If
  you prefer binning through COMPOSE, or waiting for the common model,
  I'll change it.
- In binning the timings are in sensor lines (the sensor reads one row of
  the array per line and outputs one every two lines): exposure and VBLANK
  keep the register unit, with a one line step, and the frame period
  computed from HBLANK and VBLANK is the measured one. This is why
  PIXEL_RATE is 70.08 MHz, HBLANK 164 and VBLANK at least 1024.
- enum_frame_size lists 1296x972 separately, although it is within the
  full mode range, so that libcamera sees the binned mode.
- The GC8034 PIXEL_RATE (256 MHz) is the one that gives the measured frame
  periods with the sensor line length; it is more than the 4-lane link
  carries (215 Mpixel/s), but over a whole line, blanking included, the
  average is about 196 Mpixel/s.
- The analogue gain is the index of the sensor gain steps, which are not
  linear, as in the vendor code.

I don't have the datasheets: I measured the geometry, the limits and the
timings on the tablet, and the comments in the code say what is measured.
In short:

- The sizes reported as NATIVE_SIZE and CROP_BOUNDS (2608x1964 and
  3282x2500) are the largest area that gives image data; around it there
  are constant rows and columns. They are not the physical array, which is
  not documented.
- CROP_DEFAULT is the image of the vendor sequence, the same as v1: at the
  default crop v2 produces the same image as v1.
- The timings follow a model that matches the measurements from 64 lines
  to the full height; for the GC8034 this corrected PIXEL_RATE to 256 MHz
  (v1 declared 255.9 MHz).
- The size limits (GC8034 at least 512 and at most 3280 wide, at most 2448
  high; GC5035 at least 64x64) come from tests where outside those limits
  the stream breaks or the timings leave the model.

The series is based on media next (d7e7bca71). I tested it on the
tablet, with a 7.3-rc1 kernel and the modules built from these patches:
- v4l2-compliance from git (1616bf9e3c81) with -z: 54/54, no warnings, on
  both, and on the GC5035 both at full resolution and in binning; full
  output below.
- A set of crop tests (default, bounds, centre, corners, minimum, requests
  to be rounded or outside the area): rectangle applied, measured frame
  period, complete frames and position to the pixel, all as expected, in
  two runs per sensor.
- Binning: controls, frame period (also with a long VBLANK and at the
  maximum exposure), signal doubling with double exposure, output equal to
  the per-colour 2x2 average of a full resolution frame with no offset, 20
  starts and stops in a row, and switching from the full mode to binning.
- libcamera (simple pipeline): 60 frames out of 60 in three
  configurations per camera; on the GC5035 at 1280x960 it picks binning.
- W=1, sparse, smatch, checkpatch --strict and coccinelle clean on every
  patch; i386 build clean.

Changes since v1:
- Patches 1 and 2: geometry removed from the register table and computed
  from the crop, all written as 16-bit values; NATIVE_SIZE and CROP_BOUNDS
  are the measured area instead of the vendor readout window; the default
  exposure no longer exceeds the maximum when VBLANK is reduced; GC8034:
  PIXEL_RATE set to 256 MHz and the blanking register computed from
  VBLANK; dropped linux/mod_devicetable.h and used a designated
  initializer in the ACPI table, as Uwe asked.
- Added Dan's Reviewed-by to patch 3.
- Patches 4, 5, 6 and 7: new.

I used a frontier LLM (Claude) to write the code and to do the
measurements; I stated it in the Assisted-by tags. The English of this
letter is a translation from my Italian.

Nicola

v4l2-compliance (git 1616bf9e3c81, -z PCI:0000:00:05.0 -u <subdev>):

GC5035 (2592x1944):

v4l2-compliance 1.33.0-5515, 64 bits, 64-bit time_t
v4l2-compliance SHA: 1616bf9e3c81 2026-10-06 07:30:20

Compliance test for intel-ipu6 device /dev/v4l-subdev4:

Driver Info:
	Driver version   : 7.3.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : intel-ipu6
	Model            : ipu6
	Serial           : 
	Bus info         : PCI:0000:00:05.0
	Media version    : 7.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.3.0
Interface Info:
	ID               : 0x030001fd
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x000001f9 (505)
	Name             : gc5035 2-003f
	Function         : Camera Sensor
	Pad 0x010001fa   : 0: Source
	  Link 0x020001fb: to remote pad 0x1000096 of entity 'Intel IPU6 CSI2 2' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev4 open: OK
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

Sub-Device ioctls (Source Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 13 Private Controls: 0

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

Total for intel-ipu6 device /dev/v4l-subdev4: 54, Succeeded: 54, Failed: 0, Warnings: 0

GC5035 in binning (1296x972), same output except:

Total for intel-ipu6 device /dev/v4l-subdev4: 54, Succeeded: 54, Failed: 0, Warnings: 0

GC8034:

v4l2-compliance 1.33.0-5515, 64 bits, 64-bit time_t
v4l2-compliance SHA: 1616bf9e3c81 2026-10-06 07:30:20

Compliance test for intel-ipu6 device /dev/v4l-subdev5:

Driver Info:
	Driver version   : 7.3.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : intel-ipu6
	Model            : ipu6
	Serial           : 
	Bus info         : PCI:0000:00:05.0
	Media version    : 7.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.3.0
Interface Info:
	ID               : 0x03000203
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x000001ff (511)
	Name             : gc8034 1-0037
	Function         : Camera Sensor
	Pad 0x01000200   : 0: Source
	  Link 0x02000201: to remote pad 0x100008c of entity 'Intel IPU6 CSI2 1' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev5 open: OK
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

Sub-Device ioctls (Source Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 12 Private Controls: 0

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

Total for intel-ipu6 device /dev/v4l-subdev5: 54, Succeeded: 54, Failed: 0, Warnings: 0


Nicola Fiorillo (7):
  media: i2c: Add GC5035 image sensor driver
  media: i2c: Add GC8034 image sensor driver
  media: ipu-bridge: Add GalaxyCore GC5035 and GC8034
  media: i2c: gc5035: Add crop support
  media: i2c: gc8034: Add crop support
  media: ipu-bridge: Add the GC5035 binning link frequency
  media: i2c: gc5035: Add 2x2 binning support

 MAINTAINERS                          |   12 +
 drivers/media/i2c/Kconfig            |   20 +
 drivers/media/i2c/Makefile           |    2 +
 drivers/media/i2c/gc5035.c           | 1351 ++++++++++++++++++++++++++
 drivers/media/i2c/gc8034.c           | 1175 ++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |    4 +
 6 files changed, 2564 insertions(+)
 create mode 100644 drivers/media/i2c/gc5035.c
 create mode 100644 drivers/media/i2c/gc8034.c


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.47.3

