Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564438;
	b=fSZx/f+O1neYhcaTO/ClkNOvRFPq6pja1fn+9veGyKcnvjssKuJNrJtHl/MeP/1zpRJx
	 FtggrzvwlW96T5GcRJGaa6gQBhrCQjXPE+Z9+XQ4PkOLpqTwpdyQuwSogWtOy8Z0QL97t
	 akGvOThjoU8N/RG2433R0Fcqo7EyV9hm9JKTkbU0lUOZZaocPR7EYhLzhwMfY6q2d3+7c
	 Qho9keVhdF946H6somInxrBBXxKCGl/v+hbpez5WoGalpf8MGE7NEEHW/gA1NTSzNA0vV
	 DFtXoG3F6nxNBTKPNEqabOageSQzIFbvlUUHmlznPYYvAygN5qKGmDH00kNJ76Jeicg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XfpDTt0rN1tqZZQ9NzVFLUVJCa2Nxf7s33VXO2H8BuY=;
	b=EciJdKgLuo0vsIMJCbjAWfOnCoW4iUGPXgwjQRX/1ksMXAJa//fBVK7XZPoe86Nb1CAv
	 UP5QD2m++ZE/nEsX8da8yBQEmSGt8JjMoUN4tBjZ1CIYFM9AIRg6gWpGurpjWr3Ras1pm
	 09fz0w37KSdnJR53L7TQv5pQOYRvEyLk4moqLpRPBDKmf4ecrEz1h4e9HnhEdU7iyuc86
	 /ubXX9/heB5zWzHaMNom9QEWB/oAgviHgJAQObXoBIKkBgocaL2A8nK+B3zt9y9xQhHlY
	 ru6ANqmHvumcL/Ufu/Bc8bwebzHL5LKFtJPd7bnkwsdOHjus4MEND+xeykgWamvTtwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oUbtByXC;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F1606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215F1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oUbtByXC
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso332906f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564436; x=1793169236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XfpDTt0rN1tqZZQ9NzVFLUVJCa2Nxf7s33VXO2H8BuY=;
        b=oUbtByXCBGRAYf/94Hy5mFiVX/EOo3S3a9888PZNtD+M6l5dxyrX8RZbT1xWpsPTYM
         0wwMKdnWiTRZ+ss+sxqEyv4/s3OuLFh8RrJHIIjoGknJDJpOTaeuJhbjCyenDwS1jP2l
         PjhKoPAAOtBzYeioDWG3eQ4N5yYGcI7wYGCMmI2nWZxGt8fTxvLHd0gqRu5qKNu9JAoA
         0vwVICOD12KT6Mv/mZchmzauVocAzAgiys/Xijov7zR9nT4r1Kcq2Mmy//gWKcMLOxcW
         BsReoXjukbmwOijdpyL9jOmgsk+bzkQyXzgQ2t6UrcJy5nmSLR/uFWBnPA5jHymCl91u
         XXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564436; x=1793169236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfpDTt0rN1tqZZQ9NzVFLUVJCa2Nxf7s33VXO2H8BuY=;
        b=VM5ahiPiJN8tyrlGO5aVk/OeXj0JZAHTS+zQiX3Z3hLqKg4MgUHNMhyTMy3HpDj5U9
         wHkqRboIYOQ3aVwPqVF/fbjVy4jKN7rQaqfOUSZK+3GDodPKQoTrbF3fiGG+gdaBSI/g
         GztEZ26BC1GoY1FtgDeIQ/PD0CAoWJnHITkLErf2snAOX/EK6xCIuU5S0fh5RL15SEwa
         37YzfwcBoGqfiPU4/iDmCXg6sqfEzv/FjUwfwEiwza0vAeMCXByYTQO+nb8WUkNysBx0
         vE5u38HYPy+aq5N+63IUl2fEaAhRTAnie0IPryp7Rov1/ppjir3QWV32kczFy/wlhinF
         Du+A==
X-Forwarded-Encrypted: i=1; AKwUvBy9pvU1lWWiFnrOvRezPxzEaPdLuruRQkBpafbvoCDGdIPa1jG8nGZmv2D1Zul28+ZPaV5O8gP1Axj7MM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrl7Wn3AjhhuVOmUyazXnRSq+iJRLDPTAnUEmXQPTp4B6R4eag
	+fTOFY704IoHO8p8M3keKjlA9djN0YKpUhcfXQYLvw92jh1jSx4r8Ll0
X-Gm-Gg: AYBFou12HbIpZqTUpRZElQbpbQbmBhTCpIyho7X6Nc2kM8h9LujZ8FFYhyJs2fvgQ4r
	Jy+k1YQHo1H1YOk/LLOBr9x0EV8SscQFltWWB6leE2e2U1bocY+q7Sb51w2qT7gFWEW9LHkPWAe
	1/wRoSQqvjVE5Dq24nm3AMu0K31BIl+Pboalp3wp2o529sKKHDHQzuPosmlFkTwUo61lU1Wo9Pd
	1+lNO6kOiV8nLuy0vSDxvxAkSBmGg/ibDWkvqrwTe6r9NBPEYVTpjGgra2AEisdGIdP6fZZvdZC
	xa9i2wSv9y5yVb9FDXRdD3M6SwgIbm/vcfcwKBjTrDwlV1oR6mos1Ax4jJPXb7GJ06FVtuAeKli
	dPc3dR6yCv/ruOEBy6GCQ1PmfJJ8FKuz5qL6uMs/jmOj1p6HO47Hs36Nmtrmvj2bQmQrmR5iv5S
	IUoU40xlRyM7PZYGkw4bBYHqdjzWyabJnEg27ixOtTdHPzuOrNCBJNkUamxMHtDsaqXylDzbGrY
	yEjblTmmMo9iB6Kb5ULfmttGENnkOEw5iWotYgPnxtuyEP6OdGIJYSgOqvY6W45hBh4Z3xZ5ZJc
	ef+QlveI9sT5Gekn09UKlkIrfbdJlQ==
X-Received: by 2002:a05:6000:46d6:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e264ce32cmr1131712f8f.38.1792564436308;
        Tue, 20 Oct 2026 23:33:56 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.72.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f15esm3726408f8f.20.2026.10.20.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:33:55 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: iio: add documentation for ti-ads1015 driver
Date: Wed, 21 Oct 2026 09:33:50 +0300
Message-ID: <20261021063350.7984-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the ADS1015 ADC IIO driver, which describes channels,
IIO attributes, threshold events and ABI usage examples.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/iio/index.rst      |   1 +
 Documentation/iio/ti-ads1015.rst | 129 +++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/iio/ti-ads1015.rst

diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index d0fb32f4b80f..47ba249dae0b 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -43,3 +43,4 @@ Industrial I/O Kernel Drivers
    bno055
    ep93xx_adc
    opt4060
+   ti-ads1015
diff --git a/Documentation/iio/ti-ads1015.rst b/Documentation/iio/ti-ads1015.rst
new file mode 100644
index 000000000000..214e50c39821
--- /dev/null
+++ b/Documentation/iio/ti-ads1015.rst
@@ -0,0 +1,129 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================
+TI ADS1015 ADC driver
+=====================
+
+Driver for the Texas Instruments ADS1015 and related I2C analog-to-digital
+converters. The module name is ``ads1015``.
+
+Supported devices
+=================
+
+* `ADS1015 <https://www.ti.com/product/ADS1015>`_: 12-bit ADC, programmable data rate from 128 to 3300 samples/s.
+* `ADS1115 <https://www.ti.com/product/ADS1115>`_: 16-bit ADC, programmable data rate from 8 to 860 samples/s.
+* `TLA2024 <https://www.ti.com/product/TLA2024>`_: 12-bit ADC, programmable data rate from 128 to 3300 samples/s.
+
+The ADS1015 and ADS1115 provide a comparator; the TLA2024 does not.
+
+I2C address
+===========
+
+The ADDR pin selects the 7-bit I2C address.
+For ADS1015 and ADS1115, the possible addresses are:
+
+* ``0x48``: ADDR connected to GND
+* ``0x49``: ADDR connected to VDD
+* ``0x4a``: ADDR connected to SDA
+* ``0x4b``: ADDR connected to SCL
+
+For the TLA2024, the possible addresses are:
+
+* ``0x48``: ADDR connected to GND
+* ``0x49``: ADDR connected to VDD
+* ``0x4b``: ADDR connected to SCL
+
+
+Channel configuration
+======================
+
+The driver exposes four single-ended voltage channels (AIN0 through AIN3,
+measured relative to GND) and four differential channels (AIN0-AIN1,
+AIN0-AIN3, AIN1-AIN3, and AIN2-AIN3). Device Tree child nodes configure the
+initial settings for the corresponding conversion input. They do not restrict
+which IIO channels are available.
+
+The child node ``reg`` values select the conversion input as follows:
+
++---------+------------------+
+| ``reg`` | Conversion input |
++=========+==================+
+| 0       | AIN0 - AIN1      |
++---------+------------------+
+| 1       | AIN0 - AIN3      |
++---------+------------------+
+| 2       | AIN1 - AIN3      |
++---------+------------------+
+| 3       | AIN2 - AIN3      |
++---------+------------------+
+| 4       | AIN0 - GND       |
++---------+------------------+
+| 5       | AIN1 - GND       |
++---------+------------------+
+| 6       | AIN2 - GND       |
++---------+------------------+
+| 7       | AIN3 - GND       |
++---------+------------------+
+
+``ti,gain`` selects the full-scale input range using the following index:
+
++-------+--------------------------+
+| Index | Full-scale range         |
++=======+==========================+
+| 0     | +/- 6.144 V              |
++-------+--------------------------+
+| 1     | +/- 4.096 V              |
++-------+--------------------------+
+| 2     | +/- 2.048 V (default)    |
++-------+--------------------------+
+| 3     | +/- 1.024 V              |
++-------+--------------------------+
+| 4     | +/- 0.512 V              |
++-------+--------------------------+
+| 5     | +/- 0.256 V              |
++-------+--------------------------+
+
+For a channel node that omits ``ti,gain``, the default index is 2.
+
+``ti,datarate`` selects the data rate by index. For the ADS1015 and TLA2024,
+indices 0 through 7 select 128, 250, 490, 920, 1600, 2400, 3300, and 3300
+samples/s, respectively. For the ADS1115, they select 8, 16, 32, 64, 128,
+250, 475, and 860 samples/s. For a channel node that omits
+``ti,datarate``, the default index is 4.
+
+The ``label`` property is exposed through the channel's ``in_voltageY_label``
+sysfs attribute. Without a defined label, the datasheet input name is used
+(for example, ``AIN0`` or ``AIN0-AIN1``).
+
+IIO attributes
+==============
+
+Each voltage channel provides a raw reading, a label, scale, and sampling frequency.
+The scale and sampling frequency can be changed at runtime; their available
+values are listed by ``scale_available`` and ``sampling_frequency_available``.
+
+Threshold events
+================
+
+The ADS1015 and ADS1115 can report threshold events when the ALERT/RDY pin is
+connected to an interrupt. The driver supports one active comparator channel
+at a time, and threshold events cannot be enabled while buffered capture is
+active. The TLA2024 does not support threshold events.
+
+The rising threshold value sets the upper threshold. The falling threshold
+value sets the lower threshold; enabling the ``either`` event uses both values
+in window-comparator mode. The event period selects the comparator queue
+duration, which corresponds to 1, 2, or 4 consecutive conversions at the
+channel's configured sampling frequency.
+
+Usage examples
+--------------
+
+.. code-block:: bash
+
+	root:/sys/bus/iio/devices/iio:device0# cat name
+	ads1015
+	root:/sys/bus/iio/devices/iio:device0# cat in_voltage0_label
+	AN0
+	root:/sys/bus/iio/devices/iio:device0# cat in_voltage0_raw
+	750
-- 
2.34.1

