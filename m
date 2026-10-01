Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6073B1B3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814422; cv=none; b=WkGaIGx1b9Uq7Wz3xnB8s3MVSu5UFoEugtWFn5qI9UQkD0gG+7F0djwuiLYx3XLgjzAVISZz9YqHeTlwOj+JySOXwMzPZ4awHrfYRzGz5SJD7wBOP4DwocuKnXbLYxeUAPQi0egF62KgGpuZw2g3tjDlH+e4wkDQMDi4yaa6NRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814422; c=relaxed/simple;
	bh=PLf5SqSeqg2iekWWFxBxbfGkTZhvCNZx0DIeB3x0OW0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DgtjpASkp9BBzPVq1p6Zn1vTfW2zi4izX+cS+R7E1xdOpam+3tmfe3zCNBXHN5zo5Yn0XOEdIFR3uq/1xRskSfB53i50xtJqD9hoTBVXjNpCA+9Om36Pc5XRehR+VjBH1FIo8exWFOXPQDdyd3uNdwed97vzi26twAv9LAxbh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VfUf6M12; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VfUf6M12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790814418;
	bh=PLf5SqSeqg2iekWWFxBxbfGkTZhvCNZx0DIeB3x0OW0=;
	h=From:Subject:Date:To:Cc:From;
	b=VfUf6M126WQdeSF1gBA6B6OhgAjeCedVh40/HRF9j94MX3j0jV478MCot+wsGpV5y
	 Zc+a2rsDfhhl9meQlOzSTS6dM/V8WOytjVt20z26zpC/HBEDJgVM5DUiYH+9T9H/JB
	 1Dkfn01N3f0+GlUDr7BLQClmHfOVNGJkQLDC+ZE3li6hUTMAP2x630lGd5fmXGS3mj
	 cAx2NYJ0IygJE+QYR+4iTxVqePdJC3PL9gslBqxySJ9Jb6wF1FDTAS3yWmqAfhzog4
	 DHn4GZizMgTsOIhFQbumgYqUNF0r0ae3WuNS6+Q6vN5FDIkWxU82ygjPkGzWIck0Ig
	 Nh8AuOu3DUfiQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9A8017E05F4;
	Thu, 01 Oct 2026 02:26:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/7] drm/vc4: hdmi: Convert to common HDMI 2.0 scrambling
 infrastructure
Date: Thu, 01 Oct 2026 03:26:13 +0300
Message-Id: <20261001-vc4-common-scramb-v1-0-51280460194b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTuQBK3Rq0gXyTitIySRTFuE0
 rsbdfkW/2+gXIUVrt0GlVdRKbnBHjqgR8gTo9ybwRnXW2MsrnREKimVjEo1pIjni4/u5M0YvIX
 WvSqP8v49b8PfusQn0/wdwb5/ALbO1El1AAAA
X-Change-ID: 20261001-vc4-common-scramb-798b2580fa81
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

This series consists of patches 42-48 from "[PATCH v11 00/74] Add HDMI
2.0 support to DW HDMI QP TX" [1], which convert the VC4 HDMI driver to
the common HDMI 2.0 scrambling infrastructure as a proof of concept for
reusing the shared code.  It adopts the shared TMDS character rate
constants, switches to drm_hdmi_mode_needs_scrambling() and force_ctx(),
fixes -EDEADLK handling, and replaces the driver-local scrambling
implementation with the common SCDC scrambling helpers.

The infrastructure patches have been merged and there are no remaining
dependencies, so the vc4 patches are now sent as a separate series,
rebased on top of the latest drm-misc-next.  The Acked-by tags from
Maxime Ripard on v11 have been collected; no functional changes were
made since v11.

Retested on a Raspberry Pi 5 Model B Rev 1.1 (BCM2712 D0).

[1] https://lore.kernel.org/all/20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (7):
      drm/vc4: hdmi: Use common TMDS char rate constants
      drm/vc4: hdmi: Switch to drm_hdmi_mode_needs_scrambling()
      drm/vc4: hdmi: Switch to .force_ctx() connector helper
      drm/vc4: hdmi: Propagate -EDEADLK to the top level
      drm/vc4: hdmi: Convert to drmm_connector_hdmi_init()
      drm/vc4: hdmi: Convert to common HDMI 2.0 scrambling infrastructure
      drm/vc4: hdmi: Defer pixel clock validation to HDMI helpers

 drivers/gpu/drm/vc4/vc4_hdmi.c | 359 ++++++++++-------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  30 +---
 2 files changed, 89 insertions(+), 300 deletions(-)
---
base-commit: 37b346eab23aead52d17a8fa687056bfc651a416
change-id: 20261001-vc4-common-scramb-798b2580fa81

