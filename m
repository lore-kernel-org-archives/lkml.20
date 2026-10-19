Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC1B4A64D5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403848; cv=none; b=P2oW0aYcG1aHUre3b02Sgrt0zSGqc9hrYJsruaQ4VKntWBaaY7v/mYJeQPULLSLWzQgF44R1lnG6xkXupYRGKRA7KSWNiPIyM6O0MsEDliL/2uppSgavOmWECrVdHxZt2M+KHEKxAXFZsAZDQec/Z4eUSqGjRoDvQuzedDOw4Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403848; c=relaxed/simple;
	bh=XB5CwEO7affGKAmL4pQhgSwl62lNe0rB4dEO0D6OYYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qgeZ2spML7HzphzKrHL33fQ3WU2faN+wcMYw0hbROB41G0ibWUvv4U+7OK14/oNsjI1h1uk/voSDxIfWT43H2t8oYU+wo4yypQ7GdcUu8OYbYdGCiIczrYqUMe9KAVX5POOvHwzJPWJKcnEx9yr8kAVu8VvRDwHvPz4SAaW5VV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYWg/Y++; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYWg/Y++"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1131774f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403844; x=1793008644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7COsRHRwbFZs67dB0peGMQf1r+S9Yv4n+CsneXuo9SU=;
        b=PYWg/Y++E+4vO4MVDsolvTL/XjzUBM+YbmVZTKHt0wiIeNRKx+uOpeHKGMBn9EQlmR
         cNUos4wrulqTvAJacwxghyWKRMIPOATw599VVtINAf36XaDWlA9OzyuGh9Oz8RvNuVUG
         M0nAb1z3Qj2FGdVZ5fodB6XIXLCcbfILfBHpBGvjMavaUB9yNTeS6c1DitYJZ8PeAycf
         Op/HqyqVvRaM3CixEQoug7Zkc4Xg+AhWFHH3vHNvp9O4SJ8ta7MNynbJi2zGmQLlfehl
         19ZK3xad5BPVl1GcbkLpl/Bd4CVnO7ZOWrODGZKexKIXi6ER+gTiXwnQ9erwaoXF5ED0
         Tubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403844; x=1793008644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7COsRHRwbFZs67dB0peGMQf1r+S9Yv4n+CsneXuo9SU=;
        b=kV36//rgRW4kl52hI54Mj928USKU4ac67rIbzsj4j1uqNsbhnE77OFz5mMSq4u4Z1z
         0EGigG+tzOBGmgybjJqTgnFFredIICDYv476DnRtpXxPhcH8gEI5B63M8gbK7srEYCSi
         EtQpu8/06saBFbT4umuIDtooRA7SrQlLCHtS5iQteN4hMvXNjV4J8yH/T820n5JSGI6t
         odj07CC5ENrpl+iAX4bq8VJD1UBtt178pm4PKGj4rt+0la8+qY4bjO9apu2O//bfYJ3t
         cDEswzd9iGSAAHOdHAzBnrS/Gz0hhKVQew7gBSGY56ObzkXQI2zz8rhrqWpQ5c61P+bY
         jBzA==
X-Forwarded-Encrypted: i=1; AKwUvByj7kfFQzOmG7w0JjU9cDvWmwY8tC7pInQ049ilbmMLLDpDeggmAiDnVdhIcKkmH4Jf0xHuOTv3reIzZjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9+FfaAAHlCOA/viCDd0oaDBw+V3ffWM5mWssqkPUo5zyf6tm1
	N/pKRjfx3JYyGB8yf1Bjgpr4YR8s3jj8GwHgT4n4VFLc33ww+Urko7YV
X-Gm-Gg: AYBFou22dQQTQYZSSzC+kiYQSv9s0iPZpq23zd20ukCeGl0Lbm//mDZ+Jo6YVHZkgJN
	Wdsg8K7ZmNHXgNzc6P13gX8QoBV6c8Ympxp2koCw26MTpkKCzyGn7XtAJ8ee2VHTfLkLvG9W1Ix
	PYnNkl2MfHjdH2Wsx/xbq8/MC6iaEtmO1fvdDAI4IMj0XF8PU0Vi9yzyTwrPsNtiridHcD6mZK5
	sdo7YEPdyy1FxZC+S9ig1u5CPIu1vX2VC1x4SEOax3r4cVumqQjHwEVDi0kJw+LoDHC1gnczTYm
	FDxzuinCu5C2qIspulGo3aU2EKIhsg1PtvKAZVtR1C/wdEB0j4Q0L8R+FTQNDp4WjTTxvY2kuaA
	JsqBCtG99Mds/7StTgxWlkYYC1Ht11B6aVlG12+jypwZxHGQbQV1glZApgwpbR2SbM3u/bWbswA
	3erA05v3zUv6UeGSj8BK8Ctx+Rph7Algl06V/i3ZOw+f+HKDd3ZRMTa/xIK+3g2YXzhlWa2uLTT
	Oux+trVa+UqhAY87FQ=
X-Received: by 2002:a05:6000:468d:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48e07978df7mr9786078f8f.5.1792403843556;
        Mon, 19 Oct 2026 02:57:23 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/7] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Mon, 19 Oct 2026 12:56:58 +0300
Message-ID: <20261019095705.91062-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'.

Add DC parametrization options needed for fine tuning by bridges.
Add 8-bit CPU interface in form of a bridge linking to RGB port.
Add 2 DBI Type B panels used in LG Optimus 2X which work with
the 8-bit CPU interface.

---
Changes in v2:
- convert enums in the dc header into definitions list
- add check in RGB if bridge_state is not NULL, if yes, use default flags
- inverted FLAG_PIXDATA_SAMPLE flag setup logic since default value is set to
  be on NEGEDGE while v1 set default to be on POSEDGE
- 8bit-cpu schema renamed to dbi, removed compaible and set as DC child
- expanded list of required properties
- 8bit-cpu bridge remodelled into dbi interface as DC child
- improve gpio handling
- rework attach to get drvdata from parent
- add panel supplies description
- split panel driver into per-panel drivers
- get DBI interface from the patent directly

I have deliberately left GPIO parsing from device tree since it seems to
be the most convenient and mainstream method of working with GPIOs.


Changes in v3:
- rgb: fix default bus_flags to match original behavior
- dbi-schema: remove compatible from required props
  remove dc@54200000 wrapper from example
  restrict dbi nodes for tegra20/tegra30 only
- dbi: remove unused idx from tegra_dbi_priv
  wrap dbi registration in dc with devm_add_action_or_reset()
  separate dbi into separate object
  export tegra_dc_commit() and trace_dc_readl()/dc_readl()
---

Svyatoslav Ryhel (7):
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
  drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver

 .../display/panel/hit,tx10d07vm0baa.yaml      |  58 +++
 .../display/tegra/nvidia,tegra-dbi.yaml       | 138 ++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +
 drivers/gpu/drm/panel/Kconfig                 |  27 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 297 +++++++++++++
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 236 ++++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   3 +
 drivers/gpu/drm/tegra/dbi.c                   | 415 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  32 +-
 drivers/gpu/drm/tegra/dc.h                    |  50 ++-
 drivers/gpu/drm/tegra/rgb.c                   |  41 +-
 drivers/gpu/drm/tegra/trace.c                 |   3 +
 14 files changed, 1312 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

-- 
2.53.0

