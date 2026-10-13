Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D64525A80
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914276; cv=none; b=ig7jqkq4v1DQxma2ipXEGphDdnj8qWkeU9/Rc2LLsuNV+pem7dEivXa6X/eyDQzUZrGf9qbQ9qeF4D70JiM6T9tFH9vJCWqD9HixQXdn1Z7dhRN1ua27nqFGFTBF1SNKuv1fpea2Oae5oH0F4PhuVX3loKjyJikru2ctG5aVHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914276; c=relaxed/simple;
	bh=GugSwvMULIKBhmXbHEwlcQ42TI86YVxrh5vB+fzkqc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xwg8VqqBNf1cAs/SBhpOaHsQlOAhw6/7P4soiHvQ3pXKpQ/rLk+f/O+tKei42OXLAJcpDETa5StOzGPuF2utlQSn8MPfJHtwnALOdYqY5W8bsrdiCmaoVqwC1/gcBSvkyXVK+1vP587/ei/lAPnN2/XViMznJXbe8bzv1lJcANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKOOWfUm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKOOWfUm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso18109135e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914273; x=1792519073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6ZTA5XoiG06DywZLo1HdZL0nmmg1bBIa4aTddTkmMk=;
        b=MKOOWfUmQEIt5C8mAFKmz6/x3xJrZ4SbFYAuyJb3z6diSUHP8rN10ysxSd6nWErz9c
         rYfBnZlEdzQ8jCid7o6v5JzzQuuHccw3s93E2FwJOnAcGrfZnZHmZP1gstWtP27yWdWi
         mzVTT6NHUua0wdkDPwRCkfUFsRdoAlgo95dYrdCDfm5W2ecuGYTvazqJy7sYQX9lMq48
         XDusO6PUDZzv/VUN3bZjH8vXFbGgbIMsj8V+YK4nnsD2qMofLDtlJqUaaUwnup9+J3D/
         /dGAZrV/hCDNsb1Q69g6FDWNXTQPZToHGdZDzzlIK9DHixhDxaN4BlVCb/s5IwSiigNV
         z9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914273; x=1792519073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6ZTA5XoiG06DywZLo1HdZL0nmmg1bBIa4aTddTkmMk=;
        b=ObW4pPWuWbP3eCaxjW9Y999kNOzJJy1LbUivDlx77AI+7sFHV4+qGBbzXFQuQ1a4t+
         aICRCJooT1sfHBzldZN9NtpD/w44v069jTFcMG/IO+77rPE/NQy0RHO8wyx/1yn4ydHM
         tixPVrzXpdwx1mA9xDM6rmP5WjFJ/nTYnfnD/5Jtr+G+xBusiQTz2Wab/I+lGg4uXWmC
         eU6/DCVeXA3S0qPZBlf+hye7bv2KyASkW3oUIiWa/VixPtRSYG1fVV2QBjSaPqzFuokS
         qDzXLkYfPtMWwtBRWqyM21xq25ZT+goNoa99mj5XHwMLoEPbtm0Q1ZEdC6eQAi21oaQm
         819A==
X-Forwarded-Encrypted: i=1; AKwUvBx2tuQSF/2jucLt8OzHbF7qF1cpoW0H2Zro4B9y6lNdCVn2xe3JcK3hh9g52qmf1ehzuon+nRtuUdpPI5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvRfngG2i+jb/jGfKcM0ImKDCTPmRIZFXwIT4u66EtWsfMm3eA
	vQszGyZQNh2D+Z57sfw6wF5Mr99SMuKxtOkpst/nL+3HBNDAfZysQEhg
X-Gm-Gg: AYBFou3OJmMXadgtAzjqqbkFU0gUjI1DX7znKA38mNXmFYGV0i7ecOTgH67pnkvb7v2
	5gNnP9HlFfCEkV8YQ5lCoPQ1wB36G0bCd3ivTse3uRJH/PXVzP1lLgm4LxuyY7Q426DIKKVr655
	xXRe6PiUTif9kLGrai9fsuzVSWhD9/NBUb2YmQ+7j5DsrZXaYPw4LJYFv5zWyY0v7rVzhsxynBx
	Z9vs3iBrOV4t/iYF9kew4xktG8gnCxMi/6XGdhnxhBycOQqCztE1ysBohuyJ61w5Lu0B8OKpJT3
	ZSiVGVba86kTjV+V2mLDR46WzodVJz0DuedTW/AtfPUWHgoucwkH5uQmBXI4Y1grntEyzMaJRDt
	/OYYGbqehoMrurIZ2Y9wnlBex6qoJfneYTo9gNEu5jpLv+NVzqK0c9ZQENZP9+7deL9oCzSKniq
	YCJI4YeMWq3pBRlPiBAuouJBJfxR97klrbIAcWkSMCtBHNguz9IFl8IsVXCgxCDtwU2CeBOTmLB
	GVu7iow8SiAB5LrEkh7
X-Received: by 2002:a05:600c:8706:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a18e4b0f6amr249667145e9.20.1791914272805;
        Tue, 13 Oct 2026 10:57:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm447804745e9.1.2026.10.13.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:57:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 13 Oct 2026 20:57:30 +0300
Message-ID: <20261013175735.473704-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/sound/asus,tf201-dsp.yaml        |   80 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

