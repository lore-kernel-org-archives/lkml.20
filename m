Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FDE493D29;
	Thu, 15 Oct 2026 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060597; cv=none; b=l+djgEfL7JIE9Jf67zaDluncIG+SvAkp/BMEa8LSRPT+mTWENIlsqQ/hilWSiBSd0SfIbSWxhb4o16QJ0o/xLePkghd4uDpj4TVJsoT9BmTSagP8+7UJug0Hz4uQ8HWmxoBW0vhRcaXBFa6PqsE3I6EpLGXEMTY8VELmgBZID0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060597; c=relaxed/simple;
	bh=8EEbvGLS4deyLwnVmUGcNrh5O+wvXEd46ADBkzSteqg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Klddpn12X4hUwYWuQtooioCmFSym/nM8O43ZeGQM/6dHK2vhx17jp9SJTKquuqJsQOtGvw4tN+0puKRy/JxH1VizMcXb02arozCPETDybqHvnEPYCK899B/N0dxPcYWUGzSL56aJNxHxNzMrpfWqM7GrevsRGwttVZdAgw5LrCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pu7W9TXo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pu7W9TXo"
Received: from [192.168.1.7] (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37AFD2F8;
	Thu, 15 Oct 2026 12:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792060469;
	bh=8EEbvGLS4deyLwnVmUGcNrh5O+wvXEd46ADBkzSteqg=;
	h=From:Subject:Date:To:Cc:From;
	b=Pu7W9TXoTy17qF3qrbs0A9YSVeptndSaPxv7pQLQbCqJgTgYWHKmE1kBZfhGUMs6J
	 lJP7/rIxhiHNqjCK4L9zUTHUyKJQr4eaCzwSKxWjrnSBLq5JVPwoL+uqa1DzyBA3XS
	 4MOdFtXcG8SQnpzwX1YI3vdynpyw9ZkTaK1L7JQY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v6 0/2] media: i2c: Add driver for Mira016
Date: Thu, 15 Oct 2026 12:36:22 +0200
Message-Id: <20261015-mira016-v6-0-177ecfd6d357@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNy07DMBQE0F+pvMbo2tePmBX/gbrwK9RIjSu7R
 EVV/h27CJIFWY40Z+ZOaiwpVvJyuJMS51RTnlpQTwfiT3Z6jzSFlgkHrsAAp+dULDBFtY5OOcU
 lBkFa+1LimG6PpbfjT66f7iP6a+e9cUr1msvX42pmvfe7in+rM6NA7QjAMI6gIbymEG3Nk8u2h
 Gefz6SPz3zLxcp54yz4UTu0A+i4w3HL9cqxcQd6sEobDErucLHlw8pFfzcSJAjPkPkdLjccYeW
 ycWGMRWHdwEH8w5dl+QarO7ztswEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6656;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=8EEbvGLS4deyLwnVmUGcNrh5O+wvXEd46ADBkzSteqg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBq0KyvGrVtrxel4zEJ34zy0xvIkMvj+sS/T9gff
 skK53YEOTiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCatCsrwAKCRByNAaPFqFW
 PJ+JD/9nwm71naeGKVFXgG2N3BfetS8D9viWzsMwXibS6REPTTeGG6MJckxkkY680CiJJAIJ+Iy
 3EMGDkLBat0Il8JDoOOZKSs7z7wDPVltV1h61sLbjbeNKBgyPmgb0qa0VYXA4U3WC3MhQs0XnUo
 x5ZuSQpPEdepX4xF8KHo8zYShx/QIWDx9W4jqpnK2QqJ5ZDEl0ZuuWMonOSA+knZ7ccZwhNEg4V
 4WoyOayrproUUFb6ZSRVPV8okNuHUx/DU+cHKC4Vv1zebGTUhXpbtquMnkRTtt8+knY876DDCrp
 ISWd4QGMNXA/kxxzjXAiyWkhCUmB07qpu/uepbKE6gVRoKgxEVRshWbIBRy/oDoq4Ppb7u3VcyC
 Og7SvbNCZDgOJIHrdRkHjBw2HBwRhZ0k7WAANUKADZNsSoN8KwAORjPHW8cbz/2hnGyHLh4Dbnj
 v+7oWePIkPdv3aAKlp1BucK/TeRjiNqMC1NbAHB/y+q7UKFw07If7OjiMKrmj4eP7Bs7SzTdPMU
 O3XTrQaMdz0U+XWsI06pTYrpKiy3bBDwpLh5/mfYBR+L5z5ydiA4o1aOmJoC54xrW82IWXEwgm7
 9hAErfosjIhHb4OE+kuvwsgFCohoPcxkF8EGBXXDJRQn10uMy0zcNBOqt7feJrBBy7FVYP1lstq
 1rXbAsD836CF4LQ==
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
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1756788

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
 drivers/media/i2c/mira016.c                        | 2357 ++++++++++++++++++++
 5 files changed, 2475 insertions(+)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260902-mira016-77eb6b6253d4

Best regards,
--  
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

