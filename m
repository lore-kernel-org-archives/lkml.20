Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100774;
	b=5UR5lZDh7dGzHLQa+Pm3bmICSFr+trh9x5z2PHJgrzAS2jIwSzj3sXGHu9wmUPkNWOZ0
	 HJP6IV4HXPd+oNrO3CzHAGnr5IdYJSsBcxzyDf394yUjpi+skrITmNYIh7MaHE3QfMrVu
	 wPH5+lIJ/SwJJf4Y2wFvyqg02WTm3BIGFgCKa8jY1bIFxJ3YH0RJrEcm8B3zBB0vYUbzV
	 ound1QcpuMNIOsTT4kmY5xWRKyEXUkEDmfRawe/cWSHTNuMXTv5UzH1Y0VZMS+ILvKtzX
	 Icc6tjazbvzBILLOC4KOIpu3w93oXLELyGtrz3qlnzZHx+ivBcpbW35KBIVF+E9LbVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
	b=YGM39AqtyOvmwBScaAJ2ZmHd321XsXyRGCwFeAppNEn+sfVRqqQXxfFAFbA1zK6xxsuP
	 MYJcnJzia32ILgCkzez7jxTHv7vu/XWLuRoljGgwAraptqBxlqrPDA0b7tOTmLZ1Rk3VG
	 Eh+1BuAj98y9+4Hp6H25NyVATuOzU17G/x+0WkTxBZ8/X2SbG48BTmuRSqP6krMwokgNr
	 LXRUX7jQ/aNjgKtGA2zk6qb+6BOap4D12EUKKwmtBqSIGqqMsobnWuKiG5D/3/gqSztCY
	 cEio0/MDvFbA7/zXhwCQHa2gj3iF5GJCNj3Slfm8817Ti+cqjPogacXWn+dvjk+9egQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rtjbDRds;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6BF606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC6BF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rtjbDRds
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c43fbcb4393so565187966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100772; x=1793705572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
        b=rtjbDRdsa+4/69vIpPHLS8kfTWwktRQGDqe1KoMSE8nnsKH7mio/0L6cY2FmWHuGAB
         hznm6SUWdCgpdhf69MYg4Mjh5nO/xikxw/GdJVyYySrCnsAjyUEDlhOtlp72OpuzcZqP
         kKoDPsAVIcKa0jvSEAmGNicp9Llmf0awS8YRZGx5YFWVf1DgNXXcaebpGXMJ0ymIsQWL
         uxHkEKkb8yxbEVusPQtksOoSpgaycjK+vk7iiuqINGZ+HQW1sr4ugIjRWm1WPJf5f1Rh
         7DhZ4XZr3M5DjPCPkmGsXfCg5oR4sDUqFmg3BqGltiRJrNhmX9f78LmYBVySflYJtW3C
         KeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100772; x=1793705572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
        b=gS7s1QAMVACppPgFIG3X01epCsq+vg0hwFR8Oes72mcGWQnHfEb/ybAWqy7X66aNdt
         esus2rmY5+Gc/jTZIPOP6nA8NtDoxdcuVe29es0UzoIwUx5biTxD/ivy1YG74BeOTorP
         0DUcWT8JC9wv2+qkafBR+VtxOJtAwtylKD86a9zdABGFiEGD4urdMT65r2xOiKT3ZFBw
         L0KlA+l+MetVbRvPWH2IkJrGrn5wYSl3HvIqvaIzIFZB64X2IgzffbwM0YQwmDo7hUb1
         lfzmxAxMhuGXjzqE1ddCKes/rs32SCoGwDhZLxSbJMZ2FZWLYW2CVWw9tLZF0QyHRhgS
         I/MQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7sTPxiebjjkD3EqbEXYZdrj6C8MvOT1qV5yrMJNlBcObtz3e3vAYDfFIEx0cXJe/lIGQgVSG2MZGR5pQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAWZbpMli4MUeIt0WU2ICMn4wkW3e0dDs4FM07/4VrJPj+E0BG
	xfJM/SkfoIY796olKjaOz9pGhjGLMO1SH3d62OaWS8hg4DaV2DE62BhG
X-Gm-Gg: AYBFou0gJ3J6hcrrTknlPzcB5PAEivtQfZJheqiqBxbyJJwGpFumrIs82FrVPYmV7k8
	LmpTdUSSA3wyqdPQ+TiHcuMD4XnOe6SRo9KZiZceyqIhInxGBJ81dsRgjZnIphhxbYyIE6KwDwb
	5eMnVOXL2x3rZDv+RDrFDBWWa9ZlylcGnJXSciSp/6ISxwsDngrZG25EEzJtB7s4hi0P7Q5v16/
	y2+52wTsePpL/NCXdPg4uoA2nxvR9vnzBUWTKpGGZt6isDgZp2YsUeri4nFCyE8kAiFY88HeQak
	QK8oQh2I2lbHx+pKI9+KJY/0G2lP2v+cfhAJcVt94foQCVjpb33pozmGJzg3MFUQKCQV+6EgSxe
	AOuK7MSlbRhSxkvRj3IVgUeMEJl6NkUN/08g9Bd2k/ZHMlU+dLCwTc4662Pj9AnkN67yRFZseP3
	6kNpj0EWMsgpbZkHj7gXbE0dBj/pqiHlZKTmdO1qfn9Fb+Tbqi0IRToUcVkTjcDori4kDYogulK
	o3LjJPqueqOil+q8O66mRVqTGtwLX2HbHTkAaS8cbsxhQcXuo/3ZfSKTOIuhUkMOxzm+c3+uDLY
X-Received: by 2002:a17:907:9307:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c46bde93525mr1103423366b.39.1793100771899;
        Tue, 27 Oct 2026 04:32:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/4] mfd: aat2870: Convert to use OF bindings
Date: Tue, 27 Oct 2026 13:32:26 +0200
Message-ID: <20261027113230.47538-1-clamor95@gmail.com>
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

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32

Changes in v5:
- drop max_current from aat2870_bl_driver_data entirely
- remove legacy gpio and mfd core headers
- headers in aat2870 sorted alphabetically
---

Svyatoslav Ryhel (4):
  dt-bindings: leds: Document Skyworks AAT2870
  backlight: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 133 ++++-----------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  78 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 264 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

