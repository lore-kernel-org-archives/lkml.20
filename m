Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131806;
	b=uc6IJA0SeauBpFlhlnUUxkvagJ63/Ghg/PNWGa6t6M1oV7lE6kNDfTb06eBK9qF8Z21J
	 +yCn+MAMs7O/crDkh+tKgO4PfIE2JZCubiuWWUaDE1qaLZ2lh5fNiS/nw4ScaNKzp8RdX
	 y9CAXa7Xjpix3GFDa3277ja629Vqz8MWrN1vMQeVvKOvC4bdEO3zN4qAE9ONGEGBNdB6Y
	 iM9CYDSHSEkPM5ojSYgH8mcTpoFRqvQLTtsHTT5UnXqcKjID45zX+xbG9SStpQSSZINB1
	 5ng4VL/kq/kumGiH1SkIGfPtJrbtklxMcCNmyMkqFy9w8p/QcZjgDMPWsV1jtuvvjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
	b=XdiRhN4V3sWoDh+4jHLpuCjY5J7BuJ9uoiKmvxYzf7dqCjP8L2cnpOMFOPVdXGGcFpAr
	 plhzd90CHCpmdLbB1smKV6zSxHAgts4TzAX5YQ3x7FkEOdlPIGk7c0QmxBHje7DdrFa3f
	 yXqmX6D2Jgr+FmeN2prwEFArZqjLqEydb1yfelF+lO4nuul6VL/0S0l/4wqRSh/QyJMlG
	 +UtIs66U2BFOXQmKMELgzXiY1U3B77y9WCTh5jg0xZp0zEadKN2lCU7ehNMQ5nfAuFWA5
	 bGRNyDp4f02jViTqjMKPvZMOn3QTY4Ue1YDKrQbZddHv5zCyGGhrhbFCEqm2v/mYxeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUjqusQa;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE7606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53AE7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUjqusQa
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4322d310e7so2683566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131805; x=1794736605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
        b=lUjqusQaj8Wf2o/nv1+PV+497UA5OYJz0uJeVO9W8iBalJ5xK9HWhRAoNlI0QQtB/k
         QK9prBkdbacVPTr6Pfgz1JI+U6arVkz/DAN8ba4s2/SXkd0vDiL48v3TDsN0gOycR7r2
         JO+uXyWzoHeoa4xuEetHbpHmLOy2KsrRldJWXilK0SNfuTktCahmNG0FjiCPm9IfsQOo
         YrB0wiFGYaiaGWW4V3ypnNmR5A9ZF2k/24ghOGMWplFv9V7+wtS+MSpfKxajNWLACVq8
         2JF8TK0vVGpIiWZ1jnPoeKUfFQi9nNguJgY2Gd27VYBRH4S8rCkpEuNUYfNWn1TxxsEL
         tAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131805; x=1794736605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
        b=AMtkyK41Py5DsXhXWyhVlXzAuMzlxlcYOI2qRPLgssdncRMquf2m0vm7e1L1io7N06
         2CgTrkRDIdnNIBlpqXI35K6+G9BC2MZOtbQYE5k1isSsVO70/i3jY37CYNgrFzyfbcz3
         41qHFRXaOQqrteft9xcVVqqlucLg1vWTQHVhcLnEE8TRPp48KuFSpk/QBwwujLoC7eAN
         x6kji6h2Ga70rLcwZomiSypOQzuNjmrH0brUlx92L8foCk1DxcD2ppq9Y6sh4NKQ7Zoy
         KxFZFu4jVN3fFIYTqW4VLLRjRG+ILrbD6eCB4CVtXaFxzA9lj/YWZq/Epa++zFVq5Ach
         l2pw==
X-Gm-Message-State: APuU4Z9vbytaAD8pTyUJ0SFDyWkNYiuppl/Ksy7+94ztRqxnJ7rJiH7v
	/LEzewNjErOIgO9IAMUXgbgjzuViTVFlGIemYrNA+cuTkTO9un1GQnST
X-Gm-Gg: AYBFou1A+0SglyPTTsbkmsz1lQL77txdqle0MCXn0vGIxsYkQW1eD+NuEAAIcCtNmjf
	eIbVl5sT+184w5XQS7WQiUDi+qP/VCqL5xSSWwIodhVpjo+LZ+pIJhzju2Hok4okBvDW8r6WYT8
	mYZNPUjHFZFjYjB4qvvMOzhxymgv+pzYsuxFjjReDZAz4bgZeBDOGALSsfdGLlltatsCI/IYqpz
	ehTUD/64wKFtXZojkHOssfo9fBdoyAYGbv1PQDIW3366cqZ9JvF88hmD2EdihXJiAQxgJCJlIDL
	iz33x3oKFq5g1SZTipzByP55kger7Z4k+wtN10I8kfrb22TfFe36JUAavDvqbhV3pKL4Tb0+7D7
	IN1cQU4VE8Ew1b7NKmPiNm0vu1OwHY4t5fnUf654J7t6cLd6a80Ojv+QZNHagn9w8jst1ESAnmu
	ZA/zgMUT2wPcEzhT3i7GtHX/uswqBUKeAtZV5u4c4UBcdjw1TXlXS7NypYsQ7+KJ/3SUa8WdEQ8
	tx0MpkvmhRRdesxBjO+9U0DVKf6d1gNv+0kg+s3VA3qFxTCle8NrNmXz+4aJA2ZNaMeRlxQPOy0
	EkR1uSDZqxDz9BXNg0pI2sATGzPFqSq3ypL705LKBU/dbEV49hZmX7TqdyHrOwlZ76A5q4vBEJ5
	dNc5c6Knc7Vu1L3uM7hAwXdAlas98fQs=
X-Received: by 2002:a17:907:94c5:b0:c4c:eb16:b567 with SMTP id a640c23a62f3a-c4d6d4e45b8mr82837666b.19.1794131804580;
        Sun, 08 Nov 2026 01:56:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:43 -0800 (PST)
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
Subject: [PATCH v1 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun,  8 Nov 2026 11:56:30 +0200
Message-ID: <20261108095634.100517-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 195 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 +++++++
 include/linux/mfd/max8907.h                   |  53 +++++
 6 files changed, 337 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

