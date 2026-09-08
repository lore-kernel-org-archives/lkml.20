Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45323845B0;
	Tue,  8 Sep 2026 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849220; cv=none; b=KiH1usHQnIswOGoUNDfRVdjFC56RB9r+DyGPm9bXO/Ty4GX8GzvmXGNr/Fs/jTZf6prdEvSBqzM7cjioNQr20Tjci6iZk/+p0q8yBbZ21MwimhhIa0F3lOQZaxzBdElCJv7X2JLbM1h37YBnmFrQ/2hQon8Me+brj9VM/WbzodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849220; c=relaxed/simple;
	bh=N+cNQK+L8tSsXmR89P3NDvpQp2vfK3194Og7zwuoE4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cTHVjdCp6BiUj3XzUxFcj6r5ojZe2F3drHdJuhd/vANtL44uHm1g4XSbwI8fyi6uIiMgccjMDcNVtfgnYCtprWLFMcir0PpIcK0GAFkkqb2WUlV1x1mOErxlrHf3yjAwNEelf1d+B1FHLcnW8BbzpDzckDqs6jQtTGdvT115YmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rNy0DjFR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rNy0DjFR"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DA0EC25;
	Tue,  8 Sep 2026 08:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849120;
	bh=N+cNQK+L8tSsXmR89P3NDvpQp2vfK3194Og7zwuoE4M=;
	h=From:Subject:Date:To:Cc:From;
	b=rNy0DjFRieY+hOHaHDUA4rEAIYiGt1SkHQR6ZZ3L5D0Bp55LRa2PiifN2ScZcvNVM
	 vi5BXZYiNQoCGa8P2XZsxFdqLFMm3+8XZe+Ne3MQD4lqc/eViwrm7w4mNfufSBeA0N
	 5Hd48JOEcX8qr2/zTWtgCYRMHUOtFLlIHGnRHpcc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v7 00/11] media: rcar: Streams support
Date: Tue, 08 Sep 2026 09:33:04 +0300
Message-Id: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACGsn2oC/3XPwU7DMAwG4FeZcibIdpqk5cR7IA5p4rAc1o6kV
 KCp7046BJUqevxt+bN9E4Vz4iKeTjeReU4ljUMN9uEk/NkNbyxTqFkQkAbCTmbvsixTZncpEmN
 g17YGWLOoI9fMMX3euZfXn5z5/aOq01Y8pzKN+eu+csa1eqDPKEFG7DvFyoJz/XOq68o49KPL4
 dGPF7F6M22GIrMzqBoBggUgbxqMB4baDK1gZ6hqABmjdYgWVXtgNH8GEu7vaNZfqO2bVqH3xh4
 Y+tcwoBB3hq6GYuM7bYPVh4bZDIN2Z5hqYO1wbynE+J+xLMs31Fg6HxgCAAA=
X-Change-ID: 20250219-rcar-streams-1fdea8860e5e
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6738;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=N+cNQK+L8tSsXmR89P3NDvpQp2vfK3194Og7zwuoE4M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w3ikFlmCU7N54pJQcFyLQmoayz/QbV0tq36
 Gh3u1m3McCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sNwAKCRD6PaqMvJYe
 9W3XD/0dNn70cizMuD++8w31I37EhdPAq98fnulZMsuNfg8dgDP/qf8wNkzTErmoBBWO6EUVIZC
 aUeuIjf0tvh5+AGSAypGz2vhgJpXt46KKX7Rg7RIIzj/M1NGPqNyKXZVJRT7Sj7Nfy7wE37EpuJ
 FagWjPU/6MjvEIGSpN1tDnO1mN0nK2EHI3j/yT5hjcjpOqY5ziDxf2M4N0iHaNGdehnEKMpJIsj
 30z4eR6wzfrtno5cNMHns2YtKPL3XEW85WSltTKjqowU5j8dVkuZKgWvMxw9z7NItThBBzOvWz8
 szKQqgz5cwxCg3wdCv73CQx2Ug7cIr1253PN9n6H0TTNH24CYmb2+X+/UCCYwV00dpm5VrCUzYB
 +DuoLIf/MqKiK7SAbcuu/nAjb2Qtuec/D7aMRvEWYHcv+W8w8hdbv1gQVnt/UlwnNN7azOjDYMQ
 mWVIxDuoEVK/qRKcDq928Cu+MSfI1ZaPESOEdf1AqDgCYOmXrjsOtaTa/vAGRZzm0XYyn6qSzfW
 GapzCTif9epeaG+Z2mJLyHmDSHcJojvBq3rTHM5vcO64QfVoDr3eCSEOdliNHCbWoF4A6NCOTsC
 /3V8J5/4+40zYqUuji+FIhB/+qESeS6bykliSMGgh/CfFQjnCxAu8JRDyJvcxFsiWPkd7LWhn5U
 kL2VgEFl0LlQuFg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add streams support to Renesas rcar platform driver.

The series keeps compatibility with the current upstream for a single
stream use case. However, in upstream there's a limited custom
multi-stream support implemented to the rcar driver, which will be
replaced with the upstream's Streams API.

I have tested this series on Sparrow-Hawk board, with a few different
setups:

1) IMX219 on the CSI0 connector (video)

2) Arducam FPD-Link board + 4 x IMX219 on the CSI0 connector (video)
  - Only two extra patches needed for testing: one to enable the V4L2
    Streams API, another to add .get_frame_desc() to imx219.

3) IMX219 on the CSI0 connector (video + emb)
- A bunch of other patches applied to enable full streams support,
  internal pads and embedded data support in imx219 and v4l2 framework
 
4) Arducam FPD-Link board + 4 x IMX219 on the CSI0 connector (video + emb)
- A bunch of other patches applied to enable full streams support,
  internal pads and embedded data support in imx219 and v4l2 framework
- Tested with video and embedded data streams from all four cameras (so
  8 streams in total)

I can't properly test the error recovery, but I did trigger it manually
with the FPD-Link setup running, and it worked fine.

I have observed one issue with the embedded data (i.e. a test case not
supported in upstream kernel): when stopping streaming, VIN says that it
cannot stop the stream. I haven't debugged that, but a possible issue is
that if the video stream for the imx219 is stopped first, the embedded
data stops also, and VIN does not get the frame-end it is waiting for.

This needs further study, but I don't see it as a blocker for this
series as embedded data support is not in upstream.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v7:
- Add R-b and T-b tags
- Update comment wrt. rcar-csi2's .get_frame_desc()
- Link to v6: https://patch.msgid.link/20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com

Changes in v6:
- Rebase on v7.1, dropping the need for any dependency patches
- New patch "media: rcar-vin: Fix comment related to stride handling"
- Add comment wrt. not allowing get_frame_desc on rcar-csi2 for gen3
- Fix rcar-csi2 error recovery. In the previous version it just disabled
  and enabled the CSI2 RX, now it also disables and enables the streams
  on the source device.
- As part of the previous change, we now track enabled_sink_streams_mask
  in rcar-csi2 instead of stream_count (the previous code also wasn't
  quite right, as it assumed enable/disable streams ops would only be
  called with a single stream. which is true, but was a hidden
  assumption).
- Fix issue in rcar-csi2, v4l2_subdev_state_xlate_streams() was always
  called with RCAR_CSI2_SOURCE_VC0, instead of the actual source_pad.
- Link to v5: https://lore.kernel.org/r/20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com

Changes in v5:
- Rebase on v7.0-rc2, with the streams preparation series and
  get_frame_desc_passthrough series as dependencies
- This series is now smaller, as the non-streams parts are in the
  streams preparation series
- Fix "variable ‘format’ set but not used" warning
- Link to v4: https://lore.kernel.org/r/20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com

Changes in v4:
- Rebased on v6.18, with minor conflicts resolved
- Improved patch descriptions
- Re-ordered the patches a bit to move changes that could be applied
  without the full streams support to the beginning of the series
- Added "media: rcar-vin: Link VINs on Gen3 to a single channel on each
  CSI-2" which removes possibility of wrong routing config on Gen3
- Added "media: rcar-csi2: Improve FLD_FLD_EN macros" which was part of
  another patch in v3
- Addressed minor comments (constifyings, cosmetics)
- Fixed the missing stream_count checks in disable_streams ops
- Fixed a few instances in csisp and csi2 where
  v4l2_subdev_state_get_format() was called with hardcoded pad/stream,
  instead of using the data from the route
- Dropped unnecessary ISPPROCMODE_DT_REG register clears
- Squashed "media: rcar-csi2: Add more stream support to
  rcsi2_calc_mbps()" into a previous patch
- Dropped wrong use_isp check from csi2's rcsi2_set_routing()
- Link to v3: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com

Changes in v3:
- Rebased on top of latest linux-media
- Dropped dependencies which are already in linux-media (only remaining
  dependency is v4l2_subdev_get_frame_desc_passthrough)
- Tested on white-hawk board, using the staging deser TPG
- Also tested in a WIP branch for GMSL2 (two video streams)
- Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com

Changes in v2:
- Rebased on top of latest upstream, and updated the dependencies to
  match the latest serieses sent.
- Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
- Drop "media: rcar-csi2: Fix typo" (it was not a typo)
- Update the code in calc_mbps(). The previous method relied on
  V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
  provided via get_mbus_config().
- Dropped dependencies to Niklas' old series which doesn't apply
  cleanly. It's needed for multi-stream, but not for the current
  upstream which only has a single stream use case.
- Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com

---
Tomi Valkeinen (11):
      media: rcar-vin: Fix comment related to stride handling
      media: rcar-vin: Link VINs on Gen3 to a single channel on each CSI-2
      media: rcar-isp: Move {enable|disable}_streams() calls
      media: rcar-csi2: Move {enable|disable}_streams() calls
      media: rcar-csi2: Switch to Streams API
      media: rcar-isp: Switch to Streams API
      media: rcar-csi2: Add .get_frame_desc op
      media: rcar-isp: Call get_frame_desc to find out VC & DT
      media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
      media: rcar-csi2: Add full streams support
      media: rcar-isp: Add full streams support

 drivers/media/platform/renesas/rcar-csi2.c         | 376 ++++++++++++++++-----
 drivers/media/platform/renesas/rcar-isp/csisp.c    | 227 ++++++++++---
 .../media/platform/renesas/rcar-vin/rcar-core.c    |  27 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   2 +-
 4 files changed, 490 insertions(+), 142 deletions(-)
---
base-commit: 274af88c8acaa4bb538791047bd17fa5136ba78f
change-id: 20250219-rcar-streams-1fdea8860e5e

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

