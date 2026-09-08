Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6DB5632B1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905093; cv=none; b=Ue2k8diyuskoPw9PUiHTh2Sc9nT+wDOIcsoEEVL0B6Me1yx2zBe5yDm7FEQQuGBnMY9I/yTZK6YR1BTMagfN18a8FsuBAuITgnVuLDa/Vvhw4M8Fy8JKha3KR//QDuX4WzF5UiU3BfHQiUiAhE44PmliEKDAnU+meCNqGdV3hBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905093; c=relaxed/simple;
	bh=vZIzBwfNwkZdEhKKDxEY2qcyI69puhTbYpXcPPhLV7w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HjU9tlR9wt/onbzz6qR1zjNOuPbqk6Ty/HvnTcSMDiehDAXp8mrsKaoO+Hr/IMIkjAIowX3f8zAywZJ3cqKNrt02VyRoLisBcDXrIfNhSL43K4xGzRBio3rlTsre3alRpeaG7LeTDnXtAl5UpAtwd0D5/aWmfpO1MPuSjcQcP+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naLwAL3c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naLwAL3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5EC1F00A3A;
	Tue,  8 Sep 2026 22:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905092;
	bh=6aNh78jKyItaxRaTBc80iS+Tkw7mEfFvv18EKWjGLKY=;
	h=From:Subject:Date:To:Cc;
	b=naLwAL3cQFcD9GXdBA+KMaJTFv8lQddsQtm9QumkbVbznH2OCJKoW6MToq/dfCsl8
	 SBtmWb3Xw1M+5jbEaf6I22hyLwnN0fMf94Bt7OrPeAB2TAPzFDLC2p3K+RhEyn+0Z4
	 pl615dtXKY9OgwqIxXvXadczFRrlmatNMl2ubE8VTK9iOSXExIcRor4BIIvGr9VdpX
	 N/SQUKvr91puTJ6I4pu3R9sApZmlrAcyk1UvG2FEIGgG6/Jw1nzIEPcALsBHumBa4o
	 pde2uFc2AorIF+A5b354yODxb5xW2JpsayjDh8bzkoNskqS9lXPkycLvcUp45SI16N
	 UjsNNHUOJr4bA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 00/22] accel: ethosu: Another batch of fixes
Date: Tue, 08 Sep 2026 17:04:37 -0500
Message-Id: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQ6CMBAGX4X0bM3SQn88+R7GA+ICVdOaFhoN4
 d1t8WA08TjZb2ZnEtAbDGRXzMRjNME4m4BvCtIOje2RmnNiwoAJUExSHAcXJtqZBwaKWCuuBGo
 AIEm5e1wPyTgc3xym0wXbMTfyYjBhdP65/otl3v1Jx5IC5ZXoNDZK6rLdX9FbvG2d70luR/axN
 VQ/Nsu2FFJyJWvRVF/2siwv6il2rPkAAAA=
X-Change-ID: 20260827-ethosu-fixes-ee58386e9000
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev

This is another series of fixes to the ethosu driver. It's mostly probe 
error paths and cmd stream validation fixes. It's a mixture of 
AI reported issues, different solutions to other posted issues and 
fixes[1] and my own fixes. The last 2 patches are additional operation 
support.

The series adds rejecting OFM tranpose in cmd stream, but then 
the next to last patch adds support for it. I did this so the rejection 
can be backported, but maybe supporting OFM transpose is small enough 
that it should just be backported too?

Sashiko keeps raising issues about IRQs, but the h/w only generates an 
interrupt if a job was submitted. The scenarios sashiko talks about are 
not possible.

Rob

[1] https://lore.kernel.org/all/20260717061145.1478139-1-zhaoguohan@kylinos.cn

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
- Address Sashiko comments
- Another runtime-PM fix for driver remove()
- Add a fix for NHCWB16 bounds calculation
- Link to v2: https://patch.msgid.link/20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org

Changes in v2:
- Dropped first 5 patches which are already applied
- Patches 11-17 and 19 are new patches with more cmd stream validation
- Add fix to diable clocks on PM setup failure
- Rework the runtime-PM to suspend after initialization and before 
  drm_dev_register(). This simplifies the error clean-up in probe.
- Handle quiescing jobs before scheduler teardown
- Rework the cmd stream register initialization tracking to use a bitmap 
  of registers instead of relying on initial state values.
- Handle U85 DMA 2D/3D modes correctly
- Link to v1: https://patch.msgid.link/20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org

---
Rob Herring (Arm) (22):
      accel: ethosu: Suspend after initialization
      accel: ethosu: Ensure suspended on removal
      accel: ethosu: Fix probe error cleanup
      accel: ethosu: Disable clocks on PM setup failure
      accel: ethosu: Quiesce jobs before scheduler teardown
      accel: ethosu: Prevent command stream export
      accel: ethosu: Move DMA mode to src/dst struct
      accel: ethosu: Track command stream register setup
      accel: ethosu: Factor buffer bounds checks
      accel: ethosu: Fix NHCWB16 bounds calculation
      accel: ethosu: Validate secondary streams
      accel: ethosu: Reject unsupported commands
      accel: ethosu: Validate all feature map tiles
      accel: ethosu: Account for feature map element size
      accel: ethosu: Validate convolution parameter
      accel: ethosu: Account for kernel dilation in IFM size
      accel: ethosu: Reject reserved command encodings
      accel: ethosu: Validate accumulator input
      accel: ethosu: Restrict dynamic IFM2 weights
      accel: ethosu: Split U65 and U85 DMA length validation
      accel: ethosu: Validate OFM transpose
      accel: ethosu: Validate resize operations

 drivers/accel/ethosu/ethosu_device.h |  23 +
 drivers/accel/ethosu/ethosu_drv.c    |  27 +-
 drivers/accel/ethosu/ethosu_drv.h    |   2 +
 drivers/accel/ethosu/ethosu_gem.c    | 850 +++++++++++++++++++++++++++++++----
 drivers/accel/ethosu/ethosu_job.c    |  29 +-
 5 files changed, 840 insertions(+), 91 deletions(-)
---
base-commit: 2b39d680c9e0fb4d625f2916980977622e84248c
change-id: 20260827-ethosu-fixes-ee58386e9000

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

