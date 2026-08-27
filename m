Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEE03D9DB4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872660; cv=none; b=q891glTJWbiSMs6AV9bbL09tmFAq6LxTngHp6bRrYxrbNbzAYjzIb5jYGfi/bTOVd+22DI10xExd1F8uzdVupcOK0DU8WE++I+LEjvmd0EC8Ti70LZjEEGRYUzoCjpH6zxlBlDLiZqiVPGXxwvDriBKgV8HciwlqPh9C3gguv8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872660; c=relaxed/simple;
	bh=MwWzWBjcOKzlFiXSr1ZA1u0vpHVMBe5FpwqFUu5lRpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RKdIpX2IACfMpyWufmN5MclZTgP8TwT5SDcH0FzpRyYf7EeeXJyiClBYv/zFi2jgpReo5F2qs4K4hjtNZYqgVR6HkM5VDV7U/0H5slp3HUsndvzhWSoUlhyYWxEk+592bJPQmocBJ/OvgLGfbzRMKi7wnKGaCDU2i9qSoOgWhGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvevWgP9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvevWgP9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso3447085e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872656; x=1788477456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWY2lHIS8jp7Db/2xhAjtyDU3H6HPVlMDPrbkzWj6L4=;
        b=HvevWgP9InmgIfilVzHjdVTntD7dK5WZ0xxwQAc95Dt2GUkLbzXDmHJsE5gYMVBqy/
         PC/mwwXP1enHC9gULrHJ0aQDmhIDmZdTa3pASPRF8aIefOzOagns5os/540sPxt0pXfZ
         bpmfs1drQeJT5IOUtPIS31SwTYZhpgU1p4U1n0h+wbbQhqoXcp02QnoclX4j+XqwLD+M
         hoYXSLWghXyN12D4cP9LzQGJL3hPGqP2qEPVvT0kVNbg3DUDgVe1zZ1K2Pb28V1AqY6V
         aQPpR3Wl89Fupbwt2PFuWXJnJoPrDLruSSkri2pI3wnUl1+jj7lUlTOdOSQuh03KcJPu
         l5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872656; x=1788477456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWY2lHIS8jp7Db/2xhAjtyDU3H6HPVlMDPrbkzWj6L4=;
        b=swkZF/ET2zLJIEBa3ZzFLtwh8+ztP8+3nvNbR3fMfqqIiy6ncCnuM7OvBGaBTrU+JL
         EHRBqYv9duQyikUpWJ7gtNS7yfSK2GAW33UNdojqj/tfJJaIFmG6JFQfLgAL1T70tJBX
         pHx3yq83IUMMn5CnmNmhEG42n9h/idm/l1XYegqBZ12sDMH/Xo5G0OLjVTVSVK310bN2
         I1qQyDY3LZMEka9Dz6R4D4bnHBoPshA0ieUMnnx0L4h6o0Toykb5XU06LMZolCbRLSkn
         +A/lj1rtsKo4vJdmiM2uZF4KYW04LWcbajk45hvr7ZRgcFwtJyj8DyGYE4wTgHd5nKkg
         CnXA==
X-Forwarded-Encrypted: i=1; AHgh+RoHmqIgpFfek50FwBmj86jzDomEMrNKwBkYJ89yASjU1ZTT9/OCDUHShLwr2zJLO3ZhSti76wdcVZsFJpA=@vger.kernel.org
X-Gm-Message-State: AFuF++kRMlI7jN0iUGicS+jvbYhNsTSPSk122LY6mTI6412o42N8dFJ1
	IizuMahD0Naui/JOqI7ftdm1A0XOFi50ENp0F0tvfX3wVApX4cF8L3U4
X-Gm-Gg: AR+sD12O7g/r9gAATurpmotdMJybfqBfb4S3afm2mhXccdE5skjjRk+LOqhhYcpqqPL
	qp8bNxhrglMQIaHksqzIWz5V5XTQzaZGvQrZCAN9+pAQdoJYhdSyj+mjVuM4/xggldf2mTJyZt4
	I6SxpRrfQmr2eiISiU5bQxnLTFuqk8dabpG+SuX2MWC1ihFWkN131TS7hvd4+X1roBxaSkfBSvO
	gBlQ9jP0I2VYFyNaY8Zn5ACftTRK+s0x8l0bRYlSs7z5riH/I2ezESUitzOQp+FF0ht3Hdaky4t
	NX+s6ad4W8F/4gXbrLXVbS9ZDRoaQVqWmyztGd6+TyiB+ThZapL01eMQHEj2WdhQXF7aGUC+CeX
	m6guTyyL/hekX08kYg6UPSLF03qD/WQZnARY0t7bAYDHj7hKZkqw37yqR6+/QM9BNwPPtQT0z4R
	0+kt7go3BdzJJRJW3rHkOpxu5oh2ul5qPLkHNMMIc2Kgix8YXIpCHQExepyB50jESUABU0uHOeY
	BpT6pmuOozTqWocWG+KDrQXfY4hzoalD7uqkD4JARJw
X-Received: by 2002:a05:600c:3493:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49b91c4792bmr32163815e9.10.1787872656143;
        Thu, 27 Aug 2026 16:17:36 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:35 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 00/12] media: Add Lenovo Yoga Book YB1-X91 camera support
Date: Fri, 28 Aug 2026 01:17:18 +0200
Message-ID: <cover.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L exposes an OV2740 front sensor and an
OV8858 rear sensor through the Cherry Trail AtomISP. Its firmware does
not provide enough information for the existing sensor and IPU bridge
drivers to construct the complete camera links.

Add the ACPI IDs and bridge data, describe both AtomISP camera links,
support the Yoga Book sensor clocks and modes, expose raw Bayer capture,
add per-channel white-balance controls, and add the WV517S rear-camera
lens actuator.

Raw capture is selected through the normal V4L2 raw pixel formats. There
is no module parameter or separate private ABI. Processed formats retain
the existing behavior, while raw formats expose the complete CSI-2
transport frames required by the ISP2401 copy pipeline.

Changes since v2:

- preserve the OV8858 digital-gain explanation and keep separate helpers
  for the existing long-gain and new manual-white-balance paths;
- move OV2740 gain variables next to their first uses and retain the
  three-control cluster requested during review;
- add a preparatory conversion of atomisp_get_padding() and its callers
  to struct v4l2_area, then use that type throughout the raw-capture
  change;
- deduplicate AtomISP padding parsing with gmin_cfg_get_int(), clean up
  declaration ordering and keep sensor configuration comments adjacent;
- use direct WV517S dependency headers, handle inactive Runtime PM before
  acquiring a reference, use a local device pointer and C99 I2C IDs, and
  place the PM operations beside the resume callback; and
- use <linux/acpi.h> for OV8858 because the media CI base used for v2
  does not provide <linux/device-id/acpi.h>; this caused the v2 bisect,
  x86/x86_64 build, smatch and sparse jobs to fail before compilation.

The tablet DSDT contains the sensor objects requested during review:

    Device (CA11)
    {
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_DDN, "OV8858")
    }

    Device (CA01)
    {
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_DDN, "OV2740")
    }

Pahole reports struct ov2740_mode as 64 bytes, exactly one cacheline,
with no holes or padding. Struct ov8858 is 792 bytes, naturally aligned
to 8 bytes, with 4 bytes of tail padding.

All twelve patches pass strict checkpatch. The touched Media objects at
the exact v3 tip pass W=1 and sparse v0.6.5-rc1. A clean 20-job
bindeb-pkg build containing the same functional camera changes completed
successfully.

Runtime testing used a Lenovo Yoga Book YB1-X91L. Both sensors, AtomISP
and WV517S bound, and both cameras worked after suspend and resume.
Captures passed with:

- front raw BG10: 1932x1092, 4472832 bytes;
- rear raw BG10: 3264x2448, 16293888 bytes;
- front processed YU12: 1920x1080; and
- rear processed JPEG: 3248x2432, 1530647 bytes.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (12):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and CHT gain setup
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: atomisp: support the Yoga Book OV2740 link
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 174 ++++++++++++---
 drivers/media/i2c/ov8858.c                    | 167 ++++++++++++--
 drivers/media/i2c/wv517s.c                    | 206 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  71 ++++--
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  17 +-
 .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  67 +++++-
 .../media/atomisp/pci/atomisp_internal.h      |   3 +
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  35 ++-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   9 +
 include/media/ipu-bridge.h                    |   2 +
 16 files changed, 694 insertions(+), 97 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.53.0
