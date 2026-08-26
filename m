Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E00429CC1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750629; cv=none; b=FLe9oCKd35lzLP4UrKJ8rA2coQxFMx2sFvTKSY2tMZJipoGZMIomIsHgsqtkvYjfrOMpYTuyxBAPsUPXCj0c7TidjrrzUIZvz4OG8GVh3GCbkfYLJSqat5uv6DuUzlSc6PKKZk76BlX/Y9itHmsGgZ7qbgLEnsNVZ/aSPw4BgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750629; c=relaxed/simple;
	bh=7X38G0Z4VI08zeq+bs2Aklw+SJfUlA4fk0CgX0jzgOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NZVbKcLz0+3LPm2HBKSvOmJGE6NqCtgtYon2ibbFUqOOm6GUVptZGrzFKJmFYCdfht1WkdhR5yV7uls8+/CD8fjqQlei4e4G9XE6ghGxmqzgDZmqK/w6BDPeHUR9F9YcAg5d1lnvuZO+bHR4rwKkITZjEoACwKVbBR1GHV8dnWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzC4oq6h; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzC4oq6h"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2529b3139fso71045566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750624; x=1788355424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=soL+tfR/sXZ1sbllaIWYt/dW8eXdLfAIcb0W5YoOWpc=;
        b=dzC4oq6hgwHVk9mZqjDczSSHTuq8z/TfQ+BxpEfY2yyICVyYl4wA65KLcu4bKlSAr4
         Eczalk6V43KZrpGmXG5u77MM2e11NF+HSoLzjVncfeAZsBgBytAV/EaW7UwLvIGowLjR
         NHISV4bHjmCgbiWvTcoq7BEWlSm4LgFuOjEYzaWPePSTU/wTDj8fZCoQEqPEL7nijBkk
         hNHgYRvZOsiybIZJUx+LwpbAiPWFAmfZjBM0WB/MK12n9h6razUMM5VVTB2Knek6zWVD
         F3/bKYk3Pc2IRyEaNTi959jXPfe3aqSQVPizZgt58ubAo4pt8CJFM94bXv9azkRP0XVU
         tuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750624; x=1788355424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soL+tfR/sXZ1sbllaIWYt/dW8eXdLfAIcb0W5YoOWpc=;
        b=qucDObodYSx3uUHLCS1lZ4eCuzhcmhrHWIkG5MICo0nYj2fYT9Ut/djNWJ9cNzJ2Oj
         X+Ml30nJLhAhuAHV630y9rxqEXZS/4nqVYl/CsK94xGmYdsVO+Ub2P574z/nx6gjnJvk
         MLL+pAcXj3TVWxGfPzvMQYULmioDNIMTH8TA9DArbEnoojKlMQLsw0GoEhN3O396UW+x
         diQVASzPYjlAW68vx8lz208VD1JnC4mGrxtGpSC+oVmqTAOm6SQOfN6kZGReXejs6tbw
         OEfjbWzghNjofms4bvH8GemdINPHyu5e4sWoPXK+zN1467sTOJ9ZZE4muxYi84819NGq
         g8KA==
X-Forwarded-Encrypted: i=1; AHgh+RrhlBFH3oBCZxxjWmEi1RH2wnQsN2BlCZeyvIn9RAGdCEnvmMJzB7uJBDEJ561DMK20oMW3YujmFx+uKgg=@vger.kernel.org
X-Gm-Message-State: AFuF++mRcXfgQGaHys3vvO8HSbjoa869snWgJgSMj0k4b+UdrKOSKdP9
	REFI4mN2RpCzq4izNDtiTYBE144R7WNizmPyGCPPp3h2yESmRWSXOG5a
X-Gm-Gg: AR+sD11ILeEtQltIsS6yGNlSHeW972CroX62eptqos87rpi1rRxFDv29MWn0PJGj4wQ
	6Y3lpaQMKmDdtpHRRL9y1gSEZ1E7bDqgYnXVbfMBkPq/kV5IjYxMhRVAb2+ByRPr64ULShZ2Wpn
	o9TgwE7UWY5AyZ6tRbGvWooIm088ULJcoVqctE6N5VZnwh2A8W7WAtHdJurbAd9xuGJG/KRQoKf
	yE91IPPxbMVQNOnZNH9/9XEMq4Yr6d3nm1d21GF7TROii6K3DgneZ1wB0x6UFV568+bQG3XRYQo
	jpWB9e1jFdsH03waisqh/F9n5O02+jorDIAvvVz/miVA0aksN028oKWLqqXVr+qWLa/kYgeFg1a
	Kkb2+7D9NDCE4FDXl0/fdqIuObz6CWsy+oyrIbiGYQmp/t3tMVCgV/4M7gq8JAnzzLmuSWOTPNQ
	nOX6Qws9+jnKSi12Nl9zz76foOvJsTgnjxQrVpE4ZTaghtd9MB+jLIF+5q7xagogb3q6v6xiGrZ
	SDxMU8xlS5gvkBzcMDHowhedb80Ys6lTE0r1FnzfKRV
X-Received: by 2002:a17:907:7ba8:b0:c25:2f07:6abb with SMTP id a640c23a62f3a-c252f076da8mr274159966b.13.1787750623988;
        Wed, 26 Aug 2026 06:23:43 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250f99f6bdsm376856066b.0.2026.08.26.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:43 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 0/3] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Wed, 26 Aug 2026 15:23:31 +0200
Message-ID: <20260826132334.3344395-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L uses a Cherry Trail SSP2 connection to
an RT5677 codec, with board-specific amplifier, headphone and headset
detector wiring.  Add the machine driver, the SST machine-table match,
and the SOF topology filename used by the corresponding external SOF
topology.

The companion platform/x86 series supplies the TS3A227E device and codec
GPIO lookup entries.  The sof-cht-rt5677.tplg topology is maintained in
the SOF project and must be merged and distributed separately.

With the matching topology installed, the Yoga Book reaches the SOF
card-registration and stream setup path.  End-to-end playback and
capture acceptance is not complete, so this is posted as an RFC.

Maurizio Casciano (3):
  ASoC: Intel: Add Lenovo Yoga Book RT5677 machine driver
  ASoC: Intel: cht: Match the Yoga Book RT5677 machine
  ASoC: Intel: cht: Add Yoga Book SOF topology filename

 MAINTAINERS                                   |   1 +
 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_yogabook.c         | 616 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 5 files changed, 641 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_yogabook.c


base-commit: a1a84efff65dd01a2608770d503ce297abf54c66
-- 
2.53.0
