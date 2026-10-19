Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579484CB8B8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405083; cv=none; b=EbCGzQw2egiwsxDvU/hXmsZx80Ir7Z1JXnq7RlYNpyMZN7RUQkaznXDs9rphnF2VkT0KVNk4xe6wNLF3MbnPsstW+b6vP5rGwvZLgudxkUAezGwl4BiPG4QySnWy+OytN+5Aw/88cTzN73iwlQQq0tcryL5MJJ/ePNHb5VQp7QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405083; c=relaxed/simple;
	bh=J1xxRqlBh7boJ6+AATu8v1xS5H4zsaNU7gAePP3DFLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=odquUGhmf28HNjXowOWuK5PFz9CzRYEiBEcbSc1snaqLOgxTMP4vESgbbbpvtz68REuddp0+mlgchLQSIS8tWsd7+870/yZ9dz00mK0H+epvPDzyXCSbiUbhI0W4/L2ZdXnhy1FYjtp0JUJ187jqq3VdDP+JLgPtR8P1Q8fkNJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mo1C4y8u; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mo1C4y8u"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c45111bebso1152272f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405080; x=1793009880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQDkoaUO+6d9gZ51Qs77Gmj3Sntv3TlySXyax0SSKL0=;
        b=mo1C4y8u210F9IWjlwH934CdZse4B+UqwnWgMMjHs/+/fjRO36lu4TpQBdtqPsaES2
         2KSyvM1edwbzUZWS4rQ9cJzk/Ik2zTTlaCgj360jyI7M6pcytqsMm34kMkUSj+d00gqZ
         yRBJbVRRDgXdi6GOwtqMY5a+PAR+XZAFg2AlmpXdazxTlP0WdGsohxsmN77HbJFUg3SO
         lKTzWSdGQTnGTPm11T8reDJLZwW6sLFEqzBo+OnlqKQx+MCCXkYN04K/Igpu/+0gruq4
         E8E50V0t8R3IhQ/PEo1HvKiPl8FBK/XHg7ka48SWWjWNL8byxNiDevrvhqVu53hRJdBo
         5TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405080; x=1793009880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQDkoaUO+6d9gZ51Qs77Gmj3Sntv3TlySXyax0SSKL0=;
        b=NwSNyOb5FYHAD0/waSl+hONowDIWmkXC3+0N9iHJNdxm8hzbMBXV8/q2ptnMjy3AUK
         /sayFJYv8QiBK3lLvfCNaB7APKhS3ngu66vp5gvPYBKN550Z70NOve6aNkXTKw7sNsYX
         7l/0NNm5p78ywCHDsmfGIea2VoEOb/k5gciBDr0kddSHzKGf6vCSoDpX79tnFqpv1EVc
         Z/tIS9S7ZOa6a8gYiiX6UDVx1vgZzinIIFU8Mv+pydr+w8CLzNEsv2h2PvYIMA0KXN3G
         Xrc2Bb9aixswlqFXt4JAP0A4g/ni9PfyW1+Oepm3yCW3C62hgycrZhDgIF5cIxjGzm/B
         RT0Q==
X-Gm-Message-State: AFq9FYKgg8W5Mp00GPMgJFWdOy2C2xH7+VppSEg/lMDdEd4jpTvqXFSi
	sovAz7xc1XcNiT88cp2KQtAiw+nunz0VE2rKsi6cvRmDlHfV77Hw/Ycw
X-Gm-Gg: AYBFou2KZV2SQKN0h1IBP2xlXVkJFXEHbQkTSHZlb76a9EPfJ5KIUPjU/iiIGSxtLgX
	VGZ1uCrbDLkuQ+W7iVKKgpuFAHYVosqKFFBng+nxIlJVfcLiEB3KtYlApJElMsS1t9rxL1VxKoa
	VVUVI5RmnBe8fjBJKfgSGH3ImpPfHfKDwMnjFIH3Df6XxtlkiwJqB/qSQ1DaVZXHTtSAzAVHTdl
	MHZHP0rUBcTG+EidmW60sETukjjdn9bIDwAu0ie9ZNUPrB18KM24R7yZY1r5QzilAzhExiwlOfR
	QIerRM/VvD8CeJFKryfecAz2Wp2QKfCSsV1ZN1FOizP+HZazoxcUeMf1VGxTSJ8nFUg+tBPaG/D
	MYWgd7Qh7xKZVyvL1DEZ/LcDjSoj9CcgpHXyqj1c5zhApjKHvWHmw2Nd0/XRtNk229FfTsF84ae
	Bvc8S1znAsOWKjHc1yzW79jWkFlf485oZVSshOKs3eIHTxhZl1M7b+llPwct0/XpIuiQ35QJ4Xq
	+iCk35afkbYNscpf3k=
X-Received: by 2002:a05:6000:194b:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48e07fee915mr8782491f8f.57.1792405080272;
        Mon, 19 Oct 2026 03:18:00 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23913237f8f.32.2026.10.19.03.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:17:59 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3 0/4] mfd: max8907: Schema, pdata and poweroff
Date: Mon, 19 Oct 2026 13:17:46 +0300
Message-ID: <20261019101750.125439-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return

Changes in v3:
- added idata check in max8907_regulator_probe() for BBAT/SDBY/VRTC
- added conversion to devm_ helpers commit
- switch to devm_register_power_off_handler() and
  of_device_is_system_power_controller()
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 160 ++++------
 drivers/regulator/max8907-regulator.c         |  11 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 350 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

