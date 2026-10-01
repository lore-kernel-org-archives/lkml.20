Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E677237CD40
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870802; cv=none; b=gzjvvaZF+7B6YMvgzpvcW3gDOre67vwOFvK97UfngLlReUOlUVst5OsEzmcNnN0dTeT8/7H09EtG8c0evsVRjbD1ZQ9wmhlSHjpeEjajNAFueSKxRuo7hqeL5uDpjdwBZZlqoRLJGbGC4EObNmihIdyziDPQuwdtnGkQyCaSPME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870802; c=relaxed/simple;
	bh=v1b8eqA53vWyaoL/nk77SSDjdPtd/icodDftAaYnipk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CXLVZpuCPWrNncwsCvR1xC2n2UNqjKCFKdHJEIBnGRIQ4+Mwmafx6HjH1PXcuuBIMT99tWF8G3d6MVzXCP9CKy6+2P5ah6W0+d1ju+lnYFLuHarNzjTginOFMsSqyeo0ttLnN76jheKm86OWya6FiGVNb84eJknDt/yr+j5rwLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lXS28oxC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lXS28oxC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso26083435e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870797; x=1791475597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5nZpXcJbXMJzdg62qAg+c4KRRXxPmmTywOGusgAV+Us=;
        b=lXS28oxCmj9XTwapyLcxwZAPmhMiwDeYrNBjY9XclcC22dLaHI4Mb3SyNxNElKxkqQ
         C0pnNxpGNNU8gEo/adsmiNYhq357S5vLSMG0nskdIz7aPdhcnUtfi0zhIh6yKZjSnkip
         NF9/WLSeRQ1lkdGKUDV/YAiX7JT/FCtw6yIhPuztDo1KRVqiSw5yhTFEb3bwNztgZD+O
         c5F98d7Bxcz13Hx9/zZ7YIMXvUFw0BCnGIIPQ38dGCBfn6jCcrVAw0zEtZGFynyhqneN
         2Q5Vmnqy7AtF9JcbQla8iVoZxRqC/Eh6ZbM+XBh4EjWAyWoklXPqhkQgU+ClaKEp+Njv
         o6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870797; x=1791475597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5nZpXcJbXMJzdg62qAg+c4KRRXxPmmTywOGusgAV+Us=;
        b=0B6J+r3zV98CMNWBRN06EXoIttnawQiVibhAUXYWTMjoFR1pxzR8AvdWL1+NH+w//n
         gJtgTKT+70iznNiKnD7uNkAC3QBaAABel9uwkxIcbpXF2ASDe8SjuTdKiJjOfNrIZt1Q
         HMvRSGflSa882z/nE5POOQ9blWK6MmBEkVlE4WL0b+vBd9LOtsDBvHupY+0qW7inNqDa
         fc8XHiQFvLMvnJeA8q2ZL4ac6Jj9aO5/Wk/2DUZq3p2IQmYJu3OgLISdc2CLfy9EixS3
         nyhw72WbEKqm6sCHXJMGxMsUN0s48SfDtJCi0dxJEsoljAyMpnvEKkatDKc++7ZWhM2L
         4eDA==
X-Forwarded-Encrypted: i=1; AKwUvBw3g74fHNYNqXcQqXmncdSvGuyeZUIefKNxANlOeVdUCnN5Z4FFF9h81u0XeY+dPaY2UjjqdnpBCZUOXuM=@vger.kernel.org
X-Gm-Message-State: AFuF++m2KYZWtWhxcZXHQISZSRHC3OP/HwYVUj26QswGAxhrzR6UuQxP
	VHJgfXOZy+guM4eWbDRYO9/5I/fGtBU2GhmaQ4MFoi9dgVwpdGb6XUmObz5nEAXKhlM=
X-Gm-Gg: AYBFou1q777zhUBPG3bK1wslVD5rWRgubGfYDtZi3rezpbADME3LWIYwVkn68GQhl2g
	uVoQuuUiMIWia1ryms+YRRHgtQLqvN6Vj0WVSdVUDzZ5yexnuo++/74xm3EHWXbiF5w+Dcu1R3P
	YvYhaIazEiDM2+jpLi0NuX+wzjjxVgbBnWYYz8p0j3G8+uogk0VLIHZRXtxtVrp9ZFLd6+OYyh9
	Qq5snL0uwmBoDi8y+ZwyJmRtxWx3I5bShxc8rV73din10fiRk0B3Ora1Y7yNgaQcaYXqPsRaBIY
	TvOujpHv3y5H91n9+8Qvd6oeG/UklHVvQS+ccyMiKdQlzcWj/sV4QzNtcJFx/IKdKON7s/5Lv5w
	uA+ARR5aGikm9zFRfFcc3gbdOxu4WZw5suAx07ziXe9VIcCBQTG873vs5kEwOM7JNY++dIBKoGQ
	HScsIGncpFEoRzqDePW2oVXZsMU+/TfV/cwUVmUjmuA7PxJTa7rRrwlg0hci++/lbJ
X-Received: by 2002:a05:600c:42d3:b0:4a0:1e68:d27d with SMTP id 5b1f17b1804b1-4a0276a20a2mr1055955e9.9.1790870796877;
        Thu, 01 Oct 2026 09:06:36 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:36 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v4 0/7] ASoC: meson: gx: add base support for I2S audio
 input
Date: Thu, 01 Oct 2026 18:06:25 +0200
Message-Id: <20261001-audin-v4-0-2476646118b5@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGFvmoC/23NTQ6CMBQE4KuYrq3pnxRceQ/jon08pEbBtEAkh
 LtbQA0xLieZb2YgAb3DQA6bgXjsXHB1FYPabgiUprogdXnMRDCRsFRyatrcVTQDY63aM4BMkdh
 9eCzcc945nZccWntFaCY8NUoXmtr381HHp96ymXHx3uw4ZVQXFgvMRKo5P1rT35z1uIP6TqbZT
 qyh/kARoUxzVBZ4jlL9gXIFxfdRRmh0wiQXwHQCP3AcxxcMBs6iIQEAAA==
X-Change-ID: 20260831-audin-9cabb450cc94
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5604; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=v1b8eqA53vWyaoL/nk77SSDjdPtd/icodDftAaYnipk=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wtm1OY9/WCrGain38nCmlc27de18mqFznq+5bRGmG
 GZ8Zb9sRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZSMYOR4bh39Mdl4UsbzFXd
 frjmGwjpGa24UWG4/HN5xsrM7DjPVwx/+GKCJm9+wcv4/E2k7M9upVd3gztnTd7CyXH5nWTr1rD
 zbAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

This series is the 2nd part of the initial RFC [1] proposed to add audio
input support to the Meson GX SoCs. After the AIU reshaping series [2] that
has recently been merged, this one adds the audio input path itself.

Apart from some glue commits for gx-formatter Kconfig split, a fix for i2s
clock divider disabling in aiu-encoder-i2s, DT, bindings and integration
with gx-card, the core commit is the 4th one, which adds the AUDIN driver.
This is the counterpart of AIU for capture: it gets the entire register
range, it handles peripheral clock and reset, it instantiates the I2S data
formatter as widget and FIFOs as DAIs.

Resulting capture topology is:
  pads --> AIU I2S Encoder -> AUDIN I2S Formatter -> AUDIN FIFO -> RAM

This series includes all the changes related to this work (dt-bindings,
drivers and device-tree) in order to give the full picture in one single
place.

Unfortunately, since no Meson GXBB/GXL board available in the tree features
an I2S capture capable codec, this work cannot be directly tested out of
the box. To test it an external codec must be connected to the SoC.
When working on this series, a custom hat board with an NXP SGTL5000 codec
has been plugged on top of an Odroid-C2 (GXBB). The last commit of this
series fully details all the device-tree changes which are required to
finalize the support for this scenario.
With this hardware configuration it has been possible to successfully
validate the implementation with:
- alsa tools (arecord)
- pcm-tests

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/
[2]: https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Changes in v4:
- Dropped the family compatible 'amlogic,gx-audin'. 'amlogic,gxbb-audin'
  and 'amlogic,gxl-audin' are now the compatibles for GXBB and GXL SoCs,
  respectively, with the former also used as fallback for the latter.
  [Krzysztof]
- Link to v3: https://patch.msgid.link/20260922-audin-v3-0-a760312c076c@baylibre.com

Changes in v3:
- Fixed i2s clock divider disabling in 'aiu-encoder-i2s' 'hw_free'.
  [Sashiko]
- Specified const value of "#sound-dai-cells" property in dt-binding.
  [Sashiko]
- Advance 'last_pos' by whole periods in the FIFO polling timer to avoid
  drifting period notifications. [Sashiko]
- Link to v2: https://patch.msgid.link/20260917-audin-v2-0-38de4bc1de34@baylibre.com

Changes in v2:
- Dropped FIFO child nodes from AUDIN in device-tree. Now AUDIN is the
  only sound component and FIFOs are its DAIs. This is the same design
  used in AIU. [Krzysztof]
- Renamed driver compatible, using 'amlogic,gx-audin' as fallback and
  'amlogic,gx[bb|l]-audin' as SoC specific. Fixed also other reported
  comments on the binding. [Krzysztof]
- Adjusted headers inclusion in 'audin.c' and spacing in the empty entry
  of 'meson_gx_audin_of_match'. [Uwe]
- Replaced 'snd_soc_component_read' with 'regmap_read' in 'audin_fifo_pos'
  in order to prevent sleeping in atomic context. Also changed the hrtimer
  from hard-irq to a soft-irq one. [Sashiko]
- Added 'sync_stop' callback in 'audin_component' to ensure the hrtimer is
  fully stopped before attempting to restart the stream in a
  "start->stop->prepare->start" scenario.
- Link to v1: https://patch.msgid.link/20260912-audin-v1-0-7fbefe928711@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org

---
Valerio Setti (7):
      ASoC: dt-bindings: add amlogic,gxbb-audin
      ASoC: meson: build gx-formatter as a separate module
      ASoC: meson: aiu-encoder-i2s: ensure clk divider gets disabled in hw_free
      ASoC: meson: add AUDIN driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add AUDIN node

 .../bindings/sound/amlogic,gxbb-audin.yaml         |  69 ++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   7 +-
 sound/soc/meson/aiu-encoder-i2s.c                  |  12 +-
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 371 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++++
 sound/soc/meson/audin.c                            | 188 +++++++++++
 sound/soc/meson/audin.h                            |  30 ++
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 893 insertions(+), 15 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

