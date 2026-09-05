Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425F3002AB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622359; cv=none; b=rshqrJEYb90/XukG+C6gZuZ2T7qtpEpTCvisb4vPbnW7gZ/4elwLRx/8RVcSGTtOnLXOd0qeqQiYcH1Z/vvLzgyL94UHzjR6SwgXLMhv7hq10rpq0Np1T6GnEb+4kuHwj4TkqaQmQjuSv9zQ53dMZaQGkmysYDHHwmuXyDuzSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622359; c=relaxed/simple;
	bh=8J1UiXJhzVvrBOSm0Tr/M27LUtZiz4TFzi/G029Oths=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JWiu4ZqyS9s0eBPu9YB0AzTp09M4aCJrFPJLd2NrVGpu82xyUN2okhm65S9tasm0UypiR5E7pe02ajcI51vopTK0ImvjyFTOAe3CMsvuj0vmtqBf+P7wnOvdhIpZ7hdOpfGY7jwhCKxqflrlouzsrEuFM9y+A9w+tgLYpyNAqnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482f9309813so1835810f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622356; x=1789227156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSU4aZpbll1PpORySxMO+b6aF9erqEZX1yTwxUGQHwY=;
        b=KEzNGmV7cTSSN2JeE4cFmGsyJJ8aAHmjOCaV0fqSJZD7Xan5PYHa0VDEQnnV/Z81Hj
         7Ntt2bydvwAE+GP75Ko5JnyBe9R1y8ZBdWFFsks//0B+VJCSraB0wHuDDCahA58Gl7wO
         Ecp4BTzYxO/tTbMKv7SI+0p66o2ZPLvAcAF/h1rrCLo1mrwowgAiy4rBGfZ7UPvbrfdV
         aCYPRdPwDyI+DIDbPAtNmGlWs66m6L+HXfrRTBklnT1tG72QwkIlxnmeQEk/PcQjvksZ
         QZvfuJ8TWDy8/Af8htaa/HB2TPeCZWbrYdV3+l6KDQ/NwBMFF0JU2dwSYD2jItsSRPuY
         PEQw==
X-Forwarded-Encrypted: i=1; AKwUvBz9GNMs/f9BAGJvU2Y3wzBjxywzUyxHI4gaUVyTz3BK++ormXNk+AT2NTr/bguEwiFncIcinoZgTV+fbYc=@vger.kernel.org
X-Gm-Message-State: AFuF++ktdv4cSFlHrRGFo0dvZZlndeLuExqy5LK2zdbh9OSmZ8oas6dr
	OeMjboU52cpM0Z5cIJmckAGoKHoFDQf2eavszLzjO+MonB/t6Zj+msdx
X-Gm-Gg: AYBFou3MphmtEA2i2S9lkPdnGn7u35CTQU+spsGbK7WHxhC7Iq1XPg2YQWqmyA43Nvb
	15GCuzWfNxLH3YPzMBPP5erKDGeWkL8nN71d0dwjhmwXh4EAHOCfc0/u6JsHKDBGR5R+UG0TUOK
	CMWojRZsn2CbOCYptNPvVcY6isYX618qeQYbljNNt5EH0PqHXZirZOe+YE2RbqXkAwJhZxvm5JJ
	lxkMIcR57rtS4MT2ZIxrrtKDmZiRMgKP/o77jqXk2H2y7/5XPHIvJs3Y/fP0hJE1W/1Mv8ZmwjZ
	7KcvZb2JEhLMy5yd8n/XMskewtNbG9NJPtN6D5LmpfJWpvxPoEyI7v5Z094149PnHKlVGLIbNJH
	H0jmSyHa6w/7Y6SRgNN5BuXf4g/F77R8pn/FOILBwKCCs8ZCIiz6xQ9g/rZpGz0LWgZ2KIFcdZO
	DGWOTkfH/GDI72gWrCUc7F+4t9QbSQ2kuIFg7K102xGTu9sq4YBlSz+78yDOtGuSlzscHGndAVv
	Zpczo+1ApTmmWXUHl0LNOPXCQ==
X-Received: by 2002:a05:6000:2287:b0:485:8b5c:da39 with SMTP id ffacd0b85a97d-4858b5ce1bdmr10859250f8f.12.1788622355807;
        Sat, 05 Sep 2026 08:32:35 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:35 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
Date: Sat,  5 Sep 2026 16:32:30 +0100
Message-ID: <20260905153234.133217-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous series for the intermittent boot hangs on the VIM4
marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
explained, sys_ampipe_nand clocks a pipeline stage that the
hardware design inserts in the bus path between the SD/eMMC
controllers and the NIC_MATRIX fabric to help timing closure.

So the clock has real consumers: reference it from the three MMC
controller nodes and drop CLK_IS_CRITICAL instead.

The series crosses three trees; patch 4 (clk) must only land after
patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.

Changes since v1 [3]:
 - Dropped the Fixes: tag; this series is an improvement and should not
   be picked up by stable (Jerome Brunet)
 - Moved the patch 4 dependency note below the --- so it is not kept
   for posterity (Jerome Brunet)
 - Dropped the e-mail address from the Assisted-by trailer, see
   Documentation/process/coding-assistants.rst (Jerome Brunet)
 - Fixed the space-indented error path added to meson_mmc_probe() in
   patch 2, it did not pass checkpatch
 - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
   capability flag, not an SD_EMMC_CLOCK register field

Thanks,
Lucas

Lucas Tanure (4):
  dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
  mmc: meson-gx: enable the bus pipeline clock on T7
  arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
  clk: meson: t7: don't mark sys_ampipe_nand as critical

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
 drivers/clk/meson/t7-peripherals.c            | 10 +++----
 drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
 4 files changed, 62 insertions(+), 12 deletions(-)

-- 
2.55.0

