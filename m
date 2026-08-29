Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EACA23393E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023156; cv=none; b=d5+fhaz8/8aFNEdtQUS+/7EnpXGSmnuOZr+JdYJK3o+PZPg9LTgTkHGGsPjdrduWHZvNSt2LCGeOhvfET7DMs+kf/8mu23VE68HFhiRPza51ehbsnjWwsMH4mP0/zFcFHpllE6N5lwjUESJ2ueE4rGD77hpgVJ6u+zkRmYy0cZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023156; c=relaxed/simple;
	bh=lcaIH443j7ZbU7odPFlIb8oOMxT3qKpiCDIOgGlK1EI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCdzI0B7q5o4DdFl3yEB79/8+yHLaJXD5aGBb98KbnDf+HvD2LC9cRw3AGZgktXqeUALXyvbVQqr47Z/ATprcxJVep6dZyRFB9rAHqNaCZoLn3OPed/fBPAXA7hb983KZ27xvbEEyF1Djy8L7Qo5vZCeFIGVgXBsaNBKn/5wSws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbP8k790; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbP8k790"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so221837266b.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023150; x=1788627950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nObHJJxKYbL0QP8ldGFvAbA9nLk/23W+3s2f++7bPgg=;
        b=jbP8k790cbyT80UtGw9/Gze+x8eerHeIhzUiztrr6FauVnfrpl5HfXNozmG9Emivpz
         iAQIHoqynqIfllfQ3Ap/VgPuXwVJCfCjI0SbBxf6dQ7nH+otDrPSx89mSG+rNdaaQbaj
         p3IC4ApAyuerZ+oARZbi2oWy/7e/5fz9bp8UkaImnBA9OLM+2m2BR0dpII80N6qCnE86
         WAT3zKPNPXq2JApjQgxA+qMox/7t9Rd8rN8yqb1JElJsPO8WfOaeOurRcMthgFn+GTb2
         FXoNXcBeoRd1lH1RZEi0TxK82G+gR5GVa2iQZPv56L9b2j/spjJQAjPyhOjmrDFnfHU3
         hPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023150; x=1788627950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nObHJJxKYbL0QP8ldGFvAbA9nLk/23W+3s2f++7bPgg=;
        b=E/Iw/tqkkCit89tOBePyX01aJecTTDS2W+tKrlExShimYeeDzqtJrWv8mpppPRNXIR
         1ccwL9GMbTgY6dGRVkRLhtf5Oy0uXSKbb7o/Bu2VCuRMr5XlcA5ew1t36Nwug8cFevcu
         4aFr8H3+jyIvWFbjaDnswZdUaxHXU0XoO44qjKWGwOD1LbsCGJ9cwX74/NI3QqWORCjz
         S/lJfOocFJW+T00MULqoTv/IEtKamPQVBZbPNudxdrTNY2aZ42nk7quXLQLY2GRpoWqS
         iTUlvLpJfb0CIMIZTG/4WoqNS12sKJJ0EJkCnFqG5+JPxUykujkKOziaBtcIoutc1iMu
         IKMg==
X-Forwarded-Encrypted: i=1; AHgh+RrIpEC2A5nQvtrkR2vPXZmEDy0HmSUvO8V9whgwT2gTgQ8CtQ29E+1bINxJLnL1YUw0DcK0uhv/SQnFelc=@vger.kernel.org
X-Gm-Message-State: AFuF++msL3yjsPlH7GVVzqVzcPpCgw0ETIFnX3Z7Yf2pglIkRpVoo3EH
	HXyAXsbo8Ki0AZ3DwXubU6ZJLzVQ6mPQMes8tII6HXYjz40jO7MVs9GW
X-Gm-Gg: AR+sD13L9tCT0dBhbLsQ9k0suAzUBXMpOTlHlM3ox3p5RsYeZHhO+fVKiseKWg6mS34
	ULg/TAfr9hiGVSq0WZ0nk3J7h+O69T+Jv0YXgFTJm8gt/P0FMs49f7EI6+U00xgwytDb0rDS0+u
	epARGEWO7VB0ZPz9ymLMVzksWRe1gbmHl2VZFBhY5HJ7adDgpf2glVIwMani5km1/wbGDz4aTak
	CvcJzYJ7vP+sQIwD6MoWsx3OeEf+LbZnRw/WCaMjfof49YLLZcuuvNfWumiY8CZ3EJvKOjjkz53
	CyUr7KIIm5FK9vBmbJcBcoNmTr5yvY4+RRI6wrXx3pfkRjSJabQOq229pqcLjnbacKOXS8NuZzZ
	L/iDqhGuVLmZPgO+pKeMJ0Sv2DM37DXesa4zujCU7n3eGhjPdYo9zu6+Q3u1936zBUj5IVu7cet
	cimS0FLTKlbpkT9V0V3ClWHGxCot5dEF2AvNxJKo1ytJbv+SeEBKXoAPLpcPHnGIVqyGkhHn1GG
	8Qxs1Y0Qr4UCg0=
X-Received: by 2002:a17:907:9612:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c25574341c1mr937184966b.21.1788023149479;
        Sat, 29 Aug 2026 10:05:49 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee288afsm213287266b.23.2026.08.29.10.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:05:48 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.de>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v5 0/4] hwmon: it87: add IT8613E support
Date: Sat, 29 Aug 2026 19:05:41 +0200
Message-ID: <20260829170545.33401-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a respin of Benoit Masson's v4 series, with his permission.
It replaces my fan-input-only RFC with the complete support requested
in review.

The v4 series was dropped after a NULL pointer dereference was reported.
The IT8613E device entry did not initialize reg_pwm, while the probe path
unconditionally dereferences it. It also advertised six temperature
offsets but the register table contained only three entries.

Changes in v5:
- Use the IT8665-style PWM register map for IT8613E, matching the
  out-of-tree driver.
- Extend the temperature offset register table with the three IT8613E
  registers used by the out-of-tree driver.
- Preserve the existing IT8689 behavior when introducing the per-chip
  resource and PWM metadata now required by the series.
- Combine IT8613E identification and configuration so no intermediate
  patch binds to the device with an incomplete configuration.
- Use octal permissions for the new sysfs attributes.

Tested on an IT8613E at 0xa30, revision 12. Each patch builds as an
external module with W=1, and the complete series passes checkpatch
--strict with no warnings or errors.

The final module loads without errors and exposes the same voltage,
temperature, fan, temperature-offset, and PWM register values as the
out-of-tree driver. On this system it exposes fan2_input and PWM2, PWM4,
and PWM5. The value of pwm2_auto_channels_temp is 4 instead of the
out-of-tree driver's 3 because the upstream ABI reports a channel bitmask
(BIT(2)) rather than a one-based channel number.

The PWM2 write path was tested by switching from automatic control to
manual full duty (255). Fan2 increased from about 2100 RPM to 4687 RPM.
The original duty (65), automatic mode, and temperature mapping were then
restored.

An S3 suspend/resume cycle with an RTC wakeup completed successfully.
The PWM configuration and sensor readings were preserved, with no it87 or
hwmon warnings in the kernel log.

Link: https://lore.kernel.org/linux-hwmon/20260114221210.98071-1-yahoo@perenite.com/
Link: https://lore.kernel.org/linux-hwmon/20260829113011.51290-1-jerome.tollet@gmail.com/

benoit.masson (4):
  hwmon: it87: describe per-chip temperature resources
  hwmon: it87: prepare for extended PWM temp maps
  hwmon: it87: expose additional temperature limits
  hwmon: it87: add IT8613E support

 Documentation/hwmon/it87.rst |   8 +
 drivers/hwmon/it87.c         | 456 ++++++++++++++++++++++++++++-------
 2 files changed, 383 insertions(+), 81 deletions(-)


base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.55.0
