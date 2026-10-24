Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809655;
	b=PBkcWSWTdeQz2wKZRFB6AwMPjU7T8H2WLxXKARfZlnK08/i3apTkNJWE29XVHzR77Xlm
	 U+Z+jObC8Ucjc57D4kq5ro2+YtAWCG1hRzu92bUzBgCyiYN6brlam0oObtoye0haiblel
	 ncrdp0r1o3vl+E+wijZXhYtTtb76CPm41wxof0L/v4hkVcdP9UEWty7+J/xtCVDZNNEQp
	 WBrCFNqemxYaSrSfQNSNEEvJWb8SvKQBBWwnCSaZSOob7xquM/hIYoG9EMqeY12FAijwo
	 52pNvke4bqh8YMaSYUm9fsc/0MCS/2IMAY1E39rLDlfEQN5s9fSm2MIphYJE8XO3wtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
	b=uekanVuR9FtjbJJZNEZxM8ySUy1GeoITUy9k8UXdjgwQZS42GjKXs6aLvzAVxPvQZQRa
	 agb68rwRB6OOhF40+Wz4LoIExI9TtmY0IaXUsbLkh2zFMr39NXL5UGhUjKjS/il74FEV3
	 Xh1Y2zJvCR1X7xQar2rNrLTN/i+0yNwKK43E6bfa4msgLGxGFgO0ykdMKrxCXjXc17bu+
	 15VYN5TXulmhi1kxW9QIuP+jUg6WD0qjAFTbMb0+Ws3RaNed2DVhObj6C5O2vDEHibAaT
	 WsQ7A/wMfjVYUQDuC+5SO7vqfQi4h0Mr082nVpyr4xEqrX5YTAyCb94PryG7s+MPNNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AcohlYTS;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E4606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AcohlYTS
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91b8b456dbeso16589436d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809654; x=1793414454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
        b=AcohlYTSJMZq+GAAY76u6+mVcRlzqGY9BQkfT6KfgzGu9tLA2/wuHyDW6/dh9oFneb
         34MnawYX5F2Zdv/9zHmkLmUsvPJ4084FqYqxNr/oHLc92Q/udQxfdoQpaBJt8RIW6LWv
         u0Jfd16viYrEUpw3wEfpqbndY7fl5/z6UZURZVtB3d28h7PwXAe84DKLIFgNZQZhkUaf
         Dq4LkyvcYNRaV11ykFfCHHBinmWZXGEKK4F9JlJjewB1YfckPufGRWkQN0Lgt+cQMUpv
         V0F/YouaEMOtu0ZJiMtP0Nty1XFdxctkGQSDNz8JhPj8SzvwX36x6LSdF0+dql7dBdir
         +cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809654; x=1793414454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
        b=P9bAh3Q/BjjfQJK8mkV/voYe68yeJWLQ+E/TqO5R1QpuMRA0/6q0j96en/f5tooTX3
         5OyvrBd9KN8/Ln3XJ9qusa65Z7/pepxnJXKlT4ZluqyvoStgO1BsCAdl5fspQwLNUZBN
         bV3Mn7QPrBt2xFGpR4pxeB1aHTziooaWqs6nHtwiHQpC2Ifdt7uXnCco6OzsFVSZ+yzq
         qOs9WSxXa4iw9oVkcsWidyPi3+H9T8qgCw7M6KMv/VPhiz/QLSLtSux5so+sBQ93OSXN
         8Iz66XDDX0zeRQZoUrqSPvNxt7CF1yAJCgm783RqYe4N2kJ4JxOrh5zCu70rOKQCmfTW
         kFwg==
X-Forwarded-Encrypted: i=1; AKwUvBycPY/ESZjeuC8atLBvkgXP9utHEybZ9O30hy1hqFZ2XZtxMCgK77ep/tNITL97SjJySnbJM1cfedwLYr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj+xGGzmHisTyYBLmqs/7nBkXG15BDn9vPVUB5Jqd7n0/+nzRq
	YieR9Vvw/BG7oEjO6Nq0JzmbjaTmxSCnYQ508EihNUk3hmwTsr1qQoM=
X-Gm-Gg: AYBFou0TH08KIbUZufMqByKO7kQedPGf5L/GnVZkWAazKZB0kkVRm1o0pQsonnMXBDL
	N4z5nNvL/O/WXpkYXcGeEGobxzZWofK7+/gkQfJbmCVmaNcY3KAY1IPg7HGCE4lkbfO2WygPYci
	G4GfC3cDzSr611xnbADvhe83s/sn29ZdSatcdHLFTICr6DIk3AVCMb3CWhybHaenMZGoVhoYZCV
	TcRFUFSCMX94bsdzmQRHoEKaWdUp2RRJpVIi+tnvr+FmAQwAEGVIkyt/ezCsyabEhRbldusqO6l
	j5QrLfoWNa+ZkCwWnbR86LeNY27K1YFTAB1cEMYkePKgm0ditsjohwi/OnS7ZuVzeW906rLPbow
	DoMtpPn6SlE1BcUGzm8FYkftKAorLoo7fT4NCZivLgwQGyAkoq0nevZIsS1Hwnos+M93wetjCq/
	SbO1oUR/+j6yPEcwY9KeAoJYDvihcfpNg3RuN3rUOaAGu6IoPZkAWko4y8srnL7cks0b3aQ8y7z
	rdew8/H1Mzys8o+FDXUCz52w0P7rKfsReBKdZQbWs3mUoTmwSSs2DokQOoxmDh1AOmX6tX2/++V
	4Y0DQuKBon6Q/tHfzX48w8MJJZe7LtIFzqEc0kO2/hmd/7vzR5KBdUjPwOkWDly8UIhJHsy39UM
	pKz9W58pyjQ==
X-Received: by 2002:a05:6214:5001:b0:91b:b0ca:9f8 with SMTP id 6a1803df08f44-91c48e57971mr14566376d6.26.1792809654071;
        Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 0/2] media: venus: fix HFI teardown races
Date: Fri, 23 Oct 2026 22:40:49 -0400
Message-ID: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This issue was identified as part of our ongoing research while
reviewing kernel code.

Synchronize IRQ handlers before freeing HFI state, and disable recovery
work at the start of remove to prevent it from racing with teardown.

Changes in v5:
- Patch 1: no code changes; carry Bryan's Reviewed-by.
- Patch 2: drop the duplicate work disable from venus_hfi_destroy(),
  keeping it only in venus_remove(), as requested by Bryan.
- Rebase onto media-committers.git next.

Compilation test completed.

v4: https://lore.kernel.org/all/20261001175502.4045853-1-mhun512@gmail.com/

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.53.0

