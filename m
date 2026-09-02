Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698554772BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352217; cv=none; b=suTk4ATLQwH1/MTVU85jOyO1TeYjDi66ctxl2MF1WHf4m1byCwSPDAx1o39omW/eXmp+FNPdI9QDVnmBWoicQr+n18mu1jeYe2NIkRxn8WwxLBeEfXNlldN5GI/uqMCxMfCgwuxABnH3AVkcQnk0Uwb387C6xmlLOY5IWY7mb00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352217; c=relaxed/simple;
	bh=fhbqMdqkn0artvXK4pHg9X+4foisYN94Ym5rI08h5gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGO0/P4pM5Drx1RLGJlE0enzAgFA453anhXSrZfk9/6uF3IRNLydEkI35CgCO7ZSOcGu67LLmBwOBu/RizgblPB4BKm5CtEIKNd+9tYVozY+SwbzPGTASS/GbqS5B5nWxq4nTcF9R3hCrZHiLmWFcCEp2j8RpkrOnrngbb5rOFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R51Neuf7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R51Neuf7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-485538d3499so568664f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352213; x=1788957013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GrfRkUKuV9LL7kmR7/d08YfPlVDqYR1CQOX00PKCXU=;
        b=R51Neuf7Sl4F9v6tDnmS8k+V44ptknBY+z6Dc3Cux0L16+fXZiSmkJAAbSIJtGl3lR
         h6QM8XSoza66WMKdUvPlU8vEXy/Pye5EBuhj6XVEfS07eS/0eyQt0T7i6W9xwIlOgpSF
         EziP7YCKVMbfukPl30BIkRaPSrNv64PTE/IWPWmvcqPIg17pPNrmy9x5Z/JD0wUCVLxy
         XltHh5Sh7HplC5SyqlS6D/4huEwK5Gmge9o/ced8b0xAwoVPNISap7hMu+advDdnITuV
         TDesnR2XqQTTKjjouSAcADWKaHCDadqV8fwGr5vWoAcKY2x256J6j7cWDkq40DLLQCAT
         cOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352213; x=1788957013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GrfRkUKuV9LL7kmR7/d08YfPlVDqYR1CQOX00PKCXU=;
        b=D8lFx/KRzkp1DdE5q3e+ZbMfyKhyfu7fPfpcmIpzZAdWZ6hdvQHdDCcWmKptBZ+hl2
         msmqQmMN808MwGT5nKNMwrc/JZL6dx3ALo4DKbOgQdJGLXY8jimM0xNhDsk07rg8QZ5t
         qF0nq085eVfst2XWGYRuQjyRBqMpZDt9iXhjt7SRjULAaEvZzK0Jcn4wPZrR6TPDYfMN
         3Yo97SFkyhMIHolOlowi6B1BJ+P3tc9vcUaFELHRKukD8lxPNINhOH8bfNDRNtDTTRey
         gU3Z/zjDSYgWQ+FcASibhn82UZOqPW9oSjlyoxqVjfoQZHjSkLWcy3VCNzYsArx/MouV
         T80g==
X-Forwarded-Encrypted: i=1; AKwUvBx+Pir7I/WfgKRTyu9rWE4xn1m1tZcsCDOh71+1oDMhOklaKq4/PVZOgtosxifCrOd7nhlfozTNciMDVfU=@vger.kernel.org
X-Gm-Message-State: AFuF++n86DoMOYwHG2ibih50dXEsewPOGQUFky1mn79gyfdR2sucGRS0
	LtDfZm0viX1KQ2XeMNPnlCZ6lu8vnojlf1mwYP644vXfdx0/FWsV9y0U
X-Gm-Gg: AYBFou21ELU/rxEcZMZ7mEKgHMOEJJNf1Lu9tUA9jVBMFs+rPDNZ8XdHkK1BQHMJ6fO
	hrAzT0kReeQN+GTCP73m4EOlupUAF/OjOoSbgJ3VYT2gprY/YUfJIew+UxmZYj3RB7zr7ofPNG+
	aYZI19OQA8qWsOghH754gr2sQHTWOYGjgSm9pAWqg93eJHVglRLxQazaWg+9LSfxFGiiHBNBzU8
	YaO60ItM4FDqc9ww1IGJ7omFSCY1ks5DzSY97y3jqAEbyEc+qNxoHiqLoqEXtQlPpoyoqS6FUnA
	U5witp23dY1dAfKv+C7p4p4U0XeGOqAL5qwmxF0bwQlXpHVXmqyBVBfDkBObxuhMJ3Vv2RF3EU0
	5KyVmbtE2/pfL+/DOyaPcmWuWV9/oi0JE8sz+fTBuCSTITD2TZ2/Vwru74djVZNxmX2IHt/sEEC
	0hLU9MYJCd6zsHIuKHImc6XP+8i4C0SKA7cnxLKCrZMzYrSDkkyjTA9UW5OPZOI2gP/Z1OZ4rsF
	KiU7NsMDsOcO+XBnPSte8tlpLa+n+gfVTpLNMoS32fdG2upJ8RY2Q==
X-Received: by 2002:a05:6000:610:b0:481:5021:33cd with SMTP id ffacd0b85a97d-48488deb4bdmr7632088f8f.3.1788352210744;
        Wed, 02 Sep 2026 05:30:10 -0700 (PDT)
Received: from 1Z10 ([78.211.18.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7fddbsm5824276f8f.11.2026.09.02.05.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:30:10 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	jekhor@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Date: Wed,  2 Sep 2026 14:30:05 +0200
Message-ID: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
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
The tested configuration prefers SOF automatically, while
snd_intel_dspcfg.dsp_driver=2 selects SST on the same kernel.

Cezary, thank you for questioning the v6 statement that SST had not been
validated on this hardware. That statement was inaccurate: it conflated
not revalidating SST against v6 with SST never having been validated. v7
restores the dual-path support and now includes separate runtime evidence
for both backends.

Changes in v7:
- Restore the SST firmware and board fields in the machine-table entry.
- Select separate card identities from the firmware parent: SOF registers
  as "sof-cht rt5677" (ALSA ID "rt5677"), while SST registers as
  "cht-rt5677" (ALSA ID "chtrt5677").
- Retain the v6 removal of snd_soc_fixup_dai_links_platform_name(); both
  backends register and stream successfully without it.
- Add the matching cht-rt5677 alias to the shared Yoga Book UCM profile.

The matching UCM source and package are available at:
https://github.com/Yoga-Book/Yoga-Book-ALSA-UCM-Config/releases/tag/v1.7

Validation used one 7.2.0 kernel built from the exact v7 source state on a
Lenovo Yoga Book YB1-X91L:
- Automatic selection, with no DSP override, loaded SOF firmware 2.2.0 and
  sof-cht-rt5677.tplg.
- snd_intel_dspcfg.dsp_driver=2 loaded intel/fw_sst_22a8.bin through SST.
- PCM0 playback and capture plus PCM1 deep-buffer playback passed on both
  backends at 48 kHz stereo.
- SOF passed S16_LE, S24_LE and S32_LE; SST advertises and passed S16_LE.
- UCM Speaker1 and Mic1 routing and PipeWire playback/capture passed on
  both backends with alsa-ucm-conf-yogabook 1.7.
- The built-in speakers were physically audible on both backends; the
  internal microphone produced non-empty stereo captures. GNOME Settings
  speaker and microphone tests passed in the final default SOF boot.
- No ASoC, SOF/SST stream or failed-unit errors were present after the
  successful final tests.

The v7 series is sent as a fresh thread and Yauhen Kharuzhy remains copied
as co-developer.

Maurizio Casciano (2):
  ASoC: Intel: Add Cherry Trail RT5677 machine driver
  ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_rt5677.c           | 647 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 4 files changed, 671 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c

With Best Regards,
Maurizio Casciano


base-commit: 8a070652d9194babdd35bf7cbd2c6722b441e8f4
-- 
2.53.0
