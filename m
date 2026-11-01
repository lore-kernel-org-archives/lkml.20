Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499230;
	b=nRhqO4WRuQUUaiq7zA6WaNLV/n7xTBuFjG7BEHlbii8m3J76wkh/T1/Bm3AtLdFk5r/N
	 24WznUt1IO5t41UN91wt7hlJhg8OJEo5meG54nqc0FczHuZjTk05kwDBX5LBX5lFEPfwt
	 Ub/ohxcJezo/YjHLh34fkrvLtbWjekZy+3rOIIVyKEz5Fc7c0mt6RqFRU71Px38bfB2RL
	 mBQ3szbq9m09Tg3xNrK/soeaq5QcgpczBTbvXanP+I8ZeMiE4uCZkwM3U6NXzSQRGu4C7
	 tsdJeijEJAuaJQO3Htz200vDeFy3uL/9On+PNcVzDqZxfneLBL+Bn8liRZqP4QX3Jew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vO0BDg/8068w2sWF8c7lp9ZJV9hDUZO1hrE8aPsToAA=;
	b=QmsXsJGdrXjo5QdkLp3k7Ki0KKWZaOLcJb3oeNgXi/5+h3XcLX75s8xlolIUeadwn/lH
	 aRXSJnv95SZvO5HYM2y0/plQU1kpNjIrL0HUpvK8oqs4K05BxmSpqi4ZDM71vYDr+WFm3
	 jaMSFB/cbCErov0tf8VBOWTInB8jD7YMH6rLfrYyn9F5U+zoaoRGHMf9D05LfMJxd7Qe8
	 NFA+53I8ICAUOycdnaRGvrpp3go+TLNrsxbyHHt51i5BS5YFCBds7yLmihr5Zzxmf48ri
	 aSxI5Xlt+sCmuxpDepzspanLr9NKVqG+rJppo3eM38P69WVIUSlCa3djg50ib9P21qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=GNmjsmd8;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C8606A32D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 902C8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=GNmjsmd8
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e63ee7b4cso195624685a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793499228; x=1794104028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vO0BDg/8068w2sWF8c7lp9ZJV9hDUZO1hrE8aPsToAA=;
        b=GNmjsmd8iGlfyBA1iasvKglTU/FEUH1bUdSpfcXjk1tMl+SxkcJZjHg4tkHHvtroeP
         0vmUBDD+pG3IoM8tTP/kFrZxaC0s8cUzTxo5yBRThneKxH0gnUJRuD7/hIu0/Wu2El0D
         7lT+8XCqhgSs/DpjBGyS43yWOWDCiDaKvjvIv9ED1kB1vIYk8iJZ9uh80JZHQs/SjscJ
         p55ebujVQf7xav0vx7NwkgNmZlyZ/HcGv7aT9uFs1cO0vshiYyhjahKpjjUDRGAsR4Zk
         tmGC8v7U6q1cIm1mAzQ9Oe+1AwiXqjESmHz8O4BI+CyrRHs/Bss37DFXx+Nly4ed906T
         um/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793499228; x=1794104028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vO0BDg/8068w2sWF8c7lp9ZJV9hDUZO1hrE8aPsToAA=;
        b=v/dQ61Wb6Fp65u+B5xVUO7KHeTUPsbCyCD45/04xMg1T2ELYEe+pLXUfGi+wG/Cw5U
         COKuCV0wlBQqp+Xaku8aBFNA07mmfPTNiWHqEzBHc4xMqE6Pnw6/0udQlbKVMyA/3xG6
         HK63TBdasEOFpsQjasyQn6NJZ7nxgAQWhhtJRrqprTD5hHxSHaZCX8zx7TQBA+pSmHWk
         MDCF97XLFvKpjliaZGlKToWVt3DQvFcDiNoIYgvtSsCt7QQFJwC29Fklw0DiM0ODcGyv
         ziJLX2/LEalVhVjlLUMO24QopTF3G789qAvqXDsEd6/lfHZilUkgmggjwAHu8YzusY9d
         VOWQ==
X-Forwarded-Encrypted: i=1; AKwUvByM9Zm1kohMB/udIjav8DRDUGOxDipmfubpyiHLBRvIJqZ2pJCdc1fGjtobW/MNWaAFc2Nb8phv7CxnkjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6FlrOWiV4ebcB8ltYOU5zb1F15t2S3Qvz2wJg6RmJci+tVqWY
	LUqvCsDjJXF6mwhomvVOKL6VnPnJFpr6sE2jFPF4Q3BCYJ29Pz6pxh4+ZzGUJgpNNR0=
X-Gm-Gg: AYBFou23hLJyG67YbaYyQLT3wMMAyQZ0gIzAroa1i1LoQGnEswEBQxdjjRj/jFwUqw1
	fD0oSwuDJUmDEmPdf+IsMowyH3lt+VygOIWOpFEkTQEAN7TsMEJfIixJm61m5ZRhoqHAzhbJbiU
	YU+dSjE5u1iTBTdI+a/HskIeK29bgFXbvGA622/8rTfbEzVuw18+5+ryKY3uNTZ8NICIKc3z+cW
	QO6qEd1pxvl1NYwD9ZJjB3EXHlEAP489IcGi2UFVR7ZOa1bwvwHBHfg/zOfMhmQZuZVThu4tFJw
	vdOd3h5SD9LZQ1ZCOGjan4ZsNMQd6bjciVvdiUyXL7ZjL0K9EO1erC/sJHDIPU3ZaY5eNfBo8nq
	hLGQaCtkM/gC7OvdrDohG3OVbfy9Gg/5s4/sRgYipoErSe6fd7XSW6jT3ln+iyaMVAIhhYH91UG
	VSLQ7rLRBOuWEQwAqElnw2ogFqN09ZajgQADvl9F6Rh0WruGs6Z/N2ma/kDcYHG8xLN+zILSpmk
	dR2Cvsu0ZNOK3kYLr1k5E12A0F0K9YZxb6CsH31QzYp8LonMySKe+FNuothcAIguKSZ0sdefQoP
	G0ItsIKTYDYrj69aMxl7o5jtzxQsgvZ2FSgyZnuRyMTLukQEgND/hhw9Fa3EY38TFXhkk1XKhFP
	qA50CvdnmPQ==
X-Received: by 2002:a05:620a:2a01:b0:93e:c12c:f136 with SMTP id af79cd13be357-94421824e76mr1073212985a.81.1793499228208;
        Sat, 31 Oct 2026 19:13:48 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425858552sm498131985a.18.2026.10.31.19.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:13:47 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v5 01/12] mm/page_alloc: reset can_retry_reserves when the slowpath restarts
Date: Sat, 31 Oct 2026 22:13:29 -0400
Message-ID: <20261101021340.2251928-2-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101021340.2251928-1-gourry@gourry.net>
References: <20261101021340.2251928-1-gourry@gourry.net>
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
becomes eligible for reserves, guarded by can_retry_reserves.

A restart after a cpuset update or a zonelist rebuild retries with
can_retry_reserves already set to false, so a caller that cannot
reclaim (GFP_NOWAIT | __GFP_MEMALLOC), fails without trying reserves.

Reset can_retry_reserves on restart. Only a cpuset or zonelist change
restarts the slowpath, so the retry still runs at most once per change.

With a kprobe helping to make the race deterministic, an allocation
can be made to return NULL. With this patch the allocation will succeed.

Fixes: 2c4c3e29897d ("mm/page_alloc: simplify __alloc_pages_slowpath() flow")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a8cac5e01066..f1048168c90c 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4783,7 +4783,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 	unsigned int zonelist_iter_cookie;
 	int reserve_flags;
 	bool compact_first = false;
-	bool can_retry_reserves = true;
+	bool can_retry_reserves;
 	unsigned long alloc_start_time = jiffies;
 
 	if (unlikely(nofail)) {
@@ -4805,6 +4805,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 	no_progress_loops = 0;
 	compact_result = COMPACT_SKIPPED;
 	compact_priority = DEF_COMPACT_PRIORITY;
+	can_retry_reserves = true;
 	cpuset_mems_cookie = read_mems_allowed_begin();
 	zonelist_iter_cookie = zonelist_iter_begin();
 
-- 
2.56.0

