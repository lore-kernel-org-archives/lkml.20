Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A941337F305;
	Wed, 16 Sep 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571391; cv=none; b=QcUMNbz0m8Plt93i54tX6Bq5D3Lz5KKrFPcmDbRwkoDCBqeFLQMPIh+4oQagOD1rc1FP46RZC2fkBkoG/Nx5odJ8hOUhsvp0YOUUIAP98XyJYsjJa+BAYqhqHDgsM9DYVMKvqKg+1/xxXyzzv52XtjWexSozxzx8CIUPB/Hu6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571391; c=relaxed/simple;
	bh=vhtudKUQKYUWQ38SniEAJTU/7hdJid213xqQRcLm1ys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d7On2AwD8+0AB+dBipsS0bdx7lWZ4mBl0cOLXulbyzE8p2+4ECadI2gvXAsGwWpH34UuHEgGwioX+ubrteUckvKnijlCsxN/K6EiKHT2mlX1GcrGq2ICEEIBAMW9Esrlk8+KTMiR1VNtnbJqXaDl9BJDiTNtgJEnR50JoYZlOCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 59E73201F41;
	Wed, 16 Sep 2026 17:09:46 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGc-001Fsx-0m;
	Wed, 16 Sep 2026 17:09:46 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: [PATCH v2 00/17] media: rockchip: rga: Add multi-core support
Date: Wed, 16 Sep 2026 17:09:41 +0200
Message-Id: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2pq2hIKu/A/DopQBxmhL+iAYw
 r8LGHcuT3LuuQsE9IQBrtkCHicK5OwG8pSBGbTtkVG7MUguFVdcsjAm5nudv9IzknEemcbKVEZ
 3XOAFtt3osaP5aN7rL4fUPNDEPbQbA4Xo/Ps4ncTu/frqT38SjLMcjWxEocqiK28j2j5F7yzN5
 xahXtf1A/QpsljJAAAA
X-Change-ID: 20260602-spu-rga3multicore-ae8c8caf01e9
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2

Add multi-core support to the RGA (Raster Graphic Accelerator) driver
for Rockchip SoCs. This works by scheduling the given work to multiple
identical RGA cores. Previously other identical cores were discarded
while probing with -ENODEV to avoid exposing multiple video devices for
identical cores and breaking the ABI when adding an in-kernel scheduling.

This series targets the RK3588 SoC, which has one RGA2-Enhance core
and two RGA3 cores (see [1] for an overview of the different RGA cores).
The slimmed down RK3576 SoC also features two RGA2-Pro
(also described as RGA2.5) cores, but is currently not supported by
the driver. Tests are done on a Radxa Rock 5T SBC.

The scheduling is done only on a context level, which causes no
increased performance for a single stream (which uses only one mem2mem
context). Therefore at least N parallel stream are necessary to utilize
N cores. This avoids the more complex buffer handling required to avoid
mixing the frame ordering when one core is slightly faster than the
other (e.g. due to memory transfer timings or different clocks).

While the work is based on Detlev Casanova's multi-core series for the
rkvdec driver [2], it differs in two major aspects:

(1) It doesn't directly call v4l2_m2m_job_finish to mark the current job
as finished in the device_run callback. Detlev used this to trick the
m2m framework to directly schedule the next job. This looked like a
dirty hack and had me running into some of it's pitfalls (e.g. the
difference between the v4l2_m2m_buf_done and the newly introduced
v4l2_m2m_buf_done_manual function).
Instead I've dropped the current curr_ctx member of the v4l2_m2m_dev
struct and added a max_parallel_jobs member to specify the maximum
number of parallel jobs. This allows the driver to set it's maximum
number of parallel jobs with the newly introduced
v4l2_m2m_set_max_parallel_jobs function. The RGA driver uses it to set
it's number of parallel jobs to it's number of available cores. The m2m
framework then schedules the first N jobs on it's job queue to the
device_run callback instead of only one.

(2) Instead of attaching an identical RGA core on probe to the first
probed RGA core instance, use component helpers to add all cores as
components to a virtual platform device. This has the advantage of only
creating the video device after all cores have been probed successfully
and tearing it down if one core is being removed (e.g. by the sysfs),
which otherwise could lead to nasty memory bugs. The implementation is
based on the driver of the etnaviv gpu. As the virtual platform device
doesn't has an iommu, we still allocate all relevant drives on the first
core, which shares it's iommu domain with all other cores.

v4l2-compliance results:
    v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
    ...
    	Card type        : rga2
    ...
    Total for rockchip-rga device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
    
    v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
    ...
    	Card type        : rga3
    ...
    Total for rockchip-rga device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

Patch 1-3 address review comments from my last RGA3 patch series
Patch 4-5 additional driver cleanup/improvements
Patch 6-7 implements support for parallel jobs in the m2m framework
Patch 8-10 add multi core preparations to the driver
Patch 11-15 rework the driver to use component helpers
Patch 16 puts all cores into the same iommu domain
Patch 17 enables the multi-core support

[1] https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_Developer_Guide_RGA_EN.md#design-index
[2] https://lore.kernel.org/linux-media/20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com/

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
Changes in v2:
- split v4l2-core change into two commits
- move pm_runtime_enable to it's devres version
- add missing pm_use_autosuspend call
- fix NULL pointer deref when unbinding and rebinding a core
- allow manual binding the component master without needing a driver
  override
- various fixups in the error paths
- extend spinlock usage for their data structures
- moved core bind to probe commit for a better diff
- export the v4l2_m2m_set_max_parallel_jobs symbol
- document the new v4l2_m2m_set_max_parallel_jobs function
- dropped cherry-picked patches (now included in media/next)
- add Guangshuo Li regarding multi-core in mtk-jpeg
- Link to v1: https://patch.msgid.link/20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de

To: Jacob Chen <jacob-chen@iotwrt.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Sven Püschel (17):
      media: rockchip: rga: zero cmdbuf in shared code
      media: rockchip: rga: add comment about pixel alignment for YUV formats
      media: rockchip: rga: move early return into if condition in vidioc_enum_fmt
      media: rockchip: rga: removed unused regmap member
      media: rockchip: rga: use devres version of pm_runtime_enable
      media: v4l2-mem2mem: drop curr_ctx member from v4l2_m2m_dev struct
      media: v4l2-mem2mem: support running multiple jobs in parallel
      media: rockchip: rga: move power handling to device_run
      media: rockchip: rga: adjust get_version to return the version
      media: rockchip: rga: add rga_core structure
      media: rockchip: rga: use components to manage multiple cores
      media: rockchip: rga: move rockchip_rga allocation to master probe
      media: rockchip: rga: move core initialization from bind to probe
      media: rockchip: rga: move video device to the master
      media: rockchip: rga: bind all cores to the master
      media: rockchip: rga: put all cores into first core iommu domain
      media: rockchip: rga: schedule jobs to multiple cores

 drivers/media/platform/rockchip/rga/rga-buf.c |  16 +-
 drivers/media/platform/rockchip/rga/rga-hw.c  |  40 +-
 drivers/media/platform/rockchip/rga/rga.c     | 556 +++++++++++++++++++-------
 drivers/media/platform/rockchip/rga/rga.h     |  44 +-
 drivers/media/platform/rockchip/rga/rga3-hw.c |  32 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  94 +++--
 include/media/v4l2-mem2mem.h                  |  18 +
 7 files changed, 560 insertions(+), 240 deletions(-)
---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260602-spu-rga3multicore-ae8c8caf01e9

Best regards,
--  
Sven Püschel <s.pueschel@pengutronix.de>

