Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697548;
	b=aOWF4FPpsxlR3v36g68dCBH/6wvC5//CUOE0sJbBiYRlHbN44eV5smUQX2zh3gyayzVb
	 zRxRYWyE8cBU9WMtP2fnIRhrHk2zEyh0TyXwlWOYyIrf5EIBA1sx4z6Ig0WsZoWPSfoN7
	 i7uZPEZpQDI90x6sG4vCSxLK0yzoK3AKJ6/YeQ2T5Ur8Mb7BYb9gZjZM6xYe1g4mGxLSl
	 8uCkLa8RKPBWVP4X15QpP0P8wi6FJsk8cK0knG3GgXEggJlKUKMDhxHPlIZxVjLdh3MkT
	 hSeufUgmtk7MbFBLdUQk+se5VSySTafqGfGlmgwazn+nnNDIPlBdp0w0/M3zGPTr1KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
	b=0F4W9GOxhZXE/naUKsy2juwU+i+ywjYnDo/nHQYny/fHsmE+ttRotakaB81HgMADFzqu
	 rzTGBsH7Inv9hpiSZj9jsErKUORBGXJQnl+G2MksOCfl6ZUkddJe6LHYlPoiPw3rtLumN
	 CIRuIr6sQW78zvGB6bE+S7bWGuaUbXMGu/W+dwNrnGM2GjWjukKZl9Ajcm/Nm5s8r0+LT
	 PxA79VXMlTPQ8AotzkctKW6A2U9OAVhPnAIIquhJBSLYzzxB3uyFzm9vtnHC7y25K5flT
	 e57hf20XxJyPz4Lqq0uLkw/OFeBAzINN1Uuo8kpQXQL53HKh1ZFZ0xQwJQoDKHKIc9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OmnhSUi2;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86902606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86902606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OmnhSUi2
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so147435a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697548; x=1793302348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
        b=OmnhSUi21TAmiRPTD0oZ/2okwwj56f5qULkT12tBCfN8Vq3ctVbz/h6VXJXae4Bwmx
         RqqZ+H1zJzOx4aDyyZVAM2TR6tF5WzcnmfiOYEz8WbQxADWMT3J5SMW0jLQQT8yPUGbF
         mN7oU3kNED25BBau8NbeZaj/K9mNdWYhq0BjWLTTraDYvvrxgyy4b/uuclXe4CWAWEXo
         BOmSbsB9F/FVxWlTDQXarUqIEGbW2nrrGpW2Lf3SL8am0AsrJ+fcqr8H7pVmerTLwJ3R
         /MEV5I2aFOlKtEEsFtu/BSUtZb6zA6g7WMjFTiVG08Hy1DNNprTJvDDBBis11/cWeVqQ
         fevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697548; x=1793302348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
        b=Gg14kGzi5rzav6tdYlhD2jH9cblCqDTia8yQkSFlpTcvTQlYhPiu/4aWtCg99FGHRw
         UWLy1xtQ1Qo+hGmqGr0SSwuZoxXPkSFqIfwPI9kibSwhY5brTHx9sFL6pnbQxkVuEcfQ
         wtHDkZJ6TrqE+Uz99N6Hp8hgA92enwXs4JusEJX8Q0a+C0Iq3TNB7V3iHFRHPIuCAou0
         Q+Tk3lBN08KWBIr1QVZFBcdh0gAC0ltgK/QaD3pGRR9OzLUJx7L8TcmQbZV6KR4iQpR4
         PkuCxMBUoNYzWRfaC4w3t/SUuthUfNI3cScakzN6O9iYZWlxWc5YRep7W7adlt75ejyP
         TRiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnvB+mVouTbxU6f9v2ZeLn6WcJyQNiYzeB6waww0ConoldpBJ3A6DwPAtzJY43whc0ECV54F9ycj/E0Xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBmsStEOqHuYIBhvfOUnanLZzNJIDsZaKANtHE59KHMg7osR7u
	kee9GTfgZrimcbu1hcH3uuEVny3rJHtL/FExRHVlNRpdf0UV95a4Qn9C9P8iE+xt
X-Gm-Gg: AYBFou3x+6K8vSM6PIiSah2QuxBKPZF/lsw8GokT5vSaxqU93FquPMgWBckRglFQVuD
	tkxIuVsgN7hNC79xMzefOPYrD6IqzxJGRSAyD+HYZ7/1v43FwxxOxkR9S8FoGzwwa04FyMPU1TP
	/Klk6anWl1CRdkQsGD7d2qMHLkm14Xl5+NrKzrkLzcce+b1BRIzDtfwcvp093m83G1a7XVuPyJH
	EI0glBT5Bb5nX6SbLCfZx1ecKHmsGvS+VgN+rXSX+eyjAW34q44ku3vcyk6LwQOZoPx6Dv5gNOL
	XKs8z/cg9sDbD3A5T5Tf2hHRlImrQ0ezgEWLaBRKDUO0ucJRnYVxsN0mQx4PO8ddpw76Nt8Dhme
	3prgxTSGesfaOj43W1GTyBajvI1HR9SqFz7+AiAZywLOITXiqPzMpu8UM4lJbjcj7bzUFxY68GH
	LIJaHuIec1MtMclysTtD/6UBuUHEAWUaEvtwnyZoUoKNBk+Uq4IjNZaKeyWjUfSRhU/EyMzXeRk
	bmS1y0HlJN2omiJmGOAbCAWIrP5UZaUgLAwuh9VxDphtRJbV2+DhLLPGy/No5ndD9okP6FEhkS3
	ZIPuXsJrJgV6VuvcVubkiiKeL37bBkCm
X-Received: by 2002:a17:90b:5788:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3ad86f43374mr5065094a91.44.1792697547760;
        Thu, 22 Oct 2026 12:32:27 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm5479418a91.1.2026.10.22.12.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:32:27 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: llinux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Subject: [PATCH 0/3] media: em28xx: fix multiple disconnect races and UAFs
Date: Fri, 23 Oct 2026 02:31:59 +0700
Message-ID: <20261022193159.12713-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This patch series addresses three distinct lifecycle and race condition bugs in
the em28xx driver triggered during concurrent USB disconnect and userspace
file operations (open/close).

Fixing the initial refcount underflow (addressed in Patch 3/3) allowed
syzbot re-testing to progress further down the teardown pipeline, which
subsequently unveiled two deeper Use-After-Free (UAF) bugs in sequence
(Patches 1/3 and 2/3). 

Summary of changes in the patches:

1. media: em28xx: check dev->disconnected in em28xx_v4l2_open()
   Rejects open() attempts with -ENODEV when the device is disconnected,
   preventing hardware register I/O on freed dev->intf memory.

2. media: em28xx: clear v4l2_dev.mdev on media device unregister
   Zeros out v4l2_dev.mdev in em28xx_unregister_media_device() before freeing
   dev->media_dev, avoiding a dangling pointer read in v4l2_release() during
   file close.

3. media: em28xx: fix refcount underflow in em28xx_free_v4l2()
   Removes v4l2_device_unregister() from the v4l2_dev release callback
   em28xx_free_v4l2() and invokes it in em28xx_v4l2_fini() instead, eliminating
   an illegal double-decrement on a zero reference count.

Nguyen Duy Nhat Anh (3):
  media: em28xx: check dev->disconnected in em28xx_v4l2_open()
  media: em28xx: clear v4l2_dev.mdev on media device unregister
  media: em28xx: fix refcount underflow in em28xx_free_v4l2()

 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 drivers/media/usb/em28xx/em28xx-video.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.55.0

