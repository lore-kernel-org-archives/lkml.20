Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2201A5733E;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852716; cv=none; b=qiKuQ0tDswR5XDBy0N+vXkwiN6kHbSSCCaoCbu2nzn99AnZwmDlr52foerePqe3Afn/IIWGrcx9t2VP9A9HRKF3CJNCTSFXv9VoAT1nZZhG8FW1U0Lmgq6573Gn3rMZyW63SYDOdTGOeSDz+SV4IMOob1lidWJ2j1+SP/iwyXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852716; c=relaxed/simple;
	bh=HSQ5fMMpieSHne9PXBY8Jwj5Celx9/SxEZci1gQTyqY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VcGSwo+GcINjkVdauwZrqYO9ReZvqn8dIatZumCxm5Z1WEh7zxnLq0OgEZUBltxzaCTC9Tvk/eBr4zwaro2XW8AskpdzIerEKXL0O1trR/SXYEhTFEbiP8V+e/0sJmsPT27RZJnbn0OFvGr7sk5R6hn8TmTt1Dy7iEcon5ctGjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNzcYJPn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNzcYJPn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25727C19425;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787852715;
	bh=HSQ5fMMpieSHne9PXBY8Jwj5Celx9/SxEZci1gQTyqY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fNzcYJPnnPZZqB4QTDJve8a3HJqcr0tkVc6XQHQwNcrri7avJLZiv8bMDxsSsg+Id
	 9otP3zQiYDR5bjCO3e82DC+nNJEQjUs312rK2AJT8qLaTgWSZPlY2X7qy+VltEb0WC
	 7iYwQbcfpXp5OWL6TTSiwNwHTMylPfB0japDUmqxUM2C3c06LtcNdGEcB04YQdxrIC
	 vGMYxllgGt8/Qa1wZfyzncl54qEyX48a9ZIUl/nZRpRFE/DHN3IQQN01UT7M9vwiJb
	 1M4x1Wib2RRIGNgC/DZG0YIQ0gQrMHcsXJcp9czeFeBYbEVopvLMYW7PHvR7QG05bG
	 639ycvkuNBaSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00332C61DC2;
	Thu, 27 Aug 2026 17:45:14 +0000 (UTC)
From: Nick Faro via B4 Relay <devnull+yux50000.hotmail.com@kernel.org>
Subject: [PATCH 0/6] media: cx231xx: make USB disconnect teardown safe
Date: Thu, 27 Aug 2026 19:44:10 +0200
Message-Id: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGp3kGoC/x3MQQ6CMBAF0KuQWTsRxijqVYiLMnxkEltM25gmh
 LtbXb7N2yghGhLdm40iPpZsDRXdoSFdXHiCbaomaeXSXqVnLXLqSuHJkq4hQDO/bEY2D+576c6
 3GRAVqsM7Yrby34dH9egSeIwu6PI7PSZzrKv3ljNiOgaUTPv+BYg+HQWVAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Faro <yux50000@hotmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787852712; l=5267;
 i=yux50000@hotmail.com; s=20260827; h=from:subject:message-id;
 bh=HSQ5fMMpieSHne9PXBY8Jwj5Celx9/SxEZci1gQTyqY=;
 b=1CA9SXe6n72ibvEbM67SiI5JI0m7XOvdv8ygf9TMm4Ee8vBjLK6gqJ452bKc43K/Bg2hkFQPq
 +TPRmgKVvmKDlN4AM3HCXeDbWqebgbP+WVpv22BMbpmhTFep9WieJ+A
X-Developer-Key: i=yux50000@hotmail.com; a=ed25519;
 pk=FMSCCFHmUW8ylFpPOeaegUBqrRhzdMS2snqX/kNbLtM=
X-Endpoint-Received: by B4 Relay for yux50000@hotmail.com/20260827 with
 auth_id=979
X-Original-From: Nick Faro <yux50000@hotmail.com>
Reply-To: yux50000@hotmail.com

The cx231xx disconnect path can tear down the USB-owned device state while
open V4L2 or ALSA file handles still reference it. It can also leave nodes
registered when an analog video file is open, and completion handlers can
continue resubmitting URBs while disconnect is trying to kill them.

I encountered this with an Elgato Video Capture V2 (USB 0fd9:0037) while
streaming across a suspend-to-idle/resume cycle. On mainline 7.2.0, resume
re-probed the USB device while the previous cx231xx instance remained partly
registered. The reprobe warned about duplicate I2C-mux sysfs entries. Running
v4l2-ctl --list-devices then logged "refcount_t: saturated; leaking memory"
and triggered a general protection fault in v4l2_open().

The reproducer is:

  1. Start an indefinite capture, for example:

       v4l2-ctl -d /dev/video4 --stream-mmap=3 --stream-poll

  2. Suspend the machine to s2idle while the capture remains open.
  3. Resume, stop the capture process, and inspect the devices with:

       v4l2-ctl --list-devices

  4. Unplug and reconnect the capture device.

The series gives the shared device state the lifetime of its V4L2 and ALSA
users rather than the USB interface. Disconnect now unregisters all public
nodes, stops URB resubmission, and prevents late file operations from issuing
commands to absent hardware. Software-only close and buffer cleanup remain
available so existing file handles can release normally.

The final patch is an independent allocation-size correction found while
reviewing the endpoint-array ownership changed by the first patch.

The patches are:

  1. Keep shared device state alive until its final V4L2 reference.
  2. Stop video and VBI completion handlers resubmitting URBs after
     disconnect.
  3. Reject late V4L2 hardware operations while preserving software cleanup.
  4. Make ALSA work, callbacks, close, and card teardown disconnect-safe.
  5. Always unregister the driver's public nodes during USB disconnect.
  6. Allocate alternate-setting arrays by element count and element size.

Testing performed so far:

  - Built the cx231xx modules at every commit with W=1 against Ubuntu's
    7.2.0-070200-generic headers using GCC 14.
  - Loaded the patched modules with an Elgato Video Capture V2. The video,
    VBI, and media nodes registered, and ordinary video capture worked.
  - git diff --check passes.
  - scripts/checkpatch.pl --strict --max-line-length=80 reports no errors,
    warnings, or checks for any of the six commits.

  - v4l2-compliance 1.26.1 results with a valid NTSC signal:

      v4l2-compliance -d /dev/video4 -s 120
      Total: 76, Succeeded: 76, Failed: 0, Warnings: 28

      v4l2-compliance -V /dev/vbi0 -s 120
      Total: 76, Succeeded: 76, Failed: 0, Warnings: 18

      v4l2-compliance -m /dev/media2
      Grand Total: 148, Succeeded: 148, Failed: 0, Warnings: 42

    The warnings concern the existing audio-control ranges and values not
    aligning to their reported step, unsupported VIDIOC_CREATE_BUFS, and the
    video node accepting invalid pixel formats in TRY_FMT and S_FMT.

  - Repeated the active-capture suspend-to-idle/resume cycle once with a
    userspace V4L2 capture application holding /dev/video4 open, and did 3
    cycles of unplugging the USB while streaming. On resume, the old video and
    VBI nodes were unregistered, the Elgato re-probed and registered one new set
    of nodes, and capture worked after reopening. v4l2-ctl --list-devices
    returned promptly. The kernel log contained no cx231xx warning, duplicate
    I2C-mux entry, refcount error, or oops.

Codex using the gpt-5.6-sol model assisted with all six patches. It was used to
inspect the cx231xx driver and comparable media drivers, propose and revise the
lifetime and teardown changes, split the result into single-purpose commits,
draft changelogs, and assist with style and build validation. The interaction
was an iterative review driven by hunk-by-hunk review, rather than a single
generation prompt.

The submitter reviewed the resulting code commit by commit and is responsible
for the final submission.

---
Nick Faro (6):
      media: cx231xx: keep device state alive until final release
      media: cx231xx: stop resubmitting URBs after disconnect
      media: cx231xx: reject V4L2 operations after disconnect
      media: cx231xx: make ALSA teardown disconnect-safe
      media: cx231xx: always unregister nodes on USB disconnect
      media: cx231xx: size alternate-setting arrays by element count

 drivers/media/usb/cx231xx/cx231xx-417.c   |  44 +++++++++---
 drivers/media/usb/cx231xx/cx231xx-audio.c |  67 +++++++++++++++----
 drivers/media/usb/cx231xx/cx231xx-cards.c | 107 ++++++++++++++++++++++--------
 drivers/media/usb/cx231xx/cx231xx-core.c  |  16 ++++-
 drivers/media/usb/cx231xx/cx231xx-vbi.c   |  11 +++
 drivers/media/usb/cx231xx/cx231xx-video.c |  30 ++++++---
 drivers/media/usb/cx231xx/cx231xx.h       |   1 +
 7 files changed, 214 insertions(+), 62 deletions(-)
---
base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
change-id: 20260827-cx231xx-disconnect-lifetime-772159fee2c2

Best regards,
-- 
Nick Faro <yux50000@hotmail.com>


