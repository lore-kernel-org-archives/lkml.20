Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607544;
	b=xsAToDdBvbfDsoChNuP70DVJgXXUwgpfPLKHSXQQjlJReDDxFX+18owuKVLv/D5XZ/8I
	 iQaxqvDcT9ijc0wxWQaoCY1DyMpIYRDP5UI9FXeaOxHdiiBqJMXRiJWol5WsVqzIIGyAn
	 pyQRz+D6ooOw71PYHQf9RFp485HHvJktDIwp/S8QwDvyv09ni3l8dv5gE9RGJePZzB59v
	 exByiKJocbLc5ifuIk/44EIiBBpQyK8iQ3fyA8o8twgt+2On5RtWMjGZVYMJSAHpNs/Gx
	 f3GI8JZA34Dzk8tGfOrmioVKVmah7V98OckWKjcpGZENwFrgH9znkRolt3Z2dj/xqsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YgttlTwq9TxT/yyyrQShMeW4eBGuS6HklOlBPU6eqn0=;
	b=PUfH1rS1SEMgClNJV3M9+iwtM6BcZq7gjzTFvBD/eOHPgj5L0KCnDdpvWFwEMO8x7jdF
	 0PGyfrhi7V8Chi2xPRl/kaIv6aEFk+lwiVPHQ6Gn9dJtUWZEbBYaiWbnXiVK/urBcv06K
	 tGfV6o5apavznK60NxKvRCKeiXAtUZUd66rpGgsh5iMxQegKWQD14DvG89oNr/H1wcpzr
	 wUidY/RXaayGzba4jjlFkwdspdr/pt1G6lb8xHFl91ssBCjH0jHedsgsqGAOe4Pgn8FzC
	 wzK9FGyH5kg/ccjxbtdCgfr/a018owR0D/E57ml92uZwuGblWFM/ccTJgqLZU90AwHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRyxkfqQ;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567E606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2567E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRyxkfqQ
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67d9a5e9bb6so381214d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607543; x=1795212343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgttlTwq9TxT/yyyrQShMeW4eBGuS6HklOlBPU6eqn0=;
        b=JRyxkfqQGqh98A/nJKAcqD5QHgukBuKN7TyvozwqGRZh+QnYlJK78ArockRO3XsyvM
         Vm/Y4xdJ443xlAZOQnSS8uT7oofueC1kA2HeJQaf6nSQwIe57IsqM4Hbp/Pt+Slg8t7t
         Oa8Z6+a/rWczyCopRr38rNpIyh2D5u62JpfETeuZA/+p2EiHvurBi++ZuvzldItP9Nkq
         UP+7XhrL35i8lYC2J+acb0LxlqCm945CfacnB6X81KOWrb57HKQIPJiBwXAXJnO0fIbR
         kmvDtE0dkcYnVDgVOMX6SZpf6mU4y8cWXqJwOF5J1+Gn3wMOg3G1rnG2bnfhMM3goCSh
         lpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607543; x=1795212343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgttlTwq9TxT/yyyrQShMeW4eBGuS6HklOlBPU6eqn0=;
        b=AjmNIEBfVlzjcO59mlUkAbWst6eG9qEF9KiyhSli4JA2lcGkiIzFTSgOpfn/QHNcQ7
         oacrefffDb4YqAZEycnL618YCH/69mre3thB/lsw0uwhJ3r2E/0bwIGoDdjDKq0fcLHh
         n/W0qGHMz6fD19sgd1/JuKZM4Jmfb7mD+s09yc2fLIxVdDWl7jxVaVS0Zz7zXPe9Q3LN
         i/dnqaA4vzqc4CZeXCatlGJD/P3BbO3PSDmxicCRPFyKxqEQxjK4omPgddrDEezDtnkz
         ZKWcrPq3XJuvDB28b72oHHA4ndhjYf6DQjmtXyWaCz76jpY7rth42GKG57V7NoTpJKpb
         G+Eg==
X-Forwarded-Encrypted: i=1; AL+hErHHBk9R2SpTwxvN7mO2pxko4UVx/bGQvvpxmQsHoK+C2L7Bwd/JWdYlos/P25WFw1URDa974mzujrWr9cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zGJbwT72rXsk2W9VNX4goaVF+KN/BVsHBCKZ/UbPS477UbK/3
	94PX7/zWXnuZjqtsW1+Q286Akq4gxZOBa4BjC6hMNFxM7RbnLUxw4JXZ
X-Gm-Gg: AYBFou1jtXUvoNp+WyHI8bk+mPNe/MLd3Yr6M1su7HB4aNuJgm4vI/7AvM7hP5o4Wle
	pV6uhdiwBuJagNW30c7+yHyIj/ZSoxEcSyhqllC2loRpIOwKy5H+GZiYMUaed719dVwhcHtL5bS
	VrNayGVbLATaKE0p4HOXwlXJxmh2AiQEaSFy320ow/uKkbEJBYN3HZbSh7aoK61+FHphwGtWLzF
	zIh2BDPoBkeCDrgKu025ccAmNj0g1QNokf71qcs5uFnPbylWwbcgE4XFEjs461y+tjI7+UH9/nA
	BR94KrnKx7gM3vOovUPqUn9nTlTljRkvpjbZYVGyDl+teIk2wNzfyCIYv2vkbsVhBzPcc4Nud8W
	3RqVFJCLdlvq6aWymQnJyjXM/Vqk/ajIV2UCdrPINVxfVP3odL1vVMQUeJeYA6UN3Zo+ShwuSb3
	75QBhF6hwqrnbXLKyMzAX1owpGHr1Gg2avkLuISbsBcSnzq/BJis0KDnBEwENSQCk/scZtyWHbO
	4vm0Zcp6rTFeas4K7hEXgwEYKQUbA+ohlsCaVNXRbEN9R+q5s1B+moxUo2oR7utB8wAExQKNLv+
	x8L3aCF+1SXBO+vPQSeJOolGZkGVPRQz1OdmtrYrbMGXJRdX8zFXe0r/1y6+ew==
X-Received: by 2002:a53:b84c:0:b0:67c:b95:6753 with SMTP id 956f58d0204a3-67d8976d393mr1422762d50.146.1794607542894;
        Fri, 13 Nov 2026 14:05:42 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:53::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a433a15sm3200910d50.2.2026.11.13.14.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:05:42 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Michal Koutny <mkoutny@suse.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Harry Yoo <harry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Balbir Singh <balbirs@nvidia.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v9 1/7] mm/memcontrol: flatten try_charge_memcg control flow
Date: Fri, 13 Nov 2026 14:05:28 -0800
Message-ID: <20261113220539.2275715-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261113220539.2275715-1-joshua.hahnjy@gmail.com>
References: <20261113220539.2275715-1-joshua.hahnjy@gmail.com>
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

Refactor try_charge_memcg by flattening the nested memsw/memory
page_counter operations to separate the logic between the two.

When page_counter_try_charge is made stock-aware, this flattening makes
the control flow easier to follow since each page counter now has its
own success/failure paths.

No functional changes intended.

Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 091401cecf397..aaeef20eec06a 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2815,18 +2815,21 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 		batch = nr_pages;
 
 	reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
-	if (!do_memsw_account() ||
-	    page_counter_try_charge(&memcg->memsw, batch, &counter)) {
-		if (page_counter_try_charge(&memcg->memory, batch, &counter))
-			goto done_restock;
-		if (do_memsw_account())
-			page_counter_uncharge(&memcg->memsw, batch);
-		mem_over_limit = mem_cgroup_from_counter(counter, memory);
-	} else {
+	if (do_memsw_account() &&
+	    !page_counter_try_charge(&memcg->memsw, batch, &counter)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
+		goto reclaim;
 	}
 
+	if (page_counter_try_charge(&memcg->memory, batch, &counter))
+		goto done_restock;
+
+	if (do_memsw_account())
+		page_counter_uncharge(&memcg->memsw, batch);
+	mem_over_limit = mem_cgroup_from_counter(counter, memory);
+
+reclaim:
 	if (batch > nr_pages) {
 		batch = nr_pages;
 		goto retry;
-- 
2.53.1-Meta

