Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788B94E0212
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069612; cv=none; b=ASGqNt4d5XsBi0vvFwjPeSNhnd0rC7TSbaxmcz4uJMFSr9pHomqzlpWUQ/HGlONR16rGpQBl2r3GL3CgTJliRNxdTUSzeQL55oU3dMUOl/rQVCb2wMi0xaWeZWfmXvryI0fhbS9ylRTFwshp3a5v/FfxLqEW0RlLxj9LGnLBn6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069612; c=relaxed/simple;
	bh=p7n1Ecnt0Ig+o5MTz0wrxEjhHgnBndQY1zB+5PXKm0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAnPAgr0u9mWe+CFChkrSb5on2PXygVKhG0tRpKGehd9N7Zj4vWSGFPnOB0HT2WZBa/7Ib4uIXUhkNJaODJ15wA7chV9jh0Thzcb862x3kAkuQzgcO57gnOFtNCTs1CmcPqSt0E7zxDbPxcf8XuCONBkozq6bVLKuYRqzjj4Rlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSTbGdrw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSTbGdrw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so32432205e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069609; x=1792674409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVKjnhR2wtejD6NNK20XI1upYrpeZTFwNjFuTIUiDEs=;
        b=jSTbGdrwnV/nEf3vlDHnERFngHyo4ZcfFxiTjjQAijnrmjXtjt+CxUTKT12zwTbuFP
         JOkfKqRz9jPk1I9nmZjfMYSN3zj3NNitNU7VVkZzI2lAvVHf/rz6US6rGfIrSQ4/ISqn
         iqEyqrfkqot91lYJQCcJUY9StHxB/7myvhosgu2Ai9SYrd8YjB9XtoijxEb5qGRP+NNh
         fwECS6FeOjafxArgc6nU96FxsgWau0PDWt7Vbf+1vjYhqxi94/zYxm42lO1OHOUKSoH9
         sMxDRw52ZbNddZpYbR1B3TiZDLJXLPlfd5Q6kDI4VUHEx519zJssunR4RMQ004B0o12N
         l40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069609; x=1792674409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVKjnhR2wtejD6NNK20XI1upYrpeZTFwNjFuTIUiDEs=;
        b=Thwdo8u7QsffJEy2gKZ7mWVPKwKKOlD0gZaMlWIiJ+w5JnynJV9R6b1cJAotf+fmVz
         tun7foRlottQpAflogK+0s41hr4G5kK/4u2ZwTsflEqV79KmDd9aODt6Kk6tdlJrQOzT
         88/E+Ijo3uG1QjOkNh8IfczrlKGuFh5uVTCi2e0JqCzm+OZZ10XSa5+wxOUg3A23Q+Mx
         4zxS1IPlOX3Dc83SLClOo6WURTpYayVpIbIjYglC/9f5LXUBsQTgpsb4FgmFhuU2I8an
         fFsViLZABSbV0x4q1MviYagGfAnIp7xSWrhzwOqxwGE9Syg2mcoR33c0WNT9Aa+FeHuS
         3kIw==
X-Forwarded-Encrypted: i=1; AKwUvBw032G9vobBwaxiVsVvR3h8lDLjkhWuewnpxs5sgsAlvsozLeW/eyrdCQPdaxcPXYPRsp+leXKcbgBWyvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuEZ0py0YeSDJpTvlBTmXMGcf2vG9Lt80r8sEeFHerzPtEoucA
	Qmt4z2FR9qczhV1HmrrbBGEORaC5b3Op9Ww8/RyISMAcdyMUXv4tCnQe3a360Q==
X-Gm-Gg: AYBFou346GgcllkmVbtYQdoizHM8j8oQLJlyX2FGxC2cHMHFH3Xirvt+FIKU43Evbcg
	9HldvyJpnzyFWbOZIQq2KdHG6CzZwVmKREKX3M1Vzq3VhFctzC4jgrGo3oAYdYZBCo7VSrlaUFE
	c1S70wKXFOcJsNmiw4QgRe83ZdU2E05UwwSGxuUrI6hENEzDL78JAM56wIBa6892r9jEJUSBxwG
	ePT9NznD42GTJ6jfsp5yMCA3s8cov+TwDn9lQqfPz61bvw0wud4zMzk7u1L+eG+NxlfaQpDM5iw
	Cj2o/mvOw6ZK+ovgSKyYZKYHY9UV6edv2UJHn0pNrrQss/nQTH9eaNZktmr2Nbv+/TKqi5o0Vax
	C7uXEAShwcRve23FDkUlF7ycoc+f19OcgxcsBtQ4rwLfm+4Jno2GQl4KPdxdtIrxz084I3krgTB
	qU9E6b/inLKs1UOu2N0O5Jd3GBtCOHI6/qccajiFd2wWV5fNn4CXzYS5q5ksgVcIzgtmpiIfbAy
	Pm0htjYucsJ32UL540=
X-Received: by 2002:a05:600c:a088:b0:4a0:333:253a with SMTP id 5b1f17b1804b1-4a18e49c331mr385515195e9.14.1792069608553;
        Thu, 15 Oct 2026 06:06:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9c001dsm67013005e9.12.2026.10.15.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:06:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support into a single schema
Date: Thu, 15 Oct 2026 16:06:27 +0300
Message-ID: <20261015130628.184279-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of codecs supported by the NVIDIA Tegra audio complex is
increasing, which leads to an increasing number of bindings with minimal
changes. The main differences between codecs are the compatible strings
and possible pin configurations. With the introduction of auxiliary
devices, a definitive description of possible pin configurations becomes
nearly impossible.

Remove all existing per-codec schemas and consolidate everything into a
single schema. Compatibles are grouped into common codecs followed by
unique codecs, all sorted alphabetically. Added examples for each of the
common codecs and for each Tegra generation except Tegra114.

Schema check passes for all in-kernel Tegra device trees.

Svyatoslav Ryhel (1):
  ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support
    into a single schema

 .../sound/nvidia,tegra-audio-alc5632.yaml     |  74 ------
 .../sound/nvidia,tegra-audio-common.yaml      |  92 -------
 .../sound/nvidia,tegra-audio-complex.yaml     | 235 ++++++++++++++++++
 .../sound/nvidia,tegra-audio-cpcap.yaml       |  90 -------
 .../sound/nvidia,tegra-audio-max9808x.yaml    |  95 -------
 .../sound/nvidia,tegra-audio-max98090.yaml    |  97 --------
 .../sound/nvidia,tegra-audio-rt5631.yaml      |  85 -------
 .../sound/nvidia,tegra-audio-rt5640.yaml      |  84 -------
 .../sound/nvidia,tegra-audio-rt5677.yaml      | 100 --------
 .../sound/nvidia,tegra-audio-sgtl5000.yaml    |  67 -----
 .../sound/nvidia,tegra-audio-trimslice.yaml   |  33 ---
 .../sound/nvidia,tegra-audio-wm8753.yaml      |  79 ------
 .../sound/nvidia,tegra-audio-wm8903.yaml      |  93 -------
 .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 -------
 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 --------
 .../sound/nvidia,tegra-audio-wm9712.yaml      |  76 ------
 16 files changed, 235 insertions(+), 1263 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-complex.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml

-- 
2.53.0

