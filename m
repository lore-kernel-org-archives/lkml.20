Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C985242925
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788657527; cv=none; b=um2j4T/eKc+HnsyY2oAY3EGYqMyk2eHywnVEYS3dKZyN6ijfKSxjpSSWBKnJnymz7LoP3EyjxqwyB/yj8SKpLwB9WyE1ro9lJuYn7/PCtWCUG8G8qbUrwTzFI7whYGExY6djaa4gGpQ9m0GvzIIPGOn2q67ykSIYtboyVNJ6GFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788657527; c=relaxed/simple;
	bh=+vQ3C0AKhkdy7A8I7Q6xZYvm7oOwojkJjsP0fx+Fhdg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nmLxp3bKmmhqnXGeBhvoTrA0L8wC670wxJ+FIAqJ3v+dZMEyJ4x4CJbY4Mk2L5pF2NFqrBKx3PW7fW2PIsFcQ1WEDIb5kQOU205cptdSpaMN94PRR44Es5xv/YAe6kq6x4GCrkAyNKbXMrAbBm59CgapE52+7jLCf7Xv98EvlZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eeev8K58; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eeev8K58"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71ae3455aso30995875ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788657525; x=1789262325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ywe2sHtINpj8rB0jtyYuL7DLOlKzJ3vQHaEJq2LOGaw=;
        b=Eeev8K58pEBrV1wTeMObhA0nvpptUFUcFBpC5Ng1tKp3mcxdI+Bg0BKd1SR4TxImdX
         0nuEZn2XZG6JersxlWGFyCJLY5w0E7PEUCCflBBNUVv8vOJdFhLTDONX+ANYm9hTarMS
         jiTWiEadM0KgK8zAQsHNiA+ATcwblDC4HYnpxuNViDWMiZuyjwhH96CGOUHjo2d0f3pr
         g0LOC7MktEzJguaFG9k7sYc0m6l9WGIWW3DpJ6iEmMzdw3MXzFntzTTW5ulgPoaaCi94
         zBZgsbcoG72UibkC0e9ablYtfac92jfIpDqGfTbUXc6VF03M3jRNt72G8uqTgMruMe3D
         2rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788657525; x=1789262325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ywe2sHtINpj8rB0jtyYuL7DLOlKzJ3vQHaEJq2LOGaw=;
        b=I6fJvqons3mrQQsbSBmlir/l2b5VJfQC+fJvk7ibFa/SC2CBQDD8BcuefrNOUbdqPS
         gDUCrLRL4H9NE8p6//i1JgQZupxyTRVYSKdOcS2qKaE+jCmG8j7iU9pmo5hyT6+8LFxe
         q88QUoTdQYuUV8ltPsSxCZXUIQn3sjqXR51TiqwCXyu2s7zjqklj9qRK6iCF+SrvaGtU
         MxNJof21cf5x5phIHf4Zn2d9gZaxl24UzUiA+lFRRILFN62p/2toE6xxQyT56sbNqwfO
         yEajbmaWBiRkO43tgZXH8W7pp0HcfzlyiTeIRrVzPuDGNPAWD19NeSeMOrY9RiBqfjBs
         pBHg==
X-Forwarded-Encrypted: i=1; AKwUvByUlnKM6kT9+1UoFwTm2sINShocKP8uc2cweuT9UaHGv1V+oFsRbD0WfaUEzXhRMp1ZsH6y7anPhfDkceg=@vger.kernel.org
X-Gm-Message-State: AFuF++m70uLtvd7KN+NR1ix8+oLidh7eTyLJvsypx7pakkNszOAZ+M2G
	Qz2FqEptqvL50fMapUApFHHwOqmgUAPMlbtiEJ0kqeR/rClDOQVOORzb
X-Gm-Gg: AYBFou1Uest2xGW2bnc8RIg2t7UuGJlPeBwCvdUHM9v2JVxTYCbvDDTQEfUysvLG0T2
	qoj8dCtcjmUVWScRozHz13mg7eNuo3mQ3c/4jzj6oqTXGmIoBPYRGbi9OyEDmuYrrdc16S22ni+
	4oTKCkXLHXlfxb9mPh9M3qwVOvestjFhURqMiWz87Y2vHjclQEo13HmWMnd8R1nY2nJv8Ve6NaD
	Z+3Jz6tbltSPl5Q2CBAIrBylM8M0gXY69Yz7k/DdBgktHHoxZUrBF7aj6zjwZlfK5O6dEo2H8p4
	1OofuHvw+UyUP0CRdUvyZyHWpnK76qMf94htBKVcVRgabuqBtxdWD2JAUXgb0trf/Qmq9Xrk/s0
	uwtMB5cDmkwTN6ooEtV3TTWgAjFwJPYMkXGrf4uweC3THX3dxbjkbncMSP63SeElH7sps3deL7A
	Msol73OJnx3EfKWCstg9eBqqTJtdiwGWB8SCHxIk6DnWgxh6gsI+2tUt7S6/NDj/88gt2hBFtXD
	DWKGEEwcIVrB7og
X-Received: by 2002:a17:903:2b0d:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2db1284b6dfmr222969445ad.15.1788657525544;
        Sat, 05 Sep 2026 18:18:45 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c3b80sm26905965ad.63.2026.09.05.18.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 18:18:45 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: baohua@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
Date: Sun,  6 Sep 2026 09:18:20 +0800
Message-Id: <20260906011820.382381-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have observed some cases where memory is allocated with GFP_NOIO, so
we cannot reclaim any anon folios unless they are in swapcache. We can
end up spending more than 150 ms looping in `shrink_folio_list()` scanning
non-swapcache folios without reclaiming a single folio. This is pure
overhead.

This is particularly true on systems using zRAM, where swapcache is
relatively rare. So let's check whether anon reclaim is allowed by
GFP_IO and whether there is enough swapcache to make it worthwhile. If
the swapcache is extremely low, we're essentially searching for a
needle in a haystack, so let's avoid scanning anon in the first place.

On Android this is triggered by dm-verity hash-block reads through
dm-bufio, which use GFP_NOIO:

  verity_verify_io -> verity_hash_for_block -> verity_verify_level
    -> dm_bufio_read_with_ioprio -> new_read -> __bufio_new
      -> alloc_buffer
         gfp: GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN

Such a reclaimer can land on a memcg with a large, unswapped anon LRU and
a tiny file LRU (e.g. inactive_anon ~335 MB vs inactive_file ~4 MB, with
negligible swapcache). shrink_lruvec() then keeps feeding that huge anon
list into shrink_folio_list() - ~2400 shrink_folio_list() calls, ~93,000
anon folios scanned - where every folio is kept because it needs IO. The
150+ ms above is one such single shrink_lruvec() pass (not accumulated
across a reclaim cycle), and it reclaims nothing; the actual progress
comes entirely from the file side.

Aging anon alongside file does have some value for a later __GFP_IO
reclaimer, so it is not strictly pure overhead. But that aging is only
deferred, not lost: kswapd and other __GFP_IO reclaimers still walk and
age anon. Spending ~168 ms aging memory that this context cannot reclaim
is not a worthwhile trade-off in a latency-sensitive path.

To stay conservative, this only skips anon when the swapcache is really
tiny - below 1/64 of the anon LRU - i.e. when essentially no anon on the
list can be reclaimed without IO. Whenever there is a meaningful amount of
swapcached anon, the normal path is used and anon is scanned and aged as
before.

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
v1 -> v2:
 - Use mem_cgroup_lruvec() instead of get_lruvec(), which returns the raw
   node lruvec for a NULL memcg and would be misinterpreted by
   lruvec_page_state()'s container_of() during global reclaim. This also
   drops the get_lruvec() move. (reported by the sashiko bot, suggested
   by Barry Song)
 - Drop the SWAP_CLUSTER_MAX cap on the threshold; the check is purely
   proportional now (swapcache below 1/64 of the anon LRU).
 - Expand the changelog with the workload, the dm-verity/dm-bufio NOIO
   stack, the ~168 ms single shrink_lruvec() breakdown, and the aging
   trade-off discussed with Johannes Weiner.

 mm/vmscan.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 245f68c75b28..e20ac2cb4dd5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -362,6 +362,23 @@ static bool can_demote(int nid, struct scan_control *sc,
 	return !nodes_empty(allowed_mask);
 }
 
+static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
+		int nid, struct scan_control *sc)
+{
+	struct lruvec *lruvec;
+	unsigned long anon_pages, swapcache;
+
+	if (!sc || (sc->gfp_mask & __GFP_IO))
+		return false;
+
+	lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
+	anon_pages = lruvec_page_state(lruvec, NR_INACTIVE_ANON) +
+		     lruvec_page_state(lruvec, NR_ACTIVE_ANON);
+	swapcache = lruvec_page_state(lruvec, NR_SWAPCACHE);
+
+	return swapcache < (anon_pages >> 6);
+}
+
 static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
 					  int nid,
 					  struct scan_control *sc)
@@ -371,11 +388,13 @@ static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
 		 * For non-memcg reclaim, is there
 		 * space in any swap device?
 		 */
-		if (get_nr_swap_pages() > 0)
+		if (get_nr_swap_pages() > 0 &&
+		    !reclaimable_anon_is_low(memcg, nid, sc))
 			return true;
 	} else {
 		/* Is the memcg below its swap limit? */
-		if (mem_cgroup_get_nr_swap_pages(memcg) > 0)
+		if (mem_cgroup_get_nr_swap_pages(memcg) > 0 &&
+		    !reclaimable_anon_is_low(memcg, nid, sc))
 			return true;
 	}
 
-- 
2.34.1

