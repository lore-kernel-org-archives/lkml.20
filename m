Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197233839AA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872628; cv=none; b=FFfu5Dbyza2qdxNEu1kjyvCk9GP0531aKZi4Zgf+zsshSUciRVS7KA3UZs76e9Mtknw7Jg6hVCWTpRCmVMO9uwHcW73p7EXFRVQDGngvWmAkg+WSotTgqPYdGEi0TGN/ZHw/rJaIB5dfcv0aNtOw7zYmTCAHmxRYMpwJEmXNl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872628; c=relaxed/simple;
	bh=0IcqWLf7L8S0MlLzNjuxD0rmD8XYPScBl5AUEe9QPLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bCtuHHhqjxnnzFtR2ja5iupn3HtykSHqKTCDW+ERuqv4AsCJDSI+HnS2NbQFS5m0TpuHDN37h9ZJF+gNGC7YYH4Z3J7fLLNS46Jv7oAvyZCf17bQsnUomkChj6wTThDAHJYHJreQg815qVkEebBOmFkjh2ud2vFC+R9yEMSboQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpEyqN1q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpEyqN1q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so2374035e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872625; x=1788477425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LHKsLnjj7ap2tlzqHIXkE3UP9uvV/zfChnrGJqcK0s=;
        b=jpEyqN1qc0OZGGCNycQzDRd2ijzJgSB/2xQq+0tNO/iL38F5cfDJi/FGvgYsqVrHMD
         CAtrlcUQ0au7mGA9T3QjKbPX4RJr14Ck6Ky3OzPhe8Yl7PKetoDnptieVILVoW6QuOY0
         1LI8w5uH30OD8t0JUeyPwm7kqMFY9qhEzF3x20wGp6diM8xRG7tIndboAxgzyJFSe+xZ
         fsUQdT1qTS8fBa6Nozo7AHMde8voQkPZy4XrGtCcx0N0B1ngbl6cox/whl+6FK8ylM01
         MZBl+5ttpIOQIKH1hJ+LR8GEewU7gCIjwDLApRaNjAqf5vRqnLFn5SV3ek5YXgVo/zA/
         Fk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872625; x=1788477425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LHKsLnjj7ap2tlzqHIXkE3UP9uvV/zfChnrGJqcK0s=;
        b=eEUKV302LUxERWrHAW3A1PIw3jmpYFQnY7d1lHH8h6TkJAe4jYzuAuVDPPyXryF9ok
         3JYvhquPZsMKlRUiJjfkcVwh2AOZXkdTfUYU/18WZRr6r8Edgnh408FdF9oTpBAbSIwn
         eg7rd54yGE7eXyb+GK7Ia3NASdZfwbepgsJRFq10TZY6mFbzx2cfSCb5Ty0dzutIqfyY
         lVHFiZuK4IUenAleO9ZxiJ2S1nJmIJZS9s6KEdJXAdN6Oe5nYXvHHMiEEdWJsCtzUpeN
         ynjvsZxxF74Yws/jHvAPgtdjEcpGd5U5hy/06Cfs7xkbHqhx6YmTbXbtD6o1b4MPFVn9
         op0w==
X-Forwarded-Encrypted: i=1; AHgh+RrbIjrqa9ZziEYHyrzChPRc8+fAk6s77Sr2ybzCC35bp2oRpETJAnPspAjj24T7PLt1AFLYEcU3nup2uM8=@vger.kernel.org
X-Gm-Message-State: AFuF++mmu+CzUczRi39K0VXXFYaVznhH9VPhxsgBmBftVC/bQFHZdvM3
	fqFNG3stEjqX3MNjasHSLG5MnHz82ncXJEb3BaQmSBrqq1h1BR6Rn8MZ
X-Gm-Gg: AR+sD10VvfKY/OWHWi+fQLJVN6MGqB/LIctzQDRjh4ztMP6Xcwo1MoePCzbLA/5zOG2
	jvZpOcUpvP1odzdJdKAG6ZuHORTGj14RpBAgiQfJOgkeojovfCTKkjsfodPkSlzvZfuMaEaTWW8
	THIywwuqrpRCUR1Ez5OathWPNyqrVf2laBpgz65P+r6W+v5UvthCd2lqnD2wl2z47uTSiW/QTaG
	i/LCQe9v9mPb5jY+qlW6Xa1fz3h33seQ2OFbTr99ex1ic/ZwU73H88KUKn1IzaoWDyCYDzuYRLO
	enw98YdGrtHnY7BFs/8hrrT4CKmFcp87/m3A66qpE9aSGLGWzOyZ0s9zj5q+Sh0GR1UdAnc2P0W
	SdlmXQ2Mcp6XLz4d5Kk0xO4H095vSGE5izuTymFM/X8hrgvLH+r0tZlLypmquYlD8ANKukeJ6B8
	od5AaIRiWr/z4Xhvq/zvP5AxV9ZWK2xDwBLUFLW55/nFlXudmJ0v2/S8MHs6yW904381vqEMyTy
	JcBei1div/HXdXesJ4eU9mK6jVBiUMt+BRtWiw3WbgF
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr25378385e9.10.1787872625080;
        Thu, 27 Aug 2026 16:17:05 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f5e2fsm10900940f8f.33.2026.08.27.16.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:03 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: Describe Yoga Book haptics and audio resources
Date: Fri, 28 Aug 2026 01:16:57 +0200
Message-ID: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L firmware omits software properties for
its two DRV2604 haptic controllers and does not instantiate or map all
resources used by the RT5677 audio design.

Attach board software nodes describing the DRV2604 mode, waveform
library and enable GPIOs, instantiate the TS3A227E headset detector, and
add lookup entries for the codec GPIOs which control the second speaker
amplifier and headphone path.

Changes since v1:

- move the enable-GPIO mapping out of the generic drv260x driver and into
  the Yoga Book board description, as requested by Dmitry;
- attach the software nodes to the existing ACPI-enumerated I2C devices,
  reprobe devices which attempted to bind before the nodes were available,
  and retain the device references until removal; and
- remove the dependency on the withdrawn optional-vbat Input change.

All three patches pass strict checkpatch, W=1 and sparse v0.6.5-rc1.
They were tested on a Lenovo Yoga Book YB1-X91L: both haptic devices bind
and work after suspend/resume, while speakers, microphone and headset
detection use the described audio resources successfully.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (3):
  platform/x86: x86-android-tablets: Describe Yoga Book haptics
  platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
  platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs

 .../platform/x86/x86-android-tablets/lenovo.c | 140 +++++++++++++++++-
 1 file changed, 139 insertions(+), 1 deletion(-)


base-commit: 32e17ef088fc55858886738d0b904248e98b30e0
-- 
2.53.0
