Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A442C2C234E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022303; cv=none; b=QU4gb3glj9W67+UVyy8tKJL4XVNMUs6IgqK3JRkH1DTe+iFSWAzV9PfX0v69vWXxY6EKqiqzexyEcrhLGBipCPUfruaqtQa2tFt/IvgAFjPEmsooQU+OxriSQowKT01GREjvtrnjYt0leKEnHsIDKB5xyYQbJx6aIJrA2Gb2y/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022303; c=relaxed/simple;
	bh=3YzZMhV2Kq9lLtJSLI346uWkJqVEa6j+MtFmvDNeOqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpopOjdLJbc24+C7Z0Yui96iupOJoEV2ittM77GhWtje1Se0mXLQA5xnCxqhwBxzPwsDZHOOsM8MmbqXVWYdsacejpsK2zBKmVwkIDDbku3QBWQA77e9o/NnprgxsPkCK8pLxQKzJpfqDyCbAOSOD/8UhNUmc0rsqyJp5mA0juI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFf22cuf; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFf22cuf"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8664769db58so49700077b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022300; x=1789627100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKnrAbcjeOnk62ec4y5R13bg9Rx0FTj94sh3BmJh88o=;
        b=UFf22cuftVa9BulfSEJ1XmYo3xpz5sXwwzq9qkkDc2Yl4cTHGEg28jcuE8xPYRE2Hd
         Bi0ml8Y8DzEBEyFHN6Hbsp0pJd9ogtkAS9dSnA/M8hAVxtI4t56LxeYtaziYtEqHXLY+
         mXg/YZhs49AYBZGYadacIeMnqsGG7fWjW8qiqkfOtTZpTtsCGiq48qzKu9FesW6hPyb/
         ofvbKZQYgJ1Tgz7vztXXS+peEYnSIVvFJUl49TXiCfFQaE7FSrdByFUaJee0BgDl+cSi
         eSjkmmdGA8Tz7IFziqHJfKtrH7iR2MDV+b8zoy95k1ofkBkoDWGWtP6k3qCU9W7I+ZuN
         kjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022300; x=1789627100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKnrAbcjeOnk62ec4y5R13bg9Rx0FTj94sh3BmJh88o=;
        b=VRyzR+j6kE++dcXY+bKuwhOmHHM84jsFGNqhs9aGEW0pHtQ1znpuTU6N/bqAtj2Awe
         8EavBvk6ksjagQKop27M/AKxJq+x1tqbdz6vEPfSaJjlzPws48qXdGNaP8ocNUhRND9H
         QqhU4PWGJ0K4ygp81JfMve6bC2/F6C5TXt8//jxMx5Jtn3Ubv7VQp79evAcg+UrYqEs/
         +hF4k64GQVVqDOgl4xbapjUwHNr21PmwBkr4wl2BJxK59cXLQgVj8tmRSXPn0d4ngdD5
         H9dbntcAYIpbaXpA28swiydXwyM4y5ySAWDlXy56RBEHH9T9K+bEH8b99x2xcDnHpsfG
         hIBg==
X-Forwarded-Encrypted: i=1; AKwUvByB/mO8XCjDsCsgBTjqd+lyIOWiTPqWrPOdyi3JS1LMBk9MRUMZdpNR+BYYD7hz3+ZY58436NN00RUuOu0=@vger.kernel.org
X-Gm-Message-State: AFuF++lDi73ucA0ZtCNtQbLQixOVTZT8A2vfxXn5CwJX3AMECFSbasjN
	hZ3sxY7kEGzC1V/pzFx5Ca/Brf+Xmn7ELyHW8swxmpVxqx/9M3jCWXrw
X-Gm-Gg: AYBFou16Uh+lSrra7iBfLAVyu75a0O4g7Cn7jz6uWFz5Hy2OLu2jSzb9eNq1Ang4ORM
	nhPhY28xexiNc0gpif7vgQ3kLFi3T/ILB360k6/rYt1AOSXjnD2VCYRAOThBNX1tnrSnxaQNq1Y
	BPQzauhLztlYfR+JnfT7SOzbrgviiol4k9ZHs8EPbvaAAT5YeWWhKVZ/ExawJ7TEQa2m9DrPcW2
	XO8achTMncxhKMK1YTaTZBZDDnAfdDEMpD02SzBtvl9SlCYMdkQDfYoVQAq7wvGkAN7vthXgOB2
	Pz9zOocFKiVuBTHx7Tf2lmXHFDSlxgH6hXNTUlFFwyQ8DjcTUfxUtRTI+jUQzOQnpI18PiNvrTb
	EciPpdZ8N7oo46zgrLQuEgxdrHLupmV8oyZc4y+sX1S+ytsFyrwneCWK1Ch0rwnWD9RIwDJbS9q
	Jsn/AOfOMldTSHJZSSD2fqjnAOLg5Q/G1p6+2uiA5nuabLOHLUoyZ0FA==
X-Received: by 2002:a05:690c:31a:b0:80d:964f:88fd with SMTP id 00721157ae682-871221a70cbmr173607087b3.5.1789022300655;
        Wed, 09 Sep 2026 23:38:20 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-873194f76e3sm105440077b3.5.2026.09.09.23.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:19 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3 0/2] Add support for AS7343 multi-spectral sensor
Date: Wed,  9 Sep 2026 23:38:11 -0700
Message-ID: <20260910063813.56419-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

 .../bindings/iio/light/ams,as7343.yaml        |  72 ++++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 397 ++++++++++++++++++
 5 files changed, 488 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.55.0

