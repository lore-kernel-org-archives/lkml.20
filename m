Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698398;
	b=SH7uLjEWl2+iB0FKjrtIagEMW8NfrcjrIqLEngzy6nvO7Z5m3ncx6xz5Bfm3p2NLiF0E
	 9tM9EM7S84yLSXq6B0Tfkhqq8f3BvfjiFjefIXLAdsruTZ18wgADNInW5tfmRDam7jgb5
	 JCSDJr86G9+FuHcRNIjxZ0XQ+j4csqsHRbfVYQKG9DzPT0JtC75LBHNd99JTxIHMzpOy7
	 l2G9qkYl+e0c1iVP4t2pO/FNgVkN+LcI3H1XJcXTFGYIPDDyyJpoqpU1eqePiiTSBuIDZ
	 q85fi3kerJLB04HszM5VW++jIJDcHr1BPkQv5vMRTsUFI5u8JkVe+JQu4jC0zf6lFxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
	b=LRrJ0qwBJXv5bAmB97qwmo/rDJfMlAHVKP0dMBDnbq/2rcvOrbDQGYMbGWYcnpzHRyFv
	 k8n7P3W5nIl4pUvGxkYPDfqhuI3vB+JIJFLyWYUCkeanPu6JyyW+qUv4v48yI8MHcp5yQ
	 aY5R+Jvw37bV+2cdc5U2NiSDoBPCsu1isnxfHxSqsOEDbL08OtH3HTBQOZVR2uVZQ6+6m
	 zWLEGwI9PvTo18Dxqzxp5mJ7GfEKOZy/Rxddtb9PstG+0lT7lQvukuoD/5eypXcXuc1Hg
	 mb6LAp0+sv/lSZwtaAEyyjTn4wHsJJ75T9JY8zyvnnz1VuADvXcL1RD9iTOjQHbESoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4Orl8y5;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D469606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D469606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4Orl8y5
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so154381a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698398; x=1793303198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
        b=X4Orl8y5ZJ6qdUMN/Z0ip9ybgYPPFgcelMo4n4augpwvb5eVzx0/awG68S73cqxomg
         mHR0XquQuhCDxGhPnQ//7361DfF8RyqYWLgZ/QL3w2ZcseqvS0oRdDivhsXZ0Bw4pjlv
         SD9rwQG1lk+CoGxVVWoqrYDz7Oh1J8GAigyRajotjhavQJWm0StG29KwaiTkCgz+VkKz
         hi9Lv+8rNx4E/WLNJCL3d5+/uOF+6hEPRk3JCJcwLKZsH6eAet5xW7JErDzFs+FzwDOn
         t4z1+7LrZv7AhmT3xPnliVGw4LQD2tsz052MrA36aeA3TO3BXTo+jH5Olnud6wOP+a7H
         I+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698398; x=1793303198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
        b=r2ECmDb0IOUP+IdG/ai3qzDdAKl9Xsmh41sO7/5oDvhQFopmiGfm7abcxTtSS5sWIc
         swKp0nyzsUNvBdQ+hZ/+/gBCRa2Z74my1a/lJn5l+DG6U5dE3lBm6qHgoMfvH6evUjvW
         E8W/xE9gnVFgQzkUXT0oj1Rexknh2YvP3MqrvfyCh8xIWrv2C4Lq8ZnKZvT1Z1w07gC0
         R96DexBxi12xBAeDgMx3ieglxiZQI+jgN6mtj9JARIwbS5+2hkewGWA45y2c2gVlY3dY
         b7ViDDD/XqgAURRReJUTHusf/CaIMApv+C7HD02Db5pNOAmqXD1JmtmCxy2xKj4PBbOd
         mprA==
X-Forwarded-Encrypted: i=1; AKwUvByAv9mxwmbCCdCAyfIzsPrLbYZDZtJBTM3kVHeo+orCFjeTPmgdtc65ESuld1jA9ywqDN+A2nDiwtRRmRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5+UzL1ZYZplZQyBsn+18di8yDDjh4BpF7OQKyR12PxYK/d9jX
	WyTtNu+2i5anMPs/cu+6vKT/sBoSoQ8jLCnOWKqhW+U6zN7qRLa4HTZZfwBU3DCN
X-Gm-Gg: AYBFou3Y50Hjgmlsjz+4ObiCy5OiA5I4P09xDSufIXS6h+c/jeE7CkIqL1aVKzhEyw+
	5agXqLumvzT0q7eqe2tKTc4RkoXxLIOlo/3s//TypeUAyWT2gNLWJTveNxF2mTEuhfM9FBfkAKC
	t7fQFQQ0zi74EprCXJQztZYmA86EEUhzhUpMtDcdFoj166ORZ1gWFhqA3BHCF1wE8bc0WW38ZJo
	mcjXcDGhxXak2rFOb+rS6FVFpt5u0DVAWpkGJgge7WRzEpowekDCbMnIPhCv6jf3CKKLWroapiK
	G5n1TmZUJEDwTWNWZ/QNhSFA/DCTAQ2fcAkJ/hcrKxsYzGRzvDTj/y7w7JqKqLkkMxxqoKExg7C
	ZfpX47nbmShJMea+8TKpvrqqYSZAIYcou5FyQ86Yz5zo4btYIARsHzfuWOrz825uAJjgySB2yp1
	eXkRC6ZaTHQdcubYoNakp4fy5KnnnKXdGZwvQZIOwEr3/g1FpD9dGjjcRxEUVUYEko1nexFrOh6
	3ydPCOG+syL6/5Uodg8wUEKYyJFKI+zC/e2Y+FEqrRqT5sYwOgNA7v5HTJGPr4VBbtfEcY85mek
	+ghEsdplNyhApuYqvCgicOcLJZ6a8iiE
X-Received: by 2002:a17:90a:ec86:b0:3aa:548f:eb7d with SMTP id 98e67ed59e1d1-3ad86f44cc4mr5332559a91.20.1792698397762;
        Thu, 22 Oct 2026 12:46:37 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49366fdsm5505889a91.14.2026.10.22.12.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:46:37 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Subject: [PATCH 0/3] media: em28xx: fix multiple disconnect races and UAFs
Date: Fri, 23 Oct 2026 02:46:17 +0700
Message-ID: <20261022194618.14170-1-neganhat@gmail.com>
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

