Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222376;
	b=LJIkOWJoP7Qpzxkr0ypg81AKKS9ZuCyen31ZkDsQFKtsPhGbhtLfh4hbAfJZnU7WNP/c
	 lzU3tFZ/cAlfHlTQVVxJpnafnY2ED3D3GlxdQPXZa5NsHgHpUXU65aHs2uZNJ9hQwYaBK
	 FcI2u0UILEx0sW+sUwsiazSsiBsU0ogZfNWRwp0DloZMim3wUlgFMPNKzRWEkwBwf9VAy
	 LHuEeYXNojnE4nLBsVDGP1qdsWugwaZzQYqGyRW+MkB/XqI9ShCy5deKIypAhe8EBcder
	 r+Zqg9hAHRr3TMMDVLnR7MgibS3VqNznpImm8/NrCTwa5J1bkTwZ7oTDNd6vjHcNjPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qyE3BvZ22dE3cQ/ON5Q1I/RqepT+3oR0Tr4bDbH+x1w=;
	b=Ob2EeHqFKBzxNMHxO25t3+L+MxUaR6p9LjyxZuBImyjaZozge1JAjV1+hxQ7hYJaOYCD
	 apzteMuuHp8yokKW1kJkQ8ZoXJPUxsEpmxpFwa3UEVl46JdzZxZwOn+8woy4x/zkqYstt
	 IcMW5Hi5sBwJpFuAiVhY9VBLc30ITx7q0wzODo/ityE/A0lnda7fas8DVAC3Hu9GrviuT
	 FspX+YaG05WwfNKaDmBp1X0ClPsmoP8GOLv07iq9808HhrRFlQicPxoOvZM8fH7+YNT7c
	 hjOHzUAthXaUoW2kvgbiPIhvZaMypnV4pks8LnJ7PF95qVJZToTV9Vbl46k3Pztr0vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EvUYa4qw;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4265606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4265606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EvUYa4qw
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53397554beaso18818571cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222375; x=1793827175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyE3BvZ22dE3cQ/ON5Q1I/RqepT+3oR0Tr4bDbH+x1w=;
        b=EvUYa4qwi5SXGlC+UBEqHZqCvIE+YN7S91MM+EArmzp+wW6PtPPCdYah7QR7pPuEV1
         kW0ErYOPNz8OBaNREFnU+5/l4NXYle4OV5lMBrS6/iuI0UH8XrYurRwujjvxt7sccV2t
         rBW1i3lzdelTGrdAvLBNW2jwZkoAVVtKoYb2pXtBGt2TPjXRUoDWOr9Fyq3xSbnGmemV
         Fdz4M/IVO9zxmsmKbX/Fct7EtbxHXLsO+aUgGOtWukXy/6y+wLR5cnQAUnjpDiv27wWG
         bLvnB7x3ITeoxdCPJM9AD6+RjehjMiZOhwFdXioBjZsPb82u+HGkdPsZRWjZ7Qdez4ho
         tezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222375; x=1793827175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyE3BvZ22dE3cQ/ON5Q1I/RqepT+3oR0Tr4bDbH+x1w=;
        b=agatwKmn1mguTLAj048+N6qXIsPtsegKP/1hHMwpAvY51D8Yx0ndQjD9YQjGkF97/m
         CsL3uqOl+dNyS3HAcMld5t7UyWCjGp/TQkVLAWLK5NTmz0e7dviGfoS/hSlMaSvn68m3
         W3YKh2Gcr2NsJOuKBzKP/sushcDeatIYXHPX/VvinQKQYiKGYqHpBGyJEN/RjbcEjPbU
         EVDRpN6R530NIsch50AHHwJkM1g6BJAHuWZwywoye9vFlZrnQeW1z2wAspkDalN/jtjJ
         rZ9TuE2dI7VaY1b0LkrFymCr+AP7IQNh/J/bQS47HRxtTc+6B4VXW0saTkLON9x0/cNk
         VVQw==
X-Gm-Message-State: AFq9FYKdwzh75LNILk1G91jAVtxvheeym81acjMUJ0MyZy2Z44DqC337
	y/Cml3rH1mo0OfFh9dCj/AN42NMvGuiA+cOjjMmC1QIQajc7ridI44DHL5785h9nH5o=
X-Gm-Gg: AYBFou1Z0dUh5VI2WawrG6Wa6/WCZFy29vOtz2YUKHPNkxm4BzVM2NZIi2lPYkcY9jY
	altbEyZ22gTAPyG4U+5HTe3w9xYDBvqDMeUgfZ0yAocstephiqobcRvrTeQyn1PRj9nKEY3srLj
	itouPmaTcOYmV6flq2Gwc1e7JIIX+aThEBQ+gv/TLPaGwx89O0/OMNszCBWfKfqhShTRIMmvZNv
	uj4lkU6u8C9lub5F89c9PZQs/KZKJ7KyjxThjuxH0IwxQhEyESf+IAuVVJB9kgGXqsueUSNMSOa
	3N8zpyNvMJybR0/azEpgaI5n5P8K4d5JO/bySgzXDJfmqq+lVubdqM/eJ3+bLk29xVWppWpEeFd
	MYvdbRVQZ4aCAsCl+tZELLj2U2vQgj6iV+JruiD/NaXX8/pEfjzpjfHoOgeI+X1sj0ezMOS8sYV
	ocDTKM8q2YmbF9wLLcsDigwLbtPMBRkjUw1wc4zCtkfldkleAb4uOIkJlHpN8xM9ReGgRtO3Lm/
	qC0Mwt2puEoFwPBtGXV3twjlNcFXoMa1Z9NKqGOib7us44kytMe/D2jMpuVYQ7cjc5TQ8MezGWU
	X8QKjEI/jRoanBe0YCQZWfH2zK2fGR/kItme50MQC+V97UJgDQqfFlQ85ZepV4nvR2rkRXfJQlo
	9aTYQg+eE2mVabq0=
X-Received: by 2002:ac8:5d47:0:b0:535:b506:11c6 with SMTP id d75a77b69052e-53fcc7ca8e2mr64934561cf.57.1793222374554;
        Wed, 28 Oct 2026 14:19:34 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:34 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/8] mm/page_alloc: reset can_retry_reserves when the slowpath restarts
Date: Wed, 28 Oct 2026 17:19:23 -0400
Message-ID: <20261028211930.3504634-2-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028211930.3504634-1-gourry@gourry.net>
References: <20261028211930.3504634-1-gourry@gourry.net>
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

Commit 2c4c3e29897d ("mm/page_alloc: simplify __alloc_pages_slowpath()
flow") retries an allocation once with reserve_flags when the caller
becomes eligible for reserves, guarded by can_retry_reserves.  The flag
is set at its declaration and never reset.

A restart after a cpuset update or a zonelist rebuild drops
reserve_flags and comes back with can_retry_reserves already false, so a
caller that cannot reclaim, such as GFP_NOWAIT | __GFP_MEMALLOC, fails
without trying the reserves again.

Reset can_retry_reserves at restart.  Only a cpuset or zonelist change
restarts the slowpath, so the retry still runs at most once per change.

With kprobes failing every attempt without reserves and the first with
them, and a memory block onlined during the walk, the allocation
returned NULL in 3 of 3 runs, and a page in 3 of 3 with this change.

Fixes: 2c4c3e29897d ("mm/page_alloc: simplify __alloc_pages_slowpath() flow")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2daf358269ae..78569ac6f2d9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4783,7 +4783,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 	unsigned int zonelist_iter_cookie;
 	int reserve_flags;
 	bool compact_first = false;
-	bool can_retry_reserves = true;
+	bool can_retry_reserves;
 	unsigned long alloc_start_time = jiffies;
 
 	/*
@@ -4817,6 +4817,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 	no_progress_loops = 0;
 	compact_result = COMPACT_SKIPPED;
 	compact_priority = DEF_COMPACT_PRIORITY;
+	can_retry_reserves = true;
 	cpuset_mems_cookie = read_mems_allowed_begin();
 	zonelist_iter_cookie = zonelist_iter_begin();
 
-- 
2.56.0

