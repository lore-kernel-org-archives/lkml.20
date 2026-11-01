Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542531;
	b=H/SlPwG+7n2eSVj4xrsr30O0WIMWxwRgGrQEWGliv26OIhvniwjxcZuc/AIh9aiFDmVB
	 zF3AVpA+CS8EPHR133KFX/3T+HbY/VAYM8EcAIPMh3SPgtCAcWVpz5pkY9zZboxhmc4jq
	 IVAHHvyWOk70oWnYqBqxO4JkelJt4xkHnZPWfMJCN/vIDCMc3VWrxI63zIKsaPGoQewOF
	 Tq7c1Mxlvym6LP9GwIDY9jbvnWUbFic9E/EjsBge8JZONxvJBA94gGVo+uCTHCyAoJNlf
	 A1zc6YYvoX3zEBv1cPj0bVhXnVSwNPH3+9Ec0hJH7zXZTHUpNxrv/AhVfZ8HY+ZkXRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+HyPC3h0+CjA+c2wC2QKJxSGQ6LFt99JUqVEiYe5TM=;
	b=1z5tXnw2M6eXgv7W/7TuAXru4VU2ZdljDCiEWJwGZkt0HU78hAW0w/KabcliZryBoPsl
	 xPaJAkfudhUBSwv7eoOgLTVuf8+BK1whPPcrwV0/JrtWyf06c+RUziDLQuMCTOUoEVapG
	 Z4Vcl4HCB7USq2INCJWB7bUoK4YMdYJrUK84qy68SPZwzO3lZRb9gfXUKA6GkA3QmQ//D
	 atSwBcLZiy/lL21Rb2S41xbQBYcnAtrchwTi0waZEjj3gD09hhuNuQ/HDHf4tLK/STz6H
	 0eGpJEt/sWKS7j+X/dyEoWyn1yIlJtQdfE0UgT6v/Zedr/ImI9wTQz/pjxcLcnlmDYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/0dqfDh";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C06A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/0dqfDh
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40f29667e6so328768266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542529; x=1794147329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+HyPC3h0+CjA+c2wC2QKJxSGQ6LFt99JUqVEiYe5TM=;
        b=v/0dqfDh/LLX8QuRh45hi2LGiNbiGbswWBbiecwizZ7IU5+c+Mj8bdNQZs8JkVPT/Z
         mk5A4AAKTV5wdg8mRDxqoIEHPsbaykj+7nFV329SfGhcfdAtFWx5RBCv1NXQcnfDL3yP
         +EP5Je/iBDNzFe70NuX/EghwgVSEbDM39NNh4W96uEkY11yLRaR7LD9TGNbd+DocD8zN
         O2V/TtKTu8g+juww1i8It23ymEObXfH7rIRurTQ2Bylvr8jvYzD/1sGbRgiXlPKE5J+F
         cz9op2k6jamY3DwOWtxxWrdLKljI9M0a6r8xZs9L7tYIRafDql7+MAbA3NW4a9jBvgBs
         cKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542529; x=1794147329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+HyPC3h0+CjA+c2wC2QKJxSGQ6LFt99JUqVEiYe5TM=;
        b=pWex0jjmpiSZ/URrmsfQXMlbQXqH0C2PgK2JCJBgqODSpVexVZb+ZtXkPnd1IRpy7z
         eBFpkYMFVccQHuYb2J9k+tZf8YTJT+LS/tlXJ+hFqEStFlp8kRzNpAxP2FcbcBB/c8X1
         nsxDnWWlPu4oSoi9XRpw324Zom3SzsM1o6CQNVU0ifXEIh98BXpg0cBFWR8A3xvbuy8j
         flOLnUwUrMcVI9ortxBg7pPfZ8Rl0favg+P2GCY3r2IH38p8PPRAlXYetAHaqhkxJOkJ
         h4IjGBIDqJFJwUW05eZ0d5Lh/gIQfa2bCAK7Oq21DdlAy0tan/GVU1PEOPCqEQBfLj/z
         tJ5w==
X-Forwarded-Encrypted: i=1; AKwUvBxEXJWGKjcC9NjRtgGbO4hVamDIj/V+EGsw2xgW1m6kEMF9iomSPE28UUnNlWE2ZbcspK1ZGOWs0HxB4GM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvFsO8ArQE+Qc+Ut4pOOF/X+ygVz0xROg8H+7G5tAd71W9pb2q
	1BDifyaDaGE5yCPkQwHKcLhGm+JK3vAmf1zyKWT4MNg29m8HaXzL0iC1
X-Gm-Gg: AYBFou1hfLC+50BGcYrv+/gruAcUa9ILYf/7X6KBOohQPpfEe50DLd98cmu3LxEd0Sc
	msXWP09VZt8ZGvJI89uBEzZRl5yoWLwgjlpcnFrAP7/l6QGxDypeAuEXOB8iP8EJHabKEkrqwVs
	Sqg7Ti05x2ytkGG+WITUY0rH8HYL7HUjY6xoaNL4coQMN4eDOgtANzU1w/S/TvFX830tduTuNi7
	/GmUyrnrnde1Lkm2VkLeIS0HV+GK9s4bznPoDLwJNxmg5+X8D0PNfuzvALBDtIJ0/b2E4iVxlq6
	jLQgT6/swCh2otVVZSft6ZqG6/XKJerj4ZRl61NRfDpolsmt8Mlrgz7h5dgeGaDG1Uc/A1fbSls
	Ce+a3PhmkSLoPZwt84HtsAHMM0qUN6FSCfmOv/c1V7lTSiyiCbFM57e++yBEEIz54mn/l5Y/eKb
	XbkiUgRKdjyo3PaufRIXqcv4cu+ghypzRUQTszAtgVJhgc2t2h+oks3769FJYGo4faj/lEXJ0Ct
	YKD+M7jIFg1C+TvWTz9XxHFQMTHdZzfPoubSri1pf1/JLWtk+E+ZZZvFh3TE17ZCYOLsnC7ZEPW
	hFwYrnvlSofjpu61nJW8qzOhT2axgRNHPjgh0C7hrTN361Ha5w==
X-Received: by 2002:a17:907:961a:b0:c31:91f9:60b7 with SMTP id a640c23a62f3a-c4ca7a69731mr631054166b.34.1793542528615;
        Sun, 01 Nov 2026 06:15:28 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm281769266b.12.2026.11.01.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:15:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Sun,  1 Nov 2026 16:15:05 +0200
Message-ID: <20261101141507.119186-1-clamor95@gmail.com>
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

Svyatoslav Ryhel (2):
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |  1 +
 drivers/iio/light/ltr501.c                    | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)

-- 
2.53.0

