Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D31365A0B;
	Thu,  1 Oct 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859333; cv=none; b=NgmzQrIuU+0NZzxWdJRFPh9b4E+QsPzl5lRYDf9kzERyA2xe7IdMo+HD3VDtN1wSKjs/KtzXIo7TBVVPGfMoNidYiDrh1fEmlYSKAmlYzXwxMbNYqpiT4dQXjxRBQAzWKlfxtjyJtdm1rqroTaNc/7mwA2DcNS1aOF4PxmnV+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859333; c=relaxed/simple;
	bh=nHUcQKEhg5F7eEtFgQyhKTIv/j0ZgjNJD/3JwdefJFY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Es1Yg7CtJOzfqx+Uwo0+LkPo3Y7KgjmXlE6n+ccvVPvgYTk9j9hYwhKjJBhGgUQ9VfTwjBmL4p6vHSjM42RlXrBE0xeyW9+i31oIzSW9p1ZepdI3Kv3qWhc1f8LYCP84Y8L6kn4QKvyBmNdrEfQB+Pl8lJ1ufIDlTmBRi2BKKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLP0IIkL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLP0IIkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6601F00898;
	Thu,  1 Oct 2026 12:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859330;
	bh=4LjABiJyToG4cLHRKipSfjV59PeKloY3ckldoBmynKA=;
	h=From:Subject:Date:To:Cc;
	b=MLP0IIkLcIrjtTYyj2CNxyUeYYST7BZXZ+HYtP91QBubTa5FbMyZeLKBxuZT//KeG
	 kzlVGTDHG0KjV1+azuASfMCSafIyHs7FPqUzDzU81xfSHkpavLa0OGzBk2s/McSsAL
	 rlZ4NRVY3q/xEvfAWGnh36JzyXkhPdTZiNRfKe+mbJ4pZwE7GxiWxX9+GBR0me6xLE
	 VMtDirDKHysOWYGEDpnT3OAHjI0ibh5Fg3OTJCIfyaNsTUpnQS1R4FuhaXB9XfteGG
	 6Lmwn5zDkVDux2ZeNmTeCgO63l02I9HZFoTbNe1XBMG2RjAiLal/awQpfnXOCHzvjt
	 rYUBpLtPMHdvQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
Date: Thu, 01 Oct 2026 14:55:18 +0200
Message-Id: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpAQBCA4VfRnE2tWSmuygO4yoE1mNLSjqTk3
 W2O3+H/H1AOwgpV8kDgS1R2H5GlCbh18AujTNFAhgpTksUr3wiVve4BJz7ZnWhpMCOVtnAugxg
 egWe5/2kHbVND/74fXIH3RGkAAAA=
X-Change-ID: 20260923-v4l2-sensor-detect-32a0b2936cc1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5629;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=nHUcQKEhg5F7eEtFgQyhKTIv/j0ZgjNJD/3JwdefJFY=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqvlg+cpa9RS7ywOQ9cYpQpF/W4WqVuPKcP77vn
 6on+IrQZTOJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar5YPgAKCRAZDR20Zk4Z
 NW7wB/453YOMozWY/zEDAXuPSxNipj7NuQ/XtPAUVnSCg/kxD6FWR5QbJ1WKRh5f52+pB8k4GLw
 rVyrVSBbP80THx2hQfVGnI+nUVHtHNECK5gKokVd1+OLd81aRPPbrVmkZTNPwzfXg8Dg9FKbFZC
 BvddHkpt+pAtWR2t1posa5OMAJxYEUSmI9uetTJVzfMKV9JzjNs097yk55TtpmbC91XmCCALnF6
 8J90g9lNM9f5JHb3G5gY1NyMuznEiENsFzKs+lGkOlK/d+4jooNwDURSr3JB9QM6XUL0xclGBuC
 FK6pQwSvL1VDM3FmHODdma6WzbVNsKJTZCp+J5N8qNkErFv9
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

On media-centric camera pipelines, every entity is known at boot time
and described statically (for example via device-tree).

The V4L2 framework assumes that every entity of the camera
pipeline is always present. This is a reasonable assumption for
integrated cameras in laptops or phones. However, in automotive systems,
cameras (e.g. rear-view or surround-view) can be damaged or disconnected.
When the framework assumes all sensors are present, a single missing
camera can prevent the entire pipeline from operating.

This is a known problem and has been discussed at media summit a couple of times:
https://www.linuxtv.org/downloads/presentations/media_summit_2026/Michael%20-%20The%20Butterfly%20Effect.pdf
https://www.linuxtv.org/news.php?entry=2022-11-14-0.hverkuil

For example, in the following pipeline:
"""
  imx219  9-0010 -> ds90ub953 7-0044 -> ds90ub960 pad0 -+
                                                        |-- pad4 -> cdns_csi2rx -> ticsi2rx
  imx219 10-0010 -> ds90ub953 7-0045 -> ds90ub960 pad1 -+
"""

If imx219 9-0010 fails to probe, media-ctl -p will show:
"""
                    ds90ub953 7-0044 -> ds90ub960 pad0 -+
                                                        |-- pad4 -> cdns_csi2rx -> ticsi2rx
  imx219 10-0010 -> ds90ub953 7-0045 -> ds90ub960 pad1 -+
"""

Now, if ds90ub953 7-0044 fails to probe(), media-ctl -p will only show the
following topology:
"""
                                                                    cdns_csi2rx -> ticsi2rx
"""

Which is unexpected - we should be able to use the imx219 10-0010 sensor
if it's connected.
Also, the media graph should reflect the hardware topology, not just
what's currently working. This way, userspace can distinguish
"camera X is disconnected" from "camera X does not exist".

Applications thus need to know if a sensor or an entity is missing, and
to react when it becomes available, or when an available one becomes
missing.

To solve this, we chose to go for a simple solution inspired by
DRM connectors: we created an ioctl for subdevs to report their
current connection status.
This allows applications to discover a sensor state when discovering
the graph.
The current status is then polled or updated on a regular basis and
reported as a uevent every time it changes, allowing applications to
react.
This mandates that the sensor driver can probe even when the device is
not connected.

This has the benefits of being fairly simple to implement, understand
and support in drivers.

The major downside however is that it will require to modify every
driver since we're breaking away from the current pattern of not
probing if the device isn't available.

The last three patches implement this pattern switch for the
imx219 driver.

With this, we can hot-plug the sensor and get notified via a udev
script to start a capture:

Oct 01 12:02:38 am69-sk run_capture[1463]: /dev/v4l-subdev6 is disconnected
[   69.258616] imx219 10-0010: Error reading reg 0x0000: -121
[   69.264182] imx219 10-0010: Error reading reg 0x0000: -121
[   71.306593] imx219 10-0010: Error reading reg 0x0000: -121
[   71.312158] imx219 10-0010: Error reading reg 0x0000: -121
Oct 01 12:02:44 am69-sk run_capture[1480]: /dev/v4l-subdev6 is connected
Oct 01 12:02:44 am69-sk run_capture[1481]: /dev/v4l-subdev6: Setting up routes
Oct 01 12:02:44 am69-sk run_capture[1487]: /dev/v4l-subdev6: Setting up format for imx219 10-0010
Oct 01 12:02:44 am69-sk run_capture[1489]: /dev/v4l-subdev6: Setting up format for remaining entities
Oct 01 12:02:44 am69-sk run_capture[1506]: /dev/v4l-subdev6: Starting capture on /dev/video5

The code for this demo is available at:
https://gitlab.com/-/snippets/6064180

Current known limitations:
- Only leaf entities (typically sensor nodes) are covered. We should
  also address entities that are in the middle of the media graph

- We don't handle the case where we attempt to stream on a disconnected
  sensor.

- The media graph is not updated to reflect the sensor's presence/absence.
  I have assumed that the media graph must reflect the hardware
  description (i.e. the device-tree) of the pipeline, not the actual
  real state (when a sensor is missing for example). Is that a wrong
  assumption?

I don't expect this approach to be useable or mergeable as is but rather
to use this as a starting point for discussions at Plumbers and on the
mailing list.

This has been tested on a SK-AM69 board on top of the following series:
https://lore.kernel.org/all/20260824121451.3348583-1-sakari.ailus@linux.intel.com/

Thanks,
Mattijs

---
Mattijs Korpershoek (5):
      media: imx219: Move LP-11 state switch to power_on()
      media: v4l2-subdev: Add new ioctl for connection status
      media: imx219: Allow driver probe with missing sensor
      media: imx219: Implement .detect() sensor operation
      media: imx219: Add status polling using .detect()

 .../userspace-api/media/v4l/user-func.rst          |   1 +
 .../v4l/vidioc-subdev-g-connection-status.rst      |  89 ++++++++++
 drivers/media/i2c/imx219.c                         | 191 ++++++++++++++-------
 drivers/media/v4l2-core/v4l2-subdev.c              |   8 +
 include/media/v4l2-subdev.h                        |   3 +
 include/uapi/linux/v4l2-subdev.h                   |  12 ++
 6 files changed, 245 insertions(+), 59 deletions(-)
---
base-commit: fe2ec83746e501645709761605c2464a44fd2929
change-id: 20260923-v4l2-sensor-detect-32a0b2936cc1

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>

