Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D6F42464B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928963; cv=pass; b=DCq4Xyphyc5qgEsDXiBQ4rhsiWPgTe5TiMee3s3CcwXYWzM6cu19FLSh42czP6IJZq0x6ZTzF18lkvrRyD5TZNwimsx1OBdfiXTFTDvE+D7Rm8C7K+SfMsCpfKtkfNcQvQTk+QmWdwmBeKIaX31WON6eHTKdqegjtjkYWepzbYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928963; c=relaxed/simple;
	bh=LVNDiT1X/QOzPtcr4Q/aCqhJ5KW4LJEAvqGBa3y400o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=P1gYfHtlpcb2wZd7N1+6TPJR+mXAyZVcnk7PNiuYi5Ji5v0oAL8hjTBB5lWpmyBTYTlTw91KvYnqjDTE3BrT2Za1NpouBZoPQJMtnAU9AbN20G8K6Xdvm1KzxrRfYuSIkncrmZNWVsI21PmCXw8S2vddAbv9fwa3fMQ6ShBNZxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojVygEpE; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojVygEpE"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f3eae7ed7cso830576b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790928957; cv=none;
        d=google.com; s=arc-20260327;
        b=pn08xf6XGfN0ddPHs0tAp5POJzjKK2oRRdUzwoagaipg2XemeBihEWrVxePln5FHWY
         M9eH/F0y6wSR2wBsYajXnNUzCCJUov0/a4PTXfc2xkzPuXu8/YUQzLww5/To4ZiRVIhV
         RM8rmwy/RCX3UXMjgDpshBCA2noL35jR31QR18sQYnvQAE05qa7m+pIPfl+5fniG4Ouo
         6DVEyhqYX7vf8fnGGG6WoF7ycdckfpFNng4HikdEXqd6I/3qmJGZP9fh4y3h/bfhVmNN
         AR9Dqo1L8WzxnWAOojelrLEuUvIIDgG9nvhR4+Lrmv0WNUiycRyq+hCWJZAGx8tE5mV5
         zetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vNMZyVK6pFlVTsgLLDPqKMJcnVZLWeRSVSS4Za1mR0k=;
        fh=xofRY62cLLnF8wit4xR4/2ENtoPTCnFhNQDVCY5Xy94=;
        b=qQ7NBCTKcbuGxQx1QU7kEbJpXhAOY/VLXTuB/ghq5L8Vv00Bq+dQHPbgBGMOqCXMQy
         FhlIGSBliaBZdv1tH3EWoVZ1TpZFvl//zqJJDppgs5vCexSfjUVBJrha8IJSMZz8IE3w
         Iho0feRYHpEu8/t9+xVNCBAeuWAzjoZSB5kIGEoq2LLIANpxuyfQcAsfyHFjSGSwJmS8
         sYfhRGI5xRCnwY561xm8jWw+0C6EEn5Q214+qCl8jZDzqPQIwxDe+jn/L79ppLmFuto2
         iajP1H29jz717MjuKpI5BXN7yO4vKXSGP4OVOz08eICgbRYUNjxPAjUhn7Rultj9rfYY
         8+Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790928957; x=1791533757; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNMZyVK6pFlVTsgLLDPqKMJcnVZLWeRSVSS4Za1mR0k=;
        b=ojVygEpEWGpvRANpS5TELKdCGiJ+7rOW6hrkr024KqaLYPk7uif5xBAFVZC6UYyyeb
         S9UT+2gSLbe3fr0bUcSeGP4gckQbspUhNQm0HOlT8vzs1tDxarlKPMNLk09+kSSEF0cU
         vn4QF1teV8zDDyupT7q+jB3EBpDqMeE7Tt+KZGLQK260BxU3bJEYxoCr0T2GRLI4r2U8
         w7sKShDY3QzgZDefKEv8R3N2l2bCpy6Lus38ZIcuvOT4SlEDY3wXegT7zqkYLYURARCY
         J0TDLIwdES+fViQyNVqM+fHGTA0p/X3Nh1JCMcS7uUydv5Fub6idnYBaiAm7nh5qi5Ue
         xRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928957; x=1791533757;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vNMZyVK6pFlVTsgLLDPqKMJcnVZLWeRSVSS4Za1mR0k=;
        b=1bmD2idRdcDUtJ0PMs7FEFSf6xkpTh0802+KEidvaYB1JDrDgdd3X26CMh6W+r1MN0
         l14TpIQce83SqjqubAv70FHVYlolxHW79HGhc7yw2E+bHGdEGLuRvHSJanZHMB0EY2+Y
         dU5RoF9lPaKh9iaKVvRTu3SigNIYS41gFTJOjCwtx0F1ASxNw4+7tRdDSj2hFbDzrHOq
         0bDLWXDTB6DFGZnIo6oeR6aM5jYR+mTqxnJcOUOAcPcVoQQuEw4LH4VvCj9k6bgGAZTW
         zVARhH24VXrvCq4efNFNlOdtnH/QMaxqxoUB5m4SjLvXtXAhpgEmgl2Kl/gmlzdE4x29
         6H7A==
X-Forwarded-Encrypted: i=1; AKwUvBxWcbPd9DJXTX5X3WTN5oq8tJ+Yvm4dQWuNkRE7/2niPwGlH+2bh4eLtk06jormyhTlRF+S5ggRM/LFuh8=@vger.kernel.org
X-Gm-Message-State: AFuF++lK/jzda+KMaRpSVMOfQVo/Kpn3EGdJVW+OoZ6PFh0LQeq5iwnD
	gQ2YlX/LlUsLRJEcUJEtnIPffa3p/8sdux1//O0GuroHunPXXksVdGDeTlgSTXo9+iRb3NkEnFt
	OKfJBdmxh3exErdh3ub3/Rk6tpjELbNU=
X-Gm-Gg: AYBFou0aUz86fyB44xXj1DQ3n/nkOQrUp+20oKkz0Hdnat+OLhpc78l/TBG2yvSaRHt
	CrreFLrgPZW/uwL8NNQWrqj2dh5/rU9o629pX5i0AdHv3eYh9USBuKZGhvqC+3IHJtfPESHfJnA
	6ZHH3zetOg0SVXbBvjOxbzTcqtqBKI7y9m3mr1DuACqKK+HWIvK00VQQeXfjep2pZk8RqG4cnry
	7Q1V+YgBbVbFA17e95CVuOhw5bECUoLO55HO0UuQCr7TIOaYp11GfTm7GtvOES45IQiu1OfF+e7
	wYujLDIL/MzZiw3hoKq5g2h5SjRT+skOkZGpxzxL4APuKpNsMzGPGLb6wi34I01L+6Elqos+Gqx
	jmB3n4rOwHfpR1C9vnJUVoW0379LBaIty
X-Received: by 2002:a05:6808:11c9:b0:4f4:3f10:830d with SMTP id
 5614622812f47-4f52ad8ab17mr1336623b6e.53.1790928957337; Fri, 02 Oct 2026
 01:15:57 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:15:55 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:15:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
Date: Fri, 2 Oct 2026 01:15:55 -0700
X-Gm-Features: AclHuK-4GMY47nLXhhsFI0FSEv_G5-9PcUD0mQlubpPu7nDgw-26z3cL3X-Fd6Q
Message-ID: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Subject: [PATCH v8 00/15] media: Add Lenovo Yoga Book camera support
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
and a WV517S rear-camera lens actuator.

The series adds the missing ACPI and bridge configuration, selects the
OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
capture and adds the sensor controls and actuator driver needed by the
hardware.

Runtime validation used the same 15-patch content on the current
media_stage.git master. The final media-committers.git next rebase changes
only three source line wraps needed by the media 80-column check:

- W=1 builds and sparse builds of all eight affected objects passed both
  before and after the rebase.
- A full x86_64 Debian binary package build passed and produced kernel
  7.3.0-rc1-yogabook-media-v8-20261002-001605.
- The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
  8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
  both sensors bound and AtomISP registered two cameras.
- OV8858 digital, red and blue gains were changed during streaming and
  read back correctly. Continuous raw capture produced changing frames
  from both sensors (6/8 unique rear samples and 8/8 unique front
  samples), including front-to-rear-to-front switching without OV8858,
  I2C or CSI errors.
- Both front and rear cameras were also exercised successfully with
  Cheese.
- v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
  40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
  control enumeration, stream-parameter and buffer tests. These failures
  remain a validation limitation; this series does not claim to make the
  staging AtomISP driver fully compliant.

Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
24 MHz paths received build and static-analysis coverage but were not
tested on separate hardware.

---
Changes in v8:

- Keep patch 2's commit message focused on the implementation, remove the
  invalid review Link and move runtime results to this cover letter.
- Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
  tables by their input and link frequencies, and remove platform names
  from the sensor driver.
- Explain that V4L2 exposes standard red and blue balance controls but no
  standard green-balance control, so green remains the unity reference.
- Replace the per-sensor link-frequency override with the IPU bridge's
  existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
  288 MHz entry before the generic 360 MHz fallback. This removes the
  associated AtomISP hand-off patch and reduces the series to 15 patches.
- Add the introducing commit to the OV2740 group-hold fix and mark it for
  stable backporting.
- Use the documented Assisted-by tag syntax.
- Keep the padding helper as a normal static function and avoid a
  single-use raw-format descriptor structure.
- Retain Andy's Reviewed-by tags only where the corresponding patches did
  not change materially. In particular, drop the tag from the redesigned
  IPU bridge frequency patch.

v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/

Maurizio Casciano (15):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and manual white balance
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: select OV2740 frequency by IPU ID
  media: atomisp: derive CSI-2 timing from sensor link frequency
  media: ov2740: release group hold after gain write errors
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 114 +++++++--
 drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
 drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  13 ++
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 14 files changed, 605 insertions(+), 129 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: 4a069a763e8a86821edac4159f7c59a20015631b

With Best Regards,
Maurizio Casciano
-- 
2.53.0
