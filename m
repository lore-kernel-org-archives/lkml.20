Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275A2D592C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344761; cv=none; b=KdaN2PbljAGSpUtGWl8qa7/IVOFnyKlYIdgWhYs42uNgt/36o1X5Xjtj/ibT4NEk9MRpQYRtqbSmFDGPNHRVFdy9BXRrYpj8tQ2K4itjLWH1qMYPmjMfIxPBbMoYmk/fhsgHlZwGpxUQWZub8vgQpY15luXVXqNortwTElHFVDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344761; c=relaxed/simple;
	bh=/Ferq4AdIpKAf0B+A5TSRSO9i/gD8C/QUeXEZbQvglE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFS+g2lezqdWD5i+P4+wQKX9kHRhg1NgWtRZtyqzSV/i56QHgDLnwLJBA99K4OHU4UlcA53kdOkJk5yWQXNzNoJCy+mJvvq72/UbZ4djW4JZSwnG5mYRcQUGhe3EVJcvlRwrdwRZgwkMzlN/buurPcp6ossECrJYT6qpTTEaZi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsGi/RbY; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsGi/RbY"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso79417f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344758; x=1790949558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+MSLj/dFY0rScen2nrCGJ6ZHZv5h07g4V+KsGuHZdM=;
        b=BsGi/RbY2NiNAnamY5VupqY/6AMH+Y3YNx50sxbZS+6Tp/UBGTKjuSsLkntYUpN/h8
         l7L9ZM4ISs6mS5OTb8qW9pL5eTVnyCx2JGv6KFeWjbjGWvRN8Cz9G+dUijbrw5OmXDhw
         ihqETgacJVtd6EIwcCoryH79t/EkUvVDOMqFQU6W9LsyQIWXKVkoCh+7yvxg0TULDTYq
         3XlXorYnQdpE9oe0KmyoQnH/38Hxe0ppyvKLSjrL/3unKz+85bmgak+fbeRcb43CXAax
         VkQtVNCjYZAOH9CU26AKq9EGbYNQoio3XrDX4N0WQ3mOfZdI4yVRcO12J7rQGTdEB1Dp
         /IRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344758; x=1790949558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+MSLj/dFY0rScen2nrCGJ6ZHZv5h07g4V+KsGuHZdM=;
        b=Azkp3H3qydbYi72rrB2Be/D0cgDhU5VDgG8qTEtA3aVMHfCWDhKAzUveJL1H4CdyA8
         eIYni3AkfJ10emMsahtdtesGxkjjAXjSusI5KDXE+k5vQ86GeNI/HdgG/OjtzL5l0Vtm
         gg+474YZLShaSFN+0fpicwDroAnBVX1UGLBAvnlHNpv9aUDsDo57BuqhsqtdKjnO/GY8
         AtcRkwFGRJKJTQ3dyz8JBO0uePnGv1a2+oxmyMN0La26Ri0vDj6Z8rVc29kASsOIFYEy
         OZBp3JjpPSSwkIM6iPUKMg2Qj1FP0fp/Xlm87JmKTTULXUrtexw5rqr1q9mQPeIKnQL9
         BgXg==
X-Forwarded-Encrypted: i=1; AKwUvBx4qC57QFr4nOaDJTxvkvs/B9j2yu/z46JYkwx0JCzo7Cwky7osk2V+lr0Ow5BCERk4fTzBf/CnRzhg1p0=@vger.kernel.org
X-Gm-Message-State: AFuF++l8O/OJyIuOwN0q+opznKm/h5u/ROj/zVCrQ0ZY53ppfktnvKk6
	gG/D7gYX1Fp4b+ZWKmC1wGFsKk2lOlklc6IbRL++ONI2u9gMcv2CTO/x
X-Gm-Gg: AYBFou3ksNc8ICK2mdIVkTqCvKylxQH3Ocu8Zhrm4xCmHHKjV6wYIiAfjFwTV0+mJBJ
	+mmwYVS8F0VL6NhnFgtqmemzPPK5/4WhEGK9iXfkdLDwwE2C80AqY2dlq0YeTfPbbnk+oicl+rg
	Lxl+QSZZCUz78/3wGebS21heFq023Ki7I1rEO9cGr48UXR0TNc5YX4sLW8s403k0EzqgnarskKw
	s6JrVBpbMKXPWzXFCYG1ZQRJ0og3Ztv5m7tSmQjdvTB8uQt3d+e0dx3AxLQC2/XnGG16iYBvk0z
	cSvCxRCj5YjxH/KMiUB5WlI0JAijJNwwA68/9y+dAK2/ev38Zlr7OJ2qnnZb5bs3XRJbMW0sV4B
	Li7vTA+YM44y8gz+0XRZHfuIuCpEby83hUFWI+SOnRJ3EJkgjSWD+0K6S0d0knfDQWj76GqPT/o
	l7i5jRTjlPoFbyzhUnIXTQm01pfndlQnazzhmCTFGYPtNXAQg0e051RAknUlnW7ulmsWde2TNet
	WqugVIcGb+llxhGKF8Ksoq6X9Eq2GaA3qWCpblxjV+I8YwkIb3p570tsKtWulH3
X-Received: by 2002:a05:6000:4023:b0:487:27f9:82c with SMTP id ffacd0b85a97d-488716f74edmr11030037f8f.33.1790344758311;
        Fri, 25 Sep 2026 06:59:18 -0700 (PDT)
Received: from 1Z10 ([151.43.147.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm7170769f8f.28.2026.09.25.06.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:59:17 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v9 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Date: Fri, 25 Sep 2026 15:59:13 +0200
Message-ID: <20260925135915.338670-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds the Cherry Trail machine driver and machine-table entry
needed by the Lenovo Yoga Book YB1-X91F/L with its RT5677 codec and
TS3A227E headset detector.

The driver supports both legacy SST and SOF. The Intel DSP configuration
selects one backend at probe time, so the paths are mutually exclusive.

The series has a runtime dependency on the Yoga Book platform/x86 v3
series. That series creates the TS3A227E I2C client and attaches
software-node properties for RT5677 GPIO2 and GPIO4:
https://lore.kernel.org/r/20260829225729.395270-1-mauriziocasciano7@gmail.com

Changes in v9:
- Restore the TS3A227E auxiliary component name to "i2c-ts3a227e" and
  document that x86-android-tablets creates the client with dev_name
  "ts3a227e".
- Hardware testing found that v8's "i2c-104C227E:00" name did not match
  any registered component. The machine driver bound, but card
  registration did not complete, leaving only Dummy Output.
- Re-run the affected-object build and Yoga Book runtime validation.

v8:
https://lore.kernel.org/r/20260925003030.1077471-1-mauriziocasciano7@gmail.com

The v9 patches apply to ASoC for-next at 74612d0b448f. On the remote
build host, the two affected objects build with W=1. The exact v9
cht_rt5677.c source was used for that build.

For runtime validation, the same driver and machine-table sources were
integrated into the known-working Yoga Book 7.2 test tree. On a Lenovo
YB1-X91L, automatic SOF and forced SST both registered the RT5677 card.
PCM0 playback and capture and PCM1 deep-buffer playback passed on both
paths. SOF passed S16_LE, S24_LE and S32_LE; SST advertised and passed
S16_LE. Routed speaker-test completed on both paths, the SOF tone was
audible, and internal-microphone captures contained signal on both paths.
No ASoC or DSP stream errors were logged. Desktop PipeWire exposed the
stereo speakers and internal microphone after the test.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (2):
  ASoC: Intel: Add Cherry Trail RT5677 machine driver
  ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_rt5677.c           | 654 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 4 files changed, 678 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c


base-commit: 74612d0b448fe745e80cda87fe49ac3c102ccc1f
-- 
2.53.0
