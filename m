Received: from mail-pz2-f30.google.com (mail-pz2-f30.google.com [74.125.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7C52D238F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790813686; cv=none; b=AQTWDYKV2MIOmnMZ5UVttpd8W0ryYNxuSiKJ52x1mB14oxMwb15YxsvtVP0Lu19iKJ8QQGpe2Dm3yresjWoBCUas837uV6vK6psZ4JWcvCXsR5iMBr4XVZ5m6NseZ659+18bTL3fBBPFqL7cNirQrm8emPIZNo7N1WfpNGT9BBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790813686; c=relaxed/simple;
	bh=A5ZBnWyFbLXTmhzqF6Wq6F1qsTOlMMaUbuqbAipLSAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jayeAeGItIp509ifVav21/J+2gu+mq9fGImLfukjoxHKi4lokCy6XGjH3FHPtQ3WAtt2Qyn6E01yKHuj6BHqa77JhJaXOQ+uPWhjnJoelRu6imdJQNmEO9CCU/uhd2qqpiEG+dIZ3EE/ccXLs7TJJopIiId5aTmgmkSsDtFFS7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1Kf+jGe; arc=none smtp.client-ip=74.125.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1Kf+jGe"
Received: by mail-pz2-f30.google.com with SMTP id d2e1a72fcca58-880fcd3790bso2134248b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790813684; x=1791418484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiwKC3B6R+JkPafV6Q9DP9kax3XNskKt8f/l6UnpLUI=;
        b=M1Kf+jGerpJ/jk9AEsyh0cQDtwI9p2CtSrt/nyT7qhM9wHge5m0RvieQQpENQYOGrh
         Oib9C1FQrHJHO2ttpegfaBlPlcQfHfluVeeMgZz8/ltdZRICwfYPoV1wFdThsRrAts+k
         i7aqdHDS+YI9fFemy3mp9Adc5RBzMQdPVyGwfagrpJ72NPzHpvxuQ8nSSJy4LfbnJPGS
         vDBcgz1C0oCs86Lgg8mtvw6hMieBVI/FY5WzH5gdA5ySkpw75qCXNunVN938jJnwxvXG
         9TnakCOnU0Ip9yj0gk8F0nfx5+BLW6SFhNv5by9k8nzb8NO6LhTm2usE60ZglzxVGpv0
         sMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790813684; x=1791418484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiwKC3B6R+JkPafV6Q9DP9kax3XNskKt8f/l6UnpLUI=;
        b=CMDodDpwCcax6q7tJF6vPQNCYEwf3knc0ua3G053czPzGc8mdLlf0xeRhTuAY6B8YO
         5c04VAbN3rTLYnrThhpBC7shmbXa+gyi7LkISNNtDBZwpRaLQV1Z+VElBWjnBPOtsiBq
         imggarxCNQ86iypwK6iC4tIv+u35g9BVk8nIEGWiuZAJ8nZhrMz5JbmY4126K5dTcHS/
         Jp1PuxPX8Tc/g2gyVQYiAHkXBb5AFwTZSqJsZMOhLB2GMw6QTcImJ2R2zEYo4EydpouK
         f2IckH3SxdKNwOXKQgUFHDPwIBOKgdFZe0VY/YZ/76ilrydD2f9ctTskOfEcgyAsueOO
         I8EA==
X-Forwarded-Encrypted: i=1; AKwUvByPmEsJRnI/OOGEWm1cqIbuv5THes0t6b+XPY0UybZz5Th7kR2D0QMqOD8/6L4ryF/iwK/85y884cGDoGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlGISWrF8Cz7MH6JbPOMnLz9efzB2oRiwdG2SqMbAqO3IiU1nH
	TGeFkwH4cK7FCSsbzHcsW32pA8L2LHC4SDvq3f//14lPpnP96R28p/T9
X-Gm-Gg: AYBFou2rjbrclcO7NeB+ewN6m2Qnokk88IdqjqsaGmpmVNMAJTrPLZrAWAx7KVOK3j8
	jMQfrZxLLonLHZj1A5890d99akF1tJDLZchyRssoQe+e2BkAHhXrcCzoh++eaWvexo+7h6cFTd8
	0H8wDS6tO1upvrpharAf3N1lKhyT+Un1mrOIcxiLJSTCCcCClshiXTS8we0HDH/r15k3XCWrEbO
	pKYwwZ4SqpHFfhwboj6/Lr3IM8VAGzaV+TfQ1F80xj6rgVv6f47Sl3XxzGQFyhUMA40Jrrd0Bg+
	jOsoOZXh4zqEY1vJF71viLgjcVianxd4oIk+ViebB5iLxSLLcVQENkXzCc5kvp7fjGR78rbR47G
	Wiwwio6kcnhCOWMVSsbmLXpHW1GLX9i5AyAOP0fzUpeYk5/M4N+akCBCUlT1g/YmcQwFg8hmXid
	0kJdRieA24Qxx/lk22QChf7hQzq6Fptb6rfVBe1idaUW2omUdOqGRNfaxeZva3MyXEc/QoEiAKO
	lNqBYaopeEjDEpX
X-Received: by 2002:a05:6a00:1144:b0:874:705d:f653 with SMTP id d2e1a72fcca58-8874b7354d6mr2166151b3a.33.1790813684074;
        Wed, 30 Sep 2026 17:14:44 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818814b2bsm253287b3a.19.2026.09.30.17.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:14:43 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v2 4/4] mm: compaction: skip unmovable blocks for non-costly proactive mTHP compaction
Date: Thu,  1 Oct 2026 08:14:12 +0800
Message-Id: <20261001001412.3837085-5-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
References: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proactive compaction scans all pageblocks including unmovable/reclaimable
ones. For non-costly mTHP orders (<= PAGE_ALLOC_COSTLY_ORDER), those blocks
are dominated by non-migratable kernel allocations (slab, page tables) and
scanning them wastes cycles: a small order is easily satisfied from movable
blocks alone, so there is no need to scavenge the few migratable fallback
pages inside unmovable blocks.

Costly orders keep scanning all blocks: they are hard to form and benefit
from any migratable page available, including allocator fallbacks inside
unmovable blocks.

Restrict non-costly proactive compaction to movable/CMA blocks.

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 mm/compaction.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index 0ff454ee5604..deddf931d0f2 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1404,10 +1404,19 @@ static bool suitable_migration_source(struct compact_control *cc,
 							struct page *page)
 {
 	int block_mt;
+	unsigned int order = compact_hpage_order();
+	bool costly = order > PAGE_ALLOC_COSTLY_ORDER;
 
 	if (pageblock_skip_persistent(page))
 		return false;
 
+	if (is_via_compact_memory(cc->order) && !costly) {
+		block_mt = get_pageblock_migratetype(page);
+		if (block_mt == MIGRATE_MOVABLE || is_migrate_cma(block_mt))
+			return true;
+		return false;
+	}
+
 	/*
 	 * Background compaction produces blocks for the zone at
 	 * large, with no particular allocation context. Allow all
-- 
2.34.1

