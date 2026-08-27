Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D21FC0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854366; cv=none; b=KiUikCUi/+sc67+YO0UgY79Wd/RCLsKjJrcY3/XGc+1Q199FX8FqATzDvm1QYnSrLJGwd5hoSz2B3YVhEXheXvPEwvY/GPb21ge5NmB/xE6fOhLF333vhCuJZwBQ1Fnjx25gUTpjCsf3q7PwlUu5K02YJhqoSZceocTLzzpFaGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854366; c=relaxed/simple;
	bh=VfBDgBywuHcUolB/YWcRwEoLGfwjCaSjkMUCi0RCP48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACxAyteJB8RrBclxPjv08QNBJ4DEIGR0+J0XesLdZG0hte9DOu1I/mhTXSCJpAK/IEajcn1RPAsv6H67lepfzrPI/4fElHE1cUOXKt2x+cyHxL9W2LSJecSPxdSKj933v5t3MlZ7o44L5a55QqUNv603FqOIJ3q9zgh+hymJCnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4Eci3o1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4Eci3o1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4815bce4652so110209f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854361; x=1788459161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjgsUEfJhTLWj4OhJtQc/ONYm7msM9cUfhdUubV3ctI=;
        b=X4Eci3o1+d2F7w4MLsfQSiWXIKpTBlZWt+hrInIHO5DBIro3F9OZ+r1xiS8FanGgvX
         Kw/+/IXr5aHn/TQ0lRvfsW8Q0mRRkhcfQxRrZDYOhg3fjXgGfYbOVF7LkFURtsDqCmbj
         bO8aOQUVgJGpTniH5k9noXQ1DZuVg10xRxmM7wdOIfU5NEloeE6P2+ZxNpNPDW54nrVX
         QeGzfsdkXv7Zj/g81Jh/yqc2IS6Hj2duKkNFMAF99uiJsnqkVyPGHcrNFkjoCCi8ELC6
         Rb9VMDx8p1HrQ9aTHAzrcSrTqpL5qH/k6j/HOE40zMiS/ed7YaziA7dEoN+0ZliRdi9y
         s/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854361; x=1788459161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MjgsUEfJhTLWj4OhJtQc/ONYm7msM9cUfhdUubV3ctI=;
        b=pGw5004A24dLogHW8l2OEJmwLcakY+Q85dsR+VuYVakb+tgJmb9f/sddpEXpCxXvst
         thDZA47an8GYlcgJBXVK6AWaFJZHfa8tXKWzd6pTNl64cAE5lAv98JASK3xLgnQlM5Dw
         Jpa5tOqcESXgFgbgdRytVbEuquvqhIh4N5aUOFRCxJBj8fEuYkE8GKsDN0gu6SQYGTEB
         0awqV8o2yTx+O7AoB22Q9ri69nvGJtDTat6ezuTZxS9VK0mKHjUhTJO21ybzjtUVGJyv
         KJE4kT6TSNDaJb3wD0bZJ4gqVqyaUeykdTrP0tg7Nv74xLH/p4vhcJCVQfnHsjPf9ED/
         WdNA==
X-Gm-Message-State: AFuF++n8BiXRNTtE3Vec6qreZ+qZva490eX83xSa4TWFyWcGnXouXQba
	Ax/E+83fl5AZjORmdGHxKrYmcTbNH75rsQEzQXAYO48yWfXLMOvOWXrS
X-Gm-Gg: AR+sD11phsz431ld3DUyiSUvRsjVKIKcljYqH68ajt2Gvoypa5cV+C4es+R1YHrbrOk
	oVRa/hg46lu7z02hxSDw7T2Z9isZzEFDsAKM666Hbl1q3rkU23lHqkF08RQFyd2CuH3lx8tC3QL
	pExuA/Pc3QJDoRW0u5qiMA2eSxAWm9Hon2WFpwrtxipzmJY3u13l7/VRlx5ElrpYoLmdcadjlq8
	Iey6+w5FZA/3EyzZOGboKVFmXO6KK1Oh0WreoSTRIKEix3jC9+PfKrYpt99FxfZco34EwVTrJqW
	FtY+YI4OxzvDzpR27jL7wp0xgzitURETNd/O6Uzv/AiUeSzAzYq17fhDHOIp8mdbu4iVsqbR0bV
	+orVkU5+P4DBAFMK0m2CeQpN86VsG0wBsjj37VkPZSPRzSczQY1lUOCxc+VWfMIzZjpJIMGDtlZ
	5E+6b56uB/1UmJoILzb148tk0v/tP+dfMx60XZw5O2pU+Cw8pz0Xxplaky1ZA6RAX69lrD7D7Zu
	g6isehkNnUVQTzZ+lgusPUV7HohK/zlNS2TeHQ3bmcBoVoWfrkp8ss=
X-Received: by 2002:a05:6000:2288:b0:47f:e377:8d61 with SMTP id ffacd0b85a97d-482f79c9511mr902625f8f.11.1787854360471;
        Thu, 27 Aug 2026 11:12:40 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm10189895f8f.35.2026.08.27.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:12:39 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 20:12:33 +0200
Message-ID: <20260827181236.2421882-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L uses a Cherry Trail SSP2 link with an
RT5677 codec and a TS3A227E headset detector. Its amplifiers and
headphone path also require board-specific GPIO sequencing.

Add a generic Cherry Trail RT5677 machine driver and match the Yoga Book
ACPI codec ID. The machine entry supports both the legacy SST firmware
and the separately maintained SOF IPC3 topology.

This continues Yauhen Kharuzhy's v3 work and supersedes my RFC series.
The driver retains Yauhen's copyright, Co-developed-by and Signed-off-by
trailers, and links to both his original implementation and v3 posting.

Changes since v4:

- restore Yauhen's Co-developed-by and immediately adjacent Signed-off-by
  trailers on both patches;
- format the complete trailer blocks without separating blank lines; and
- clear the existing PCM format mask before selecting S24_LE in the codec
  fixup, since params_set_format() is additive.

The series is based on ASoC for-next at 8a070652d919. Both touched C
files passed sparse 0.6.5-rc1. Strict checkpatch reports no errors; its
only warning is the generic new-file MAINTAINERS prompt, while the
existing sound/soc/intel/ entry already covers the driver. A clean
20-job bindeb-pkg build completed successfully.

Runtime testing used an integration kernel containing the same v5 source
state on a Lenovo Yoga Book YB1-X91L. It used the stock signed
intel/sof/sof-cht.ri firmware, version 2.2.0-57864, and the separately
maintained sof-cht-rt5677.tplg topology. The following passed:

- UCM Speaker1 and Mic1 route enablement;
- PCM0 playback and capture at 48 kHz stereo in S16_LE, S24_LE and
  S32_LE formats;
- PCM1 deep-buffer playback at 48 kHz stereo in S32_LE format;
- a bounded routed speaker tone and a non-empty three-second Mic1
  capture; and
- PipeWire playback and capture with advancing PCM pointers and clean
  PCM closure after each stream.

The GNOME Settings speaker and microphone tests also passed physical
verification. No SOF, IPC, XRUN or ASoC errors were logged during those
tests. The SOF topology source is maintained separately at:

https://github.com/Yoga-Book/Yoga-Book-Sound-Open-Firmware/commits/feature/cht-rt5677-topology2-ipc3/

Maurizio Casciano (2):
  ASoC: Intel: Add Cherry Trail RT5677 machine driver
  ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_rt5677.c           | 612 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 4 files changed, 636 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c


base-commit: 8a070652d9194babdd35bf7cbd2c6722b441e8f4
-- 
2.53.0
