Received: from mta0.migadu.com (out-195.mta0.migadu.com [91.218.175.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4607A204C31
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788049288; cv=none; b=uJYuiyfkPECKMtlURaEhjZbNyQlTQV9ej9RC+SXOBiXrFvvFEmEh48gn5Yhy0oLr8KXeDwya/aAF0u7mXHIfp4ewOvdLXfEjqPvKf2oJ3ZPPbLosMGi83xIAB37cJ6J+QJQn3vW/M7graieHoPicQ7zaI3uUO9JuwNHbvzME+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788049288; c=relaxed/simple;
	bh=QVlkSSSS5i8xu5m23D1SnKfFAtjaOMB8/90a5M4Lomc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=upFxz+EM34vZyJVSKNinT0fTd/b/phenAuCR4WdChROapjG6dE1aeVBKM+QIH2nspplKCUtYRKx9pged22NiUR+OnqQkEPfAGi5oP69Ak6388dvHqxYdB3qdEqqM07M+SgQSuhfUl5PCoSbnmI+J3bK4gVVUuoVb7e4muCDlRvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LY7mmaoF; arc=none smtp.client-ip=91.218.175.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LY7mmaoF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QVlkSSSS5i8xu5m23D1SnKfFAtjaOMB8/90a5M4Lomc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788049283; v=1; x=1788654083;
 b=LY7mmaoFxuUqir6SolTLvQ+wvq8vrtMjPYce7Zee0eOgPQXpj8wiy9VyV9C+3Kccn45pZhjw
 jiI3OEXMBfy1SNNWMhOkzo4y/6KiAgp+ifvwDKY9sQ/8kD1clnTnfS5rGW9K9odjlbrrCduLDZ8
 Fx0eqTyxod/bxqrkadPTOJNU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5c14cddd30220827;
	Sun, 30 Aug 2026 00:21:22 +0000
X-Mizu-Trace-ID: 5c14cddd30220827
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	David Finkel <davidf@vimeo.com>,
	cgroups@vger.kernel.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	linux-mm@kvack.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	linux-kernel@vger.kernel.org,
	Tao Cui <cuitao@kylinos.cn>,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v4 RESEND 1/2] memcg: acquire peaks_lock when reading memory.peak
Date: Sun, 30 Aug 2026 08:20:43 +0800
Message-Id: <20260830002044.1938621-2-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830002044.1938621-1-ridong.chen@linux.dev>
References: <20260830002044.1938621-1-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

Sashiko reported that a reader can transiently observe a lower peak
within a race window [1]. peak_show() returns
max(local_watermark, ofp->value), but peak_write() updates those two
under peaks_lock while the reader takes no lock. The interleaving is:

  writer (reset on fd A)                 reader (fd B)
  ----------------------                 -------------
  usage = page_counter_read(pc)
  WRITE_ONCE(local_watermark, usage)
  // watermark lowered to usage
                                         lw  = READ_ONCE(local_watermark)
                                         // sees the lowered usage
                                         val = READ_ONCE(ofp->value)
                                         // B's value not updated yet
                                         return max(lw, val)
                                         // both low -> low peak
  WRITE_ONCE(peer_ctx->value, usage)
  // B updated, but too late

Fix it by acquiring peaks_lock when reading the peak, so the reader sees
a consistent snapshot of local_watermark and the per-fd values. The same
race applies to memory.swap.peak, which shares peaks_lock and the
peak_write() path, so take the lock there as well.

[1] https://sashiko.dev/#/patchset/20260730115314.1069089-1-ridong.chen@linux.dev?part=1

Fixes: c6f53ed8f213 ("mm, memcg: cg2 memory{.swap,}.peak write handlers")
Assisted-by: Claude:claude-opus-4-8
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/memcontrol.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 095050d4296a..b84f448fe984 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -4719,6 +4719,7 @@ static int memory_peak_show(struct seq_file *sf, void *v)
 {
 	struct mem_cgroup *memcg = mem_cgroup_from_css(seq_css(sf));
 
+	guard(spinlock)(&memcg->peaks_lock);
 	return peak_show(sf, v, &memcg->memory);
 }
 
@@ -5909,6 +5910,7 @@ static int swap_peak_show(struct seq_file *sf, void *v)
 {
 	struct mem_cgroup *memcg = mem_cgroup_from_css(seq_css(sf));
 
+	guard(spinlock)(&memcg->peaks_lock);
 	return peak_show(sf, v, &memcg->swap);
 }
 
-- 
2.34.1

