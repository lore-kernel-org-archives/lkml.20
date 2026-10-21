Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586773;
	b=12eGoBXErv1flu+tuL43VYkG6bkk+Sy4OlR74FKWHaKhpVGVnDdo99KQ95pznf4eC4vv
	 7NzVqHbdckAV2THPRT8kbhQzMun2qqPfEz63acqvB3YYd0mydbcnOhdM2Qq90mwEm5e4X
	 4+P1+lpX0725jWy7yeu0oSxAq2AYC1yquFMOko+N40VZSZOg/X4P1nmapGa1LqbHHBvtD
	 wPMXnZY/cbiSypbcwLJW9L/zu6E4Qm1CF53FtuZm/XlThQtFugZsEOoCyPlLJxjSNTtxr
	 5x5ojbvCDODbe3Njo+t5XWJV0kIt+LLtSjj/7nNB07/cfvxnmdLSFpEs/7ClMUjt4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
	b=bOsOoGrqzZPJbWVB7W1VpiHtIynaHuPw1scwK43SFnYAKHbIWkWIq/FwnvvapEUmli/z
	 HmP6IALBREwsDfbKt941phbOUXFiRDlJe7Nf8e+8N2QiGl+m6qlGL1w2YAbfUDtk7P3+B
	 xvqD4MM3Zya2FYR9lKFHVjzDL/1UrIeEgXgVgMSJ8b+2t3zyMS9nCMldbaS+QXeX/JwpH
	 aasLRZXMJRrdcSyURSV2BBbRZbF9CsXTxBW3yeWk6u06hRFMyI4hJpkHTrKsANJZFN00X
	 G31If34m21fTpQnSrlORIGMOqbPpIu/YM1Y4fHVetqBxv3d2Gi1eANJU3Vtycta0Rvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EIx/1TgW";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C754606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C754606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EIx/1TgW
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso279929b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586773; x=1793191573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
        b=EIx/1TgWsYsaROjnyKXuouTFp4S8mdflZu7TaP9YW8yAOLNK3xbTWLdZmhhREtYNni
         Exw0YHH3zm67YD36bEN3+manSvXZo5rWjWbf+RT/PLVAsynpAvgrOk9UC2zxndSgkrCE
         OGNIjfKWv06jaZbUyk2+9Jk3IZTVHw95SUjZo7tnlSw29CEwez7lhqNckM0ZzQaoy8oZ
         pNMOBlup/IO/BOzlk37ZlBqfrsTkBFYgmB7g3WKs7/fjosPdVAZL84q+aFLWyJishlwf
         vZ0FQcaZXiFyvV27hju/Ecg9NgfXm7Tyxwpql5NpZFA/GJCZGRjK8SfXPzhLh0YDqdjC
         gZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586773; x=1793191573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
        b=I00Hike/mUIBbZksWh4ee2zRH2g0Ro6A7TvemXV9qvfXEghWl9JhQ0R768fr/gGAKL
         zDkBxiyS2t2GeehGSxz6g/uz/72ZS/ToJ7Mm7zRfNPoAL6okreNO37zJkIqjAR1Y6Ekj
         Qx+a5au7G3UB410813rTvi6xVysfgUhNQ/3BWKEUBXipUeoKV1Zws5NY/JQLw8MVlyaV
         7Mp/Z20uTPwHfT+mwdOP2KqDKPaqlUjnlTSP5iXNUry2SLdqq7dYD3CywY2YI3KP5IAy
         zT99a/QedLL0uM+8GtITZWTTMLtKSYR9YS7pRsoXmi9ouyTvyv8y0rtOkIDOdJOH9VmM
         0B1Q==
X-Forwarded-Encrypted: i=1; AKwUvByJn0qX3xyImmtDChmWk7pFaLnCGQIgZB5IzLOK9QWjQJlMQt7uFShOYu8YniXtsDC+xocSyMykGlorJ4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCUc1Co2mv87vytuCW63YDRNo29Lj/ZRtCvDJpBILFjXqj4SDD
	mz6UYBBZK0RCDhNgNqq8iUv8OI438C3YTCrVxX7zgH1DoXVaIRtK9yoF
X-Gm-Gg: AYBFou33perI82G6xQsy2ck3Bg1Vi3JzHH+WFvOsWwOXqqsfM1ML0D6TukgzcygDI6b
	SwUGlpQp0a0qZGrQbI+d3CTN/fhqB5CIMpQCcxSLJ5GXGOqalC0HCPCjU31jZWaNZeGWS4Gan1z
	73OVk1LyHjyjLvr824FdhyBmX72y6qrFuYtUe9Vh0dlbkRA78TP0aKEPDeh4H9Gcz1551u61hAj
	OKQjSfS/YzLQ0tTun/yLrHsRk+069wvkhz67bHlyC5HGM4iEn4NdL+oFLzbWZUeh4X7WiNluWgY
	BNUpPrFtGflLYnA7Tyyv/pieV3jAc5kw2rnShWCEPSlQx7ufCHAhTmZ5loYIQSUbxKqXVpXxEiD
	m1FJ067ieNzmPL2p7d7lGNIIQAo/8tdYe+d9rPENaZ6/vsScY4hxmN13rBDZlkynTk+3WBJwSLP
	8D403fDzrjzbZMmyYqyXECODJGuKOueR8cQlh0sW/s9+bPjqGaB/UrSTyUTxGKXs26n7hggsMsp
	w4QOMZb31EWSViyv0OxVNJYDS8Q4eNc46LP+lg3x1zb+bXomuuNL6XgLWNIH6fep5mjD8E3cLwW
	tbbUSedLHztGRHk=
X-Received: by 2002:a05:6a00:ad82:b0:899:632a:9613 with SMTP id d2e1a72fcca58-8a089d2c36bmr1490501b3a.40.1792586772365;
        Wed, 21 Oct 2026 05:46:12 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08960fa88sm832964b3a.53.2026.10.21.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:46:11 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Wed, 21 Oct 2026 20:45:46 +0800
Message-ID: <20261021124552.767218-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C. Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Changes in v2:
- Drop the hard-coded 30.75 dB PGA gain from the power-up sequence; the
  PGA keeps its power-on default and the capture volume controls apply
  the requested gain.
- Keep the PDM outputs muted until a capture stream starts, instead of
  unmuting at the end of the init sequence.
- Re-run the power-up sequence on resume before syncing the regmap cache.
- Handle the regulator_get_voltage() error return as an int.
- Drop the unnecessary of_match_ptr().
- Fix the copyright header.

Link to v1: https://lore.kernel.org/linux-sound/20261020143135.623897-1-jerrysteve1101@gmail.com

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 367 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 131 +++++++
 5 files changed, 566 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

-- 
2.56.0

