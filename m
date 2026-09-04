Received: from mail-m1973192.qiye.163.com (mail-m1973192.qiye.163.com [220.197.31.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1471D41686A;
	Fri,  4 Sep 2026 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520726; cv=none; b=SfSEnPhYD8zBz1ydj75ujyYaJHiYfjPwltvWQTskQGdH/X1iBifRol48BnLIrzoSaAuCmSaT8atB4+OwU6Blm5D2kv4Hi95jJQ63/Au5/ESZ2CmvD1E3cMUEK/XoTfkJePbACO5zFvM0m2a36R2J7SbNERaTn994PFBE7p3bx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520726; c=relaxed/simple;
	bh=qNhMbFl0+8tleEkoZZdNpXH8z1y7vkZPMU0/luTj13A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pd3S+X9iCETsAmx1XtmkJh6dkEwp0jwYaBhUl44nPXwzd0+Ods/D68cUO6fQZXwGUIa18BbUBJTfwzvKO6FqcpWv7g8bL7G0Py3aaDrAIDR79N+A9OG91orj51TzonK5KZmTcIiQqBvY/gRGQM6xIZo7XqT4NqrPhsbPZuOEMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=G0aSWWRP; arc=none smtp.client-ip=220.197.31.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="G0aSWWRP"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c8f646b9;
	Fri, 4 Sep 2026 18:02:50 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v3 0/6] Add audio support for QCS6490 Rubik Pi 3
Date: Fri, 04 Sep 2026 18:02:24 +0800
Message-Id: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCXmmoC/3WNwQ7CIBAFf6XZsxjAFhpP/ofpoZbFbozQAG1qG
 v5drIk3jzPJm7dBxEAY4VxtEHChSN4VOB0qGMbe3ZGRKQySS8UVb1iYb/SYiDlcE/tZa0wvRN3
 K2mgo2ymgpXXvXrvCI8Xkw2u/WeTHfota/CsuknGmtOLC6L5tWnFJ4+wMhuhtOg7+CV3O+Q29y
 ez2wAAAAA==
X-Change-ID: 20260605-rubikpi-next-20260605-fdda114824d7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788516170; l=2990;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=qNhMbFl0+8tleEkoZZdNpXH8z1y7vkZPMU0/luTj13A=;
 b=DyjzfWyZooYl2T4wNplaRvqj6qUvWaFiUJMuiIYnKEQ0onq8fJ06D9Et7ELZnwPZvjl/Rt6nm
 Gp236L1+mnlCGOwxU3q1nN5IClev05u3eaOQKgn5YVdzJjeXBEp1N4O
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0aa06bdefbd209d5kunm6f63729aafb37
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkpIVhlCSB5NTEwZHh5JHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=G0aSWWRPPIQkmbUjsZ8CpVSUBuR+7xIQYb+UMp6g6Lwv5QCJK9/Qb0EQYS89R6v4eWTgMujIPF1Y7NWGvFAsGquy5ZySq+jIyOuM3xsw021XmISYe0ulW9Fr8D6i2fDcF+94YKne289u6PDKv5ynOe1IMvu2izolakSm4RdMIes=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=4SgzzfN9XSK4heNk7+WjBfxET6sCvnhhqs10XtTLQUA=;
	h=date:mime-version:subject:message-id:from;

Add audio support for the Thundercomm Rubik Pi 3, based on QCS6490.

The board uses AudioReach/GPR on the ADSP. An ES8316 codec on primary
MI2S provides headset playback, capture and jack detection, while the
LT9611 bridge on quaternary MI2S provides HDMI playback.

Document the ES8316 jack-detect inversion property and add a dedicated
sound-card compatible. Factor out a generic Qualcomm headset helper for
external codecs, extend the sc8280xp machine driver with optional per-DAI
clock and jack configuration, and describe the audio hardware in the board
device tree. Existing cards continue to use their card-wide defaults, and
the DAI format remains card-wide.

This series is based on next-20260902. The required q6prm MCLK IDs, q6apm
MI2S clock control and ES8316 regulator support are present in that tree,
so there are no external dependencies.

Tested on Rubik Pi 3 with HDMI playback, headset playback and capture, and
headset jack detection. The bindings and board DTB were also validated
against next-20260902.

Corresponding AudioReach topology and alsa-ucm-conf updates have also
been tested and will be submitted separately to their respective upstream
projects.

Changes in v3:

- Rebase onto next-20260902 and drop the external dependencies, which are
  now present in linux-next.
- Adapt the machine driver to the current board data, keeping existing
  card-wide settings as fallbacks and codec_dai_fmt card-wide.
- Describe MCLK at the ES8316 codec and BCLK at the primary MI2S backend
  DAIs.
- Use the upstream ES8316 supplies without regulator-always-on or
  regulator-boot-on, and assign the shared GPIO117 pinctrl state to only
  one fixed regulator.
- Put capture before playback and use human-readable link names.

Link: https://lore.kernel.org/r/20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Hongyang Zhao (6):
      ASoC: dt-bindings: es8316: Document jack detect inversion
      ASoC: dt-bindings: qcom,sm8250: Add RubikPi 3 sound card
      ASoC: qcom: common: Add generic headset jack helpers
      ASoC: qcom: sc8280xp: Add per-DAI board configuration
      ASoC: qcom: sc8280xp: Add RubikPi 3 sound card support
      arm64: dts: qcom: qcs6490-rubikpi3: Add audio support

 .../devicetree/bindings/sound/everest,es8316.yaml  |   5 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 169 +++++++++++++++++++++
 sound/soc/qcom/common.c                            |  61 +++++++-
 sound/soc/qcom/common.h                            |   3 +
 sound/soc/qcom/sc8280xp.c                          | 130 ++++++++++++++--
 6 files changed, 352 insertions(+), 17 deletions(-)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260605-rubikpi-next-20260605-fdda114824d7

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>

