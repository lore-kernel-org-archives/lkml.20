Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657768;
	b=0O+EBLE/xVgvAuRD21LhvSHGArpUppuGWfVSTGY0dMYIMlJf9c5SrDz/yo1+TF024FfG
	 wIZD0fO/+5jIaBN672W3tqVp7JpP3gcIOEqgRygpNxImBRXBe7L90bDH6BxB0/q5aDF08
	 OzwuWvU7cN1cLCc5c/Rsg58FDE+lPFIjNWc/KB+HViq1aTbUjeOZiRA0LRPPhvtSNkjWO
	 z6PB/iYSJzm5Kl5VTFqEH0BJT0xYnH23aDYf5rNqE6Ez8JPXV499+Eqd6ip+bn+OFUq4f
	 8NDugCCWrhKc/8kgGSWeGtMD4qgKPiv7ljAWiZZhrraVhqZl7awC550o6qPgXR8JWQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657768;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XRy6xJ0NdD2JWEsRVlTK9uif1XbyICzf3XzOhhtbR8s=;
	b=IQYuSmG+L8VUiNI11wJU4utJBjnMl/3NwjhF+SUDBO5OAndvHAPR96xFcW9osuB7Ah+W
	 2jVCl9IyuSkuBGl+IfrsEWYXnEsJINv87FgQB70JTF6HRaFbtC42Bxa9+OAmiJYkbzsab
	 WIirjZ8tl+LNHMzyfyMKAro+e7leL7fIeJ3/LREz7DTL8xEgVGhiH3qOgD/3WN02ePwsG
	 7jYzrotE1Se32DIVALPX/OIoKBTHgcgKoIYpS8ZRXuqM9k9vRYgdcvmrmtdfkI48RmS1y
	 jvgGvYzVzWgwPlpzvSUDa+IySL2the4F4Q1MyNIhDLQ1CIrMtHeG7DnZzY2vjWlOcZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ZDbV4aZV;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA2606A31B;
	Thu, 22 Oct 2026 08:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FA2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ZDbV4aZV
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7BE4802;
	Thu, 22 Oct 2026 10:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792657635;
	bh=mtcrneZGr1j13dZP412s4dcb/2T1YvG7UCDcvMhhrmM=;
	h=From:Subject:Date:To:Cc:From;
	b=ZDbV4aZVrUuFHIW7t4hBGA2lGsjftHDmtR4Ue18XLCagT2ZG2NP9/zpvdWyDbGxtY
	 cnQsgEw1Lix74/WEKGrWdHSXAne4rAH524JCd1W4Y514auSg0QCuwJjGhggnC2IBpD
	 qE5ZoAolzXBXeaJyWj6/z/Z1CaPmkKYP9lPpYwXA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v8 0/2] media: i2c: Add driver for Mira016
Date: Thu, 22 Oct 2026 10:29:07 +0200
Message-Id: <20261022-mira016-v8-0-a7adc039e938@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XRy07DMBAF0F+pvCZo/BybFf9RsfAr1EhNkF2io
 ir/jl1EkwVejnTPvZZ8IyXmFAt5OdxIjksqaZ7qoZ8OxJ/s9B6HFOpNGDAFBthwTtkCVQNidMo
 pJnkQpKY/cxzT9d50fPu9y5f7iP7SeEucUrnM+fs+tdCW+2vlj9aFDjDYEYDyOAJCeE0h2jJPb
 rY5PPv5TFr5wvZcbJxVToMf0XGrAWOH8z3HjfPKHaC2Cg0PSna42HO9cdHWjQQJwlNOfYfLHee
 wcVm5MMZyYZ1mIDpcPTgFKjeu2nr9Fj8GFbjEDscOx8o1097Uh0sp4R++rusP8kEHeTECAAA=
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Tarang Raval <tarang.raval@siliconsignals.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6990;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=mtcrneZGr1j13dZP412s4dcb/2T1YvG7UCDcvMhhrmM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBq2clgv0d8fuxq7uYvmkQDwsrcdiUZW+wX/mZbu
 utAMTvIxmSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCatnJYAAKCRByNAaPFqFW
 PLksD/9KLitvqoGKk68zlltFZi4KjNX6WJWoQCgGF8diVZGmI/aIAOrQoFp22pxjsgzVpCbdPe8
 92yf0aH/FO8yznx5kC4/Uu2ynvCTxJwCmbRETbShowvd+SAwbFd2yT9+ePOp/pw+QO6x0yJQT+1
 LBVRcDd2IPCZ4M8vvdT4YjrWYTY79iCBns4Wr2HA83usErKbvDRVSSHtPL3xZwi2HTY4tNIyxYO
 IB0Wht0aFei7HXsMggUXSifz+6MAdoALtUBmICXAHtIu/xYQ1AfdhcNA8/zg3NQdV4BAEe7Y+Pv
 slyiGV1Fl76soDePeBqY5A7O31ZxifmlshOgJ/Y3vjLRt0/eJnMn5ji97czXjdVUfXmT4AoqRRu
 5tD4zQCXXPbCm29/5+bjwdLqulgrlcbZ1WmYED9SuwYuD7KyH9rXHW2gef+WcKXTUniP/yxS0mi
 /b5Tebs73Ly6eQQrSA3okn7zPFp98eA3KlUjUT01ePjyPA8n6Sa3aePRVPvG5aEXQkmp+SLDgmQ
 BwxVmCqVxf4S1JY0c/Ru+GqTK1izYj8yA0E3jkBJrleRCETVNug40DjPMlCi5QiBiJvZFOMpwb7
 A54XvmB/LfiancID122kiTZArmzkIboC7dhYA6fKu0pA7yiXqbrbxontkHTrtRxLEWhB1qfSiL8
 6i4TMgrT0cZXHcQ==
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
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1773224

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
Changes in v8:
- Adjust min exposure on format change
- Collect Tarang's tag
- Link to v7: https://patch.msgid.link/20261015-mira016-v7-0-828c931c5550@ideasonboard.com

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
 drivers/media/i2c/mira016.c                        | 2361 ++++++++++++++++++++
 5 files changed, 2479 insertions(+)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260902-mira016-77eb6b6253d4

Best regards,
--  
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

