Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F543FB052
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854683; cv=none; b=u08DAXA1ew+/76UpcOh/jWXVaJgkfZo2Si+pah23ytRb7Qxxt+wm+xV4er0Bv4zHdUo7QB/YNP+SQFJC6TfKsk8M26rI+J/7Ccy4ZexNv3EOKpBPnOznk2whAhEWPIRpjMIrCRmDupU4y/4OBlT0paA1FycdsxBu67vHNqVp48I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854683; c=relaxed/simple;
	bh=T30D1wvUSixkGvwIe3DyjGQp2AZkfbUUBHerBjx/GDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRj9GejHRcMj++WWW10HBZbatjXqVG75vR4FtFvf/NQGgzbtgMHm9ykLrU3xcym+ATu/i70J2eAcfqrSGoDtaHrHiQanPhgc4ksVGHTLPV/e2wY2XOql1mX6ivFdaWX3i+ZiAK3ARK+jjEQ4qtbDC2xEIjSLNoFW7QN3dWre4Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A38CYH63; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A38CYH63"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4957eefd361so373015e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854680; x=1788459480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4ynh5dHuPHo6fo2Nwcxj54fhBTBYTbBjdw22iNWn8o=;
        b=A38CYH63hu73u7OGOQyx1cmM1s6F2PoMuAceDY16XIMuoUtNaBjMM+LrjHH/aR5tL0
         KbW+uVTpJ6hCGT+xzTsrWMFJWttVSvFoYVd1OnEiuF/G3kZm6GsAE1w5T7Ai24BVTZPg
         4xW8/vW0H/JSLEbBKjFT1BRU5Ta4L5pwxQKmQVNPOyI9vdei8uBu4BzzwfOqAnPN9RNz
         43fWLe+uhVreyKIOF3FinGTg12bRGPPp9xLiLxvLs3dt/7hoabVZbOpQWDjYjuRd06AU
         u+eWvQMs1GiBefbqiBflzvjuExULhq+8OPEPB4RgNdfrlGWUtCKbp00PC1NicwUAMhfn
         +edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854680; x=1788459480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4ynh5dHuPHo6fo2Nwcxj54fhBTBYTbBjdw22iNWn8o=;
        b=TR/nNqNeM8EfoVOZ0ZmiLbZhFeQN7CQ2XarYjWyFYI3Q1yEtg/0LIfzKh/+7abr3x2
         hIyKxx5CmrxlgFwD7HEPi4pmMmdDZsoFvlXBIynn31xCswNT5yypwfw9s6nl3D53tuTi
         UrQsC3gal010zDcBONhx4W/7AeLGQgjQwYrofoD0XOcD+oBe2Oplcr6kTvdO8xR1a5mw
         xj5vquxCnD3BtOICkbaCmtx6lxGJX6fpdTKh0wamqpFR9eMpw3kE8AiuIdKIVyum+t/f
         jB5VCUQ8XMXd4XwUDHjV9df1Zj3jXONTAcK8n+tztsjSs2RBSRR7qiekoTR9Vd/4TvUp
         aD0A==
X-Forwarded-Encrypted: i=1; AHgh+RpTz3EtPwXb6qswvLKvptj0S4BxM3N3lBcSOF8Lg+5fYkYEnjvS5OTBynPxZ8Hz4wUBGavfK7f6GixZUME=@vger.kernel.org
X-Gm-Message-State: AFuF++k5Yxr9Jw+aUdRnGBMgKB8y97nXTYxD6VBLutI3kQpyceVPZd+t
	bbjd5nZpwVBg9cp6Wa4K7iSZOi4RcoygwCq3ZPDk++Z99HSKO8OETnUc
X-Gm-Gg: AR+sD13aEitj3D/MSZiqTBVUuWgMhSeUrjbejIHE2KGvkdMJFK2BfNLndUhbXt3oMuQ
	azUt48jB9IEuwAWOIPZwEO/wfWaVsqmH1F5FTxaheFRU723OO9ToOxqZvZhNwPhqjeZwW/HYGlh
	j98ON0/0AQeDPmSQs4PK9IO5fOvrOmm6MvstnShAh1pvKA7Ez+OaLSL8obpv7WY4+BDT6bGIXmJ
	opVzBv946ZrGHkG1C7SMpytlRMZ7r/6mMogV5VhR25qYFH0yt8uMVTqR05/RQ8L8BOti4kJik9P
	iLPSbbQ+WPoAtz/zHjHsnsGrKmC/R4CwFy4y4gDrHA7MUdpCK5DAu2cG977mkVKmgswO+cdMCKV
	5ngkRhrXK+UME+qzPh1kIY/xGUDG4nBQuT7C53dKtIwiyErysMLSn9ynJzIIT9WKEFTfXGejxtH
	X6XuOiGUZ/gvj3ejGd3EVsZuOB1RZgVlsyYMId/0eEfiMNNTCW1zqFUQEziz7zJRittwkHhgoav
	6dJgl/NW6Mm5kmpYJRcVBolt9KYTCmIfL7z3aaXvq73ouCj70tpCPo=
X-Received: by 2002:a05:600c:5288:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49b91c41014mr14112725e9.9.1787854679987;
        Thu, 27 Aug 2026 11:17:59 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:17:59 -0700 (PDT)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 00/11] media: Add Lenovo Yoga Book YB1-X91 camera support
Date: Thu, 27 Aug 2026 20:17:45 +0200
Message-ID: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
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
is no module parameter or separate private ABI. Processed formats retain
the existing behavior, while raw formats expose the complete CSI-2
transport frames required by the ISP2401 copy pipeline.

Changes since v1:

- split the sensor ACPI IDs into one patch per driver, add a preparatory
  C99-initializer cleanup, avoid ACPI_PTR, and retain the existing acpi.h
  include because ov2740 already calls acpi_dev_state_d0();
- split the existing OV8858 digital-gain programming into a preparatory
  patch and simplify the 19.2 MHz clock/gain changes;
- use standard frequency units, cleaner declaration ordering and bridge
  quirk data instead of duplicated firmware-string parsing;
- remove the allow_raw_output module parameter and use normal VIDIOC_S_FMT
  raw-format selection;
- represent sensor padding with struct v4l2_area, simplify the raw-format
  conditions, and expose full raw transport dimensions;
- simplify the OV2740 white-balance arithmetic, cluster the three gain
  controls, and apply them together during runtime resume; and
- convert WV517S register access to regmap, correct runtime-PM handling,
  restore controls on resume, and clarify copyright and board comments.

The series is based on mainline at 73e3f0710014. All patches pass strict
checkpatch with no errors, warnings or checks. Pahole reports a 64-byte
ov2740_mode with no holes and a 792-byte ov8858 with the new clock-rate
field naturally aligned. A clean 20-job bindeb-pkg build containing the
same final source state completed successfully.

Runtime testing used a Lenovo Yoga Book YB1-X91L. Both sensors, AtomISP
and WV517S bound. Focus position 300 was accepted. Captures passed with:

- front raw BG10: 1932x1092, 4472832 bytes;
- rear raw BG10: 3264x2448, 16293888 bytes;
- front processed YU12: 1920x1080; and
- rear processed JPEG: 3248x2432, 1530647 bytes.

The raw format was selected and streamed in the same v4l2-ctl invocation,
as reopening the video node restores its default format. Both raw files
were non-empty and distinct, and the rear full-resolution JPEG completed
without AtomISP, sensor or runtime-PM errors.

Maurizio Casciano (11):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and CHT gain setup
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: atomisp: support the Yoga Book OV2740 link
  media: ov2740: add manual white balance controls
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 177 ++++++++++++---
 drivers/media/i2c/ov8858.c                    | 156 ++++++++++++--
 drivers/media/i2c/wv517s.c                    | 204 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 ++-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  17 +-
 .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  65 +++++-
 .../media/atomisp/pci/atomisp_internal.h      |   3 +
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  22 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   9 +
 include/media/ipu-bridge.h                    |   2 +
 15 files changed, 648 insertions(+), 74 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.53.0
