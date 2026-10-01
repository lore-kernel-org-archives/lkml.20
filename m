Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE264A68B3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860708; cv=none; b=jp5BB7zyV+T4unV7FJ058mqBwxWAdqMpbc7zcCvN5UxhJh4rW+Fbckp/hDRoaCXTsy1vMFOARc6fCfft6rfMjH4ABD1vJR/s3vdNBJEXbTx+Y3F6E9TfAETEd6XMDkqHJ8xPnfUtX/Q54kwAyR2lwuD3e850ITWDtiP0SoXYFu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860708; c=relaxed/simple;
	bh=pmZrdcERb27zHcixZ21LiE3rczfzndYk3DWBcThGUIE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qeKr/jE6kLb2Ck6yYdK4N03XeqlbqoQDpP9FsLXdofyvbuV5MZCCwSUAwUX0dOC8gUCLfMRF6HDao20Lnql+kw8OEef1jjMiXpZNiD4+L8TlOyX+CgsEWZsgiiOXBZ1eT1tnyRedgNUfaVkD3utb3tLwp/MVXRrOJzoto3/HPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZ0cLK5P; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZ0cLK5P"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1926318a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860706; x=1791465506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/fiBbMlGw0oVqJMPaaFFl/1eV2TqjZPhEUkeKiNefM=;
        b=QZ0cLK5Pxd0Bp6Uji4wGDxdoe4oa36YJw5PgB+gSRMw0USoHM3p+uDbMxIK7ZdzG/J
         PmkutyCJQYQ5YqYb3oufN+ITbWx3JEk2DBZHgKS/UXqlmjWNhsHi7fhTiDLooa/+2YpF
         GowS0YEhDpXrsLfcSZccy7A3CROAsEaUhivjDqZ0nLdyUEYEn8/BsxoHToZIrWPigy6q
         QakPMY7Tx5A7UMwe9vYeO/mEY8DjoEZqmsHi3jOSrTK20g762Z3hVyKs1DZGvUG66icK
         R+guLASs+pfMPNGpi/Znmmgh1tQZc2TGp1pMbM/nP77w2DrCFV8DHSPis9Inj7vfq9eS
         O+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860706; x=1791465506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/fiBbMlGw0oVqJMPaaFFl/1eV2TqjZPhEUkeKiNefM=;
        b=DUwrviCJu9D1xOtyHtmud8UYgFr6S2pzTxTwnRZxEwbFFvQqAGiXUoXRJlbIDRPHj2
         IOqHvpzSX7P4MehG4yYL35te8zftiNc770GUE3TqxujqKagS/fZNoKWtEtDASZQsa/+F
         xr7DpXiMxWKYWNVs5j6VpUlPCHnS/7jqaG4jZtVayjWBdyLhQKuT2EDhzYyRKZmoRoYq
         f7ofgvAFhoCpPHbO+yzbXB8SI3pfnQjskWTXM8EtvQhIzI4hKqBXpvjJh0DdWY9hkuvW
         /mT+UaSWYpSHKqd+uvjf2o36qMcHQjNuMFEAlJasoEBvu0u7VzYiCLNkruJyPXKYfAcu
         eBCA==
X-Forwarded-Encrypted: i=1; AKwUvBwQFgiE8nvskyEnrqFf06/cggiDqiFJABIGBAb8UQ8rN9QUcMI7ogv3aKW7d52PX6iMFQ+qwmM7z37Nl4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvHD7drFs6lGj7DtV4vt26gMtuuGTEmxMBbzpf2uRkkmHz+LFx
	MR/MxzgYPtBPhzGjmK7iwiIDrz7Tlun31UnbkgniLlu6/9/CX1SFcnMZ
X-Gm-Gg: AYBFou1hqcv4aosYBZK5blxc9syD1/i/YMgi1pyESORj3lkTZ1UHJ1JtWJyCs6VP95X
	eSgRTTTzkyDgT4mc7H5nTWzlGjDxM7eEYe9LtcYUxOVQba0ILUGFHPgNawUhYPKbHFQo819plck
	u/XF/cunhmXKX1z2lHS/SAGyrkxYP6YaFSiA2Wz8qwV9uRbQ1zaOVfs+rf4qJLDPP4bInqe/tzr
	8FUFHLoMb8rUMxIrIAKQFMZvg+ptFSCFlMKZK+loMsRMxg1QOTgRrVqx5fDiQzcnwd+/HhQAcRO
	MlonHd4kcOWJmmX05A0h7iZmHdE4hj8KXKXv4rMNQB8WELoRv54jn0kLaTpo/xlC0CAHu6yGjsn
	+EWabKH61Dha/vzwwN/Ou6x8vdTZ9fZkcgCVWWr8yMFN7H8mXRc6nGZy7rK8INxuhiTeqfP3Ltn
	ZSHw6NYvlNdbcx4H8yKj+dPiA1RZT3SVzlTUIsvlJ95KBon8TxnLHYiyeY7LAM9Hatz4cfWriQI
	xXSA864eIupnaRFMSnnswmx6XDXdj9+JqOG9KCZ5lkE5MEwXyyRvaIW9r6C
X-Received: by 2002:a17:90a:b90:b0:3a4:d5c0:f826 with SMTP id 98e67ed59e1d1-3a4d5c0f852mr2590568a91.65.1790860705807;
        Thu, 01 Oct 2026 06:18:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bb550sm5016692a91.5.2026.10.01.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:18:24 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v2 0/3] spi: Add Nuvoton MA35D1 SPI controller support
Date: Thu,  1 Oct 2026 21:18:15 +0800
Message-Id: <20261001131818.110028-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds support for the SPI controller found on the Nuvoton
MA35D1 SoC.

The MA35D1 provides separate SPI and QSPI controller IPs. They expose
the same Devicetree-visible resources and provide up to two native chip
selects, so the existing MA35D1 QSPI binding is extended to also cover
the SPI controller.

The SPI driver supports host mode using polling-based PIO transfers,
SPI modes 0 through 3, 8 to 32 bits per word, LSB-first transfers, native
chip selects and GPIO chip selects. The PIO path also honors per-word
delays requested through struct spi_transfer.

The existing MA35D1 QSPI driver is updated separately to support GPIO
chip selects through the SPI core. SPI-mem operations for devices using
GPIO chip selects fall back to the regular SPI transfer path, while
native chip selects continue to use the controller's SSCTL register.

This series is based on the current broonie/spi.git for-7.4 branch and
therefore includes the already applied MA35D1 QSPI reset handling and DTR
follow-up fixes.

Changes in v2:
- Extend the existing MA35D1 QSPI binding to also cover the SPI
  controller.
- Add GPIO chip-select support to the MA35D1 QSPI driver and allow
  cs-gpios in the shared binding.
- Remove the unnecessary SSCTL spinlock from the SPI driver.
- Cache the controller clock rate instead of querying it for every
  transfer.
- Rely on the SPI core for transfer defaults and validation.
- Avoid disabling and re-enabling the controller when the transfer
  configuration has not changed.
- Add per-word delay handling to the SPI PIO transfer path.
- Add system sleep support using the SPI core suspend/resume helpers.
- Rebase on the current broonie/spi.git for-7.4 branch.

Based on:
  broonie/spi.git for-7.4
  93914f171867 ("Add enhance SPI DMA support for JHB100 SFC")

Chi-Wen Weng (3):
  spi: dt-bindings: nuvoton,ma35d1-qspi: Add MA35D1 SPI controller
  spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
  spi: ma35d1-qspi: Add GPIO chip select support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  41 +-
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 |  39 +-
 drivers/spi/spi-ma35d1.c                      | 716 ++++++++++++++++++
 5 files changed, 799 insertions(+), 9 deletions(-)
 create mode 100644 drivers/spi/spi-ma35d1.c


base-commit: 93914f1718676aec13ccd3787642c8b05e2b8309
-- 
2.25.1

