Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3B511E70
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777292; cv=none; b=kY7gl6znis/CR1nARmjiV/KwFR1pRjjznKWNXNLpw+Xj/iZ5bi0V97QKtGfqv9y5VTiKs6fQbSVNB0iqLs/vLh+i3x5zyDI0fDeoVBcoYnSmJE4XIFM4KpMfXZbZFqXY813OjAWTO8dJVTKiKnKhD++ocCvAZTsHFsZQlNOj+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777292; c=relaxed/simple;
	bh=T+urqzWzyIxwZLuO9JWRrr1pGvoYFNDSPNc3cJEE2Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNt9yXnU29egxpSPi3e/wEiy6gVkaGaAGQsDSrvB+xSilvIBVf6lR98zSXxUPOl68Ri8QiBjYX/r0iT+sLlJh0ztvesJQsiQfaF/IfEJUYj2tVIHQ4/aOUXvZVWQUi9AM9u3gMoYFT6RE9tZcU5ZNF6EWmd3nwFP3NnsHPdbcmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Aymuq3mc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Aymuq3mc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so3188844a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777271; x=1791382071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lYqlLPEL4NmsKfc4jswjFAJ2nsB8z9Iog/hwprMxOQ=;
        b=Aymuq3mclw6ln0vX58rl/x05v8nvlScRsf6XXz53HwKLK3uS6RrhywXQr8Ecb/u1jS
         uJWxYLuG88n/rjb/r1BKfQpIdpZDvoUpzWCBzT1Wg76Z1tXtTg3AWu2ohMOWc0Szky9a
         K+7z+nnl+4qlNi+Qes1aMR9cn/ubLGvfRVVLhSS3WyHbZFZ6LvjvOqR8eQCV8MTHfLFr
         CndJ0PcNFENXEe9aMZMkIxVjGbuYbPp0n2N4gY9k3XRYQ+OWZq+X7B9z1eMYVpm6st6h
         UDCmhurYJ19pxxRmhebbon7y2ArWqdD4dSkS7U3TiRFx1huC8K4Nq0Psll/EUeKmaP2p
         ZkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777271; x=1791382071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4lYqlLPEL4NmsKfc4jswjFAJ2nsB8z9Iog/hwprMxOQ=;
        b=hIZzvFHtM11JgAYhpzbWu0VdhORxA15SMHAEGQukHAQzcJxvVJ87zQQEmTFTsl/+WZ
         LnUnZzv/ZwYLuAZF1QsDruF9qMT5vQih0QQ+eH30WZY4YYTQU+4v13/TYbOUW5ibbbvh
         KrI3fSraoq1saEVAzk9q5KotHf/ok885hEroR9gPDBttm+ftsHpi8x/UOLHBfIXWxQ90
         /8dO2OBnaEofmsJ3d1bsBKLgseQea471qnYXFnNb8luPGjy2ianDIpge8PUhV5kDxdqQ
         GQhLqhENgyPqJvCybDzcwFeoWChzx9wf8b60p1jl7SMoq0NSZi8Rd6OB+nFfY+gS1d6X
         k7qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ8UKrX31XWoayTG/xbgHzgnjElk4RJSOb5svzI+igt3nY6vNaKroYDqGHECwKCTJz2vnQ+Or51lPneMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuH9EVzjxleVHp4U0YqtnYdFsXAW9STNLT4ftMFdwBCwZRPPIl
	w8JdMmFf6mlgb1xHNDv+h5bRRyB0vYyPmKGWxBNKhE3ZtrnaE6zLe8PRS0aqb//7tj0=
X-Gm-Gg: AYBFou2ZwFsai8nuTtM9uZL5C94rJWoo36zkZy9g8sWzogXyXcerQ9IUgil3q0ngceT
	+/xe4VZ4JnlQMY1SOcrzK8p618g0VpRy7TQlqOJwot0Wfo3aCdN5BOC/s4c6YXfJuHiiLPEZoBc
	NfEMV7xOqr/HwdpytrxDUi/D7jFJFFvlN7zs5ynCMHrbcXTp7Ca2dNVPt5j1g8m6s9taaSpEXb0
	QxyTk7XjOByxuXKYwflawdaHUk/S+yxRMnmMJp5B4+/oixg9RjroRtD5O7D05ykzJecRxoVoJoE
	GYgSEK2DZbhqPL/wc+Wyym62y+eyEmPI1KJWccLEzi6zkeCT9qIArR6fFd7GEcVw1pAMDbY29y3
	Lp2UzzqkyZzIisCjZXO8s2s9XrSXM5hnbZ/MywMQvD7G4xC/oN/I7d0tZjidnHCq5d/gox9ca8I
	jS/qzfphcWH1u4KBQJ1LTFdy3rEYCmnWh/FylnPu2n0bApBslDYW/TGksHxnHEWAAgmTCvHgrFv
	tlG9j/jCDw8ZPG4tGnloyfBhw==
X-Received: by 2002:a17:90b:1d46:b0:3a4:cfc2:3517 with SMTP id 98e67ed59e1d1-3a4d1b5dee4mr1371166a91.49.1790777270839;
        Wed, 30 Sep 2026 07:07:50 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.07.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:07:50 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 04/12] mm/sparse-vmemmap: open-code init_compound_tail()
Date: Wed, 30 Sep 2026 22:06:19 +0800
Message-ID: <20260930140627.57431-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_compound_tail() is only used by vmemmap_shared_tail_page(), where
the shared tail page setup intentionally passes NULL as the compound head.

Keeping this helper in mm/internal.h exposes that special case to the rest
of the MM code and can make the NULL head argument look generally valid.
Open-code the initialization at the only call site so the special-case use
stays local to sparse vmemmap optimization.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v4:
- Collect Acked-by from Mike Rapoport

v3:
- Collect Acked-by from David Hildenbrand

v2:
- Collect Acked-by from Qi Zheng
---
 mm/internal.h       | 9 ---------
 mm/sparse-vmemmap.c | 5 ++++-
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index da14c56fb24e..0dca33db068f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -786,15 +786,6 @@ static inline void prep_compound_tail(struct page *tail,
 	VM_WARN_ON_ONCE(tail->private);
 }
 
-static inline void init_compound_tail(struct page *tail,
-		const struct page *head, unsigned int order, struct zone *zone)
-{
-	atomic_set(&tail->_mapcount, -1);
-	set_page_node(tail, zone_to_nid(zone));
-	set_page_zone(tail, zone_idx(zone));
-	prep_compound_tail(tail, head, order);
-}
-
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
 /*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 6916a3690778..f77e6e1e5a8b 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -221,7 +221,10 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
 		page = (struct page *)addr + i;
 		mm_zero_struct_page(page);
-		init_compound_tail(page, NULL, order, zone);
+		atomic_set(&page->_mapcount, -1);
+		set_page_node(page, zone_to_nid(zone));
+		set_page_zone(page, zone_idx(zone));
+		prep_compound_tail(page, NULL, order);
 	}
 
 	page = virt_to_page(addr);
-- 
2.54.0

