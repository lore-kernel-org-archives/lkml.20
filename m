Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796070;
	b=zbVK0iZUG3QaDmfp85aqnccm0rGdYjs6M961fSU+/rBB/9s86GgRy+jhZG/Z9/zQ7p35
	 ioTZkLOtez0rQJuuzWhcJSE29uNx+9xOGMm/ScN8jMsyw1CJr5Si/ACUjJn9Zn39fd+Da
	 aSio+yhjoANyweAjuj0fTbPtohpx/Eh891CrjvsJbpEQe591H8izehbNPME/6uM5E+LQf
	 gvXlWfexNhikyzEsX99BAVFdCihDFDc07EeHhBi4EZLGNIGxtICoRQnoan5Xz3ixXigrP
	 65Pe3RmDkoYekUmOScKHDfWhi2tznqgrQje6+en5/CKpe3QNpF7SMI92SW6mEAuCOxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
	b=GkPm8zikGCn9zD6vsmAyj7NIpIg5njW0rJWZZEl76Se8UTv4DXRHwAFPaq9lwm7aNjfH
	 iZvsSFKjY3SC4d2nXIso21k9FhDxzA2mBhGrRQqDklV6cthHc9hW5O0HfYBpYgsJs3N+a
	 5vzoV6mzT53Do1opAk/qO3LkMgBG85lCb+iYZpHxzeKpt8VWeX9A6SMnmHxB8szXgYash
	 qaDKR76XnL7ChOGpQlbfOUVGq5ZQYgITHgZNfllot7rv0zDyso3OLiorf4CJTh9ujGad2
	 UgHhxxs0C8NtgNSRRahPi3RFhBAuPsl15LL7luilP+Rvhq9f+nODV4NZnuOo6lCqczw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nPrA/j3h";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA61606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA61606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPrA/j3h
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4379955e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796068; x=1794400868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
        b=nPrA/j3hW/O99kGx7s7SfheqzoTdHcd7g8W0JNdsUl00HXqTn8wSNxBLgNloX3FIyX
         YO7/f3D5E18Qlkt79cbst05LdOHDR1AS7pXXPq35ksVs9SsYj8NXcmqHvvlOAleTHGTu
         UC8fEr2kVQZS96YagjQZxneYbBb+do3+oaK1SEufyUS6kp0xBIFmLzNOEDZGwyHx91xR
         Lwq5mYGeo66/wTMaofcA4vh3sHp3wRFyQI25eoefUO1zLsJ7YjYDQrMLR289PvmRvLIq
         u/lgVyiFQb4CPuwsnhFgppKQLDDoRdfZZZ8teZ5djHsGe5TPjk34aWGZCNdLTF8QEomL
         6ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796068; x=1794400868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
        b=rFFuSg6AIhbosKEvrct4lY8egNzs6NuDICuFtHBEvwV/uCcUCmSAlxx+Cegvwpl/5g
         Ry9/hohuYZIfiZSZTzooy8VtgSm+dUI6cepEuOayKNX8ivLKQFGUE8V2B95jM6+9gKkH
         hDCH3UbmVb90AhVibW+ZD8gLRQmtZ7oKteH00CZZIkz2g+ICVT7Lnd9p5Re3716zfPI6
         iO0FygIz2u2YfRcWR3d5rbXoHJT6HzQQVHpJV5wx9yokzyUQgrihT9D7+BHrzdbtkJdp
         exX0DnKGgq7p/boWEcpF0wR6hZt7Lzxk2F9jZUJf7cWOwPZMHKI5HDM7qyNHyc4CbGq9
         +1/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0GDv9jxqqJvKl7WmE2hzaXSiMRxOSNbp0nUzQ+urlMb6scJ1WIJvXoGHMnvQNlhhMvYQ2JkA4yvH6Kts=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VZNeCbqUTjIMEmJuXMBF4eUUhYt15YrunFhxuuZbGSmvFk7J3
	IMCLuUbca5oPzw3eEfKGdhvO3otRI/HFMXSGN9XJe0sQU9zwJVL2D5OQItsfJA==
X-Gm-Gg: AYBFou0tVEnVq4EN2nrQywLnmK5tUzCy33soeapaBIuGTHQHE0nvMmLlZKReIpvDkRl
	gRYEVhIvURLIKr+bgqAXdGKAc4uKli8fZ6TR+p9skFkjrWmK87f1NMNSuNK/bcD3xb5WrK/vMZ8
	cr9ColBaTTudaP1iI/5oA7fnDxlxBV3MgdUDWYCKvlooEf5epKl7AyhFwIfiSGUVXnRPqsW0l8j
	RadxZrUc1mqt05Cf4jUks990zJyDccxBdYpGW2lAZ3eROAkoneS3vC8TNjc0RVedxB0EXxMtuTS
	1sToaG+m7Ex5zysegBdHGKk99VEflV92RhT7lb0T+nvFeSva8urDON45yvs1N4T3J3wmENiZI4X
	3V1qJazgm+R8oevYOT/KCTVo5q4RNlzFuUYxlw1CHAadFh/7lvFGzIU3o6veRqkYaTYi+J4D+lc
	pOvU6meQVxPlCMOyxOelS9lnQQ5jCBaISnhStH7wWGPTxZGGX/fMpTYFiMRYN4gS2rA51HUYZmB
	QCyJe+vjAyY9D569aetAV1sCg+/JE0g5MSlteT9+2ms7lT6yVeBY1b34gwv3wbtc5l10a/xmhmu
	8VwBpeX0xa4e1sGM9wRw1AkuA29qLDJZPzs3mEN/ust/3fhNlI4=
X-Received: by 2002:a05:600c:3ba5:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4ac16fa356cmr437727975e9.11.1793796068291;
        Wed, 04 Nov 2026 04:41:08 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/7] ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
Date: Wed,  4 Nov 2026 14:40:50 +0200
Message-ID: <20261104124057.240288-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add/Update #sound-dai-cells to some codecs often used by Tegra devices.
Document #sound-dai-cells property for i2s and ac97 nodes of Tegra20
and Tegra30 devices since they all provide a single dai cell. Add these
properties to SoC level Tegra audio-related nodes. This is required for
creating more complex audio paths.

---
- fix dai cells in wlf,wm8994
- fix commit message in maxim,max98088
---

Svyatoslav Ryhel (7):
  ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
  ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells
    property
  ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes

 .../devicetree/bindings/sound/maxim,max98088.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/realtek,alc5632.yaml     |  8 +++++++-
 .../devicetree/bindings/sound/realtek,rt5631.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8903.yaml          |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8994.yaml          |  2 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra20.dtsi                  |  7 +++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi                  | 10 ++++++++++
 12 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.53.0

