Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB2B2EEE76
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831382; cv=none; b=izj2dTUgJ0r6ZauccpL0TJH3dxtP9Rabbp/kABT+upZZ8YNi5QzACl6cS89HNw0RrrBYi/si+JwCVfzZ506bqL4o0IZrXMJnAjsJ+qI32fWYQcm5ggi4ulKJSkPQJQDVHMEwi1E0QXP7/K54e9AafPL2mbAIB95WVm1wuHbzobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831382; c=relaxed/simple;
	bh=YneO4YqKWZJJNx8URZWytY1r1294muS0vegwG1HwU80=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OgOzQCs2mdEep6q42oIHxgJ26sAH9kLKMf4WYgaDlgK+A6l0E6nbdH78+VApuIzdsg1IrjpAzS8UaxWOHk0nRCxWqXtlv0t5F6AXVsN5QqWpI+668d0zgRqrhrkYmVxWk6FDNT6a6yD17Rv93Detoi8UzVFeq8WULOmPX4Dry1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkvuAeMX; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkvuAeMX"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so1191640a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789831380; x=1790436180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xXc9ZRujKMefBJqLeunvblEf0+32BLmaVOIFNTZhBI=;
        b=nkvuAeMXf2O0tDWSAnpemvPfmuURsNyoTThwNJhhWPYmvE0mv5km/EwlSKFuwBzXeh
         c5YUuo9B/7mkPVw3Z9qsIrvblwShwNST0r0SSIibyA5FzSifLhxBIwpHqajHIcNATD9E
         0qunNPGxynpg8wdl6h1QLEqY105rQbHJDqO/sgTxEYx1MdY2H4jUb27tyrLaVTtEc+ov
         z+NwOPQ1nimmel/ta6qaMjWqonFNVKp/FLP4ax9wrHit21Z35O01rtDLke2L2zwR5l1s
         zsU1/JLu2Ea+aPpZzN07dZOxam4/wDMsMFyWgbWgtmshHHZW1sTsV557B/JgdZAIXVp4
         FwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789831380; x=1790436180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xXc9ZRujKMefBJqLeunvblEf0+32BLmaVOIFNTZhBI=;
        b=gJaL2nbN8DBeyhYdo/8gMhV40igdRO/Yy0wajCIwUCZvVzylFcPuKgTRPDA5bEAlnY
         FSUEuoQjTHQ3veUdJrFgdajxli1pxoMWDLKjFIeoc5kwj+D19sViTbL+xm7FYdZbX08t
         ZSv1WvB87Nr/q1ltS9bftuoTWgj4Z8zpS3dzysHNyAx3uf6w1C3nu0en2OmxlS06/mzP
         qh0iD6LtWkKexAcgVICvRZyxtL4ICRsDx9sN7xjIUEfzLQzOxDZmbq/4IVLecnbtAhxV
         sLkdT7qolMJZOZEzyN8GR8KN+6a7FllKD6tNLvc3u3q2jhjHXTfQvb1KW4KR7DVAq8CV
         Xaig==
X-Forwarded-Encrypted: i=1; AKwUvBwHDaLyPq2QOxkaN1/dfmq0NPYt4G9enzpx0omSLSXIOiqDmX2wAm+yGKIFFfO37wp7Un8YZi/t4s0/MwU=@vger.kernel.org
X-Gm-Message-State: AFuF++kuD3JL/KGdi99WrEEfgEewQoN2vlGPUKXVfFCnkR/UbRJEQ6eE
	6MD5AQJBLgkplwwkN47optNu6XXzJo4wFovUCLrijCcgCp9w+E/0eMYeoP1HaSW2
X-Gm-Gg: AYBFou0l++nar0RiCO26/rAyJqiPKsArvNu+q7Mw1iUPksoYttZJrmDwke19JuC/Q06
	/Cba1A8E3hXU8E+9D0h3DzvidnQsyz1rdaAleZpTDWNeCXR66OdJxPsQPJv85QDtFtJHdxT0OeO
	LVujOG2crr2CPkfUoz56C7VpV+xPYZcO03xLM8XmFknNhREi0bGy63zbLhPkcRZyGqMou/bffYk
	zyEJcOCU5h3IqAhW6vbpMAjcZ8Ae9JhiCjlhWi8qEb+8hy9wNuOQwqMg/1ATNXZPfFMvMDTewcD
	9pSMeqPPUc8pXnmo+HBCbXm58W/vx++XVsRiKzlj47Ha5WnZHvwEb5fnn6jBjqS69z7jVlJmq1j
	Y/s9nbOX3MFvcAMI4jKdkjPKhebd6hbBIApe7iB0jAqzy7xwQ9AvzFyCXupp3tT/Rm2Y/wfpbFb
	DHKPtL3RxJmygh5XRkwAZ90U5wtXXT5JG4xW2yOQ3jFZTskzWx6Cfr72WDXePPQG89oQ6a8pMZv
	GoMQ7VeGGQr
X-Received: by 2002:a17:90b:2d0c:b0:39e:6c6a:208f with SMTP id 98e67ed59e1d1-39e6c6a2272mr3466876a91.48.1789831380501;
        Sat, 19 Sep 2026 08:23:00 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0309d5760sm326230a91.4.2026.09.19.08.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:22:59 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v5 0/3] exfat: speed up file creation in large directories
Date: Sat, 19 Sep 2026 23:22:37 +0800
Message-Id: <20260919152240.1507914-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negative name lookups and empty-entry allocation can repeatedly scan a
directory from the beginning. Bulk creation in a large directory therefore
approaches O(N^2).

This series separates the optimization into three independently reviewable
steps. Patch 1 adds the Bloom filter used to reject definite name misses.
Patch 2 retains and correctly invalidates the next-empty-entry hint.
Patch 3 adds the LRU and shrinker used to reclaim filters under
memory pressure.

Test environment:
  QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
  4 GiB exFAT image, 32 KiB clusters

The measured results were:

                         Before          After
  real                   589.48 s        15.94 s
  user                     4.72 s         4.20 s
  sys                    584.63 s        11.71 s

Changes in v5:
- Rebase the series onto the exFAT maintainer's dev branch.
- Treat every non-negative exfat_find_empty_entry() return value as a
  successful allocation in the volume-label path.
- Record the minimum entry-set size for which a saved empty-entry hint is
  valid. A shorter entry set now rescans from the beginning and can reuse a
  smaller hole that an earlier, longer entry set could not use.

Changes in v4:
- Publish the next-empty-entry hint only after the directory entry set is
  successfully committed, so post-allocation failures cannot skip an unused
  slot.
- Invalidate the destination name filter when rename or move fails because
  the new entry may already exist on disk.

Changes in v3:
- Split the change into Bloom filter, empty-entry hint, and
  shrinker patches.
- Accept filenames containing exactly 255 UTF-16 code units while building
  the Bloom filter.
- Invalidate the empty-entry hint in every path that can free directory
  entries, preventing stale hints from skipping earlier holes.

Changes in v2:
- Move exfat_name_filter_free() to exfat_evict_inode() because
  ->free_inode() may run from an RCU callback in softirq context.

Yang Wen (3):
  exfat: add a Bloom filter for negative name lookups
  exfat: retain the next empty directory entry hint
  exfat: reclaim name filters under memory pressure

 fs/exfat/dir.c      | 293 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  28 ++++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  86 +++++++++++--
 fs/exfat/super.c    |   9 ++
 5 files changed, 408 insertions(+), 9 deletions(-)

-- 
2.34.1
