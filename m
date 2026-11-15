Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733892;
	b=K5m4mtijPeKQtzn6Hse91DBv7hR/hd6lSHrpizlCQ4/4fY6PhlOYT/l3hE2FzK0sPCmY
	 6lZbYuScUKuRW/Gmpql93SrNcMlouc+9CXaTcnuMc/8bb2Wabl+fgXrQJ6swH31UzUbr8
	 baG+EcoAbl/ksLFp9Q6lOO2J9LwsfgpIXY4nRJGKXAJOnF4OUiQzgxPOhn1hBLeGztVfw
	 aJ8mc0TYTEzQHcIfZFBFGUmQwZOLk7zPJOqINIGg+tCpSj5ubFlpOBQY79aeJJrtBlYax
	 rh5+MOcZUPHZtWvBrfFWscP8QmNxPx13ywFfFbFLZP7/XwjlChhetbHuFmw0huREcIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
	b=uSbGj3wc/QU4cuJHZ7EYGEFTowrOapvGS0+Amkwjwj8sYtwSEPpjbG5NAq4RWEpPI7Yz
	 CtjMQZ+2Iy9l4+UJRRJVIY4PL6F+VrkMi6Mend/9Tihr/7/nMPw1Dw8Cg76mOBHfswIDS
	 opfM7DLiGb97AxKVYvs7FSJeYp3/qnzXDH7CKYH/3GvohZXTah7WNfilWAZLvXzIYPOfT
	 D0Mslc/aAiRDgPvl5DEFWJeqY+xYKJh7Sf5PM8su99F96Q3qSDG3j+fsp8xP3TA3Aw9Sq
	 N5SkyQCsV5b9Wsc6gBWSwe3Z5AwiWaVp02YctKFpLi40kvhXeG6C3ZIpv3VT/335l9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ndht/p0t";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FC1606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FC1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndht/p0t
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so189576966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733891; x=1795338691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
        b=ndht/p0t8qzPcRCOk7ccV7NMJ0aBn5qjhK+k0s7XUYFCqoS9bzZHxRR1qN/xgeDfsL
         E6/Sf6PNlDF1X1BQXrcYiBXlZ+4GLcOEp1c12bIHqSLtfR2YXxMyHbZJ98z6ERj93u+R
         FR4Qe4j5xhltHAUb6ZRtMHSBttLlZkSHCWbmlNCMcmrH5Fn84HZa6zNDd3e6bGAjN69C
         nWXawJB7gkePvTobYFw9qCja34OCVO+rqyvTPMvo7D9zQBce7nXm5vfZ/v3p8+vIa4kd
         nakgFWlEPbxaIg0T0RyqqsN2vSJ8lsrr71fizH+flVDIz1xLClUJLBo0CY4aEXJZn6Hh
         pHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733891; x=1795338691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
        b=Q3XXu8HIW8wIM3V6dmLesxJBncI/6nSLShnYRsAC+GPqekFa6z2F90zBNwnbVexsv9
         T1Jx7aZzyXbAfzGOswcFMmYQbcwlc7ZK/N/oSFNUI643i7soMbI7Sf2vJ3gSUVZMKnR0
         FWeWQMjU90yJrPnN3jcxVzF/ABLKoH62r4mSdlQZOhW+97p4SPeX+bf6qz6PaZf5n3Rl
         43hn+NqGPUvpXd5o19R4Kosjpni7z8PyHguQ5m5FzJYHDRg6GJy15e5mlSh1Dv+Ieh5H
         Vt+Q9K2txVBwlJr7li98kbHRk/FIXh8yiauEPzPNDfA+f/pstb8FgjDNbnWQ/6j6yn+p
         BrpA==
X-Gm-Message-State: APuU4Z9ZOS6t6o2HJMf0zVnP0zjL3r8jw7WlSc9Xr37TDBZetuZrEkXu
	vpSeZiOzLxdhF7GCVQiGN2zT1obthv2GJ3KrjtCRawpDME4MHX8aq9wM
X-Gm-Gg: AYBFou2YMw8BiL21/UuOXITc01jA8uNeNPUAnGyiYfmuxj4waiLQmTbuhDBxa2KbFQu
	e2YNl+3TwtP6NjanKSweVMYR44Jy5SjTDQWVamqW1t51SAJcDhbCroB3XFkLoFAdEPyyk1SgOb5
	Sgvx83Pbomatnp6U9HsY1lAXgJg3/vuKqW+zg9vgvUKoZzdI/zVwh+dHqoQUwgKQ65wetqXNgHi
	45vpzA4ZhPSXgCoTpbUNiMDBHJhu2Vb5aZW9VnG6X7ghc+dN6Xq6YLZqdXf06jmzK2Y5y8D2+io
	IyZQjS8TDt8fha7C42LGt9rlgpeJS4eo9Y2zPhBMZzEVeJ6kGdlfQm2d8t/b6Zgk00bsKE38e67
	NK/cYU8GKT6HrLp7RiAOaVFM+FwfYx4CMtyN0y0wLX5H3rvDHufyYc4vZ4nCB8NbY9k51gmr7D/
	KsbtMrNfcou0ZtyvkLDBZoah8HwyznGCwYBpO7RSY5mjMSqY810ddsnaFJUlx9B/VeIfcyOpYWO
	aNgAuBrT1nY4AhUZuDq5HMMZuGRy/mZ1n+pX47wvEELmR+Q/4SAlfBauL+NXHKVIKJc8uA8hr7d
	TxHdA6Gwt0+vnWYVKpdaSpT3GSRiAb5/+5CNMn/mJ9kC4PeR1NcjxwjU1W+QLlUhllvENsqzHry
	rd+HIjPrnMw==
X-Received: by 2002:a17:907:7b96:b0:c50:62ca:6f7 with SMTP id a640c23a62f3a-c50963b3398mr628172366b.25.1794733890485;
        Sun, 15 Nov 2026 01:11:30 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun, 15 Nov 2026 11:11:16 +0200
Message-ID: <20261115091120.108684-1-clamor95@gmail.com>
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

The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
with information about different parts of the power system, including the
battery, charger/plug, jack and thermal readings.

This patchset has 2 dependencies:

- patch 1 of the series requires this patch
  ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
  https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

- patch 4 of the series requires this patch
  ("leds: Add driver for MAX8907 LED cell")
  https://lore.kernel.org/lkml/20261027115006.86032-1-clamor95@gmail.com/
  Or to be sspecific, part that adds max8907-leds to max8907_cells

---
Changes in v2:
- remove unused register fields
- add prefixes to used register bits and macros
- default reference values indexed off the enum
- swap data array to __be16
- set bulk read size with sizeof
- return directly last regmap_update_bits in the max8907_adc_init()
- added comment for iio_device_set_parent()
- MAX8907_MASK_RST_CFG_INT_REF_EN > MAX8907_MASK_INT_REF_EN
- dropped kernel.h
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 ++
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 169 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 ++++++++
 include/linux/mfd/max8907.h                   |  53 ++++++
 6 files changed, 311 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

