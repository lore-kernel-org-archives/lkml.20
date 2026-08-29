Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB6B1A6822
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996883; cv=none; b=EWDfUok6ZK7MKLeB3tDwd6GADwObmOTxsB96eXiI5SW5uswtV+jMhQbFjJD0bNaotfmawzlxDZYu0zTPtc+0h5v47+HA2V+vJyDRMk5l3GjYn28G220+Z9iqA79uMcAwsQOr0rjLYSybq8lHe6qf1GKvJnLcddY+829wACy9lbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996883; c=relaxed/simple;
	bh=ZMTFeO2F9mCgdGlf939/k55/Zui5sS++GTzhcQ6cXkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8QT59H+K7hOvFqrbfMSsHauI+6aHNKqh7+C6omERwI5PqYfLDsjtrokVGe5X7Lq62ZHqnznWpzUH8XEXGO4XmIBwERxzFQmkjh4zivViKdMChbg1nCj6eKMMSIPsw7/+mshtQRduSpjvfYxoK2i2MjsgLX9aEn+gLRaBSHw1FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49954b88fffso13005895e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996880; x=1788601680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rJ0DhyCHllIMH7L1DGiwV3mp7tCq7ghlGuKeBd4/eQ=;
        b=SR1tfcZDtXr8X3tUg370fv+JzpjvSUMVRUEMzU8iruCVYCcVHRGHoBXATMlqN/xd8u
         PEknv7sjGlArF7QGjS/ITD5lCMsRvgp/gsMv5R3+AvO6+DqQvM+OHBxy0NUGb46vY75h
         4GmzT3xWQlhxp3liCONi+O6n1r+273YTCai05c0VdyXwtdZIaCqFluvAcDeUPpSy23QF
         bWX/UIqFqFuVFck4GlxBmuK9Gc4axonGxBfPdJAV8Dsn4h+MODUtcT9Bp7tWLe8S33c3
         Mo31FzJgGaIZklZU/WPH/qBGa61uCRhsWhtbG7ZoC5iZdwSRCYtoC+0Mfk5KEusTfLkA
         p9zg==
X-Forwarded-Encrypted: i=1; AHgh+RqJfDhwB/yzbnuttcGwV1UEIcA7jZZkNl/qLLpw+7rGKiSvAhoGy6ZMCiYbkFQZSObVwxYjOzBCTfnToOs=@vger.kernel.org
X-Gm-Message-State: AFuF++km9jRmNeVAiVBxB7bG+fX886vDc75UrR+x43mvC5Xi53TbsCmm
	dXZ/w4YQA5HR8uzmySyC5UzgLRzwBn5N3/2tC34SLiylPtNSGsCjkcsW
X-Gm-Gg: AR+sD13JdWGjS1mXGe+ZDHIM9hGO9O6X/myCuXsIFQt5vHPIuHgKqLhyTLWjBARdMI0
	P9YMRd813tTcQNeDWD+bDn0kt2qYM7cBsATVQrUYRHesX6Cwu5uovluGhMry2oi2zBeu/w6nNfX
	GQGKNFXLNcZTmKbQvVL8YduCAZRNJSAYSVUpz/cjuVeqNUuxnUvnq2Iyjv5enqrUir3CUFLk71B
	FULCLMtJmHBXJlGqJTJniTg/p+Onh9XKWy6AdxcJyTusDovEofPoU4xj9DpAnuDJjT9gDLihrfp
	RSUClmKRvW+h3Ss0tGipCd9BvDF/VFpmfuVoBCm3CncMBmtm4zbFx1mYlS5FZ7igeCLm8pdF2QR
	126WsK/mzNJayP1M4sajjGL9ZuVPFqhY56ENCzMeReYT2WI4ekAOUCjfX7B5he2YjklQvOZrD6i
	8+qzikJciUjC5KWSTJpdI8Ym4hee5wQPvgWkpWuL4KtEpKUm3J/VkmhCFznlhrFWQXfDVMnK3Zt
	jRZN8aaQcpevSlXvHkpiOkNVwFL8ot2eeYN1g==
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr152418085e9.10.1787996879686;
        Sat, 29 Aug 2026 02:47:59 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:47:59 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/4] arm64: amlogic: t7: describe the VIM4 supplies and keep the fabric clocks running
Date: Sat, 29 Aug 2026 10:47:54 +0100
Message-ID: <20260829094758.23248-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without it
the board hangs at random, loses storage and corrupts memory, and the
failures move around from boot to boot.

Six of the SoC's PWM outputs drive the board's voltage regulators: the
always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. None
of them were described, so Linux saw the outputs as unused and switched
them off about a second into boot. The regulators then drifted away from
the levels the bootloader had set, which is where the corruption and the
random hangs came from. 
Thanks to Chuan Liu from Amlogic for helping me indetify which clocks are
critical.

Separately, four clocks feed the bus that carries data between the
peripherals and memory. Nothing claims those either, and switching them
off leaves any device that starts a transfer afterwards stuck. The SD
card comes up about two seconds into boot, so it was the visible victim.

Two of the patches are pin group fixes. The description named groups that
do not exist in the pinctrl driver, so anything referencing them refused
to probe. That is what the supplies patch needs in order to work, and it
had a second effect worth mentioning: the failing probe left one device
unbound, which kept the clock controller's sync_state() deferred forever
and quietly stopped every peripheral clock from ever being switched off.
The board looked healthy for entirely the wrong reason.

Tested on a VIM4 booting from SD with no clk_ignore_unused: 74 clocks are
still switched off, but the card enumerates and the root filesystem mounts
and memtest runs clean over 512 MiB.

Thread about these issues in Vim4:

https://lore.kernel.org/linux-clk/3930906f-783b-4d72-9260-ba25cc8081cb@linux.com/

Lucas Tanure (4):
  clk: meson: t7: keep the memory fabric clocks running
  arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
  arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
  arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  44 ++++++-
 drivers/clk/meson/t7-peripherals.c            |  13 ++-
 3 files changed, 156 insertions(+), 11 deletions(-)

-- 
2.55.0

