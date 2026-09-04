Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362F3EEAC4;
	Fri,  4 Sep 2026 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518631; cv=none; b=m2pdGDnIxZctlsFQE4lbfcCO7BrsMCx1VuDdYq8bn2oyrb52Q8Q06gZAE7Cjw+0b7I+NEUaJ2zWLFlWQcINtifnRjbPFuHfFhia0lCqe2UfHcSM5SH08OWJi+7+dyIQqiiaNOGFpaAhC/3+aJ3iHKnFIcJao/NrgsEAlt1roeDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518631; c=relaxed/simple;
	bh=dAN6NNpgzU/8FETa7Q6HZyvHJpZ0ItgjEjP128mzAX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p5ZH15kQW5w4MzKTwYc7ZJtkE6jqjyE8F+ZnEX5ztLlDSjMtzmmhuwjwy9ZPg4edNht1JiSeVwhs7HiOi4DIMqbhvmZTAryI3xOyHhDO93TQqLNGOtRwUV5Ehnpyd18KCr6Y0qBz+iOED/tJrCcIa/IsqyOdpd5kUOtTsPKdIRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d/fa56Co; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d/fa56Co"
Received: from [192.168.1.7] (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA3672023;
	Fri,  4 Sep 2026 12:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788518535;
	bh=dAN6NNpgzU/8FETa7Q6HZyvHJpZ0ItgjEjP128mzAX8=;
	h=From:Subject:Date:To:Cc:From;
	b=d/fa56CoHCitg7eodG2b8EXfP3DuMbwnHA0dRPWbtb6cUvmVUedORmYhkndOCuh7I
	 vx9Zr3M4TKdI+9n087Xs4omKB2xRc+UfmNZtjHA8IOML0NC7dbcUnWfco8CrnYx4Lq
	 skjxJdVF4nFbqn4ZUJOK8ti2vxmdtTdXkVhAgt8A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/2] media: i2c: Add driver for Mira016
Date: Fri, 04 Sep 2026 12:43:39 +0200
Message-Id: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2Nyw6CMBBFf4XM2ppp0RJd+R+GRR+DjAnUtEg0p
 P8uxejyJOeeu0CiyJTgXC0QaebEYVxB7SpwvRlvJNivDAqVxhMqMXA0KLVoGrLaanWs/QFW+xG
 p49dWurZfTk97JzeVeTF6TlOI7+1qlsX7Vet/dZYChekQZU0dNugv7MmkMNpgot+7MECbc/4Av
 PmBv7cAAAA=
X-Change-ID: 20260902-mira016-77eb6b6253d4
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5120;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=dAN6NNpgzU/8FETa7Q6HZyvHJpZ0ItgjEjP128mzAX8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqmqDi3eaYr27sJWfVoit9OvIhgHoSdXqyaIDce
 /46yIkE2rGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCapqg4gAKCRByNAaPFqFW
 POr3EAC+hkTxw24qKA5i7Y5HJ4iILNWGZIRYoqPjGut/52i6pOYfP1pDFWDxUqPnkJSSxiJy/+e
 JwQKFYwAAwcokQW0TBCfBrL8VvUbJ+MRgW9Gj8ZJQu0wGmgSQ58Z7h1gRriHTXZ4pyjGmU1l/g+
 5Rj77R38s7i+2thR3udOgjlQ5kaHEt6ddFyDPl5uOeNF804vmfmT1njOqptq5zDiPWu4oi9r/EZ
 1MGunJJSIX6A+4BlXV7Erm+Ansnr4tHFnx33I5NLtTw+/YVunKCyCNJxzAdYQB5luEKaFK+tWpQ
 Huc/eKkCsnWmWYUn4/OvMUUPMdy53shawGhFXKqf4+eF4Yg1EaWTIGkuizTl7WDWVxWgQyJrKSP
 edqpMaQFt5vXbxIRU/9AG9eOYKYivTZDqcJKtqvS5eHDo9nVEMmfAAEy98xg2GpKIEkVuUtTi4C
 HgNtv0T47U+29Q72mLUPsEJVgu9SGmLz/yDj0pMm9csqO3RWXNLtJDxmvz2urVVho20rK7HyX38
 CnET22yzIcK5dklubsc+nir51EJTp7/6VVRpl+AEsYeMrC+4sp+4w4YXpVTNQDLgI6pbi8PjOjc
 5UzskQUgWKkaoGpQPVuFXjwUp3mEwcJFforen59nCdUizbw811TTx6pJKVXY+bR3hSQ8CvfK+8e
 xbGlPgJcXK1w5ew==
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
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1740218

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

 .../devicetree/bindings/media/i2c/ams,mira016.yaml |   95 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mira016.c                        | 2294 ++++++++++++++++++++
 5 files changed, 2410 insertions(+)
---
base-commit: f9536a8065d9eed0d9114878c56ffc4e5a18bdfc
change-id: 20260902-mira016-77eb6b6253d4

Best regards,
--  
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

