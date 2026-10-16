Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBAA456E10
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146857; cv=none; b=Q94N81FqJq4KFhY1FpB2hdHnKSgIKMZdZqCnzcYJdhvc0Uk00f/WWl6j1+T5QH0D/1MCtFFPgqoR3jzz5cviRtlCHGlGhEUlLhAkck5YzFSI+agivrh60Jcn9HdoEbnU/dtYtIIqNOS8foIu9GesHLqZd4LpDSFQLB9SNdR56vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146857; c=relaxed/simple;
	bh=BnTr82S8w9wakAEeUEBfR1LlMbPBAs/IS0VPp87s/50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D+dSxGrVnt5nGFwOFIcuEyAt67MkKyCcUaM8qp+saAcQZBHSOLuA2KS/LoECA1PL/OSEMwSyTE5nsuhv3HzDLQyuhP6LQHsxbPh/TnfGv4In/45W2IokaSb+O3ltrohH/yQOsPZcsVm1ofhVv6PgCgpJABE9L5Ec2ARgn+s7iZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QK1ahZAd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QK1ahZAd"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c45111bebso4016027f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146854; x=1792751654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kIHJ0txQc8+sqtyNixhwGX7E5WSVvBAZuK9qukcWHcA=;
        b=QK1ahZAd4FUDQxSn6v1HSOGutEKOhjnbLoOOZdMRp2yj3NrwKZSxHCFPBZfkL2lqW/
         lNSDygSCQXbIQfaoYwicAYqr0mH5CbxbRE3bYkI4VZo9as4EE9jXtZbOZ+WRzuJcs9Uv
         7DXDgDQfqhp91+hWEntqil3Ui/srt8kMwPKrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146854; x=1792751654;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kIHJ0txQc8+sqtyNixhwGX7E5WSVvBAZuK9qukcWHcA=;
        b=stl8StmN2uKaEuKmXsA7KnewlP9S9ma2tP+CLM1QaXXObZJcMjXWgGnd2e3IqcKa5n
         mARqvqE21R3zELB6hQomLU5+qjb0825Y7C+ZZowYU4iIaLabI2uf8UFl0uy9HZlDQ3R+
         pv+0XYI5vqo/1qBgtimIScHhNt/OF4WwNDwQVEQe2QkN045ObViDiz+OksjsfQ1SWkVA
         3U/4arZ0qZoiuZTt+1ueWg7MfCrpYL0wFdvR+C4e0ywWUg/inofxx2CqnrLZpdmE40K0
         aviqe/sOMfsh/HsHqEMvJ9CCXaYDQe9D9noFhvvAJedFsX+a1OxZ4MnJbJBcrSPKCkV7
         e8eA==
X-Forwarded-Encrypted: i=1; AKwUvByLUVEYUe5t1S/+U6s5+A8S8GRzpxWcpLod2wRw2nxj2ru4tyomAGPoY2HCDjdvDnWF0y6ANsugRuYSIT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6xA3QR+rhA0+/Axq0c92DNZPdXVd+RpW0pRSIX9LMx3GAoUnH
	JMWmMYzEF0/AjLHtg/TdMNnaHu9MbnAnMrhgHg71++1XM7YydG6eWhev7EgqGGwlYDU=
X-Gm-Gg: AYBFou3QKtB93I4dn119KGodd4+inmft0+WJmAkyUdscT9KJVhSNWeBCVbdZ4IrQFpS
	khbuKNUcm9J+/CGSsbh65sLRbb3/G5BYV0+EkucODraEsAXTtgSgz7JxDKRg0+q6PuNkeGuat3K
	//N2Q1yYuXuNJtVxNQeKyfbI1RnLXsLe8vTmk5l+xxeFo/8Icv0sK6Giz+RUg1sBOwIcF8al7w6
	k5XekF6K+oytNXqb2+c5CimuPDXW9W5inLHTwEU849Nbe9DrWBUZDotkSBpilQAMzJwzz2zCynE
	PqBW4RXQfw/qb4btSDq5eHiY5qK4bpYl+Fq3nJq24qkB77fM8jQsIavtqaA3Dw1ETDtuMNc4s/Y
	E/wH9fX2UMDMlQ0LOSaKZlaCMXePPI3UBfLIgJoayPoEmEbkRU4chTidR1uAAYbt2A/XudRIHBM
	Yqig/LLK64qKN6aIZamMmHsQIEH5tZZM/eC8m9femaTv/cKRrW6v/YCft1pPzSV2VgFL/LlIdMC
	4VfzYTcc+4x1q4mklj2BSgX88Vmy5Yil3ntoyPqW03XPBowtey1IXQ/X1B/vk3h5w==
X-Received: by 2002:a05:600c:46cc:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18e4b583fmr437610075e9.22.1792146854144;
        Fri, 16 Oct 2026 03:34:14 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm4783272f8f.5.2026.10.16.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:13 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Subject: [PATCH v2 0/5] ASoC: pcm179x: Add support for pcm1795 and pcm1796
Date: Fri, 16 Oct 2026 12:33:53 +0200
Message-Id: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12OTQ6CMBBGr0Jmbc20FTCuvIdhUepUqkBNB1BDu
 LsFdy5f8r6fGZiiJ4ZTNkOkybMPfQK1y8A2pr+R8NfEoFAVElGJV4gPUWLuFNYFquMBkvqM5Px
 7q7lUP+axvpMd1uxqNJ6HED/bziRX769ykgKFQ8p1bUutpTubzsSxNRzacUiveG9DB9WyLF/kR
 2KEtQAAAA==
X-Change-ID: 20261002-work-705f20b60284
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

This adds support for the PCM1795 and the PCM1796 to the pcm179x driver.

The PCM1795 is register compatible with the PCM1792A, but it encodes two
of the register 18 FMT[2:0] values differently, so the format encoding is
described with a per-codec table instead of the width switches. Only the
PCM1795 has real 32-bit formats; on the PCM1792A and the PCM1796 a 32-bit
container keeps the 24-bit code, as it always has. Left-justified, which
the driver accepted but never programmed, is added on the way.

This series is based on a work done in 2016 by my collegue:
https://lore.kernel.org/all/20160311232856.GC27257@panicking/

---
Changes in v2:
- Added missing entry to spi_ids.
- Added SND_SOC_POSSIBLE_DAIFMT_LEFT_J as supported format.
- Updated description of devicetree bindings commit.
- Link to v1: https://patch.msgid.link/20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com

To: Peter Rosin <peda@lysator.liu.se>
To: Martin Povišer <povik+lin@cutebit.org>
To: Lars-Peter Clausen <lars@metafoo.de>
To: Nuno Sá <nuno.sa@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Michael Trimarchi (2):
      ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
      ASoC: pcm179x: Add support for pcm1975

Roman Smrž (3):
      ASoC: pcm179x: Refactor regmap value lookup
      ASoC: pcm179x: Add left-justified formats for pcm1792a
      ASoC: pcm179x: Add compatible string for pcm1796 and spi_ids entry

 .../devicetree/bindings/sound/trivial-codec.yaml   |   2 +
 sound/soc/codecs/pcm179x-i2c.c                     |   2 +
 sound/soc/codecs/pcm179x-spi.c                     |   4 +
 sound/soc/codecs/pcm179x.c                         | 117 +++++++++++++++------
 sound/soc/codecs/pcm179x.h                         |  12 ++-
 5 files changed, 104 insertions(+), 33 deletions(-)
---
base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
change-id: 20261002-work-705f20b60284

Best regards,
--  
Roman Smrž <roman@amarulasolutions.com>

