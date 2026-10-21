Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615707;
	b=npHPkvLVIkicyX3X1OC1xJV1t420wQCw/xok7yExgXLG0PXuj2TohU2bEaJdNwjnReiI
	 axweG4LCgv9trrtnkLrEr+NvcOOBXUhoPUi4qBEP4zHizZ2atjo6FOsiWpfJiMFoMhQvZ
	 jMYUq+astsn03lfZZgltI5+OxC+v+GJmSQwchh1S/Lawwi/Er3ueu7Lw0ksfoGz0zuLDW
	 soNZUQmNQbpdHZgm0dhz3OhuvHodybNYVvhYPy5tNLVm5qnARyfFPRXJt1w4Y8lrTA9Hh
	 /QCJciI0weu7h1LZ6BAVY8oCkrLYLGPXi8xT6SoJCHKrkeq5XHDCCBlw+aoD9fOUvow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615707;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6rUMDLFXufXDaESzYj+9ZndTGVI79zhxIDwrHIe4u+k=;
	b=RIUErgOPNzbfmnVkW+dNJ0i3+00skuAPZBykE5urxp8jNkCqgmrogX7r7BdDHs5xbGXz
	 aztRqMkLRVLPa0UbjjOeSHbxUOn6YtfyAMQjBqeIqi61XQAkjSHGJZVwrm1U3dNkbGgWa
	 bXLEU+t8Q10gf5/IcS0NuuyGO+oxBNL2F6hT6+nm6+rboMb1c7MjRq771Ppi6r+PChFia
	 DzXDlNefkpD95ZufUXoXV1arDFwqDcjB4I3IAQxc0M4vzseU3sOS9DEw6hO8sQ/1xjPFW
	 lyqK/5X5UH3RsN/TN3HHgSvRCzmGISpOaZ4tvwfklPxE7iE9BoIhCU7579JieP/mu0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kNHzWUKh;
	arc=none smtp.remote-ip=95.215.58.163
Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05063606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05063606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kNHzWUKh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+AiOmE1TdqOARmJDv1cMb8HWamB96s35l1LjYS9KVD8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792615704; v=1; x=1793220504;
 b=kNHzWUKhUT6nfr8AUMoVmehPg7pSMDXUvzGPCSWVkfW8+8hj3iBIwTl5vLKnjA4HooFqZjGN
 o27gI6gi9HqO6BHsWSGUz/6EJ33QNGdawWOPFRDKLQYCV6LTVbtujHTuvam0Vr89bh+DCQKT8UI
 w/4Ntz3+6lziqgcxX8gYUTsU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 16fb233232d2ba21;
	Wed, 21 Oct 2026 20:48:23 +0000
X-Mizu-Trace-ID: 16fb233232d2ba21
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Chris Down <chris@chrisdown.name>,
	Meta kernel team <kernel-team@meta.com>,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] mm/page_counter: use WRITE_ONCE() for emin/elow when parent is the root
Date: Wed, 21 Oct 2026 13:48:18 -0700
Message-ID: <20261021204818.3431099-1-shakeel.butt@linux.dev>
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

page_counter_calculate_protection() runs without locks. Several
reclaimers can update the same counter's emin and elow at the same
time, and readers such as mem_cgroup_below_min(), mem_cgroup_protection()
and the dmem eviction code load them with READ_ONCE().

Commit b3a7822e5e75 ("mm, memcg: prevent mem_cgroup_protected store
tearing") made the main path store emin and elow with WRITE_ONCE(), but
it missed the early return for a counter whose parent is the reclaim
root. Those two stores are the only plain accesses to emin and elow
left.

With CONFIG_KCSAN_STRICT=y, a few tasks writing to the same cgroup's
memory.reclaim trigger reports like this within seconds:

  BUG: KCSAN: data-race in page_counter_calculate_protection / shrink_node

  read (marked) to 0xff1f91b146d40e40 of 8 bytes by task 163 on cpu 4:
   shrink_node+0x57a/0x1210
   do_try_to_free_pages+0x194/0x930
   try_to_free_mem_cgroup_pages+0x204/0x3f0
   user_proactive_reclaim+0x28a/0x4d0
   memory_reclaim+0x35/0x50
   ...

  write to 0xff1f91b146d40e40 of 8 bytes by task 167 on cpu 6:
   page_counter_calculate_protection+0x1fa/0x360
   mem_cgroup_calculate_protection+0x4e/0x70
   shrink_node+0x53e/0x1210
   ...

The default KCSAN config does not report it, because it treats aligned
word-sized plain writes as atomic.

Use WRITE_ONCE() for these two stores as well.

There is no functional change. Readers already accept stale values, and
compilers emit a single word-sized store either way: with GCC 14 the
x86-64 object code is the same before and after this change.

Fixes: b3a7822e5e75 ("mm, memcg: prevent mem_cgroup_protected store tearing")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 mm/page_counter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/page_counter.c b/mm/page_counter.c
index 9167ffd1380c..5293460831f8 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -472,8 +472,8 @@ void page_counter_calculate_protection(struct page_counter *root,
 		return;
 
 	if (parent == root) {
-		counter->emin = READ_ONCE(counter->min);
-		counter->elow = READ_ONCE(counter->low);
+		WRITE_ONCE(counter->emin, READ_ONCE(counter->min));
+		WRITE_ONCE(counter->elow, READ_ONCE(counter->low));
 		return;
 	}
 
-- 
2.53.0-Meta

