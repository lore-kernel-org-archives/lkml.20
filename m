Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C03A2E2B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107775; cv=none; b=kvAAxc4fFr2QcAtvIDnikxXY/KjBxiNVE636iWVbMFsfiNLVwsNOD/Zw6R1SsmSZPjW0SwMIaPuOXNvcBT+q4oDbVWLpya9q3IIV9df0Zl94FDKQOXc+ot9V3BsDwuPhikc7caFO65BuRtwFeI5l8prokk/ghLW+1FvIhAowG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107775; c=relaxed/simple;
	bh=ZpBnja49FVnQcL435Kbkb+kuHE6T5X0obVqilKKMzjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xkoatm+TNBT/Mbr0mTtmiTDOFKCX1SaIBJpGp4/DK9HaE1sdSh265TcGTNSfgi3NZVp9+2dJK0ykMWDR1arIZwk9Z4ETWNuLuE9FuTBXKfq8nTVAvrfopAZZwh7HhojhXZNWhV0QtoXTAMOFb1AQ9P2B0GB0ubwcPxK2CMz4KbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0cr42Sp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0cr42Sp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88c72646f03so349174b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107773; x=1791712573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDHu6N6WqaDVYQcb2PQWKiWT8vncXO+aoop0XtK3ZMY=;
        b=L0cr42SpvqnvbwpAQAWHrxtu+8AF0yotTivlBrh9ABzhHxn1tbWr2IflzEGnwJeSf2
         yH5bnbTnJWcf7Uq2HTCJbzDICpUHrS7dGSDozcGz35+c1/9D6+aByPIeLA2lSjxyKWmS
         rwzAJLMLRgInHisGDTnkwEzWYYomm/+o82NuCT+eCQs8fW3FBrnW2XYvTfy2e4sw8UjI
         XqPVEI6EcQDlyPPmGDfb2Bul2kWbGx9aMGxJABS5UvAwM7/nEoofinEJzqhIy8lf2iDk
         xicPUgr2ZXUxqXsh9u0uktlcQ6YVIKVYYJKtjzqbIi4OTUDStO0GFxKQuKl9OgOFxPNL
         w+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107773; x=1791712573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDHu6N6WqaDVYQcb2PQWKiWT8vncXO+aoop0XtK3ZMY=;
        b=dTCcSNbw4eAkSIUpQmBynBgqlJvsO+KBl66O9LpVC8Ya7anRhIBQ5qk+q1UqJ/4dHP
         FTOuLVmW4KlLPbQbf6su2CIg/OJi57dxMetwkWkn5Q1SKuF69XanxMfp8q/lWlWYDj7Z
         JjcCDXXKieAjHl6CAU4Uy63KfBoxxp+x95WrbCZPgQJtzvJ30yb4ta6apDJKDdQXURXS
         nYpCkQsFmefyemFMGxyz2AKhBiZjb5kU9XkNi0nlzZBAGueQjg942MvSDrvF8IpOaPO+
         mqSNnMdV+ZZCemDGiDcQmSHDa/2gnhwKWJftYUdpuF6knAmo1doUaj9i4irehos1U5Ao
         J6sA==
X-Forwarded-Encrypted: i=1; AKwUvBxhktWX9B/c2YmBV3diP86J3tWjGLDP/5ekbbHhF76YtbvdN3YUPAsb7DS8WSAreSqGdHnAamk38E/no/8=@vger.kernel.org
X-Gm-Message-State: AFuF++nebugkQZs+6L9xHWKo2IoTQ0shbw0/qjXoz/HNxxYMkL/jNh+m
	aPp26BSV1ON3I9X6lseFPfZKx6q1xR4RJU1nIycp92bZmNiEECPG+BJi
X-Gm-Gg: AYBFou3gULXSO8erxNMY5TYEH+5s09hL4wAsP1Jgm8Y/ng7/g3vC0dS8riQuUMPUcCE
	+u6c8b8bZ5AqekjSzwylo2qZp8aTEObtd5vIRCFFVQLtdaDJQB93HFfdVKVT3ENvUCrbfoEqpuj
	l0cTXdU1CMnmOoj7vzuxHzy324iWqYAadLEgMgTUFWvk2S/bodTDT/HGtonHERmkxvFtQwhvRmr
	0ISXzFaxO7vrF8oN0BKueC5H8f68MKLLw7Qo/UW4yMGM1hpX4R+zjjEhW0mlzCfm6z1SpWoQLUu
	Lgdw9CIwNrhGdaPV1cAWmoDwSjAobRRnlDYSDMjR2754IVS9EFBrqrA0vJfkWUQgqaUx/HAc0b7
	l8xEAJ3l/W8gXU+atpptdCdhfjqiw58bX7tJMdgF5m7uFsai7SdDU9YI9wY9FRMWOVwfIYxt5ib
	UjGDCzFdmNG6cRu7jMiXUsTvsvjT9m4K55Ukq5kE8SnXbk0ObRshKmXI+5n5yG6BdK/2D0E+mBB
	ScgC+nJi9vSZc7+oC8U7B3QYSN0uAG8mWAC5VzrL6SJpmIrR3FVVqM9qHv6UvSsoI6DqSEF5wWf
	HNfsbKp+2BgQ/Ybp8bLRYNQjSHXQJO2MRQfe9LdDJu/17phGwLyqlcqfkN4=
X-Received: by 2002:a05:6a00:a114:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-88c64064002mr3596683b3a.59.1791107773270;
        Sun, 04 Oct 2026 02:56:13 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:11 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ntfs: fix spurious EIO and ENOSPC on nearly full volumes
Date: Sun,  4 Oct 2026 17:56:04 +0800
Message-ID: <cover.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix three errors returned while free space is left, and a
contiguous cluster allocation that comes back in two runs.  Patch 1
fixes file creation failing with EIO on a nearly full volume; it now
goes on until the volume is full and then fails with ENOSPC.  Patch 2
fixes the cluster allocator missing free clusters when its start hint
lies at or past the end of the volume, which empties the MFT zone, and
patch 3 removes the fallocate() check that then fails every later call.
Together the two bugs make fallocate() refuse space that is free until
the next mount.  Patch 4 keeps a contiguous request to a single run:
fallocate() zeroes only the first run, so the clusters of a second one
kept the data of a deleted file.  Reproducers, run with KASAN and
lockdep:
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-04-ntfs-nearfull-v3

Changes in v3: Namjae Jeon asked whether a contiguous request can still
get a second run once the search has left the hint, for instance when
the run reaches the end of a bitmap page and the next page is skipped as
full.  It can, on that path and on two more: where the search wraps to
pass 2, and where it shrinks the MFT zone after trying every zone.  On
ntfs-next each left 16 of 20 fallocated clusters reading the data of a
deleted file.  New patch 4 does what he suggested: before setting a
cluster's bit, it checks that the cluster follows the run, and returns
the run otherwise.  Patches 1 to 3 are unchanged apart from Hyunchul
Lee's Reviewed-by.  Rebased on ntfs-next.

v2: https://lore.kernel.org/all/cover.1790853718.git.matthias.goergens@gmail.com/
v1: https://lore.kernel.org/all/cover.1790503811.git.matthias.goergens@gmail.com/

Matthias Goergens (4):
  ntfs: set the attribute list size before reserving space for it
  ntfs: restart the zone search when the allocation hint fails
  ntfs: do not refuse fallocate() when the MFT zone is empty
  ntfs: do not give a contiguous cluster allocation a second run

 fs/ntfs/attrlist.c |  5 +++--
 fs/ntfs/file.c     |  3 ---
 fs/ntfs/lcnalloc.c | 35 ++++++++++++++++++++++++++++++++---
 3 files changed, 35 insertions(+), 8 deletions(-)


base-commit: b2a3b6b6c7b09040e3f44ade6e20a7689e4acd28
-- 
2.56.0

