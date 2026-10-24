Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883632;
	b=lpqipFALgrQasoQ9xD7EA6uDY0STMAZ9TlpY5BTXUOdIKPSrEjau3fp8KfQKm4EprYSe
	 6llDIsdR22vOD8N2otjMoVGeUcisE3THAKpM+txG2vAmUiZL4o3UH4nHE/84g4EALSGPE
	 crEsZTKwCUmj1FCf8BXtJdqlm4lI+Gq3UkyTbJz9C56795Z05gWbv5LhBuvErPZaLAnrA
	 /rqSyZwM4VXqrGYsc7p62PbX/eNblhaYXSj8tE9dhdzxQjArNt+SQJ50jDkQTIs1OkJOM
	 rrI7ys+czFJ7UhTs+uUU0WKPyYaTaL3k77F2+IpZKQu5FFFEhOp3mJAgFumY1wA3Htw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1AIKyvNFejxgpJElRWUpbqx4cqYCbCrAW59Sl75hF3M=;
	b=qHD6k/iM7rC514YvUwE7nfC2yk+AwSmCwI/hS7Kcfk1ND8jcY0gXqEcyNKIYK2fCDx9e
	 9yiZ2jfhWGdPht7ipzzYIrpNfBKD0AvKlXQg5LTd4ImD5oMQqYKal9hYGir2EyoQzw+rn
	 Dyaq1Lk2XU+HXb5F6Q2D9EUPlkeGIZb4LNagmhlhm3rD1dxazDvJLut3qbu0bNS3NUlV/
	 NhBwH5AU4eKVrdN6axFSmbGaaj2pd+tEfSWrdHiFVwbpUHYUQLowi7NyGsG1IxPkyJedr
	 2osCD83NUjz0JgtKixsBJ5NZYY79IVUYAvoUSyDWsAydlVmsGhhRVWqx4UqlUI2NEEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bEAEJVkO;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F1C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F1C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bEAEJVkO
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7c03a445cb8so1281638137.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883631; x=1793488431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AIKyvNFejxgpJElRWUpbqx4cqYCbCrAW59Sl75hF3M=;
        b=bEAEJVkOFRV/r5SFuPpgkq3+D+fdTibg2XIBWT2eXGiN8BxiFuGhps5MZxebVN+ZF8
         yK0pCdbN/M4QUwyYfHYHk7McXb78HB+3XZb/DDi1wN5kjJPLGjds5I6wJubT9U+RXY8V
         /QepWwgIoP7e4eEfCko9Lc8zXkBO5b3/77l6N+AZNatYbIEk3Y3qn6rsLCnJCuLWtnP3
         1NCBQBqH22915CxlGJb5UKAzXUoULFzh4sgtejeAxENtixWS60mA+yxBI38/gsWY6zVZ
         jSUsZ5Oubh1XusNCLNYqq657SPBittlCwS8a84xQ5sZCgPLGhUjcgxAHEIxGYa2i3uWu
         DaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883631; x=1793488431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AIKyvNFejxgpJElRWUpbqx4cqYCbCrAW59Sl75hF3M=;
        b=SxKHIEM/v2H3041lGjZHXtWizk65cmvCm68sb2WM4r1tLTt91sfRppQgz3mYhGQ5Bv
         kDwSeLKt4leEbwJbYvAmZ42U5rXRlrnIvcoMY7urBl9vyEPvNWxmISiSy/6LHPQzB6Br
         EelCPKRIfnaBq1W1J2HNyu/vyInO02h35yDDPK3+dCSOMS4NyRiwcwHWIvE+Q6Mf7rYg
         Ck+SwuHyulEYxSC1KYYRr9EPd6JhC6k3FBh1zFONjcOkcbjL8pLnL36emesvYB0PpsFH
         sfq29XSuD3rWjCJlAaeB23aH5EfKSgmWe7rzMr7ZsGdXYbWuKlsLnliI2fj9vb2GLcrY
         5C6w==
X-Forwarded-Encrypted: i=1; AKwUvBxDtRHCw5OzINbqjEARdo7Hj0lZM10yauAXucUn8oPwRfPc+kSKQZpMXeGRdj1yVlIUu5bzDWXL6yk4S78=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG14xXvk6L7WYpuWG6VxVgs9Aivl/9XrgH309ExPZFtAIr7lJJ
	beTIZNfJJZ7RVwT/3mTJ7gPqEDYH6NR6zdCeNER6Mxkll2HJRbbmxAM0
X-Gm-Gg: AYBFou0LqKpKPQJ5ISq5cszwM5ReDtFyOdg9jt51b0jfguA1j1q/Gzs/JS340UpumFt
	nmf8MlymoEg1y0hgEMycpOT1haimtKbAH/if/VZiZ3oWUBo4cXH+Mc2qdB3WMZDi1FphVnpzllz
	hPJo/dSe8VIvYZR//PQz77wgEspeoePAH009qBqSixiHp9Bibkyv0T6lJxwsIJY7nSOr/ZDJ63O
	7OqGKUg1DYn2hTzgL0aqQKUIZ+F7c3vROG2tpIDhoxfxOZQaV3SBOzAFez4RFMkl8W45Krq19vV
	YivkD9+uZI4XMRTmBvcD3RorWfaNq9UVKaxrRhxghCWjWc0kltospufiiti+bh/ZEO3sEO3sZdq
	CjLJ2/5m7cNcVGM9qSEXp0pUTBHazGV2Rlgy5IOTXQrBogjum9IvPPO2uMOP+QMfD093rsgSyA4
	oO9Ow7jkOyKbXRwsaHnk8whNAyMrOqyNDD229i3T1F4HfQr+rcsXEfHTPaoOp5n6QL6SI1pGH/W
	/ay02TvSq03h/MWPK7KaCtA/GNPztRT9x0i+dULqnXUS8teCZbHiHpXwWzENDMh0Z2NydBPgLN0
	eJwM
X-Received: by 2002:a05:6102:5708:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7ce5ca75b82mr1051989137.1.1792883630780;
        Sat, 24 Oct 2026 16:13:50 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:efc9:520c:e99d:e5ce])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm3775406241.5.2026.10.24.16.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:13:50 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] iio: adc: ti-ads1298: fixes, and ADS1299 support
Date: Sat, 24 Oct 2026 20:13:29 -0300
Message-ID: <20261024231335.280955-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds the TI ADS1299 to the ti-ads1298 driver. On the way it
fixes twelve issues in ti-ads1298 itself. Five of them come from the
automated review of v1, which was a separate driver derived from
ti-ads1298; the others came up while reworking and testing.

Changes in v2:
- Extend ti-ads1298 instead of adding a new driver (Andy, Jonathan).
- Bindings: the ADS1299 goes into ti,ads1298.yaml, with no clock-names
  (Krzysztof). ti,ads1299 names the 8-channel part, as TI sells it as
  plain ADS1299 with no "-8"; ti,ads1299-4 and ti,ads1299-6 fall back to
  it, since the channel count is read from the ID register. Each ADS129x
  part also gets a compatible, with ti,ads1298 as the fallback.
- The issues the automated review found in v1 were inherited from
  ti-ads1298, so they are now fixed there, in patches 1 and 2.
- No <linux/mod_devicetable.h> is added (Uwe).
- The ABI that v1 added beyond ti-ads1298 (writable scale, _available
  lists, timestamp) is left for a follow-up; see the end.
- v1: https://lore.kernel.org/all/20261019001247.483005-1-stephanbrrs8@gmail.com/

The series:
- Patches 1 to 3 fix ti-ads1298 as it is in mainline today, grouped by
  area: the data read path, power-up and the device clock, and smaller
  issues (scale, ID check, regmap, Kconfig). Each has a Fixes: tag and
  none depends on the rest of the series, so they can be applied ahead
  of it.
- Patch 4 prepares the driver for more than one chip family, with a
  chip info structure, given as match data, that holds what differs
  between families. The ADS129x behaves as before.
- Patches 5 and 6 add the ADS1299 to the binding and to the driver,
  with a compatible for each ADS129x part and the optional DVDD supply
  and PWDN pin.

The ADS1299 shares the commands, the data format and most of the
register map of the ADS129x. It differs in:
- the PGA gains, 1 to 24;
- the data rates: no HR bit, and bit 7 of CONFIG1 is reserved;
- a fixed 4.5 V internal reference, and the reserved bits of CONFIG3;
- the ID layout (bit 3 alone tells the two families apart);
- the register map, which ends at CONFIG4;
- inputs that are shorted out of reset.
These are fields of the chip info and an ID decoding callback; the code
paths are the same for both families.

Testing:
- On real hardware: an ADS1299 with a Raspberry Pi 4, running the
  driver from the tip of the series. Probe, scale, data rates,
  single-shot reads, buffered capture, and buffer start and stop under
  stress all behave as expected. The clock fix in patch 2 was checked on
  the same board.
- With a KUnit test, kept out of this series, that runs the driver
  against an emulated ADS129x and ADS1299. It fails when most of the
  fixes are undone, and it found the command timing issue fixed in
  patch 2. I can post it if it is of interest.
- Three of the fixes in patch 1 were found by review and could not be
  reproduced; the commit message says which.
- Not tested: an ADS1298 or other ADS129x part. Mike, if you still have
  an ADS1298 board, a test of the series would be welcome.

Proposal for a follow-up: once this series is in, I would like to add
generic IIO ABI that serves both families in the same way: the PGA gain
of each channel through a writable scale, with
in_voltage_scale_available, sampling_frequency_available, and a
timestamp channel. Would that be acceptable as a follow-up series on
top of this one?

Stephan Costa Barros (6):
  iio: adc: ti-ads1298: fix the data read path
  iio: adc: ti-ads1298: fix power-up and clock handling
  iio: adc: ti-ads1298: fix scale, ID check, regmap and Kconfig
  iio: adc: ti-ads1298: prepare for more chip families
  dt-bindings: iio: adc: ti,ads1298: add ADS1299
  iio: adc: ti-ads1298: add ADS1299 support

 .../bindings/iio/adc/ti,ads1298.yaml          |  41 +-
 drivers/iio/adc/Kconfig                       |   7 +-
 drivers/iio/adc/ti-ads1298.c                  | 513 ++++++++++++++----
 3 files changed, 448 insertions(+), 113 deletions(-)


base-commit: c9dbe2a47f635465c9985b7af74d2ae310e98125
-- 
2.43.0

