Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91FD37DABD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933704; cv=none; b=Gk+MV9eBF7RS8vwFPaUaVEWOTwcLEApKMLfqY2eVGeY/rbG9qmy5Uvq2pDD1H5PmOC+7uvR9d8t00faZc9AHfUMHNdNBMtkHjWjKckyom+MZYjzvz86rgn8HoIQxXLRFOvAcwWSPiJ65DvOxaxk8HTQoWaPZot3cY4L728uneBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933704; c=relaxed/simple;
	bh=3kVaLsENVzCA0MKHItsT8KdlkzDfudPfKLD+VfaEPg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prWqBnBUlIsfs0w6qPvH05RFLxpL1UO+D33Foc4Nx3ZKsiL8HlE3ciMHuUWWhZlQITE3LoPmVoWT9JfffIn4oi8XlzmZWr3Km1OfF+qJ0Fue4tvyAHiHUu20d/rZutgcWi91dUyqY5OH8bLmYs5dWK1JptSmuy9w2rZ32DY2qmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yc9vhnL/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yc9vhnL/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482fc3327fdso445217f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933701; x=1788538501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZptsHb/UWruuO/ahO6Igs1sBi59ogcVWq9/GJG1KZM=;
        b=Yc9vhnL/hD5DA6TqBzbquRXOmjSy/Ru3yPqLNbcf5sYSLS/JEFs9c3vSkFn+74f32E
         iJ0huYK2F9j+s31PIX3/C12OmTz4Hk5OhAk1K8aBWZStN8IiWToEO6SmHa7WKGpRNfTP
         ow0J0AJj3O4qr8ejK5Lfhk2V6UoSaREKciZLdqeH0LJwFbzdxfW+HkUDl4YOtCrjmOFC
         mpvUBdwSuANztprkGBbB2pUqkMPI8EputgTSaQOa/zk/aLiHr/nCb2gqOuQqlP8RMKPC
         37Xiuazm0ZLhRcbq8xaSCfFhh7rccYH5bmOzYumkgIOB1am+P/mrfU3HwRhzdcGKGBzI
         oWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933701; x=1788538501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZptsHb/UWruuO/ahO6Igs1sBi59ogcVWq9/GJG1KZM=;
        b=Z7y2GcXzEwZSjw5LArseU7h+U5NZ0MvI8gVU79m8pZaGRNarpcy7Xa/iyiCJv+mtfc
         W0vADeMP9GFtTbYQ7Q3fQBERtD9Hkcd6De2pyJzvFBnh2KyfJs0HOra8CO9MXWGfvJBM
         3N2CF9fw28IQqLdZUYwjP6eIKgrPI8uMebt2w4oMrH7dABDbPqN01vafUjPE0YJjnnqH
         cpJYY2K2e/LBCMHVF2Sf4210SPyC+8sD1rnmLpu7Aq4e9qdpUtgHKV9gVgeMYbNecmkP
         ptkUYPcL8ZqaAVKTKoEe/T38D7ap4N+n64nEPu3dsSUhr6ywQr6zv2wr1IxzMx0oCay3
         pHLA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8+uQ/MLq11XP5C5fIZf0Etl052ihGYQUvnLGBXZa6UukkZxZjEnRbHO4ON4QDTkGRrvAB5rHe/ZENmUs=@vger.kernel.org
X-Gm-Message-State: AFuF++ncI5ibk22csvCzhisT12NqZxMdbKBo5hkk2vd/AXQdr7seoL0p
	mvLYpqaVuLk/BvVKN01kjIkl7k7DJewwpTjszy1IX1vM7lmTY3jh8kPJ
X-Gm-Gg: AR+sD13AnIOovmAGjSrLI1TknPhpLYTdSFeFeBVLfD5MOqsU9rklUwK65LFeeEnOh5L
	cQIPbePipR3qSfGrpK4pCDLGXxI6g4fzFDgFWpfTPWoP8FazqkVCeY1dImU1kzIN4lw5srHnxnD
	G3cKPR5VQ9SDjQ6brYX68ZPp3O5GZpDXqDhuU3HJ4k6gdMgIlZh1kT6VrGWgFVXeKCjmL7V2asi
	Fh0s2gsq3Qxtx5tbAgmIbo29Q8GtS6UMRI6vVm+zHlVvYdJu0IAcMX4eflb3F5gjXE1K+qjUhwD
	0arZ6zZjC5993MTTc/Ui2IxB8SynfL4aZcd+tZRGyU5D4kIJFnDXJykpAD3n3Zn4WBkLYj4uz7Z
	/jCUS492lELQ1bfQVphrdMemSwfcJVyXDl/Tgn3y5GwEPqn2fWwLFyse4sKPtHa6TLAAEyQFBLj
	Xeqd24kwFInHlvodPb7QR1tsUXmq9gXse0IS7MTqPWw+hSc4pCATC0req9dyr1GSuSz9iWSUT/L
	dl2QkpJy0WUNrk8Etq4JIKBPPFbQC1rFV1ZMZZGIMw8xsxGCOCa
X-Received: by 2002:a05:6000:4715:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-482f79bf064mr15006951f8f.17.1787933700887;
        Fri, 28 Aug 2026 09:15:00 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:00 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 00/15] media: Add Lenovo Yoga Book YB1-X91 camera support
Date: Fri, 28 Aug 2026 18:14:42 +0200
Message-ID: <cover.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L exposes an OV2740 front sensor and an
OV8858 rear sensor through the Cherry Trail AtomISP. Its firmware does
not provide enough information for the existing sensor and IPU bridge
drivers to construct the complete camera links.

Add the ACPI IDs and bridge data, describe both AtomISP camera links,
support the Yoga Book sensor clocks and modes, expose raw Bayer capture,
add per-channel white-balance controls, and add the WV517S rear-camera
lens actuator.

Raw capture is selected through the normal V4L2 raw pixel formats. There
is no module parameter or separate private ABI. Raw formats expose the
complete sensor transport frame required by the ISP2401 copy pipeline;
selecting a smaller crop remains a userspace decision.

Changes since v3:

- use ACPI_PTR() for the new OV8858 ACPI match table;
- split the Yoga Book OV2740 link support into sensor, IPU bridge,
  AtomISP timing and device-specific frequency patches;
- reuse the existing OV2740 1932x1092 mode register list and SGRBG10
  Bayer order for the 288 MHz link frequency;
- carry per-sensor link frequencies through the IPU bridge and use
  v4l2_get_link_freq() with s64 arithmetic for AtomISP D-PHY timing;
- remove the sensor-specific kernel padding override: raw capture exposes
  the full transport frame and userspace owns the centered crop;
- keep struct v4l2_area for the existing AtomISP padding interface without
  adding per-sensor padding state; and
- add review links to the commits that address the requested changes.

v3:
https://lore.kernel.org/linux-media/cover.1787872237.git.mauriziocasciano7@gmail.com/

The tablet DSDT contains the sensor objects requested during review:

    Device (CA11)
    {
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_DDN, "OV8858")
    }

    Device (CA01)
    {
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_DDN, "OV2740")
    }

Pahole reports struct ov2740_mode as 64 bytes, exactly one cacheline,
with no holes or padding. Struct ov8858 is 792 bytes, naturally aligned
to 8 bytes, with 4 bytes of tail padding. Struct ipu_sensor is 2096 bytes
in v4, reduced from 2104 bytes during review.

All fifteen patches pass strict checkpatch. The touched Media objects at
the exact v4 tip pass W=1 and sparse v0.6.5-rc1. A clean 20-job full
kernel package build containing the patch-equivalent v4 series completed
successfully.

Runtime testing used a Lenovo Yoga Book YB1-X91L booted with
7.2.0-yogabook-20260828-163827 from integration commit
907805589733fd2e9112118314ac811361afdcd2. Both sensors, AtomISP and
WV517S bound. The OV2740 exposed its full 1932x1092 SGRBG10 transport and
completed three consecutive direct raw captures at approximately 30 fps.
The camera userspace consumed that interface with a centered 1920x1080
crop, and the rear OV8858 preview consumed its SBGGR10 transport.

The 1280x720 YUYV rear endpoint completed a bounded 90-frame capture,
then switched automatically to a bounded 150-frame front capture. Both
physical camera images and front/rear switching were tested successfully
in Cheese. Speakers, microphone, Halo keyboard haptics and pen mode were
also retested on the same integrated kernel without regressions.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (15):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and CHT gain setup
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: allow sensor-specific link frequencies
  media: atomisp: derive CSI-2 timing from sensor link frequency
  media: atomisp: provide Yoga Book OV2740 link frequency
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 116 +++++++---
 drivers/media/i2c/ov8858.c                    | 167 ++++++++++++--
 drivers/media/i2c/wv517s.c                    | 206 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  64 ++++--
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  30 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  33 ++-
 include/media/ipu-bridge.h                    |   2 +
 13 files changed, 578 insertions(+), 98 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.53.0
