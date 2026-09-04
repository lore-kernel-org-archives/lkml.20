Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2D8381E83
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506110; cv=none; b=R1tkex8jQAl33LNl8Nn/IjyIALDMDKDcob5t2KkJ3eVRLUalnTdU/4ffNfQV21HgBKWHMWZV808DXiARWLxLd4RPIU8isWB+sRRyJAHyhYoxRlXP6LAbwo67ywZCH58aWOh5jVhueac6AIwBmvpvYGER/AtrCTEV7Vy+dWTd5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506110; c=relaxed/simple;
	bh=g6KBlsEfdQ6twWTWJN7KP2LWVnATn4EXLmzlK1fULfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X4KCU8EEPqWvHy2dXBMxv23+ZcjrXRKdeYiTNiZkYNgcUzYI3MDRplv4vNG8SYJOEMvIfAZLLc7gyyNDK34tRlPjqGZrSEc8TcU0RSbm3VUW97VDiNwD0F3uMneGgaWg1rCxC3I/0PD9Nc0OTUiEISq2Wzjw2JFDblxF3eEBvBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SmcwlpbM; arc=none smtp.client-ip=95.215.58.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SmcwlpbM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g6KBlsEfdQ6twWTWJN7KP2LWVnATn4EXLmzlK1fULfQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788506105; v=1; x=1789110905;
 b=SmcwlpbM66DwGbZwAGp5WX54XzlYShr8QdRDVJ/CTl2r044ow6DG5aMQ7Skoetyd/WB1KzWT
 mKvH0gqiHSLFaRDpJRf9jT7MRJZpn1crzKYFQ+OmtxJgXxrynvdXkflVwYmBb3lo71X9DsTP7p2
 pjubpg3vDhxhY338VPiAKYtc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 90fa9b6c7ea8f2ef;
	Fri, 04 Sep 2026 07:14:55 +0000
X-Mizu-Trace-ID: 90fa9b6c7ea8f2ef
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: axboe@kernel.dk,
	Tang Yizhou <tangyeechou@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>
Cc: tj@kernel.org,
	josef@toxicpanda.com,
	boris@bur.io,
	cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cuitao@kylinos.cn,
	cui.tao@linux.dev,
	Tang Yizhou <yizhou.tang@shopee.com>
Subject: [PATCH v2] blk-cgroup: avoid 32-bit overflow in root io.stat byte accounting
Date: Fri,  4 Sep 2026 15:14:43 +0800
Message-ID: <20260904071443.1283147-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

blkcg_fill_root_iostats() converts per-CPU sector counts to bytes with

    tmp.bytes[BLKG_IOSTAT_READ] += cpu_dkstats->sectors[STAT_READ] << 9;

but disk_stats.sectors is `unsigned long`, and the shift is carried out in
that type before the result is promoted to the u64 accumulator.  On 32-bit
kernels (unsigned long is 32 bits) this wraps, so once a per-CPU counter
reaches 2**23 sectors (~4 GiB) the computed byte count is wrong, corrupting
the root cgroup's io.stat.

Every other sector->byte conversion in the tree casts to a wide type first
((loff_t)sectors << SECTOR_SHIFT in bdev.c, (u64)max_sectors << SECTOR_SHIFT
in blk-settings.c); do the same here.

Fixes: ef45fe470e1e5 ("blk-cgroup: show global disk stats in root cgroup io.stat")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Tang Yizhou <yizhou.tang@shopee.com>

---
Changes in v2:
- Rebase onto current linux-next head (no code change).
- Add the Reviewed-by tags collected on v1 (Bart Van Assche, Tang Yizhou).
- Link to v1: https://lore.kernel.org/r/20260714063118.1153083-1-cui.tao@linux.dev
---
 block/blk-cgroup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 2b5c29434e42..471cfd2347c9 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1118,11 +1118,11 @@ static void blkcg_fill_root_iostats(void)
 				cpu_dkstats->ios[STAT_DISCARD];
 			// convert sectors to bytes
 			tmp.bytes[BLKG_IOSTAT_READ] +=
-				cpu_dkstats->sectors[STAT_READ] << 9;
+				(u64)cpu_dkstats->sectors[STAT_READ] << SECTOR_SHIFT;
 			tmp.bytes[BLKG_IOSTAT_WRITE] +=
-				cpu_dkstats->sectors[STAT_WRITE] << 9;
+				(u64)cpu_dkstats->sectors[STAT_WRITE] << SECTOR_SHIFT;
 			tmp.bytes[BLKG_IOSTAT_DISCARD] +=
-				cpu_dkstats->sectors[STAT_DISCARD] << 9;
+				(u64)cpu_dkstats->sectors[STAT_DISCARD] << SECTOR_SHIFT;
 		}
 
 		flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
-- 
2.43.0

