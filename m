Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62D6494820;
	Thu,  3 Sep 2026 12:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437785; cv=none; b=a1UGEqR1BhdScHiCHKCm1eOjURWCeGBZimCJ8iX2y9qqkwJVRmPMLSJH2uZdKGMFxKUHESwcr0VT6v0Fyk/5dIctADphUoYPH/WRJs2cPSpger+FGfy+CgTlk5YPN+sztN6OgLwBgbOPumP052kavaO6x1B6tbBaZ4ax18e+6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437785; c=relaxed/simple;
	bh=ZnWGRdoov2p+GMwEa54HmIGn/t+1qISHykifaX6awF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UeC3bVPVginOLulDVG8UmfD3xAEkWfeJfRosB3bdHerk+GqQd1bc8JUQFmXHQSC96scsTzlShCuSrvxUGQ13nLhKHSVKNkjuyU3aRK+Vp4Wz/Yfmc3JJX2d7MI23AzVq01rBE9oGvGitMQIB39RWcojNFVY2v8RgHfwmOU4dHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=huSzXUMT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="huSzXUMT"
Received: from [192.168.1.7] (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AA0C2335;
	Thu,  3 Sep 2026 14:14:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788437689;
	bh=ZnWGRdoov2p+GMwEa54HmIGn/t+1qISHykifaX6awF8=;
	h=From:Subject:Date:To:Cc:From;
	b=huSzXUMT4txwNF7CS1V4AJInj6jvJGbZegHzhzLwQFHgaw8ggJradwSq+lJ2bFhTy
	 hD3REBOztVrLs6z2ZgT7WMHXIZH0PDFqLYzxprEkz5fAoGyy9Z4rhv6BX1WT7aK4s1
	 mJem4ZcwZM+GkZmvxKQIpt4jyL5AjkWcN0z6MRnQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/2] media: i2c: Add driver for Mira016
Date: Thu, 03 Sep 2026 14:16:08 +0200
Message-Id: <20260903-mira016-v1-0-af0013ef070d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubbaholXkYttDo4y2pCSdzdc/
 ur/fRcE9IQB6uQCjwcFWlyESBOwo3YDMuqiQXKpeMUlm8lrLhQrSzTKKFlkXQ6xXj32dH5PTfs
 77GZCu71zuO8HfWFdemsAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4208;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=ZnWGRdoov2p+GMwEa54HmIGn/t+1qISHykifaX6awF8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqmWUUCi4KRmkSRCRsAcJ7h/dTDGPYlR5u3s35N
 VM5hyhmPW2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCapllFAAKCRByNAaPFqFW
 PP0/EACLkGdbd41ckxioKlgY7LuTsby2LyhnDxaF8oAIwJyV/zFZToeZUT5LjrmUqXFAznyBWuF
 Ot8T3IJrbl61vyA7Rcmq8HN1XNn3dDeph7hOxmNhg9wA5tx7r0umvHNow7s7L9XFMU1PpCDqER1
 WbKdOpRc2TMt4Y/h8y/9e3VdZQ/tsnL3ak9wftp7taWP0UddSZsPkCU4lINaXHavSf+DpNMZR+L
 WnJovV0sGSDTRo+MjrN2Fi6dRlVC5TzpKmdfTneELTVz52g1XCN7vzRQhkevHc1jAsBeE08J9fE
 IdQH+HvQ4GdFZd95Replzxxxmu7qn/F9JslqRHtq7iW4kEACC57kbExycAigz4ihpnClzuIC4RO
 cNgZL39fuA3LbvSm/XLqhIPkHTgdwC5uRpZB/FNcIFkZ6XBO+kNqe1syvlF1gpouFnBxVgqjnJ/
 jihAU79FtVVqR5+UfQux7mf5McPgJCfZEIxcNhN8OPQMmceRGeXkp+n9ZyL4cQJNw9rh1uFJjJy
 rjiDXVkToDBsv4wvTjZD/flP7EVgW0GwW89Fsrb5FdduXWR0aL3l6iVrIvuDWmzNl9krBAJWV+W
 pq6ZulQc/YHhh4sap3yng6e9NOaL6xjdLQ3n+PTM7Ifl4e3fRWkZRYLlLrPSYMGN28/xr5HOZpu
 g+mw6GQoynNZMfA==
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
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1739488

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
Jacopo Mondi (2):
      dt-bindings: media: i2c: Add Mira016 image sensor
      media: i2c: mira016: Add driver for Mira016

 .../devicetree/bindings/media/i2c/ams,mira016.yaml |   95 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mira016.c                        | 2284 ++++++++++++++++++++
 5 files changed, 2400 insertions(+)
---
base-commit: 0cf9df256e97bb6ea1e936a7399be1675c7f564a
change-id: 20260902-mira016-77eb6b6253d4

Best regards,
--  
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

