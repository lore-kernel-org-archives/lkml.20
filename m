Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8FC364933
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587617; cv=none; b=kIa2BYBppf9dZsDpmL6LWvwaBZ4CMkBhO+MCCP05YCdrvBmSbmXm+g1Zg7v/vFwKXdv0Y9XlMObgjhwWW0Vl3+O38MSYQMXxSG/anqwjzED1AhAeu093/wfNq5KNLp8VzAOLfV9zAGXgnzAf+LydEBfdLoMlqME36Sywkjyq+Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587617; c=relaxed/simple;
	bh=GlvBmDe9HBgmOBC+ac7r0fb426/2Lt7xm9O3A4283o0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDNQfUoq8bB7YmkQoXp90kDp2IRKY46RhAHtiytJ6t80x5xVioG2I/UtlvA5fp49GaAGmUp/IN6NQr04vOpGDX2UBFl5lsg8E5KoLgU7HNEzFmUSGrMC77XQYl+PQEj1xI83sOQylRWyxjQFDI8j28sknShj6Ci27ZF1fYzmx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9927jzp; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9927jzp"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-86c0e4dd49cso22622207b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788587615; x=1789192415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWxHomrMj47FEZcQbKS6VuVqMA7sj5V/Mt3JaM2UCHs=;
        b=R9927jzp7hM+qTLkoVp4mDvczWeBrAz3L5c85IvI6hra/rZQfyGXLUVS68KEm9iIUM
         yptcYLinjf1pfJ7olOk8DvZwJ1fFp5g0mS2w1co74bxYwxIjseoEuSyl9Ekm+38GH4Zi
         bCORKi1qjOLnndLa+zFI7Z+IBa3W8Ngdwulhgi4C9OR9uR8mIJXekpumhwMGt73UYWmv
         5Yqhm3ROefcHYrD3P2MpqlXawDWiJYtJp4lwy+KFk3i8Xo3ntbwRrAmqj/AyEWy8ok+J
         65zsaK101AP6uHiHlrc6BtxdOLit+MKo55f6Y9EuZKQ+dKWtqbUuiAkfTQchRtvgfwNH
         l6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587615; x=1789192415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWxHomrMj47FEZcQbKS6VuVqMA7sj5V/Mt3JaM2UCHs=;
        b=rgC7f63CygeMzqhsWyAoN2+9oj9CtSZgIZR+MkRxKUPSRqPOji9mGrkqh+7811LCQy
         h8poZ5WC5jbI8ir4796S5lB6PszHlr/+MmgVOrZcQ14qKAN5ZwQbsD/a09RqemNTZWNF
         89ROpZ3XP5U/Ayheowp2Z6EFbuSsgDoNZH0m7806ZjiZtSS7cAPJGF/bqTn8fF6vvTA3
         2JqHAAePFogygMSQL8DYdQcrcWiUzVoI/LtHtHqEL6FaequTjQEGZTCpDX+WFu5rLI7L
         ikG0CvxnTEhJGTmk3k+5yMQ4udGDN3B3ZTCla+QFykzMWlIhyDEUTVl/UojdTFMo68Ab
         eDuw==
X-Forwarded-Encrypted: i=1; AKwUvBzJwZO8ETB8S4+430zUyVMEfVfAt726bBjInATBsW9nmO5SvAwptixd+Ib0GgkPcsM61qlNvBWWBSEroWE=@vger.kernel.org
X-Gm-Message-State: AFuF++mcSGXzpxK8fT7WzPoaP7SrESlsV74ydpHlJXTg/aUwXlCAS/XA
	rEnNeoXCkQRzZz45AVL2h7/H88XP7wk8H3ILyPKJ/Anp2PLUJ2Q9vfGX
X-Gm-Gg: AYBFou2cRtEFqhFiSe7+wYGMeDTTf8sIdm23VY4lMDxwtQqL5AvVmA+tZ6zLaildXNu
	oJOhvjMn+GwiUlZC67x5NKs2igGgJ1dHYzfWOjKR6hDZlY8F3RjJfUt2sdr/UXQDQFHHgY5O4jL
	mIP6oTzzcNEkrMZ8iV62B6f06f10DF9Qgvw2kuazFq6nEtemI8uUJdUtkObEcMARZUM5sPWPd1/
	Xr+Wv3qq4rVZdR3m66eAlSPJfVAJUmA/XpIadikllrwJZE52fHfxGhjDh0QniLUXxfuOXhBe96M
	QGaG7d2k1FSTqOCNX1uxlB/pq4cJQ86jTevqzHcp4Zsofvg+8EFOjChemPv93anb5iAHqhg5Cr8
	8x+1bSAJ5vjhM5Cm7pOLbpN9O7TftlkxOT0KUdj/8E3JHi7ZJlyZtC9roOkqlVoqlVmfXSMegUO
	s79UrvkiFoDKbVbXBMR1iQtIRorSoLxRRIfjcpPBRiBys2
X-Received: by 2002:a05:690c:660a:b0:7ff:87e1:34d1 with SMTP id 00721157ae682-87123717b32mr52875547b3.11.1788587610127;
        Fri, 04 Sep 2026 22:53:30 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87143ca6ddesm33717067b3.2.2026.09.04.22.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:53:29 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for AS7343 multi-spectral sensor
Date: Fri,  4 Sep 2026 22:53:24 -0700
Message-ID: <cover.1788586814.git.marcus.yu.56@gmail.com>
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

The driver uses `extend_name` to differentiate channels, exposing
files like in_intensity_F1_raw for channel F1, etc. via sysfs.

Patch 1 adds device tree bindings.
Patch 2 adds the driver.

Testing was performed on a Raspberry Pi 4.

Datasheet: [1]

Link: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf [1]

Chang Yu (2):
  dt-bindings: iio: light: add as7343
  iio: light: add AS7343 multi-spectral sensor driver

 .../bindings/iio/light/ams,as7343.yaml        |  46 +++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 309 ++++++++++++++++++
 5 files changed, 374 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.55.0

