Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B6B4C1505;
	Wed, 16 Sep 2026 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568733; cv=none; b=YgnBp5PH70+PtP5dSjb982twyAMPm24dNSlg5a01JTrK2wwjH3Fqy1V7MyxxKh4rd52Rm1/7mMwiYP/iGpJ3Oul05RhlAO0f9hQp/0V6BgtyWVKbBELUbJcyeIdJSlRQY7XwzGtOxjkty/BXqlmbnQG1G+RSHUppUQDCxyN52IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568733; c=relaxed/simple;
	bh=PXSGCK4XJImXzJ5Tnr0mvlaxq0Mq/XyWM5fDlTAcs/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D7/PoojpHKuKEu8j+dXiB/joAXo0A26rMszBEtGvj/n2aIjXWpDAuJAydVHl8uEYT1kWaV5SHXkpde33MPWhWl0UZGjY6jX59pCXPeBcezAT/qXNrzo7HS7VBfFLfuQChzPNZtfvtKntpQpJEQpOuCk94h6dih24jGsr1WzleBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jCbHDjhX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jCbHDjhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789568730;
	bh=PXSGCK4XJImXzJ5Tnr0mvlaxq0Mq/XyWM5fDlTAcs/8=;
	h=From:Subject:Date:To:Cc:From;
	b=jCbHDjhXr35px6io3hf26zcFdpIELxPyr3fRYjU8uNWLarE5F14tZtXaGIFhiVFq5
	 UiBcT2FBFyuoEZCNi4+PsM+c6M5XYZFvzGHDEcFVxFBZLroER9532dX69mnXVW55wf
	 WwQ1cVHHSdW7DHsM0/vzNpvjtjYKd2Wfxjj8hHGZ1FrSr/8Uw1aw8Pgz/lISJP82He
	 xR/fx2wJv6rydnYiZDaGUCl2x6ijiWoAJtOPEB7xGgOGYYTXAcgo35CP+ilOip+SgY
	 CJqWGJjzN/FI6Lzi6LzGCQ+2SlHftHzVfF2LAImXFffRkhuGGjzMPBj7ugvSQqnGIL
	 OGtC58cuISjGQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D46E17E0070;
	Wed, 16 Sep 2026 16:25:28 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/4] media: Track v4l2 buffers through an allocator
Date: Wed, 16 Sep 2026 10:25:25 -0400
Message-Id: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WO0Q6CMAxFf4Xs2SVlzoL8iuGhlE6nIroNYmL8d
 4eY+HiT03P6UlGCl6ia4qWCzD768ZZHuSkUn+h2FO37vJUBg4Cl0bO9Gk19rwcZdArEFwm6J4C
 65soSWpVP70Gcf361h3bdcerOwmlx/Yggjyn30or9c02xxqD+x9xSEk3CKJVDIORmNouooyiax
 2HwqSkQyTnaVuyIIcP5Y2bbsbMEuOuAd8ZVUu5V+35/ALgbmPL7AAAA
X-Change-ID: 20260612-v4l2-add-mem-tracker-da0088c74a64
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Hello,

Currently, the only way to track buffers allocated by v4l2 from usespace
is to use the subsystem available debug information (e.g.:
/sys/kernel/debug/dma_buf/bufinfo).
But that information is generic and cannot be matched to a v4l2 driver or
to a userspace application: It is merely information about the allocation.

Other types of allocations require the developper to find where they are
exposed and how to link them to their test.

This can become hard to track when mutliple drivers are working at the
same time.

To improve that, add a small wrapper around buffer allocations to keep
track of them at the video device level so that we can add debug
information to them like a name, userspace pid/fd that did the
allocation,... and expose them to userspace via a debugfs entry.

It currently only supports DMA buffer allocations and adds support for
VB2 allocations too.
Other kind of memory tracking can be added later.
The verisilicon and rkvdec drivers have been ported to use the tracked
dma alloactions.

Note that this depends on the ftrace support patch series[1] that
provides fd/pid info in the v4l2_fh struct.
That series is a bit old, so this is based on an older linux version, but
that only changes things for the last 2 commits.

A v4l2top utility[2] has been made, to be used in parallel with the
fdinfo patch series[3], to show the list of active streams with their HW
and memory usage.

With this, debugfs looks like this when decoding a HEVC 1080p stream with
rkvdec on rk3588:

  root # cat /sys/kernel/debug/v4l2/fdc38100.video-codec/mem 
  created-by                      fd              pid             size            label
  -------------------------------------------------------------------------------------
  gst-launch-1.0                  7               635             39184           vdpu381-hevc-priv-tbl
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-7
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-6
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-5
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-4
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-3
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-2
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-1
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-0
  gst-launch-1.0                  7               635             3133440         out-000000005c0230f6-1
  gst-launch-1.0                  7               635             3133440         out-000000005c0230f6-0
  =====================================================================================
  Total size: 39729424

[1]: https://lore.kernel.org/all/20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com/
[2]: https://github.com/cazou/v4l2top/tree/upstream
[3]: https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com/

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (4):
      media: Add a v4l2 memory allocations tracker
      media: Store v4l2_fh in the vb_queue
      media: verisilicon: Switch to tracked dma allocations
      media: rkvdec: Switch to tracked dma allocations

 drivers/media/common/videobuf2/Makefile            |   1 +
 drivers/media/common/videobuf2/v4l2-allocator.c    | 186 +++++++++++++++++++++
 .../media/common/videobuf2/videobuf2-dma-contig.c  |  27 ++-
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  14 +-
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  14 +-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  21 ++-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  14 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  14 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  14 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  14 +-
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  33 ++--
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   4 +
 drivers/media/platform/verisilicon/hantro.h        |   1 +
 drivers/media/platform/verisilicon/hantro_drv.c    |   4 +
 drivers/media/platform/verisilicon/hantro_h264.c   |   7 +-
 drivers/media/platform/verisilicon/hantro_hevc.c   | 100 ++++++-----
 drivers/media/platform/verisilicon/hantro_mpeg2.c  |  16 +-
 .../media/platform/verisilicon/hantro_postproc.c   |  14 +-
 drivers/media/platform/verisilicon/hantro_vp8.c    |  25 +--
 drivers/media/platform/verisilicon/hantro_vp9.c    |  34 +++-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 160 +++++++++++-------
 drivers/media/v4l2-core/v4l2-device.c              |   4 +-
 include/media/v4l2-allocator.h                     |  26 +++
 include/media/v4l2-device.h                        |   2 +
 include/media/videobuf2-core.h                     |   3 +
 25 files changed, 555 insertions(+), 197 deletions(-)
---
base-commit: 66affa37cfac0aec061cc4bcf4a065b0c52f7e19
change-id: 20260612-v4l2-add-mem-tracker-da0088c74a64
prerequisite-change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c:v2
prerequisite-patch-id: bd45b4df66799a7f9f22b49973a78d1bd3590a4a
prerequisite-patch-id: 6a5ed5615f08257cf854d441785066b5ff4d5d47
prerequisite-patch-id: 02594c869498b9e91e416d70242afbaa6b3a8d6a
prerequisite-patch-id: 9f25ec78f3b99ac1c5d42eb732f5bd9eae73fadd
prerequisite-patch-id: 4ed2c2e8c3abfa7f6328d0ea4f488ca5a3eec8fb
prerequisite-patch-id: 8787d50eb80e1a63a57a123268cade23c9e64618
prerequisite-patch-id: bfe85822378fa771f9bbc3e1e8c8ff6bce0eb7fd
prerequisite-patch-id: 784d0801da320f7b41194f4632ee422c32f1b5b8
prerequisite-patch-id: 362c8366e2efbfb5e6f1a3f71cfddbd46e8d1506

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>

