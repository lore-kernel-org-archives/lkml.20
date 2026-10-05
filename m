Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89648371CE3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184240; cv=none; b=gKFjracjgXco65UwM9sIeTsxEtbS/HugKbATDtVfWpkw3EZyZUCom6K9JibwnDX4NvnxZVQx09KV8jIKPM1eaJx2L8/9v4g5MxbLF/wm/YljK74mKwcAWcCws1meARe6QERvbbUM0C/Tz6VpygfqcXd3WjGvMJIv03lL4nwPMLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184240; c=relaxed/simple;
	bh=W2DrySIcx70vrTbptdu3ALk9CYU49TBI2l50an7B/bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMROsvEeELr2hIcsznf3HIfuFZnGOXRVR2ywk+iHehyJnFPzppb+tNt4A74Cdr0toSq637AHDFYGp6enYQOzgvNWnvMZbN6wqx1HHh1LQ1ySHMJlc+yr0KOpLIoUYwplDbPGz9qvBTJ+JTD6jaWUv3EeZVBVqc9GfUrMZNqhmws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiP25KQW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiP25KQW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15068975e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184237; x=1791789037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9O/YxO2mPH+H7HGo9/k7HsTpYrEEKl4oBq8R1d8UlDM=;
        b=fiP25KQWkw6Qar+h0jRrP8oqk0+X2nrGVrzYX/ItTJIFlyULaifF01IUYp4qcepmqh
         K3heIZkY2l2llksz6/M1k1uAHLJGbpRcbsz8B+OV2qcW6J9aOTdkVfo7lvyqMujV4vw3
         aEEtf+7zs79yC++S0NBnucqyYoG2fnpQ+ni8rIf6wR64AQLDH8zGASpRh7wCdwDRUMgF
         hfdsbn6mr32vvyhdLdTsGOzmpFLAqfau3OKj8HUoJeOw4GcmvYZDr4TZqmm2bq+jw0To
         QfiL7BDE0Axwofo8iPIhTOTzrCoaU4F1VuM6v/JBDexQFaYOpT8qb6ojQEujCeIGZDIq
         16HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184237; x=1791789037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9O/YxO2mPH+H7HGo9/k7HsTpYrEEKl4oBq8R1d8UlDM=;
        b=hsL3GfWYsUiU5iBn8VBjOTUoCN3qoStPx+b1kcFfloySJbgbtSzcp6ypXtO3IiTuzS
         7tIuyvCaRfue7+xHmd/X6gdJn0DDaauQ5ow8rfjPkOuvi8iCpAGbooTpTuAxWhHgE1Ts
         zrBN7NuCBLo3JAMcKFpPFumS3723yjy5lV4ERyzkP3CxFp4MdbVpCsUEXtp36ofzuRft
         SNmgJwHYrseMyVyyG9RWns/DsmQLCitT7/5b21WgRlf2tzKDqvviwtoVFe5n5bf2qC+X
         CXPhCG0YJiLmV7s8dadr7GpLnREPc+bv35DoaiMRyFL1lK2kJPuHXEdNkBU8ntOPFpyi
         a2zg==
X-Forwarded-Encrypted: i=1; AKwUvBwSNTvG+55/c9RHTMtEk08pbdtaSiVhkyw9v2t9wsaj0FodtI9DsOtBS4QYFIG9hx6p7L7BqXPtzuRvJFY=@vger.kernel.org
X-Gm-Message-State: AFuF++le+ZiqE4gKXITD5ckliVVEIC4WYIOzlERStq61dfbPHeesiW7J
	Dsa4c2dgnalULZhbAUVFNIB3V69yjYgaBIfc2muXNX4Q7UuUdffwSV8d
X-Gm-Gg: AYBFou3j37ApKf70/vnJNzKciyzyxtIfTTUdnEqwdAddLaIwMqAZMPwxKmcSh9Qjrhq
	07g1XspM/ho2Euu+QnJXBS3T/2g37CF3wQhup3CZlJlhFzBFuCIlisyQoVicQyZARbDeIxGA0Dy
	qSZvYupN1y3hrtajQhWcDhwRcP39CxN7rbUP3/izem/JFfle0FYih0/cwssK787bDKbUlqXpIFQ
	cXGwJ6JQJCrujdjlrEre70tdSgh3q5dhYzC6WtzgPCKwR2dTJUXsT5LINZ66jfgBu/Z+/C1pu54
	XHMkri6suPTUuzPXjfNGjIRzW+khyN8OaMFU0w9nvJToUjyc7DvvBba5YswjX0Q0lGDm+9w5Bsm
	tYEeSaz9Fu386qQw4Ut7p39P48TBRM2AjwpUAafhpeuvtGxVpoAsVR4njn/WuWZVrbQvax5xcHq
	HYZRCvZXejIDrgR8WcrvLxxvRieDdkmT3+yTreZ6rESlPzQ4sMVEFVjqHaYi9D4pvry5mPyXEDs
	O+QA0k6ugTh3pD4QLy1nCUkyCH7pN0sxFWKnWTi9I3Z41Ew9SRWm/GLHIc1K/T2ffLWuDuOB5Mf
	GHL/muklIMfF0wrOXa4qrM6Y2w==
X-Received: by 2002:a05:600c:4594:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a1680eee54mr81493895e9.12.1791184236472;
        Mon, 05 Oct 2026 00:10:36 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm316749855e9.14.2026.10.05.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:10:35 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v4 0/3] media: Add OmniVision OV32C4 sensor driver
Date: Mon,  5 Oct 2026 09:10:07 +0200
Message-ID: <20261005071010.7191-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

v4 of the OV32C4 sensor driver. v3 is at
https://lore.kernel.org/linux-media/20260829115832.8749-1-robertbozik@gmail.com/

The one open question from v1 and v2 was the second I2C address - the
write to 0x3e that the sensor needs before its main address answers -
and whether it belongs in a sensor driver. v3 could only say what it was
not. This version answers it with a measurement, and the design follows
from the answer.

The question that decides it is whether the block behind 0x3e lives and
dies with the sensor. Measured on the machine, polling 0x3e and 0x36
every 0.5 ms through a runtime power cycle and lining the polls up with
the kernel's regulator, gpio and i2c tracepoints:

  - sensor off (AVDD disabled, reset asserted): 0x3e NACKs, as does 0x36
  - AVDD on at t=1.0 ms, settled 3.5 ms; reset released 8.9 ms
  - 0x3e first ACK at 10.1 ms, reading 0x1001 = 0x00; between AVDD and
    the reset release it did not answer
  - the driver's 0x1001 = 0x04 at 30.1 ms; 0x36 first ACK at 30.6 ms
  - reset asserted and AVDD off at 4000.8 ms: 0x3e gone by 4001.9 ms,
    0x36 by 4003.0 ms

So it is unreachable without power, appears only once the sensor's own
reset is released, forgets the value written to it over a power cycle,
and disappears with the sensor. It has no ACPI device of its own, 0x300a
there reads zero (it is not an alias of the main map), and 0x36 has
nothing at 0x1000. The same register pair exists in OV08X40 at that
sensor's main address, named AO_STANDBY (0x1000) and MS_SELECT (0x1001,
0x04 for streaming) in ov08x40.c. The vendor Windows driver writes it
from the sensor driver as well, once, after reset and before the chip id
read, and never reads it back. I take all of that to mean the block is
part of the sensor and the sensor driver is its owner.

What changed accordingly:

 - The driver claims the second address with devm_i2c_new_dummy_device()
   and writes it through a CCI regmap of its own; the bare i2c_transfer()
   is gone.
 - ipu-bridge no longer instantiates a VCM for this sensor. The SSDB
   says vcmtype 2 and the bridge would put a dw9714 on 0x3e; dw9714 has
   no id register and binds to anything, and that client would hold the
   address the sensor driver needs. Patch 3 carries the exception, so
   patches 2 and 3 go together.

Two smaller things turned up while re-reading the driver for this:

 - The 10 ms after the software reset was a busy wait. The reset sat in
   the mode table with a delay_us, and regmap_multi_reg_write() turns
   that into udelay() on a regmap without can_sleep, which the CCI one
   is. The driver now issues the stream-off and the reset itself and
   sleeps; the table is the vendor's sequence minus those two entries.
 - power_on() returned 0 when the enable write failed. It now fails and
   undoes the clock, the supply and the reset.

The power-up timing, your "0 and 5 ms" on v1: I did not follow it then,
and I think I do now - nothing after the supply, because the regulator
core waits for it, and 5 ms after reset. The measurement above agrees:
the block answers about 1 ms after reset release and the main address
within 1 ms of the enable write. v4 uses 0, 5 ms and 1 ms, verified over
a cold boot, 20 runtime power cycles and 15 stream starts without a
failure.

Where the numbers come from, stated plainly this time, because v3 said
both "copied 1:1" and "measured by me" about the same table:

  From the vendor Windows driver (ov32c4.sys, FileVersion
  70.26100.2.18255):
  - the mode register table (1787 writes, at file offset 0x31300), of
    which the driver drops the first two entries, stream-off and reset,
    and issues them itself;
  - the 400 MHz link frequency, carried there as bits per second;
  - the chip id 0x563243;
  - the write of 0x04 to 0x1001 at the second address;
  - the registers the controls use (exposure 0x3500, analogue gain
    0x3508, digital gain 0x350a, VTS 0x380e) and the rule
    exposure_max = VTS - 32.

  Measured on the sensor:
  - the chip id, the register meanings above and the exposure rule,
    confirmed against what the chip reports;
  - the gain ranges: analogue exactly proportional between 0x100 and
    0x7c0 (1x to 7.75x, 0x100 being the power-up value), digital
    proportional with 1024 as unity, clipping to black one step above
    16383 - the obvious donor, ov13b10 on the same registers, puts
    analogue unity at 0x80, which is wrong here;
  - the timings: 320000000 / (4080 * 2614) = 30.005 fps against a
    measured 30.00; the power-up sequence as above;
  - flips preserve the Bayer order, so the media bus code never changes
    and the crop compensation ov13b10 does would introduce the shift it
    undoes there;
  - the 6560x4928 array and 6528x4896 active area, from the window
    registers of the table, agreeing with the vendor's product brief;
  - the second address, as above.

The rest of the series is as before. It adds a driver for the OmniVision
OV32C4, a 32 megapixel RGBC CMOS image sensor. It ships as the
under-display camera in the Lenovo Yoga Slim 9 14ILL10, where it is
enumerated through ACPI (_HID "OVTI32C4") and feeds an Intel IPU7. The
driver supports 3264x1840 at 30 fps, 10-bit Bayer, 4 CSI-2 lanes at a
400 MHz link frequency, with exposure, analogue gain, digital gain,
vblank, hblank and flip controls, runtime PM and .get_selection. Tested
on that machine: the sensor probes, streams at a measured 30.00 fps,
frames arrive complete, and the full path to a processed image runs
through libcamera's software ISP. The driver has what libcamera's sensor
driver requirements ask for: the five mandatory controls, the crop
selection targets, flips that keep the Bayer order, and the orientation
and rotation properties.

v4l2-compliance on the subdev, kernel 7.0.0-38:

  Total for device /dev/v4l-subdev4: 46, Succeeded: 46, Failed: 0, Warnings: 0

Static checks: checkpatch.pl --strict, sparse (C=1), W=1 and
dt_binding_check.

The series applies to media_stage.git; base-commit is below.

Thanks,
Robert

Robert Bozik (3):
  dt-bindings: media: i2c: Add OmniVision OV32C4
  media: i2c: Add driver for OmniVision OV32C4
  media: ipu-bridge: Add OmniVision OV32C4

 .../bindings/media/i2c/ovti,ov32c4.yaml       |  105 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov32c4.c                    | 2716 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   26 +-
 6 files changed, 2865 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
 create mode 100644 drivers/media/i2c/ov32c4.c


base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
-- 
2.53.0

