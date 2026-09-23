Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0574220F2A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122474; cv=none; b=u5JPc53X6y/bZp6yrFB5CBa5L2rjHTrTE2KydvmWPlQdUWSJCrnH+qI1yJg0eyDKW4SC9yedoX4bmvhJey+Ut3Gy7vN/OBrj8pdwIbPFA957Y2i65/xk4dxL6vQdE3c5fn0Yi5me7FxvMd2eBdEIHDih64HpS9wmSnqYKamTNyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122474; c=relaxed/simple;
	bh=P6Ln9yydET6/DT6UaCQHydMvq1BdaUCBA6jzgFW3nhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4m7K6j/lJshJKxondpEOvQMrF/h1TghUwH52P+Wr6eV0A2y2xOLWbVcugj8bgtuL6k7BCunLjucpNYnWIyeZ69Cca49Y/m8MGFfmpWzz2YZVaZBo3ed2hZ0TKi1bBz7TFSkxIJJZ4z7EYEepMAtND8cWNGfnmSthqgPY+k6yUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7rmXKCN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7rmXKCN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso4193235e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122471; x=1790727271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRqDipDPc1dQZZEdRWvlY8idVTIi6hQUDsT00pu+0Qw=;
        b=T7rmXKCNhAaMfGu6GhBZE4mpKt0BlVK74xR39YZT60oHxKEdFTTBXt1jFdjoDKGKt0
         s9LrT7cLzTNGfk9B0Bt/XkpVaR6Fh9ovY+h0UNW3xPE55JgEAeFGtigo6Lh/sKeATtMs
         A2zXUgHUiHXmJJdBmqc7Xq7VD6d/qO1VfeJmQjxCTIM0ZD/oFUvGvmH6E//0TK+gbEeX
         xIPOVi6A1fiWmxO7tL9GA66WQo9X+7sBJ/XzcyZYaETENenHhfbBa7YeLx6tWdy4BHDt
         d+0l6dtg7oJOyVYA/oW0JesDY0bk7zJSILac+Gb6dA7LQf3uCC63lek1/2c4XayRyEDh
         JdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122471; x=1790727271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRqDipDPc1dQZZEdRWvlY8idVTIi6hQUDsT00pu+0Qw=;
        b=l3NQJ3MKA9VAN3/sNPl8HL13/mvMmTWMMVEHSazs0hufLViCp9rW8w3imJm6LjBxxm
         JBOEhw94IlevEcriNcNaQluH91aPagaIUBammgkoRDhT+9y7J0GYsYWu27Bc6U7e8M8T
         fnM8WZE3UHWMwHYGR3klLrZfSCTnzkgSlSKesDBphc9zLPY0zkkv3i8LthhiFnuih+Pd
         7rrHzsqonqfFwtqruq+j37DmjE6GUpYtAy9BMaPFpBvhk/W2JSyy3OVtGovNbfWj14Pt
         wuZUPRBufwdzvMp45cEO0+3K/+s5fNkwdhfE1KIAxiCh1PSYQ0larPzpam0DvtNggHyD
         Xp0A==
X-Forwarded-Encrypted: i=1; AKwUvBzBo+WpLc5Y7umjk2xUHLcK0sr9JGgYIvsgIwIN1seEaM2lIm8wWocbsx0fCzvTYloU5IZ+RERtxu85XUk=@vger.kernel.org
X-Gm-Message-State: AFuF++lpVK9vMcAMAbNYh9r+eZy62hW68B7OwkCrrZqngtKW2aghU+bU
	a+R3a8eLXrzjWfU+2ls5tJ5uXnyV09hQC9tIZJl8o3mjyscaeyGcUqUe
X-Gm-Gg: AYBFou2IIy1BVa2r1IbdgSRjhXky67cnm5K4vEkxz4eO1XyN7MHiivM9uzs1IJcO0x9
	CA0EH78lthMA48ZJ6IUfDduHluskc+VsQI4ZU8rnBLIjuNSUva9BVTFTM9Puu13gAo7OpPpHsHj
	gMvhdYcl/KZ+GSrIVgh4mpTMQCwgS6QroO4l/CqkIR96hXayGfTrHQQO9iTSHOGcBKH6vO5z0Lm
	ySWJPAGMbY4jE8R8IL/2dCR8gXgrqwulbBc88cGIKeBLxAAoPhxIizg62OjIN8IbePvhLnV0WLO
	wBXxc+DgotohdINdbzUuz30qjlB9C9jMEidO/FZAUx64c3mIl2dJB4nD6TQ07zU4ToWolwtG8rI
	pJ9l6reOtpk8R8+9n27/CBPFs3YlnmSs4KgedtwPZ+cWoUyohuBa+Q5cCmH9ku6/mKr9BGJI0Px
	5VgarLm8sy92VGl/N7aeP/wyQSpgVqB0rmIVZHYp4EVNhty5ai/BFaOixeZWBKOW5hFjQMXH8aK
	Ji5hI9+vHZseF6MaNhIs/lk9OGgdc/J26S4dvsw6UvdpfVk95AvnIyYX7ap31AX0JDdn2ce1d8w
	jpYilmmY4fOc7MrDbqdgD94nxfG+SxPNsaUB266DDoz82XObqdyp/S+MtE6hVculbOITNak93cp
	wQXuAWI2mLCvPyqF/K03ZbQ==
X-Received: by 2002:a05:600c:871a:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fdf1370b1mr9001355e9.18.1790122470917;
        Tue, 22 Sep 2026 17:14:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:29 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH 0/6] media: az6007/drxk/dvb-core: cope with a tuner unplugged while in use
Date: Wed, 23 Sep 2026 02:14:04 +0200
Message-ID: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unplugging an az6007 based tuner (here a TechniSat CableStar Combo HD
CI with a CAM inserted) while it is in use can leave parts of the DVB
stack stuck on the disconnected device.

In particular:

- drxk keeps accessing the device after unplug and hides the resulting
  errors from userspace.
- The CA thread can get stuck polling a removed CAM slot and prevent
  the disconnect from completing.
- Applications that wait on or poll the DVB devices are neither woken
  up nor told that the device is gone, so the disconnect can wait
  indefinitely for them to close the devices.

This series fixes these issues by:

- treating an unreadable CAM slot status as no CAM,
- propagating -ENODEV from az6007 to drxk and stopping further device
  access,
- waking up the users of the demux, dvr and CA devices and returning
  -ENODEV to them, so they can handle the device removal.

Tested on Linux 6.18.44 on a Turris 1.x (PowerPC P2020, two CPUs,
non-preemptible):

- tvheadend with CAM enabled, idle, scanning and streaming,
- unplugging the tuner or the whole USB hub,
- unbinding the driver through sysfs,
- blocking reads on dvr0 and demux0.

In all tested cases the disconnect completed and blocked userspace
operations returned -ENODEV.

Some pre-existing cases where the release waits for users that are
not woken up remain. The unlocked user count check in
dvb_ca_en50221_release() and dvb_dmxdev_release() also still races
with a concurrent close(), and patches 5 and 6 make that race easier
to hit.

Josef Schlehofer (6):
  media: az6007: fix CAM status polling after disconnect
  media: az6007: propagate USB errors from I2C transfers
  media: drxk: stop retrying after disconnect
  media: drxk: stop accessing a disconnected device
  media: dvb-core: dmxdev: wake up readers on release
  media: dvb-core: wake up CA users on release

 drivers/media/dvb-core/dmxdev.c         | 31 ++++++++++++++--
 drivers/media/dvb-core/dvb_ca_en50221.c | 24 ++++++++++++-
 drivers/media/dvb-frontends/drxk_hard.c | 48 +++++++++++++++++++------
 drivers/media/dvb-frontends/drxk_hard.h |  2 +-
 drivers/media/usb/dvb-usb-v2/az6007.c   | 23 ++++++------
 5 files changed, 104 insertions(+), 24 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.54.0 (Apple Git-157)

