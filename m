Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40654766BF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461872; cv=none; b=FxcW3boHtvNSNgPAxp50TRVZvMfyKZKb68FSMXMMcwRD4B7ikR/lStegrpkYdnU7Oqv4H9oXr9VMdB86Mhch5rOSYLgX0d0sMwePgDhwPdbgtG4SjW58afkmFVmj1TwaLeZLlV7j5YLEYpd3oCjgyWBOlaQ7FyNi+cCqGo94Vcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461872; c=relaxed/simple;
	bh=huYEm3HAtHnskymK5Sr7LQqVOdSLUWWrK2v7Z5zXVzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3brGyMJmDi2lt2MVBCb8+w+Ezu2gtsQEn7zEzs9Vvc4pWGIj7A//x+BjrXKCtwXfaOrT8TuisD5PCCV2YrO43gHvoCH/kfENy4oVCMgeu9GT3S017LYHD/B0/Yc2SK4a/RXe8N8jkwoFfp8ZGiUg/P5/nKe9b/LQdkhT3an+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btcQ3/zo; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btcQ3/zo"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b355ffso1766981b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461870; x=1790066670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qGtMJ8rOmaLVkBVwgGLv1rCNJV422A9E6Q4kREBYoI=;
        b=btcQ3/zo0uHer4KwRY5acEFiraCMasoh7ivDV/j4wRbQT8pFaej7mo2Ud2teOqopRI
         V/lLLadpSCTZ/pCnkWQeD/uMoAUKA/QADmyrsdyu7LCbMRL7Zsnz9EgBtKlN0SWGiWdc
         jaLFJmv8SQXlobExdWvOwp9wb22aauHsvHOjdMIZ3kh/EPRonVXIRJlm4uletJnmjsc7
         g6ZYSqRXilsG+tpNUdrEtFOLaHE0GwgwJ27i+vODTPtFw8/Mmx7iy4feQ9R8WtoKXxQ6
         s8mUwFqNMBbJHXh6rnjFYeoQfW50zzLek5AsH6BjfI28FIEyMBiZ3aX5Z3qbHf+ZVX6+
         eN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461870; x=1790066670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qGtMJ8rOmaLVkBVwgGLv1rCNJV422A9E6Q4kREBYoI=;
        b=M/RBGuy6v8CeGZls2haO7ZTMxyhZSAnRlhiP9dTegbW6nf1i87jsLTPGDYXxgwsUry
         KgNcsyR8no1x1gEwdNHo1dxIyYVmldk14qpU6iyLBWU+nyZj54d1HZiYZOId3RgxFgPB
         ETIDCJI4AjruISwhnd1XLBI2aJVQ1r10gX1EnrjPijkHRKv+tmtQ08RXw87LMgsu4I+s
         nyUmu9jWJJnqeL1hZHDoHV39xOJ88wpTGsKoqdHOZJhRWQRR9QwNf24V5dm7869QLv+6
         Q+vKKibnau6QlQjQnRJ1zOk5TXoyO4Hu3swJ4jaGn/aR/FJqKWGqiMnSsWfIMEKwPcRH
         L2UQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIkRYaYyVfx3C0I0Ew4gMGPW49pBdnLRv92QTYuOqB3gZs3ipxxEyepmlM4ZBtD/0br9bw9GVrf9d1RnA=@vger.kernel.org
X-Gm-Message-State: AFuF++kIMgCrTu+QuFovdlsexS/tViJ+mwaIuVScuqAFIHQ2NILON8sQ
	91SABxmgkGuomqtw0s1S1K8a3NJk9HFp8K9Ye1QUfGavcqP71bEQRmEE
X-Gm-Gg: AYBFou2f7Uy8hYzNqJ06Gd6wPFC/veLN7YjZUT53HWq4TMRhEZJ+FHmDfHTSu2EEuCl
	ahU9veM8RIrxQZeqh3+dL+okjYbMXA3uDiFqgOcU+DgSvuIe7Z9oC2+cSINjNtihLhzPmHVY+5c
	XpOFxFvMybFaWpJr3PvivOSIFnnmkiIK3VMI2QfO4ejAfhENBk/49nmMtIBemqnvFwa5I8d4gpQ
	aImJ4oX2W+dY/NenzmNgjiyeHrusPNasasnzwQ5Or5wAgZnDRHyJdL7g+Fnxxwzk8wBbvvkt2Zb
	GJFI+OyYGXl8i9INNvWAPx6QtYqTHdb35TcmHiDsFQihHW9kiyhkzpJXKGAUNnvbvv9UVrLGQiE
	YdqEri3iMUKurhaCsNbTNaOllMwH6ea9I0V9c6tfS3gyGrK4QCR88AgvgMk1k1CFBnTzmKas4i+
	W9yL5wttTv9OOpYfPm25v7e4DKb/8RjunKQLRrcT+j2t8k4c6igctg8e91zXvx/GjoxmOjhUAs/
	U7CrjFifKTCCuPOPgBdqLj1kg==
X-Received: by 2002:a05:6a20:2587:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3db405a991dmr13424081637.14.1789461869656;
        Tue, 15 Sep 2026 01:44:29 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:29 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 00/23] ALSA: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:01 +0530
Message-ID: <20260915084424.1007757-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 was a single patch touching 35 files, which was too coarse and would
get in the way of backporting real fixes later on.

This v2 splits it per driver, so each patch stays confined to one driver
and can be dropped or backported on its own.  Drivers made up of several
files (hda, usb-audio, i2c, ac97, ...) are kept together in a single
patch rather than going all the way down to one patch per file.

Comments only, no functional change.  The combined diff of this series
is identical to v1 except for a trailing whitespace dropped from one
cs46xx comment line that checkpatch complained about.

Built with allmodconfig on x86, sound/ compiles clean with no new
warnings.  sound/mips/hal2.c and sound/ppc/tumbler.c are arch-gated so
they were not compile-tested here; both are comment-only as well.

v1: https://lore.kernel.org/all/20260907063202.20577-1-hemanth.selam@gmail.com/

Hemanth Selam (23):
  ALSA: core: seq: oss: fix typos in comments
  ALSA: hda: fix typos in comments
  ALSA: usb-audio: fix typos in comments
  ALSA: i2c: fix typos in comments
  ALSA: emu10k1: fix typos in comments
  ALSA: emux: fix typos in comments
  ALSA: firewire: bebob: fix typos in comments
  ALSA: opti9xx: fix typos in comments
  ALSA: hal2: fix typos in comments
  ALSA: ppc: tumbler: fix typos in comments
  ALSA: ac97: fix typos in comments
  ALSA: au88x0: fix typos in comments
  ALSA: aw2: fix typos in comments
  ALSA: cs4281: fix typos in comments
  ALSA: cs46xx: fix typos in comments
  ALSA: echoaudio: fix typos in comments
  ALSA: lx6464es: fix typos in comments
  ALSA: pcxhr: fix typos in comments
  ALSA: riptide: fix typos in comments
  ALSA: rme32: fix typos in comments
  ALSA: hdsp: fix typos in comments
  ALSA: trident: fix typos in comments
  ALSA: vx: fix typos in comments

 include/sound/emu10k1.h             | 4 ++--
 include/sound/emux_legacy.h         | 2 +-
 sound/core/seq/oss/seq_oss_init.c   | 2 +-
 sound/firewire/bebob/bebob_hwdep.c  | 2 +-
 sound/hda/codecs/hdmi/hdmi.c        | 2 +-
 sound/hda/codecs/realtek/alc882.c   | 2 +-
 sound/hda/codecs/sigmatel.c         | 6 +++---
 sound/hda/common/codec.c            | 2 +-
 sound/i2c/other/ak4113.c            | 2 +-
 sound/i2c/other/ak4114.c            | 2 +-
 sound/i2c/other/ak4xxx-adda.c       | 2 +-
 sound/isa/opti9xx/opti92x-ad1848.c  | 2 +-
 sound/mips/hal2.c                   | 4 ++--
 sound/pci/ac97/ac97_codec.c         | 2 +-
 sound/pci/ac97/ac97_patch.c         | 2 +-
 sound/pci/au88x0/au88x0.h           | 2 +-
 sound/pci/au88x0/au88x0_mpu401.c    | 2 +-
 sound/pci/aw2/aw2-saa7146.c         | 4 ++--
 sound/pci/cs4281.c                  | 2 +-
 sound/pci/cs46xx/cs46xx_lib.c       | 6 +++---
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 8 ++++----
 sound/pci/echoaudio/echoaudio.c     | 4 ++--
 sound/pci/echoaudio/echoaudio.h     | 4 ++--
 sound/pci/lx6464es/lx_core.c        | 2 +-
 sound/pci/lx6464es/lx_defs.h        | 2 +-
 sound/pci/pcxhr/pcxhr_core.c        | 4 ++--
 sound/pci/riptide/riptide.c         | 4 ++--
 sound/pci/rme32.c                   | 2 +-
 sound/pci/rme9652/hdsp.c            | 2 +-
 sound/pci/trident/trident_memory.c  | 2 +-
 sound/pci/vx222/vx222_ops.c         | 2 +-
 sound/pcmcia/vx/vxp_ops.c           | 2 +-
 sound/ppc/tumbler.c                 | 2 +-
 sound/usb/mixer.c                   | 4 ++--
 sound/usb/mixer_us16x08.h           | 2 +-
 35 files changed, 50 insertions(+), 50 deletions(-)


base-commit: 2e4c9ab2574eeaa7b893c7d35b4a9f60fd681ddd
-- 
2.48.1

