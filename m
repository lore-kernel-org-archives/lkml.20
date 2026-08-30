Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED0335C180
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105756; cv=none; b=j73yJRQuIWfJRfMRmqkzUZBjiiFxUTq5PQKyVmwq9ndiJtxss/qYH8h0JiRbbpxmrGvOdFvBt1i2mxtNQDyig9NYNn4Cqa3EUHiT3DOHFNanLQYUljJ+eSj7Qbx+woc8MHr6g9dTnMGRQxJMBelJ6XG83J236JKDUW9+uJHRuuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105756; c=relaxed/simple;
	bh=5I7WZk9Likezcszkxm2f5VMiSja2ZVMFwssHq+M2D28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGE0p3avpiEe+Z1oZDftFpvm9Dy3MAisTG7gfZ/zfNVlTnE8d4OR4bABXAPDPgiYuWvPB1ETJFjVnLlWMKRXxWegeE7o8z+720ge2GT2zj4tGX2yj/0Eee+0Mc8s0SCB47Rfc+EVSF5x/i3jdMxbBkkorLrVmob577eNziZBMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyksnbdq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyksnbdq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so2144834a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105754; x=1788710554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=kyksnbdqZ47+kSj+nWGucjW4eEB6AIvW9McJEgCa1C4c9Y1XcU78Nb9VGvvF8DLiVq
         UMRCJumCfZpR+TZupOv/RGjQxzVz3Udw4dvVYlKswWvSD++w1Oy2A/tPI5Km1z0KKMo5
         7NP/tPbKZ44VxYfno+ZpuLaoh2VncCJDsDxlUZSLQBU8MtA5GaNHSnsyNdGsHx7D13+e
         8f9fvprPZnmvgCAh2flwCH8o06sZ6p3h6dQWXYhZ945btkTetrqtBLekyrLsxFX9MQxx
         64mKJhh+mkuHTcUG7bO1tI7xHbbGYzi/br4Jl/D7XNhAOG4WS5D8Qx0CySOm2cUUBoG7
         9RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105754; x=1788710554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=V1I3mAYKqy+HSaOr15Ud2oEdWipxNyYFQaswCMCUel9J7w5GECcTi06Fm/fhNYEExD
         4wdzOTLcSuOZSr7tUD3OedNbZbYMdWrPs6LMBgoOi/y9IGZp1YB1UHja07k8GTxU48sd
         +CfX4zJRMqqTBQrEAdldj0bcZ1K0+zQhQQkFTIlHExxtYrnTHY10tVYvOcOfTj3JAMO8
         wkXrwCqS0IUQiWF/7tVUQPXp8hPE79LN+zZusBatLMa+Nti1yJBAAtWC+9n24hPbvZSH
         lMVIwFhwh62/QMSOcqIqk39k2HVGfatyP0wU2pOtSpRsTfGhFTp1tsynvF+4ktTgY18G
         ddRg==
X-Forwarded-Encrypted: i=1; AHgh+RoV9Pyfsk0XVeT5bFMc1uwGNGYM5S9oUabeiX+aHVVHeKWNB77szYUegqnp63XDEdz40DcT66GOZssw3Pg=@vger.kernel.org
X-Gm-Message-State: AFuF++llMHzpW+aQ5OAdYKmOdQO6DkyISIGdhcNTxTH/ixqRo2QAFJtu
	tyTjBHiX3+M+cd5iaZXwjZrFS8JSTjTUxtEM4ELMeVw3CuSzc40TW1Q9/OkEM0t0
X-Gm-Gg: AR+sD10Rx81Ip2LVgiH36hM1PlRv4Dcqyk947fIPvlsyBFZ9Ml6lVIUrYC0Nj6QPtXp
	lZRaSLWUThqWAi6km+HcNIpICI7tXWXdO6MtTy0gNGfknkwnU+itIy78xjdMEL4CorKRceJaZvC
	hPQ1zpd5n4YEXDpK3w4OtIseXHwuy2XdU4k7cyM+5ulvzxh6NB3QnHbnot4/f+shr908Ns+j8X8
	V71AzGvMw8e3iLGdqgarA5iOlDbLURpPkQxgcrT1/SloQo4bs+/bauTmDN/MAdbNgPJoDy75E8y
	LqLt7Pgf1Mz1tdNIFayoP3CE9WB3dEdA00yJs3pEy2CbEPFI5MSs3i6pUJuOfH6uc1q2Ur3IcEl
	xvYX/5QjIjSVhXfBS3W37ahpvW40CF1lX6IrZWb2ctKMxSTcNNjIoSBxhrk2cnVZQHUzt0gDw7h
	228NxF9tqA0CsSvq1rtaJoc8BIfylzyAU5dNi8uLBuvWD+PGPQbPgcF4CI+zf5QMMzi+eUBw8oL
	xH6eb7qqAn0lNgDfbUiOq/dm67cSMLkKP9/9Ib1fN9/q05TsiA/aQ==
X-Received: by 2002:a05:6a20:729b:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3d26615ece4mr29016741637.8.1788105754380;
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 0/5] fix and improve for Hi846
Date: Mon, 31 Aug 2026 00:00:20 +0800
Message-ID: <20260830160025.211384-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v6:
- Add link freq ctrl back (Sakari)
- Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
- Move clk_get() before than hi846_parse_dt(), since we use clock in hi846_parse_dt()
- Add link freq check in filter for v4l2_find_nearest_size_conditional().
- Link to v5: https://lore.kernel.org/linux-media/20260712115012.91600-1-mitltlatltl@gmail.com

Changes in v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
- Drop line break (Sakari)
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
- Link to v4: https://lore.kernel.org/linux-media/20260511103927.279550-1-mitltlatltl@gmail.com

Changes in v4:
- Correct default lane cfg in commit for 'fix link frequency handling'
- Fix messed header (the Media CI robot)
- Move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- Fix modes handling for different lane cases (Sebastian)
- Fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- Remove uncessary `else` (Sakari)
- Fix link frequency (Sakari)
- Correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (5):
  media: hi846: Fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: Fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 370 ++++++++++++++----
 2 files changed, 289 insertions(+), 83 deletions(-)

-- 
2.55.0

