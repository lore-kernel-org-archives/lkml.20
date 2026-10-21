Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623318;
	b=TLklT89KbWejfrKEHZtGzC/imdpbLAQwtImHRUd/0NEPQcorqStZylnmJNPSFMBPNfuR
	 wLmmuggP88XqKVsM5Mmojo9QWEfOf7aow8jWBSixv/7bhvAbrdgf3mcBSJya7iyXaZU0f
	 +JSv7yhz2JbzYHiGGMTTxGgnF5Ha5uaE4mVq0YfIBceasXaXVJJkKyhdD8Iz4qSFlTwkP
	 QFEFOPB+h8Irx/tWP6ZkEd7UBLTRDWUmWtzIFBdfM4fJfkQ8gKTpB54i8CB6u4jtktarE
	 7xUEwWTMIKer6ZMH0NGC23F9U5VhggLl2eMe+iejBUTxY2j0++8rnKALGVwLR4t2dyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ojYKRRox9AI6+Vsc6Ju99ox5/83lSqiRHyNpYAnar/c=;
	b=rRT7rqD1FojPSfziYS7B1vmL1v6hVo4J6WGMv97HCE8PdyKR7R9hcA/OZBH2szuJLkwE
	 guXy2zI2x11ffYOTENnmMb80w57VpC8c0lvT05u4rS/JYr/zPfH6z100OyV2FYoS8ozpr
	 jOTTXniAWxE2pqinoJdbU9QiEjvmRyPlHKr1KAX17V6xM6nvWtIDg/Cq4Yyo+FMML1jz6
	 /w2GX+uTaLm6fbOdWN0ZXI1VCIsFjTCNlfIXKdvzAXZEZdQtydvR0zJF97tq1WeKn2ipm
	 arZICaULyhfAaFSBE/nRFqk3tpDk9NXtseuFC02SZX6IZXEs+EO65J7Ekj7IU8EilAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XTIkwx5c;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B499606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B499606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XTIkwx5c
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67990a45e02so1230351d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623317; x=1793228117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojYKRRox9AI6+Vsc6Ju99ox5/83lSqiRHyNpYAnar/c=;
        b=XTIkwx5cMqrzkwOg6qh+ym2h+sbuZmFAVVgVO8OJ9Pod6y6Lzuloqvt/fyNNtK3hcR
         dik5ARGZ+MUzStdAbVwon62Kg+uai0/iYYzMR0VH/xRc9mP98ZSPRrTej/mLaHyg/YUl
         Rr5XuimzOLvObWxyiEwdGLqOIhcpaxF7W4/T6REweVPb7b1xujqtiCboMR9ZJNcOs8ml
         /rUMUuW8/ur/jSNcYBEuYk83Fg2wnD48cA9avXknoygxjS2nTULm2G8MzNWDiFQg3Q1N
         6QLb14ror+ptcUyWmiA8MvPtQOfWHJlmNfVdJs+myUOC4r+In8rNLp8LbM8iS77WsTfH
         4wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623317; x=1793228117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojYKRRox9AI6+Vsc6Ju99ox5/83lSqiRHyNpYAnar/c=;
        b=E2qIB00AZ/3V7fxjpcHfNl35bBjIQm2SKGSR8Lqy0NE3bNtJdONyG7KxfjLhTTkTlN
         kRvNflRQvT8BAllJF7Babq5CBxbATjP4WN6aQslSTR8JxuPc8nf6dwOAKxbrBZhmwFf/
         O6YfeMki5taukKkaAy8kw5xYOEtAajL9+iwr7FQsvGBwW91R163Kceis/+RAPuw6muo2
         lgG6Kyy1C9Lxf+ty/ZokWc4/zOpuxve1KKW+jOsD6iFQDeUKSMnMT1FK/nzHDXEFTw76
         9UXP/aq1kTBGD7l3ded9bAAIEfxSpaFDMXGNt+vLc7+FfNt6jcJ+a7QohbKvtaIQD6Dv
         0Btw==
X-Forwarded-Encrypted: i=1; AKwUvBw6ZH+QEoCjc8xKjMN24xbydtfF1IpAwveAYtouvMKWP/ioMS5whJsSaeFYgOALaXXxTHchBQtNL+iSarQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU7XCrb2BJOJX5LWT84d3wMw+0VUNnqCLz6YdGR7ZTzwTzgmzl
	c+MZopHpoYtKvRwT1PvL0TREpK+QlH3gpfkMIkMqF37q07LWyBconjOP
X-Gm-Gg: AYBFou04AwRjbbN8zM3s2r+i6MfmBL/aLS1gr5979AB6M7YfdAhKzTfvfLEUSAQW+T4
	W5oil2/weLvqmMockPf2KTh9yIVwJEATTlha0Tilm+WzOczjLxYyztQlL7OfO1bNvur+820vNVo
	hcWrRhFrh0xze0Tt/tcqdTvddXijhQHwqkrr4PkVYpSGVId7seaA4FkKa/OsqXVFJKusVUn2c3+
	TBmcUfP8tipno8zRto3SIoRucx5mhjv1ZmtaYGLq5GXdsjG5G02MVfGom8wrTDs72vIcawuEtV9
	jB7bdx8plQlBVxkkQIjb61bFuHVDA2tStmPn46I5DmT8RgtuzjaEznUS5h1wUilv8q2XkwHlUyk
	k74nWuSif2JF7nStYjkJSk+PY64Qd1BLm/tQmDFp0X4fVo2L2lgFvDWKK65pKjtwb1vU5PHL9b4
	ang/LuEEBc9C8mox9JXJdKsTGo6Q3wwoPzP2dqnpIqFwZECa63FjL8Mjra4DWlIA83qLgdye028
	9x9YlJZWahZ+OFJsUVPopfdfmwN9BhpNWyzfwJJLGu88Dc+U0i/YK5qA8V9IkJexy3JGy2CWb+D
	ICyymXye79oC38/fN6LHdv/fKWYxw8JM
X-Received: by 2002:a53:c349:0:b0:677:c075:a57a with SMTP id 956f58d0204a3-67a0e57efb3mr1569403d50.108.1792623317429;
        Wed, 21 Oct 2026 15:55:17 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:56::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1301045a3sm18422467b3.28.2026.10.21.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:55:17 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>
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
	Michal Koutny <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v7 0/5] mm/page_counter: move stock from mem_cgroup to page_counter
Date: Wed, 21 Oct 2026 15:55:09 -0700
Message-ID: <20261021225516.1620680-1-joshua.hahnjy@gmail.com>
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

v6 --> v7
=========
- Preserve two cgroup v1 proprerties that previously followed implicitly
  from sharing a stock:
  - memory.usage_in_bytes <= memory.memsw.usage_in_bytes
  - Reclaim does not swap when memory and memsw have equal limits.
- Wordsmithing commit messages for 4/5 and 5/5 to document the
  cgroupv1 divergence (bounded) between memory and memsw caused by
  independent stock.

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

We get an added benefit of simplifying try_charge_memcg(), which now
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

Preserve the user-visible invariant by reporting memory.usage_in_bytes
as the smaller of the raw memory and memsw values. Both counters are
upper bounds on charged memory, so this remains a bounded stock-related
overestimate and importantly does not affect limit enforcement.

Based on latest mm-new as of 10/21/26:
fcec4f4bcc110 "riscv: mm: fix concurrency in mark_new_valid_map()"

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
 mm/memcontrol-v1.c           |  17 +-
 mm/memcontrol.c              | 352 ++++++++++++-----------------------
 mm/page_counter.c            | 209 ++++++++++++++++++++-
 6 files changed, 361 insertions(+), 256 deletions(-)

-- 
2.53.0-Meta

