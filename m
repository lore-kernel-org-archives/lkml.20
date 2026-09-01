Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE80D49DB8B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289449; cv=none; b=OYxV+44dkWc87wt2zBOQIV8L+EOGmlkVFkmivA4rVTlWtP56jw2MhYTSgAsuQGIKm6cNFjJ9A1K2F6TUCcHubnlzShCfrjnZua0gBBsQsJaH8LpbUP0m7S6CjmLfNxzQWAc58ixPLSnTZqjf9TpOLvlXMQlQ3q8ClcBuVjgEnxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289449; c=relaxed/simple;
	bh=Ch+KojnLx1nRTm3Lw+0dx7rapMhOShen6zf4qmU8y40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bst3aw8PI2pw7CVcKb/f0+Wwrj8sE62UNKQpoJsQFWTaGWFllsHzghAAC2AI/DI0CS6eYsQkRi4QpfgNkAjeAIWRh+ResFj3RqKHngBHWgWMVBC/7WlKIaUesdsAi6vCEsZ0CL73GFIbsC2KttLygnB9tSDjGJ3xCJGMmjgp624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuuENTpK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuuENTpK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48442ea8f59so923966f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289446; x=1788894246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCJexXXMQ+OkFsGqv9GRcM92GmwmtyeV26+IDyfZO5E=;
        b=YuuENTpKFWvFN7bwtpAz/rkJfRg6Rexb1EQJCNAW89Es5G/JDCdnU/tdQK/lORdxy5
         N3G8tRLI2a7pso5KnR98pg7mxkdO+LxewCr3o6jkZSAjVHF6glg2DTd5Pgdm1aWinZOc
         fcXgBJNqL/Yntf/jiIOK4WGWAI56Uk4NYQ8yk3Dx52GogM+LTEE/rsd8ZD2K74Ts0npC
         DgDGLTeXO3rcJLGbJ8oX3fIfi6gg/zuIYmD0dg+syziH2nVfur2GYUUaTmY4OM6qVJpn
         yLMq3kGDozhvHRqlcanxvbPWaw6QebwDw/RPZt6yjCiNw8NNmfRMdd8DZQWWjHT+LNiq
         YhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289446; x=1788894246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCJexXXMQ+OkFsGqv9GRcM92GmwmtyeV26+IDyfZO5E=;
        b=ded9qhTc/5395hW6HdK6ZJ+cuI3e5M7F0IOWxh4wMBFEI6LXuys7GENVcm6hN9Kib9
         bVN36Eg5MVpbkDqjJcqsdOp7SSiZWV6lDX3uckJBC7ciirTvF5rU/qksu4NUoGaO4i0t
         dWqphJVdaarOcIgNAW3D8bPFuHefBttsdNPYjruamjfeimdTrf+tpRL/Ol0qQAIpLfMK
         OlfrQ+ItZv2W+jG64Cotp30Wcn7jrHMTiq2Okjh0pz0TuN93ckEoeLwXNsmCgD6M4kPc
         GUAwWC9nSWfUNyIO9XMCrBC1jlIjSZblHIncE5loaJILeo18R/594bQPm0Ip/VkeMd4X
         lp3A==
X-Forwarded-Encrypted: i=1; AKwUvBzSjokoogjLX9hatNI2clWKCQo+TdVe1dJqUlCvgSKXIp9KM1wsHOGeRBb8ybZZQUSsmDem8Zo3QykRHrw=@vger.kernel.org
X-Gm-Message-State: AFuF++kxyyvp4/bLasSiK6SEh+5TqZw+UlxDvmdwysJNMMu9ce+A/BS4
	hF1h7BxMfsqWabqgoiSf+nT4ba2hnGECAk2WDVL/VtDwkDEV/bP1qckz
X-Gm-Gg: AYBFou30qaI6GmKyA145RmhoZZTSJu5RJ7MxmoH07JAq9OFDLL1TjycQb8fj6Gr5me9
	GB/KddNGfMXeqQ16dGomlCn2lDu9/m+eMEUfYN63dDqoZLtP7EfuELQkvzKDdBm15njdFlNySlE
	UniinTXFg0uSDhqnz2HXdDm27CzBlo/b1lXq+5hWmAg4haUnXGYPxrgj4W+8wHNxb1SFV07jKbm
	z6IOosYcNN4X8OOctHBViitu9wpgjkNV3XxFNHvEh+C5/X/YfG1+JSg4oPnNy7vUWJcc2PJ1CGY
	6um/8xxGNEpvFW/DsQtDaB6s3+afo+uGH2s57kIMwnvT3wCJnQpVpU/PVBH8EMpOrrGQCevVjfq
	DahkhF4QE44zDwhyPP4uSNL9HbODCELGfmyB7U8BwEos4YxH1pCho5OeNZklK7sH0Gy3/KeT7El
	olRs3cZ4i0Er8U860cZUVJKYxavZOu1odXtDOgk1H3m3+Lcow03bAfa+Ihed5fhOlFIvu0znbRi
	ZQ8wx+2htiJr389xqLcwtLToZy6SNmpYkUKhK7OPHI=
X-Received: by 2002:a5d:6f10:0:b0:484:3311:2579 with SMTP id ffacd0b85a97d-484421d6913mr14780322f8f.13.1788289445598;
        Tue, 01 Sep 2026 12:04:05 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm802219f8f.36.2026.09.01.12.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:05 -0700 (PDT)
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
Subject: [PATCH v6 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Date: Tue,  1 Sep 2026 21:04:00 +0200
Message-ID: <cover.1788286335.git.mauriziocasciano7@gmail.com>
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

Only the SOF path is enabled. Legacy SST is deliberately not advertised
because it has not been validated on this hardware.

Changes in v6:
- Return clock-disable errors to DAPM callers.
- Propagate all headphone, speaker and ASRC GPIO/setup errors. Roll back
  the first speaker GPIO when the second update fails.
- Restore the mode-3 enable pulse and settling delay required by the
  external speaker boost amplifier, while checking every GPIO operation.
- Compact the SND_SOC_DAILINK_DEF() declarations and remove the redundant
  card comment.
- Restrict the driver and machine entry to SOF; remove the legacy SST
  firmware, board fields and conditional card naming.
- Remove snd_soc_fixup_dai_links_platform_name(). The card registers and
  all tested endpoints work without it.

Validation:
- W=1 build of cht_rt5677.o and soc-acpi-intel-cht-match.o.
- W=1 build and temporary load of snd-soc-sst-cht-rt5677.ko on the Yoga
  Book with Linux 7.2.0.
- PCM0 playback and capture.
- PCM1 deep-buffer playback.
- Manual GNOME Settings tests of both built-in speakers and microphone.
- No new kernel errors during the successful final hardware test.

The v6 series is sent as a fresh thread and Yauhen Kharuzhy is copied as
co-developer.

Maurizio Casciano (2):
  ASoC: Intel: Add Cherry Trail RT5677 machine driver
  ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_rt5677.c           | 636 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   6 +
 4 files changed, 658 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c

With Best Regards,
Maurizio Casciano

-- 
2.53.0
