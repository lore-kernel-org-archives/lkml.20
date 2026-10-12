Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC6B4718DF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805590; cv=none; b=N+6brlSpQMcrM5LRwTIA+Lc5P+G7xw2CNYcbfXdHuox3povUuoMxYOlKjOkeYLB6QBPNTkjSUGV9i753ePeGYJfsDUKy8xWrESi2GddbYykoAaiB0XN549+u2lIZlCSJoonq38mLOE5Pt/i/OKq9tkteELMvZ/ual316LbgS5jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805590; c=relaxed/simple;
	bh=+3QF/qLJ+eGfzFmJW1o528mBIogPPz96eo0+FniqcCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=efN1LrN7HMHhh5Si4UzA/xhIfZ7o1VCywr2gzvz3e9+wUs2uWj/UxTJpHFwA6hrfg2BbSKhdBl7Dnl6/nxXEpElrtxf4QjX65LJUoYRPgUc/tuPGtEXHFemd76bT6+l1KDDKPFq2xlgfutlAkARPShvlvkGFif83RhBuJXIj/0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4YXlrG+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4YXlrG+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c20ce3c118aso155062666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805587; x=1792410387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0WPcETHCmHpx54uZlEU6KywOxQOrIIbX1QyEesZpp0=;
        b=V4YXlrG+7l/s2D4XxoOYrljxdCkdKFmyW+hlF427M8DujkI+iCEAo77T0dDO9jAbjy
         tolnbrtvOuLGte6yN+j7XHKvkTgw+reJxU4jHuhvWAGQHl4o/5XpnVWNIWOE0nzwUfca
         Ns/qRCuK+psJd+/mLfvigM4dcbSPew/gtr7ZzrF9cQ8XaMkEIco8HubpBEcT7kx5sayh
         pezyWutyr6vBKoJl6F6K/iywaN0Ma0q9AJeHbDPc1TnFcgS2FJNmSxUiGpkoiIIPsN6r
         hn7cN3jiSmvBvRr/N0kjsLXBQ2G7hgiEOmav/d3ZWJS9a/OiDYSUMgqhASDRaxQsJp3A
         CZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805587; x=1792410387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0WPcETHCmHpx54uZlEU6KywOxQOrIIbX1QyEesZpp0=;
        b=O6VYIeWzpyS5HheFauMNhpwUAVtLf0vt779r9ZTNnm9iG0J9oNZnxgwq1aWZcOZ1lR
         b8knsnw8Flv3uhGm49M2WN7Kaj34wTd/Jc9FN0QuYyuhYIZj1CVF5VASPaqeN3AP6+qK
         HmhWkvuRFwcqFOoDxq/lI8J2Fp2QHdvKssXIdSZLHtV1kw4ozDSnuFZFk3RoDMza4XJa
         YKvcgCaGAHWqpmKsoqCKh90vShJyboKYkruOj2nsbqBaliMiCM20BVSWacCPK7B20oGR
         xwo3IS9pulsfcWwZECoaupfIfuk4RAlgloTqJlSBDpCtv1XS1Lli0Zjh8FpCDOUhSEO2
         1w5A==
X-Forwarded-Encrypted: i=1; AKwUvBy8x5W/5KfNvYypBOEh0qcxfEIiC2eIu98Fwz/JmpKxXPKcNNKvj2KAKYpuU+k32C/S6psc2J6gdODsCBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfSOdtxK3VEgXPYoS23qO6qQHSRyvCdED3guPx7lgi0FnENnt7
	r/CsV9TFq6bNgrvi4y5QJ/mUdbJdHsfbxlQI9xA1DgNpjrx5n3CV+tiB
X-Gm-Gg: AYBFou0Oyhkeg/8bCOwDj+JYWTK2ZOvnKpwPG8WlxCbOttQSV+15LAd622tshJQR6J0
	X/cUrFaqg2V0CwHBFqmDpEJmwbqUpS+861t/2+17mKgtHuDE866SsFPfLaCT4KgvKr6bpem73ha
	8lH2ZBe5Ixt4JIK/2zo3Y8HA8MyaOYN7tjjV7xmFBF3FrSRaAvDwTutBeSKHV6IW74bPjF6F9gQ
	0rFUtEZBUj1K1U/a0KuGmb9Kh5DPeu3jQLsxlkd407eHy63is+7yMTosuFMxOw7MNLc2v+dFq84
	LBmmkONR7NZgR2Wu85/MeFY42pT81t2XcaNXUW0blitxr0KHSP3hfagcvbCuHXSCauW3ISTp7Uc
	ao69PIrdc6z+RAdKOLhylCzmP6g/bWwEARudoogj7RfHPcDIIe9cchNoTbDYJ//i7Iot1AXDV4u
	evz6zVRbRu8jvbpa8D9Una24FzYKSNjPf8pL0AFDDFtvohoxzMmIb/H8WoRS3Wopee3CksgXO8l
	Zqz4Y+Z0xJQfkQqcwIwzwSyUQFbFj02n6A5bJ75gZFT2dEjRgr4pr0oYiNEACHuwL26BIAHR4Vg
	Im93cnRZxtLUtk+Wlara7lM8MF4Jn6YkRw==
X-Received: by 2002:a17:907:961a:b0:c31:7a83:bd78 with SMTP id a640c23a62f3a-c31a70d32bemr875942866b.27.1791805586880;
        Mon, 12 Oct 2026 04:46:26 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm118669266b.42.2026.10.12.04.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:46:26 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
X-Google-Original-From: Paulius Zaleckas <paulius.zaleckas@ui.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 0/4] iio: pressure: dps310: fix pressure overflow, add Zilltek ZTS8032
Date: Mon, 12 Oct 2026 14:45:46 +0300
Message-ID: <20261012114550.1680054-1-paulius.zaleckas@ui.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paulius Zaleckas <paulius.zaleckas@gmail.com>

The Zilltek ZTS8032 is a register compatible DPS310 with two more
pressure calibration coefficients. Bringing it up showed that the DPS310
pressure compensation overflows s64 at most oversampling rates, so patch
1 fixes that first (Fixes: + stable); the rest adds the ZTS8032.

1: Evaluate the compensation polynomial in Q20 fixed point. The current
   p^3 * c30 / kP^3 sum overflows, losing the c30 term: about 20 Pa low
   near sea level at oversampling 2, 4, 8, 64 and 128.
2-3: Vendor prefix and the zilltek,zts8032 compatible.
4: Per-chip data for the coefficient count (c31, c40) and the TMP_CFG
   startup value, since TMP_CFG bit 7 is a rate bit on the ZTS8032.

Based on iio/togreg, on top of 4334dc4092c2 ("iio: pressure: dps310: fix
CFG_REG bit definitions"), without which oversampling 16 and above
returns -ERANGE.

Testing: ZTS8032 on an arm64 (MT7987) board, both fixes backported to
6.12. in_pressure_input matches the datasheet formula evaluated from the
raw and coefficient registers to within 1 Pa at every oversampling rate
from 1 to 128; the fixed point math was also checked against a floating
point model over 300-1200 hPa for all rates. Builds without warnings
with W=1 on x86_64 and i386, dt_binding_check passes. I have no DPS310,
so patch 1 is untested on one.

checkpatch --strict suggests BIT_ULL() for DPS310_Q_ONE; it stays a
signed 1LL << 20 because it multiplies signed raw values.

An LLM coding assistant (Claude Code) was used for this series: it
found the overflow while porting the ZTS8032 vendor driver, wrote the
code and changelogs, the floating point model and the hardware test
scripts, under my direction. I reviewed and tested the result.

Paulius Zaleckas (4):
  iio: pressure: dps310: fix overflow in the pressure compensation
  dt-bindings: vendor-prefixes: Add ZillTek Technology
  dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
  iio: pressure: dps310: add Zilltek ZTS8032 support

 .../iio/pressure/infineon,dps310.yaml         |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/iio/pressure/Kconfig                  |   4 +-
 drivers/iio/pressure/dps310.c                 | 149 +++++++++++-------
 4 files changed, 99 insertions(+), 60 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.55.0

