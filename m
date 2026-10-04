Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED33235E1D5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093881; cv=none; b=sXS1RMENJyq+YjDdstmu0JOL1isv+mHMPbzlkAdV4gidZ/06pNNGNRBUL9OmDX7YxWmJBUbZYu2/6RRoTXy6KSPlxzatS0lfyUBMEzU2K8BXT6aL8PWk45gyftufKpF/tXCc2UkcPadcHrsR1Sx+7prdVklamiY1civT2Eg8TRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093881; c=relaxed/simple;
	bh=InItdihPvue7KhBnmJaCghTk7rJnuaesPMmkASkU+Ns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zb49Xqu8gj0lBQi5G2gGlax+7oj8slRUHHHzJHVJwEBkWnFFFhdMF6vx0XgGk8sHrxQgR6Nzwyp+h5Lt0oWNtFHJCSoOrZAyxPsx6SiZQc2ExqDqW3JJrDvEj/uAaYwvkWYk3g7H5QoIHh0MFlMpATUoVUe9c8vNKkALEoAwwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f409bsxB; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f409bsxB"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc74520b20bso117737a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093879; x=1791698679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h7PcSBlvnmt+J9sgVvOc70qdQQS5yk/hCyycOuso3QM=;
        b=f409bsxBsaN14U69FKzmosurASx1rtTl7WxPfkJIRumGT7+Xo/NygTqHWW2JQbWYgV
         b6SB7MBSJHvA883dGMoKMn37mXKlqsLiBeVAUxmvD1RMThB4Gx9c4yQ7kH/6/afQ1UJs
         afJz2IRbh4i2uLouCQnSLi6zC/Isz2jX1x9R7N71NlCoV1M4UVawH8V3U/Sm4l+HiJkQ
         R4V3337M5fUq1fx1uOjpn2fQaevgV+OZQnxHNBeT0soNiVKyylrMKVLvG/btGe/unrue
         Bf/LTkCLnFJCEDBfl8/rgulYZZXZZEBx567Vv3M9l2cpqv5nGQQVTX7+b300zIo59A5+
         Eo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093879; x=1791698679;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h7PcSBlvnmt+J9sgVvOc70qdQQS5yk/hCyycOuso3QM=;
        b=gUlllPIJEcy7XTv0y3pSmnlQww7KpeLAMR9qslnV/uqzZdKSy++BaF6X5B1WwdLKcD
         1pFiiTSgi3Ecji/VwvwX4frsR7N0sWFHOcKws40oQ4hVlvwCh3cG1fdpTRYx1eD/VI0C
         fyVQUHR40GTeUH0jFtYhVjT0CZf69/4YxoHQbbaSuZn5ROcGhcz39XwMI/bc1PELuRTb
         HIVDLurQZ7/zi4SJkuyV8Z99zm+xIS5Ph59KmzY48g0efwHQ6ZOlZtbxc2ikOtauAVRp
         JJl0c54vpX+NTNuGxit/WiYEp5UDCuHfekDTpYajUjT0awm90hp35IWLFAeecud1tty5
         6i3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyBdkGTIzh6mBkFPzTyAO2QOPmiR/2gO/w5IWW5/YcdYHKE4cRkQJct6z8H3XbnpUYhWZIei+uaQvUgF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfZGQfSH5ecPYnHCJvJNQqCnLDDgZzhzI3yQYmltBeSavcHDY6
	vyP7/Jvk6RPtJ4+tVuLA2biOuIM7g5ucSR9z3eUPSvA4MUMZQmOUaCQZIthecDBv
X-Gm-Gg: AYBFou1pvBDwg6RjjHYfQz5/ZJMHWkYVfcueIP+Bi5J/MIccfkw6pe98t/w+eGp0Z34
	/crPHg3KKjlsAdAZyisRFz3TxME4SzZnLBJcPsZb4EGwb3PPwbM+1dLxEguAvaYHCplpeBus6L2
	NrV8j2c0MgDY194Q/n2fALUksNNODCoyo3ctDDgiXUBnkv2YZyS5mx5ZkS1/VE8SWk15uNR4Qhv
	JZCr8zj0cFCIriAUsKpDAbsnZhQyodRUgktn+8hvGsi9qTY8w2qQ0huz/ZB3mc6uNGEngL9urWZ
	DTc7a+/UnpKLXmNZRFC9qyF2jYPVuNZOhb7pKwR8llZuCD3FsnK0l5y+ga1QDks7kUT+U7Rm6nN
	H+5ZxN9vMW9rXlFYyUDsnqlUmJseepPcwdvaP8NiZfnLJecWayqZ9pERKKgFS+oNIqQhJPnaNk5
	DN7SYyKeAjJI4GN//hXb99QFlnVhxmS+ZDFgf7Bo344YCDkOu0vOEVg1uyUyGSIYt4aZkg/3nT4
	/V2If7LOozpQKHAXH+l5PdQ+85Y7xihC+x9TzNwmuz4ddEOqdP7kGtPXkppzxY9hZRmgbkgDojx
	+oVVpDvP53j9sf3PgqSqEaRAaQsE+YzwGp0ALyrAqSrpSfU=
X-Received: by 2002:a17:90b:6c7:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a6ce97d00bmr4270747a91.7.1791093879144;
        Sat, 03 Oct 2026 23:04:39 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:38 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/21] Add speaker and headset jack support for Apple
 Silicon Macs
Date: Sun, 04 Oct 2026 16:03:27 +1000
Message-Id: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBBFr0JmbU1bikRX3sOwqNMBxgglLRAN6
 d0FNHH5kvffXyBSYIpwyRYINHNk36+gDxlga/uGBLuVQUt9kmdViM6inRx7keeo0NS5NM7Cqg+
 Ban7tqVv15TjdH4Tjtt+MluPow3v/mtXm/bJa/rOzElKURiFqaUtDxbXpLD+P6DuoUkofFNBi6
 LIAAAA=
X-Change-ID: 20260915-macaudio-33c1c4f304da
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8568;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=InItdihPvue7KhBnmJaCghTk7rJnuaesPMmkASkU+Ns=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGrB7GejxJ/BY+XQc5ki3nai1coeDKk54HL6FwSs+x8HSeZoG
 oiRBAAWCgA5FiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmrB7GcbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJENQ2MtFR93lgTzcA/07o9jzZVCe7oiVoo4GLoAlryGIXkgrMlK/oeh3ub7r
 aAP41EmVnhb+0m1VzqLvSeTfgVll3CIMzOx5GM9pqdyrvBw==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series adds the machine driver and related bindings for the
primary audio subsystem on Apple Silicon Macs. The macaudio
machine driver is based on an RFC sent many years ago
by Martin Povišer[1]. 

The driver uses the DPCM model to dynamically
glue a backend DAI (combination of MCA ports and codecs) to a
frontend PCM. While this theoretically allows us to route any
backend to any frontend, this is not used in practice; the "Primary"
frontend is always used for the headset codec and the "Secondary"
is always used for the speakers.

The audio subsystem on Apple Silicon Macs is rather complicated and
the speaker arrangement is highly variable; some machines have a
single mono woofer while others pull together multiple woofers
and tweeters into a single stereo pair. Every machine also includes
a headset jack, and some also have their own builtin microphones which
are handled by a separate coprocessor with its own driver.

Many functions which are handled by firmware on other platforms
must be handled by the kernel or by userspace. Most notably, speaker
protection is handled by speakersafetyd[2], a userspace daemon.
Speaker protection is handled in userspace due to the expensive
floating point calculations and amount of per-machine configuration
data required.

The machine driver facilitates this by exposing a capture
PCM from which the voltage and current across each speaker's voice
coil can be read. Given that there are absolutely no hardware or
firmware level failsafes preventing permanent damage to the fragile
speakers found on these machines, the driver also implements a
failsafe that will significantly attenuate and lock the gains
of every connected speaker unless speakersafetyd is running.

Version 2 of this series drops numerous fixes and semi-related
patches that are not strictly necessary for the machine driver
to function correctly. These will be resubmitted at a later date.

Adding the required Devicetree updates for M3 series devices would
have bloated this series to an unreasonable size as they are still
missing most prerequisite hardware nodes. They will be added in a
future series.

Regards,
James

[1] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/
[2] https://github.com/AsahiLinux/speakersafetyd

---
Changes in v2:
- Drop patches that are only tangentially related (will be submitted
  later)
- Drop wildcard-matching API for kctls
- Relabel J473 sound model to Mac mini
- Align Devicetree changes with upstream bindings
- Relax Cirrus CS42L42 required properties to keep DT style checker happy
- Define missing properties in CS42L{42,84} bindings
- Fix mistyped DT properties
- Improve macaudio DT binding description
- Drop generic fallback compatible for apple,macaudio
- Drop now-redundant descriptions from other compatibles
- Constrain DAI link link-name property with an enum of valid values
- Drop MCA node from macaudio binding example
- Fix heading comment style in macaudio
- Drop obsolete module parameter
- Replace string functions with safer variants
- Replace dropped wildcard API with searching for full kctl name
- Rework idle props parsing to better surface errors/invalid Devicetree entries
- Add additional locking to backend setup
- Take controls_rwsem when safety functions are called from workqueues
- Replace all mutex{,un}lock calls with guard/scoped_guard
- Fix incorrect amp gain value for j37x config struct
- static const-ify all config structs
- Cancel control lock update workqueue on teardown
- Drop unused DAPM widget
- Fix commented-out safe volume calculations
- Drop speaker lock kcontrol ownership checks and related core API extension
- Link to v1: https://patch.msgid.link/20260920-macaudio-v1-0-741cc20a74e5@gmail.com

To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Martin Povišer <povik+lin@cutebit.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
James Calligeros (16):
      ASoC: dt-bindings: cs42l84: Document sound-name-prefix property
      ASoC: dt-bindings: cs42l42: Do not require chip power supplies
      ASoC: dt-bindings: cs42l42: Document #sound-dai-cells property
      ASoC: dt-bindings: cs42l42: Document sound-name-prefix property
      arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j313: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j293: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j45x: Add headset jack nodes
      arm64: dts: apple: t8112-j413: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j415: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j473: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j493: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j31x: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j375: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j41x: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j47x: Add speaker/headset jack nodes

Martin Povišer (5):
      ASoC: dt-bindings: Add binding for Apple Silicon Mac audio
      ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
      ASoC: ops: Introduce 'soc_set_enum_kctl'
      ASoC: card: Let 'fixup_controls' return errors
      ASoC: apple: Add macaudio machine driver

 .../bindings/sound/apple,macaudio.yaml   |  210 +++
 .../bindings/sound/cirrus,cs42l42.yaml   |   11 +-
 .../bindings/sound/cirrus,cs42l84.yaml   |    3 +
 .../arm64/boot/dts/apple/t6000-j314s.dts |    5 +
 .../arm64/boot/dts/apple/t6000-j316s.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j314c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j316c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |    5 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |    5 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |  135 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   65 +
 .../arm64/boot/dts/apple/t6020-j414s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j416s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j474s.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j414c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j416c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j475c.dts |    5 +
 .../arm64/boot/dts/apple/t6022-j475d.dts |    5 +
 .../boot/dts/apple/t602x-j414-j416.dtsi  |   35 +
 .../boot/dts/apple/t602x-j474-j475.dtsi  |   10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   67 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |  111 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts |   82 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts |   38 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   38 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |  108 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts |  132 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts |   62 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |  108 ++
 include/sound/soc-card.h                 |    2 +-
 include/sound/soc.h                      |    6 +-
 sound/soc/apple/Kconfig                  |   18 +
 sound/soc/apple/Makefile                 |    4 +
 sound/soc/apple/macaudio.c               | 1699 +++++++++++++++++++++++++
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |    4 +-
 sound/soc/soc-card.c                     |   12 +-
 sound/soc/soc-core.c                     |    5 +-
 sound/soc/soc-ops.c                      |  103 ++
 38 files changed, 3121 insertions(+), 12 deletions(-)
---
base-commit: 74612d0b448fe745e80cda87fe49ac3c102ccc1f
change-id: 20260915-macaudio-33c1c4f304da

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

