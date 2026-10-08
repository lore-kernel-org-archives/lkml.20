Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E9C49890E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465002; cv=none; b=WHFYhOQf3sDc3Gl6a9jquWIXl0hoFJVjPqWVlnEqScnO3cZ3uG20SfGsHDgT0LW1f8MVzLczhnKQHqpl9fZbg9dB5nYpzBlo3NpXx35BZ08wxDd3RdFUuND/3v3bEVPJgMGrN4n2Dl8DEJO9ma7aA9egLiVy+XxZiyRy8LOTvX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465002; c=relaxed/simple;
	bh=SW4l0cDJ3LOi8NpL5PTyGXY7ehD370t12/dRJIqodm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rKwJ2qnI2pR1s5YOFy29bKREkfUodYKWCSWxQarosmyee7sTisd/WLRMZGOr4nBH/SpQdx+tgn11fjvG09WwDwy3441ZBPsPAi/ouQ925RoIK/K2RaP+THkbWnjq33KwuooaN0ijs7BGY5OR059PZd9k/9wGWTw1qHjRFEjb8Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZC9qKxCR; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZC9qKxCR"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc758830601so3449382a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465000; x=1792069800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=42VIe5QqLg9nekHrsGmAKxJBRJzVEjE2smW9oVx4DL8=;
        b=ZC9qKxCRVrehAdZyTdEbsBSS+CJd1AW3vxeNBKuotpob+mhlEsKTyW73F7Vh7oR+Pn
         +rqQpPNQC4B7jEteS3/PSUJjISaHlgCochi03C6orowFhvXpCwB7UAwhal/kSGTOFX7W
         8rD5T4nLTdLTaj+VKlqNShXl4GJKK8do9GkqH1ZTsgoS6vuMNdMKLK0qRx3xVfNtmNgY
         jZ8hwuhifAiF18aViNmRKTF7H5K+/wpa38i9bOM3SfrpGGrEVJT/94kx749NCIvsNma3
         8P53gXNHesQ133dmkQLjQ8rF9zbayzn4s6HnfmVrGhAKg81KKUsYkVXMbCvOpMaMuX3V
         jb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465000; x=1792069800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42VIe5QqLg9nekHrsGmAKxJBRJzVEjE2smW9oVx4DL8=;
        b=qnQn6Wxf/AbJLKhiYyt1Cg1OvOBRFPgBJybiLr5GztRWElRfbXLFxNcLY46d5SGq+x
         V6CeYD03ywyPajm+YGXOrv2pwPqXo9JyH1/xPwob3i/r8xxGRG2VGuPmETEuvc/TMJyx
         Crv3ZmOmctX3OBe1WPD0kvVK84SZd9DWCxopzLoJK65CEsRje4qpWukVcgtbNVAeFYqa
         z3cAp+pzup3KSHryl/sIFD8zIgfyULIxw8IO4GAnZsfzVLNJFq1tLaig6jebXUJdiOMa
         SpMp/Ctop+2+zk6os6cHiP130US3ClOKNxNQ4MjIsr4iZjL6V6vVQVBCnpjOFZEn2Qm5
         0/yQ==
X-Forwarded-Encrypted: i=1; AKwUvByLy9eKohdCLS+qMyHMkqjnuRfrgnoDOmgXXrt192Bjjf8qkImaHHORPKKJcICPNmRohHkywA5HFuALS4c=@vger.kernel.org
X-Gm-Message-State: AFuF++l0XorqYPfdkDvP0KDwmukhpvYWN+kZFtTnX7Xt25fncZrsHCZ3
	iHKHJ6NYW3aHI3hqbdKT6jRhMmVtDtyn9211aD8rteP3+Wzi/PLMPgm+
X-Gm-Gg: AYBFou3C66S55vuGaEG3SfDUxgjh6hMajBld/vGQ670L6i595/L2xrtT+knhtO+bTRD
	ImSoBqQYyfScRlAOG3x9XSVyOC3wRWDSX5JXkuw87npxJgdmk1E8u6FN8Sji6ggejLg0LYR7Jqo
	TLuDO9Sf6fOxwprQnC6oerLrPhnIHYC5w/OzklPMj7bH/cONSLEFIIkQaaleR3NtVj/9aPilYM2
	iv6S5wZ57lDJBra3tAvg3qXRgndFc/88TVIrAejGf+eItKfRJeKA0zs81w71/uaN48581YX9IRz
	qqsUX8V8FV/STSFp2oHs0biEgC6i8V2AW4/UqeaQ2zAHD9tV4F/xOoClAKT9S8qAF4bAfvxkfzg
	IvTYQBe3NmhEfU8TrF95TtpU6in2r7kQgoCxcQQDT1lGE/KRo1Rps0pi/zw6vaZbJIzMcG2gWKz
	8AkqW/eder92NYVsGUTO8+H1xuB0+0ZCHHsOoQOAVuxkRNd3ftpIpFUpyKS73W4x5fZ/vlF1pzv
	yv1MhLM6kZEJBFU0KwStcls9w3mTUOZZXJHjHItiRsfe+o8dkaQUh38cP7D/roNml0svQJHOeTT
	GZ9RmqZdew==
X-Received: by 2002:a05:6a20:6a0e:b0:3da:bea4:622c with SMTP id adf61e73a8af0-3e1340069c4mr4940719637.19.1791465000125;
        Thu, 08 Oct 2026 06:10:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:09:59 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/6] ASoC: Fix controls that write another control's bits
Date: Thu,  8 Oct 2026 22:09:46 +0900
Message-ID: <20261008130953.2446692-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the es8316 thread Mark suggested checking at registration time for
controls whose register fields overlap [1]. Before adding such a check,
I wanted to see what it would find in the tree today.

A script expanded the control tables of every ASoC driver built by
allmodconfig and looked for two controls in one table whose register
fields overlap. It found 80 pairs in 33 drivers. Most are real bugs.
The rest are deliberate, where two names drive the same field, such as
the AC and DRC mode thresholds in sta32x.

This series fixes six that I could confirm against the vendor
datasheet. In each one, writing a control changes a different control,
and the bits it should own cannot be reached. Most date back to the
first version of the driver.

One more is left out on purpose. The cs42l56 ADC Mute Switch writes the
ADC invert bits. The real mute bits are also written by the
cs42l56_mute() callback on every stream start and stop, so moving the
control there would let the stream mute override it. I am not sure
whether you would rather move it or drop it.

I have none of this hardware, so these are checked against the
datasheets only. More fixes, checked against the register headers,
and the registration time check would follow.

[1] https://lore.kernel.org/all/0fefbfe1-021b-46b2-8945-15956e75e37f@sirena.org.uk/

HyeongJun An (6):
  ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
  ASoC: cs42l52: Fix the NG Type Switch bit
  ASoC: pcm3168a: Fix the DAC zero flag polarity bit
  ASoC: max98371: Fix the Speaker DHT Min Volume bits
  ASoC: wm8978: Fix the 128x oversampling switch bits
  ASoC: nau8822: Fix the 128x oversampling switch bits

 sound/soc/codecs/cs42l52.c  | 2 +-
 sound/soc/codecs/cs42l56.c  | 2 +-
 sound/soc/codecs/max98371.c | 2 +-
 sound/soc/codecs/nau8822.c  | 4 ++--
 sound/soc/codecs/pcm3168a.c | 2 +-
 sound/soc/codecs/wm8978.c   | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

