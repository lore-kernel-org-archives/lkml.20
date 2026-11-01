Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793505723;
	b=R/zaRpAD0Emk+TmGBnQhaqKsgQfROHvMmEadxC7rKIlWAYpOP/acdBYLZCDeJLpIkqI3
	 DHvffMC+ykuCKcHI6FebaAwr3Uhz01L3ldMJwOE+WO2oIuR3vicwN44PuWyWQwws5B367
	 l40tPbzB1TwO+Z5RJ1Cy0JUS2UqsnqZ7ItH3/rhK1115pWny72sZNcCvMTZb7qFDkcgOQ
	 vWhyAbojeW6A6XGn3dz7TyCM8xoK3mgArR/sGcBtvDCG62WEo84U/gFXMLFoop6cALQBb
	 VFmO3R2fViocKfpRCKM4xsIESFodbMOym08+S8LCaPBNncL99//i+xZX6cze0x5mJBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793505723;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=Is9f9IM8ZVqsLAYH2gcTtPGO/D3u7WqNSOJmOqw4Svc=;
	b=4cWta8O6kU9PGIMmlhSHTrT7ed/FAvWXMKrBvGWZCaEOUnMRnoz+2a+aWQAm5d+013D+
	 HZTZV5w4St8QtyzRVfKB4sHmxWqecYrr4G6JargecOfm4yGC0BfgHyedXMj3TRaYcU0lm
	 l2rdBqVm09y6d602gMzL3gJswTosbT6cpEMLkEirZGo2L4UiGSZhgjO5Piv+MQisLV2J3
	 bN5vr2CkWRVi0hjkNDCx4BrPAQE1YNHmhmCX8aAnnLo9t52wG/MPw/FMF5epQOQy8rqqq
	 FwkYpVQfpn5HsrnECu61dU2h3R/9HVix5uAgPLdhqe+j0y8nVGHBS8CT+oC2KPsn7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=jm9qjyVJ;
	arc=none smtp.remote-ip=103.209.128.95
Received: from mail-m12895.netease.com (mail-m12895.netease.com [103.209.128.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B873606A324;
	Sun,  1 Nov 2026 04:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B873606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=jm9qjyVJ
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d84133;
	Sun, 1 Nov 2026 12:01:50 +0800 (GMT+08:00)
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
Subject: [PATCH v1 0/6] RK3308 codec configuration and headphone detection
Date: Sun,  1 Nov 2026 12:01:19 +0800
Message-Id: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa195454f6d03a8kunm8fccdc7416d290
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBhJVh5OSksaGBoYQ0pNH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=jm9qjyVJNzMqqBsxtM3O1CG8ZjLapVQucKeEDyYgODahlG3KRTQc+b82Hq/hOi3Xrgc9+7ARuEhUk//8v5ks4OrockuAO/26l8zBVocJ3kxHyq+n/hNWf5jUViufS2oyQPMjeupq7PKi1mQ5nFgdwkikLdZotBsege/MDezYPgw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Is9f9IM8ZVqsLAYH2gcTtPGO/D3u7WqNSOJmOqw4Svc=;
	h=date:mime-version:subject:message-id:from;

This series ports selected RK3308 codec configuration fixes and features
from the Rockchip SDK to current upstream ASoC. It preserves the recently
merged revision-B support (157f7cba77a9) and existing upstream DAPM power
sequences.

The first two patches preserve the configured MICBIAS voltage across the
component reset and expose the separate microphone boost controls. The
remaining codec patches document and configure ADC group routing and
report the B/C headphone detector through set_jack. Output routing stays
with the machine driver and its jack pin associations.

The last patch describes only the SoC detection resources. Mark can take
patches 1-5 through ASoC; Heiko can take patch 6 through the Rockchip tree
once the binding changes are available.

The SDK-only multicodecs driver, VAD sound cards and EVB routing fragments
are not introduced by this series. The larger SDK analogue power-sequence
rewrite also remains outside this first upstream series.

Validation:
- Based on broonie/for-next at
  11ae63bd9030349a0136fb2edd1622a4a029edc8.
- The same six patches apply with git am --no-3way to Linus master at
  36aad21d50d1af3f6954bb0c988257a908202477; range-diff is unchanged.
- Both baselines build an arm64 defconfig Image with
  CONFIG_SND_SOC_RK3308=y using Arm GNU Toolchain 14.3.1.
- W=1 codec object builds pass on both baselines.
- All six RK3308 DTBs listed in each baseline build and pass the codec
  schema checks; dt_binding_check including its example also passes.
- Strict checkpatch reports no errors, warnings or checks for all six
  patches.
- An ASan/UBSan host probe exercises the actual driver functions against
  a property/register model: 24 valid and 601 invalid ADC mappings,
  480 stream configurations, 15 boost settings, 24 MICBIAS/reset cases,
  8 polarity cases and 6 DAPM clock/error-path cases.

No new board playback, capture, headphone hotplug, suspend or analogue
pop measurements have been performed on these upstream kernels. The host
register model does not replace hardware validation.

Xing Zheng (6):
  ASoC: codecs: rk3308: restore MICBIAS voltage after reset
  ASoC: codecs: rk3308: expose per-channel microphone boost
  ASoC: dt-bindings: rk3308-codec: describe ADC routing and jack
    detection
  ASoC: codecs: rk3308: support ADC stereo-group routing
  ASoC: codecs: rk3308: report B/C headphone detection through set_jack
  arm64: dts: rockchip: describe RK3308 codec detection resources

 .../bindings/sound/rockchip,rk3308-codec.yaml |  54 +++
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |   4 +
 sound/soc/codecs/rk3308_codec.c               | 359 +++++++++++++++++-
 3 files changed, 411 insertions(+), 6 deletions(-)


base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
