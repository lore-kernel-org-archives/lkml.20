Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793508128;
	b=TJ6TpVjA9w/ejn9oznWPPMiCZ7p46HfwAOJfNIYZXK/U/lsqR8kGD8c1ST5Si/eV8q3i
	 Ge5MT+9iCBiF1HmCrVttDJGdpUIntYP6BflF6fDjCTJ/2jJ8Uqrqu3xMryT6pkb0glIH6
	 26se/DBY0Rr0bJshIol3lczlEIjlEIs1BnjnZaGTUKfT4ykINGPjC1QRJLcjuOxLCWIuP
	 EAZuEGi5TgBX9BMO/h1sdqyZzvJkcpYB5aJzNU9OOmOW9vnNoqhaLwJuWJ2sWSa1oMwWQ
	 DZAji6Hy5GjM21zG2AgwG9VeZ6o8oBptuAzG/NeLZa6rU/tyTvA9o2wLnPQSnqjunXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793508128;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=KoWImiShPPX64endYV2oF0Pegts01lrpoAaRhh6SIUI=;
	b=zf9iZ5ox2TKvN17m/U5FRrI6WGq6RiRW+h757IeFoCIW1QSdSG2jQkiHEyixEIn9qsfG
	 vMWVhM6YUKz9yyzGU0zW+dnDYh54a9weCWYTs6HdFDzlzZHsDOekTq3GvqT5J+1XoOv/5
	 EAqVcWo0y8wyiK4RlS9WYLeHd4RAlRF65btfJ5EoNbp3JOlD96tWztzI9EBRXTr59Lr0j
	 PEOQ+4hACXEnWJGEDVCxVA8jC1VXymImfxHhyp+NIRxyGQeR84E7lbNXSbrtascIRygoF
	 Y6l7osvQ2BErkSVYUGkZIak1Hv83nrBxO0vHDvGFr1kuPen5LLfggMs2gcYF7M1VoNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=bqF6uGMh;
	arc=none smtp.remote-ip=103.209.128.53
Received: from mail-m12853.netease.com (mail-m12853.netease.com [103.209.128.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E6606A325;
	Sun,  1 Nov 2026 04:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7E6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=bqF6uGMh
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530dcc2c7;
	Sun, 1 Nov 2026 12:41:54 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v2 0/3] RK3308 codec audio sequencing and headphone support
Date: Sun,  1 Nov 2026 12:41:46 +0800
Message-Id: <20261101044149.2018744-1-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
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
X-HM-Tid: 0aa19569ff8e03a8kunmda3ed7c8171604
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUtDVkNDQkxLThhPSUNISlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bqF6uGMhSTBFAbWN5IR16gHZGfMogg7UR6TuV1g89zqcdicAFAH+wfNaI5+fSBa/5I6PVqFNUeREaMS7a0CtofeWp89stdIH/7RrAEUTpnrWPcYqLXkew6gQI0h3JmQfQklt6MADUXOYmu5zGZi/hz6GRHKkuCFzmq/20E1bN5E=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=KoWImiShPPX64endYV2oF0Pegts01lrpoAaRhh6SIUI=;
	h=date:mime-version:subject:message-id:from;

Restore the full RK3308 codec analog power sequencing and headphone
support from the downstream 6.12 implementation, adapted to the current
ASoC interfaces. Keep the complete codec source and register definitions
in one patch, alongside the binding and SoC detection-resource changes.

The codec change includes revision-specific ADC/DAC supply sequencing,
reference-current and headphone gain ramps, A/B CIC fades, active ADC
resynchronization, MICBIAS restoration, microphone boost controls, ADC
stereo-group routing and B/C headphone detection. Machine drivers retain
ownership of the external amplifier GPIOs.

The SDK-only multicodecs shutdown fix and EVB/VAD routing patch are
outside this series because their target drivers and board files are
not present in the upstream tree.

Patches 1-2 are for the ASoC tree; patch 3 is for the Rockchip DT tree.
The detection resources remain optional for existing device trees.

Changes since v1:
- Restore the full analog sequencing omitted from the initial posting.
- Consolidate all codec C/header changes into a single patch.
- Use the original binding descriptions and legacy IRQ lookup rules.
- Preserve upstream automatic DAI format selection and adapt accessors.
- Use sleepable waits while preserving downstream minimum delay requests.
- Keep the SDK-only machine-driver and EVB/VAD work deferred.

Previous posting:
https://lore.kernel.org/r/20261101040125.1864141-1-zhengxing@rock-chips.com

Validation:
- ARM64 defconfig plus built-in RK3308 codec, Image and all six RK3308
  DTBs build on broonie/for-next and the Linus baseline with GCC 14.3.1.
- Codec W=1 builds, binding/example validation and codec-schema checks
  on the six DTBs pass; strict checkpatch reports no diagnostics.
- The three patches apply to the Linus baseline without 3-way fallback;
  range-diff reports all three patches unchanged.
- Extracted SDK/upstream analog functions match across 11520 modeled
  register traces, including operation order and minimum delay requests,
  under ASan/UBSan. Parameter/error-path probes also pass.

These host models do not verify actual hardware settling time.
No new playback, capture, hotplug, suspend/resume or electrical timing
measurements have been performed on hardware with this upstream series.

Xing Zheng (3):
  ASoC: dt-bindings: rk3308-codec: describe detection and ADC routing
  ASoC: codecs: rk3308: restore audio and headphone support
  arm64: dts: rockchip: restore RK3308 codec detection resources

 .../bindings/sound/rockchip,rk3308-codec.yaml |   55 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |    4 +
 sound/soc/codecs/rk3308_codec.c               | 1155 ++++++++++++++---
 sound/soc/codecs/rk3308_codec.h               |   18 +-
 4 files changed, 1064 insertions(+), 168 deletions(-)


base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
