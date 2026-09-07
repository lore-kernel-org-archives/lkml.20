Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE673BB690
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814852; cv=none; b=ff5b/e+2nu0vumr/Vz3otH2Uh7S0XNZB1NRGMHGeUiCSSjNCO7jq1FBO4pX0zxKv2Z1MJm9CFozHFNj+siAnhv7fvCwnmyOxSTtulJEzkVKNsGJvH1gH3SG2CVwyeEWDPVeJIGEzJkGnsqxKpibViBOJ7p2B8b74+qyMXPh4S1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814852; c=relaxed/simple;
	bh=R3zDQ8xU2MgwP232Uwo0QTMTrPn5Pt9Q7i4NRM7VQOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MuVOZwNTFzbDWzKtSH/W63n5//83ITjWhaMEKyMmv19L5z2I+updwtVFvafqRrj/Ia+UTlujaZbvqg8dWCKTfFbJjYvFDo73y8t4SEU7RsiZeou8L34qQEE4qWKYabGJBlSxcOsXTRE3GXXL/trvvvCUHL7pAPeEkSJsvtQxh0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBGcwyHA; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBGcwyHA"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66cf1f9965dso2648485d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814850; x=1789419650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gojEDyDfYLvhRqOvL4tTAlYlPBK48sUhaWTtz7U0ImA=;
        b=pBGcwyHAElwUxdB0iRO9SdrGc43rjWWzkAwp6COw1rSbh8yOMphL9Fz6CHqfW+tk5G
         fXnUmqiQUjHqlqiZ7OoslBkCxEVQrQ65zCNV1PebGTZvya3uC3kvJFLjo+g+3badfj/Y
         6ozzfIFAN1qlqaDeX9TBVH+QuRAf5NpuIx/lnBzKrvKiJuKxOWlsvm1ekLtPiQ7brRRW
         FlPt/gSK6KeAUQSOhmxHLooNlAYQbS3U6+Ew5kHJdbLuNiL3jgcb0SbPEt/7KNUnRdUS
         54bhety5s+1wF2wQ5mHqJ5i34Qzytg7UuOWWGqBJwq0IQeS8B3HQq6h0WjrNI1uJiVLI
         zgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814850; x=1789419650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gojEDyDfYLvhRqOvL4tTAlYlPBK48sUhaWTtz7U0ImA=;
        b=B9i+IfBzAqt0kHWI/ZbaphP5PuXZdsf663FPY7j2ScDKKu6515h0lsvJqxfKnxTQW7
         YLOjt1l8TTFgcf9Uo70c9qGwrdWhYzeOWQoCpBKIFxrKBMKsCZAsD+V2aMFd8musn6E5
         zyJtfXN91C44shNF9rCuG/RhvTL36654vmJJd668WcCdHLKcEUZyhFkYDf8FdPw+qPCB
         twdShgwCWYsLZcIGCU+LciawWF3y2hrvgshJ4jXGMzDQGGxAzDDZ/eGSfGxJNBskpBF7
         wOH4cEfAvCvJsPAcH35f4RVydFBk+rHrRzoOpbYB8qSYmyccnP1D8GrpT8JX7l8apFs3
         51fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZr7jSL0xqg2ws4V4dsV6BFYNUWfW1C2Tfzqz9yu6Vb10NTdjuAsy7+n9Zj8zIX0602mvhIqjG4J7IHwI=@vger.kernel.org
X-Gm-Message-State: AFuF++nhIUdGkKRKRX9hHis8c76a0uNAVfMQOk1lUhhdRMjHovWiJ7XB
	J+urMneVz7S8pjyS+S7rf2m7YPtbjvr4YCRjWar59pTeovprBPgdPAjF
X-Gm-Gg: AYBFou0RUJiCiRdWhH5uYVkOxwbFVodKyhjdRcrKJuJXBRzvuQIkJvVTvkVBvCYKf1u
	af7IMzK5lH66Gy/+9JJLw5DmNd2Pj9T62MsdZ+YDhxZ+fjUR7sXSbO3LJ3DiHCFFE9kk+3gdAKM
	S0Q9OTCB18TO6vsX627HgO8NLTqX/+oNcJnMFFdMjuc9UUpvqp/e9ZVJckH1pT4SxhitYj9GGNj
	ms9e2QmLzKbqhwPbbiI70rbTgbn8H8mirbP+wTRIy21IR9tZc5LnKHZQdBeM1FPFItmqrMwNuG2
	UOrDqcgYHwVECUwvclQ3451tg6ARgt/r4pmps0Lijk7VqvbXfvh15+eEaI9hy8LdHYuPrP5r+wU
	/6VuhmeUA9uE2c9nzGm4np+8jfN3fYWIW819hCy8uujrh2XMMIlFbP8rbLnZt4W6KdK/R/hI+Gb
	JpZHcSHZi4xgW0N/LsQbvrnfZB2y/OOUdTGSmmn2ilbVk=
X-Received: by 2002:a05:690e:b42:b0:66f:c1bc:4022 with SMTP id 956f58d0204a3-66fc1bc4989mr4613793d50.79.1788814849738;
        Mon, 07 Sep 2026 14:00:49 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8894sm8855998d50.1.2026.09.07.14.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:00:49 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v2 0/2] Add support for AS7343 multi-spectral sensor
Date: Mon,  7 Sep 2026 14:00:40 -0700
Message-ID: <20260907210042.32552-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the AMS AS7343 14-channel
multi-spectral sensor.

The sensor has 14 optical channels (11 visible + NIR + clear +
flicker) in total. This initial driver supports reading raw counts
from all 12 spectral channels (11 visible + NIR) via sysfs and basic
power management.

Not yet supported:
- Configurable integration time and gain
- Interrupt support
- Clear (VIS) channel and flicker detection

Patch 1 adds device tree bindings.
Patch 2 adds the driver.

Testing was performed on a Raspberry Pi 4.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf

Changes in v2:
  - Add the LDR, the interrupt pin, and the GPIO pin to the dt bindings.
  - Adjust the default gain to x256 and integration time to 50.1ms as
  recommended by the datasheet.
  - Use read_label instead of .extend
  - Remove all unused scan_index related constants.

Chang Yu (2):
  dt-bindings: iio: light: add as7343
  iio: light: add AS7343 multi-spectral sensor driver

 .../bindings/iio/light/ams,as7343.yaml        |  69 ++++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 372 ++++++++++++++++++
 5 files changed, 460 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.55.0

