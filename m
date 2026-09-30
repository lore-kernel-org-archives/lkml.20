Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774F0432BC1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751963; cv=none; b=Sh+z1Rdf/KmwLLdwmyI5C2uUQSMMEkgHQbUWRSMJOW46KPiDzLL1o0FxRgzQR3W5Tv84trd6WsHIFcrdvbfYI3C0nS2ToR76a5B78EFTzfRfBFgF5MElL+0DMdmEo7IBfRdJQnAeDNiopdh1bR8B4H614Y+Zu80kBY81Tp9QO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751963; c=relaxed/simple;
	bh=KquUcj0yy4UIql827S1Ctd9+3+E8Q4jB78n9fzRwyIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HGlQ1czZTe7pKpxbDZya7CXIUXn3ARsjNMRVcsKz9X0Ac6F4OzyvIofBT1btr7sW7NwcXcXIw6CUNrUbzit/aMwFGAQEHlHnawluJQQND+jgTzFZlM31B1KTWuOPjnps76Y+VuIN59/tEXJQ8JQ7iyrUUspvecXFCB9oRAMHtm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gjnuwc9k; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gjnuwc9k"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so3893837f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751955; x=1791356755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4ypwwp7JTLk+2ivLn91M7UclGnNz67wo1x4IhoVtME=;
        b=Gjnuwc9kXtf/kiuWt9LCw/1FDvCecw4TDAoezRE37g/PQpCobTIkFPWG75+1KMbvzL
         HX+VJPz8Bfoa5m9KgIWXOYXH1xyJn4/fd/yL0F9k9B9k49PBA7D10W6AaA/tLq0V1PeI
         ePYGQOxzqdfBvpHQESGmJ+g0uaCFEKIVi2drka+O+btoEpE0XpC8jlElNDqGLrBYPhLx
         +Mz8qQe3ituF1BvZ2S3D2gsQcdoOPL/6XM4FVQgu7oC04BeJR5Y8gJo1y52EY0rZH6kk
         53H1uBTzH5Yp7vIMIlwaicRyXgvV8alFh1/pzn3xos3jvkoMYZsFxwh9W+gw3FHh5JQW
         ffuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751955; x=1791356755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4ypwwp7JTLk+2ivLn91M7UclGnNz67wo1x4IhoVtME=;
        b=GyhNd8ukAB2B3PquxCc0EkqDKrLWyiHjEVdNNv37soNcIsn5y5ccSoDFWa/djUbQu6
         FCBvZz7o6+yFJeyZoRVVrV9++eJtaFc84WizFbHB0xjCFQnvdSTgtzf93EO30Y4LDXM4
         4pRzMmzSoZdFA3DXZbAuix39e4nRRU8ef9YO/mFlytkzQNjSUB0LInC4F1e/QtLreKZG
         Q6F8ikYeDNx52QJT0DZYPeRB8KnnLF0FDHtGffJoKSn2Ahe1VKYwmWovGUeBHsnNOBqE
         cUcbzfKBsdIyjS/gcyZ2rNTJnGiO6HAHZ28J6+Hx0C20qwNJ3enyt3bwFktZMUzzCDee
         nIwA==
X-Forwarded-Encrypted: i=1; AKwUvBw6KZ//+205QN4TBXIzM6R2txQ/Z62GlUS1jGxCJEqEFkqK9GMetKOrjaamqfWMtdSPmPV4i+DJyIqJIxA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRkaGW9fbaY3RBfWeg1faPYAfv+EBZlPt0T5KdY2p7kNpje86M
	x11Wmqw6TWWIHvOeTYReVJ1ef/pyr+HBzqIQ2G8PvIybEZLedqh4AkWU
X-Gm-Gg: AYBFou1zRTPWQrO3T9ekjtii6PuolLq3642NuQxY2cG0qHxxRH30YTxjdKZD727zbdV
	DM30iuugNBnbSKyHmn/22bwM7ETO/dfxnQKIpGNmqEXwcONf92JY7oc0P3mJLJ1G47WP4Hhb1AD
	TV9y87oOH7NJWaRhKVmR5ZAFccxgCBYi6jGVoQI4D+AbUvSu7O11E69xmU5JbfXnwqIxA3g0EqA
	60hmWDOKZfMnilcRvV9xbHQjEe49ZdUNwelGoDj3zIq8F2Vy8a0jy+YYOFUib/IP4S3YOV3sbWN
	hBYhfLxlerd1znIgory7kQ7gSSk/mV4ZiT0Ys5jEjlkjEC+nuCd+APrUu4QHj/6v7ikQbiUZvP2
	u6f6Jv5DhMyJZkWQUaGPmk5KLiLJupBWrJCxXj3O/YpRKl2ySCayAjeOs27fooMP6EC4fnQpYDY
	0gKUKRvSiRBskAxDTx0YFlxqy/wR+RK13Nd4S+ZAxgV+PFYcmBKeszfO5zLFWHsSSUx9HQpWJaV
	wum2Ch1UiJ5r3srFyM=
X-Received: by 2002:a05:6000:18a3:b0:488:811c:c78 with SMTP id ffacd0b85a97d-48b024f7a40mr1076050f8f.32.1790751954748;
        Wed, 30 Sep 2026 00:05:54 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:54 -0700 (PDT)
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
Subject: [PATCH v1 0/6] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Wed, 30 Sep 2026 10:05:29 +0300
Message-ID: <20260930070535.47130-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (6):
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA and LG LH400WV3-SD04 MIPI DBI
    panel driver

 .../display/panel/hit,tx10d07vm0baa.yaml      |  55 +++
 .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++
 drivers/gpu/drm/panel/Kconfig                 |  14 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 396 ++++++++++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/cpu-bridge.c            | 427 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |   3 +-
 drivers/gpu/drm/tegra/dc.h                    |  54 ++-
 drivers/gpu/drm/tegra/rgb.c                   |  36 +-
 11 files changed, 1121 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/tegra/cpu-bridge.c

-- 
2.53.0

