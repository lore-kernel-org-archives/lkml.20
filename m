Received: from smtp-sv1.saltyming.net (smtp-sv1.saltyming.net [152.53.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE01C35AC3B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066898; cv=none; b=lV+CUZp2gIB9hE/WdtHT2Q5+jd3bfBeJLX9t4YQvgIOJjS2svCx8y9WRqxtPCHJGkZDjWIzizt/8cZDXqMhDKjvI5PRHr5khKq0i0MK34nVrHoxO4pI975GH7x077JYdFXxQa9w5v3kEd4mP9G63CuPtvzeX/Xi3ZovrTYsP7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066898; c=relaxed/simple;
	bh=JwYWEhnaXLTc615RV6FJRMbdsNw/TqrxlqxpFScu5SA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeuc4r02SZE3LwEe+/HzM0rthGCHm48e0a3pRRmZjs0/c8GfU4bdJzXC65MIlOiCqVAjK5vDMQyU2LDMOtyV0utDTY5dmR4c2Jd2GBTbCOlFbfX2EeeFE57a+g4Yn7Tm6q0uodWfkPcO2lMRaDvi92BHXU9f9MTxMUmvM6dU4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saltyming.net; spf=pass smtp.mailfrom=saltyming.net; dkim=pass (2048-bit key) header.d=saltyming.net header.i=@saltyming.net header.b=wZ9a+GPJ; arc=none smtp.client-ip=152.53.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saltyming.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saltyming.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saltyming.net header.i=@saltyming.net header.b="wZ9a+GPJ"
DKIM-Signature: v=1; a=rsa-sha256; s=saltyming-dkim-202512; d=saltyming.net; c=relaxed/relaxed;
	h=MIME-Version:Message-ID:Date:Subject:To:From:Content-Type; t=1791066895;
	x=1791671695; bh=VeZYO3jefwb4yxSTzrfcJ0DSsI77zkNa5o+LTFguS6Y=; b=wZ9a+GPJu5
	hhD+N9tAQGzRF+zx0ocFafCeVD5MxLprdrvo1YRVeR7vGCq/s35kleza7GecBZcnlBXE7QmMltn
	iRL/N26B1rvsZ8FWCVkPswmEBMYEoC6DQ0NjgoYnajj6YcfFBlpRuulTEkqAzCM7Ob+jtDs8JPA
	oXcWHADacr7Hf/zh0ddWfwDmXde/ZG83lK9AOl/v4/a782X9kjaWKqaaGh2mV1WUr8QmoJTs+VF
	ozIgqUIGl8YjDsKca4kr6osay8MFEcfKrIbgaU2VzpOs5jkySoEp8XNOWyCPs9Uyc5C/pGb+n3a
	Wt8Kb2glGgXqFi+gri+e/1XB3iDgpiow==;
Received: by smtp-sv1.saltyming.net (SaltyMail) with ESMTPSA
	(version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256)
	(No client certificate requested)
	id fd45127f-9dc2-4372-9131-a4ad5aa247f5
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 22:34:27 +0000
X-Virus-Status: Clean
X-Security-Tags: spf_none, dkim_none, dmarc_fail, dmarc_quarantine, arc_none, av_clean, ham
From: Hamin Sung <hamin@saltyming.net>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Aaron Kling <webgeek1234@gmail.com>,
	Hamin Sung <hamin@saltyming.net>
Subject: [RFC PATCH 0/2] drm/nouveau: select GT21x performance levels by load through devfreq
Date: Sun,  4 Oct 2026 07:34:18 +0900
Message-ID: <20261003223420.77993-1-hamin@saltyming.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On GT21x (GT215, GT216, GT218, MCP89), nouveau can reclock by hand, and
booting with nouveau.config=NvClkMode=auto selects the clock subdev's
automatic mode.  Nothing adjusts the automatic pstate on these GPUs, so
automatic mode means the highest pstate.

This series measures graphics engine load with the PDAEMON idle counters
(patch 1) and lets the devfreq simple_ondemand governor choose the pstate
from it while automatic mode is selected (patch 2), along the lines of
the Tegra devfreq support from commit 6ca1701cecdb ("drm/nouveau: Support
devfreq for Tegra").  Nothing changes unless NvClkMode=auto is given at
load time, and a fixed pstate written to debugfs still wins.

The devfreq device lives in the DRM layer rather than next to
gk20a_devfreq.c, because PCI suspend, resume, runtime PM and unbind are
handled in nouveau_drm.c, while nvkm subdev init runs again on every
resume.

On GT21x boards that need memory link training, the first pstate change
runs into the "scheduling while atomic" bug fixed by "drm/nouveau/fb/gt215:
don't sleep with PFIFO paused during link training", which I sent
separately for drm-misc-fixes.  This series makes that first change happen
automatically, so it should go in after that fix.

Testing:

  - built with W=1 and sparse, with and without CONFIG_PM_DEVFREQ, and the
    Kconfig change checked on x86 and on an arm64 defconfig with Tegra
  - GeForce 310M (GT218), 6.18.54 backport: its VBIOS has a single usable
    performance level (the 135 and 405 MHz entries are marked 0xff), so the
    series as posted does not register a devfreq device there.  With a
    local change allowing a single level, devfreq registered
    (simple_ondemand, one OPP at 625 MHz, delayed 100 ms timer) and the
    load samples read 0% when idle, 3-4% while kmscube rendered at 60 fps,
    and 0% again afterwards.

So the counters and the sampling path work, but pstate changes driven by
the governor are untested: I have no GT21x board with several performance
levels.  Reports from anyone whose debugfs pstate file lists more than one
level would help, which is why this is an RFC.

Questions:

  - Is the DRM-layer placement fine, or should this move into nvkm and
    share code with gk20a_devfreq.c?
  - Selecting DEVFREQ_GOV_SIMPLE_ONDEMAND from DRM_NOUVEAU when PM_DEVFREQ
    is enabled: acceptable, or should it be left to the configuration?
  - The 100 ms polling interval and the 50%/20% thresholds were chosen to
    keep the costly GT21x pstate changes infrequent; better defaults are
    welcome.

These patches were written with an AI coding assistant (see the
Assisted-by tags) at my direction, from a session that read the nouveau
clk, pmu and devfreq code and the envytools PDAEMON counter
documentation; the assistant also ran the builds and the hardware test
above on my machine.  I have reviewed the code and take responsibility
for it.

Hamin Sung (2):
  drm/nouveau/pmu/gt215: add graphics engine load counters
  drm/nouveau: select GT21x performance levels by load through devfreq

 drivers/gpu/drm/nouveau/Kbuild                |   1 +
 drivers/gpu/drm/nouveau/Kconfig               |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/pmu.h |   2 +
 drivers/gpu/drm/nouveau/nouveau_devfreq.c     | 328 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_devfreq.h     |  19 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   7 +
 drivers/gpu/drm/nouveau/nouveau_drv.h         |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/pmu/base.c    |  29 ++
 .../gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c   |  40 +++
 .../gpu/drm/nouveau/nvkm/subdev/pmu/priv.h    |   5 +
 10 files changed, 433 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_devfreq.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_devfreq.h


base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
-- 
2.55.0


