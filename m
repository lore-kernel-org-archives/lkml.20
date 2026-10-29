Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292859;
	b=32FyhlfjPZZax3wCZxHuquLFZghV0wozAIQvT1aZTBO5tEl4m4fpRRwA5cQz3wdCW67w
	 MiV1INx1E9I3u19VnbcLdX9nzNa093U/KJ7Iad+U8saUGcJv1uVj3+GwAYkA8+EZUmpzv
	 iUi84NGtL7plZ/iVyN3qpOKAKRM60ePY/Z6rRC7TGSPnhf6WTfqm/Y/PZVoQZb4WvTFky
	 0cnpFtvrpFfFYscr5dnpC7bGtpXGftfTjmUyUP4OL/Frc+q4fU5Dp400sNWsA6y1+rm6J
	 jqGumohNVpA7B2MSLVu4faip8CDRwv9vjXrV4IrFdja4jafB8ItMFak/6sqUsHv397g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4fqK3hAODSRW6r1VhiRWGFiqfL+4gwc3km1pG7Ow6As=;
	b=DuvxI6eULEsQ/026hS0xKT4vQM6MgjfOJ6vmCK+SgcxeRFzsQ72pFRtF5FjaCLfoDJZG
	 18U+i87s2LERe0MctT6yBqkHkmmPSkyaThZhRMyFbThq7y5XLbmqJDAUPcPhELOY/+mk9
	 q7BZICBMCI4o5xJmLBVO1oAVvk21SrCsQQSfRvD4b32GZzJohJFBo6aogijHlxSEFEGjG
	 JFruZPUYd5yC1qp6rSeXZl2TFByTSnCQgP26Txiwo91BkCMHSSigA5IPtVMhLMKRm7rsv
	 huMXF394wPjwzGVKFix8IRNWSmJ48g70pA4sC52ALRzdzEUBwtl9EdnKq7WIHMsL4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="nP1Da/z/";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1734F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1734F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nP1Da/z/
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1383606f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292857; x=1793897657; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4fqK3hAODSRW6r1VhiRWGFiqfL+4gwc3km1pG7Ow6As=;
        b=nP1Da/z/q/xW8Au3vEhGnd4WDCw2F+3e2aLKen3ZNVKStYAKk770M2M08RSZm75Pvo
         nmQj6uUlhRItsPyH4DYchXhqA9Hp1r+Es95lmD0OfGPaU6s06ku/2khG3oxaXDSqtPns
         fEUpKsgWTBpQXPqvMvLQ9sMQ5jEDsV4gN+MPXQxlItWW8Dw9J2bojh/ABbwzOP/rGvUI
         6v1GyP+cAunRbRJ13x3djc3tKIiYrMtTek+S97/rtreb+LN2tlI9E39cN7MAbp6gGz4W
         9CMe6N1v0NCgioWXq+IE0cIFUkRVg/emiOH98T1agIZ0FbM5dJsgmd0XTJ8NlmMQpyTu
         oTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292857; x=1793897657;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4fqK3hAODSRW6r1VhiRWGFiqfL+4gwc3km1pG7Ow6As=;
        b=IFAqWfH5/ToX8k6XGjjHA67SgeBWnd5WUl//sNoaehuhSplHvdiZzYzlZBvmumdXVs
         By0JxQwPm9oxLK4QzEzm78+KaY2msIF9njsOL0718Bn3mcFDHoJV+yF+YWTy52ElBHYi
         SUM9iXBmqJMObXY1j2gfmeBa3rw6YdJOJuBMabp2oHqEutO4X+/JheGsqiyPthMRgbNw
         6LxhRvqHR6/7e58xUDwSbV8TSipiEB9z3MvAdPgPDRS96hsMFihKRQR3+x0t7/EiQTto
         2BztSksJc7+XGAB4+1ZsXk6Lr78nxT/ipvOEAqFvN8fvx+vaCiVv+pCWofdlwj1AWt3t
         7WJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6D3V512yrGj0G+nDVAt2SYe4XpMZ2dULKlxHBg+Dy/qjm1OwWqrtF4EjCHSLCkUkXhr07ipw6euTUxoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtsNVjHg7i3nOpSJ2GSK66Irv+cUURvtoJjANOCgO2v5/a1cJ5
	etByuMcKGMkJaBJVrrfDIeYPVmLK4eNvy+fJ+0ySAIvAc87F4Ylkgi51NOg8XZ2YsDQ=
X-Gm-Gg: AYBFou3zz1Cau/sajHOywXclR8V2tAUeEB6Usbcf1JF9e8oGYFYLzaoEnwgkVTF4G1m
	ncPCvyjJVkmYKebJBNPFUCrVQy1KgF7ABXwHExfjGygcVv2CK/ypyRxcd7spKxEd6bojBfbQIfh
	Vs8wQEzgDm5JI9nbUgh1qDFFYqRIYTpcZjlIIuzWFNDEGk56sr7rG43e6JV9Z8V5Z5sRq4bYD/D
	qH6uKVh42HXY0iDch1iLSqSuUcqbGwgLeG3KvFsjRILJlV055QQEZiGGV5aaW8mDBzlploOla+9
	3OsIXXAYrtaqCRPHb3ZZaiBghIVTeRpwG79K6trvh+OdWqjKrQLNsJQqYTT2gME8rnx3QARJnNa
	RYmQfPLD2P67BwtQjOovbO1KYthON249yesbn8WQvvp303onW0zqumLWmJGTJpObOx83nN3Gdnn
	CvfnPXbL2UCrix4QJycrkkLom9VeEbjQvmgAVrY6DpJrtuQsviMhI2A6Df/zgoo9bhqUQczALbp
	T6sCdyad/avl9AKZFWwapuJ9KBJ7nDg29q0xTBYh/tz1eXyQtSWFphDXHKdGO3gNZnW07/56gmY
	+HganOXdFWEKMsRZPf6JL1zbQ9ezeUHrg6zhkiYIGOBoOLaIFY/sy1LhtzqbIuei
X-Received: by 2002:a5d:64c4:0:b0:48e:4831:ae20 with SMTP id ffacd0b85a97d-48e5d5c431bmr13761110f8f.37.1793292857370;
        Thu, 29 Oct 2026 09:54:17 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:16 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/5] media: use designated initializers for acpi_device_id
Date: Thu, 29 Oct 2026 16:54:12 +0000
Message-Id: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVhioWriEU7HYzET1pEIu6uW
 H6L9y4I7IUD1MkFng8JsswReZoADWbuWYmLBsywyjNEZWgVNbETo7DotKVSW3QEMVg9d3J+s6b
 9HXY7Mm3vAe77Ac8n3qFuAAAA
X-Change-ID: 20261022-acpi-media-24f3bc53b2dc
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=3700;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=aKOyFQMF1NTxCOSdz5v1PrBbwjwRSZJSG4pYy2yMJls=;
 b=tv5LWl+kMT80WwiF33uegV2YVkKehIr0bD6GKTR8Wv0i3YImBKYyChxIHLtTE1oz3VMiJCms4
 8Kb61GRZHWxBGEM29cHAMjJgfH6OBXIrQfrdonWKqMhUFdsYuARA6zS
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

Tested builds on x86-64 and a64 in Yocto using 7.3.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (5):
      media: cec: seco: Use named initializers for acpi_device_id
      media: i2c: ccs: Unify list terminator for acpi_device_id
      media: i2c: cvs: Use named initializers for acpi_device_id
      media: i2c: Use named initializers for acpi_device_id
      media: pci: intel: Use named initializers for acpi_device_id

 drivers/media/cec/platform/seco/seco-cec.c | 4 ++--
 drivers/media/i2c/ccs/ccs-core.c           | 2 +-
 drivers/media/i2c/cvs/core.c               | 8 ++++----
 drivers/media/i2c/gc0310.c                 | 4 ++--
 drivers/media/i2c/hi556.c                  | 4 ++--
 drivers/media/i2c/hi847.c                  | 4 ++--
 drivers/media/i2c/imx208.c                 | 4 ++--
 drivers/media/i2c/imx258.c                 | 4 ++--
 drivers/media/i2c/lt6911uxe.c              | 4 ++--
 drivers/media/i2c/mt9m114.c                | 4 ++--
 drivers/media/i2c/og01a1b.c                | 4 ++--
 drivers/media/i2c/ov01a10.c                | 4 ++--
 drivers/media/i2c/ov02c10.c                | 4 ++--
 drivers/media/i2c/ov02e10.c                | 4 ++--
 drivers/media/i2c/ov08d10.c                | 4 ++--
 drivers/media/i2c/ov08x40.c                | 4 ++--
 drivers/media/i2c/ov13858.c                | 4 ++--
 drivers/media/i2c/ov13b10.c                | 8 ++++----
 drivers/media/i2c/ov2680.c                 | 4 ++--
 drivers/media/i2c/ov2740.c                 | 4 ++--
 drivers/media/i2c/ov5670.c                 | 4 ++--
 drivers/media/i2c/ov5675.c                 | 4 ++--
 drivers/media/i2c/ov5693.c                 | 6 +++---
 drivers/media/i2c/ov7251.c                 | 2 +-
 drivers/media/i2c/ov8856.c                 | 4 ++--
 drivers/media/i2c/ov8865.c                 | 2 +-
 drivers/media/i2c/ov9734.c                 | 4 ++--
 drivers/media/i2c/t4ka3.c                  | 4 ++--
 drivers/media/pci/intel/ipu-bridge.c       | 8 ++++----
 29 files changed, 62 insertions(+), 62 deletions(-)
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261022-acpi-media-24f3bc53b2dc

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

