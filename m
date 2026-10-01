Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254B47535F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884736; cv=none; b=SutEd8pofhBEBoQO03OMo4mERISWrxbrf46kkP3ou21d6MZdNbL0KI6p0FDRrq1EbfpjHU1Q/0Roh7wtDN2QaN2xOtg55QpYHhd+oyIfwH9/VgucRQBfxEALOMX91W2dtnsEYJKJM0bfHq7vUaCVH5DwtYGWn6NcTGLbQtMVVN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884736; c=relaxed/simple;
	bh=7biaceuF8JildUKqyYt37vlxGGuZnD3rNHSu+vAe6Do=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Or8fP2m+CyR4rVk+0v5uE2msCsF8dZaKsQ7JAEYGNh6x/vf1xEWzNkncSfd8CeLIN5c6bARGNYqLTpRNkl/3DggeiFgG3gLr0i5t3/S04t5cPmhybbc3Y+lFT2uCMI521+k2f2Z2gBm+bBW2wPOMDfae42wlaeyi+0hXe3lOjwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJY/8LEZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJY/8LEZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so4792925e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884731; x=1791489531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yd/IzBfTWyOHkp/HPfVgYP2qejoik94e/J+ry+nD4kI=;
        b=DJY/8LEZ7nixqGEpBsQNDZ4zxvRfnlXTI9UsKJiOhyyPMytvGHDZXrPm2KAHz9TXh4
         8/evz4aTBooOrawfClbKsCoYtN44vHiqnb+RfUl64b+2JAJ7OiVYuBBSupZ9PXbIeEDa
         L36ylbKZM+do7peT32Mtu2SibTqcvMgcip1b0OkHIf67h94PqxKWAPLFZlWuMIHQ3IQM
         umRfO61sBOA1oADaFEtJZbPMjN1dljloKZujMeYObzcsc/CKr7+gZ5qgyZ6N5aK63+Kz
         OQS6qt93pqQvlRMllMzdYs7A3aEfeScsdARkpkNYFT0KQ96gc2XZN/IgTEJ8I/jPwvhr
         PqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884731; x=1791489531;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yd/IzBfTWyOHkp/HPfVgYP2qejoik94e/J+ry+nD4kI=;
        b=rshdppUFg6qXvzeKp5CwkAC0Vise/7RhnQwTRtAfVy+bNvPTgszdJ96QfRsonXrc9L
         26VpRX5SiPlQ7z8tUKcMfZRDtpr4aXelvGKC9SedDbEObqG1hKmjZ3wUFMzzTYjPOBEe
         2zZDaxJZTJGMUMJqSqLI0GE3wuYnq8LUc8yK2OB++Xf3/NA8ASEIjdYv42xevsjc1QdZ
         KpTqGI8BIvldrXSIgPtOnQR3DMAUxdHUGjbAHhEkAvuvV95TlUvqbujf7ppHMMF/4hw2
         kerqv4/V8+DPwNBjxUnFtutaScUuyDWv81/dAdPMz4Qgf57hxs9tNRDWL1Yij5UbcJGw
         vFzg==
X-Forwarded-Encrypted: i=1; AKwUvByJnYNZPGDPK+SCm4pv+8fM3dm37YpzTreQsZm3FvuA0run0V6NAQuoFbYmW/a0WGSKynIJNHPAaU/QL+k=@vger.kernel.org
X-Gm-Message-State: AFuF++myQVN4RJ9ehYIt5g/U77gUf5zO6X0c7fwLPNyXBrFRzPJL3+9/
	I/Q8FumPhsbgeLecdAQZ3hwUxTYjzLRVvYtkZkNgFSo509bXvpQzNewg
X-Gm-Gg: AYBFou3Ib0yxDfHsQJCBtGaOhvBNKU3nA8CVsDC67sQ/IIyo4QwpxvPGJfjmA6fgc8H
	GeR6PeiyziaBQ4tAB+foZ+FhKyUGZV5U2X6RdK5WbhxHXC5rGEIrWPPCNt1zazond0Vc83+qyiJ
	39VdxQrw3+o7XP7p/jPZinJ2SC3Xkh2w0jbb6Os8cGd3bS/ijUp46TUjZrpAXB/qSMz+ylWbhi5
	I501qQQGeGq5aVMAudRy48mPn/uD94/zOXxn22OuhCSNut488ky630Efqn0Vgot3Lmien5S1N9f
	kFFdwlT4FLPiCul2v0LMtFXfC+vs0sPE5pzsHqgRY3qpDEiAILCajVZq2qcll/xok8tOfs1ZgZo
	NjN5qI0xsG/ArOlFXUEcsDwbWjqTwwLMmoowZp05gD6xH00LoOa7kXXe5JByrmmJ5p1NinXfKO2
	km41orI0OFpElj2++/g9si4R3WBer8tElCsJegPBgQ1Er/vLAnpGlQEeimLwQNV7fzW8WpiMzhA
	3deHzHEaNh13mJp8WGwK3k2Lw==
X-Received: by 2002:a05:600c:37cf:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a027596b61mr9056685e9.25.1790884730937;
        Thu, 01 Oct 2026 12:58:50 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:50 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 00/13] Add splash DRM client
Date: Thu,  1 Oct 2026 21:58:34 +0200
Message-Id: <20261001195847.141192-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the fourth version of Francesco's splash client, which I have
taken over with his agreement [1]. It also supersedes my "Boot logo
supplied by the device tree" series [2]: Thomas pointed out that fbdev
is not the place for it and that the device tree support belongs here
[3], and he was right.

The client draws a splash from the moment the display driver registers
until userspace takes the display over. On top of what v3 did, the image
can now come from the device tree, be placed and turned, and every part
of that can be set from the command line. Patch 13 documents it all and
adds it to the DRM client documentation.

Why this is in the kernel
-------------------------

Maxime asked in v1 why this should not be left to userspace or to the
bootloader. The cases it is for are the ones neither covers:

  - Nothing initialises the display before the kernel does. U-Boot's
    Falcon mode, meant to cut boot time, starts the kernel from the SPL
    and never runs U-Boot proper, where display support lives: there is
    no bootloader splash to hand over, and the device tree is the only
    thing that reaches the kernel. Userspace comes seconds later.

  - One kernel image for several products. An image built into the
    kernel, with CONFIG_EXTRA_FIRMWARE, means one kernel per logo, or
    every logo in every product's kernel, all of them staying in memory
    for good. Francesco described exactly this case in v2: one board
    support package for a family of devices, each with its own logo and
    background, picked by the bootloader.

  - A splash handed over from the bootloader does not always survive the
    native driver taking over the display.

Where the image comes from
--------------------------

In this order: a BMP named on the command line, the device tree, the
EFI BGRT, and "drm_splash.bmp" loaded as firmware; with none of them,
only the background is drawn.

The device tree node lives under /chosen (patch 6) and carries the BMP
either in the node, which dtc fills in with /incbin/, or in a reserved
memory region the bootloader loaded it into. The region keeps the image
out of the device tree, so that it can be changed from userspace by
updating a partition, as Francesco suggested. A node is only there if
someone put it there for that board, so it goes before the BGRT.

The command line wins over everything else, each parameter for its own
part only, as console= wins over stdout-path: splash_bmp (or "none"),
splash_color, splash_pos, splash_offset and splash_rotation. Without it
a BMP loaded as firmware could be neither placed nor turned, and it lets
a placement be tried without rebuilding a device tree.

Placement uses a position with -1 centring an axis, plus an offset, in
screen pixels. A rotation turns the image and not the screen, counter
clockwise as for panels and as DRM_MODE_ROTATE_* count. A device tree
image is placed as its node says, a BGRT image at the table offsets, and
anything else is centred; placement given on the command line applies
whatever the source.

BGRT images with the ACPI 6.2 orientation bits set are no longer skipped
but turned (patch 11). I took the meaning of the bits and of the offsets
from Plymouth, the main user of the BGRT, so that the kernel and
Plymouth put the image in the same place and the handover does not
jump. I have not found the specification text to check against;
corrections are welcome.

Changes since v3
----------------

Fixes to Francesco's patches, folded in and listed in the commit notes;
most of them were also in sashiko's review of v3 [4]:

  - the render thread stayed in TASK_UNINTERRUPTIBLE for good when the
    BMP firmware was missing (hung task warning), could miss a wake up,
    and kthread_stop() was called on a thread that had already exited
    (use-after-free), never existed or failed to start;
  - a use-after-free on unbind: the image was released after
    drm_client_release(), which frees the client;
  - a use-after-free in the firmware callback when the device goes away
    first, as the request cannot be cancelled; unregister now waits;
  - the BMP bounds check could overflow and let a crafted bitmap offset
    read 4 GiB away;
  - the 24 bit blitters read a byte past the image;
  - buffers went to the wrong modesets when one was skipped, tiled
    groups dereferenced a buffer before creating it and swapped width
    and height, a failed dumb buffer left an ERR_PTR behind, and the
    modeset list was walked without modeset_mutex;
  - the BGRT symbols are exported (Mario's report [5]), GPL only;
  - the DRM_CLIENT_DEFAULT entry is indented with tabs (patch 1).

Additions: the device tree source and its binding, placement, rotation,
the background colour following the image, BGRT orientation, the
command line parameters, and the documentation.

Testing
-------

  - QEMU versatilepb (pl111, 16 bpp): 39 cases for the device tree
    source (inline and region, invalid nodes, placement, clamping,
    rotations, rows with and without padding, backgrounds), plus 17 for
    the command line and the order of the sources, each compared pixel
    by pixel.
  - QEMU virt arm64 (virtio-gpu, 32 bpp) and x86-64 with OVMF for the
    BGRT, including forced orientation bits.
  - KASAN on arm64, with the BMP loaded as firmware and the driver
    unbound afterwards: v3 reports the out-of-bounds read, the
    use-after-frees and hangs on unbind; this version reports nothing.
    The firmware callback race was reproduced with the sysfs fallback,
    and a BMP with a crafted bitmap offset oopses v3 and is rejected
    here.
  - An AM335x board (tilcdc, 800x480 panel of which only the bottom 297
    lines are visible, 16 bpp), booting over TFTP and NFS: 27 cases,
    plus 9 with the BMP loaded as firmware from an initramfs, checked
    by reading the scanout buffer back through /dev/mem.
  - W=1 and sparse clean; every patch builds on its own on arm and
    x86-64; checkpatch --strict clean apart from a quoted modpost line
    and the MAINTAINERS reminder answered by the next patch;
    dt_binding_check clean for the binding.

Not tested: tiled displays (I have none), a BGRT with orientation bits
from real firmware, the modeset fix with a skipped modeset ahead of a
used one, and Falcon mode with this series.

Open questions
--------------

  - Rob: how the image should be described, a BMP in a property or raw
    pixels described like simple-framebuffer [6]. The binding here uses
    the BMP; the client would need a second drawing path for the other.
  - Once the binding settles I will send the dt-schema change that lets
    the node live under /chosen; until then dtbs_check flags it.
  - The splash is a DRM client, so a device using it has no fbdev
    emulation and no /dev/fb0. That rules it out where userspace still
    draws through fbdev.

To Francesco: I listed you as maintainer of the binding too, next to me,
as co-maintainer of the client that reads it. Say if you would rather
not be.

Based on drm-misc-next as of 2026-10-01 (7c4bda20eb0f).

[1] https://lore.kernel.org/all/aryqYhHqFk3cXh9d@bywater/
[2] https://lore.kernel.org/all/20260923201035.51007-1-maximpedraza@gmail.com/
[3] https://lore.kernel.org/all/64e273d4-2660-437d-8871-e2bfa3c377c9@suse.de/
[4] https://sashiko.dev/#/patchset/20260510-drm_client_splash-v3-0-a9aee9f0b2fc%40valla.it
[5] https://lore.kernel.org/dri-devel/5d7067de-97b7-4232-9cf6-e4b978696482@amd.com/
[6] https://lore.kernel.org/all/CAEUXW=Gh6wMk1i=x_KT0eSdkHeHs8Hkxkj4hfsuTRyY6=aphpw@mail.gmail.com/

v3: https://lore.kernel.org/r/20260510-drm_client_splash-v3-0-a9aee9f0b2fc@valla.it
v2: https://lore.kernel.org/r/20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it
v1: https://lore.kernel.org/r/20251027-drm_client_splash-v1-0-00698933b34a@valla.it

Màxim

Francesco Valla (3):
  drm: client: add splash client
  MAINTAINERS: add entry for DRM splash client
  drm: docs: remove bootsplash from TODO

Màxim Pedraza Padilla (10):
  drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
  efi: bgrt: export the BGRT table and image size
  dt-bindings: display: add a boot logo node under /chosen
  drm/client: splash: add a device tree image source
  drm/client: splash: place the device tree image where it asks
  drm/client: splash: turn the device tree image as it asks
  drm/client: splash: take the background colour from the image source
  drm/client: splash: turn the BGRT image on panels mounted turned
  drm/client: splash: prefer what the command line asks for
  drm/client: splash: document the image sources and parameters

 .../bindings/display/boot-logo.yaml           |  151 ++
 Documentation/gpu/drm-client.rst              |    6 +
 Documentation/gpu/todo.rst                    |   17 -
 MAINTAINERS                                   |    9 +
 drivers/firmware/efi/efi-bgrt.c               |    3 +
 drivers/gpu/drm/clients/Kconfig               |   91 +-
 drivers/gpu/drm/clients/Makefile              |    1 +
 drivers/gpu/drm/clients/drm_client_internal.h |    9 +
 drivers/gpu/drm/clients/drm_client_setup.c    |    8 +
 drivers/gpu/drm/clients/drm_splash.c          | 1471 +++++++++++++++++
 10 files changed, 1743 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/boot-logo.yaml
 create mode 100644 drivers/gpu/drm/clients/drm_splash.c


base-commit: 7c4bda20eb0f150315d19f1b51058820e75d3f3d
-- 
2.39.5

