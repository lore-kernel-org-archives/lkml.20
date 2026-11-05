Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919818;
	b=TKfbHi4CQlHPhmzYGxRLIrEsUmDd4rKy0Qe7R+bE7lfqZiHP0Rsq3aAvLTzSJZhAI0k+
	 peA8xKYaZtExa84M54xoxrh6DJ/wtApdwx9lfpCAQuogrbnTRkwV5wS7D0/XGdNNongww
	 wkZxvjz+a09QvNPpU1MC3pvw6aD8UVsW1qvlFfNLpA5i/ITjQVhnyrpPyRS1mdC3ckaRk
	 3adpTc96Gz57BNJ7gIb+5CuI7OLyyKrGs1wHl9toE44f0TLI5yapmw7TZdGLzcroUdY0O
	 +gtOp9mY/OxZr0bMJQ92x/e8qtDWl+b5UaptYa0CnB37egvj/wu/u8FSvFJBcW6VA7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GMEbp1fbDq/VpyUQIEOT75Vm1u36/6yC8nJytk1iDac=;
	b=jZWGedzpkBjcKmU38EhzKH0CaL3/3CInnisF5BjW7TFO92SY3tsDfRcbO5HJeP1BP8/+
	 VHrV4dtsa337m2wlDBr48BfwxcpKYHy/GjxMmwlTgcPQAc3QcqOal32IBDo2gDXTKeoxE
	 KbketEf9J8zY1+SmqncyUp4jauN0GTHDKB1mJ5DSM9aabBeV0ix8KAz+2ZCgynLdWe/n1
	 aKB0Qkc5tV7W4zqsI5dlE0kN7GqbybME57wwc+4/IMSZwPLi27vLwmYh83gGEzYlGZ/SF
	 XSIfqZwTMZ6ttP4cgjUJNZLTMWkT2kho8CcXs3uuHyxD78utC6YfzaMFvTgPwsnFsVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFFycAb3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE1606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48EE1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFFycAb3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so428935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919817; x=1794524617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMEbp1fbDq/VpyUQIEOT75Vm1u36/6yC8nJytk1iDac=;
        b=GFFycAb3t4tTdKVmPcwISri5rIXnEwUjB/AayPPFL8duhmUJZ4+jBr1SqQKHFSpAkj
         sJU2LDKcVAEw1PMylTLU0KYEqOMGlDr+5wbHAZuhZGlxCH9i2x/u7YNt7roYz+9NpJN9
         iIPRjjl+pVT2t2Jr0MdBKhGdFwUPsqkXzg6DfXlBFoLPL+M5FvHSpah4RmMQFEfvSmdF
         amfdRzcLP05CxdW9u2OJdgRAK23+PLoKg7tcBvuWiArxqycjYr6zqs9J2rZDAGqHsKPO
         hWCx9glApHcCbYNYiDyfCdaDA9mOc7h/TO8EMTgmU9mUpk9wKTA2rlp7k7OMog3hoHcy
         3kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919817; x=1794524617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMEbp1fbDq/VpyUQIEOT75Vm1u36/6yC8nJytk1iDac=;
        b=OHQfw/v+uxIrfYrfZVekGduzKOLP9As7ETrEOhYLIuQ3WZ9Qk10WJ4lgnuulS/JSUW
         0SVlLR3cOW9X/Mlc+RmfhuKr9CS6tWkJQuj3ooMElLa5/EczN4f8TD1mrqbhfChENWXw
         yVJ5fOotQxQW4fPcU/1Cfd27Qr+hszCtODdKcMuKi9zvk+/C/dW/7VbU2cwS13JzDQdo
         59jyUzPALQvHiujhBevVJoPk+4FTW04ZoIDStUDdLHLLBkLIhomZ4j9TJNC4Z/kfErTI
         3RM3A1vdfBvnYHY13q9CTfaRDl4uzg208lfjXFSUOyzkSoTBxTSnl9G36ks4tY9aNUyw
         v+8w==
X-Forwarded-Encrypted: i=1; AKwUvBx19wjbrgQgogeFigRayBaVGKqjtBaimLRY9DJ5LW8DCVT8uQmFFcxc733d/r3nEKIutwsiRwb6p49OmVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wnlhhs3IeKwg59P4fS55euNqINVDmEElV65sxSYfE4Ba8DfzU
	Lu5p8yHY91covI+KJvYelzlXc74Q7lW40U6tshx5hzejbXgKwlXv4AQ9
X-Gm-Gg: AYBFou1KYp53CSiwrS3L/GpXaBkX5csljJBmyktNePLqAKDPXy2zDNKQY579yuT5dYi
	y2cBuI5PkPFZfXpi6FMfM5u/Yenaw6QFCMvzO6QQBu2t4dfTT1as6PWyLWKLRnqHsFpV+6zu9+r
	w3rgGE/OPhovXAt86cAeJKmkE1cLNkYHlt7zJI4gi0/aYV+fvOMO7ObaRhFsnXG+hnWJJSKcZ5e
	IFg++Ykze2mLyynPYOC6rWJ0zymImnVKr84Uss8lzgP8GGk2v49O2gG5LX26Ag4D+jdvOLuoJkA
	nSRI9FHIyO7rdkwxPyMK5v4l9Qi0xkdNZQRA7FpMNiyp1LGgDtftvXXzXnY5pXneHOtF5UO2WEF
	orMgecHdd9HdWYcuGK+Ucxs+p7LvTDCErkFDIBImD4vloGMklzWwOvOfnrnsimTyH+3BUS4DKwU
	NsyXji/KoNvFISvAFgxz1YHfG3GIK2CBHWLTAKlVfCd2IUCL01pZkoygOuOVpMzDpU4q9CK0Zcs
	VMrLm9Jyonpe6bv5y8rSFlucM8qlc0bb+mI6QSHb+gJGleCoazJ/EzvotiOdEpmiily8I5SNHbg
	20w12x0crR8jVOaYG+683PbcmcbWGvATS2Pts6HVzDcq9GLCv0Pj32WjKPyIzM/XrCOa1g==
X-Received: by 2002:a05:600c:8712:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4b6dfba8b00mr8782285e9.25.1793919816475;
        Thu, 05 Nov 2026 15:03:36 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2029209sm12267215e9.11.2026.11.05.15.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:03:35 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: ov9734: Support the Microsoft Surface Laptop 1 front camera
Date: Thu,  5 Nov 2026 23:03:23 +0000
Message-ID: <20261105230327.10852-1-afonso.figuinha@gmail.com>
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

The front camera of the Microsoft Surface Laptop 1 is an OmniVision
OV9734 connected to the IPU3 CIO2. It does not work today for two
reasons. The ipu-bridge does not know the OVTI9734 HID, so no fwnode
graph is built for the sensor. The ov9734 driver relies on ACPI to
power the sensor, while on this laptop an INT3472 discrete device
(SKC1 in the DSDT) controls the clock and the reset line.

Patch 1 adds the sensor to ipu-bridge. Patch 2 makes the driver wait
for the endpoint that the bridge creates. Patch 3 adds the reset GPIO,
the supplies and the PM callbacks. Patch 4 adds control event support,
so v4l2-compliance passes.

The series is based on media-committers next (v7.4-rc1).
ov9734.o and ipu-bridge.o build there with W=1 and C=1 (sparse from
git) with no warnings.

Hardware tests ran on a Surface Laptop 1 with 6.19.8-surface-3, the
linux-surface kernel. Patches 2 to 4 apply to 6.19.8 with offsets
only, apart from the v4l2_subdev_client_info API change, which they do
not touch. That kernel also carries the linux-surface camera patches,
and I did not check which of them this result depends on. Patch 1 does
not apply there because the sensor list differs, so the same entry was
added by hand.
Results:
- the sensor probes and the chip ID reads back as 0x9734;
- libcamera (IPU3 pipeline) streams 1280x704 at 30 fps;
- the sensor is runtime suspended when idle and active while
  streaming;
- unloading and reloading the module works with no warnings;
- v4l2-compliance 1.32.0 on the sensor subdev: 46 tests, 46 passed,
  0 warnings. Without patch 4, the event subscription test fails.

Not tested:
- a boot of the posted base;
- probe deferral at boot with this exact revision of patch 2. The
  sensor binds at boot, but a deferred probe is no longer logged, so I
  could not confirm the sensor driver probed before ipu3-cio2 on that
  boot. An earlier revision with the same logic logged the deferral
  and then bound;
- platforms that power the sensor through ACPI, which the driver
  supported before this series. Where no reset GPIO is described, the
  callbacks only enable and disable the clock, and the supplies fall
  back to dummy regulators;
- system suspend while streaming.

libcamera also needs changes for this sensor. I am sending them to
libcamera-devel at the same time.

Tool disclosure: this series was developed with an AI coding
assistant (Claude Code, model Claude Opus 5.5) in an interactive
session on the laptop. I asked it to get the front camera working. It
read the DSDT, the driver sources and the kernel logs, wrote the
patches, drafted the commit messages and this cover letter, and ran
the builds and tests listed above on the laptop. I reviewed every
change and can answer review comments on it.

Afonso Figuinha (4):
  media: ipu-bridge: Add OV9734 to the supported sensors list
  media: i2c: ov9734: Defer probe until the fwnode graph endpoint exists
  media: i2c: ov9734: Add reset GPIO, supplies and PM callbacks
  media: i2c: ov9734: Support control events

 drivers/media/i2c/ov9734.c           | 115 ++++++++++++++++++++++++---
 drivers/media/pci/intel/ipu-bridge.c |   2 +
 2 files changed, 107 insertions(+), 10 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

