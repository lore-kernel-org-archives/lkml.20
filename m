Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658457;
	b=RV2UjqZZZNrOWXxBC+d8XATUS/7+KrIQEZnC6p4W9ndTToy0hFverGCGsUKx2xxfbI3h
	 5auLdMrlB3bVrtuUo49dGBln4y+hbYHNbc40kt6fdLzCA0mfW2aMEUbzboWDPaaNCc8ah
	 Y/Sdwekk2gXZrlX6FbWi4nmUozdiWIFAWfWazq4WBSFkgPBzeum7dfcj6wPjT0SY5VegP
	 lZla+ZPM0vEfbz+h9yXe/PqPsDGgWU8Qb8mkAGJOedfxGJM6K5loWg8p2laPv5MZSklCU
	 rT6OMtoz4s/45mGk/ab1OzgF4MTqdea8wdJ8Hzqn0Y1JByXzw/9gX/UO3uSWAAouHEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vZJR8BniHZC6210HXXytWLIaZ0maMiLYh83E0jmYRSE=;
	b=Bbp4Rmpaz5F5z16K61NFMCaioq6p6jkHEE1CJCWkAquxoaU+igFjRqOdqMFe39ZYGoYc
	 cpPVDyEiSEjn1uwSSwkPBI43vUQQx1q1HdmTWBKZkDNaPi2oLpqZkVzsZjXN8BGnK2iCH
	 t9u7WGuEFrvdL+AnUWF9E+b2rxSUx3qU5OwMscw7/qiGCuESGJauatEq4EuEjHMDEC6UH
	 xNXhLgtwtDDbZ7gjcFMX+WD/gw1F3moIEuNbdfxcxWC933sueWNyBucqjTufrYN5/XsA5
	 HLWoYVF6p/GQ8Z40vkv3KGLwIlUIk++Az+w4jzGck9AUMa6x7DBod2z65JRACOndJzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JgYsV813;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE2606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAE2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JgYsV813
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so849391a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658456; x=1793263256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZJR8BniHZC6210HXXytWLIaZ0maMiLYh83E0jmYRSE=;
        b=JgYsV813C5SSPUbmcv0Vcd/D8Uudwin5r7gCakzyly3uZ7qoNvV7XPcT0mmH8EFZKO
         0lvtSkJqldaT3HqnkkoLXCoZTNuw90ulSkXpsnrJACmbRoRsfGdQux9ED80yNL8q4RB1
         tvN4wDFjlDbXwvq318GF0Tuvrbwj/9RNmWr6BZ0DVw9zl1r7VCI7uMVLGFOlajsrdZ0y
         eEgJ9PhaOqcH/6/ajNP90VnXmMVRlsmQq6up96Gd+87v0UbpgyU+T7pHo0aJ/tC+xH3c
         JNLk4/sR4qpNBBW5CrVCwJFpWZXorgScMbniNwTdTDttWlwi11nSBo4lTOhwEQ49+O8Z
         nsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658456; x=1793263256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZJR8BniHZC6210HXXytWLIaZ0maMiLYh83E0jmYRSE=;
        b=Xmhve0nOEDVupiNQdU/ucroRddXYSbbTmUIEiY9bBRB9Zp8gL7RZGFQeiOCUQ34Yih
         yQVCFOYfe+pJT6WQ309ptj/1fMmzVHA84Fp4qlUsBqew8Vbdf5yQ97csV9PgcxJrZIiF
         PDpt22EjcpRt3uYqXJ11KkMMvjhFi/q7Yis5pZPzMdnWOwlEzgh/fGX5TwRwUGmaO6za
         0GyQVHIM1NZ9qkf/WvFjJQI3aE6bqxOr/uwm5leqxltp8R9n9ppArxKvJ+lmu8FmFVaD
         BK9Vmq+vFsjznRRUZ7YFtJifdRopBGQ/5QHBymYoCUWKdSmolXIcnnZY7+VGg4U3sSWx
         ZlOw==
X-Forwarded-Encrypted: i=1; AKwUvBzMiBBUTO0TuQnfOBLEg7IIyn4bERXJXMsx6+hXZa3A+vtuIAE4oHTnKEZFIQdiucZm2375x7DIp9hB76k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ/3tdO9TzFzoyaFW+EBfnqtjxO021gbndpGrM5MUHzQoCmfAQ
	5m7FPQv+w61hKVs7PLJxSLF5R2t+e9RLoBvpw+PrK8RBIB9OtpIl5WFY
X-Gm-Gg: AYBFou1XHkeS7+WA5S554qia3PNsVYQ9ECGy8TWiXVTtWA084yhuZoxzOuaQKNadYWB
	E2NBo44WRMiJBden0eu1IL+kWwUCOKLQ9AyhuRzSDDzJk4ZbwklXtOul3krOJ5sVPkRmCkoWgsC
	32IO95hcxQJHj9GSeuKBNmq/OkbRy9gVHVMMGc4OoaYozyAF1Wg0r5kZxtayGu8lExFl9Jrs24V
	0lIzdLqCFsHMtGOUz+9qYo0enYJsXUA2S2ghpw2E1llIXm6SYMa8mpDcHBbQuGujTbXap5FGt+Q
	t1ncxs7TsswQUJtu4SUxw+baL/Bu4wPLVaz/YDJO7IpV401PeQTOU2PvqYuEOxiEhdKhN2y3Ahn
	B9dDRhioONntWdS8M55gIpP2XDnEbom2G/eY4SWrJPvZdQ5dt5JNrUwSktDt6D2Nu/J1/c79sFK
	mj18r1a2xrEXtJw0HUWFwE9EWTaK0nTvRlW1t+QSM2RX8KzlI2zRQVhgHZSPzl96EzmB7iihSeo
	4ySQKiL9PInHbbKDaNBuynvS/3TOeciwQkqtPjm8+dqxe5xNfB70vhFk8/tlEy/kGBmqJmHulJ3
	QMQH4k/zjubSIb5qCosS9EXnJR5sJ3bUTKeuaOOVVPJzhkmgDC8U5cqxfSoYfzMFeyyK85E=
X-Received: by 2002:a17:90a:cf10:b0:3ad:8963:344a with SMTP id 98e67ed59e1d1-3ad896335dcmr2485793a91.66.1792658456409;
        Thu, 22 Oct 2026 01:40:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a573fsm3340992a91.10.2026.10.22.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:40:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 0/2] ASoC: loongson: Fix configuration and clock error handling
Date: Thu, 22 Oct 2026 15:40:38 +0700
Message-ID: <20261022084040.31181-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

While reviewing the driver code, I noticed two potential issues and
looked into the Loongson I2S documentation to investigate them.
This RFC series proposes fixes for these issues.

I don't have the hardware to test these changes, so I'd appreciate
your review and feedback.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
  ASoC: loongson: Handle clock enable errors in set_fmt

 sound/soc/loongson/loongson_i2s.c | 44 +++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 11 deletions(-)

-- 
2.43.0

