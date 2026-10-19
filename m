Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425978;
	b=L5bi6z0GuksWFQ4LKFO3GFNoWQaHq09+O5VZWsN8jmTQSNVuf5hVKuPddFtNnx6km3LN
	 vVaxmxMzAmuUQJUn0WZ/1rDue/iWUJTJLIiNO6aYkH0tOBo5VZFohtSOJKmmDXqHIgVws
	 ClXWvhlN/Il3jqdaxNC2Rhw+lwrNELQoPfqiVwwSCvAwCJ1LNFV8agMbKK5IuLy6lZQu2
	 OdR/yDPzBVUu0kp7Bhnf65WYWl308LwdJ6fzYopQ++aX71eD2GEL1ngwrZrUoGEG0diF3
	 wFdHWeguJ6/Hvu8QylKvH5CW/IhOvu6GKytnFE48h42iHl9fbXmGyvEN11lhGIl1e8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E9RGSCGYGB/E4l/ib4WPi1HDJ9J2vhJoK5I5QF5CWgQ=;
	b=4ZD6CcTQqpAMd4H2kPGqZ48TWkYKM1HM1c8i1nalSDAjv450cVerjgRlRiHes0y+qhWk
	 QJgr3FoZJheC2xUFBzSfV6MaJm8dGpxZsr2oeFkS+/wlsj1Tn2pZB8CcJY6rvV4a9aI+x
	 QP6HF+0QMu/45Y3EPIUNE/QSrbAtzx58lcoyAVEqTqYFY6s4wrTG3Gh+DoNGjmH5tktvh
	 qbGBWLhHloUq9BecA676Vzn7WugZGHCp5SiaKrO40w/+IrDV4mtqxlo/yFez5xQCehk6X
	 9GzVXuKfOTcePqQnXB85b6QZohGLCGOdv5E9IHoF+JN5pxbSeldgsyVEmVNP5XT5QzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y2MnjJrb;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1A6606AFA7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B1A6606AFA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y2MnjJrb
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-702fd86d674so1377857eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792425977; x=1793030777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E9RGSCGYGB/E4l/ib4WPi1HDJ9J2vhJoK5I5QF5CWgQ=;
        b=Y2MnjJrbBJCKovtMHLJtH3hpqjQjmfVqwAmhFBeDoUXTASqkVruRoBOgZHtP6sXcYH
         9ZS7JZGko1kTba/F7+m+cEx6nR3M4Z/5RFveUB1ReKsrrWZOxZ2qEEeJnIZfTqurO0l5
         3J4LkEr6ysMTNansy7E05s6y8RPUVtJ/By7nzBiDPHr1hS1ujxwXm28AymkFC2iGy4Rg
         QqqDTus/+Z51w+D/cKzBe4kLAoLrc5o1RWixuUX5kf923hOCacjOPF+iBf5kYrX2ElZN
         Epa1vyOgzSHh+mvVqrPd8nPF4t8JpDjMZ9T6CNrhl8VOenNsUcYH5WG9QaZ9cByBuDse
         lihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425977; x=1793030777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9RGSCGYGB/E4l/ib4WPi1HDJ9J2vhJoK5I5QF5CWgQ=;
        b=qGWXMc1Ko+y8Xl0rEiQA3jCc6GN3qqDWfkNsNiZewlV88/t0MATOPqrACSjuu/ksdO
         Az06x3RrlQKtNIyyB0JU6rnW13clL/XvvwMvzNRJAkG60XJAr7VwGY4uy57itBPzbfCZ
         HiEjbBTV4l4GvWoY2UvZA2BMn2eI0xlO4dbZiUqfSjO6GILsameqpu3Qzat5UZB/UTA7
         ZqarVC7WmfpgCMPDCCWfIMDf6xBLJLPdKRUlepvqQutcg5M9R47GhQ03VLiNVKX359D4
         CeHEL2yS/CR4ArW7byM3bNe447+zEtQ/JRUnxRHBVHzkjUGM94AldPuSy66K2Wb+EtqN
         GVwg==
X-Forwarded-Encrypted: i=1; AKwUvBzVXPywM6U5aCLD4yb+TF750+39E/6AZ+Z/m4LGGihThy6p2Fd5LVb2pbwHiee1xkN1XnwT+bAPCC1L9Us=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY8pwOnnWKeXxTejZ5eINAFY2KyphPTfzsjqB3hsdjyFxi994k
	PRLSICyNkxg9IIXGlJrbGypAcDZKfICj6tcGH33pw/diLbqmPHPltsPq
X-Gm-Gg: AYBFou2FY5gqh47KpfFOaYFlP4c4d6kJ74WM+9Bth+1CTQwaaRcgtJoLq3wHQanrAE9
	k5hzeTo6+fYkj53z64geG77htyDu0OB5tPekGB0Zau4MWUsuHrw3USq3jj8slwIhEIBZa7DKkc2
	6X+GYOr0Sn0XDyfS4fuAQ7eXkyBbeYEIxyM7d6PHzpaZh8eY26lyZ/Ccbt7y8Gmcnb0w0+f2wus
	FVneIZqPKhQSWxiH0EisQO1hriekoHiEv7N5o/aE4RtyIpdpn11j4MLNgyBmse0JMVTuGASHhy3
	gOScq6mpBCS9Ie7+sy+a1MtWoViBUbtJC0gY7UOs0445zsGy104fRWIOMSUZ7ZP5B5W7NbtZl7f
	FWdgm2ADQEft8Dxhed0GyLxTTtPhS6aUQou/baY836Qr1DzCovWVjFA9q3YoHQeCtVyAK0lNrIy
	VoAQCeOYccrrBtJyNEwKzt2HL0bCMJeY2i6CAz+9buSNJbH/qWbvIlQ8Kcb7SpEtlchfVAU7igV
	q/uIdmvnhdJSqDmuKAaBipetuNbTHYPfNs2TShxlSrpAchRd4jIlbhuiTsmZ3zd7mQnl0FBKe3L
	PqfPfQ==
X-Received: by 2002:a05:6820:4b09:b0:702:31a1:9049 with SMTP id 006d021491bc7-70356aa41b7mr5416083eaf.36.1792425977222;
        Mon, 19 Oct 2026 09:06:17 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:3::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b63cff2sm8248666fac.7.2026.10.19.09.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:06:16 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mm, swap: revalidate populated clusters before scanning
Date: Mon, 19 Oct 2026 09:06:15 -0700
Message-ID: <20261019160615.2348500-1-nphamcs@gmail.com>
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

swap_cluster_populate() can publish a cluster's table with the cluster
lock dropped. A cached allocator can use and empty it before the
populating allocator reacquires the lock. The resumed scan can then
dereference a NULL table.

For example, CPU1 can retain a cached cluster offset on an SSD with
per-page discard disabled:

    CPU0                          CPU1
    ----                          ----
    swap_cluster_populate()
      swap_cluster_alloc_table() fails
      spin_unlock(&ci->lock)
      local_unlock(&percpu_swap_cluster.lock)
      swap_cluster_alloc_table()
        rcu_assign_pointer(ci->table, table)
                                  swap_alloc_fast()
                                  local_unlock(&percpu_swap_cluster.lock)
                                  mem_cgroup_try_charge_swap() fails
                                  swap_cache_del_folio()
                                    __swap_cluster_free_entries()
                                      free_cluster()
                                        __free_cluster()
                                          swap_cluster_free_table()
                                            rcu_assign_pointer(..., NULL)
      local_lock(&percpu_swap_cluster.lock)
      spin_lock(&ci->lock)
      return ci
    alloc_swap_scan_cluster()
      cluster_scan_range()
        __swap_table_get()

Reject an unusable cluster under its lock before scanning it. Relocate
it only while its table is present.

Fixes: cdd77f84d966 ("mm, swap: consolidate cluster allocation helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c3288910b3e3..988b7316e0a1 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -981,7 +981,11 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	bool need_reclaim, ret, usable;
 
 	lockdep_assert_held(&ci->lock);
-	VM_WARN_ON(!cluster_is_usable(ci, order));
+	if (!cluster_is_usable(ci, order)) {
+		if (cluster_table_is_alloced(ci))
+			relocate_cluster(si, ci);
+		goto out_unlock;
+	}
 
 	if (end < nr_pages || ci->count + nr_pages > SWAPFILE_CLUSTER)
 		goto out;
@@ -1010,6 +1014,7 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	}
 out:
 	relocate_cluster(si, ci);
+out_unlock:
 	swap_cluster_unlock(ci);
 	if (si->flags & SWP_SOLIDSTATE) {
 		this_cpu_write(percpu_swap_cluster.offset[order], next);

base-commit: 4dbe24720eb3811563cd56b35d87ddf3f9beed2a
-- 
2.53.0-Meta

