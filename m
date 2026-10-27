Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101182;
	b=rOxxxRgT/taADI0c9Vfmi427nacqpDSx0iGiT3gnp+bSS0qcwt3IZe/1zoFwdDK0JCM1
	 CDlF1sK8zOUuYlqbknL5fIHsY+0s57fnAF66/QFF1mNX2g77ZNim+jqk74+PCUBtXLrw2
	 70LgAiYVRUu3G88Gqjw5XrmBPmu/LO3ZVx/uvGVb+7cdR1Y4+Hj9LOe/lRhwyYOb37vqC
	 FOSzM0ax7eDM3GisddKGexlVwA0uiRIdZlauAM1djUHu1dkh3GcASqkjzcK/QfagrEIMX
	 JCvCGnscEp9uK6bQ5hRFVcCiqu2mLzu4BksBntblJAEKW6ZCG+U251OMD/ROxS2GI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
	b=EFkQFw5MBRGmUbGYjBwTkdcnRDsNnFVREdO2QRExiOIl3g7UgPw3tLm/BjMla5sP3AWp
	 4fpR9WHoibUwuL324kAG8HUStbSeszqdEnVAhUDSt+MR2zrC0JvHyNleFNzH2H+9CeyMG
	 jKUK2UNXxC2j+Dy+HX0kqS7SC9P/xIVKkMR1QHbSeht1CoFmlkoVysG7QaMY+aTDW0bx6
	 XM41qZbo3jpmkL2DOamzjLTeHFzJF37rWHaWCLRRyQfVTV1UeIEclXOqEuHGQv5eULNaN
	 lJbqRYIlP9nFAiuygrNEoDGNpMBdpJkQmgHpkOPPRQBXpyrlKtnuaIWRUZlFMTnk9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeXDCfsO;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B9606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18B9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeXDCfsO
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40f29667e6so645435466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101180; x=1793705980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
        b=KeXDCfsOQB9V3BjhrzMps0ArP1yx5y2Gwbra/ohxrTzGZVBk9+IOZtOhxJN0QsF+pl
         tv4C5hi3H8oWQR3Qk8mIYsPb8LG9rIAqkAHSEQrAvXOjajJMb56/eAESaZtn50H5Ijso
         9i27AoP5HthaMttzeUSWS114zz94yqQfOxho2CIFCJOwtfIsn6VIa3R9knGr9/F9QqNB
         X7jfOKXTfWZA2ls8667pfS/7hOIpz1U0BV1e2f+qiArju5M2D7kvWtT8dpt+Fn7l7LU2
         CNxG/x1AxLx8ymg86ZYHC3dyC4o4FuknMlYJNw4/h73JwdWXZJGnKcxyx/cYNihtpKC8
         tAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101180; x=1793705980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
        b=Ts66jW7WZJRaQxtMCpxShZGju/5Hp/b2cNyoPRqmbFDS7t62HOM/QA3UawuZmi0AUJ
         IdhJXk0hb4UlmKsmTR4utORKmPkxoAgx8gn5vByMVFzdYc3MLghQnT1+OWLiC7mAotjp
         5gm9kqUufiWlKcMternAr9/GrgYEMUlwVFD3AuvQMIU5G4FQkzCukbiGmcw7f3XLd+L1
         ipEPSv7ALGF+hfh+XGrhGVD68XjKLT9vL/FF+33EBCz/psuneDhrtZNgxbr2/xMLxB03
         OeRcF0tWO2mGeJR86HJo79Y1/oKWD68pTi6z3PCByJ/Fv1Qum4dPFOSBgbujFjJxxRMk
         a6Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzcjqJbz/NqA2PtrUPiaIeMt46OR1pqcchUluZjy0CJVWg2VKAQT+f1lGo5ZYyhi8FgBZ1Ewa9y/zPKPH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY8dZ5WqiIs9KeRdefXzjOcioZe1Ms9/+ao0JPmuS4XVIPZQw5
	y+39fbwYvHBn9XjuzT3WUsH3oYVbalx2dYnMcedquSGLfKZBO7mC2lxsMLXv9g==
X-Gm-Gg: AYBFou3tuAC5GEb93ii99cRGebBcOEauQeRlkHk8CrVQb0WZe78BvAQMXoa6084HVej
	r9sj9DNBX7L2lVVFQGkKEMTW0PmTwdNabJc+M5SKqtk5+rVwK57fEGbtdUoGHaCFUU+7Gwyj/cv
	U+hi5XnsQk3lTN8MqywJ6K/lpDbBoIvsiV2HT8gIc1VEhqsemacSYw+Xaauxx7sEoui0yNlNgWf
	8RqAeBpeEw+1AYp84Wblm2gMup170pv+drZMP8MbE5ug1jaUepNvJ3ooPzqeL4jPVuDA+XARTIo
	KP75to/S1tzzUZ94aEomV+ERKifbsKxjRoOOxsqc7LusexYuKAiA0fOQTdS/hsPzuLHE0VscvoM
	vEykSVtlFoRQg4rs57MrJo+0GFwTK3KQLiw5a+RVhXrFZAiNie0bI3fRkHLg5luz4GES8QU9YYT
	P0e7ZOG42F/curjVYUpAOoWRhXIU6GazYOOHv2I8ycs/bovYL+5s6NLMuKXevZooCY8GxdVzrxP
	dkgb/4jAgLR5uKovG3irSTsPb5eRyTLVeHMHvyHpSKcylvXOZ9to9TOsn3GXpDU4TpR8WTYDzC2
	uhDscFwfXucej2LTL7fNyxA=
X-Received: by 2002:a17:907:720f:b0:c31:91f9:60b7 with SMTP id a640c23a62f3a-c46bdde4566mr1027757166b.34.1793101180078;
        Tue, 27 Oct 2026 04:39:40 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm430272466b.81.2026.10.27.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:39:39 -0700 (PDT)
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
Subject: [PATCH v3 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 27 Oct 2026 13:39:26 +0200
Message-ID: <20261027113929.65102-1-clamor95@gmail.com>
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

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

---
Changes in v2:
- remove ports from schema
- schema moved to dsp
- add return value check in fm34ne_dsp_set_config()
- dropped unused headers

Changes in v3:
- fix port reference
- request reset gpio asserted
- incorporate fm34ne_dsp_reset() into fm34ne_dsp_enable_hw()
- add reset asserting to fm34ne_dsp_disable_hw()
- moved bypass gpio deassertion before return in fm34ne_dsp_set_config()
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/dsp/asus,tf201-dsp.yaml          |   74 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  386 ++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

