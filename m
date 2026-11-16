Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.182.77.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827270;
	b=muBzrmPgjJqptE4xX+GLWKWJLa2CDgEdL52HZ7YheevJfLoSl5msRfS/nBd84nbrcDH9
	 IsDV2Zzp80EEs6IExZs7Z99BOJcHq+r4hDqO7fpP8uzUhZYKkzpFGOGwhAjrS8jCqQwpj
	 7tv/pKmGwmzpiGmCfKl7cEA9PVXr9IVBWe4r8fx0y1pWhrUB5gq8gocQGt5EvytruvU5v
	 51n6eOrEZsFXhd2lEMOcBtjOKanTuP08Jdtdk08sP1eJYg2W+kHOp0pi6wlrHmR7dbUTJ
	 Wqy9RmtIZjEbUA6MfbSwdkwLfCBMrwsA8lJpsMd31LF0oEHS00AkppbIE4d5iL7P9xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827270;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=2crvVlQ0qrNcT4X3yeFwrEOwN+ga0vW6noWwACc1vro=;
	b=oHP8dCPHob31Y6ETmfFSpljz0Vu2LJpU1i8wpCwj5zn6bKTsVi2Yjqki7FFxw1j/kiFH
	 nLPeuzIsSC+MoDzYLJgV70WZoSGRg3TyFbUD8M+WOBoFhvUh4UA6xyn+yjVnxZ8O1vWyh
	 Vwuy4YguYf0LJQmeqE9dhNaOSBBZr8tPFpXRjTlbMrHu6fA458CuBFdJNwj2OS8oRi9S/
	 y8wU8JRiA1f49b3swb5xpy4MkMGCz3F5T9Qw9kCyrIaOEnWOsFwOoSeRdTwCWj3NI2Pzj
	 2tgcaJZg7lXWhq5JTFLzNEYL4DRgMlWM6GsL4FHEDoLqFDNy/LfDP5tdBop7R8d+ucg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baryla.org;
	spf=pass smtp.mailfrom=baryla.org;
	dkim=pass header.d=baryla.org header.i=@baryla.org header.a=rsa-sha256 header.s=dkim header.b=CzMoaRSw;
	arc=none smtp.remote-ip=217.182.77.61
Received: from mail.baryla.org (mail.baryla.org [217.182.77.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA6A606B1BE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA6A606B1BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baryla.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baryla.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baryla.org header.i=@baryla.org header.a=rsa-sha256 header.s=dkim header.b=CzMoaRSw
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57ECE7460F7;
	Mon, 16 Nov 2026 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baryla.org; s=dkim;
	t=1794827259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2crvVlQ0qrNcT4X3yeFwrEOwN+ga0vW6noWwACc1vro=;
	b=CzMoaRSwq1oY44fRqo+f19AVaWdsYumJbYOERqIIuQZ6lstvEWuIfw9yehx/2gQP/o47md
	nVH4fjt7bTTvVjKl2FoRDtwJ0nDhyxhQMOX46QG0Fp35RA5kvacuRBwL2hxYNKTOmba/W9
	8FumqApHdchGhtdmhZMdyoyY32avTY20Ym56CE2vzanVyV2mObmDmn5g6adlhkCkf5aetq
	+9mkoS4yVPhZiIja5KJv46wmowet2Pcd4klxTDaMMNIfJ1kufkwlLeHHomFMud69CYuBLz
	wMA1XS11apnM/2UZu3U+dYknpxIHHUGjcF3/BdFG1vmoU11Q38LSzdC51Ua7PQ==
From: =?utf-8?q?Karol_Bary=C5=82a?= <git@baryla.org>
Subject: [PATCH 0/2] drm/amd/display: Skip the MST last link check for
 logical ports
Date: Mon, 16 Nov 2026 12:07:31 +0100
Message-Id: <20261116-mst-logical-port-v1-0-6b446ebe75e7@baryla.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQrDIBAF0KsMf50BjZBar1K6EDNJB2wMGkIge
 PdC3wHejSZVpSHQjSqnNi0bAtmBkD5xW4V1RiCMZpystRN/28G5rJpi5r3Ug13y0bvnwzsjGAh
 7lUWvf/l69/4D8TyLEWIAAAA=
X-Change-ID: 20261116-mst-logical-port-3c8a8397830e
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Zaeem Mohamed <zaeem.mohamed@amd.com>, Wayne Lin <wayne.lin@amd.com>, 
 Jerry Zuo <jerry.zuo@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Karol_Bary=C5=82a?= <git@baryla.org>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series fixes a missing 3840x2160@120 mode on a Dell U3225QE, a
monitor with a built-in USB4 hub and MST branch device, connected to a
laptop over USB4.

After every USB4 plug-in, 3840x2160@120 RGB is not available for the
U3225QE panel. It comes back after a monitor power cycle and is lost
again on the next plug-in. Up to 7.2 the mode is missing from the mode
list. Since commit 0b0ff65d3ca1 ("drm/amd/display: Refactor stream
validation") in 7.3, it is offered as YCbCr 4:2:2 without DSC instead,
and "Mode Validation Warning: Viewport size failed validation." is
logged on every atomic check.

The mode needs DSC: uncompressed it needs 28.5 Gbit/s, and the HBR3 x4
link gives 25.1 Gbit/s. The panel is on logical port 8 of the monitor's
branch device, and DSC is decoded at that port, so
dm_dp_mst_is_port_support_mode() checks the "last link" after it. It
reads DP_LINK_BW_SET and DP_LANE_COUNT_SET of the port once, caches the
result, and rejects modes whose uncompressed rate does not fit.

A logical port is the branch device's own internal sink, so no DP link
follows it. On this monitor its registers seem to show the state of the
monitor's internal link while it trains. DPCD 0x100-0x108 of port 8,
captured with bpftrace:

  when                  driver's read                 read ~1 s later
  after USB4 plug-in    06 01 00 00 00 00 00 00 01    1e 84 00 02 02 02 02 10 01
  after power cycle     06 04 00 00 00 00 00 00 00    1e 84 00 02 02 02 02 10 01

0x100 is DP_LINK_BW_SET, 0x101 is DP_LANE_COUNT_SET (bit 7 is enhanced
framing) and 0x108 is DP_MAIN_LINK_CHANNEL_CODING_SET.

After a plug-in the driver sees RBR x1 (1.26 Gbit/s) and drops the
mode. After a power cycle it reads before the channel coding is set,
gets no bandwidth, and skips the check. Even the settled value, HBR3
x4, is too slow for the uncompressed mode, so reading the registers
later would not help.

Patch 1 skips the last link check for logical ports. Physical ports
keep it. Patch 2 adds KUnit tests.

Testing:
- Reproduced on a Lenovo IdeaPad Pro 5 16AHP9 (Ryzen 7 8845HS, Radeon
  780M, DCN 3.1.4) and a ThinkPad P14s (Ryzen AI 7 PRO 350, Radeon
  860M, DCN 3.5), with a Dell U2515H daisy-chained from the U3225QE's DP
  output, on Fedora kernels 7.2.4 and 7.3.3.
- With patch 1 applied to the amdgpu module of Fedora's 7.3.3, on both
  laptops every plug-in gives 3840x2160@120 RGB 8 bpc with DSC
  (4 slices, 16 bpp), and there are no Viewport size warnings.
- Without patch 1, the new logical port test (from patch 2) fails.
- Not tested: other MST hubs, or other monitors with logical ports.

Physical ports read and cache the same registers in the same way, so
they may have the same timing problem. I have no hardware to check
that, and this series does not change it.

How this was made: I used an AI coding assistant (Claude Code with
Claude Opus 5.5) to investigate the problem, write the bpftrace script
and the patches, and draft the messages. I ran all the hardware tests
myself and reviewed and edited the patches, tests and messages. Before
posting the bug report and this series, I spent time understanding the
problem and the solution well enough to feel that posting this makes
sense. DP, MST and DSC are not areas I know well, and this is my first
attempt at contributing to the kernel, so please point out anything
that looks wrong, and I am sorry in advance if I did not adhere to some
kernel requirement or convention.

The bug report has dmesg logs, the MST topology and the bpftrace
script:
https://gitlab.freedesktop.org/drm/amd/-/work_items/6142

Signed-off-by: Karol Baryła <git@baryla.org>
---
Karol Baryła (2):
      drm/amd/display: Skip the MST last link check for logical ports
      drm/amd/display: Add KUnit tests for the MST last link check on logical ports

 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 13 ++++--
 .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c     | 47 ++++++++++++++++++++++
 2 files changed, 57 insertions(+), 3 deletions(-)
---
base-commit: 47df73aa49d1988c8f684b7caf8be6570e966844
change-id: 20261116-mst-logical-port-3c8a8397830e

Best regards,
-- 
Karol Baryła <git@baryla.org>

