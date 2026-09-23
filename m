Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF75383E6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172400; cv=none; b=YJHTGSkm+qYQFfpROYNfHd/RkaSL1kkaNqdhWObEmJbYyQ1oJMWBtPzLpfBVG3xkXtv+u6S9kTMShtQDA+ASfvrJqHVkqivvy3Tpm+ubJX36GOxUkMbJbB9yV0fbbVj/inQdXs4eOorKu7mEltTpueqUt0pRR017pcm0Un7xArw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172400; c=relaxed/simple;
	bh=oTN0UkvymfxfGzObUk2qVdjzgU9xGJX4xG3MjkmtUl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W7ZfBBp2HupqClb2nb8RNTySfvTUBpCxu/AIqQ/EQWImOYc160nHuE3SYlXE64dqHKKYZ0mYwI1R5NeVUj7MOQ8AO4+2GLCVXTiEKFQjfqcKALU9OCcRU4XzZQEbgZitYBOXlVyW6mJUMaMVPBonJ+prPyBYz1Wykhmbx9fglE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=FcWphHYq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="FcWphHYq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so5951575e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1790172396; x=1790777196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yK7mZx0EiqY5laEgalU2cR5RMQsFjx+sycq1PNzq5sY=;
        b=FcWphHYqyBpbrHqC9vZvL1islSasW+iiys0n87KxDaYdqQNgvFAbHEsfvkp7NxT28F
         wyn2qEHNY0DJ0x6cLBtLk14XxOu1KAhT2/MwJTDwdypKVbJ5VQCJMdVY/L8NVhc/3WrU
         G4KRuNmDC5gqdSfBrYbnIdB/fzkWwqMw89sNA/kCXkaQGrj3weJDkw4iE5Vr7YcnH4if
         0wRjKp9HvBWX5AYt1I39uCbRX2yiNNHrldtylYcmnUzIS3LVM5x6qTQVGut8Nz+S9TeC
         nTVlexs2zrW2GY3pFAfxyac0Kzl3ahKmL/pMVCEptROJogdfgEW1hpYENwI+CypjnzY5
         oqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172396; x=1790777196;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yK7mZx0EiqY5laEgalU2cR5RMQsFjx+sycq1PNzq5sY=;
        b=c29Ghxs4iI2PMWt4XH4UBcwkIqWieW/ce1Cp7cH0/9X5onM9a31+ch5/4f9M8X03PK
         er5OqhQPCp3qLNhjQZBoc8elcabcc4olqGnnBRKRJJqCpy4NSE1+nVg+gE8MlznFdRJV
         QSnAKL8hb/1Aat98SHPJvefK2Mohe4SF+M6/LyqicdvSfOziqsHlPzIQjmnFB0IEqjP2
         qMQrA9sgHcNdmnnC/3+PYOGsumiU8j6r+W0huwNqEzHqABLGr/2Mn7zylBSdmjCJREPN
         FfxeUCGXPVmsVEUlLR02DLr3xO6auHzHRNboZNaEa3FsVr25/6MBrCv4NXdJemkTcqDG
         tlDA==
X-Forwarded-Encrypted: i=1; AKwUvBw40sRv84eaJnpMRtVev4XumWSbuMRgymkLI6/ilzMwEsCkwgj5PSGlhC2GTLpM5loMQPy2N8Cv6yNpt/A=@vger.kernel.org
X-Gm-Message-State: AFuF++m/hL60V2VggY4hrmNu4KSw8UOIOsYIbUOHEOzV5fIrJznGpW8c
	3taqUbsjahNnbAci4jH0Dh2dBiMoC6XPjOnYrevjwlFRBokP10uaqH52c1D7zDiiEzE=
X-Gm-Gg: AYBFou3GkYVUmFy4E9SDIqqr0KXUlSuk1fW/p/BY73WhlLLLysFK3L7Ho51ip7LIFAn
	PSYn+YLBRGqOTNRCE8DJIgxGUuOcBQU7biUFEcUzQJy9KCfk3q+888gomOtNVsyr+Tb7+pXdGPi
	a3+qCa7FsrBZNwGKP3AEVXdR+j+wyQmBQjZm1VR0TIblJ8c1V4f5vdUAORuKc7UCi0pTGc6advY
	3pd00fHcc6KboQMi2XHIfa9AqStZc5lLXOQOdf8jN9Z8Uo0dh0B7+t6Al5upcQqnW00XzTJh7Bo
	eUdEKLqe6yHPGMK5EKdFSD1U9egohbniA6Awhz0XAtfU3SEW/p2Fm29jTayhcS5DZn5B6tDoy7H
	FiNL6SXLRw+g5qIls3fqihkUC5DSLHPYiXX2DT/A2LZpEEFCVM/R38HQe2XggBIoWa178qZHQVP
	naE14P0rf1ZUs9dP7es9pgS11jYv9gTQsx1NN6mpHVCPdLE2YWMUPS4f/2zCzeDmG9qjc/uBNk5
	inmO6AqpTDyTZMQrsXZs2o9xlpS+2A=
X-Received: by 2002:a05:600c:a416:b0:49f:df99:ff13 with SMTP id 5b1f17b1804b1-49fdf99ffd1mr35917295e9.21.1790172396347;
        Wed, 23 Sep 2026 07:06:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b01f:2334:39d8:9506:1776:f780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18a8a0sm78087455e9.5.2026.09.23.07.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:06:35 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: [PATCH 0/7] drbd: preparation for DRBD 9
Date: Wed, 23 Sep 2026 16:06:01 +0200
Message-ID: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series contains preparatory changes for bringing DRBD 9 upstream.
Each patch moves a piece of the in-tree DRBD 8.4 code to the form it
has in the out-of-tree DRBD 9 code. Doing these steps separately and
up front keeps them out of the much larger rework that follows, so
that rework shows only what DRBD 9 actually changes.

The patches are a file rename, comment and internal cleanups, and two
higher configuration maximums. Defaults are unchanged, all existing
configurations remain valid, and apart from those limits only the
wording of some log messages is visible to userspace.

Christoph Böhmwalder (7):
  drbd: rename drbd_worker.c to drbd_sender.c
  drbd: modernize the file header comments
  drbd: raise the socket buffer size limits to 128 MiB
  drbd: raise the maximum resync rate to 8 GiB/s
  drbd: replace the drbd_interval bitfields with a type and flags
  drbd: move the packet name table to drbd_strings.c
  drbd: rate limit log messages per object

 drivers/block/drbd/Makefile                   |   2 +-
 drivers/block/drbd/drbd_actlog.c              |  16 +-
 drivers/block/drbd/drbd_bitmap.c              |  18 +-
 drivers/block/drbd/drbd_debugfs.c             |   4 +
 drivers/block/drbd/drbd_debugfs.h             |   4 +
 drivers/block/drbd/drbd_int.h                 |  59 +++-
 drivers/block/drbd/drbd_interval.c            |   4 +
 drivers/block/drbd/drbd_interval.h            |  55 +++-
 drivers/block/drbd/drbd_main.c                | 106 ++------
 drivers/block/drbd/drbd_nl.c                  |  15 +-
 drivers/block/drbd/drbd_polymorph_printk.h    | 256 ++++++++++++------
 drivers/block/drbd/drbd_proc.c                |  10 +-
 drivers/block/drbd/drbd_protocol.h            |   4 +
 drivers/block/drbd/drbd_receiver.c            |  61 +++--
 drivers/block/drbd/drbd_req.c                 |  40 ++-
 drivers/block/drbd/drbd_req.h                 |  12 +-
 .../drbd/{drbd_worker.c => drbd_sender.c}     |  42 ++-
 drivers/block/drbd/drbd_state.c               |  15 +-
 drivers/block/drbd/drbd_strings.c             | 138 ++++++++--
 drivers/block/drbd/drbd_strings.h             |  27 +-
 drivers/block/drbd/drbd_vli.h                 |  12 +-
 include/uapi/linux/drbd.h                     |  12 +-
 include/uapi/linux/drbd_limits.h              |  12 +-
 23 files changed, 534 insertions(+), 390 deletions(-)
 rename drivers/block/drbd/{drbd_worker.c => drbd_sender.c} (98%)


base-commit: 85bffad4d2fea373a72d68bed8012e8cbccb8ee7
-- 
2.55.0

