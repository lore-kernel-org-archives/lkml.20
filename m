Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260152;
	b=F6BPwbAfn1rSwwlbNDDtvF3g/rz7itZpjiWWertyun+7UzrTe3AnNU+g1fhaXwJjgK2b
	 PHD+m/CfXKjH6lTKJqzOcZ46I2hpM6Sbb9oTg5TImmy0ay/1Rjwxs8EbSSrYKdHtR876g
	 zv2sInxg3pt/mlEarsM2iWVLEEB3c9PgAU2N1LszvvhGUPIxTPOmZs1BqcwlMZgD4eJfa
	 kEA2uH6RdkDGcvtowkwR+KpK/0t+bf6JGVGNp2ZnWQdd+TxLy6mQ2ijx0+r0+G1h79LaI
	 caLO0vbtQgGMJdz5FvXXFw67o4BtgQbSXVU/S7EhqVBbXmmDo+WYcCN6FWSXXwAJqcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wjBhfqfNAu/i5gAOXlQoqv+CdHzgKo3BKhh2OjwT3ic=;
	b=uLw8u7y0NvuQv4JdAvnVjVoD+EbfFM5H6g4bySXmOxx/U+WKzsB4efm7tao0Jj/Wi7+K
	 Kb/+fLWA4AUm04tT1abMmkgEirUNCJ8OehF5bc1oXc2rTKzGvyso2848EVbYYxuw3QvC3
	 LYUM7GEPv6SEskOh8o8/o7/4fLaWLUpC9n01LGI3cuj0nQO0Qu3iO1HCbkQWqqyBeLXiR
	 Yhab8Pb7MjuPUoGubkLMUDnc2PQQAut+Ah8qJtXzwgvpNyAVRGX3ElRN/W5EUqAekQFcb
	 2Y82uNLIND4IVX4B2rxvH5smu1X37dei56Cgr8G1I3Tz/b3NXerg4V6Qe/agvkOswKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dzhPO/fQ";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783AE606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783AE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzhPO/fQ
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-188406bb948so1683478c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260151; x=1793864951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjBhfqfNAu/i5gAOXlQoqv+CdHzgKo3BKhh2OjwT3ic=;
        b=dzhPO/fQ+cjkXDXTba4hzk3aU4lQNEW609vZ0j9AIO5xatasgpNEIaRGNf35MYcmjq
         578l6fGt7d6VcSXf01SaSR3jDoKd1GnWkojLuuzeDghqGZicrIC2ZduBi/0daspyL8bV
         Ejrqfs9puzM2EqfBCQ2IEct9DJRZ+MPEszMIb9ofj/DGxAfpaQhPidkAK2BY5/Wt0NfD
         b/rb4E81rK1vyPqFoECL8ARH88Pm1HJe6ywpzP3ZNIU/op7Bh9/onO0PnQcyOiEZCtiY
         /Y30AxR1UxyR20z0yNy4S2EdZpAzV1LNNOdZvkzOis9TXbTuVwlOHIxlu2CgiJFZf+20
         ovOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260151; x=1793864951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjBhfqfNAu/i5gAOXlQoqv+CdHzgKo3BKhh2OjwT3ic=;
        b=hbULq0HHujPETEIhdo/MqrygOFYvFAKqCMdOF/8Qp+xsS5wUCzRq5bBIxZ7taX43Sz
         SJZ5nEA7m2rhm8E6s2ODZ7VvJkT9EVRGgvDLw2BZC0lJ1u/bhi1tonCk6qjQnuyYQYzm
         8HBGBhW4lVDmFXB49j9iVJsYx216gpL4RQDgIcPyKJ9AajVFIoP2EQrJNNoJwU56ly8W
         OgoRn5gsDC1HXZYMZLw2QPzvU0OcElrezOuR5FhuiaKzPvGl3UBGp8ePGvfKgjmLZE1V
         sS4P/y+9chKRx2phwf76NMXaNb5KLC5EeXfu7SaTFZYRUV0ETcI7gMRT+r6qJOtveeLR
         Bgig==
X-Forwarded-Encrypted: i=1; AKwUvBz5szZuH/wdFRQMqg2z5+pu8eWHwxUWd9TAgBcIDxtk8T3dRa7wxRAFfjlN/VU4tovU/NSMFakSrm+UTb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIg1QCRqX4Epzy9vDCnm7m1jCQ+o3hGHPpdlcYOEhWV938MLYf
	Fo5MtuZEEoskW0pVo/aJPlfLN/ICwu2GJ3+3k9pvlfD9NadrfWpOdPfv
X-Gm-Gg: AYBFou0e5wPTeTKy28Lzql95sEYEXyhADUhH0FoDJa228eRzYcvIwKnOyu88UuI4wQw
	7ffyI5IydIw5ey/v+zyjhNImTqMG1aoCzGHrpTC/Tt2V51pUfoukkouxsPWPgGYrgOsYKtCBL62
	HxhITC6pGdtyrOqxR9djwLOLCCdDwB7s3oDXR24s3tS0e9gUtcCoMfAUXsIJiutev83xIhsuUNz
	rgUEmGcUM8liXB8NHRln2HWBP4d49jsB1P1CTGeKJIBBaMfSnRLLJ5YVwZI2bMKl+oTmDDXfkHT
	EO+MeP72t0a4G4akQIbI6N2dd2P/Y2OYXtsxe7zXBfKC0zcojsYzfQNYYeuk2Te/idNuEdhEVa2
	tTnwzNjSgHoJ9jRRfREIVJRE9uCtF7UstT69V85WXkbbKULSdQDt8nzE6We/ddrFVyBEPUB+U3v
	qpkBqcH48kS5VcS3FuDj+1/eg8tVKtwyld394CAXWwsC9W/v6Z52UyyUctlW4vGCEmvoUg3hBM7
	vZK7ecOBMBfZHAoQvOojocVDNA77xHSWD4g/9wdXPiKsWjnMajkktWS95shNLCk/sW2PQE1huLh
	KDcl0DFpk/ZHoi/PCjcoYNEK1UBz
X-Received: by 2002:a05:7022:b04e:b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1a9f3d262b8mr1402604c88.36.1793260151194;
        Thu, 29 Oct 2026 00:49:11 -0700 (PDT)
Received: from localhost ([149.28.89.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm18486398c88.21.2026.10.29.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:49:10 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] Add support for AS7343 multi-spectral sensor
Date: Thu, 29 Oct 2026 15:48:49 +0800
Message-ID: <20261029074851.216029-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series adds initial support for the AMS AS7343 14-channel
multi-spectral sensor.

The sensor has 14 optical channels (11 visible + NIR + clear +
flicker) in total. This initial driver supports reading raw counts
from all 12 spectral channels (11 visible + NIR) via sysfs and basic
power management.

Not yet supported:
- Configurable integration time and gain
- Interrupt support
- Clear (VIS) channel and flicker detection

Patch 1 adds device tree bindings.
Patch 2 adds the driver.

Testing was performed on a Raspberry Pi 4.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf

Changes in v7:
  - Specify reg as a const.
  - Move additionalProperties after allOf block.
  - Clear/set PON during suspend/resume.
  - Check for digital saturation before reading spectral data.

Changes in v6:
  - Add a ref to leds/common.yaml for the LDR pin in dt bindings.
  - Convert ATIME and ASTEP range checks to runtime checks.
  - Check for digital saturation before reading spectral data.

Changes in v5:
  - Remove the GPIO pin from dt bindings.
  - Add autosuspend.
  - Start measurements before setting up runtime PM.

Changes in v4:
  - Fix led-max-microamp property in dt bindings.
  - Use REGCACHE_MAPLE and add volatile table.
  - Use PM_RUNTIME_ACQUIRE* when resuming.

Changes in v3:
  - Fix gpio description and example in dt.
  - Only start measurements after suspend action has been registered.
  - Add a mutex and pm_runtime_resume_and_get before reading measurements.

Changes in v2:
  - Add the LDR, the interrupt pin, and the GPIO pin to the dt bindings.
  - Adjust the default gain to x256 and integration time to 50.1ms as
  recommended by the datasheet.
  - Use read_label instead of .extend
  - Remove all unused scan_index related constants.

Chang Yu (2):
  dt-bindings: iio: light: add as7343
  iio: light: add AS7343 multi-spectral sensor driver

 .../bindings/iio/light/ams,as7343.yaml        |  64 +++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 491 ++++++++++++++++++
 5 files changed, 574 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.56.0

