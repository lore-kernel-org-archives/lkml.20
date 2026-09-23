Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1FB363083
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137183; cv=none; b=GNCVa2HnlE67+7XkLm/1z+eXWefRit6kDjghObB2ZUODnQDKn6ToKGhKVupnpfskxT9y88UhnRh1QrrGWsOvxSdZwK1h77iiIYLcN/mYWWPmcowF87sfOXBuK1CQs7SNJ6PRmwms20+C7sTojiukUYViqM8QgV4raLPfbMH/F0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137183; c=relaxed/simple;
	bh=VnTRhCYz56QFEIHWtX5iIOB/v8A6bH/AwJdTUOxoN3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qSLZlXr5eVXYGS18C5rqa1Ki9/PyFj3t8FF6t3tsl5tmQfB+xUpejo4c/7TQZCyok6bVner4xB5CEAAZOpXJJiyi7bjQGBrjoxll41TfI5Js1o/tj7/jKSHAhnkhGk4fu72UfsFK8GrkOTUW6da7rDXDftwj3Fte7fquuXpaeuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/Moyymj; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/Moyymj"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso398019a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137182; x=1790741982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSBnzQPFA3sp+acWAbZYd7ni8m80ai0yOy1PIw/qr5E=;
        b=J/MoyymjonJKMIs5WM1NpcySHATUaZ5my5vof7PHmXCW1Z7o1l2UjqB8mnxa8trDh3
         3SB1lumrDy21oaYuMsKpqiZGG1IIKbwRRCf/YyOCydiqIjlFqx14nH3HbzNCowpqIvZo
         PkIDswAetUU2TsXLiUWexIJ3yYKlkzB5INhNuurEGFNR/XkGAj8uSHHKx+JxsU5Qf53u
         SBltOGi8kQsgEGxas+7O8ncFdDw1LeU2uJtVVxfRPNB/WSFL/TULJZxi+uzVoirBRD9E
         5E/Aq9jVNYxsTDvmv4xQQGvPwPG1zkrPmxvUQkgI7ftgcJODRYL/dHq1XI+5G1rV3aLw
         PPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137182; x=1790741982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSBnzQPFA3sp+acWAbZYd7ni8m80ai0yOy1PIw/qr5E=;
        b=PjS8pP7HR4RJlKi0MWIeN9Aa7O0aPL79unL9hGbtEePV2ibIoETBvCF8Uq4qS2SXBb
         QEIogW72nS3zlUCRL9OwE3QmQUwZpmIY5qXkb5uIlMq7dELDVDF9RPGxEkBu0kycrsXV
         tlb5GYwCysiL7FHgP+sOwjRXq5Z+83U5l7VJn1t9lgSakOy6sKRoAv4V4V/zZ4vEmJVj
         j5fyYiW/GKimSdMbCFVC3JWVTlx24CM5qZZfUiSH/tOTOtMz+ifhnjEYUm56MahQysDJ
         xvi4EXOHdjDzNRcXI1LsT7/F4vkq0+XPUKZ2h/SQnpU3qB42pGC3MSyG+mwNg5DJpMgf
         hQFg==
X-Forwarded-Encrypted: i=1; AKwUvBwWoCtBcbtSdIvNQH3Du8t3Z05NkozQt6Mifi0pa3on7YwUJF+4eHs+7PTFPq91KRbg+xZGGZCmFrayj6I=@vger.kernel.org
X-Gm-Message-State: AFuF++nENdpPYet8C5lwJAaLz3qjK72z92QTIxhBo8FHLwesHBD116vg
	D87d3ZrxYzRoLa8U6kUsNNwlQ+HRswgI9yFTCzrdbbvS9+FjRYfIQ44p
X-Gm-Gg: AYBFou1yiuxrnM0p1Lu54NECrPqaue/4Oaux6o9DlkjtqQG9+i7tAT66r0TpioBEOLw
	GBPDRlJiBH7fdNF3Y67w3VoIJJIJDBkJV+321D0dSLqbe8VMKAqVq0LToVvP6kADwXNuF//CgBy
	hcfbhtz3ZlZyDGikvTJo+XvYRjVdS53Yx6C2zT9YLmRydyBSW9ZmJtmDiiU9qacPASyewc+1MJU
	aS4K2jUUQXF5l/g6CvewVEqKBUEh75tXx7JSckGOALFkZ5yDUjhkyj1rB4tAPoRZ3MNCYZtm//Y
	FVuQz8oxl+5Rym3ZdHnfZMAmjr81U42Yb/uCBD0GMjJYEMXkziNNV1CXmiapIuYkJt/Ti2pTyEq
	I029faecATY2i0zJ6m8fgtDeRkJce6OYIzcNJEN141zv7HN42wc71aDFEhJ8D7JkoOuw8nLJrLm
	7LLHcuKvHn8bfkcsbQVZSkZg3Fq2nxx4HOF+HLLDj8TUHUH2H7auHntnoCOwcmyR8pp4is7zGfR
	I+9oLCkHlTpCB7YaprQZgc/OiBWyiu9XAuxUWvPrQ6UvDoTPMZvsSUXSyqL/mjQBZe2lO4=
X-Received: by 2002:a17:90b:3843:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3a07e4a2525mr1289494a91.3.1790137181650;
        Tue, 22 Sep 2026 21:19:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm2510243a91.5.2026.09.22.21.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:19:41 -0700 (PDT)
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
Subject: [PATCH 0/2] spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
Date: Wed, 23 Sep 2026 12:19:24 +0800
Message-Id: <20260923041926.425551-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds Devicetree binding and driver support for the SPI
controller found in the Nuvoton MA35D1 SoC.

The driver implements SPI host mode using polling-based PIO transfers.
It supports SPI modes 0 through 3, LSB-first operation, and word sizes
from 8 to 32 bits.

The controller provides two native chip-select outputs. GPIO chip
selects are also supported through the SPI core GPIO descriptor
infrastructure.

The driver programs the clock divider according to the hardware
requirement that only odd CLKDIV register values are valid, and rounds
the divisor so that the generated SPI clock does not exceed the
requested transfer frequency.

DMA, target mode, half-duplex, 3-wire operation, FIFO threshold
interrupt transfers, and the I2S function sharing the same hardware
block are not included in this initial version.

Patch 1 adds the Devicetree binding.
Patch 2 adds the MA35D1 SPI controller driver.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton MA35D1 SPI
    controller
  spi: ma35d1: Add Nuvoton MA35D1 SPI controller support

 .../bindings/spi/nuvoton,ma35d1-spi.yaml      |  70 ++
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1.c                      | 701 ++++++++++++++++++
 4 files changed, 783 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml
 create mode 100644 drivers/spi/spi-ma35d1.c

-- 
2.25.1

