Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042E4A482D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360832; cv=none; b=fZ6qI3qQbW2zdI5N46JkaMFFK8NDivKehVBGm7R8KYGvqpsbAUBvKRJ7hhjmHDb143tmhmNIbxbLk5uTm7hJxUssLBzAoyKn+sR6cZSCNqT3F53/WLTztRXfhmlLrD4RScTX8khl+7AtOFUerZJB4rleFcLtG0gpaJTAnaUKK7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360832; c=relaxed/simple;
	bh=7aq1sDRDPQUFupWUr1nlyLSACWSikoHJdpRyCXGb55Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3/kn4dHlP98HdHO4P5Duse68UOd5Lf1dBeMpwnhmZ8bVKBdsorkAaqYSfNPke1TkcjguNpsDbJPCln2p2QL4MCbCghr6uuyqa49W8Ukjj2R8nUd9MAQF27mDPPN/2PslTJoynxZKR4WS70wkMLBYymTUaf0DD709jzCNFLERbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+hC7slT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+hC7slT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482ea739de2so677642f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360829; x=1788965629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMHga1JqjOupCY+rN4sQgdUrEVoLNE3H9BbYfFY0Qi0=;
        b=g+hC7slTss5u2+hdxjBPJGvTAk2+t2zteqzAckB7ps8gA4IxUeUVi9jlM+BxJK3UgT
         AM/xGiMTc7CDkeu61CiGFvqas1GQgHrptUShPTTdmjayDhkJD+tJEIrZxMR0Kp9Mtizr
         APMbN6dC/QbXNpts1gkQKeOFlE+NkzZABMe6HfX+EdFLrFt1krseGgFt7Z+SUWUgRgZZ
         OLyrAXOEcYsDwAqcEupFBwhlxYKN5PM/YZkCafTIo7+bZhtdgXuyZV3HCvEkAgg1Ttsd
         /96YcT9fmFmpc3yKFp3OpWrk9Lzflkz9VzBraEoYm6bO7s5ZCts+lHm9Qmf5+HlcfTjR
         uBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360829; x=1788965629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMHga1JqjOupCY+rN4sQgdUrEVoLNE3H9BbYfFY0Qi0=;
        b=ODjfocPjaitD6kzmgWl5nVEWcbVm0TnK9JlT8PTlzXhpHJF6W6pU6rnWyfR3VV/Sp9
         J/NYk2fPTXGfHNrHXwVVskYokw5hg16I1lSM0zjmEMWeSHA/gEq+TvzRZkuvgyLM2Cry
         C0t0sb7JlHGIOtLCjhwXzPvR8z7F8EveuurkvgZ2q0V/YY/4wAs7UuvtJxhfFVucWI7T
         JUOZo3mVxSgmKD8LU9TeKbwRmfxUxVfowBPJFLu5+On6mbEeVM4oB197kqhngKA/D+WC
         Houq4ipqRWkMBj8JuFGbU2nQgtkfvmbpciyV9FyiFb6j9SBkb09byktpbj5qm8xuLIVg
         JI/A==
X-Forwarded-Encrypted: i=1; AKwUvByvOcak1Mkr3BPnMBa8aTQcGXwRfivwwLh4Pxjvqebw84yY/vvYJ2Njp1LMW38MlSAmbBXLIetm2POOwaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kY/naQg4ggDOj+YfWOlF7QZAmLXEKufVoag5C8w2LWbIieuwy9
	6M8XrslL6sbzZyMqoUq7RmoaPRTPjBtjBjwm4Gnt0XW9pjZCu8fgQwG0
X-Gm-Gg: AYBFou3VzlA5tyCkiUINK6LQii4CE1Z2mcWXEJ5gaR9Q+nkh30+JiW9QmGb63pdT0yp
	V+WU4LGaNL94MnEmNqZbQgfjod1dupRGCDflWCaUZZobeUGPtWYYhRDs/DPvJbH44OVwA1IC/3T
	4eDBuSXYI2zekQsO8dWdd9zpO5f3qG4CqA5KUa/pzn87BPjzANfUZdHoDnzdZcaxVMXP5YRmYkx
	5NWDYnvAzcRTFIVgFeh08nYSxHgwrzCMzTH6YON6RbiN49LDZxwNjXOdRy/rSjjb48tKyseP6Ar
	s8arStH/exskCiHlIcrzzrfgeuoa/yE9fkAL7Grn7KYOHarQIGKIT+mrenpPjHtsnXTmMXQwM3S
	fofa64dKDPukP9D8LnkAtERU5gd5KK45lnBbeQbe5JSPt3s7Da0QLbYeSxNUNG6yYn0a6U+KL+m
	o/mat3RhRAQ1foRgdjXuZg6qqw7tveQTv03Wm10wrR9+jThXYv7v27x5996lokieb3UJk/LiZvP
	69F6GwTfLb4WBCDL50h1CmYbhhjKpZQx1dwXKYz/aUP
X-Received: by 2002:a05:6000:2589:b0:484:36c8:ffb9 with SMTP id ffacd0b85a97d-48488ded10dmr10941341f8f.4.1788360828544;
        Wed, 02 Sep 2026 07:53:48 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/16] media: Add Yoga Book camera support
Date: Wed,  2 Sep 2026 16:53:29 +0200
Message-ID: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

Changes in v7:
- In patch 2, keep digital gain independent of the external clock and
  expose the manual red and blue gains as separate controls, as requested
  by Sakari Ailus. Keep green at unity and accumulate register-write
  errors across the three manual white-balance channels.
- Move the 24 MHz PLL and global timing registers out of the common mode
  tables into revision- and lane-specific arrays. Select both 19.2 MHz and
  24 MHz clock programming explicitly when starting a stream.
- Clarify the patch 2 assistance disclosure as
  `Assisted-by: LLM [Codex] [Sparse]`.
- No changes to patches 1 and 3 through 16.

Validation:
- Strict checkpatch over all 16 patches: no errors or warnings.
- W=1 object build of drivers/media/i2c/ov8858.o.
- Sparse C=2 check of drivers/media/i2c/ov8858.c.
- OV8858 R2A, four CSI-2 lanes and 19.2 MHz input on the Yoga Book:
  digital gain and the red and blue balance controls were changed
  independently during active streaming.
- Three complete real raw Bayer frames captured from each camera:
  OV2740 BA10 1932x1092 and OV8858 BG10 1632x1224.
- Front and rear camera streaming validated in Cheese.

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
 drivers/media/i2c/ov2740.c                    | 114 +++++++--
 drivers/media/i2c/ov8858.c                    | 220 ++++++++++++++----
 drivers/media/i2c/wv517s.c                    | 206 ++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  80 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  30 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  34 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/ipu-bridge.h                    |   3 +
 15 files changed, 617 insertions(+), 135 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c

-- 
2.53.0
