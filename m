Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733533;
	b=sqgWWtQd13f/itTP2xkJIbOwjTSjAr/ZmqfMniX9NlyeA5n2VuP6aKFE+4D29JbLaoih
	 4An2w5/viLEQYcY3zUwUAJ3gQKSgkldFRrSYHzLOWFCHFAAtO9CNWF//eYsl9htepcyYc
	 4iXuLy+JOsShLvAGzhmPqqP42kjARKN3V1wuJhTEQBXzbTIUklY44uBR14kRJ7YN13TVS
	 416kH4PpI02x27X2UKuSvhIVd527AWRK4XfLiGY38W6sw+DodLth0sTupQL9uP1eugfji
	 /iY9Gry+vFQRUEfRvtwibEObhcX6hlYQeXRwmq0tbQwJP1370EYN4hxeYm/boYMQ+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
	b=3XtEsSn+Tv12o8QpWT1XpEyPQ1YthS71QJ4pIUkzlJgcJ++av8FhwoGGKLAG+on84mpu
	 QPLJqRQl8ghETgQQVnYZhtTyBQ/cVa562nMPIfUt5vSJeTii2otQazps2vQJjOCrB7O9C
	 kZ+Ym3nhbD9hBoM1aB3O/lElTkTzvNh0wz6oxc20xDCe/1fI1/eFNjtavzji+PnTm/lYk
	 IZ7gSRdHKApyakwkk69RvF4RTVzfbQIe6nrLmGICYuohbCtBVl6koNOBxNaVqZ09SS2qn
	 JtsF0KQtaNJ2FGQ5zXH0P3YcI8u5i5AQK7b1+s59JDGb6SrIWnYJ+OKIjT/F0j504EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZEzl23J;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F182D606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F182D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZEzl23J
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4395d31228so422168266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733531; x=1795338331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
        b=WZEzl23JKiuZ8TYYH80BBF0tEbF1rQKXBSe9ergk6FRLlwVUxhjaAu8Sd7fv1rI5Bu
         g1Jk/4uI2sfBGIHJ8bC345/3JtGxR0nxfSEjQBTV1eWTL21v7nZ7ELikOz9iuuKPONz3
         U8RBLhoizcLWzPrRTlXam38C7HdCSP41810emOm7SKRqwJMpWgG4Q466Wa3ASyLsX4Qk
         e8sHi+I2hF8xKBSacQBGS1HFrmERP/1eGDso2s2+Zfihb3XERt4PW6y8mlJzLj94udY7
         v56S+e2QyXgXPiPcfaj+QNqcTTVawANp7PC9RBNLTQtoZfZ4EIZhoSUnXjt64OYKfCAq
         xHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733531; x=1795338331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
        b=2WB8Gcq10BohDRO5EB1SucZIqaUcJhjlVTUv/E6ga3Obdy+ZXhU5Uk+2ER1f3YSPUe
         FE0YGH36Uq2jPS0rw8eE9jbcp35az2l9tr9zB/wl7fFY1vtxashFlYWV77PfKec5YAEA
         QkbJOdN1kD5jsO/bCZRxunFq41XvE9EiK30QAee59A9BBytmr04kz5flBVkaqlze49JD
         R4MRNGiMRHbLEWyW2ROlFu0UX5BDQ7L4m36aT94wFW7HdeC/tS7phQlXyEywuYturgAG
         sAXHgw/pASsxhdozuqp+U0RwSxXENPhn6sTJW10IH1kciuzbKprbr/uy9FLsOmSHSAbs
         3bew==
X-Gm-Message-State: APuU4Z/Ri8gu90rR1vZEaPeNxf342pUvhyUt9/h9w1sPvKYDhSjc5ve/
	jmWXoITzc1PBEZUjqyFR7Zjksqq+x/2kTE6qbqNg/gDIrdKWvRl21a5s0I+l/A==
X-Gm-Gg: AYBFou2gbXNdJFbZxKyEWzd9uwr3MTu/reQBzYInxC4kPaBrSY2IVqLO3HUSxcjH/yc
	CAVGHUZiqeoit7X0DmZWA+LeuuwXHeh7LTo0o1oXgAaA+ipfSrlZiVVv6V5lWPefHlgW1H+ExuZ
	885vKekVqcdBFigyReBPdOmCkHnj/soif+0PM8IMWhbhf9WKaJvhaoBiuW7RDCpHp7x0cPx90y7
	IJ1U1rk6kdg6vQnAMGWXzx2SjzxhOtDuaGTNs++EK0jcLIJxAcK43A4e4zo5NgZNA82/7Tsy2W/
	ChqcGLNRzyUCnwLrA23yiYsm+KTbDAo/hfSM8tIkjv84de9MuarVAU5d8EnTQdhT+gMQUqwrdwL
	pqFIS1uIYRYfK+vSQ9ibk+nyuDCmdU9mIs3UVOdj2m9qLRRpAkze1vga8dAaTdDLEYdBn41MX8q
	tRJOyWHJZw48rMFE97C4s08vFHaPVL1izq2yLRYXD9iCoFy6DgEFJCWwlEiWHHURMB4reKJmYjv
	toSAPgwB9lYorBzf0xM8oRSO96eovrotxIJyY401npYMGynZTQUjFiGjIeUmXEbIYpGzzzRFpj5
	f9QbbtOPupa/Xm0BAT9Vw1oKo1b028MgEWZ0VY1BzDjQStMkYiX0ljV2ZyR+V5KTnxK00C7+56x
	cPlYg3FdX0A==
X-Received: by 2002:a17:906:9fce:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c5096342a7dmr672105166b.25.1794733531152;
        Sun, 15 Nov 2026 01:05:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 0/3] leds: Add driver for MAX8907 LED cell
Date: Sun, 15 Nov 2026 11:05:17 +0200
Message-ID: <20261115090520.102216-1-clamor95@gmail.com>
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

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Patch 1 of the series requires this patch:
("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS

Changes in v5:
- add and document a dedicated node for LED
- split adding led cell to mfd into separate commit
- expand Kconfig description
- populate devicename and default_label of init_data
- unfold platform_driver->driver

Changes in v6:
- converted to devm_kzalloc_obj
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Document LED support
  leds: Add driver for MAX8907 LED cell
  mfd: max8907: Add LED cell

 .../bindings/regulator/maxim,max8907.yaml     |  4 +
 drivers/leds/Kconfig                          | 10 ++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-max8907.c                   | 99 +++++++++++++++++++
 drivers/mfd/max8907.c                         |  1 +
 include/linux/mfd/max8907.h                   |  2 +-
 6 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

