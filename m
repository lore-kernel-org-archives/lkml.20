Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14019368D40
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199268; cv=none; b=PdnV/zLpAaBaa1ptRA0B7Myn4L5EO/5FGBcDA/SH6jWlDnoHZ8jHAsGiWmtF+Hl2W9nIVlW0Z74HXvkGuV5VUxLprgXAendJrmROBlmLd4kNCPXyzL01vRSSIZa1em2/bAfCEQF0nV6YlXGk7SHrkI9HN8F3qkMTmiXDE/zMKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199268; c=relaxed/simple;
	bh=mL2Lwg9oxsZdUTlykc/2+ON97/E/5LXM0vSR6z8oHgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zn4h/oxJL4KfioJ/YzQtsfhele95FsfhYxrr2NlaiRn1zyKCBVp+3cYejNIY9AxRZ4KtvY8PLZ04Fy+YR67SX3wJ6lmrXuk8/qUMA7bRnXf8mc1jIl9Z5+E5nJcqAWRpr42eTkwrtubk68kBP5gvqfq7SXe/ztpyEtm3D7wehS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtS/GIkV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtS/GIkV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so587538f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199265; x=1788804065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0qBzso0OAfsRTBs2l98+2UL/lhWr7wMk6D2o/FrLpA=;
        b=BtS/GIkVrxQe7/rnYJE5/z4rVl7CiyeqqzLcb8a5bOugDjhU3QeWyFX6bdIwe/YJxj
         wTc+iAx1WDoBvrptk3W5u2WavDSz0IlnfsRNM4IbOcjRvW0WajPElarcW5o+sMmzxxa3
         1mLl9kfm4PsHGHW+mOeRUYk1GKNuU1Ci5QG7cbPa1m8wfz+7bVqRCvFyQuhko08oMol5
         F4+Vnai4CSyBOcyO/lLIUep3phB0LzBHDmpV+iCSNhIXbxlODKkKkVF8n+Ty6TnTU8Ku
         6g0gvXiTAbinBwP1H/vXGTjQHGFbG8Bs9dg8D0SpdC9xBM57nzgio/ePujZBKlcShHh7
         CdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199265; x=1788804065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+0qBzso0OAfsRTBs2l98+2UL/lhWr7wMk6D2o/FrLpA=;
        b=WymnfcoGTqBehdslrgcATV4Wuxwb7oytKYuR5+ttUg67MdbnoFByWcXJsqY4/yojYb
         eDCaOrInk4CYY4xqEKyujRHKiwDwYs+7839pO0Rc4Txd7S5M7cp73gEgP3gSaXfhw1U+
         eaiTm4bYj6HvgaiSgRfXvsw/sMyf1t3Qr+hb5uKlaUx2JV3OkT6NX0lHENFrOhnPezwu
         6qBPLwmNu6KMu1UkkIaDJBpABidAwbyKh53TU1MtazQl9Pdw+f/eGWKInIWDptJ/nXUP
         xd//3aoh/PcyyHmh+DKs/yHTRqTp6mP6ReTmi3mhlve0lXKuz7uFIsJ4LEiUahuKR48v
         Qonw==
X-Forwarded-Encrypted: i=1; AKwUvBzqZubb5SS+HA0weZHugQ+5qpCwqpxqjcPRWns8OsjKR1ywONXDXV0E37nnMGP3l5YclA/jxQO73i8SPWg=@vger.kernel.org
X-Gm-Message-State: AFuF++kodZLp3IGCXT+LtHo9JfYVieWgNFJ8rger9P4HRDmYyBIBImZW
	y7gAvM4ePMxSfR2DkM1iUk6U4HX6QMvj3gwvu4PR9mj2thcgIN9qCcYFf1v1sM48L08=
X-Gm-Gg: AYBFou0gE7eKRJyrc7C85u3fBdwcfLwccbpet+tDM57iKg8BdWpg3ZcI0EEvi9l3zgn
	N3tA5ws8d2pvOGWxSi5wfr7p2c24w+ofgDzqhMgJrVG96JAylBhrRtvO0JmBV7YlJSWSyy+7A64
	eapAT7YPGMZsAZ0drY3cRu0c549CWhJ6ZFUMRdvG696cXMouIqYSIzOgnyIeXSO0nrL6H5VQeps
	0Av3gCMLEB6bs5toh6hu2CKNJAFoJHp2lbMMEXw84WAQrhmlMEShLP7LBmNZ92PN63Q/DMQUdSf
	LI3VHRab3MmqY3cqddBJtAdi8YEN4XzuH7sTmrmfG+t9ICR8ebqXvFkuyDyiP00sxWq4U1F+Hti
	+am5aJ8esiWYmwbOH5nuQxTA7J7khrhvGjV9HhJlLvfA7AUYur8tqYHIGj/A1wkNcqcKZTom0Yz
	VvmY1Q5M06YQr8BQ2ap3bVv0a27qzPIq3+9tlyQGNP/q5Nb8AkAKbFQ80cbXIJpXRxZNSvuLaUy
	kuuDgs2hUa2vZirL7hCZ6QTLHgJ+MndIlH8zMmPt7g=
X-Received: by 2002:a5d:6e58:0:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-4844101e5cfmr3872253f8f.20.1788199264958;
        Mon, 31 Aug 2026 11:01:04 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:04 -0700 (PDT)
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
Subject: [PATCH v5 00/16] media: Add Lenovo Yoga Book YB1-X91 camera support
Date: Mon, 31 Aug 2026 20:00:45 +0200
Message-ID: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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

Changes since v4:

- retain the HZ_PER_MHZ conversions requested during review, including
  the canonical 24 MHz OV8858 clock constant;
- retain ACPI_PTR() for the OV8858 match table as Sakari requested; Andy
  subsequently confirmed that Sakari's media-maintainer guidance should
  decide this point;
- add Andy's Reviewed-by tags to the unchanged patches he accepted;
- move the existing OV2740 group-hold error-unwinding correction into a
  separate preparatory patch before the white-balance controls;
- complete the AtomISP struct v4l2_area conversion for persistent sink
  padding, padding helpers, frame-size tables and all callers;
- keep the OV8858 digital-gain extraction a pure refactoring, preserving
  the original register packing and explanatory comment;
- use the existing OV8858_XVCLK_FREQ name for 24 MHz and keep a distinct
  constant only for 19.2 MHz; and
- standardize the Assisted-by trailers without changing authorship or
  Signed-off-by certification.

v4:
https://lore.kernel.org/linux-media/cover.1787933456.git.mauriziocasciano7@gmail.com/

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

All sixteen patches pass strict checkpatch. Integration commit
780663f0af3b contains the exact v5 media series and passed olddefconfig,
focused W=1 C=2 CHECK=sparse builds, and a full x86_64 Debian package
build. The full build log contains no warning in a touched file.

Runtime testing used a Lenovo Yoga Book YB1-X91L booted with
7.2.0-yogabook-20260831-153058. OV2740, OV8858, WV517S and AtomISP bound,
and AtomISP reported two connected cameras. Processed front and rear
streams completed and actual switching was confirmed through distinct
BA10/GRBG and BG10/BGGR sensor paths.

Direct raw capture produced five complete OV2740 BA10 frames
(22,364,160 bytes) and five complete OV8858 BG10 frames (20,377,600
bytes). The OV2740 red/blue balance controls were set to 1200/1300,
read back and exercised during a five-frame raw capture, then restored to
1024/1024. WV517S focus was set to 448 during rear raw streaming and
restored to 300.

During rear streaming, OV8858 and AtomISP were runtime active while
OV2740 remained suspended; all returned to runtime suspended after idle.
A 15-second s2idle cycle with RTC wake resumed successfully on the same
kernel. Front processed capture, SOF playback/capture, and both DRV2604
force-feedback devices were rechecked after resume without regression.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (16):
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
  media: ov2740: release group hold after gain write errors
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 114 +++++++---
 drivers/media/i2c/ov8858.c                    | 166 ++++++++++++--
 drivers/media/i2c/wv517s.c                    | 206 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  80 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  30 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  34 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/ipu-bridge.h                    |   3 +
 15 files changed, 588 insertions(+), 110 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c

-- 
With Best Regards,
Maurizio Casciano
