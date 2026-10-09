Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C46D380FF2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584730; cv=none; b=jFQ6xqCAFISNgKrks6MdsfCLnaqJPVkawHmd+1zTDYgHeHZZVxfX0LZLggb54O4yLNA7PI6mWvTavUIWj39ZmXgeoKMjOC8tReXgZ9JvnFGaHVtX5ZLOxkd80eobTXQ1tad9u3Q+IUo6n83O2LNxYXISpSypPy5u9nnM717pV8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584730; c=relaxed/simple;
	bh=ZfxBmz6GPShtLwiEphjvFKPdKTZLhI6jZuqqelBJVec=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K3UbKMC6PlwgRiFLDIcTBrBhU6M3ORqYgLjJuu7DqkpVimA/qy9gaBzqcxZrGP7xKCaGRSLSKcwE8uQVq3EnfpxB3oNiFjYh6sa9bDCimxicYZ2L0SqhrRZDnYR/yAZYlV1Mm46i3WPLNKQftB4B5pV0KEa9hOdS6EgBmt4DaDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nI/c6FN6; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nI/c6FN6"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98c786605e7so60105241.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791584726; x=1792189526; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w9mGT3pmDM0+79/8mcyzR1bRGnhrCDI9ZzCxuUr12cU=;
        b=nI/c6FN6s35gOxY+ZlDUkGDDgsq3JskR/4CgbuUU/q9ec29nrg280HOl3sJyu3573W
         tKskev6BDhmoktaLvPGqrmgwh1frAbjM5cnz46WnZsnTDaS3RDQOcWU+o12F0lCQiP6Z
         /eFt/VPkoLqOTyO4BjsjtTGn/fJ2Ukyqw/e1GNNUEtKTa2SRyOPz8E9ToDGCB7hqq2Fc
         LAASIxIEeZIghk6Gl7emS7bK/dZC9Lj3rp0wJAzGEH9RFCZLU8bN7+1Ytf+nXEJ368EC
         NeZPlxiBPmZmpoApOmNVnjSJGCQgQvVz+TMIXDhguJA0/QhovN5z9yBEKb43v4QuYsgW
         WBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584726; x=1792189526;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w9mGT3pmDM0+79/8mcyzR1bRGnhrCDI9ZzCxuUr12cU=;
        b=dwLZlrkS1iH8jMdXNLfKsfzSIvD7BNjcNkZJ2kcmWRQIyv05WmE1KjLLxmPaHGDzyZ
         aXN6LxJz9tqfLmFl1XNCXkeraLI1HB4TmZfw/eNj7xcx+CbxPFTi1pKX6nbsBRav6gV7
         zPPn7XE5cRPS1MUy2YtSCAgrzYdELaqP3elg3+mduWcCvSbfQkB+ZVxunZlmuSJpg1lD
         Jrv4jl+NC0FWi6mXVzw83gBv9I/Z0V654qy9GrDp+7kEb1D9wsbvk9rPpzyaV5gWH2Rg
         jseLAt0+5ldvAjiaRjGBRPgHiZ5lwVhvYDA92svfIpmxm7Zd/0yMR5xXvuDCDzrJskzB
         S8Hg==
X-Forwarded-Encrypted: i=1; AKwUvByB62jY/5Q7N0ZYpLxGIC3MKRmdFO0jpTiC12dwrVod3P1bKWmxVxyqYzzeT085YObUiiI2gQCLtf8MZns=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaGbb6zA7NxT/9AuEWfMc1QPGCHoDIbDzNXPXSnbguaZIIADRG
	qNbarM9yyJpWi/IkYUaByH69n/zFPJviFgugHZqyFtdS3CR1jm24Vmvd5eqdr55I4QjWluVI9IM
	Hqv5/
X-Gm-Gg: AYBFou1OdMXMa8ZtyTOC+C6LgU6BlK6RCDqKznkXHi0fGrYNItHuvqeyVMlAewRYSKG
	agpPh3gIuFjP7LBoJXqSeQ56I3Zs0XcUzCilutoiZ/l8xV79nw5Fz0Vvfv85FKs/ZS65fkjllN9
	eZq8PcmEpAaIy8ffEOPbVT0KIQp3KGgOSd+oS1vt+xNc8NFF+iRkcJ3cKZ/ue+el3b5Dw5Okktt
	CN9r2q+XCoWnlOyLBfvqoE04mp76RoHz+9WzkbbeESH2VDcGOxBCZ6nbGz0OxblWMKAYh/IUyY7
	fwt3hjnEF+803lbBl7FoOIS9K5ARAF6MjSwruFqRXBFjAImR+y05oBxi3j8mQjR/Vd9z4zMp7xh
	aYyOF1sWye2cbl+7YClQSu2RCNKmHDx2FThu/H5AsbXTiAuSxFMUN0OZBqmo1wRn+llRvEeIzYB
	K9PPPNHlXeAZK1RC+nzbcEexCfm0wCpFLa4pohacCgmbz46BTyYs98j/GGIeumHlv728gQChqYZ
	bUEpq7fH3YIJg==
X-Received: by 2002:a05:6102:4490:b0:7a8:10eb:96ce with SMTP id ada2fe7eead31-7cb3668a4c7mr1182570137.4.1791584726151;
        Fri, 09 Oct 2026 15:25:26 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:29bd:56f6:5ae7:35d2])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99007c130efsm2125418241.12.2026.10.09.15.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:25:24 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Subject: [PATCH v2 0/2] iio: adc: ti-ads112c14: minor fixes
Date: Fri, 09 Oct 2026 17:24:56 -0500
Message-Id: <20261009-iio-adc-ti-ads112c14-fix-settlingtime-sign-v2-0-6b54a7378101@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OQQ6CMBBFr2K6dgwtRcCV9zAsSjvAGGhNW4mEc
 HcL3sDV5CUv/83KAnrCwG6nlXmcKZCzCcT5xPSgbI9AJjETmbhmtSiAyIEyGiKlEzgXmkvo6AM
 BYxzJ9pEmhEC9BVVhLru6lEZIlgZfHpN4xB7Nj8O7faKOe2E3BgrR+eX4Zua791d45pAB70yRY
 ymkwOreqmWk1uNFu4k127Z9AR5D6g75AAAA
X-Change-ID: 20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-a8e34f974d24
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "David Lechner (TI)" <dlechner@baylibre.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=ZfxBmz6GPShtLwiEphjvFKPdKTZLhI6jZuqqelBJVec=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqyWm99QeVV/EUkfMU1QaXv7JSB+Q8cXpb4e61g
 seaqLS3O9WJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaslpvQAKCRDCzCAB/wGP
 wE5yB/wJim4CHHUM26w5lPqU6G07LKauaMswnKs7Elrepp0Tew+B4LS8sxiZ6tovULqV23lUcd8
 EvhJ9ek8xPFgFJIyqlpiRpROBcFy7BvAW5sO2d1AGIN9TTTVAjjVTS418tfT5heGCqO+FlJHWyl
 xPzPZQaSFEtllTFl/VmusAr9n311cOt3/FaEFy2FEtCY/tUMe9arAlf3u/CNl5HOwS8JMi/6nCE
 OANDrMxK9nYQ+4kkCdfwpdt5fA3QBpOurJh3x3nWPtMtrnOLz77zTDvsiSKPYeywqkTFUgjfzWB
 kCWY72DCnBgycCuVX+IqBggyBv9AY2mqFz3diTQW2HqfO7VD
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Jonathan picked up the filter series for TI ADS112C14 already, but there
were a few minor things Sashiko found that seemed worth fixing.

https://lore.kernel.org/linux-iio/20260913211128.25734544@jic23-hlaptop/

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
Changes in v2:
- Change settling_time_us to u64.
- Link to v1: https://patch.msgid.link/20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-v1-0-1fd53e7242e8@baylibre.com

---
David Lechner (TI) (2):
      iio: adc: ti-ads112c14: fix negative settlingtime check
      iio: adc: ti-ads112c14: fix settlingtime creep on write back

 drivers/iio/adc/ti-ads112c14.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)
---
base-commit: d8c0f48f0b1583308a98401c0c7b1a65d1d43a6c
change-id: 20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-a8e34f974d24

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

