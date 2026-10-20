Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506704;
	b=z6aXDznB0g61PA0/UbHGqLS4TOC5HDDrtKuD8+ObLMSs5X4Svt8R7zsVAUmIVtxv0T5T
	 cpAnvDx9lB8is5d4RBab9VSpDVUnBY9uE2eMMtXO78frGFzfyMgTzl50jzg6yiOuKo+zW
	 01DidLmwZJb7MsRdTB6jpLXE+SsjqRESguCCWnVAgLMsaANSNv+MqzmN3OZxyy29EaBA8
	 XTqNSf0BaZl+1fZrhc6LXm2v/tU48FP6FqRbZTEqrmImDutKh35sTpHL9vOtv/jCrgEDj
	 ZiurbDx8jRQ4V6ryKHr8LRNKw0ipF/2eb1UhTDqDCKaAntr3BAyHsB3Q2HiFLWyhx0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
	b=mmSx8YbwrcJWs+ts8xLBm1ZFarupEUyVitpFzWbgG1z6EfB4vJuuYmx+iGPd6oTRwejN
	 E8zs+aZWBShkn/KW+XpPywV0Ml04BXETfon5+8QkNZnflb5njEKKbTXHKDXLGhCIarwI5
	 Tb/WwkTKEDc64Ix55OHTJL3v5ME8uy6VpOizxZPZM2ZUcMF0nDJZKfhg4Fx4a211Bect2
	 Orp/QrCIEr5Qeoifgz1KQddb227GpqOEXwwI2BQYUolgu2cwP7Vq7YdmRey4eMLe0slRm
	 c4be/0SSrvxzaAI0H3tTuaUEnNqZMmgge+5plmNHfkRwXFga7dNK2bvdMtB+u9ifAOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="oM4d/Kri";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E5E606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E5E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oM4d/Kri
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so1065662b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506703; x=1793111503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
        b=oM4d/KriHS1CJeZrfVsVM/Ncn0aQPYiCz2FhG+VV75PK5Y75SD43lvlsP1cSSU5nVc
         FOmJfIjRRnat8deDz/Qkl5JdnDDizXXVqRzBbG2m5nO6ck5HOtuISAckWiVgpMDjmyuH
         Fkn+Zg8kmhU44YsoFNDczzMhr2Ipz4GZz1v3fUxQ5Vfk3JRNnkw7daNmI8wlYAd0/uFi
         mYf+Ijnnq7LRIuUpMaKV6ZrCj2sMR19xn0Sn/BEFMoMYr9R7PWfpqqdrDtiKfcldO9B5
         0g3yjuZIoKjKxLHYSO3WrqyswQov8l6R7xooPimWzKc6KRroVj7ydb7fC50UbI8ki7EG
         mkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506703; x=1793111503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
        b=wZYov98KOJdLBg3ZHT2siXqns6eNU7L9m6ZIxu1fMlRErbzVY9l7rmhTghZFNtxCFS
         8J+UVICU52RMLDPOwkNCl3s7FIylg88tyPExiqW4IjGHN3Fz/3ccFrycXkj7d3M7X1E0
         Me1Xytz5koVV7DXMz3UfXJVlBiYmLsrKelMZ3U/msfQTG8WPSwtqO24Kvyyj1nKegXpA
         ThDKUzIPeYPj9DBznYLtk18AwnFLwL5gmhNtbctl8HRZJVvO7c9s5yUGPLelDivZ8Zzw
         p4rNl0GDGy4meOyuaPpbyHa+pZ6T62cNgSfpQ+oNqpFGb0DrU5XKmrIucZ6VhcJc7tww
         Hjyw==
X-Forwarded-Encrypted: i=1; AKwUvBza8qPFo4Fdwj2xOgW6EgCgMXLaUm8EKRWcIvpB2x5O9IkEOx3WMQ5MdFpmVobMebr6i8I2co43ymdXiI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpcnrbAH9K4p0ZP0+r7AkDeYNcO9FbZVR8j1eiwBTvqQqQ0l1z
	wj0Pi1tYxNu7Y8ULWUB+216DYWN0BypLlQCA8asFsgBcEITSt6U/jXQO
X-Gm-Gg: AYBFou2WhxEZyYeGo75i+fU9VCIPvqgrZggqkkLaHtsuQPMJQSzDsWdUeq4wpfhYc35
	q4P0rqXT3OtdzK33D+Y/EGAiR6wU8JSFDKVliS3VMzs5/paOxW4H5WbwBXG0bagZtb+gOBYOCAG
	5XUst181fOxJKnCPE7AhieV4saidKbcDk1sBYHEgbDnCrEb9Hy5yAyssh3N1Vel5WMvSa7cMwUx
	rjeJ9cHgyzyizjNQj/jfM3WLx2qVQZmNIcAWHXBw30lpeGisRHXmfNWB4SpMVM9MyhN825FO1QN
	WPb6IyMEFFdKcvn0nFceTZpHN0C5mz5KlI9oLBjG+aSSitnt4Ivike0wYvj6bcCsvpI4cxrt8zz
	Ujpur+rXSJja1MhVZFpwisdgt1GpqJ88OZgFHywG/f1evv4E8J/82dozOWomi5JuF7OAdgoSgRY
	l/knYNl7vb0UBKIbX9LlG8EPXxR61BPkJfNjr4AtRqUwlP1H9CyTiNWs4Luw5NrzS9orjVRpyz8
	ItQZ6Wecd6WEvtdyu54WJWnuprUOQAvvQ==
X-Received: by 2002:a05:6a00:4b49:b0:869:84b4:4b36 with SMTP id d2e1a72fcca58-8a04be69ef6mr8251834b3a.16.1792506703265;
        Tue, 20 Oct 2026 07:31:43 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Tue, 20 Oct 2026 22:31:30 +0800
Message-ID: <20261020143135.623897-1-jerrysteve1101@gmail.com>
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

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 372 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 133 +++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

--
2.56.0

