Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D1373BEC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788201957; cv=none; b=tOYKaVo2uO5jhfDxRiBGR8CrAIB5d51gztbCIXd2At/Jx0wziHJ68DbP7WD/Y5BWGczySo9t80KO8+0md+c54I5kOLWq4SZkoMJluIHsjsdsrJv4LFT1M9bHRGGNvnZWhPeQLy4/euj+LqWgqNh2AlAqUZxnAUZEcMBl+RFwh14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788201957; c=relaxed/simple;
	bh=gOdMOlsXmXX38oBAS7XFGOJoRmhlChqbGSNBwd2N6Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JoYs76j42aPGa3l4N4ENv/9aSxxf0TJf0OWDpFG6T6SUrZnbJ9M7SQCa+N/P6s1rOY5KsPmuZ6pspK4t1APxHVJxt7S8X2FwRfiaSflKK8iWRht9xEGdEiy65Rx3xrKvHMeMtQHMwncYc9fprbjdZIaDH5GdpIgbHnP2q6wIS6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwOL3DIL; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwOL3DIL"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396d27bb2beso79542a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788201954; x=1788806754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ibz8/jF/Lx7KPFMOOYUTs3vW1cvNeIhgyAw0sqrv9B8=;
        b=TwOL3DILeFBFevjvOYeNxYo5LG+gCCxQZQxM7jAFKBgEwz9nWzE68ounWDKemSDkAw
         Wuw7WZmId+cUatZO7WNPsQ1AiGr3pH+el1fZwpsXTI+TA9Hr2Eh9lOMS4W1qR9UEW/9d
         ulXnEcSz3hOQP55ZOlYlvrW7/Rk2ofTYJazuQJelf+0TGuw8q2jiYxjYXaReu6pKrCt7
         CUlfoSZOfEy95DT7Q47c7FDthS7ua2AlObcxzwtc5MD7l0BWGE7GrGvv5g9D3KCIF1dV
         8rS/NN++nlyRzYumfOdup7VnFojshibUcK+MvYUzbPk6Xr/t9hZ5wtNqzOaq50jqCmku
         dIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788201954; x=1788806754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ibz8/jF/Lx7KPFMOOYUTs3vW1cvNeIhgyAw0sqrv9B8=;
        b=JtR1l5zAy8CjDCIdkdVTN5eGLixWhzlwNxczR2qBcDKxw+pMrfUFI8VFmfm5tY3sBj
         nIvP308ZH6MwEdE9QosQe4UYOKFSvPCj+c3zaLyaiBr/w5NYaWldc3VJ2xzQholIjQ7G
         vHuSpvzOl4TJRKKZkGwHmJFNd12KLd8UnXTONEs0+ZwdPPIPe1zaTL+JitTEaETk9XGj
         xstj3aImxa55PFnqWFGZaF93hUstgsmsFKeXEMxc0xdqx+Y5Yamg30a10zutmpapLbPm
         um1pvL5WDe0sbUP4F8Pd2RJeZIf4Lx/1AzgfedoK1yBV3Ab6h6Gn4k4mc2HoNm/FZvc8
         86Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxdr2bUZ9opFhtwcmPNZDx6AONsiNltbfJoG41XJGBs370ZBL9P437XK5F/TQgXbxNo49MgKfAFGr7qFF0=@vger.kernel.org
X-Gm-Message-State: AFuF++m4L0L6BbF6hlSPU8eUzk58GVAGIcKnQOCu1vRnvJTNanKt1ley
	1N+gkT6LvAQroKmPlN7UXs04zUNBp4VQ2GXYXKeUOVdSSYNx/kbBzdZy
X-Gm-Gg: AYBFou14GDyqQoaOamqAK75zY+jCZ0X2gD/sY9CZ5ptsg0oZyveE94mijhO/k27736o
	BD7aH1oy9wIaq8RzzzTiTFAbUh+1C/caXu6rgwOg7DK9Hk5+W1+yT4jiTxZqGTFbChVOU1qOEMB
	9emc7XkJ0vaccwStXUkQuZguAszcDmbqh8i8jopWStYa+G+BTWUUW6d+bOlzvLrRvdgTQB35gbI
	kAi5n09fm7UuOJnc9P/EQG3QoIWeNfKvpsl6tsC5j5fDo0q9vpmxMA7wgR8+BXLSZH6626ExM5m
	F9dvHN+74XZI9H7qgTmT7cqqmaXmTRQ2iPyv5AQao5pZ1/BX73wyqIZyK/PhAF2Jv9ERb8Qr1ha
	rIltU6V8h/Bj3j3iGSdua4iHaPUOHbKzSiCGXfexdz3mLVmm9DivuB9l4OnDINpN3YLz6GESQmY
	N3mm2fcASNBHuodK1LryBUagoSqEJGcHVI7gYTEs0BQk6GtGpTFy7D74jwdP3/FYBGsxCkOoUB4
	b8w/IJz
X-Received: by 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20fmr21407728a91.10.1788201954154;
        Mon, 31 Aug 2026 11:45:54 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm29459223c88.10.2026.08.31.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:45:53 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	danascape@gmail.com,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH 0/3] iio: accel: merge adis16203 into mainline adis16201 and remove from staging
Date: Mon, 31 Aug 2026 23:41:58 +0500
Message-ID: <20260831184201.34416-1-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series merges the adis16203 staging driver into the mainline
adis16201 driver and removes staging copy. Following discussion at [1].

Register addresses are identical between both parts (SUPPLY_OUT,
AUX_ADC, TEMP_OUT, inclination regs all match). Pin config is identical
too, all 16 pins, same names/types (Table 5, both datasheets). SPI
protocol is identical as well (Figure 3, both datasheets, Phase = 1,
Polarity = 1). adis16203's second (180-degree) inclination channel is
dropped, since userspace can trivially compute it from the first channel
anyway.[2]

Differences between chips selected per-device via a new struct
differ_info, picked in probe() off of_device_id match, same pattern as
adis16475.c, similar thing in adis16480 but different mechanism.

Don't have hardware for either part, only tested locally with KUnit that
the sign_extend32 and SCALE/OFFSET paths of real read_raw behave
correctly for both chips. Register read/write and probe aren't tested.

Patch 3's binding content is unchanged from [3].

If this isn't the right direction, guidance would be appreciated.

Link: https://lore.kernel.org/all/20250308144239.0442f1a7@jic23-huawei/
Link: https://lore.kernel.org/linux-iio/20180204163124.67234ae5@archlinux/
Link: https://lore.kernel.org/all/20260812043506.456ced6d@jic23-huawei/

Shehryar Ahmad (3):
  iio: accel: adis16201: merge adis16203 support from staging
  staging: iio: accel: remove adis16203, merged into mainline adis16201
    driver
  dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible

 .../bindings/iio/accel/adi,adis16201.yaml     |   6 +-
 drivers/iio/accel/adis16201.c                 | 289 +++++++++-------
 drivers/staging/iio/Kconfig                   |   1 -
 drivers/staging/iio/Makefile                  |   1 -
 drivers/staging/iio/accel/Kconfig             |  19 --
 drivers/staging/iio/accel/Makefile            |   6 -
 drivers/staging/iio/accel/adis16203.c         | 315 ------------------
 7 files changed, 178 insertions(+), 459 deletions(-)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile
 delete mode 100644 drivers/staging/iio/accel/adis16203.c

-- 
2.43.0

