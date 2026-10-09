Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B2C242D62
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791506143; cv=none; b=DJB5xbf2l/jYwCDAOJYXc1EhLr+HRW7+jLjuDG6xLF5/Q+M4gysSA181U9cMCYlC/g7zK2eugmGJhFnMWn645TGp0hWq5pVVgevmOW8hJGwAEMVpa5XMIxTE5IlQWteSbhFFjoZ/xn3p02RwpWt5aluFkEevTfwpl6nWvs/ystw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791506143; c=relaxed/simple;
	bh=2UfdJs69sO/fEFk4xEcV6sqiZJ4cwTu93x1gV3HZJK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kZaly4t1bshecd9L2Sb/fLieG3uQ7m4ud+13/kLs22zxqAcqnsDmSnrOflJePUH1TvdONq5Y9ucfGp+eu2beZ9q8abBcOn6ZMH5k0ifJMyyth5oLyFDaQdHRaGYCc76RcU4YL4KaM0c2NOOvNNMmK1Cr24adzkJl+tBjxcDXEyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/lRtbNc; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/lRtbNc"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98c7e996596so26232241.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791506140; x=1792110940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x11PvIESSkGOPE/y8CqSvSINYIoP3r5FMwi0SVUBQUc=;
        b=e/lRtbNc2hQeqtz+U1EUVBRwiRWgCoEBQKruPJR5Ov8L2Dzy0hlvlsh6Q+2tDD1qMb
         /EVnWuXBhJGRpEmpUGO23cuYIVmh0XUD4sO3XAB3XpthQ72y8erz+8SjxnZ2mm9hmMkR
         TC15wn2oz95R+liYzLerl1EKiNi+yBkEEvB0kqAIVzZ22aWx4PJR0/hsbXY99FOqQrS3
         Ru6f2FFzmvWpYZ5qorqhek/0Mp3EtJMmrH5zdq0x1Q5cgReNy4ZvWDIso/Hz2YJvanW1
         J7at/JN9OvVFI+RFud/XmqI+l7xzqszlA31zxLEoAh4J7TZ7NvGwc+BdbZM4zmIoIKRp
         JgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791506140; x=1792110940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x11PvIESSkGOPE/y8CqSvSINYIoP3r5FMwi0SVUBQUc=;
        b=wpJox2/r4JmNXGowTpliYeOXA6KLra0mZ2ZjvjEJi54oPIX0uFAtFjATKGaX6vJvui
         rXywlKfy8HcGwlpJF74rs2QU/pa/cN+4m6pdQce3m/sggsuL8JvBJ+X+sWjvwAacVV5i
         dh6S3HxA8Bu/udTgi+Zxqw46Dgc4XeMdWOEDFAqNTe9KEqrxoR0t2jMd/UsLXoIq47FZ
         3QzMxp/XVhurpe0DKQyPW0//rUxHXIxnx2ixAzltseSY/VO/oLtRx8PjmlM9pdKNcKb1
         sFQ66ip0rwo69ymdSO+Vjiuw54U7W7Y9s90qwB23ud99inZmwmrcbMih5MR32Woj1atw
         SXpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG1QgjmIXit5GIV4uevqg0uRU4OpvhkkH+4GzWWccy195HES2s3LoWswMEjyejMghRLaCPD6fGmIkPJkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfkjStEkEHxuGBkKvr1tp89qSmR7aKdPiOmy6/RtDSzVAkdYR6
	hC4Lto2xBdeik4+Hq2gpjTkaqLYt9GLhTYkLFKnJdjGDB/3oV/A03QLE
X-Gm-Gg: AYBFou24CZkyXowokIVz/LEaSe4LtTdzKMewql9wNhyu9gfX8gOG+BIW1KVEo0P4ZFy
	Sv92MzFgG8zTwR8Vxcs9tfDlTwhy+E7eYEzSuc/Y+r8jzealbCxRyvCjrlbTusW/1gd3pqU38RX
	MaMk1zwfnhTt7TpB3y5XgruEciq+nfUD0baEjTY/OUnfmPOGZzPQullt3qEXsRslXiLMtxwFEf9
	EyLGuXXtH2fAQUXJghxQQkPgzEW7zuKTN2UomcHLZcm1+QmUSAGs4OoC8r+K2Tkpv6nAyFvV4iy
	MajQaHqwRFnZl73GgHR4pnt+4V1osOoKwpSqZIoGD9IOcnm26gz0x0Pm4dO9b5LGsOC+CuvqDbB
	QFIdutwEKfZ0oUGOA29dodaSSgUqHPQX/yjqTafvq7IH0uTD/8iiCNYowvw/oV0H7pRNSNmmbQg
	1bgYhJi1hvs3h+0J1wZyPCny57GEFCRA5HBuOywKAlELLfYVnlj1oZ8lo56lInb8SlSUZZiMSJ/
	Q4qegGgI6wSKEWtqj4m5gDDCe2Idg6wkZcFIEUmaIFWM7hztkm/oGdnW4PjyxhL5I2WnsHkCoV5
	6ltOo4KVGTEx4elv5hZUuWFckisyZg==
X-Received: by 2002:a05:6102:a4d:b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7cb36485419mr123513137.1.1791506140555;
        Thu, 08 Oct 2026 17:35:40 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb3539092esm488922137.3.2026.10.08.17.35.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:35:40 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH v4 0/4] scsi: target: rd: Fix oversized ramdisk allocations
Date: Thu,  8 Oct 2026 20:35:30 -0400
Message-ID: <20261009003537.62265-1-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

A ramdisk page count set through configfs (rd_pages=) has no upper bound.
syzbot found that a large value makes rd_build_device_space() attempt a
single sg table array allocation above the page allocator's maximum
order, which triggers a WARNING. Patch 1 rejects page counts that
exceed system RAM and allocates the array with kvzalloc so that valid
large ramdisks also work.

A page count close to system RAM still passes that check, and the
backing pages are allocated with GFP_KERNEL, which invokes the OOM
killer instead of failing. On a 1 GiB VM, rd_pages=250000 panics the
system with "System is deadlocked on memory". Patch 3 allocates the
backing pages with __GFP_RETRY_MAYFAIL so that enabling such a device
fails with -ENOMEM instead.

That makes the failure path in rd_build_prot_space() reachable, and it
leaks the partially allocated protection space when pi_prot_type is
written again. Patch 2 fixes that first, so that patch 3 does not
introduce a leak.

Patch 4 fixes an older bug in the same function: the protection space
size is computed in 32 bits and wraps for ramdisks of 2 TiB and larger,
which leaves the protection sg tables too small.

Tested on an arm64 QEMU VM with 1 GiB RAM, with the syzbot reproducer,
normal and NULLIO ramdisks, DIF protection space, device removal, and
rd_pages=250000. The leak was checked with kmemleak by making
pi_prot_type=1 fail under memory pressure and then writing it again:
two unreferenced objects from rd_init_prot() are reported without
patch 2, none with it. I could not test the 2 TiB case of patch 4.

pi_prot_type_store() does not serialize concurrent writes, so two
writers can still race in rd_build_prot_space() and
rd_release_prot_space(). That was already the case before this series
and is not addressed here.

Changes in v4:
- Patch 2: build the protection space in local variables and store it
  in rd_dev only on success, so that the error path cannot free an
  array installed by a concurrent pi_prot_type write (Sashiko AI
  review).
- New patch 4 to compute the protection space size in 64 bits
  (Sashiko AI review).

Changes in v3:
- New patch 2 to release the protection space when its allocation
  fails (Sashiko AI review).

Changes in v2:
- Allocate the sg table arrays with kvzalloc_objs() so that ramdisks
  larger than 512 GiB do not hit the same WARNING (Sashiko AI review).
- New patch to avoid the OOM killer when the backing pages cannot be
  allocated (Sashiko AI review).

v3: https://lore.kernel.org/all/20261008235411.56641-1-sanan.hasanou@gmail.com/
v2: https://lore.kernel.org/all/20261008223712.49827-1-sanan.hasanou@gmail.com/
v1: https://lore.kernel.org/all/20261008215709.46014-1-sanan.hasanou@gmail.com/

Sanan Hasanov (4):
  scsi: target: rd: Fix oversized sg table array allocation
  scsi: target: rd: Release protection space on allocation failure
  scsi: target: rd: Don't invoke the OOM killer for ramdisk pages
  scsi: target: rd: Avoid 32-bit overflow in protection space size

 drivers/target/target_core_rd.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)


base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.48.1

