Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795846;
	b=tUjnwKpIIkSuyvw7dfa0PrrfAIRp6kN1n91VqduNGrcr2BvLuySYAwBV1JLLZVNrDWRA
	 H7wtcwH4DQCjhfXc8+SrIiOjcEmmmkAdRGjaRKpQ3vXvtpRtXdUQXUP+8sWhmfxfoX1C3
	 EbiR6nTXx/ubk5BxAnRi4f1eycYPe9fGSdzbMP98fj5Z/aEHJAXe+vp/zCuJn4izg12kT
	 RFuHRRiqYeg3+8eB6500X6C03Aoiv+5h5cGhozgxKl7N7X7yqEBxmF5oBh44Lra8CquM8
	 ZGdCbm9s64HWf7qEKvycW5hQHflRiXJLt7hXK/TcNSLTrBW3nAW6h3fvUqcGzpsSJvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
	b=I29TCKJmoEfujPVmEb4vJV7+ds+pRmYkDUJh5eSZf1aehsuqeHJo5gh1insR5Rxm6lNn
	 Ky0gqkv8S0VDeZMgVn9btPl3tRlQawcFiThu3GrLaQZWJ9EW1+yAiM/M8/0D7qOEDD7a9
	 PCpBQwYQ+p9uwnZR4evURFg9Xpt0BJPXy3la9OXna/zgfzH66VLZ5GwkVY0XypdriZUNO
	 14G118OCNyYH72gqWywNEOdnqX4/Afv39xZ89fOO1pJjeXx+8mr/ktNOwUz+pZzxRK49V
	 Y/HvL+iWewmik3oH9fqnnzojhWBTeM1jULuAlAmXYrASBnTO9QYbIjTwj0Z73YG4hyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fnD9u;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD4606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DD4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fnD9u
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48fd2e38825so466468f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795844; x=1794400644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
        b=KI1fnD9u5hRLJSh528+5RgPH+B6BuXEsua+yxCr1VK4w73hltwPhHIGF7s/Fa67ftO
         dYnUdAwZmfhfnymgo8uPMS2IncIOIgRjUQOrbTFd+nMD1Tbxj/sXz466qpNffWMy8vht
         oCVKswanKnTEV7asx6O6Eii5ZQxTOjCOaeXMzihaAZBHh45cQ573/JfhtZKnme437EMF
         +wHr3K3BH6yhBAqAXHBoT+yr0MDGuXqtw0CcjloG2bYl6EQtOBDl4H7MfhymZmqIgEvW
         LWr5J4Y8qR34UYq0hAcCcy+K4DOarrBQy6U7GA2idfvll90gPbc2UmhM7lPzOCC+uS3I
         Q5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795844; x=1794400644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
        b=1fVyAiskm8IxDwP9tA4ga+pYcN9nxQD6GI9zThciZxIx/6M5iiBbnI8imSl2kMJ9NG
         B/zPR/z9VSgSoAJzzeRk+aiM16lF3VYh4ATr0iJ/84J4TPutmqa0SwpWGkEfwgfk34Ew
         JRzYAiZuozj9+9xmkjslnCpMjwRgnRszsUY9oilaq0mrxgph4ksw/16KqNsEsr55ow06
         zjBt+vZ7jAa8a6Use4c1EWckpdxsYfP2b9MUwODLtrD7j/M6e9+6mZrUMFRnXecmlMfg
         BT5GTMYxhPf2My8LezwEgOToUWAqJqVlJzulVa11FY1qwdjXx4C8Ds4r2TwN6SfTcnWL
         ezFg==
X-Forwarded-Encrypted: i=1; AKwUvBwVqNx7KTi7b18ncyI1UjKWnPtR/gF6CCkK6TisstkwkigcJruEnsjMsEno7cHWSZLZysUrY8mPrgDlik8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sYiso5wVZyM8SpVc1VJ+gBj3DIE6KyViuVQ1LINz10qVHJ3tS
	MFt91sdLZj2TkFDbcs8FumMg05bit4IxNd7nTxePWgJ+NlK2qZbuVTkA
X-Gm-Gg: AYBFou2wAtHQyx9MyfVrId+pOy34OnaRcxFyHuG0XLaVn0OdAQyw7vTdpHOWC4tpDSn
	bYdgiSFKThq3ymstf0y9s5c0zm8P1hQEuUsZRyF9fulm4UsJ9ZAQ8cucmfLJ7Mnvp4e/sml9Yf0
	ENzcIqnCmonQV1IuRUMQXI3sREGFWPPdFMOxqt9e3Vr4fnpoeTuVj5u4w6Ks+X+RjjvRnHSElcH
	e3wTrlpEFHWduiFHvGRDXJDuPBANEWLPjBI88HuhdQCkxnS7HwwmDDozq76qZZd5E3vOxI2XYQ0
	rZMBK+uAs0GHQSKZlVqrnfIC74/ONm2txQCLDX3RxvY0I3JNfDBHZXPYI6KTPGUg1rMQAqmA6Hp
	fFyiHDUR98hXTR26OdaN/cPZ5y3D84cHlm4xWSL+RJjd/aDD1AD5dZDr73/7DRRYPQJEwQnedXL
	r6uDOqIQ3l/YloWZnEilGeS92w/Ep0/RR0TjthrFG+qnVTpNkoojXlJIIQhEZZuAPEe7KIkLw1d
	250wnr7o64315IPL/WYZ3Y4EFDH/D8JQDPcXEcYjIxM5GIYI1MN+LCopf84XaPdf463h5nkRwMt
	+7+eiULzMweX91uJaVsH7rqDyXqun1ZRLc2qXK84mWstGIWLVg==
X-Received: by 2002:a05:6000:2c09:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-48e6e50089emr35262303f8f.35.1793795843957;
        Wed, 04 Nov 2026 04:37:23 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:22 -0800 (PST)
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
Subject: [PATCH v6 0/4] mfd: aat2870: Convert to use OF bindings
Date: Wed,  4 Nov 2026 14:37:10 +0200
Message-ID: <20261104123714.234634-1-clamor95@gmail.com>
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

Changes in v6:
- led current set to default matching driver behavior
- max_current initialized with same default value as pre conversion
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

