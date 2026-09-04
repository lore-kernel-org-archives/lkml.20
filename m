Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB14A8FF7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531049; cv=none; b=e/nZFWVWdmw1+IHUlfNtJ5ELGnduc89/QWDKZZkOyis6AeR3UiT0KoDIah9og9ZbnaIziGyqpaq8xNHezeZwScA2IRUrqfTqCvbZMqlSg6lcgXDp5C1aw01WdfekvmntnUTiTFE2BRtkgmv2UWvt8+2XmmZdh2y2ffqXnZdwCJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531049; c=relaxed/simple;
	bh=WoGxKQtaMdpz6ytvKsd+KXI4ZRtFdZIJSYBDoyqhR+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cu/yRlpV7Hm0+agKn4xOVb9Frpm1fyhLyj6rdzBeZ1P1yk7Z1u2fPmWwDd17dzTqpEzYzt2iyr6QPm0TBmgLbe5RNaVQBUL2N8vxk5c0ZRzQbkTWgpaS0NUSAk5uZGdeRC5K9F4/c1hPttbb1vMwYsabRF8vRM2UqgDZ6fBZaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=sEp8BPTT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="sEp8BPTT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so9719845e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531044; x=1789135844; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+rs87giGtrtA7Nu//5GihDsoyXZxcEFLrmWczq7+IcM=;
        b=sEp8BPTToNul3s4/bYtaP/+f/kyW/TEkdpIwxXWZGKcqptFctefAAj5Hc2kOIr0UMS
         ADvDB/llBn5oKVHVyZz33cBoI2LJOsovUrTFFpc9OPoVvgJo5Mumy0TGD/iltzrIbgMC
         NtjJk4cN7fplxHn83P3ctOAVYWpTwpEuOCUDQQxbhdRFV/15q6m+CM7MmLXOO/mwbaOy
         /luLphLQt58qMIYwmTb0Ass8vu9gE4LV8x6QdSTG0OrTaaBrcWwrqondTZDnBVBFDps0
         OJfB841NT+R9lrpQb7Ns0Q/UwVCtMip9hzZUFc9JRXK+8H7KVaFwutSYXVWJa7Y7Dlqv
         tLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531044; x=1789135844;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+rs87giGtrtA7Nu//5GihDsoyXZxcEFLrmWczq7+IcM=;
        b=Kb8X4NeYU1JogHVuCG2hiYGYXB0JjeXoqi+gXdZh04rzZerQNco2iaIwmjZ9kcGChf
         ZsRiATFQ2CnR1X+n8fUGXxCgyd6IJnzcy8is15tSIDaCZyRtvWaQm/9pEDbuSTf/a397
         lRInHHY3/ngWrXM85FR0bZPXoCcUH657fkXTbirxtMMQ1jVXx/5ETNfMbtsxzK69/gFE
         psBO5gUDybEcaBKcn33VQQJaNsyfQuUgyoWLrRxcIzI+A/tRmAMTLctEH+5wLuM+ZfF5
         X/VjXKi1W+QkP5DYU9xtq9SU1tBoHsXEEmOJj+9S5ctryPkvjJyofk7FrHEgCmR+Dycp
         koLw==
X-Forwarded-Encrypted: i=1; AKwUvBx/Z0z6HXb8ewnJYgB3CmqdibQrxST5Ah/wSaprT33cDdT8jjayqRBCXP4DdOy4Q9zjJBy5AVaQzZnsdxE=@vger.kernel.org
X-Gm-Message-State: AFuF++mYCf0eRFyBVVgJhkS0y65G4Dl76odQgg+cgVR39jZc1b/iUcqt
	wRubHBeaE4NLY2DRoWhAUaf4uwWWqD0NENERHyyY71lrLMhcifr+QZxvuiGlEgxhNy18L2pF5P0
	QkZ8Q
X-Gm-Gg: AYBFou21gn28KBvXzS7ECcJTwJJU9+376MV3oIJu+OnPXDF1xeGlaW7cRs4x6ltjOB5
	SrE96GeDb95NMXaMYiXrkgQIuzMSP+TMj/2VFD6/W+GX5ZzWFKKDmAjBLeZ/izXNQM5l0B5Pwmk
	MTQQLSa/ggHtbALGfkfEN+9u+qFmUQOjzxdy1NTFXtCevm1lx1vJYd4/e1uv2jF7sYsa7sJnGGo
	USBwu8lo6as4yMeWO1JZMhpi6NEvAtGHBaeAOK2s4eT9TJ8TLZuIhZoaKHfshxIxk+wsVxMP+2J
	O66jVknB0MFZgvCD+IT6UR/NaUio15YCYyEXlYeOpnKppHNa/nQ0liwj1Pzm7onZm+WPCzn83di
	wOVoucViA22LT3dZY676WyIzlfwjFOzI9EgF5HdO6bF6oLKK9k2Pp3+FrMcgoAnrmUmghau3RWm
	JyyCeZlpbUQt+CLphkhvnrrZTKaMvNtnTW07soU7geUy9chEc6AVKeHRK97TroKzjD1nz2R3Z5i
	8pROuYMUkzmnll6KA==
X-Received: by 2002:a05:600d:4444:20b0:49c:fa21:e74a with SMTP id 5b1f17b1804b1-49cfa21e8c9mr34503535e9.32.1788531044605;
        Fri, 04 Sep 2026 07:10:44 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:43 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/4] dma: use designated initializers for acpi_device_id
Date: Fri, 04 Sep 2026 15:10:39 +0100
Message-Id: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/RmmoC/yXM2wpAQBSF4VfRvjY1NCleRS62mYWtHJpBSt7d4
 PKrf62LArwgUJVc5HFIkGWOyNKE7MBzDyUumnKdF7rURrFdRbmJFZCxc6ZlGFDMV49Ozu+qbn6
 HvR1ht3dP9/0AT8D1+2wAAAA=
X-Change-ID: 20260904-acpi-dma-ee1add4bae4e
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=2276;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=WoGxKQtaMdpz6ytvKsd+KXI4ZRtFdZIJSYBDoyqhR+M=;
 b=7A+R3AT74CdIvV1dVbqRguBpZmTmoVxmQ3VzvPDqtx7Rgu1sy2KY0B/p5GEqsanSBi/OemXWT
 gPNFVt+YWucCtkXDg3whdE9X+aqYResolXCQOxp3GmS3ZORWGf25gjd
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id
struct, which is defined in the include/linux/device-id/acpi.h
to make use of named initializers (which they do not use currently).
This work is part of the on going effort in the kernel associated
with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (as most of the existing casts are gone),
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
- pre-clean-ups that convert the lists to use named initializers (this series)
- actual implementations that make some of the modules use the new driver_data_ptr

That way the task can be fragmented into manageable and independent
chunks of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc1.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (4):
      dma: dw: use designated initializers for acpi_device_id
      dma: loongson:  use named initializers for acpi_device_id
      dma: qcom: use named initializers for acpi_device_id
      dma: xgene-dmac: use named initializers for acpi_device_id

 drivers/dma/dw/platform.c                    | 12 ++++++------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c |  4 ++--
 drivers/dma/qcom/hidma.c                     |  8 ++++----
 drivers/dma/xgene-dma.c                      |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-acpi-dma-ee1add4bae4e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

