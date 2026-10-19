Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F04CB8A1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404853; cv=none; b=XrcpjZ0PXIXyAkzoStQqETiV84GJ9kM6QjKyf9WJxapnO+Oc3gX5//qIEnnlpdqN22LcONgrwl8BWzoY7BOnzuJkRK8tiTneaJlozVbUjqbwgRxPg5eu1S8Q2qqaZMGarRwXvzBJnkqdn5kK3pkfeK2gRMbJTR0OZKlXZdGN1SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404853; c=relaxed/simple;
	bh=JxVH/U0EKuR4YXqDHVYox10gj/DArPqHrhBKFVk0k9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOyrwI9T2TKrlcEhzB6SYte5HooYEFXLY9p5lefyOSCFLiH+zsaf2gyz0/PiWszevASLvhNOO3Uuo52RgYQrFeAXQG13FPJWQRGXMmFaMyPIqJUdX3vTbgRGiIj+g94yYHuMdbiYGd/JPyy+SeLVlmjnU8LG26+6mwrumCSiIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qg8a7DvK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qg8a7DvK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so1379778f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404850; x=1793009650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vP4YGQ5Le5HIuJGSzxUdWfPQia5YJdsjfkTeNwdpcT0=;
        b=qg8a7DvKscBqaq85yMueyii7IiW5EzgfR4nL48Nq8xjGVJ8If6aoNmgbTcSBCpZmk9
         5toJiUezr2iMOyx8jygc5JkedC2eUdpA2Q/iN6HoebB98Un2YAnSv793RAhBJdsqrrmy
         vAt8jpx4y+ohjOxlNYtrVzJKBL78ymeP8Bs/j/a1P2T8bycyUYZdCQ/mBfIey/JngAuZ
         nasCCXDTHwBxlLwYEqp7+fTvv+MbvhMXvteSKqqJM4xbPif7Uj1Y78s0/tOgPf2kZ5j4
         pvUCaU9ciFS6fcB1K/5CDK0z2DWd+AnVlWrXVwk/m6aGORcq7gG+3pI8s0fpBHDZADW7
         jj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404850; x=1793009650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP4YGQ5Le5HIuJGSzxUdWfPQia5YJdsjfkTeNwdpcT0=;
        b=GPpkmHGEjjqHvl/rb5iGVKWI4VjZeMzqSDtGMpXIfGg76c8FwfA464vFe2Ap/LmEri
         m0amm8h2oPf7R0mx+x4fH9t2uhVxnXK/KdotxDXlxD/dfK61fG2QlOoOkx7TipamE9Zy
         1IY1WQIixznf/bklTI+OmG++en40iFAb8rTsK0yxfQ7i7XWS7WrJyBi7UZKr2irACj3F
         HAwp40DcbE1WRgiPmE4OmNZ6iS3sM0q9YCOehqh4gS8RI+aoNWLPkdPa5GVheNXlHSeS
         D9XIKxLY7dWrnxYNTRKQcB6KkptZVoOl88rJB7mRdsCKbnrOxzMTdbhwonJaZrHIkohY
         XO6A==
X-Forwarded-Encrypted: i=1; AKwUvBxauoofiImWERB9o4TbFf/EEnHsQl+VVFcdHAkRWLjZ69upTx/13n1e87E5m+XWnK4zlEjwww/HyS25zNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeayMaOjnNSCgDc+oe7614FRD8LwUyO0+VKrf2JH5JokbjFVVs
	YQnYsYosjlyXyDqblGFOIVWVWDH/6j3mCLyPKUbLzMZuynCSK5c5BKqN
X-Gm-Gg: AYBFou2cHpQxW+LnI9jPdiWzD8LPBaEdkj76bNzdy8Kdv57ute63sQam1E/atGTNRCE
	GqWN6mb5O1IumA5wsMet+fbtzkJDIk3g9WsNHtuld5wsBE18AVLz5i1OgsDJWvwPB+xu6JRKhvR
	a0VqnWTXLN8ZQLHs4NJoBQTrL3Gr6gsZxTNNtu6Qxzs0taOGdWJaLeMMSVZURAvkX+2ZYKeD0p3
	ek2Adv4rRjY8gfuQ84d773ZwEaakD1GlQD6NYBOSaSslSzATaGZs4HolsXaIpYLPz/ThJ326CkX
	pUc3U9diSWmbQQXxdQ2FiGeTGyn6IosBuxkTNlRfqMrICpu8rRDfm2Q76eL3f2mhR2UC/NpL+A6
	ZUBofBJYRTO4IwVGceB9TPErrtUeoE2FKYGnfPHUfwqfrC2eUuPM8r0Jp4Tirzb2WFwoszCCZXH
	GelRbOXg0Z5/jP5UBV1tAXFMI2gdO9saYklPleM/ZxyKFFxrRb2HSIAPu68R6cRLwqOmhxdJm6/
	ubgK9dl3KbeVGo/Kmg=
X-Received: by 2002:a05:6000:4021:b0:48e:cd3:b3ec with SMTP id ffacd0b85a97d-48e0cd3b575mr11780776f8f.28.1792404849518;
        Mon, 19 Oct 2026 03:14:09 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm21822041f8f.30.2026.10.19.03.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:14:07 -0700 (PDT)
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
Subject: [PATCH v2 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Mon, 19 Oct 2026 13:13:54 +0300
Message-ID: <20261019101357.117462-1-clamor95@gmail.com>
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

---
Changes in v2:
- remove ports from schema
- schema moved to dsp
- add return value check in fm34ne_dsp_set_config()
- dropped unused headers
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/dsp/asus,tf201-dsp.yaml          |   77 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  390 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1511 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

