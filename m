Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF47C31F9B7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789177162; cv=none; b=XCnwS2mMKOKRqeYiD5O74X9U/mr1i4oBDPbEdkPDAe9NGI/N3EE4sOjBKhkiQTLyT89wcAM+AOHAW78sUaky8EYfb+UGaNsYbFVzPzjtlaeW0Rgd9CcZb3syVKVs/lk0H6NdiyTVx/DejKxYgj1O2eRP+F2GRPBUXpPK08QTwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789177162; c=relaxed/simple;
	bh=ptpKRlILh3vy2G4ftYKshvhPYqbk/M3xp8SzkyOJ56E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mn8+VlVdDCEbVYZ5pANjTmw5I++g440JSr26XaezWJW5b60gkn8EZAtT1fr5xXmxSGnKDZZSbxS2zOYKeHd566QmVAELcJivIBDPlqqcai7MZWruzoPFLgppnND90CCzzMRJNrI4Jsp3A6wdTh/qnQlNhS7fTcO5RBbnDbl9ktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOgVdFjI; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOgVdFjI"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66c70f69d3fso1736314d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789177160; x=1789781960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8SziI5Cbw/9BaPigJwwxI7zbv9V+0J2bjlfJq82EFc=;
        b=SOgVdFjIKremXvtCBctMP8r3y6iYMRuDH9zg7f3oif/NmgOgQ4G05+MZEiw5+9YCmx
         ipR/ki32tnHVEyozmrS4MJKE0icOmEcPFUvoT2iMR536z2H9NtR5wY+9+kbqc2dUkKq5
         kBN8oRquxd3alPLjkWNVppiYPJTUbcLkejXYzUhtUlUVo1XZrMENehSJXYBSNnN0/+vY
         g23o+NX+M5oashRo4MwsCoeHqCglu0satQI8CogvJ+X0uuOnfYy1zVHN6RXMQoKYCCvk
         L/qjpSE7ufLjPp+U721KcNdIrXeQI8RMNAnRNLAuo/wVs7tCGzyQDCsnwAlfXEGLRbNd
         7yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789177160; x=1789781960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8SziI5Cbw/9BaPigJwwxI7zbv9V+0J2bjlfJq82EFc=;
        b=pwx6peOaqUXsBuMw0SbyXyN/cTguw171ErK+z+JrXLvuFATVL5f7ucji3jU69iTA0/
         nHmcARnN/2sPFpUK2K+eu4jHC6k5eVuIsjbJaikim+oam3fyDNz0Tjoq0QNBnhQ2n+Cs
         5jNBoILT8JpIJ8Ftxmnyfahuw0AxGC2NM40yypGF3uz5JIgCj50h9mTz69/h/mSteCCy
         VjVQqZiCxONGJ9PHGiAuLoHFb/kUzxKi40m0bHoEP0jBagq+GcZmTeQ9B5ROtAkFwrDB
         rHF7xZY/KVt+UI+EnEEmFXXGUYeX6BsRhuukhv/uZKKI0WDsrAXxL2ffVbu13ua5kNFt
         68iA==
X-Forwarded-Encrypted: i=1; AKwUvBxyI10INK6uabdv8MMAmjnvxOQGelBNZJC6mrKKGz9cDU0nnBfo5o5kxWL7RXpKqOLJen4RVNJcuE0FY08=@vger.kernel.org
X-Gm-Message-State: AFuF++m2N/ad4NvEbcINYPPyQ9+PSZrJevWfhd5HtQ7Kc0TrGaB613R6
	QSps/LyIW1CAZrpOsnkrxl8se82c4HtKydExX/rpQiNhK6wyEGY7KRJY
X-Gm-Gg: AYBFou0vWsThYjAqDbDjfGUOpglNydegcIG8jwHDvPdpKMl3z67ry1NdxrEh52XB+pP
	D/+HDa80TaKGBKDfFBRPJOk+Ut9IpEnmgiceQ9SCt3HBghZcBXeynme+AFnUrFgp+sQ6k83Roe1
	97rih9EsBT4pGbPnsFbAFS3qdNzOf/xfFwyF1YHiiUEyVNhMtY9sbkAqWRlBJ1/Hws5KnY0pPF+
	SWwRnYHnbni0Hm6d8K8W78qhoRmZQzIr+M97m2tgC4KZ1wHsQHRbUkOAI7E18oULepLD29M/wzS
	Atdue2sTE/bcsTRrOc3Z3MeTr69qwwulLKr6GgkWsy2fqu9YRTmhuRs96fjZrTdOCKCcGETG7vr
	+9AZwF1uMtajaWmy0+8srHynCD//nfRClZjDszbbIxR4BWZrQB34PXzfZdUV4AzAp6/aphTxCqU
	iZHdhbs3+0Rn24P993bacQ7NZCGHUqMSaJnIVUOoqPdf6+SV71u0Htxg==
X-Received: by 2002:a53:d950:0:b0:66f:c24c:98bf with SMTP id 956f58d0204a3-671246d16b1mr2103008d50.46.1789177159642;
        Fri, 11 Sep 2026 18:39:19 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df315fsm1751757d50.9.2026.09.11.18.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:39:18 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add support for AS7343 multi-spectral sensor
Date: Fri, 11 Sep 2026 18:39:10 -0700
Message-ID: <20260912013912.51887-1-marcus.yu.56@gmail.com>
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

 .../bindings/iio/light/ams,as7343.yaml        |  72 +++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 434 ++++++++++++++++++
 5 files changed, 525 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.55.0

