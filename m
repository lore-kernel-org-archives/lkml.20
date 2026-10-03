Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661712E7F3A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790989935; cv=none; b=gIkEvkR6zofJB4HAeEA9HoSWWozNE8TSJPDRn0z36ZanC5b8RJYt+6BgMJ4jjdhuulnBkt/xVsLobgO6gLxHWywbwzPNIo0S1YJdXannUlpXoXmrO9RFPwYSPQQ8VBQ6qKd3qixc7dvo90lTYZAz/eeqrqu8YUxhf+05TXHel80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790989935; c=relaxed/simple;
	bh=Bh9GZJqa6QKL6+fmXkwb6LfuZrhG/VHeRdP+HDYrw0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=dMcMBVuEkX/BpGsKyK5waXMutkrCwJSNJ69I3pbGykGm9iLq3woYlqQ+O0P3kkLjioYCKYseKLJbMQybYYViUoVzq1ClTkVWHzH2DttyTDLbnM+7gHov/HjDDaa+52T4wYZsVbmWSGjp7MHayklzFr2zQ2+MmDGavRrgwkxTtCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7a2a3e67e205a4ec;
	Sat, 03 Oct 2026 01:11:54 +0000
X-Mizu-Trace-ID: 7a2a3e67e205a4ec
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	tj@kernel.org,
	mkoutny@suse.com,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 5/6] mm, swap: do not retake the cluster lock when uncharging an xswap slot
Date: Sat,  3 Oct 2026 09:11:10 +0800
Message-ID: <20261003011111.1003090-6-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
References: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

xswap_release_slot_backend() runs with ci->lock held. Its callers free
the slots of a cluster they have locked. It called
xswap_backend_uncharge() to give the swap charge back, and that takes
the same cluster lock again to read the owner out of the swap table.

A spinlock is not recursive, so it spins forever. The swapin path hangs
on it:

  do_swap_page
    folio_free_swap
      swap_cache_del_folio
        __swap_cluster_free_entries
          xswap_release_slot_backend
            xswap_backend_uncharge      <- spins here

Read the owner from ci directly instead. The lock is already held, and
the cgroup id is still in the swap table at this point: the loop clears
it after this call.

xswap_backend_uncharge() stays for xswap_backend_free(), which runs
without the cluster lock.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index a3d4561566eb..419d19f3b98c 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3313,6 +3313,7 @@ static void xswap_release_slot_backend(struct swap_info_struct *si,
 {
 	swp_entry_t entry = swp_entry(si->type, cluster_offset(si, ci) + slot);
 	struct swap_info_struct *psi;
+	unsigned short id = xswap_entry_id(ci, slot);
 	swp_entry_t phys = { .val = ci->xs_table[slot] };
 
 	WRITE_ONCE(ci->xs_table[slot], 0);
@@ -3321,7 +3322,13 @@ static void xswap_release_slot_backend(struct swap_info_struct *si,
 	if (psi)
 		xswap_free_phys_slot(psi, entry, phys);
 
-	xswap_backend_uncharge(entry, 1);
+	/*
+	 * ci->lock is held here, so read the owner out of the swap table
+	 * directly. xswap_backend_uncharge() would take the same lock
+	 * again, and a spinlock is not recursive.
+	 */
+	if (id)
+		mem_cgroup_swap_uncharge(id, 1);
 }
 
 /*
-- 
2.54.0

