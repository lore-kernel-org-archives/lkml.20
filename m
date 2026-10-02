Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA654570D4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930112; cv=pass; b=UExYYWequ3C+LGEGDvUHQBSi0RGKrapmukMe3MYDI5KScZhWI2zgKGlmF3sCMB3FgWM12bx+He0OO2FFSimujM7NmIOgrdT5ayVOewEi0d/KSwSqXkErRKkkClxi0yzQ4dLKvm2VKDVnKbhpcUoqp7bBl5zUZk5R1EeYvpmXqLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930112; c=relaxed/simple;
	bh=DppAKXqfuP6Qm/NxZ7m0YZf/1aabWVG+ScPkVR8a+k4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ldGCfNDHqj3R5a7WrQWsYDuhvArtSaqAeNFVIsLkb+64SB0e2ee4lcy8OmqLnmi5HtloaMUFebFbkFSLVuueFsXzanM0BuHgKdDM1hPHw8H5cuY9pR7RP1V9L6fvHX6EYeWjANOr4QDURIJKgW8cJWxTlzDvtULQ69h2ohrUTmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ2lX+bt; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ2lX+bt"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-8226a912bc9so970607a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930109; cv=none;
        d=google.com; s=arc-20260327;
        b=O0wogp/rgJlmLBhaO5jAUj+Im9PKMgz5uwF1mNdBHJJ1M0tqxAbMIjjDlfb40caz6C
         irSi1L1IDw2TIKwz2ROEF7rDVHI4rebcBhh0X/UpNT28AW55CLr3h6+tyDh7YY3tvKZa
         t/2nXX+pg3vvgf8pjqmO2tPQU6axvlYswOHApa7/lLWH4u2HDJ2Heb3kCNVQoHWyZSrg
         zYe1/Y+zPXZbQSYoPFO9EZq+LgFRg3z31byoPEby+lnSddzxlL8HvzAdBE5FOryxdSGm
         /CARh+qkFsIQgtvR6M0jGRTGBEWz9YkoaOKJyxCVQnuOtXtr3KwRaoo+FpKlILjpzvhg
         JLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        fh=6s94cT/wnGTNHPnQLtnHOB3WyEragb1MiVqvM4zOloA=;
        b=cdAaHBTF3k7M3DnJcz4eH5CudlbOKcTlG8KvHodDjk49BXB+Xf//1mtwiuzrjbGfy1
         Qc66gMOboX8LvXz4BtktlJTFHYlheoSGQxvGrFJh5oNh4JFsmYf3do8WoxF8CHt0L5pF
         AavM7f5T2Abim/y5oSc8HUvsFHvRO8vZULpvQKeTrXuSn7Kx7H/C9zbiFVN34D4hb40P
         hgj4gbUREuNaZrEEL8SkGZtcdbwQ/i8oBwno/7zgyU3JD7b729zpUUa/ycQTcDiGoFOF
         7tdl8I9yTYKlong09GqNTMiRZzZA3Je0emLrVaBUVLYps17fSDCVZc2aHcnkwfHb57N0
         i37g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930109; x=1791534909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        b=rQ2lX+btU/9FAaCHwfidJyHX/fXPjh3Sv2hAHdv04fNib7NbUGWTiXgRXXHHipolDV
         JmVMQn7bbw3mcZhFBtX6PyIp4GYPbk9lry7IDxdezgFQw4uvIUMl9JYIgGUZfhEuLNSI
         aUh4aI559qJMqd8Dx9o5+BNOj582D57uBgAC43BcYm4/oO2sWXomEpH75Qmj3XpJIR5E
         fKlM0/MsKFGBL1663VmeZUtjfngUqRmRmEzJwF8h86/VhZuTN9PIDNiZCVnw+rouNRUX
         DPZsNlpovi7Tzr4a+Z5s1pXSty3wbDweBJdLfrXekqjoxTrkXCT2rLTqXPGwxyXa7kWw
         fHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930109; x=1791534909;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        b=B0tMXoYvY3u1PY0BR/QOUSAFXncKFqn5XqJAZhg4k517EluRxsgs7EASvhYAPMR3jB
         ErM+yAFZ9R9Mi1+9EjbhJui2ANb1vN89BphggftHXWBRnLEcliGnQw+f2UvwtYJHce3s
         nudcYeu0sEGBzesko89ulqtTan/9kW+hSQ3qpwkkDa+yvi0D1vLrYn6DCMJLxorkVRZz
         MppDpmR+g5xq2kEGJ4JreNL7/33bxaNBrd6F0/OEySGA8zq/JGmnELnxfdkoD7Max/yA
         S1bU7UUQi3aZFYY/QhisNtyXT5YMCqcTOEyBVestdrBI8kP0AWQRoC1xKfWJsRf7mGWP
         9DXg==
X-Forwarded-Encrypted: i=1; AKwUvBzpFpT4k/RdprsmBWl4zjJoLEeVnZboO89q3euFAjenLxFjiumaBYsxobnS5rbIuZFTjD7EVAX4oUHeHpI=@vger.kernel.org
X-Gm-Message-State: AFuF++lISPGfL2fjPCT9YWIcFNrQz1y5dzNE9OKkwR4Bdq9aGpqU0+2m
	npLENW+bCNwI7qnyrGRgO0YVE2EudsIM6vOBN+/4m8qzasrsMDOSHhb+e/wJIkWwHPQHmdmtZ6U
	e/e/236YWK8dK2ZRz5ZZy5zVFoVLtfDw=
X-Gm-Gg: AYBFou10gYyOSgjXnRGGsZDsc+Wt9sfZgrLtS6CUS2r9JDuntGU2MYMu3dYiBb7fEo+
	KsFhBeR2YCE7Xyz/i9qbu45aY6NqjG/UeEoe7UEhkWhZHz/rdy28BKQ0ExnUUmA7fwkwcVbSTeQ
	J5zIoEeESS0gT6WVHFU+uTrwaVv5ys2sN2lk9dMHvB0Gjww9kWqhPIxMq45ByyUSA33LvnOZ3/k
	+qlLkU4DOx8QCeB7SNYVobMPCu0/mamLI6T9d7hi+2cOOnmGWaw0vuuerDCW5RPSOib1Chr6aov
	78TleUwRjjRH7JLI2XL70eRD80tnBS+yPeSkNvxAtA14b8krWSB6D7Exwuq94N++yWtYmSVtQTZ
	1//SDVfSDqxL1CHqL/P4PrKjRbsPGfjjjnw==
X-Received: by 2002:a05:6820:80c5:b0:6b7:46fa:1692 with SMTP id
 006d021491bc7-6df3448d782mr1629749eaf.39.1790930109359; Fri, 02 Oct 2026
 01:35:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:07 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Fri, 2 Oct 2026 01:35:07 -0700
X-Gm-Features: AclHuK_lIzkwVUGNC0A466c6EgUohcqWHY2f_jeQHwqYNNU_2ok-f3xdMwKP4tE
Message-ID: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Subject: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
and a WV517S rear-camera lens actuator.

The series adds the missing ACPI and bridge configuration, selects the
OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
capture and adds the sensor controls and actuator driver needed by the
hardware.

Runtime validation used the same functional 15-patch content on the
current media_stage.git master. The final media-committers.git next rebase
and review edits only change source formatting and equivalent frequency
notation:

- W=1 builds and sparse builds of all eight affected objects passed after
  the rebase. The OV8858 object passed both again after the v9 review
  edits.
- A full x86_64 Debian binary package build passed and produced kernel
  7.3.0-rc1-yogabook-media-v8-20261002-001605.
- The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
  8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
  both sensors bound and AtomISP registered two cameras.
- OV8858 digital, red and blue gains were changed during streaming and
  read back correctly. Continuous raw capture produced changing frames
  from both sensors (6/8 unique rear samples and 8/8 unique front
  samples), including front-to-rear-to-front switching without OV8858,
  I2C or CSI errors.
- Both front and rear cameras were also exercised successfully with
  Cheese.
- v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
  40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
  control enumeration, stream-parameter and buffer tests. These failures
  remain a validation limitation; this series does not claim to make the
  staging AtomISP driver fully compliant.

Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
24 MHz paths received build and static-analysis coverage but were not
tested on separate hardware.

---
Changes in v9:

- Express both OV8858 input-clock rates with HZ_PER_KHZ.
- Drop trailing commas from the terminators of all four new OV8858 clock
  register tables.
- Resend the series because the v8 mail transport wrapped patch lines and
  produced patches that do not apply. There are no functional changes from
  v8.

Changes in v8:

- Keep patch 2's commit message focused on the implementation, remove the
  invalid review Link and move runtime results to this cover letter.
- Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
  tables by their input and link frequencies, and remove platform names
  from the sensor driver.
- Explain that V4L2 exposes standard red and blue balance controls but no
  standard green-balance control, so green remains the unity reference.
- Replace the per-sensor link-frequency override with the IPU bridge's
  existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
  288 MHz entry before the generic 360 MHz fallback. This removes the
  associated AtomISP hand-off patch and reduces the series to 15 patches.
- Add the introducing commit to the OV2740 group-hold fix and mark it for
  stable backporting.
- Use the documented Assisted-by tag syntax.
- Keep the padding helper as a normal static function and avoid a
  single-use raw-format descriptor structure.
- Retain Andy's Reviewed-by tags only where the corresponding patches did
  not change materially. In particular, drop the tag from the redesigned
  IPU bridge frequency patch.

v8 (transport-corrupted):
https://lore.kernel.org/linux-media/CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com/
v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/

Maurizio Casciano (15):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and manual white balance
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: select OV2740 frequency by IPU ID
  media: atomisp: derive CSI-2 timing from sensor link frequency
  media: ov2740: release group hold after gain write errors
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 114 +++++++--
 drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
 drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  13 ++
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 14 files changed, 605 insertions(+), 129 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: 4a069a763e8a86821edac4159f7c59a20015631b

With Best Regards,
Maurizio Casciano
-- 
2.53.0
