Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17DB49F137
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289484; cv=none; b=pETbfJ0TWhBdSsyDkuIpF2os1n52ZgqnWienvvt3OQLdFHuhbZDM8XykBcfvIhXEn5X2lwQbo0iFvDMnbKnTuyiU7G1x2JH5f5yUG5rQPm9CjtP7nDufOsc/SGzH4mQEcfC3Shkh5pMAv9d3sshXYPcQJvhrP13ibNVA3P70/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289484; c=relaxed/simple;
	bh=gzIQy72QBFoZIr/pfo2orqCu1axS9UAIZzvLJ4iyoVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y8ifL+keI38EM2DgZee58eOVvi1uTgYCEpIzyTR5dRpKdgU8xGq8QvDSK0pjuOF7UqSEO+sTK2MN+mDY67wGIvONJB9bJ2mNTEtAN0o83aIsurrgtde9G4AUWrSDhTW6M4yKtRRvTDEUmJ1NHABA4k9bi78AvvnblfhJ4eTZCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyVv56sR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyVv56sR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so1008405e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289481; x=1788894281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9fdaCTkKj4WNIMNGeorqq84Uvidoc3ziXoB8yKwkBTU=;
        b=PyVv56sRU2x7o+6iG0uWTZ5uek1KJcnuwxCBa9pEmnFN5mwi0YK/mz1+XkniFbOEyW
         mWmU5bNcSdAaDj7kCYClh/4EwsqMpfBoKxsBA9kODmdCtsWP4L+X/Lpw9nHFxfAwPt+2
         lX6ondhoYJ6w4QK3c47DiG1u37WRFdG5SAW/HRWrwt1+VaP44AUzmyJU2RBj/+qLsaAb
         OIDVzjUj6TFfPk+LCVZOI8Vtkdjh/VI89ZvWxg2PmiylCweoax3EuPIw/DU1AgIAEq4X
         Nss+4rj8boOtlDJqUVOpjeoTCVpeKtGihRb28iH3/g/J0uWNFnkSMlMUu1iCGknU63dS
         hWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289481; x=1788894281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fdaCTkKj4WNIMNGeorqq84Uvidoc3ziXoB8yKwkBTU=;
        b=mTEpZLl2OYsNmdZ0vrVZ8qHlerHhXQzkTVsrZvvxVnHKs/svhlPWwbIODaAz6BsuSm
         MNA31dMDCxrLkM5Vxi3nfNDimQewhlm3i8VfcYGIgLxeDlYQK7FdD2DcZI1kz/yZkZXA
         DuY4PYAdaNRMgDVmbitffZT6mKdQRRJazLcktK0sgiu7+vU+psCQGJn2AwV5gkpYWXUx
         dYQii/ed6XoLeN3r4VkM2AXf19nAXsYpZwEz8c7vCb3FMOYO0bxU+OUwdDx1XNFzr/qd
         Krb+BuuMnarYnVMdg86yfrMGyZpGC5DQ1G3O421pJAxAnk6HmUZBPsUUPd7faQA+fzgQ
         XGLw==
X-Forwarded-Encrypted: i=1; AHgh+RpBh6WQ6CfY+DOx4fxmztyHgBAbG8KcNFRgEWKqslbxPi0HKIZkgJ92g5NyUWlPRTAo4FSOusfq5XIcyig=@vger.kernel.org
X-Gm-Message-State: AFuF++kbb1LQO3u/nUluOvZXNrobbLYHraa7ZquR040HxV2lnJHhbsb2
	5kA7YlhKvVD0OjIwtUitrIHyza+k3/1flTK7BAq3F2FRYjGcsk9gGySo
X-Gm-Gg: AR+sD12pauaZhK+bgqJO79b9OHOdq9PU/6rcqt6KbAC0hlnN0Sl05D6DNwuMOo8esxg
	EOotf/laFEzOk/g+k6bhVi3Fe+f4hwdsJiUgAkPoK54CwFTE71OT1nQPsOEMZKvHcHAjQLF77g9
	sVVUaNMH1iO5lrnQTR/tYOh3QUpRLfjsFz3DPYCkLi+net9h/XuJx3vW8ZgxNQ+f4twrc+/T6we
	MO33hr04cnCotyXyOu8c++Y86btYEUbZaCUeNc0/Wq9lGateWV6Djg24SG9BGj2u0cw2qYJ5zKc
	e6oZ/MoRKQnX8Pa+tQ3d+ZGH9Qyd/xd3Hb3Mgl7j3b5v5H6uSFI1K+zdmiX5YNyLlzqnfn3BAAt
	5+jRePKFo/GCWXqmy0MMxeXAG6Y7TjuzIT04to0PP+StEKfVuhCUxcYbyG2tEAxbfpVlYNbFBIy
	ahAZehrEuTkM5+89tstJ6VM8pP8Z3PcxAqbZa7+Fv01kmZxt0fXVMEAMjqpJ8ZzraXN0UVRHcJD
	txt2QqtN9bTagu7Gtjovz9xA3KU52HmL+bn3jNwmymx3sGwdVakTA==
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr485874005e9.3.1788289481032;
        Tue, 01 Sep 2026 12:04:41 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:40 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/16] media: Add Yoga Book camera support
Date: Tue,  1 Sep 2026 21:04:22 +0200
Message-ID: <cover.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds the sensor, bridge, AtomISP and lens-actuator support
needed by the front and rear cameras of the Lenovo Yoga Book YB1-X91.

It covers the OV8858 19.2 MHz clock and Cherry Trail gain programming,
OV2740 288 MHz link frequency and manual white balance, firmware IDs and
IPU bridge data, AtomISP raw capture and CSI-2 timing, and the WV517S lens
actuator.

Changes in v6:
- In patch 2, replace the arithmetic MHz expressions with direct Hz
  constants, as requested by Andy Shevchenko.
- Give the supported input clocks distinct names:
  OV8858_XVCLK_FREQ_24MHZ and OV8858_XVCLK_FREQ_19_2MHZ.
- No other code changes from v5.

Validation:
- Strict checkpatch over all 16 patches: no errors or warnings.
- W=1 object build of drivers/media/i2c/ov8858.o.
- Sparse C=2 check of drivers/media/i2c/ov8858.c.
- Front and rear cameras previously validated on the Yoga Book with real
  raw Bayer capture.

Maurizio Casciano (16):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and CHT gain setup
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: allow sensor-specific link frequencies
  media: atomisp: derive CSI-2 timing from sensor link frequency
  media: atomisp: provide Yoga Book OV2740 link frequency
  media: ov2740: release group hold after gain write errors
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 114 +++++++---
 drivers/media/i2c/ov8858.c                    | 166 ++++++++++++--
 drivers/media/i2c/wv517s.c                    | 206 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  80 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  30 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  34 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/ipu-bridge.h                    |   3 +
 15 files changed, 588 insertions(+), 110 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c

With Best Regards,
Maurizio Casciano

-- 
2.53.0
