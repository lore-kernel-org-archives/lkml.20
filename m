Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491524;
	b=DZ1Ldem9lA1edAVK29/a+t49KV3JLPSEhsKjXfJcFAfXPMMhqGVeuhgpEW4UjfJ0SsKa
	 LRbABk7Org4LvFUdeuSRufoDJ8J12UostgXnfuBUVvtF0bif8SRXL4A6dQZLg0vDD82on
	 PT5l2wWDJxY/88Fgxvn1mrIi6NkyIZiRR6WnfJ0HtWHuWjbouadkEWGuP2UMNDxKOHT4s
	 AqHdaIbXccPrfKO0B2Ft5USz019ZUOymdq93R99Ouc+GzJfUEUVxQJrXff8klj46BT3Xp
	 PCpG/PRwNbra0AncTz+IrF/6RJm6jnj2z1Y7FLIm+JHPAmTsp2gWH4ObzAbjmqOcwrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
	b=FU6xvrqyIM87sF9rZQNBHy20zBCvYmfgBbxu2yieLat+Y+JN9hJYMDUeE9xlRLwnNLve
	 Wpp6z5BuBZjDWcdMqvO2CVU2MQP1VqgrDkUCyJS3Nqd/ySy/Yy2QfnzMp+l/pDGI42B16
	 4zJnweLfUUqbjAmAaTwblWwWLeiBMDV0pa8DVVXEJZQxeiKfaiTDeb1cvJ+raMfyMYzBZ
	 z1V1/f+D2nj4gGAEHuM8u3W3zcZugh1PxOQeEwO7vYHyTtNgWNyWmSqThB0eHip28lr7B
	 aMSxIki/tcX3tnlDqCWz84akU5FqRNgstA5eOVvFjsbnkbBirOX7Yn85wG0Xac8Qf9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMS5SmBK;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B5606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43B5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMS5SmBK
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso16530605ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491523; x=1793096323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
        b=FMS5SmBKqmR3FOeqRu9NPrVBF3sRL7+sasEaKIq+pZErHIsInCvmt7/abw7PBxiO0b
         /kcXmODuJJky7WdFK3b7Yleqp5ab6o3+YBrBw9biK+8blt5RC4K1m6cHxISUY8SMOsBD
         5OBWDi08NGprHsWOpf2kTZWHdna5ZnyFKqtT/qXO/Rrkz26GGfHzJpP+D1G8up5SgT5d
         n1Xhy+6XJXVAx9pNZBTAs46c9QiLYEh8wde20OfDxsfqySCjqN3btgHlluDOt3Uw91go
         O04Xy8U2pLdq/VKK4tEqGfyvR16zqHaUkZ1hQWNzImnIa/yn2DgFHT6j5siiYQeVhogK
         Fb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491523; x=1793096323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
        b=s0Cq5vjP95kwYPBwt5tsTAQIWJbiZyakjgOePQHaLhlioCC4kZf+B3ze64jfog8jJe
         zw5VEwOweoWj9mOt0AOMQmGG5fyXnDmZYRrvfB5yWFgyAFO2YFTcBGXRL8I/ZYI0aBUg
         CMyzqnXEw4F36b7wOGNWx1ubsHXTSvR7/8gDP2obOiegj0+gZzyLcOgXJ17OTMV4vyyR
         1Q5YuS9HsGowaUC1Gt+/OsVwJDbijidx6xMyznLpTRKg3UQhMFkGXdu9xQ9ujcSHDcm0
         xlBMlXA1qK892IFDMs+/XM3OfMpcTDJ938e7Mf3KICCK8LeZqz4v/mumbxTZ/WmCQjc0
         WtYA==
X-Forwarded-Encrypted: i=1; AKwUvBxSY2Ytu6tggP3WT1a1Sd9niAcaNoU660n+aqVjpw+gt0hvvdgZ6mjpP8mtVWW1PxwXgUt6/QdoFoLgXOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYICe8gjhUOAZ6NfGl4APXnuosNNzcPO5D/9iqkBsUXyX1Of1Igk
	hK4FXx5oxAiysYUPP9CTsy9uXOR/j7xaS/9GHtfVYEgf/UHc3fXAnbzt1ZJyjXv6
X-Gm-Gg: AYBFou3QK37+vrKf1Uy+/Vapu3q91PKmJkCS4aHWtisgyE2MZbiXWh9cOAaKvuDJECN
	Mt01jCJ6jIsbbZfDhJ0VBA7M/krfuqGJ5qgiypO3n2sp+J0AM8asAbkf/O8+SS1b2YFxkLv38J5
	qqVb6vo7i9V+MZy7HGyMk/h83Gcm4S4P7+tqQKAj+o+fDNnhQtLIv4EBnOHRZ/kx7xRZrmVlX4+
	pauTyM0DRz77YHZCU6s4QLaHCrYtpfjmnE5oqTGUtREY9Y3JJJT6u4cFV6HT3vim/eYH/dZvVcV
	Pz3xns5L/oajjEd9gMGKdN+RDf43Xonvds1f2YSHkxLZxzaOC+UgdlsOTiHv72dRc+qAas8hETl
	wZMcy8SRRgP9OfetDeF/1zy6WxbxM4s6DzMQkWNZZNvrGtHcPtukq+/yHq+K2Qag6bHp2o3aB2L
	MNvhD8R/UrWXOH2a1IVaNAVxG+onwcO6zU55lZYnMFTa/9VSSLAv6yioEUWQY2qSLBsOGBjNoab
	/DiUpyftbQr9b8tJpUoR7V2Rphj9v4V20Ckcpk0hRCJrPfeng7fqZ24GmTxpVXwO9npABwnocP0
	M/zkFh8Y4w==
X-Received: by 2002:a17:90b:580c:b0:3ac:c03a:38ad with SMTP id 98e67ed59e1d1-3acee276f1fmr9591757a91.5.1792491523233;
        Tue, 20 Oct 2026 03:18:43 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:42 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] selftests: ALSA: pcmtest: Fix two test bugs
Date: Tue, 20 Oct 2026 19:18:35 +0900
Message-ID: <cover.1792390197.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for the pcmtest selftest. The first makes the playback tests
fail when a transfer fails. The second sizes the pattern buffer to the
4096 bytes the driver allows.

Tested on x86_64 with snd-pcmtest. All five tests pass as before. With
inject_trigger_err=1 the playback and ni_playback tests passed before
and now fail. With a 2000-byte pattern on channel 0 four tests failed
before and now pass.

HyeongJun An (2):
  selftests: ALSA: pcmtest: Check the frame count of each transfer
  selftests: ALSA: pcmtest: Make room for the longest fill pattern

 .../selftests/alsa/test-pcmtest-driver.c      | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

-- 
2.43.0

