Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D42D9ECA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837869; cv=none; b=BaL/w1ZCDtUZk5mrzDQT2N9BuGp7FZFwu51A+4WvHmFHADnKrhaKnL/h2gfGWnqnb5uPA9alve1edH9lZ8tFbXQ+J8fbeNV3ZPYqEaYOfDwY6KWGWuyh7mU6FVUy5KcDoBHF7E+gmFIZ9MkPvGb5wLjHqG3y4huQOHd8u76DiMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837869; c=relaxed/simple;
	bh=dHkZRLWtlQaSHjeSXr42g7Q+eXX0UFEmGROzXfKyUJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uoUd0cBPJBKkF0Gxf6B3biGeqDZOr3C9iHhbZArp9HdB7/bRzRK2rVvD5A1JYJRVBl60zro8hljLUlkXUyoi6tdY63DekBi3QoorO8wCjbXxchQHMll8WzVZlsjbobzD0y8aM1C3LWMiRk1jdWDIbbIp6wv/cma0Wr3gZwX2IVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lxr4ODfY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lxr4ODfY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso991453f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789837865; x=1790442665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOIVDTJSR3DD2SJCi7iFUDKjBfcaQ+nLmnWw0gGBUpE=;
        b=Lxr4ODfYmauH7rsz1xUu7ScH56pOVVzCi9U7DJBuxFiIMSK/Y2k0uwqDs3pqF5s4LJ
         CMvZSr/BG0HQDyy3mRDsrNgh8GLi+HDs4+LtjBwzh73jY+U95WGEe2AWrC/3vvZcZAcD
         WFqkCpK3oBVxrd1/Pk4Nzih9dIbOj2mXyR+fFX28TqlvXrJQIfkqOmLkf/BHvtLc8NZm
         FLGY5oil0NCm0s+EH3ziY2ORcTFHnOJVFzctGGxzU/E2iNRKOngDdKLj0wLoIFj+u4fb
         jeCgFyym4fzcd2Oxwy2R03M8MH7FliB7obyz+wY9Mo4nARKqHQlAuo1eNUw9hBJQLVaa
         eXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789837865; x=1790442665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOIVDTJSR3DD2SJCi7iFUDKjBfcaQ+nLmnWw0gGBUpE=;
        b=M0cISAzCe/LeAP4uqxNyLR99ew+r1vPf89jvdSTy14OQ23/lWebSUsUPgOUhD6JHfZ
         2+fMc+tbfhs3vQeXV8FtIpOO/RMhCZqAprKc8BaNzeK66kBh/FaCMiqCjFwtyG3wc8tg
         3ziX/oUGtazXpulUsZnznMX6yk7Aqw/+RbfKH9FhTW2SBCRd28fUGWhra4iDh9umIDCM
         0fXkSfh4JW/iTTysWIKsOY/r8C/vpr9sq1BNtEDhdZzX3b479ukAY5vRVnL+L07N+AXa
         bjLKJqYyNpN9YUopNiFrFdzLSFzW3+OG0EhKIvU4TX6So5KAzwYQ0lObLOGTXusCCJXN
         /heA==
X-Forwarded-Encrypted: i=1; AKwUvByxgqjSeCVaTidazEgObbQGRSO126uf3+tc51Ua1g2nzNHWayXQTKYRyVFlF4UHtUSwGtukzugflcfCLDE=@vger.kernel.org
X-Gm-Message-State: AFuF++mS2PZzLdBpRrk2x9fHSGyVvR6kP+kVVMUtHWbgoRbEKNe/cFBN
	MAZUR9x9lWwB7qOKuulxHrc/2xN1R8KySFCJbKBjEP08jh338jIpWlX9
X-Gm-Gg: AYBFou1LPAo3JSdFjfWOsMy9Enm4C0FGyvt1RFOYetA7DhOZ1EP+Dqhl7HvrwfvE9S3
	kPDGBUZikWi1Sh0rJW0Okgxcg4RQ/4rZe9AznFoSf8HRsnSnm2QL3U5EWAL+xB82VSdeCZNtkxR
	P+yBocL0FMfY3dbg8wNXM5Wbl1lbXdVfWN03HWZTgABxh2+AaZVEUr/jaXZAOlUrBV0DuQcP4os
	9UG1U97d7vp7cK0FxVBpFtDQXFx/1P78yIt2Eeq2YSRiePDUvfVZ9ek30wwIP7rs+fPQi8M+GLF
	WvEAeu7sF78fBCeAkgRXYpLQkAK90D2Xm48UOZdGKDND7SF4XEYrQhaeFLJRmGQibypV79ZMj1m
	W3ifa8SHZo5mBeWunJP93sEW2uQBs7MBQFt5hckcrF3+s3nehubFRF5SNmDI8dlG9qHiqKAagJc
	/Ost7UwXlJIP+T5Aqorf41rHLAG0819bZarDHJlxpr1GeY+sUMD9igJQL7VXESkZ8Wm0AOULmDl
	dATn5IP5PlZe3kN0pUjR8gcluYSGHI6R5m/t5OtGHESYteJxaAQsq1KG6Jmv5aUxONESYb1QV5V
	Vy7VMeRZEFK2zZQCy0dkk+LqiT+B995uR6cZpXU8l0pW6i3vvl/a6ODR9k/r/HZmSXxROwU7ut8
	4merBRhgqyTPSeQQ=
X-Received: by 2002:a05:600c:620e:b0:49f:ce78:3560 with SMTP id 5b1f17b1804b1-49fce7835e0mr32486945e9.17.1789837864986;
        Sat, 19 Sep 2026 10:11:04 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f8563sm98714425e9.6.2026.09.19.10.11.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 10:11:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Jonathan Cormier <jcormier@criticallink.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] gpio: tps65219: Fix TPS6521x GPIO handling
Date: Sat, 19 Sep 2026 19:10:57 +0200
Message-Id: <20260919171100.90430-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I found patch 1 while looking through the tree for code that mixes up
bit numbers and bit masks. Patches 2 and 3 turned up while checking the
nearby TPS65214 code.

Patch 1 fixes TPS65219 input reads. Patches 2 and 3 fix TPS65214
direction handling.

I tested the series under x86_64 QEMU 10.2.1 with a temporary KUnit
suite and a RAM-backed regmap. Both tests failed on the base commit.
The TPS65219 input-high test returned low, and the TPS65214
direction-output test left GPIO_CONFIG clear. Both tests pass with this
series. A W=1 build of drivers/gpio/gpio-tps65219.o also passes.

The KUnit suite is not included. It tests the driver logic, not real
PMIC hardware. I have not tested this on real hardware. Testing on
affected hardware is welcome.

Karl Mehltretter (3):
  gpio: tps65219: Fix GPIO input value reads
  gpio: tps65219: Use the variant-specific direction callback
  gpio: tps65219: Fix TPS65214 GPIO direction programming

 drivers/gpio/gpio-tps65219.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)


base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.53.0
