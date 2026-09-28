Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94F4ED1B2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623434; cv=none; b=KqEqQxLKCofOpLCaw+IZpYLO2HOU3o7V7CDHm5dC6ohC9x9B7bibHtl/969aw9py/t0kG1pbZS95i1SjCN4I48+QNzQxgABr+Txhj+WQJkcJD2E3bDhrFYu7FhZefYmGm3+CWdyrMfCxgddGn/sC9BsEDYL0vXPKT7y4Ye2vrsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623434; c=relaxed/simple;
	bh=1FO4mIr9YApwlUx5vl2AfTw0HXIP/muGixvWLNYc9Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ic+q7gDV6RHFYCl4Z6Ng12yY+Y+73UHcIJI6e6RERrSpAKb2n8pjdbIIpMs6F59a5hLUL+zZZKrPTBVSCJoZ3riZ64tYE4DmyaLbdvB7pAuvN53zqN5/pa3oOUvAK1Dbfsx8QoREJast0nDvmsLaZPpZchtTkJMFiE8swpjHUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXh72L6s; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXh72L6s"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-4693691fde7so2165821fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790623430; x=1791228230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lE2pJ7XkaEF8KIFM+yW0Sa/QGywvOMdlIxfH6fFMxqw=;
        b=BXh72L6sP6113C1DubvjLRz+fpeEDG/HC5rStSBB654ENh6/Inzz2wYFcLkSv4EzeM
         UN29fNn0UrwBpoBs6QEMAmj1lulfTIh6vKqYn8y2pH2QFmh2V2YcNKDFuyV1MVHTktAI
         bTsOGdhMTJ1KoGpPev9etKUMRzxoIHqH4d09cDp37EGfOR7qX+0bvvL0jHsTyYwJFZTa
         7+uZO4RVWdNfbzErftqv35xvXDtRSrINd8nNaxWl34kMKMdWRXYkVbw1OnVSIREsa8l2
         KYFv2CK9KFzMmHOt2W2p2gBBXkKaqdxAB/aD+FOSlS9khvCpNJKh4H2kZ65dp+Ku6B7g
         QDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623430; x=1791228230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE2pJ7XkaEF8KIFM+yW0Sa/QGywvOMdlIxfH6fFMxqw=;
        b=BAi2QJp2Tsrji5qaiFeSTmZyd1kJXSrX7EGOlT61KR1SKxEK7zCeJ32w65QgAREXRQ
         nmu5gIbj9s7h+HZAObkc3dFmRu9UdPB5NV6CyPjkirDItoRsc2P1xE/QD5WnyRm5SUs6
         7CgiXcQyMyRHR6WrH+MntLj0NQfyKZ7STXAOVeIsZZhkhE6rdQJTd1918aubS++J/KJU
         gq7F+moOHk2K7Xl5GYWoMuQPX7YhRcHjUVrZASCRJayL/MsSbUXCxf5N4yIUKOub5unu
         swESzaxWN5GZccxejZBuSNdY27pt3srSY3necZOXuW16OoOAkME/zPlw2POVuV6yk9Ey
         sLDA==
X-Forwarded-Encrypted: i=1; AKwUvBzbVkEJsl4qMOOSeDDycnjW8it5ctounPVn6QOw5neNfYCBI7/IzS7gUBcMq+oQPA4ls7YeBzTJgqCdeeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJKfnPe+2r/CWUSFxs96AMzyoREai3Gsz/3rQP1vNMd+U2aefB
	LOGL8BGA7c3DAPF/Il8Zs2/MXLVto1x9k6sPC5nA7dGB+rLKdSPzAw3y0Wuvog==
X-Gm-Gg: AYBFou1T1AWe80/V3YgJs5CZKHZqYvihAt9hftedmlwSslrN5tDa1IaogKrgOlbb73D
	aZHyN/sLhDsBT3Gu66Yw9lArQopaAvd1Ggze6sIu52VyVVFycg9cNjhEqZIDND0YgL21g5lXXIf
	EN/+XaS+VPRaqSSAXHH2XOCnXig9HJhENfhJSylWi/T090YACC3s1GgW1SSclNkC7t207YppCEG
	F5wAuKJq40yDr1OscJgzTjLxN+CmXBBONLmEpRrhTDbfT+nHjs56I11ldR1f7QAskkFwqGt4ROW
	eeW3KhGQHUE500SHd1zXg5nrRYnvpjOgRJ12x1lsxQfNPDKNtxlHUI9QGq49C5GFW7g9bqP5pd5
	IN74gzFjJxGxtjF7e4b1cRJWvOPZYwYbKeWsDDeGu6yT0g1tEfEGkGSIgmVFPA2JeUiliL/aWnZ
	VIxJB6WXajElNb49ibeZm3BIpLQh3IZvJhF2FCb74IqNLewvf6l/z/z+8OqfLKjKLED8aHqwHAn
	bRFzVhXlAqq+RZU+IqzwKDmvQ==
X-Received: by 2002:a05:6871:6c17:b0:448:9d5b:6393 with SMTP id 586e51a60fabf-491e539b5c8mr13913645fac.14.1790623430281;
        Mon, 28 Sep 2026 12:23:50 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49335c7a60fsm10239209fac.12.2026.09.28.12.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:23:49 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v6 RESEND 0/5] mm/page_counter: move stock from mem_cgroup to page_counter
Date: Mon, 28 Sep 2026 12:23:43 -0700
Message-ID: <20260928192349.3432886-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v5 --> v6
=========
Following feedback that v5 combined the (1) stock abstraction move from
memcg to page_counter and (2) changing the allocation / draining
behavior, v6 limits itself to only the first goal. It retains the
existing seven-slot per-CPU design and drain policy.

In the resend, 3/5's commit message was also modified to address
Sashiko's concerns about preexisting memcg semantics about how
charges affect high throttling.

INTRODUCTION
============
Memcg keeps a per-CPU stock of precharged pages so that small, frequent
allocations do not walk the page_counter hierarchy every time.
Today, the stock implementation is within memcontrol code, even though
the operation it caches is a page_counter charge. This makes it
difficult to add new page_counters to a memcg and preserve the fast
path behavior.

This matters for future work like my tiered memcg limits series [1]
which introduces multiple new page_counters to memcg. Without making
stock a page_counter-level property, it means that every memcg charge
now goes through multiple page_counter hierarchy walks, instead of
being able to cache these charges.

To make future page_counters scalable and performant, move stock from
mem_cgroup to page_counter so that each page_counter can opt into its
own per-CPU cache of pre-charged pages.

We get an added benefit of simplifying try_charge_memcg code, which now
has all the stock management handled transparently within the
page_counter layer.

EFFECT ON MEMCG V2 USERS
========================
This series has no functional changes intended for memcg v2 users. We
preserve all draining, refilling, and (un)charging behavior, including
the uncharge path's refills / direct uncharges.

EFFECT ON MEMCG V1 USERS
========================
For memcg v1 users, the decoupling of the memsw and memory stock means
that each of them now manage their own independent stocks and can lead
to a different size of precharged cache for each.

Cgroup v1 has an invariant that memory.memsw.usage_in_bytes is larger
than or equal to memory.usage_in_bytes, because memsw is a superset of
memory. With separate stocking, this could have been broken in scenarios
where the memory stock is bigger than the memsw stock, leading to
memory usage appearing to be inflated and greater than memsw usage,
even though the real usage preserves the invariant.

To prevent this, report the larger value of memory and memsw
usage_in_bytes for memsw reporting, so that the invariant isn't broken.
This is a bounded stock-related overestimate and does not affect
limit enforcement.

Based on latest mm-new as of 9/28/26:
f4e9810097537 "mm/swap, PM: hibernate: atomically replace hibernation pin"

[1] https://lore.kernel.org/all/20260807202059.2620949-1-joshua.hahnjy@gmail.com/
Joshua Hahn (5):
  mm/memcontrol: flatten try_charge_memcg control flow
  mm/page_counter: introduce per-CPU stock
  mm/page_counter: make page_counter_try_charge() stock-aware
  mm/memcontrol: move memory stock to page counters
  mm/memcontrol: add stock to the memsw page counter

 include/linux/page_counter.h |  35 +++-
 kernel/cgroup/dmem.c         |   2 +-
 mm/hugetlb_cgroup.c          |   2 +-
 mm/memcontrol-v1.c           |  12 +-
 mm/memcontrol.c              | 328 ++++++++++-------------------------
 mm/page_counter.c            | 209 ++++++++++++++++++++--
 6 files changed, 334 insertions(+), 254 deletions(-)

-- 
2.53.0-Meta

