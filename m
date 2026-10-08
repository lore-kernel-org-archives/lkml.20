Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5C3BB12B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433595; cv=none; b=Rzk70vAMiFC1gaqaHHFAIi2wnj51KS5ixJLhV4MRh2SPTUcj2GUxWTD/fOwzF1jG3TzDA+fOX3z+i3haBL9Tpr1yx1n1dwd4i05xGVQX2OxLu3LE7r5woBgLywDaQkqSVVPHjLaqty9EIQ9Mj/D+vkj8HD0itFeUvp7nBdPF5Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433595; c=relaxed/simple;
	bh=sTkhMB4ltA06ts72EckE27NBb7N2OJMZY7wxccFNX5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KD5Dg5d3vNKUAGiVCNw0TZITGHrRu3pYtfh0CLLGQ/YL9FkNtowWB+sGtDtimq9sWHm4PJEGMgoCQrHF6BmMxq8s4lKJA6bbEJp+Fc7UF0K8UMBAmKIZ+Kz4x5lgonRZD1x9VrpIriuxtYJ4b7fbf0BK5U0CZvi0JqN1BnbBpbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=er4tmnVC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="er4tmnVC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so21985315e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791433592; x=1792038392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YGiFzBBeYAOCwBETNLtR3b0UnfyVIA3OqQtNHYKVhsk=;
        b=er4tmnVCG7Rckkw6xtfTLzRHHVc5m0tT+zOPWmMaDT+mTI20TFm66zih6WcebbhXKc
         feDi3tB+DpWAxnP7Cdbn+LA0A9aQ4/Iiu77+SOwoerSvflEo5IGREhfgn2PzPbQghukx
         2bbGGyCXPefPBNgmfOaOUCV8bUxjLTkPX1EeAwoE0xz7OXqB6Qa+Vo+Z3csbgo7bKkmd
         auPAcFn1+6ulft7cMhk+CEFj9FKY+cP+wRXwu4zCv1CPE5q+IWFOkzj56vqi0YP16qHu
         Txkf6UMt7N00X36zw/NJW2Hfr0IWAIKruBAQYpdUfgoVtXYPMdI7F5Kd4vMUkVJGuaZl
         4UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791433592; x=1792038392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGiFzBBeYAOCwBETNLtR3b0UnfyVIA3OqQtNHYKVhsk=;
        b=uAP5QzjYuDRErfK7W+7o5R55AGdeG/q35cmUGTeYsUXaI7UFOuKtwCR/N87ZYAzbhG
         F9BCm5QW47s6wdqqFrXOYTbeeEtXazHLbwb8UZOkvBYHZFhsG2nGU9/rGfJA2hc0sBtF
         rppp/XPOqhso2lL7P4NXeKx+7BSrt0lk/C6kbfKFsVo1r1mwgVwhOhnJhj3rBmk3b/bb
         ntNoFJX5r70bySIUIZtvQoYVG7R9jgViLjJduxZyII4amEvNpZevY+fpxgvbz12Bun36
         RPYbO1Q+1hQk5IEiZkTAGqrxXCStr6ywgornOuSZ5eyQO1+6dbkgw4o+U0GjrBhz/1vN
         V/7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzhJDKozBtKKBLJfEw/kjlKWinp75P6PCwar9AZJo6CIJmKhyYkyWrmJYebdp54kstPJZIM2Ktz6D4Nn/o=@vger.kernel.org
X-Gm-Message-State: AFuF++mlzXgIqEWWLJgDmAY7p1YkWvTePY34K9aytlSuhLwHSvAhV7eH
	Ug/H7kzBVQhmzGiQKwRy93c0IzxjL8hFstmDc8En7m+wbnqduAkZubhL
X-Gm-Gg: AYBFou0lxQnCBFi2hrzL+e0oU78/5ccOHnSiJC/vQ1pfpEKFePSHiBqSBbHzuyrv4LA
	dnWgO2xiBuczHYYknMgXljm/OmoGYl9aMijOLFc8/NGJb9ug/3PPenvF5nnmgEQVt9AwyvpW2xG
	TQUh8y7dcYGxkG+iYzBTcXZjRdWu3pb+MJV+Hf+cLLkjnI3O7ZpkJv1Qv/W912vVEd3PXmQ/Df5
	uAYBJH6MvWYPY42S0xIdfqueMP5PUU7sX9JCsfm9V16lfQGxTLmN5rcZKIOZjjMujhTZ7f/1jT9
	5f5oH5U66+Cf1TTriJ9dE7bXuJNvYyOjEjDUwBxcJ3AdwGpAdzICuokgo12qgtAuAsGHvaQ1oGv
	OeR6G6iggEIO3gx4uextJUls1FaDph7D8qQScrgzCXue18viDi0rc/Brv6MXwDn/hSo385CB6Ek
	bn7E+t9TgWp01iZ8ZaYwPVptW172NVRGkIRNh/TB8eA7yUEdpH8MInGk1qRRiPOQFYyekDv9D3g
	Z+hMjre8GBP645Li7/v/WOGSEq1Vk/Sein2BP+abKa9FikTFOVi42/GGMyhcBvDL17x3SZ7s112
	KPvpvEm/jkxm1wEeQ/lYuFFNFnx4n2f0lNEtge1xiUa/puZtYwZMIuiTKy7Y+W4Z0VGBsLCAApz
	36WAU41M/mrHDpPB0JcxSQBugCRS0F88IBQGxhSVaKuqjvZwSZDsDMw==
X-Received: by 2002:a05:600c:3f10:b0:4a0:1e3a:411a with SMTP id 5b1f17b1804b1-4a1800d20c3mr73028375e9.1.1791433592305;
        Wed, 07 Oct 2026 21:26:32 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm88071375e9.1.2026.10.07.21.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:26:31 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: v4l2-subdev: Fix NULL dereferences racing with unbind
Date: Thu,  8 Oct 2026 06:25:58 +0200
Message-ID: <20261008042600.275884-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

v4l2_device_unregister_subdev() clears sd->v4l2_dev and, through
media_gobj_destroy(), sd->entity.graph_obj.mdev before it unregisters
the sub-device node, and drivers that call media_device_unregister()
first, as vimc does, clear the latter even earlier. subdev_open()
dereferences both pointers, and the EXT_CTRLS ioctls the first one, so a
driver unbind racing with an open or an ioctl on the node oopses. syzbot
hits the open() case by unbinding vimc.

Patch 2/3 of v2, now patch 1, checked the two pointers in subdev_open().
That only narrows the race: the sub-device can be unregistered right
after the check. A patch along the same lines was also posted in [1].
This version takes a different approach: it stops reading the
sub-device's registration state in these file operations and uses the
node's own vdev->v4l2_dev instead, which unregistration never clears.
subdev_open() and the EXT_CTRLS ioctls no longer read a pointer that the
V4L2 core or the driver core clears when a driver is unbound.

What this does not fix is the lifetime of the sub-device and of the
media device when a driver goes away with file handles open, which is
the known limitation Sakari mentioned on v2 [2]. The commit messages say
so.

Changes since v2:
- Patch 1 (was 2/3): use vdev->v4l2_dev->mdev instead of checking
  sd->v4l2_dev and sd->entity.graph_obj.mdev, and fail with -ENODEV if
  the media device's driver has been unbound meanwhile.
- Patch 2 is new: the same dereference of sd->v4l2_dev in the EXT_CTRLS
  ioctls, found by reading the code.
- Dropped the two ipu6 patches of v2 (1/3 and 3/3), as I said I would
  in [3].
- Rebased on media next.

Testing:
- Built with W=1 (allmodconfig) at each patch of the series on media
  next 8e26d4c20ed2.
- Run in QEMU/KVM (x86_64, 4 vCPUs, KASAN generic inline, vimc built
  in) on media next 2dcdfb625c3b, which has the same v4l2-subdev.c,
  one boot per 60 s run. 16 threads either open and close vimc's
  sub-device nodes, or loop on VIDIOC_G_EXT_CTRLS on handles they keep
  open across unbinds, while another thread unbinds and rebinds vimc
  through sysfs every 1 or 30 ms. Each oops kills the thread that hits
  it; the test re-creates up to 100 per run, so the counts are capped:

    kernel              open() runs       EXT_CTRLS runs
    media next          116 + 116 oops    -
    + patch 1           0 + 0             116 + 116 oops
    + patches 1 and 2   0 + 0             0 + 0

  The oopses are KASAN null-ptr-derefs in subdev_open() and
  subdev_do_ioctl() respectively. The EXT_CTRLS runs are not done on
  plain media next, since they open the nodes too and would oops in
  subdev_open() as well. The open() runs with patch 1 and all the runs
  with both patches showed no oops, KASAN report or warning at all:
  about 8 million successful opens, 1.1 million opens refused with
  -ENODEV while vimc was being unbound (the test does not tell
  v4l2_open()'s own check from the new one), and, with both patches,
  880 million EXT_CTRLS ioctls.
- Run on the IPU6 tablet where I first hit the open() oops (Intel N100,
  Chuwi Hi10 X1), with two GalaxyCore sensors, GC5035 and GC8034, whose
  drivers I have not posted yet. Kernel: media next 9cfc1aca0781 plus
  those drivers and their ipu-bridge and int3472 changes, with KASAN
  (generic inline), lockdep and UBSAN. 4 processes either open and
  close every sub-device node, or loop on VIDIOC_G_EXT_CTRLS on the
  sensor's node, keeping it open across unbinds, while the sensor's
  I2C driver is unbound and rebound 300 times through sysfs. One run
  per sensor and test:

    kernel              open() runs          EXT_CTRLS runs
    media next          oops at the 4th      -
                        unbind of the first
    + patches 1 and 2   0 + 0                0 + 0

  On media next the oops is the KASAN null-ptr-deref in subdev_open().
  The test stops at the first oops, so the other runs were not done
  there, and the tablet gives no before and after for patch 2. With
  both patches: 2.9 million successful opens, 1048 refused with
  -ENODEV (again from either check), 81 million EXT_CTRLS ioctls, and
  v4l2-compliance and a 10-frame capture from each sensor still pass
  after the runs. One warning in the open() run on GC5035:
  DEBUG_LOCKS_WARN_ON(lock->magic != lock), from
  __v4l2_subdev_state_alloc() in subdev_open(). The GC5035 driver uses
  its control handler's mutex as the state lock, and the open took it
  after the unbind had destroyed it in v4l2_ctrl_handler_free(): that
  is the lifetime limitation above, which these patches do not touch.
- syzbot has not tested the series: its report has no public
  reproducer.
- I can post the test program if that helps.

[1] https://lore.kernel.org/linux-media/20260919162709.314464-1-ngocthang2710.1999@gmail.com/
[2] https://lore.kernel.org/linux-media/aqUoLr0JFGEBiJIf@kekkonen.localdomain/
[3] https://lore.kernel.org/linux-media/178921203630.98144.13238972861597227362@gmail.com/

Nicola Fiorillo (2):
  media: v4l2-subdev: Fix NULL pointer dereference in subdev_open()
  media: v4l2-subdev: Fix NULL pointer dereference in the EXT_CTRLS
    ioctls

 drivers/media/v4l2-core/v4l2-subdev.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)


base-commit: 8e26d4c20ed218db6c3123480a4a4e2545680566
-- 
2.47.3

