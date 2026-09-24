Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A8C35E1A3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236684; cv=none; b=Q9hLLJMxGoZYaftzj1g+MsIkUuipQPwQWLIYUbSnYP9ce7U35Up7s/SDAF5y/zOETNsb623qW74YbS1cfS1a5EZE/DLpKeI3jvDZNlVxijnGo+rFkWMwvxb6eHIwUeoqJPtK3BEcebzBo13m7I22TdmEnShnO0Rbj20uMwn2c6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236684; c=relaxed/simple;
	bh=PF5i3+2nQu+D20ZM6jLB8iQysdbwR3enQxJRzsgsHZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jRwEyO/C6Q9vLeYpzTqXO9HQLuEtnwSAetxMSXv9vb4vk75YRHT1SQGMBeHlDXlfecjmzHr9TAQAzV8GiGSwS0kdurbc8VZMWTlSINg6eacwLSTDrlQ60lqB/k93PgrITes3l3W2rM9jgDEFtL9u2Q9BfU+OmfROc4wXzONCmV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NKTsO9pd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NKTsO9pd"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso1062845a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790236682; x=1790841482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cH8utLFYEujpE6X6Qzd7ExQckIBLy/Lta27TjnKc3ts=;
        b=NKTsO9pdMHen4B/EQu6WdakCwQR6d5ZYk8oZI4w2J1sSXay7jdXji9RRXaOKixkwtF
         NoYg7W3aM7Wt5yVi+UVCy07f/zfuGgjUH5F8+9+ZOsnlwOvocwCC8me/sC6r/CdV5LWx
         gwLLyT1U4GotubnOHY/Wijrfy6s/ErG4zHio4FHyM75XQ6qzObCzUCiYGm5KvuxVXlxf
         6ggWZKxFnYhAIrIOVZNrDOAbDiOCyS3X0q9YbN+GmrbfZxafkhxa51IuaR1gCztJzg8c
         9HKzTN1mM7YINNCPDy649kVofNBQhFaEgwaKxzDCnrrjiO8Px0ygulDi2HsTzMbbtp56
         eHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236682; x=1790841482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cH8utLFYEujpE6X6Qzd7ExQckIBLy/Lta27TjnKc3ts=;
        b=GglrXZIuf2YYZDUE94Ks+o16zA7yVoTfMxmTbRpw0Q0tB6wUSuISTqOzRd3ZKeVbnl
         SoOnp3jZbXbwas8RRudml96Xg0PFd8B60GZZRiHqG8mmK7mXhh9xR2dAiXXPnSS4PifX
         jRQzDYeRkPbWfSp/eyLnVmQJsOrSd6ObgyVK6+rwmPe9P7T0pMb9MfXB408CnYckjrU7
         EhoGICtfpI6e85D/zJpmfZHx7Vs55267rm6XirBFvKOy8Rqedtn7UTFjsdunuG0LqWmD
         wtD2Rg/xhpuB4ZDpNKcy1cszaFVaTFACNSyxc1Xo/9NzV060yk12DzlUtbl0AwsPAuQd
         Pz4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7KTEUqRa/YOb6q7vsUlNoKJz2cCj/0oiN+wCbbQm8bwUrSWrJZU6XCckdR8ev33UweDWYcm7BcgeEKJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lYxm1m+VtkHkN0k7vLfTXwuCVBoCzaNxhqsrZ8bVqGWx9jlseV
	tt9PajOKnWAcuiVdqpDEjB+p9ttzQcdOOvOkJ5MdzbXGqk5K//V077l6XwTCIIa8+mI=
X-Gm-Gg: AYBFou16gJVXfOhaOOAH4tAuBNx+hX8VWZhTi8lkBPKE1q4Vb5soT1busP2+k+Hdi1z
	aZ+2Uf7M+3CDIFX9+aR2ZJf28cHz57O9W5hrz5QiF6q/8mVncwERuK/BjPntIPa/s0PUXDOljQL
	3rZ9sJLxvwUrlxSmXybg4tuKDg9PVHzu71ADgAMdqBttOgSorgujIlZs+KbJO9Qjg9Tqye9uqhP
	6sY0JH5ClQEBcwRf4VWBsrfXr98GkOVDZ9s44bM+9VipEakfANb9qFkwmYHZjDV1GtPUoxQSSzf
	EdgpzwwgTGKOdKxVxlecJ3VZhz61F8e1TOnmpSClJyQIghPxEQ+XGk+FTFS0NTthgunw0y3mH6J
	r93d7lYkC/kvLlRmjF9jCKe5ByCeGe8GtLuKh7KgNtlm5NE1r2m5V82MTkfKJeW+XXf685Ogl4O
	rGUgzmnR4VrjHYJdMYLn76ZYdKmIFbOg8YqkQqTvJUgXxHOqJbR6U1FKHjmpqpNVdOv9Di2EN9z
	vb+i3G5EIUgjguzgS8=
X-Received: by 2002:a17:90b:390b:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-3a09860771cmr1679255a91.13.1790236681626;
        Thu, 24 Sep 2026 00:58:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm3575622a91.7.2026.09.24.00.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:58:01 -0700 (PDT)
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
Subject: [PATCH v2 0/6] mm: Unify device DAX and HugeTLB vmemmap population paths
Date: Thu, 24 Sep 2026 15:52:53 +0800
Message-ID: <20260924075259.2013039-1-songmuchun@bytedance.com>
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
through vmemmap_populate(). The powerpc radix path continues to use its
architecture-specific compound-page population implementation for
optimizable sections.

The remaining patches remove the unused ptpfn argument, open-code
vmemmap_populate_address() now that no caller needs its returned PTE, and
add a warning for inconsistent zone initialization of shared tail vmemmap
pages.

This is the fourth smaller step toward the broader HVO generalization.
After this series, HugeTLB and Device DAX use the same population model
instead of parallel generic paths, while powerpc keeps its
architecture-specific implementation.

[1] https://lore.kernel.org/all/20260513130542.35604-1-songmuchun@bytedance.com/

v2:
- Expand the comments around the slab initialization boundary as suggested
  by Qi Zheng.
- Collect Acked-by tags from Qi Zheng.
- Defer the patch making vmemmap_populate_compound_pages() static to a
  follow-up series that cleans up the powerpc vmemmap population code.
- Add a new patch to warn about mismatched zone IDs between a page and its
  shared tail vmemmap page.

v1: https://lore.kernel.org/all/20260913083734.86802-1-songmuchun@bytedance.com/

Muchun Song (6):
  mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
  mm/sparse-vmemmap: support device DAX in common vmemmap path
  mm/sparse-vmemmap: drop Device DAX-specific population path
  mm/sparse-vmemmap: remove the unused ptpfn argument
  mm/sparse-vmemmap: open-code vmemmap_populate_address()
  mm/mm_init: add zone mismatch warning during page init

 arch/powerpc/mm/book3s64/radix_pgtable.c |   3 +
 mm/mm_init.c                             |   5 +-
 mm/sparse-vmemmap.c                      | 200 ++++++-----------------
 3 files changed, 59 insertions(+), 149 deletions(-)


base-commit: f19407ca08644f728cfe9762bf1d1f6985826c47
-- 
2.54.0

