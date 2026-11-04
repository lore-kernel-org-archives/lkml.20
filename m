Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795586;
	b=au2SGFL1qsNA36vH5UOlEgqlZNol94mpfcKbhxnREzvzccLQR2gKqbdxHUsL/OGE9qbH
	 59YqF0bXUyq4Gh2vChGvzSYHGFgSIlgbLouqWg9R5i/4csMqA6uuAzES9uHir96Jy8SjO
	 Vgh3E5BtWyv1ncqcq0a41iDiBXTH+5dfGLzFJVuXqxAPK2NHlFiuGXIdmukILN7CjNiJz
	 lm8iNl+CRgUkRIPPJ+aPluLcoRAEUEn7pgu3h1LsdvCMlVzGHPkLW5Mr7ZkMcJApGUOtc
	 WHKguokg3gQxHa8Xkc8YaDoQFgQB+sSwHgjEjB+Z02hx413ETTjVbfTH7fX3EqdBBfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
	b=l4OQM+nEH6KUUCgrtxTpa6j8l8uCB5QkrKWANFXgr+dsg7MrPYqzEZoyqNtzX0U5eYqW
	 aQlc550LJyF+G5lkTis8Z3ucHpueC4dJMBZ0RjK471okExgmYdT40+pPDd8YSmyr42tvy
	 TFyQFdtAe5swxagxKk1miXkHtx3lNftj5EvhyWqTonM+KK2/qhyHt2JRnVK3idRLzVP5m
	 AasNH23gK9J1KI/biXvCewTvNiWkCcusuMxO/TZWZ+KnKm825QLlO6pBegoDDxRbJDwb3
	 GEpe/+Hcfguo5FRM7rR+xWrfa/k++eGos/uJlIJfoJMLmWXDjm5bPGcA6SDLoByxr6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ord7SymA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3A2606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ord7SymA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so5809035e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795584; x=1794400384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
        b=ord7SymANmYwvG85xkqojZpBx4zQekmKlhxmqa037yOFtNP1AH+jeKnSngoH5fyUih
         bBBXNgTkRre2Dbqc1tWkowbQjkABtv0PcQM5gcZfYNA7uRgE0+E9N/ZCU5vUmtRfYw6D
         stgfjZNFHJK/rzoEsdTc4DsS9KtT/ztygYlPyiDoDsNJSFLxI6XTgoshejuydrHCjpEz
         YU666/gp3RRySEBLtJc3lPHVKJM3DmUQ4tOBnGMEUNn+jlGsXHidsBQgZz403M0JnQUh
         uDEEawih0jU1Xl4Lm1nsmyNhKjsi3uW3iPXJLVU5j3UlLxkfHoQN2YPVgoJPm9nK/wvT
         NdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795584; x=1794400384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
        b=kNYNOLsQKwRmhiuj+n7nxsQOiI8Q8R3IbiuqFD6ysq4qF4E3zZC1poQvSZrZYnqIS0
         fOaVYKM8A5AceXwqQdV/DirHyUZMVRG4IH7Yx89jxQV4ldCsPIak0vhdCd5njyQr8/wa
         J8ZkDnxt3yHE1iRuaeE3K/xxkqURZDdXUF+rkPaqo0iWy4IUivSmo7tRKROEnkrCJKlV
         Qso7PswA7DHLv23vxhOAvb6eykqbjntrJibL2nHxVTlqalOJRO3cI+zigygjJybo3Sn3
         NEDbg4itBdDI3wEbKdkyCwFpxxrNfLBcaKVTlLscc+8QXSLwDNntk4iLHyw9ESvFm41E
         I4HA==
X-Forwarded-Encrypted: i=1; AKwUvByD0Wz1GJrWUxX9EK6K5gvh9dtrHFZkymDateLY+lunmY71IuDsmVlpI8fNJcqRhZzlRTVDM4kh7QabWr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Je5gOfpM3bX1XPV+uWIzsr+AOLcfirLpkZTuJAHnU12q/KcxZ
	nfwYHtFuVrnLD3diK0m02Nygxl7E/vGmuaDo8h1/qi+HO/bSOSyEdNn/
X-Gm-Gg: AYBFou32DIXzEvFkc3SMbJ11QjO0Nr6Cy57uxm30vUNzpL31cH2pSu1K440TqxWa5dY
	/9+jnjX+zdwgU7DNnysPY95tGQiWOyTF5WuICSoB1UgfEkweoLNlDda9nrLQ1xrJvRp9c3DJN2l
	ZOs9oDQaWiQujYlp5jjqDSWcP/Wu3fJUt6f+fsvofvuoUGqJks5psvWW/86NDRiehsuFgd/kZyO
	i55H0AxSfmBCBJuZWOsYXxTxVErISVMBRMhKN5DjpNjpRBvmaoHIeU2DIaIipDHUugGWV1sstd3
	TWpAfCp+6AA5N72bPWTRhyssYTBey0VkzNnplyro4TqieTk2+IfXKsPRrj6ZQJSkXwme7HRq75u
	X6P2qCnX6uH/C6eP2P9XZ4jELtyDRYOjEK/BoNuAF/iUWUMOs7jfHjcSAqjiNScPGDD7vEiWV31
	31ax//w4FxCLdL1xFK/XkcnbqKKVGRKJb7MdEbSL3oUILJG1ocfeUNxFMwrmvMxxek9tF9s4nCP
	2CbvLg/HvE2nNCcXtqeCwbgzMMkqgfQCrgfMgxpzOuKKn7bkeYOibvPWGRI+L++HoBkIbkNVEM4
	TiJ9fPLj4JRz7W+/LY3nCSPft2HKSjZ0JM7YqRSnm4nhcHocyQ==
X-Received: by 2002:a05:600c:3d8d:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4ac18a89393mr344169195e9.23.1793795584006;
        Wed, 04 Nov 2026 04:33:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm3509380f8f.17.2026.11.04.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:33:02 -0800 (PST)
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
Subject: [PATCH v4 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Wed,  4 Nov 2026 14:32:45 +0200
Message-ID: <20261104123249.227920-1-clamor95@gmail.com>
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

Changes in v4:
- dropped guarded mutex lock in favour of traditional lock since function
  has to use goto regardless.
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/dsp/asus,tf201-dsp.yaml          |   74 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1506 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

