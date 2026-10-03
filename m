Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE50246762
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791003942; cv=none; b=fPOc3osPNTqC6LM5ZvA2j81KYID5/877y70VGO2tAmzWSZIAIUBuMMWfIhpXDJE42pEnrCEzSBh29csoiVybskQZgno5uUWEDnl+qR0iCv5viddw0Yvyip+o7vfBbgJjWkBOa/cOTf5y30IhPZhKTfYJHN43S6A02cjw91Qa1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791003942; c=relaxed/simple;
	bh=1n3hNLNA8piD8V4+ptQPNN8L/VyoZDHbBd+gVifAf3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgvIInH7txg3dECTLeAtuISPhIMh3fL6NLDSlB25A1satoCv2HGA08JL/Y4LrPmar0fGd/kI8nH1mkrXE3DOT21aqiDrf1q5Isc/PAsMUdfORxcu9NzcuMrXu8mf5P0oaQLoDY6eeUwZIR3xncbkvE6dJROPEl/4K+yiOthUKXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk1FUyKO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk1FUyKO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e2e064b932so1077835ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791003941; x=1791608741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x6LkvQ8Kd/cKQAlxyeidVUPpFg7ou+cK3PrsLKZpAcY=;
        b=Tk1FUyKO6GKXHLmUBaZNdYaoE7VmXVjEiMrnRJRWTCBboJ2oIJS78fj6tXEh0RAcSr
         kdAYctGmL1u1mPYIdLcFL+trD/JPPd1Cf59C676ykK9m9jmZpCYp/NaJh9Vf1JJEWAMi
         TMoGeMc/ediXMU2/enRViU3KPNrkhec8nY6Ni3VfftIRs6i9qiQVH+s+pCKYuZcNiMC/
         IwfzlJ2sn9SP2qwxQAvinUif8ynFJTJGxA/zjiOi/GLC6Er5cJCcWj7P95e85CpiadK6
         cWlxs3vSI6XOnVDcMBI6sgDcM7q96P1ajvkjxVgaIkaQaZtq3Y89uWkbTf3/eHexw2hc
         I+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791003941; x=1791608741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6LkvQ8Kd/cKQAlxyeidVUPpFg7ou+cK3PrsLKZpAcY=;
        b=rpZ+vnNfb7MP/v53JLXYrLjvYfqNL1PepJczBkS95qd/6+QEjqDIl1p6TA+m5lyMxw
         f3PLJVo0qU5OdDRAN9Nopgf8z1/PJ4jitJtwKsxGm0sGxCYuknPKMxDmNMy5u2uVvP0R
         lNwngjNHji2stdAoO3g5/NXwbbGf1pqaTKWqrBCu8qXAdNEb33b7YZYhmp7NJziBHOU4
         SyzSyrlG12FfFgqYxQ53OGlRBeaRM27Dq0kF8sBTQuTuTgZc5442IgFlHL9KoRluI9Q4
         Q1WoPiB5u+VSBA04VGWlqsFRKDJ2hqzI3YJ9NyRkAqfOJYyMSEQqbT2sTMH/DjOsQmB9
         lgxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxO7IXax/FzEiDaCNdDsx4cnuLOtWK7nu4q79+59anZA9jEHrVyBDyY+yP22UARNAA6dlyw9wQnEnYja7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyUQkQsmVVJlmObQ1yn4VecUO/m0qgUuVG8eM+ZhRrTXhKw3kZ
	C3Uh+R5DI/p+bFsPkMl2zQcGVHez2IaeHYWK56dxz5mT06wDd4r8gONU
X-Gm-Gg: AYBFou1dCuKAQiqLKW+UrFIiJ/pinZ4V4uMBeGekif36184UEwugeyH3YeYy4pOxRha
	3y+hfPDHZuHU5dM6IWSU8RKwV1OJP4ClT9tmdCFSBvXV9YJaU/pEFGV9DCfBic+L2DE31PmQasE
	Pe+M6PTzjypD0KF9Qy3Ved2kmMWjXYYUrXWNEpNR3yCINvKEwwXTN1E5pW/99fR0Wlpjti0uEFY
	VQst8Ub8/7eqJgMlMPaDq8djGnmR9enabYkpCc1pcD+VSN6mqSLgBOVwanv4YA2tbVdMz65eea0
	JKAm1cseoYTBbCY5AqFI3KcZY1IEo2DFxPrX7zE3PB8E74aHQY2TnepOOWb2xgg3DOZkItfiyH/
	uGlBcJ8kZMyfTuCYvOUuxLEB33EXbkT5U1ypjsNQYYH604tfOh9EBbBnCFCKAmOkARV3lUbgULP
	s1Ko2xP1G/65fUD8KAgRdVMQVIB5RX6H37rNiK2HVwFCPU9D0mg3PVTyhtOMj8AHAPin3W1aYAh
	sQk/xgsv7DJAtC03xMBwg==
X-Received: by 2002:a17:90b:1d43:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a78675860emr1077468a91.2.1791003940820;
        Fri, 02 Oct 2026 22:05:40 -0700 (PDT)
Received: from l (ec2-13-230-214-216.ap-northeast-1.compute.amazonaws.com. [13.230.214.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm1650442a91.2.2026.10.02.22.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 22:05:40 -0700 (PDT)
From: Liu Yufei <lyf98405@gmail.com>
X-Google-Original-From: Liu Yufei <lyf98405@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Yufei <lyf98405@gmail.com>
Subject: [PATCH 0/2] iio: proximity: Add Vishay VCNL36829 driver
Date: Sat,  3 Oct 2026 13:04:51 +0800
Message-ID: <20261003050453.413700-1-lyf98405@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liu Yufei <lyf98405@gmail.com>

This series adds support for the Vishay VCNL36829, an I2C proximity
sensor with an integrated VCSEL emitter.

Patch 1 adds the devicetree binding.
Patch 2 adds the IIO driver, which exposes the proximity reading and
a configurable integration time.

Tested on Orange Pi Zero 2W.

Liu Yufei (2):
  dt-bindings: iio: proximity: Add Vishay VCNL36829
  iio: proximity: Add driver for Vishay VCNL36829

 .../iio/proximity/vishay,vcnl36829.yaml       |  55 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/proximity/Kconfig                 |  11 +
 drivers/iio/proximity/Makefile                |   1 +
 drivers/iio/proximity/vcnl36829.c             | 278 ++++++++++++++++++
 5 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
 create mode 100644 drivers/iio/proximity/vcnl36829.c


base-commit: 52c36105f76e96b638152a42e735f2e7767ed946
-- 
2.53.0

