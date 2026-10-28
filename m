Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149576;
	b=Ow5gUg2JJkEyTGsvNALaAnxYgd2oux1fQZ39kUZRrUfOW/9x5lsdG4qOwj9NoeQPgikE
	 HpAwiJTfpozLqgxlI9RUqWtoYnnCVWK7pSXc1dz+d5ZQ2e5cOdV/HTdSDfVzzGaKK8d4N
	 PikSgakEHqhPz1wL8lwcdT9xH5otGDsg+i7rzap9Av7Z5eSEKmQa2iJH6tg3qVER1BG/i
	 +9ExblPGgEYE6hZr5bBI7rTwYsMeCF0LROu3rm0iuy9Ri5+CI23alEGaYtBC+8BG8cvG9
	 TMV3XZB/tX21UZoQzYN9rNHmvbSMfl3Mjts9FiCCeZ9Vm7gzfvBqAxn8UmyW8jWGvSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PpW1w1fTH4pWdwk/odzA2Xx9G09sfx2zMLzLE1poreA=;
	b=cuzbLzy9YMUgTWzZlJlpMrICGdI2ykvAqLtK2yh+rtB0R4cxVxvPXXnKhlOYNyNPTcXK
	 cUYbc9PSI4+fb9w+HMOEyROPe5wC0eECMRAuQiGtP1Coa5CNzJ0QNYMxxByi1PDEW5HtT
	 XB+5CC+6lUiSPKAHLKckUX6+wDYgtvq8RrIqy/Ctrf1WzZyyJL3/LuP1OBDZ+W4Vbpoql
	 Ic/fa39648LoSS05yNZ/Gyc1CNtB13G4DLLDIZwIDObjCVc1RP8UdD+FteaaspxdRcMMb
	 MlsWnLtr2jxKFr131l05S0xEM6VoLabn5mVlzcp+9kOMxDIrgJwhl5sTTsSbFOZYNVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPwkcPFV;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13610606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13610606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPwkcPFV
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso3394975ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793149575; x=1793754375; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpW1w1fTH4pWdwk/odzA2Xx9G09sfx2zMLzLE1poreA=;
        b=IPwkcPFVyzgfuBUhhocxH+WImzb55zfjbLbDD0hWPoFWKHPSqvkFbDwsbhKGQ4PLrX
         pA60Dbt1ahknus8zsRXikJ3Eb50EO2sCCJ7kPGRTNY5z2Ru0j17dazlzJIx0OxDdDKMc
         3ghrWG56vyaM+9A+P3D1iqqweazvK01ap547sTlu4pTPI1hC85fLahI8y1HoYfFFlPOH
         ZOmeofYNMSGxrU+mDJDfFn5h/79zmSplvr7nT5TCdaCTtBVZIUN95ew+rD+uxuL1SzRH
         fxQTULmmU2FyTt1VKStcaGKSwBaDWZtoHYsou7IgQLM/61JaNgHdIesqZIps11MdVazp
         cnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149575; x=1793754375;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpW1w1fTH4pWdwk/odzA2Xx9G09sfx2zMLzLE1poreA=;
        b=p2FZzBDanXFATbTHvhaVgE3dzfHnf/FVVchZrcR82m6vT/B+C63kjQIAdYwxdQkaLM
         y4xouBaWZ0T63kf4OIQ1q1beLGE8DvnzcGcdoq/S0Uy06ZSp1kAQidPVlxDRViBDE8sf
         PwZiONFogk+iUfC+aLoTwXya8OuzKtj5AdObob2DtGPQxEaWZfEJWlOQD49hqtYlKfx9
         0po3DR4+n7Mr29XPvf0ccME+AG4UnBrhZJl/BDItWINAocYQ6ulB8u72iLnlUlxWpyGC
         EvPggPa7z+ciNhOEjlu3RELZ2wK4jBocUNXf1k442iI6va9fG4iJ23uD2eFC2PrjXFd/
         7Ing==
X-Forwarded-Encrypted: i=1; AKwUvBzUYDG2CIdUi7gqVg797wgYixKFiWgbUFXtpWtlFRrmqXq+f6KYN8s6T7acSORnWVkfT0YwZtC4LQ2POMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlLThE6bu3aLIbYLd/8Xh6xYBwZ+H3pR6nqOveSsloVxzajKsH
	IQ15HGc4RoUjEWQ3kCPkwPE5wnSSOoBMCzOLJKjoGnsJx+IjQmg1P9tt03yva89fo4ROdjU78iO
	kC3dCbEeoU0Z0DXtU8A==
X-Received: from pldb12.prod.google.com ([2002:a17:902:ed0c:b0:2e8:fa52:c600])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:37ce:b0:2dd:c100:b2c8 with SMTP id d9443c01a7336-2eb005a750dmr7696975ad.51.1793149575175;
 Tue, 27 Oct 2026 18:06:15 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:06:04 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261028010611.3929937-1-tjmercier@google.com>
Subject: [PATCH 0/2] mm/vmscan: remove obsolete offlined memcg reclaim handling
From: "T.J. Mercier" <tjmercier@google.com>
To: roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Johannes Weiner <hannes@cmpxchg.org>
Cc: cgroups@vger.kernel.org, "T.J. Mercier" <tjmercier@google.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
dying memory cgroup for LRU folios") and commit 0e0ac326c511 ("memcg:
move LRU size accounting on reparenting instead of copying it"), LRU
folios and their size accounting are reparented to the parent memcg
before a memcg is offlined, leaving the offlined memcg's lruvec
permanently empty.

This series removes the remaining reclaim special-casing for offlined
memcgs that assumed they could still hold LRU folios:
    1. Remove redundant !mem_cgroup_online() checks in vmscan.c
    2. Stop rotating offlined memcgs to the head of the old generation
       (MEMCG_LRU_OLD) in MGLRU.

T.J. Mercier (2):
  mm/vmscan: remove redundant !mem_cgroup_online() checks
  mm/mglru: stop rotating offlined memcgs to the old generation

 Documentation/mm/multigen_lru.rst |  4 +--
 include/linux/mmzone.h            | 22 +++++---------
 mm/memcontrol.c                   |  1 -
 mm/vmscan.c                       | 48 ++++---------------------------
 4 files changed, 14 insertions(+), 61 deletions(-)


base-commit: 2bba28e98578de622ef307d00875aa8f8bca3d10
-- 
2.56.0.307.g5fe7bd680c-goog

