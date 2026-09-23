Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323B175A83
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130549; cv=none; b=s8JBfoPYu9KC4HzgkzmTIdN7vQP6YaVUslOZWk1jhddrLRufS9KzkHo4IRIRyuQ5eD0ktu0LaXLPO8Jc7lGWd+zSnKGTIz4hSeARvUJ12pCtVxiz0OKqGvYL8dJessdjN7dfnJJoQQUUdZbnkPYk/yDvx5hfiR/R1dBGCRBys5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130549; c=relaxed/simple;
	bh=XEEmOEyxC9KEf2j0uIAqmb2K7hAJB8r+2Vuz9gQvP1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oYcM+uoGh7/FbRWYGFWmRZ7HhBv/FWnM3lPRh16e6y8wEVS2orDzZ6BNSwuBw7WfbZOutrdbjHAqUJnhXi40SXnWDX5OHxh3Vy+T18E9zTYnWyeQ4NrX9TwKXRHidnBDp7JC7j7MvE7/GTQHj2V7yUf4b96m0HjlK7/SXSpWJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=obrvMZFM; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="obrvMZFM"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a2dea320fso48941885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790130546; x=1790735346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LT17egyswwNYbdkKQlMC/Q3krO4NMxyBssaINTEsn5g=;
        b=obrvMZFMhMqLdG8O74snw5aDbsJiQPjyG4vKXsNlFZTqMst0DFhmbd6wnMliuBBqPA
         MH2MOVKZbXLH6fc/wpLrTNMZr8FV3lWCWbUxXeUJ6+IdQg7Ylfz9tPGYsVAbUprrGYoZ
         fXtZOlx7J8lDo7UrlwazWARAFXl7Bsbsr7IymjV7ne6+s8EnRaKInrv0HI3zCZopMe1O
         kaUkitwpuw6HIibxV711IARlgRfg8GjfOZC6YdsKncs3+U6jkXQoTLalsOleLQKr4S5P
         bSi9JcQn6RQwGpBtZCi+mdlyHxTFt79abHyveG3dYkME3qG8odtL8wf9EO0DhyUBvl81
         67Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130546; x=1790735346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LT17egyswwNYbdkKQlMC/Q3krO4NMxyBssaINTEsn5g=;
        b=bsteVjV82PYLBO/Rk2DM7uFaoo/doVGRjQQ9HLIVzbVndv/eXUhKogwNXUPz6XUCi/
         4x0GzyixkGoGK4oedYyH+I6YDRiM2k7A5CmepnEwl+mzcMQU1DuZq0Y8qVBA5JPA3oDy
         95AiIjtt1jv7l/mcYlEAu0gA2/mITJwNV3kwJLhnIendL/shopD1zSeq5Z8gmQg+lcj4
         RTiW3Ga735XAXwuA1SYix8PpxJ0AgWjMXPm8sLWXgztP6Oak8/uw0aGgjGk7qjlXUJ+U
         TG2hcUzWuTDaZD0BOUh8alwX1YSo3XePY4ZHkZGg0/BC4UpaAzixrrZ4WTEpBbtPvevK
         080Q==
X-Gm-Message-State: AFuF++meIkKNoQmVtGMA4CEp5lj+/z7wjIzyzg064k0+626DZ3pMv6ni
	Yl5WnTK8JFgRs57GzAEZqnwQMKE9NgZYjFBrjmnaWu5en9TL8JJo/hF4TUDX5MXPEiA=
X-Gm-Gg: AYBFou29Yu2c9IzsHbkLilF8gDJM6ZFfWMyPimSx12Vm/rfbC07nz2GvcL0rY4wzX1y
	coqWCXzOjg/CBt76GOxNosbDtwxkJEUEZONUg1//cxvMpftPeCkuqgYbbW1ruwsVJlFBi1sZfxU
	iehYA9+Gj0FhMuzCniOsDD03PQWrdz+JqtXkTWphE9oejyq0jB3lw1CDOW+ZXD5VBx7zaAexwej
	hGBbLQ/N922w6Uns1DEG/jV+JJ7tTnC6KgGB4ieoRimzEzDxAxCqFgg9FwCLsW1p+72WIKHJzFt
	x719ldcDHXT/yowXZTiUjF0UjPfPrRtQtWDGRaHpyJF+jhTtjpT2yeFlxN5f5cww+sHse4JxvGl
	UJfHerPdBvXtHKHXT2vowTTgjkajYaYCmHP3eZc99A2ScCIpy3DXfePqbi8ctdHeBGDm6wsgNve
	TsEHmpYqyrvscqjpeMOn/m00J2wVlYFEX/mNIFel8stlBSiJnzdeBGNTAwzmRviFlF7TxH56w7I
	NnYzBShfhXN1snQ5DTssZPkHY+R7PYZNuzw0PzEs+hqCUuMpOC8RKu9Wvx2
X-Received: by 2002:a05:620a:6286:b0:939:6dfa:4975 with SMTP id af79cd13be357-93c25216882mr212753385a.52.1790130546229;
        Tue, 22 Sep 2026 19:29:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2482302fsm122626785a.12.2026.09.22.19.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:29:05 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org
Subject: [PATCH v3 0/2] mm: refactor zonelist constructors and iterators
Date: Tue, 22 Sep 2026 22:29:00 -0400
Message-ID: <20260923022902.2433614-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_next_best_node() picks the next-closest node when building a
fallback list, and hardcodes N_MEMORY as the set it picks from.

Refactor it into find_next_best_node_in(), which takes the candidate
set explicitly.

This makes the existing behaviour explicit at both mm/memory-tiers.c
call sites - they select demotion targets in fallback order from
N_MEMORY - and lets callers narrow that set.

Then extract the per-node construction loop out of build_zonelists()
into build_node_zonelist(), parameterised on the candidate nodemask
and destination zonelist index.

Together these allow a zonelist to be built over a candidate set other
than N_MEMORY, into a zonelist other than FALLBACK, and iterated in
fallback order over a caller-defined subset.

These are prerequisites for generating a private node zonelist (nodes
unreachable by default), but are otherwise general improvements to
the existing interfaces so I'm proposing them separately.

No functional change intended - purely refactor commits.

Verified on x86_64:

  - find_next_best_node_in() compiles to the same 319 bytes as
    find_next_best_node().
  - Both mm/memory-tiers.c callers grow a single instruction - the
    added argument.
  - Boot-time fallback orders are identical on a 4-node guest with an
    asymmetric distance matrix.

v3:
- mention the new zlidx argument in patch 2's commit message (Zi Yan)

Gregory Price (2):
  mm: refactor find_next_best_node to find_next_best_node_in
  mm/page_alloc: refactor build_node_zonelist() out of build_zonelists()

 mm/internal.h     |  6 ++--
 mm/memory-tiers.c |  7 +++--
 mm/page_alloc.c   | 74 +++++++++++++++++++----------------------------
 3 files changed, 38 insertions(+), 49 deletions(-)

-- 
2.55.0

