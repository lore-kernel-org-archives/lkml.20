Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D853112B2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815524; cv=none; b=J6O3tvg7SdRGhtZdpdLspUh+CWENNROYQfM1fMVZjVu39ysD5MMZDqAbotjj6ES7VwvvOZnqbShcJcUfMew9h6AUTCrpoUYcdj717cXavOH9AKjl5MsAkDRH13MGYThSqb9KRrA5U1U8tnuD3LCxdG2B9pvwy/cFR3BpGMIHwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815524; c=relaxed/simple;
	bh=O1dbaUTVTfGbVw24bm0CdbXbY0ob+TZJMRe37OxfD20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdDtrxoBmkQGHAVgy/uYvtqNtdaX8/67qSwClG8WuNS7VzK8k66tf1gOWETl2E4DGPPKHhe/RokK8QwQJ/bPQ5D4pOQ1y1KwwUDwmmSN2LZjhipUXMiLX+5lt5seH217YHqCvYfoVr46Gg8daY0zyj5RqYw4kdzBcYUoOhKfGJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixwB++l5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixwB++l5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f96c5b722so153111f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815521; x=1788420321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NX6TVtE9C7aozz6veUYY/+cHfETuCEHSeqEpBbw/tT4=;
        b=ixwB++l57zwpk9pEPVGPKRJ/oQy9+5jbvjwAWIB2aVJwKvKZ+ujF3/cxgY+gIr7mde
         jQaPx7iTjZM5VS9wlUF2Fo1VeaZgVNuDJQrjE35HTWgx1N1eTS0SQCoPF9BpD6RCAYdN
         ylST9KjTdyK6/tsQ24eI8gGjmG2Z47HHbdEvBmlgA9a9ft7iOTF4F5FxBLF4OSptFzv1
         TqkYvxYqhMsCFvUv04cO1XbggcTfCJwP6GMTzLMFeEUBTR3E0mRsirJ/Tq8eRo7wczIS
         M0PbTOuUk+Xil9C+ER8NPaqvdyqHDgqxoL1Hw5w/adEihcSoQuzhHmfFjqFrMaifdzPE
         jHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815521; x=1788420321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NX6TVtE9C7aozz6veUYY/+cHfETuCEHSeqEpBbw/tT4=;
        b=SvhhP9QI4aBoa7PFhgI1h9vCwhROQ1yPIZmp0hvscI9E3b6TfYKXnWgRnxyHS6+iGG
         7W6EXrofSVwUVauh79t/BVZQVLeC5SwUHatwCAr5KbSuOvb88ubOVakvf8Z5RJDYPU2Y
         +4PJq6ZX1tbsWxF0bJGIn7Eu+cCkk0mWLDGhuB1qPwzsMmMu7lOPK/5/uZ5BmY8QUuFY
         zg7RnKXXryKohxCBBarx+KhFEZ42fxSN/YjpKpG1CFDr3kWf5UjkMEj4sDRXtPljSID8
         iCzPsM6B20tDkA67aCuS37/PFNekLuTJ8uMVwNYikfp38Oagbj8FXxsFuAPKpok7WnZ3
         RKbg==
X-Forwarded-Encrypted: i=1; AHgh+Rok6vUywyUWFHLBRP/F60G8OsMQLWzh3jaViPCzP4kgfDbaVDgEvga5OyibGymeN4F3XSTkoSLjMoQHEtg=@vger.kernel.org
X-Gm-Message-State: AFuF++nZym9opsN6fQ43WrKYBoThjcn92hMh3zwxLmvd+nltuh0Oeehp
	S84wGAA8gtQWn7ElNzPvpibl20u0du0aWdd2MnLuFodIiRjg8YZyihi3
X-Gm-Gg: AR+sD11faLOh2RZyH4np/GK5inSTeD/0hRcfKxjHWKCbC2GTJN19TrmQPiEi+Fl1UtN
	vnnlKC+C/kyYy7fjfrbJ/aIxhznpKkF46INL2VN2jIRmFmuzMMWObdYFq4KUj0AyoIKqTiOWykH
	iOznMd5wPdNhbcynq0Tl4JEH1xEx0nQtvkJCNHZH+PFuN77afdyQyu2baRwLDMDOo664JCpXKPC
	IRtYrBULv4uvY88kK5AstgtMqXUufwVu+GTeYf5zXb2I0VeRC/xTtl/Fba5xK9pqCPYyJblQib9
	0o6/jGmM3a8Lgl/U6MDUKRUg9JqY/XO4JYCFgzKyqzR59avzZE88xs635gZck++8TmzibnvQiYC
	hAGwQopLOJ1edMjn558Y81TlaTebjfciQ3bl6jyUXM+mRq2Utav3HH0fzf7GblvQzKvttiVL7Tu
	qLfBsZpGBf+H1MJbWUZUmJ0UjUu/+1+/jtLW9Hi1a7tTqjCyDiVfa3wtpbp964QrIYVbEjpv2u6
	mU/mrf+fXsf+rL7vO6E564SjvMMoiSBL8Jqrz8YfERC
X-Received: by 2002:a5d:5f84:0:b0:482:f2f0:ca3d with SMTP id ffacd0b85a97d-482f2f0cb3bmr3192749f8f.14.1787815520675;
        Thu, 27 Aug 2026 00:25:20 -0700 (PDT)
Received: from 1Z10 ([78.211.107.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbe1dsm7270686f8f.22.2026.08.27.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:25:20 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 09:25:15 +0200
Message-ID: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
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
The driver retains Yauhen's copyright and links to both his original
implementation and the v3 posting.

Changes since v3 and the RFC:

- rename the driver, file and Kconfig symbol from Yoga Book-specific
  names to generic Cherry Trail RT5677 names;
- clone the card, DAI links and link components per device instead of
  mutating global templates;
- allocate the headset jack separately with the device lifetime;
- unwind MCLK enablement on PLL or sysclk setup failures;
- document the codec ASRC clock selections;
- add the complete SST and SOF machine entry once, reducing the series
  from three ASoC patches to two; and
- carry forward Yauhen's copyright and provenance links.

The series is based on ASoC for-next at 8a070652d919. Both touched C
files passed sparse 0.6.5-rc1. Strict checkpatch reports no errors; its
only warning is the generic new-file MAINTAINERS prompt, while the
existing sound/soc/intel/ entry already covers the new driver. A clean
20-job bindeb-pkg build completed successfully.

Runtime testing used an integration kernel containing these exact v4
sources on a Lenovo Yoga Book YB1-X91L. It used the stock signed
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
 sound/soc/intel/boards/cht_rt5677.c           | 611 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 4 files changed, 635 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c


base-commit: 8a070652d9194babdd35bf7cbd2c6722b441e8f4
-- 
2.53.0
