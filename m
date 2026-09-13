Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5F29CB52
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288819; cv=none; b=GaUwCEyuBiLkxW5GjNvXeQijDB6sIT5eZP2loRecTPFk/5kAS4QyeQxw8rucvLOD2QQ2te0DiE8Ie1l5w/RZii3Qg8ZiZzl8lGD1n8OT71XfVgqNvauc9w1l6iDk9fkr6BGioG/o9bBJvdy+h2YC/vkzkp4k//FvIGbfC9Mp1nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288819; c=relaxed/simple;
	bh=HDNH2cjI7F71IWvak5BxNUu8opnLuo1m5MrEF5g6Mys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GHfQFJnAGQSNKhzjrq0g5DvjPIGr/UTSXWhD3nGnpzmH4Dfyw8IRabQ8jvoqXwDLb51FIMmXc2P/1vJCZtKtidybrOWxZvWbw61C2pXhJ3UwoI8q2Kw9lhvlSiup3fWvzZSVwQyZS+CcDJGJRW8yUyhYI6NVQjeeuhJVXKINMGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VQo2dsOu; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VQo2dsOu"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8692be1cda4so1844700b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789288816; x=1789893616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEYszFcJNVmbdBdKEoxiw48cXUFgR+bqS4N4pNtc0Jk=;
        b=VQo2dsOulCiAFyksPQMsUvOwsKBw8WEMpWj1Wuo5PiQy3e2lBPofF98C1mShOVMsMt
         A6o5SfQMuraNSp133pKufanFvfhLbhvuadc6Xj6q0QYCv4vZ7gAVwJ1qlW7zi09jKEZN
         0U5zDjBxl+1Xls+dwQ76h8S8VAomvr2LXzsK4Jc0TUZBJ4NbzDX8cep/j7aM4hF2TQzy
         zRZeLvw0TyRhX/PAGNc8+d26guaIgA4rngSVxZfI5uEDGnw+KHE/XY4kSdAhFD0Y63sK
         9vkNovxA1aOggIbm/5CWRU0UrPMDZ2B/6kWEVjfPHqr8km64ROLK34raLHvZsTBExfGP
         orsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288816; x=1789893616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEYszFcJNVmbdBdKEoxiw48cXUFgR+bqS4N4pNtc0Jk=;
        b=c6eMMnraf1QyEeTd47rD2nes79roxDDWauhtw+ePvMenMTrjCQCoRtEub4JSZQ7v2Y
         706VrEVZWR3GSO1/rrID2vWPjTwqymB7pstPFSad6tOt2t4qa1eOZq39uebX8yRopOPM
         G145Lw1XorCqVUxMxwsmfSs6VLLNo5XfhWsRHGMiNBhSbH3ImQVscWBsVK4DKU9MKq6b
         dgEH9+X4q4r+IJ8kSiS7UeTXEjYRHjK+CNixEMrOm90WmXzyc00oqXzsVMXlBVkNkLkA
         4Cf5Sl7Cy50q0IWThoK9VOtnr9ZHtePiDxj01P9Lya7ucXiGspCHRK8Ait2GayDgVoC8
         xsKA==
X-Forwarded-Encrypted: i=1; AKwUvBy1AqWujvznyxmAhuN0M+Q9kvGbVy4quuZuz2zRVJA08gCjYeGSrZWBeiZH54PVFQgP6DpbyJerZp2j6N8=@vger.kernel.org
X-Gm-Message-State: AFuF++nX/D9BcWfq3/ygadfsWYvhAxgKhY5VI/9O2hqGtYVpfcWFDxt9
	+fF4EGL+H3udycH1X2czv11XXu2QXLk8852Q0l6oCawKgQf4oOqU/65T85sQNRhxd2k=
X-Gm-Gg: AYBFou13J8xmyjJ3fIwQqvAXWaXRZBreoeuIw6FtI6VlO1pIXkTRWxmwuX7+cNIsEx9
	wzaBxSlTMWc32KAvzr5dp3Vb3s+lEu/jnwgG/ckXp7HS7N+yG675h2pQUbn3xnHqsYES2mTfvqO
	jEQC0cHXYD3HcvNNLVRW352Bmsk/RAGwTuLahdW6sDwLz6G9O8PE6cWlgDRqcqHQaYBpCyMrX9J
	QfDIhRk2JHzAceifHekMxgpGuiFcnifLn80e2/1oNLjnHkQZLQZo0G5Q/htV1xZIwmioQPdWyQZ
	W5mpwR74iShc4v0pXiquwFba1QI3FxZfPxnbRG2ty1YlQobnmEx14rarKFeVUxULPemXIr9OsbB
	LYCQgPE5sitegFsVN0SpI79N0ryf65aGbdt0d2R5Nlmnv7uMwcnTCwsUlBm5tzJf46l6rligxFl
	X4W3ldH0ew5gLmajFBDFo1VkF1lrJSLnMoePeNlrO6dDk7Ux2ccsONtXDqOpiML/J86xFzNfPeC
	6Bafzy0hgpwDUofCpqAW8TNsuZPLhuNxKaDZw==
X-Received: by 2002:a05:6a00:6c97:b0:868:7a65:d92d with SMTP id d2e1a72fcca58-86b32fef08emr19801366b3a.26.1789288816421;
        Sun, 13 Sep 2026 01:40:16 -0700 (PDT)
Received: from G6L4RL2QG9 ([2409:8a00:1832:cf0:5137:990:100e:cc7e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm3070531b3a.42.2026.09.13.01.40.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 01:40:15 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH 0/6] mm: Unify Device DAX and HugeTLB vmemmap population paths
Date: Sun, 13 Sep 2026 16:37:28 +0800
Message-ID: <20260913083734.86802-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: unifying their vmemmap population paths.

After the preceding Device DAX conversion, both HugeTLB and Device DAX
describe optimized vmemmap mappings through memory-section metadata and
use per-zone shared tail vmemmap pages. The generic code, however, still
carries a Device DAX-specific population flag and compound-page population
path, along with arguments and helpers needed only by that path.

This series first removes VMEMMAP_POPULATE_DAX and moves selection and
reference handling for the shared tail page into the common vmemmap
population path. It then removes the generic Device DAX-specific
compound-page population path and routes section vmemmap population
through vmemmap_populate(). The powerpc radix implementation retains its
architecture-specific compound-page population and selects it directly
for optimizable sections.

The remaining patches remove the unused ptpfn argument, make the
powerpc compound-page helper local to radix_pgtable.c, and open-code
vmemmap_populate_address() now that no caller needs its returned PTE.

This is the fourth smaller step toward the broader HVO generalization.
After this series, HugeTLB and Device DAX use the same population model
instead of parallel generic paths, while powerpc keeps its
architecture-specific implementation.

[1] https://lore.kernel.org/all/20260513130542.35604-1-songmuchun@bytedance.com/

Muchun Song (6):
  mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
  mm/sparse-vmemmap: support device DAX in common vmemmap path
  mm/sparse-vmemmap: drop Device DAX-specific population path
  mm/sparse-vmemmap: remove the unused ptpfn argument
  powerpc/mm: make vmemmap_populate_compound_pages() static
  mm/sparse-vmemmap: open-code vmemmap_populate_address()

 arch/powerpc/include/asm/book3s/64/radix.h |   6 -
 arch/powerpc/mm/book3s64/radix_pgtable.c   |  14 +-
 mm/mm_init.c                               |   2 +-
 mm/sparse-vmemmap.c                        | 188 +++++----------------
 4 files changed, 50 insertions(+), 160 deletions(-)


base-commit: 383fc05d4650b021f3c17e36a145106dcc61a294
-- 
2.54.0

