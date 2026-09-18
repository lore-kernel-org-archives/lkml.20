Received: from mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5333A5453
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718863; cv=none; b=o5YiLQ87HX2VTY66gWxsmjCQfiYbzgB+wo2xWzCu+qrhiABAM/kST7D/DhQ1hxpECdRVqSMSy5mAJQCNzJgkeEzGRQnOI3WmEZTIL6trztiyLXQ+Moi6B1NL+mkbc/OsJnu6Ma2x/HISu5YRulwrEwLzoFjCXPIvJKbJSN2mR7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718863; c=relaxed/simple;
	bh=E0Nmroful7jb3ppWghs4YpOSpLIFZgz+UAPsmrbruq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFfP67QKwT6k+VLLg/htWLJ3jKsNQi/nblKzRegVDoXOdyrJB0HJGtG7GPzoD97b3u98/jOj8+tFXKqNNJoKJPF0O44Dxq2016ThJJAQUk/xfHPQcjbq/xOo7cDRL5X3yr/CY0Ulgb/2u+KK6oXYZr6w6hSW7kethKOxSqo4Obs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fLKMwaM2; arc=none smtp.client-ip=91.218.175.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fLKMwaM2"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E0Nmroful7jb3ppWghs4YpOSpLIFZgz+UAPsmrbruq4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789718859; v=1; x=1790323659;
 b=fLKMwaM23PNgO1xMELdXzMdDD+TPIEVnTAK4etDczmiEQhaLnBMyFLJhyiXasyDiBVgFYNu/
 31XCXaaBREKTLIjB6skmhp++bMkEGOj0IS0gIGNPDrIktXyIC7kGnxTFXsTw94Ucue5hZZ3jbPH
 xt0t1onecmKE+pUrnHdoJUyA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 950ab51559f25ce3;
	Fri, 18 Sep 2026 08:07:39 +0000
X-Mizu-Trace-ID: 950ab51559f25ce3
X-Migadu-Flow: FLOW_OUT
From: Hui Zhu <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [RFC PATCH RESEND v5 0/2] mm/vmscan: fix NR_ISOLATED accounting and throttle MGLRU eviction
Date: Fri, 18 Sep 2026 16:07:18 +0800
Message-ID: <cover.1789718658.git.zhuhui@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hui Zhu <zhuhui@kylinos.cn>

Previously the patch was based on mm-unstable, which caused issues during
Sashiko apply.
So I rebased it onto mm-stable and resend.
Thanks Andrew for the heads-up.

The legacy reclaim path has two mechanisms around isolated folios that
MGLRU lacks:

1. NR_ISOLATED_ANON/FILE counters are updated when folios are isolated
   from the inactive lists. Compaction's too_many_isolated() relies on
   them to decide when to back off. The MGLRU reclaim path never
   updates them, so compaction cannot see MGLRU's in-flight isolation.

2. shrink_inactive_list() throttles direct reclaim via
   too_many_isolated() when isolated folios pile up. MGLRU's
   evict_folios() isolates folios without any such check, so many
   concurrent reclaimers can over-isolate the same (oldest) generation,
   leading to unnecessary swapping, thrashing and premature memcg OOM.

Patch 1 fixes the counter accounting in the MGLRU isolation path.
Patch 2 adds a per-lruvec throttle, mirroring the legacy behavior but
adapted to MGLRU's per-lruvec contention and its dynamic type
selection/fallback.

Testing
=======
Two test scripts are provided to reproduce the problem and validate
the fix. Both are available at:
https://gist.github.com/teawater/3ef51251f2e91a5a600e3d26bb477e34
Test environment: 10 CPU / 8GB QEMU guest, MGLRU enabled, a 16MB
memory cgroup, anonymous working set, swap backed by dm-delay (50ms
read/write delay) to slow swap-out and lengthen the isolation window.

mglru_iso_repro.sh (64 threads, 48MB working set, 60s):
Drives concurrent direct reclaim inside the memcg and measures scan
efficiency, throttle events, in-flight isolation and throughput.
Neither kernel OOMs at this concurrency; the value of the patch shows
in reclaim quality:
                        unpatched       patched
  OOM kills             0               0
  mm_vmscan_throttled   0               35645 (all
                                        VMSCAN_THROTTLE_ISOLATED)
  nr_isolated peak      0 (invisible)   230
  total touches         246,499,132,369 301,456,426,692
  scan efficiency       0.0261          0.0194

The patched kernel completes ~22% more work in the same 60s: the
throttle keeps concurrent reclaimers from trampling the same
generation, so less CPU is burned in reclaim. Note nr_isolated is
always 0 on the unpatched kernel - the over-isolation is invisible
there, which is exactly what patch 1 fixes.

mglru_iso_repro_v2.sh (192 threads, 48MB working set, 60s):
Raises concurrency to the point where over-isolation becomes fatal:
                        unpatched       patched
  OOM kills             1 (task killed) 0
  memcg oom events      51              0
  mm_vmscan_throttled   0               512292 (all
                                        VMSCAN_THROTTLE_ISOLATED)
  total touches         0 (killed)      682,300,003,972

With 192 threads the unpatched kernel cannot keep reclaim ahead of
allocation and the task is OOM-killed; the patched kernel survives the
full run and keeps reclaim making progress.

Changelog:
v5:
According to the comments of Kairun and feedback from the test scripts,
make the throttle check per lruvec (new nr_isolated counter) and skip
empty types in the allowed mask.
v4:
According to the commens of Baolin and Barry, rework patch 2:
drop the throttle_is_throttled() helper extracted
from shrink_inactive_list() and leave the legacy path untouched.
The new MGLRU-only throttle_evictable_types() only sleeps when all
evictable types are over-isolated - v3 throttled as soon as any of
them was, which unnecessarily blocked the reclaim of the other type
and passes the mask of the remaining types to isolate_folios(),
which restricts both its initial choice and its fallback, so that
isolation never lands on a throttled type.  The v3 gate did not
constrain the type actually isolated, so the fallback could still
pick the over-isolated one.
Re-run the tests and update the test log.
v3:
According to the commens of Baolin, remove the redundant nr_isolated
check before restoring the NR_ISOLATED_* counters in evict_folios().
rename the extracted helper to throttle_is_throttled() to avoid
confusion with the existing wake_throttle_isolated() naming space.
Use for_each_evictable_type() in the MGLRU throttle to check each
evictable type's isolation instead of only the type returned by
get_type_to_scan(), since isolate_folios() may fall back to the
other type.
Re-run the tests and update the test log.
v2:
According to the commens of Kairun, Rebased on mm-unstable.
Split into two patches; patch 2 is new and adds the
too_many_isolated() throttling to the MGLRU eviction path, which v1
did not cover.
Add test infomations.

Hui Zhu (2):
  mm/vmscan: fix missing NR_ISOLATED counter update in MGLRU reclaim
    path
  mm/vmscan: throttle MGLRU eviction when isolated folios pile up

 include/linux/mmzone.h |   2 +
 mm/vmscan.c            | 173 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 162 insertions(+), 13 deletions(-)

-- 
2.43.0

