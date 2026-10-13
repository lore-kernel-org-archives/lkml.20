Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3182547CA69
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890509; cv=none; b=NeUtNwHKT5J81rI/aMrr5Mvd7Fpb5CB3f14DDbkJikYOiOfEDz1VF1FDHLtdxAYXuzxTccGv06jXKAAT9yDXARt1ydZr0o0jPrCPjtaCY8hnjbNNTYHxRJEBGc2aUOVc2XUiHpEEnXO8YJ1nsymkE/URkVvOnsyJjlwu/kRxVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890509; c=relaxed/simple;
	bh=1b2YdOinPgswRzD0U/ah6zIq9R/wJFvfLi8bFpVXbWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNtl8hzlByJ7139AEQZFaVNqcLLmYjy2weiuaJ/DbSRuw0NPw2RIIhfftD10MBiejO38Kz0ybFrIeQ2BHkj6eMBYiqbCT0qrj5gv8kC+myksaZ65HtVgOrvv0g4Cfcm+dDEobuHeWHyPGSpGfGcagvGt28NOtTbRfBAlbEOv62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBTgvb3G; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBTgvb3G"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so20781181fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890505; x=1792495305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkAADBUNoE9vkJ6CKgpfe3PgX88GbGiCjcr9TkKhtAA=;
        b=XBTgvb3GK2k2spGG1AW1sw2g3iNC67XaLOnouOHiMHVjGJgGKzOLA0UXkLC+PTWcpV
         8RsPdkpeb0AA74ZzI+LyZ6pk8hfsbNbxZq6n2LcArb0Schi6OQaXKG7RJbBIGglzpUQ4
         bOyQ9Ukwx5eE8UydtRzXjyrBCjdBny4GegdXbrVX4xgFpkc460X+Pgf/Vs13o5yBUL7U
         lNQB/bOr6VkZdki7duiAKxNNJJpQsldnOEVCdpU/2r7nm73Xa5iMg8Uc3Pe425AOlNWP
         S49NtBZvYJ3xkAqsW32w58d5icSCoNj0TJascgxgWhsSynvuxFzg2YAW2iSQuX3NvoSm
         9z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890505; x=1792495305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkAADBUNoE9vkJ6CKgpfe3PgX88GbGiCjcr9TkKhtAA=;
        b=IiDm7t+IkdjZ1zTJaJAiqyi9FlRod+tpWeTMEAbYzJpPEYKYJfJbv17dguoNKpPCdb
         ip/v9yLhUxwWTjWIhxYorlUIkUmuqAFH8aTWfha5AM11W5V6P1HsPE+ZdDQfRDg94lGx
         1BAaD8Q88+sm6Yc51rBMHpbh+KG5yA5fBTqkVyz6pHuRWAW2OwBSZTWvon6ZkCklQcle
         WWC5OaG5cnrgesGVwqZqEQ31fYLSGQaI9UZDdH3diNLh1SOlMC3VXMznmSPiWPhXlBv1
         ztiDUQ65rwzwSHlRtEAL0rDkFfcgYgkHdLyQAX08hEOvsc3GXh7KN0hkKcoMj5IThQdj
         ZAYg==
X-Forwarded-Encrypted: i=1; AKwUvBxnxsMQbEct4de31yIsV1bMjtLYJZMY5A6ECqsC3KRUe1cSy/f5oeJqVcQXFtAd6owo0fUJ2kgUVqNuiFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiFTF7YhiAlLsN4BGeCZ87zFJwst5G2vXA2lTsaZ/6yXtQMlN7
	Z1LIe6eukF9sxJ8c62NJmplOgLiLDYKhckbFQbfkIT/VF4C3vRbbK/dIW8mSpDAD
X-Gm-Gg: AYBFou3xPpMyaf2UroEuhOzko81X1fQlMUP3pCnqrjKrI59kzifosi/6TXtUk6BCu8f
	nTZ7jLs0tnTAY46+cPjW+fSnmtX4sCgAyfQRjUVtRzBXyo6yD4Qnphjzr4e84i5IC5scIfm3Da3
	mtjwelFYNfEtNfajiKEdDRx4lGniDGUtj1DGmEXHDc2tBfZj3UrAZ0ZTdW52WP5CW8Uv/jTQz3e
	e/i/0ZjCBqITyND9Gg/wfBs4He1BJI7ZkZtZ/q9WctEMs6rMucf/RwHOkK6VxgGGxCRFv8uJ79h
	ofZL1ymLCoFpVtFKiQ0YyrRbbqbda7ohIL9nebE8cEgtJW9yN/WNl+fD6lc0v1AP0bk+C0MUI/U
	sZbM7mYVTKH3mgTN3dzAks4g5gKlTI1NKmb1E0o1f/dtBN1RU/GFO3Mvh5y3el76sSupYI1bX94
	McIvCl5pOfz5tW5DlSfYG+rRgz2ff5gWFo3nvsCIU8clU7KGjuh1Yg6XjHpAm5PzqWH2Dnys5Xm
	YPLKpRFgbKcVDyVuwioWjXQSKv6ObpxYZRID+VdwTehkRQNtIHLevUMKx4zzEe6oqmN17033X3b
	lTR+/qaZKvuqE+myXY7v9OviGe4=
X-Received: by 2002:a05:651c:1542:b0:3a6:3c86:df91 with SMTP id 38308e7fff4ca-3a9c538ca71mr36501091fa.23.1791890504793;
        Tue, 13 Oct 2026 04:21:44 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1116148e87.79.2026.10.13.04.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:21:44 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 0/6] iio: pressure: dps310: fix pressure overflow, add Zilltek ZTS8032
Date: Tue, 13 Oct 2026 14:21:18 +0300
Message-ID: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zilltek ZTS8032 is a register compatible DPS310 with two more
pressure calibration coefficients. Bringing it up showed that the DPS310
pressure compensation overflows s64 at most oversampling rates, so patch
1 fixes that first (Fixes: + stable); the rest adds the ZTS8032.

1: Evaluate the compensation polynomial in Q20 fixed point. The current
   p^3 * c30 / kP^3 sum overflows, losing the c30 term: about 20 Pa low
   near sea level at oversampling 2, 4, 8, 64 and 128.
2-3: Vendor prefix and the zilltek,zts8032 compatible.
4: Per-chip data in the I2C and ACPI match data, no functional change.
5: OF match table.
6: ZTS8032 chip data: the coefficient count (c31, c40) and the TMP_CFG
   startup value, since TMP_CFG bit 7 is a rate bit on the ZTS8032.

Based on iio/togreg, on top of 4334dc4092c2 ("iio: pressure: dps310: fix
CFG_REG bit definitions"), without which oversampling 16 and above
returns -ERANGE.

Testing: ZTS8032 on an arm64 (MT7987) board, the series backported to
6.12. in_pressure_input matches the datasheet formula evaluated from the
raw and coefficient registers to within 1 Pa at every oversampling rate
from 1 to 128; the fixed point math was also checked against a floating
point model over 300-1200 hPa for all rates. Every patch builds without
warnings with W=1 on x86_64 and i386, dt_binding_check passes. I have no
DPS310, so patches 1 and 4-5 are untested on one.

checkpatch --strict suggests BIT_ULL() for DPS310_Q_ONE; it stays a
signed 1LL << 20 because it multiplies signed raw values.

An LLM coding assistant (Claude Code) was used for this series: it
found the overflow while porting the ZTS8032 vendor driver, wrote the
code and changelogs, the floating point model and the hardware test
scripts, under my direction. I reviewed and tested the result.

Changes in v2:
- Split the driver patch into per-chip data (4), OF match table (5) and
  ZTS8032 support (6) (Andy)
- Drop the linux/mod_devicetable.h include (Andy)
- Return -ENODATA when there is no match data (Andy)
- Add Conor's Acked-by to 2-3
- Link to v1: https://lore.kernel.org/r/20261012114550.1680054-1-paulius.zaleckas@ui.com

Paulius Zaleckas (6):
  iio: pressure: dps310: fix overflow in the pressure compensation
  dt-bindings: vendor-prefixes: Add ZillTek Technology
  dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
  iio: pressure: dps310: add per-chip data
  iio: pressure: dps310: add an OF match table
  iio: pressure: dps310: add Zilltek ZTS8032 support

 .../iio/pressure/infineon,dps310.yaml         |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/iio/pressure/Kconfig                  |   4 +-
 drivers/iio/pressure/dps310.c                 | 148 +++++++++++-------
 4 files changed, 98 insertions(+), 60 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.55.0

