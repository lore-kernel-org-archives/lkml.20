Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6667C3AC17
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368805; cv=none; b=eg0c6WkKpHtanlOFyRrCQQbF4nal+USdtAktHCyDYfLAxwv/0iCRuvv8IYW9V/H4aAe/1awVp//yKicxf08jmW7LK3DGhWBWk11uZe2XpcdBIEALOSoemlT0TQO2AmPmpiMWui1Q51gjCdQdgcW3AJ0myMAv6W0YmZQwdBpyCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368805; c=relaxed/simple;
	bh=knf+1wF9ksJgxjHb4wumyiicX5OX4gIFh9hhKLR9xII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vm9uD1oJBANWysySyVPGtZcpzMno0kxIK40cy6rc6pTUVGbg8bAg9os9D/0H92MC7c4nkLYSbZjuovTp6IhUYHihD62jDB2ZM0Tk4e8ACY23O8yaNAcJW3Uz/NMz+vkHIPdpmJ9DbhdXO8WCjjRI2VPeeSc/YAs5wIuZolX2BUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkmkcQCJ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkmkcQCJ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3550c917fd3so1790545eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368800; x=1792973600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmCKVuEhcyinCJJCJLug0EcJL3YbcTgm8cMUgb76yLI=;
        b=QkmkcQCJyS6d41rPG9LU1Ov4luGbPAd1t6J+2phi29Bp1qSnz3VRJA7iAZi/Mn1sGv
         75GbsItHf9CPKicpXA/P6+BpfUz1NEyHmNPRzU19Qo++cmxu9L79kmgv9A20q7Igzx6X
         Hl7gGLNXxaBhwOB2uaKo5jCGMQNm03pD+XZdmwQdU57vgc1911BYoyeyEj2DKhhsK4QF
         YAezqfJNEMz2WZRFJKdGANP4dOVUx14w0je8wrPPb0DRXKr/5xh5AC0rQ431XxRs3TRn
         x/5R0qwPMcL3ivxyHx3RtBMe+wrNVaGd6N1MVgx5isvBSOvGuq2qkuvgGDStdpIdlSW7
         Igfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368800; x=1792973600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmCKVuEhcyinCJJCJLug0EcJL3YbcTgm8cMUgb76yLI=;
        b=zg5D9Tdf+LZu5rMoIEqdM3ivDnYuRgt6lxjhnkTcLfqm2BwVU1tbOw++DwBLNqEVQL
         A6taM0dq5QYt7r//EUf0MR1xYZATK1r2qtbdnGdjgW0FdhPLyPmm7kK4CWpG4DV4GOtZ
         cSxOIWQmjLunBkTkmQQMmx4zfmEisoGbSjoYwpPW2eNXOE6120xSrPkc9u5iBTp5XD81
         a7VFR9yHff+Hm717CvdZnK07x2js5igCb3FltEYh/Wg3sj/CtCAWqhYV6P+ZBR+7TvlX
         ZUpJ+idP7EEf9C4Trd4fGx2L3IYMobDB9GZXctk8EH9LIrXKji70nfP7pOYGs0ePgq+X
         hxCA==
X-Forwarded-Encrypted: i=1; AKwUvBzh6Z9qnH5zkUy4jZBVgsOJ9m2xQ9RAV7CJE/UXraCKr/Eev0MJkkrD6YZjZZ16vQLDm+YFR2SmbvvkxIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOhXLcu6fN2+5T+xDeJdJ7jMHmy9uz4lEPlaW9roIvjhvZxwP4
	q5fzoWXjhR9rG4f5WcyLUTGb2iFWdQ/seOP1wkuBjp43q53kqrJDWnLA
X-Gm-Gg: AYBFou3GnFd0Z8CVhxSVTluKRJa4IioR5LxOHRhoAHEgrKMWi+y9xBW7fYEx8LEwkoQ
	v4bayVtGiOzfz7/sDr8FkWOtaDPD8CkKVLmM2IbsxE3ZnbCttEA74PRHVoeR7CSnIVYgG1K82Gj
	GGNg7alkAwaUn+yVHOI7DpgbnduPzI9L7oYictfuvKMSNpIxJQvt+l8XbiqFDS6uOevvbdkY8qz
	mWigXQKTvpcXLpUYNseCsxIAuSHIRACNjOkj3wq5Jl/laDcqeeAFsLuhXiMSgPZqHrynswjtcBO
	sibq0fbI2Pfz5+WjhaUtqEgTPxVz0VepbPSZm+VC5uilleBKUdKrTTjRwC86lpFrx0NFQfCk88L
	LI0CY483SoLjyKiqKzdXPZkbNtY/wZXmvTa2vg7uSWKKikTTOAHZOmJoLrrb+/4ZgA8offfZ45j
	VuQMi6lYGzCvnJU8DUFCojN0tu0HO3rL+g+2AaadA1r0v8ONAX6uxYjpIZtdgutjhXH7RPEdDyV
	11CZLHLuJuko7rrY7O8dDI=
X-Received: by 2002:a05:7300:7a9e:b0:361:1dd6:531b with SMTP id 5a478bee46e88-361a2052bebmr8300968eec.26.1792368800338;
        Sun, 18 Oct 2026 17:13:20 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:9a49:ae2e:1b25:b04a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082f7f6e0sm30631371eec.27.2026.10.18.17.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:13:19 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Costa Barros <stephanbrrs8@gmail.com>
Subject: [PATCH 0/2] iio: adc: add TI ADS1299
Date: Sun, 18 Oct 2026 21:12:45 -0300
Message-ID: <20261019001247.483005-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for the TI ADS1299 family (ADS1299, ADS1299-6
and ADS1299-4): 24-bit, simultaneous-sampling biopotential front-ends
for EEG, on SPI.

This first version keeps to the generic IIO ABI: raw reads, the gain of
each channel's PGA through its scale, the sampling frequency, and a
kfifo buffer fed from the DRDY interrupt with a software timestamp.

The part has more, which I would like to add in follow-up series, each
with its own ABI discussion: SRB1 and SRB2 reference routing, the bias
drive amplifier, lead-off detection (through IIO_EV_TYPE_FAULT and
IIO_EV_DIR_FAULT_OPENWIRE), the internal test signal, the temperature
sensor and supply monitors, GPIO1 to GPIO4 as a gpiochip, the CLK pin
as a clock output, and daisy chains. The binding already describes the
hardware for those.

A question on structure. The driver started from ti-ads1298.c, and in
this subset the two are close. What differs here is the PGA gain table
(1 to 24 against 1 to 12 with 3), the data rates (no high-resolution
mode), the fixed 4.5 V internal reference, the ID register layout and
the 4 and 6 channel variants; above 0x14 the register maps also part
(MISC1 and MISC2 here, PACE, RESP and WCT on the ADS1298). Most of what
would follow, SRB1 and SRB2, the bias drive and lead-off on every
channel, is specific to the ADS1299, so I kept a separate driver. If you
would rather have the ADS1299 as a variant in ti-ads1298, I can rework
it that way.

Tested on a Raspberry Pi 4B running 6.18.50 (Raspberry Pi OS), with one
ADS1299 and DRDY on a GPIO edge interrupt, the driver built out of tree
from this patch:
- every value in in_voltage_scale_available and
  sampling_frequency_available written and read back, and values outside
  the lists refused;
- the internal DC test signal, routed through debugfs register access,
  read at gain 24 against shorted inputs: -0.08 % to -0.41 % from
  VREF / 2400 across the eight channels, as with the out-of-tree driver
  on the same board;
- a 10 s capture at 250 SPS: 2497 samples for 2497 DRDY interrupts, no
  gaps in the timestamps, and buffered values matching direct reads.
So on 6.18 the driver was run and tested as above; on the IIO tree below,
the same source, unchanged, was compiled but not run.

The series is based on the testing branch of Jonathan's IIO tree
(git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git).

Stephan Costa Barros (2):
  dt-bindings: iio: adc: add TI ADS1299
  iio: adc: ti-ads1299: add driver for TI ADS1299

 .../bindings/iio/adc/ti,ads1299.yaml          | 221 +++++
 MAINTAINERS                                   |   7 +
 drivers/iio/adc/Kconfig                       |  14 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-ads1299.c                  | 897 ++++++++++++++++++
 5 files changed, 1140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,ads1299.yaml
 create mode 100644 drivers/iio/adc/ti-ads1299.c


base-commit: 19c5db3507633edc21b4172d99f573c2dfbf42b1
-- 
2.43.0

