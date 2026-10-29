Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283521;
	b=Ab0IBEq5Ug1umKPIZjyrgfoItemyrmuR2VJKICbra896MZqdYWkaVltzqzyPj+5Im6lX
	 VSSxmsVKEZUYiESCa5y5GFB+kUxr4sDG24Jcg83tTtNp125IQLw2Wj3TvUc2Dj2llevw8
	 PY9J8F/U5oaSwzSTO6tWRR1qdxyGWeuFZTye075n+oVQatTRQ8z2Q4+UCjKRO4/+AyELt
	 5gTm07NIGVIZ5gCIe5F9ixKf1pCMMhc1lUNrNAxyy9DVUGWSkhzUKZdjlcrDImUGKjiY8
	 r4Yf6K9rifMW9MItLvegrSRfepqniIWe2+SlYBQGDt9ufLc10QGqCx0DgDFmqVeznkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=N3wjlJt8qbpVu6P2VRMZztySpWMPWquf4JAsVzSHd1k=;
	b=hmXUW+K2S/iArx/OCcN+GxCymY+b1u3PVcnqwH7y2bEy1BYIAyp0CNJgj1ZjQxIOLtlR
	 EgHTjwRG/3Zw9NPu5H7wenxYlHezid9jUOHT9pS/eArflne/vtlo16sWWHTFoHKpk6Sad
	 hBvnJ41QWCsjL7VzQKFS6jiX8sG9CrdshPcWd5lpPsm+EYZBuGZIWNWi0Ad80zfiOYRmm
	 afi0NtQUSxV01NJKlgp5XBLIp+ETHkTE23Zxv3i7zPC3gPN6HJ/F2XT4SqqJpG9GCsBir
	 DJHxzwQ/qGSo5/pgomx3p8d17vXirfxaIU0pIpuDiNaMvKn3WUxRa5wD4QQfQihlKWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=TaCm2Rjq;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=TaCm2Rjq
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso17963595e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283519; x=1793888319; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N3wjlJt8qbpVu6P2VRMZztySpWMPWquf4JAsVzSHd1k=;
        b=TaCm2RjqVJfOoi75gmmXcY0oCKkVPSNOq07tsLHwzNzLp6JgcgRXy+4XSQ+Kzg4tKM
         INKVFYPScjb6fmVRXIAQ0Xdwjs9Y5VRAgc/baP/MFS1RaTM7X+9aFrZFMBnpaGr8mWPX
         6gQSN2zMHyplIKNF80A0cBNPOwhekYDOK68oX4p7HM69v9c5Z3GN467wZcNUsmWbtT4E
         dDWmbV172AmdBu0ydBTyBRo8iUp3sXcO7ytQwsBu33T1jc4N1KCf/54c66VBZ47QITtE
         AVohtriIb1jh8aeb1hoVwPGfxKlrnrgge3NiN0eOPc3d5a5oyR9j/Xr15KuavrDIT6i/
         T/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283519; x=1793888319;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N3wjlJt8qbpVu6P2VRMZztySpWMPWquf4JAsVzSHd1k=;
        b=V25aPIXFSHTOeCpC+XUXOKqJctbxg29PPTGsWwPHmDyMIoOYECiFy+f/rSdizNhD6J
         Bl9Z4iSDQrEWxAnQzHuYoI1WLVOg7Syvu/2RaVycY64tmfnVsXPCD8SF/JOCSzfklxWP
         sI8zs+YCxeXj8T9GLzYE/Gp8pq/2yBZmGJ2uVR5/wp+9FIy5PYdH3y3hmTaJOf5VqDAe
         OLi5H3kBnRDHfd+3CbsSJHjos/AxMzTlwiF3ejR7JY3TZo1sW8l4R3WHp0nbaUhWb/v9
         1GT+71T0UAASXwg5aE0ujOr8NDlbPBVgjy17YxHiZ/CRlrf/Z61F5bnF99dKmd2T4gg3
         Kb9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOcj4s7b5rCIZqNi6zveStl0D15XnFxq0nuGALagRZ9ZoFPMpun++r1aURLcV5qqUWnFqJ/kQpYEWQwZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYoBGRWQp9qCz6YOL4tl9s+CAaK1FWtcwujzf++kV4cfR8fACF
	MbZbo9yt7qvMHfZZ2caOSHfdIGPQbbV/OEEkeRqs5g7ytU4/J3SvWsgmxtyomczkWM4=
X-Gm-Gg: AYBFou3CqHr4+l0rZw9T9SSm62rE956xJgpoDFilaUcQQis2xJWJhgsmqjyCrHtr3ti
	fB3UvD1jNQeRXTRwtGzZqEhpxMT06MwlVjJ4370VWXb9we6nWnIQ2WcQKD/diP3jgc9p1r8sYlx
	KVYB15C9IgkGkr6Ym1DB/c7yp1ir+mYBvhtJsPw2vIxxHMP5AlLI+OXlq0dN1WAs8yhVbFvDcb5
	ukAodFv08i1zTwVkhVfEa0ezB6jS54zn5bBOivvcXGmjhzC+BMKYBHDRT6A2AW9dDPvEvg8lwal
	DG1mt7JBs+JbbAkT9Uc+WMTcjzkmR6MfCuehd96QPFS17Wx9Bq7MMTw/tfKOZIGHwj96XDOUUP0
	O4e2l3gHRAoxiQbPjP6+zoaj8ufoWc+JqdfX2kcMSlHAj/2qpwPqaWeigRVQ+DXYihds/GU9pjB
	ibLdXFAciFLMF8/v2a2IH5cCX4wl/HG61qcKPrq9wgMAZVhfS7dBUw9B22kf0y6mgs1JrC+Og5E
	GnYdWZinsfIxyRPpfCfFmm8TNw18Xi99DR5PYebz9sKM/LOu7NPT3ZtkLW1tHqHQmLhSPCHFuck
	M86jHd7S93SdIMPAu/mM8/pQ6Zn00tpRQPij4NZlFwRWR859achMEdGHh6afj4dWFbsFNAiZ4Cp
	TXzxW
X-Received: by 2002:a05:600c:4454:b0:4a1:ce33:1536 with SMTP id 5b1f17b1804b1-4a965cdb7afmr128806195e9.9.1793283518883;
        Thu, 29 Oct 2026 07:18:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v7 00/18] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Thu, 29 Oct 2026 14:18:21 +0000
Message-Id: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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
X-B4-Tracking: v=1; b=H4sIAK1V42oC/23QS2rEMAwG4KsMXtfF1sNOZtV7lC4cW+54MQ/sI
 TAMuXvdQktoshIC/R+SnqpJLdLU8fBUVebSyvXSG/9yUPEULp+iS+q9AgPODIb0WVIJut1D7cO
 gHQeeIhmePKkeOpV2v9bHjzfbXt5/o/w/Oltt9GhlEJIgRPmthnabpNbHrbzG61l9dHCGP8Qai
 xsEOoLOGw+QgE3YR3CNbI6YsSNx5AEdTJyM20dojWzPoY54zjFNZB1m3Ed4jYwbhDsikkdkJB9
 l3EfcCgHYIO77J56QMDPntLPJsixfmJUKbfsBAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has already been accepted into the
kernel.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated. Subsequently I was able to
add IMX585 (8MPix) and IMX832 (1080p).

The Sony datasheets are rather lacking on the limits for HMAX.
They list HMAX (and VMAX) values for nice round framerates at
a number of the supported link frequencies.
These limits have been adopted for IMX662 and IMX832, but for
IMX675 and IMX585 they have been determined empirically by
observing values of HMAX that start to introduce image issues.

Now cleaned up over the RFC V1.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v7:
- Made imx676_variant_def static (Sashiko and Patchwork)
- Added description of imx676 to the list of supported sensors
  at the top of the driver
- Replace "generic" in patch 1 with "common" as there is a
  requirement for customisation per sensor (Sakari).
- Link to v6: https://lore.kernel.org/r/20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com

Changes in v6:
Addressing Sakari's comments:
- Updated CAMERA SENSOR DRIVERS in MAINTAINERS
- Used tabs instead of spaces in register defines
- Added myself to MODULE_AUTHOR
- Added Raspberry Pi Ltd to Copyright header
- Reworded dtbinding description to avoid needing a paragraph
- Removed unneeded parentheses and assignment to ret in link freq
  patch.
Sashiko:
- pm_runtime accounting error.
- REG_INTERFACE_SEL and the mono ID register have moved for IMX585.
  Now parameterised.
Jai:
- Added IMX676 support. Copied from https://lore.kernel.org/linux-media/20261022105623.4179467-2-jai.luthra@ideasonboard.com/
  with minor fixups due to the above changes.
- Link to v5: https://lore.kernel.org/r/20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com

Changes in v5:
Fix Sashiko issues that were present in V3 but it didn't report.
- v4l2_ctrl_new_int_menu failing for LINK_FREQ could avoid
  printing an error.
- Make setting common_regs_written conditional on all cci_write
  calls having succeeded.
- Please note that the checkpatch failure on the first patch is
  a false positive. starvis2_of_match does have the sentinel, but
  it's not shown in this patch as it's being renamed from
  imx678_of_match. I'll report the false positive.
- Link to v4: https://lore.kernel.org/r/20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com

Changes in v4:
- Added Krzysztof's tag
- Made the variant_def structs static (sparse)
- Put the sensor back into standby after identify in case PM is
  disabled (sashiko)
- New patch to enable pm_runtime_autosuspend.
- Not fixed a Sashiko report of potential use-after-free with
  v4l2_subdev_cleanup vs v4l2-ctrl_handler_free. It is a
  pre-existing issue in imx678, and many others are sharing the
  same pattern. There is no immediately obvious solution as the
  active state is sharing the control handler lock, so the
  suggested inversion of operations will use a destroyed mutex.
  https://sashiko.dev/#/message/sashiko-outbox-171674%40kernel.org
- Checkpatch error "missing sentinel in ID array" is a false
  positive, confused by the comment in the middle of the array.
  That comment was pre-existing in imx678.
- Link to v3: https://lore.kernel.org/r/20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com

Changes in v3:
- Sorted compatibles list (Krzysztof)
- Corrected exposure limits for imx585 via parameterization (Jai)
Issues identified by Sashiko-bot
- Fixed the Kconfig for VIDEO_IMX678 still depending on GPIOLIB
- Removed the remnant build rule for imx678.o
- Fixed sending the common registers if CONFIG_PM is disabled.
- Fixed potential NULL deref and lockdep in link freq handling.
- Fixed the duplicated active_area definition for imx585
- Link to v2: https://lore.kernel.org/r/20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com

Changes in v2:
- Switched from an RFC to a patch set.
- Add the dtbinding changes.
- Added IMX832 and IMX585. Tested and fully working on all 5 modules.
- Updated 2 lane handling so that the higher link frequencies achieve
  the maximum frame rates.
- Adds a patch that corrects the minimum exposure time.
- Allow userspace selection of all link frequencies specified via DT
  (makes testing all the link frequency options far easier).
- Link to v1: https://lore.kernel.org/r/20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com

---
Dave Stevenson (17):
      media: imx678: Rework into a common Starvis 2 sensor driver.
      media: sony-starvis2: Reorder link frequencies to remove lookup
      media: sony-starvis2: Always program the sensor in window mode
      media: sony-starvis2: Parameterise the configuration to allow for other models
      media: sony-starvis2: Rework 2 lane support for higher link freqs
      media: sony-starvis2: Allow runtime control of link frequency
      media: sony-starvis2: Correct the exposure range
      media: sony-starvis2: Put module into standby after identify
      media: sony-starvis2: Use pm_runtime_autosuspend
      media: dt-bindings: sony,imx678: Add other Starvis 2 family members
      media: sony-starvis2: Add support for IMX662
      media: sony-starvis2: Add support for IMX675
      media: sony-starvis2: Add support for IMX832
      media: sony-starvis2: Only update bits for window mode
      media: sony-starvis2: Parameterise exposure min and step
      media: sony-starvis2: Parameterise the mono ID register
      media: sony-starvis2: Add support for IMX585

Jai Luthra (1):
      media: sony-starvis2: Add support for IMX676

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   44 +-
 MAINTAINERS                                        |   15 +-
 drivers/media/i2c/Kconfig                          |   19 +-
 drivers/media/i2c/Makefile                         |    2 +-
 drivers/media/i2c/imx678.c                         | 1447 -----------
 drivers/media/i2c/sony-starvis2.c                  | 2568 ++++++++++++++++++++
 6 files changed, 2628 insertions(+), 1467 deletions(-)
---
base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

