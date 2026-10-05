Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2561A492180
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208966; cv=none; b=eM8mkIls5VgRT/H/ZLnCGqYXTNLM5uP3pCFdiNpf8w9eXU3xdcQAGQWiFHDAIrXE7kxQ/Maa5pveEUSHmQIJpDsVHtvE0IroDIQO7CyI1ALFWWUejeWBwLhs1AmAOIpe2423DNtwPJsMHtRsZgn6KAgNvLlWE6E2mv+FVG7XRVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208966; c=relaxed/simple;
	bh=xA3RVg0V5GA861PqXtiaQsGF9CfvqAblK07IiSV+hrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZjaKC7B9Apgw3YlSGb1773W0Ci1OR+ds3oql+uPLm6vXMSQlIwlmDcYxW6MKS3pW3JESe0nh4xhp+5CNW0daC7LKmWXXyQ3IBS+Bg3kq51CeGXC6e8gqeEsG/yrclR7U/7Zo4Ny8OxS//JE7BQyq+ZOwmab1/kTENKx99hZgHVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=LqPHz02T; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="LqPHz02T"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so17665945e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791208961; x=1791813761; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fhS//ifA4uSYAvFB8p9Kz5PQjbMAFgmGjXQbK6dCzec=;
        b=LqPHz02TOr3GjBcWMnnnN8wmkBjMbV47aQd5QgrdKXorj1Jr6z+0+ZvUHzh1VQFque
         MsaBXHn11WSb05J0AXsl/X83HpTEmpmO2kmcvRTjUll2Zec3iQe4xhiLbpL4Jsf1cu8/
         mcdOVY5Q8fy1gnwXA+aZ82HB/zCnnfxSk8vpoXJJ0SCcsrru/V9VaXXtAlpbY/r/Kt7Z
         t2St2AA9wovylpQhgzgMFqRvKX/aE7eN8Z9/1BG+bNzRFDK4G+H9CkwQfhBROGyBE919
         jLfagUSvsjQA1MB5W4T4i58U3gpTFfp6b52u6K4wO1o4nfI5eGAvca7Z+ltItFyIQyWS
         wMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791208961; x=1791813761;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhS//ifA4uSYAvFB8p9Kz5PQjbMAFgmGjXQbK6dCzec=;
        b=GPJGhMj5hyqIO2/00fLBwIvAyjoKrh9ArB/eNNIDUQTP9AkLWOFWq6DvWf7atiJFeo
         v4J6QAWR+RUko+YOK+huf5x4SqdEbJXGnlSRkebVEbp/NMEXlGDpwtkerSBeYAIa0lsH
         xocb3Do0SfqaJRkZOGbqQfbH18L7ZNAvf3zZzNM1/2gHkQf8E9vQy2esUflztdw+0rxN
         WPYcY/L3xj/h4WmdvVnq/ua3HjMxh2ixpV0GMv4dlNcm0FSh8jOyAd/DH8JXsTJmNdai
         OuPPzjiEMBD/eImAnVk759liH8+Z0tz2lkptM1iFriJImGYWmxMsGgL9Qn7NcPge52jQ
         XA2Q==
X-Forwarded-Encrypted: i=1; AKwUvByXEWSZs+OHRS4DdgsszCeNUk97Uy6J9XGcD7pAjZS8I7welfjPUvTPe3Bajfo2amTZXnJ8T5H+Qt575gU=@vger.kernel.org
X-Gm-Message-State: AFuF++nwMkYATsL8RkkeKdSBTkFY8DBydtQbR+sZawazN77wCyHl9m3T
	5MFnA9xEUVIjlhCGYOYtwI0yNmoFVGQcWSbjXQVCD5Frez39TCrpiHaEHhdLFcfdro5J/HxMf8n
	hj2wBqKPY4A==
X-Gm-Gg: AYBFou1K+jmvqZJXsoDHGc2gP6W+j5p/0HMr5e3TmPh90/27TO1D8q7axbo24eEllsp
	0jkmZr2jQsXPOUtqNKqTq5MtwS63P8l7wc+KNrmWFy6EbP5ntRbhn6x/U7GQ0yBdGPZQNfVPdKy
	/XQxoF6EqPteeQUvMD+UR31zWHv40Vf7Jvcyeb3wTfyiTZJCsH+UkTxyDLsh4AiCajVl8uGvKcD
	wl9uSuQr0IMgpzrjE4R79TT4vw59Yh5xlYGLku4wiIFa0vSVEq/mLl1FUvNkfWL2WCA0it02KQl
	j61+NqxFMPqn3zx1lgO6hvB/CAhlMulnvIwlBWGE6Jp6OdCeFUGSprsSsFpACAhL3BqKoe1j7Ew
	KJBEkSbt0YU6Wgw/cbfAxJBg1dX46mxsxIs1YvKT7n2Q85Ji3D+cnUBrjCbB6Me0P6t/VwF3eZ5
	QOduEfXEMLm8dRcKabfIXAYr3mcCmkHrR0iWTjDMboYZmTMoz2kSWX3uhU+H+owU2WnxTGulqWS
	JLWrrihh1Bx1g==
X-Received: by 2002:a05:600c:1d08:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a1688da4c6mr124937105e9.25.1791208960674;
        Mon, 05 Oct 2026 07:02:40 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9c1b:24c4:d43:125f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm324052715e9.15.2026.10.05.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:02:40 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 00/12] iio: use designated initializers for acpi_device_id
Date: Mon, 05 Oct 2026 15:01:56 +0100
Message-Id: <20261005-acpi-iio-v1-0-2796f713945a@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBQE0KvEXyeoQWhXiRamv/otVLQiiO6e1
 WbgwcxckDERZuiqCxIelCn4AlFXYBfjZ2TkikFy2XItNTM2EiMKjBsltLKuKQmlHhNOdH5X/fA
 77+OKdnv3cN8PTv7V/WwAAAA=
X-Change-ID: 20260929-acpi-iio-0a8198cd3198
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Petre Rodan <petre.rodan@subdimension.ro>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Alex Lanzano <lanzano.alex@gmail.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, Eddie James <eajames@linux.ibm.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux@analog.com, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791208959; l=5721;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=xA3RVg0V5GA861PqXtiaQsGF9CfvqAblK07IiSV+hrY=;
 b=De5qzg2kZQ/9gxE98+DaZs8ku5NZpTY4e3RGq8+NzSro8ZsETQTRFgMsJ5IE9CTk+1bESDfDQ
 ZVx/ZgIXjNsCtugRZRE/IcmdgBjwYdWgEpthJQEoHe77bWq3LvEpTQM
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc6.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (12):
      iio: accel: use named initializers for acpi_device_id
      iio: adc: use named initializers for acpi_device_id
      iio: dac: use named initializers for acpi_device_id
      iio: gyro: bmg160_i2c: use named initializers for acpi_device_id
      iio: humidity: use named initializers for acpi_device_id
      iio: imu: use named initializers for acpi_device_id
      iio: light: use named initializers for acpi_device_id
      iio: magnetometer: use named initializers for acpi_device_id
      iio: potentiometer: max5487: use named initializers for acpi_device_id
      iio: pressure: use named initializers for acpi_device_id
      iio: proximity: use named initializers for acpi_device_id
      iio: temperature: max30208: use named initializers for acpi_device_id

 drivers/iio/accel/adxl345_i2c.c             |  2 +-
 drivers/iio/accel/adxl345_spi.c             |  2 +-
 drivers/iio/accel/bma220_spi.c              |  2 +-
 drivers/iio/accel/bmc150-accel-i2c.c        | 24 ++++++++++++------------
 drivers/iio/accel/bmc150-accel-spi.c        | 16 ++++++++--------
 drivers/iio/accel/da280.c                   |  4 ++--
 drivers/iio/accel/kxcjk-1013.c              | 22 +++++++++++-----------
 drivers/iio/accel/mma7660.c                 |  2 +-
 drivers/iio/accel/mma9551.c                 |  2 +-
 drivers/iio/accel/mma9553.c                 |  2 +-
 drivers/iio/accel/mxc4005.c                 |  6 +++---
 drivers/iio/accel/mxc6255.c                 |  4 ++--
 drivers/iio/accel/st_accel_i2c.c            |  4 ++--
 drivers/iio/accel/stk8ba50.c                |  2 +-
 drivers/iio/adc/ad7298.c                    |  2 +-
 drivers/iio/adc/pac1921.c                   |  2 +-
 drivers/iio/adc/pac1934.c                   |  2 +-
 drivers/iio/adc/ti-adc081c.c                |  2 +-
 drivers/iio/adc/ti-adc108s102.c             |  2 +-
 drivers/iio/adc/ti-adc128s052.c             |  2 +-
 drivers/iio/dac/ad5592r.c                   |  2 +-
 drivers/iio/dac/ad5593r.c                   |  2 +-
 drivers/iio/gyro/bmg160_i2c.c               |  2 +-
 drivers/iio/humidity/hdc100x.c              |  2 +-
 drivers/iio/humidity/hts221_i2c.c           |  2 +-
 drivers/iio/imu/bmi160/bmi160_i2c.c         |  6 +++---
 drivers/iio/imu/bmi160/bmi160_spi.c         |  4 ++--
 drivers/iio/imu/bmi270/bmi270_i2c.c         |  4 ++--
 drivers/iio/imu/bmi323/bmi323_i2c.c         |  2 +-
 drivers/iio/imu/fxos8700_i2c.c              |  2 +-
 drivers/iio/imu/fxos8700_spi.c              |  2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c   |  2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c   |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c |  4 ++--
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c |  2 +-
 drivers/iio/light/acpi-als.c                |  2 +-
 drivers/iio/light/al3320a.c                 |  2 +-
 drivers/iio/light/apds9960.c                |  2 +-
 drivers/iio/light/cm32181.c                 |  2 +-
 drivers/iio/light/isl29018.c                |  6 +++---
 drivers/iio/light/jsa1212.c                 |  2 +-
 drivers/iio/light/ltr501.c                  |  4 ++--
 drivers/iio/light/max44000.c                |  2 +-
 drivers/iio/light/pa12203001.c              |  2 +-
 drivers/iio/light/rpr0521.c                 |  2 +-
 drivers/iio/light/stk3310.c                 |  6 +++---
 drivers/iio/light/us5182d.c                 |  2 +-
 drivers/iio/magnetometer/ak8975.c           | 14 +++++++-------
 drivers/iio/magnetometer/mmc35240.c         |  2 +-
 drivers/iio/potentiometer/max5487.c         |  6 +++---
 drivers/iio/pressure/dps310.c               |  2 +-
 drivers/iio/pressure/hp206c.c               |  2 +-
 drivers/iio/pressure/st_pressure_i2c.c      |  2 +-
 drivers/iio/proximity/sx9310.c              |  4 ++--
 drivers/iio/proximity/sx9500.c              |  4 ++--
 drivers/iio/temperature/max30208.c          |  2 +-
 56 files changed, 109 insertions(+), 109 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20260929-acpi-iio-0a8198cd3198

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

