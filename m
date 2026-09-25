Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0152E737F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296237; cv=none; b=o8cSdWvAXgvv/wU6l21lo+6pqXRUAiQH1JcGM08/FI+Yi0dcAtZ9CX2Kt9saa6pm6lJbgW2D+0uvrpKgPHc9fqSWTYix4dbxzT8hNsUFqXuYFBf4CSZKEqvznYtLEzlAy0Kb+liIMq5MyNYx480+odvGjzKcWt4xYubJR041pi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296237; c=relaxed/simple;
	bh=SYUFyhH/BXX/6nJF93wJShpOJcf51QkPRK14oghc66I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8D2mM4MbS7monprIdCCz8osWo9Sb+WDDsuKdtnGWOLNY4UUpSsgN1+buIdxSsifWUKte1x71QEbrVQ7sq7X+LjnsAT5v77o/DmX80ip79UUSaqmRF0spLgRMoc+VfiD10iLV4grvP6En4uNmpF3qTKMwNn+fUJWwItqzGDpJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAlMTIwK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAlMTIwK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso1051625e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790296234; x=1790901034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4FQt/2JHKyOkWN6EVF6z/4Ft+X/t5H4jUVKjWEtOa0=;
        b=DAlMTIwKSIrbKoBkstq+JXBRlupbNxtqFF05vJa6tfhmyvC7WHKhID3teg7UcRFFKF
         KySsyC2e/zcYWYvMd0gi3N+WbGddukbMz5VeWOttuFm4Yy3gql0tIhTatqsHwUlQ/FMa
         5ZO/iE6eyXbrop+jtg7uYnGlgRUbSTytXNa/3/KzVlGOQFwrkQYKiIQUA7ZBO2tHOTzu
         LY+ioS1PacQu9It1dMXRR0dUs2MAZBT1TGbMo2TX573HDO/ix0OAFEIxIvE2tDxQ5D5p
         8fg2HlVMw1NIDDbvbG62ZOeEmrMMvHl2kVdtR/TS5ghKJP8bqKjKiWj66rMshmdGmb7p
         s/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296235; x=1790901035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4FQt/2JHKyOkWN6EVF6z/4Ft+X/t5H4jUVKjWEtOa0=;
        b=s/dSgGE8oaP7rPmzEBcWLV0b+GmTz1T2DOWcbTq6jsS8SuaGC4+d/YfWtB18jky1N1
         sNiFLZP6Qs5Jv6aPdr31kwTKQC6gZLFctaPSeHTo42q4+s03/9in6BtkkqucoH9IhKdd
         zT4InmjoIsvU+J1ZG0bQYBKcx7A/X016ru5o3UG/usgxSWTP/OyG3x4S1gs96861FcsT
         r+xnY+27QFQLrwa+9omxZEji8qFFjFtuWku66cd8tl6M7Ik3WFlE/3SRRCNVHcSnmHC3
         XNtEEiO7+yvkFHaxXS6cFWDxFF7u5+L5UxQbzhaQQ0OW2aOS7Eu6OqYLycpNhcWcktZl
         JayQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXZEm/B3L3jterD4l0k6iOj4CsORDa/Nc2zW1km3VY7w78eX5A6i5X5orLoVw6bxC6FVdMLQnEf4Yyehc=@vger.kernel.org
X-Gm-Message-State: AFuF++m3lN6tMLGAqpk6VcgyufrZoR6oXnM5AcAprwhlJeI+zmu2pzxE
	yBLGtPh49bS3VlE+7NTD90EczKSgMZpXVZCHG4ppXg22xjDz5GZ489Fn
X-Gm-Gg: AYBFou0Ru16aL9ZOeoOhzNIloWIOO1yQQYsQvOSij0AYTqYkFoUUTcU6UKfrcUbGinq
	Ubbf0Oy8qBjIs9LDemoi88SumPraxoX0DQuUlRAfFUsAnXhennjz8Ve0NC4CTbMgZuArcd6h3l3
	7npcWkAWdmnMnrkxu7usJkTbgjmFd8jr/cPbl5WcWj+DXDOyawNBY6qzW4/4f75f0A2wYf+kDKr
	clzh7ssNKkqcnpo/QfkfQjWKnWpactV1NE3/CxXTPTPA/qfpAG+V1G4IS+IV1u35QMhIK4ZsoqG
	6RCjzZOi4Ua8NO4dxoZFAExWVo7AOkO9bYfSL/DDYEL7L+/h2iTmr4FzqtEoMqEg1sNuxe/vdTC
	Af8FoaZWkYIoZFDfUqIMriPEzCaw6XRA6cu1dKfxQcY+KMU9/uPZJ5IIbJU4+MayxEyoJe8J95S
	b8J9nG0TKdEx7J48GBf/tIrgccG2wcJfzPBgvltKLt+KxwnVpSd1DfVGrMWfNDtToQlUmxS4MQZ
	rijcWF/ohvev7Z+bM4Us1DxtEidCy1A+dIviNM+jTk7szVfyLp2J5k2Oo7XSWnmPcV18Sqjwbx8
	MNqg3vSjxKQTnSxA
X-Received: by 2002:a05:600c:c1d7:20b0:49f:e897:b62b with SMTP id 5b1f17b1804b1-49fe897b890mr45450465e9.14.1790296234488;
        Thu, 24 Sep 2026 17:30:34 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm34900745e9.4.2026.09.24.17.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:30:33 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v8 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Date: Fri, 25 Sep 2026 02:30:28 +0200
Message-ID: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
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
series. That series attaches software-node properties for RT5677 GPIO2
and GPIO4, which control the second speaker amplifier and headphone path:
https://lore.kernel.org/r/20260829225729.395270-1-mauriziocasciano7@gmail.com

Changes in v8:
- Use snd_soc_substream_to_rtd() instead of accessing private_data.
- Use the ACPI-enumerated "i2c-104C227E:00" name for the TS3A227E
  auxiliary device.
- Clarify that the ACPI GPIO mapping in the machine driver covers the
  external speaker enable, while platform/x86 supplies the two RT5677
  GPIO properties requested later in probe.
- Rebase onto the current ASoC for-next branch.

The v8 patches apply to ASoC for-next at 74612d0b448f. On the remote build
host, x86_64_defconfig with SND_SOC, X86_INTEL_LPSS, GPIOLIB and
SND_SOC_INTEL_CHT_RT5677_MACH=m built cht_rt5677.o and
soc-acpi-intel-cht-match.o with W=1. Strict checkpatch reports no errors;
the only warning asks whether MAINTAINERS needs an update for the new
driver, which is already covered by the existing Intel ASoC entries.

The v7 source was runtime-tested on a Yoga Book YB1-X91L with both SOF and
SST, including PCM0 playback/capture, PCM1 deep-buffer playback, built-in
speakers and internal-microphone capture. The v8 review delta has not yet
been rerun on the device.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (2):
  ASoC: Intel: Add Cherry Trail RT5677 machine driver
  ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_rt5677.c           | 653 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 4 files changed, 677 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c

base-commit: 74612d0b448fe745e80cda87fe49ac3c102ccc1f

-- 
2.53.0
