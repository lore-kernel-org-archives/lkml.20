Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33BA632
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064176; cv=none; b=tuW3tLI+5UBTRF7HkVPv+5ovwcoH9yymE/LSR4fia0JYpushTYk5HiMjI+8B18jBsVqrSKz9zxS2oAZltgIDPNbbabhzHbvhl3xVcgHNvIBSK99VqCzyxxXGfoRKLMcTcScNmaSrnTAySVa5RXEPjdSXXCrBRQgHp9p5U4pLt5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064176; c=relaxed/simple;
	bh=9IpPFSzcLdM/8SH0aciFnU7h9JSdrOn6A0jBLTwIgtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwTOu4bh/nPSWJ3wyJzFPvFrqqxZbIrHEdmU8wzLDMt5ZPMQFjosrDnIcuuMmiaziURsOkOQ8pI7Fhf0uECxkBB6n6544wsXXK84Q9NO5feBa4n1DSeDq5qlonZuOw76cBN91qCzQzFxwZCJnwg9n7C+0R3XAYOXTNbuuROsa9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQxk98Sj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQxk98Sj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf110997efso2911045ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788064174; x=1788668974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgBqYNXZCzr06f5NE3mn9NXVjLKoxOpoLRZ6XBqO/qg=;
        b=YQxk98SjDJPDMnJlW4hOvuSBRj6k7+uyilsE4BVW92xcQAHTJqNvZ0dex2smaX3v/i
         Xia9beFQ5crg8Myd2W8qxZViVYSKhkxXkXEOhhsb1n2KlBVHYZ3V489oHXO3cb6bdVvP
         zXd2GpWvu/KSAWSPW0A6dN/MhUIAfmYVKF5+lWWmrqr6nY1FNR7eJFenTIDls800Vjb6
         3WaedjA3iM2v8WA3zoV7Xo2Onf6jqH4wY9qFGoa0ogvppIPkC8bI962Ru5VClykiG92y
         1A8RLvy9bk9fBiaDfT3kIR88WisOonG/Pb/aj3JHJRYgGi30bJX4TmQLKgWXg8zZrBDk
         P2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064174; x=1788668974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgBqYNXZCzr06f5NE3mn9NXVjLKoxOpoLRZ6XBqO/qg=;
        b=eOhKG6uUaVEGc/yriAbKVprCqrl/sUnmzyMszIb/QtJWGlf6nBU8Pj8mqUReZu//E1
         yKhPZkNWQQWDwWQf/tY/0p+26/SF/nnzY+/YKNbDttebiRHMUPR23f6RqLVv8W8IuqEg
         8403/IPCPWl2J9lWyfCVRD0WZZDrpDq5T0ySJYh+U6CkKc0np1tMNUigGTU7yOp0OAzS
         O9OCxIbNylr4tYsGu3XYHLezE4jRVHlliYss2rfNggdUdUvRT8Ymt8nnuvOQl00wwPVI
         sYnpD7NwiU3vfNy8BmoVlB1XBOOofGVwAgkZ6XP6vdzemvshXuO9Fcr2Qkl4jbEkJRBc
         58fw==
X-Gm-Message-State: AFuF++m78a5CDBNZfNFdvm5ZZl8fMvTfUCsS7+/35CSQVbc3HYekiLs3
	X1ARGeT7+lxZFd1ss6YWey4zh4aBLj0jxTpvEL2G/imnQ+GiWbJnMwlA
X-Gm-Gg: AYBFou2kij6I0FpKqCn8E2xpiAGM5rxmtYV3lsd6UdCLKr3wU6t7AbnkIKRmRvP+bd7
	cryrUmm7wJ+Z/V+Lg2dBb7PtEWwbmRqz5U8es0+5hYwBi+Ns45QFjljno2qdmtbPt4bpciDKbVs
	W5N7w3jJIlTy5TaUUqMsYe8q3lxWyYBrUQhGKRrGu+l/gxayxOpvXAEVxCQxn2pZ/8a9FDogQMO
	3f36ppkpb6YCTGoIuslWsjhd5t/KmvRwa3p/LJW4dvVKMBA3wOlQ5KvbDyn6RTSTOuhvxd74Bt6
	+bA2VlJPCD3EVg9KorAP3HMAV7fM83tciSCBH2XZ/zfyBiIuIxXIOmvorZT+k3U2Suh+epqZ+Yx
	XBVzfxKYUHMv68FIx/1vYShwxEAhJTarOq6niXJZ8vjkGtl+lO9qb/og//gkiGY8jNhwk++Euu8
	96Xbyz7cBIS7bEBLRmIiDswHseVtqFovun5oWf8k6MbuGx1czJlMGvKlbwJ2NtxfuNGcNg3amCt
	O9wgzSp3CkKgA3kGRoYVwyXgrgn5mnyHvHdZpw2Qwf8d4ShRo6X
X-Received: by 2002:a17:903:1112:b0:2d6:3c1a:85ef with SMTP id d9443c01a7336-2d74e08b96emr156523785ad.4.1788064173835;
        Sat, 29 Aug 2026 21:29:33 -0700 (PDT)
Received: from o6.lan ([188.253.112.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8f98d46casm7493535ad.83.2026.08.29.21.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:29:33 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	zhaonanzhe@xiaomi.com,
	baohua@kernel.org,
	hannes@cmpxchg.org,
	ryncsn@gmail.com,
	youngjun.park@lge.com,
	baolin.wang@linux.alibaba.com,
	hughd@google.com,
	chrisl@kernel.org,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	david@kernel.org,
	ljs@kernel.org,
	xueyuan.chen21@gmail.com
Subject: [PATCH v7 1/4] mm: add page_counter_margin()
Date: Sun, 30 Aug 2026 12:29:17 +0800
Message-ID: <20260830042920.2280454-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830042920.2280454-1-xueyuan.chen21@gmail.com>
References: <20260830042920.2280454-1-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Johannes Weiner <hannes@cmpxchg.org>

mem_cgroup_get_nr_swap_pages() open-codes the remaining capacity across
the memcg swap counter hierarchy.

Add page_counter_margin() to return the minimum usable space from a page
counter to the root, and use it in mem_cgroup_get_nr_swap_pages(). This
is a pure refactoring with no intended behavior change.

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/page_counter.h |  1 +
 mm/memcontrol.c              |  9 +++------
 mm/page_counter.c            | 20 ++++++++++++++++++++
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index d649b6bbbc87..07b7cb12249c 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -68,6 +68,7 @@ static inline unsigned long page_counter_read(struct page_counter *counter)
 	return atomic_long_read(&counter->usage);
 }
 
+long page_counter_margin(struct page_counter *counter);
 void page_counter_cancel(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_charge(struct page_counter *counter, unsigned long nr_pages);
 bool page_counter_try_charge(struct page_counter *counter,
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 8319ad8c5c23..109c08be91cf 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5670,12 +5670,9 @@ long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
 {
 	long nr_swap_pages = get_nr_swap_pages();
 
-	if (mem_cgroup_disabled() || do_memsw_account())
-		return nr_swap_pages;
-	for (; !mem_cgroup_is_root(memcg); memcg = parent_mem_cgroup(memcg))
-		nr_swap_pages = min_t(long, nr_swap_pages,
-				      READ_ONCE(memcg->swap.max) -
-				      page_counter_read(&memcg->swap));
+	if (!mem_cgroup_disabled() && !do_memsw_account())
+		nr_swap_pages = min(nr_swap_pages, page_counter_margin(&memcg->swap));
+
 	return nr_swap_pages;
 }
 
diff --git a/mm/page_counter.c b/mm/page_counter.c
index 661e0f2a5127..450543f4b318 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -46,6 +46,26 @@ static void propagate_protected_usage(struct page_counter *c,
 	}
 }
 
+/**
+ * page_counter_margin - remaining usable space within hierarchical limits
+ * @counter: counter
+ *
+ * Return: The minimum value of max minus usage across @counter and all of
+ * its ancestors. The value may be negative during a concurrent charge.
+ */
+long page_counter_margin(struct page_counter *counter)
+{
+	long margin = PAGE_COUNTER_MAX;
+
+	do {
+		long m = READ_ONCE(counter->max) - page_counter_read(counter);
+
+		margin = min(margin, m);
+	} while ((counter = counter->parent));
+
+	return margin;
+}
+
 /**
  * page_counter_cancel - take pages out of the local counter
  * @counter: counter

base-commit: c73b725a57f276a3702ca213bde78fca029bc619
-- 
2.47.3

