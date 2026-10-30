Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396093;
	b=2QIDQH1LD67hmY2eXkvPYzXvcLW0d7Nh+5Id3Z8hAQYqIzOpOfqG9Ci6xg1ibRbDfRIr
	 zNZk9Wu9LCpZEd7SuEyl+Qx1f5PqqvSuMxpRXd8kQxsWF3NXWNrNis8UPW6HFXd0lU7xv
	 zYhBoWVUS5Pwrr/z4k6nVYP0QhO3ncnwsdt8hZKorzkCrjwkczBz9E6ujNhHbpj+WAYbM
	 f78kYxyrd5Ut5qyj9aN0hN+9RM3emnJ5aci1cD5U9tsiR5mlaChB9bPb1i2kesgqq3QUU
	 vqMhK/XNsKOcFSCTcdJeVOGoGd+aKe3rIiXyAeSoH4DsUYawvODTsoGkDi3gkDD+2ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396093;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jBWIioVXYy+FHhJhliV8CDro+rz/OXHsrYbyepdx8hc=;
	b=uyLogCxG4CY0uENks+oGjkmcGdfzdX5OGuZZ+SALpV0Knw2cgWJDYb6LDOh2x1o6bY3B
	 tmVBLAiX7+S4B3sfVs4Am4fO3TcHD1dFxk8nuXC2gojsBkvZl3qR+DjaT7Fc9lABoK7S1
	 l+xwhzn84v1ZqOfsqYcTg5lLHR4YEjAS2PWsAnW6XWvYgwdkCFv6zbkAvPW0RcQnC8aZR
	 z5z0qcH7uH+KrUXv2HWQPJUYaNKKm3BszApleSC1CPq2ovUxwzkKStTR91ijHrvu4Ab+O
	 dVUgvUSR3sqBA+T7KBr/dUSa4BbQejEf1qKk+NUqzgSRqAVwaXJP05FjckVb/1p2ApQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEwUJt+0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C9606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEwUJt+0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CC01F0093A;
	Fri, 30 Oct 2026 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793396092;
	bh=jBWIioVXYy+FHhJhliV8CDro+rz/OXHsrYbyepdx8hc=;
	h=From:Subject:Date:To:Cc;
	b=bEwUJt+05fIQN3u9oy4ForP+JKswoKiWrHs+DCYKrxZ6azz8nRw5iTHA26PKapl94
	 Db96Te6y7AcwLkHX5ZdQpUMM+RDNkDHhjTK7DDi/jK5a/wrgRGhGdB9pB7+0Y5qc4t
	 SHIrJCPZaj1njT5/t3nTQGdq0s5+yxHKeGkDnB50kSQfKEGNC5+M8XL8KuhZl0Dz8V
	 V0+GdSZZckkQuD6H/p9u1kVM+R5TbOblxUYdzhukpibTa5jv1fltlMg/y/IyPtxkoq
	 ID+9GayQCqglpzoH7xPGw06Wjz8vpbKx2tTQo/qoCScgasXfEtiOt4+q8Gu+acnUMD
	 s3gt821pkdgYg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH 0/7] MAINTAINERS: MM updates
Date: Fri, 30 Oct 2026 22:34:24 +0100
Message-Id: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAN5WoC/yXMQQ5AMBCF4avIrDXRSZC6ilgoU0aipINIxN0Vi
 7f4Fu+/QCgwCVTJBYEOFl58hE4T6MbWD6S4jwbMsNAZGjW37Lc4CqIIC2Osc2WOGuJjDeT4/Gp
 181t2O1G3vQm47wdr1FxcbwAAAA==
X-Change-ID: 20261029-maintainers-e2699bff7521
To: Alistair Popple <apopple@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Byungchul Park <byungchul@sk.com>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
 Christoph Lameter <cl@gentwo.org>, Dave Chinner <david@fromorbit.com>, 
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
 Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>, 
 Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Kairui Song <kasong@tencent.com>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Kiryl Shutsemau <kas@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
 Nick Piggin <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>, 
 Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>, 
 Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 Xu Xin <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060; i=david@kernel.org;
 h=from:subject:message-id; bh=10ZJcWjFZEoKFDZGI+EPUsV8IVrcoG1epfheVqxA/xs=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLKe8qZGna1kzNlb+lv9ykzOvO9F5sz/izVTE5KuXLM+H
 SRw6jJLRykLgxgHg6yYIktQ8H2Dly/X1Va78THDzGFlAhnCwMUpABO5oMvwvz51pe6Zf++vtxd9
 eFa12/mmc80Ko7wjl3X3/uk5cTr0Xi8jQzODygetNSqBHFoJomefnt2dHOPvMH/amjPaCyYf3hf
 GzgUA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Hi,

several MM updates:

Make Zi Yan a THP maintainer (thanks for all your hard work over
the years and thanks for taking on this responsibility), and perform some
MM MAINTAINERS cleanups.

Then, start the next step of the transition from Andrew's MM tree to
separate component trees that all get integrated into the mm-next
integration tree.

Start routing shmem through mm/core.git, adding me as a maintainer
primarily to pick patches.

Then, target the following components for the mm/core.git tree that I
(co)maintain:

     - MEMORY MANAGEMENT - BALLOON
     - MEMORY MANAGEMENT - CORE
     - MEMORY MANAGEMENT - GUP (GET USER PAGES)
     - MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
     - MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
     - MEMORY MANAGEMENT - MIGRATION
     - MEMORY MANAGEMENT - NUMA PLACEMENT
     - MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
     - MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)

More details in the last patch.

In the upcoming cycles we'll then route more of the other MM components
through different trees.

Let's see how this goes, in particular with the continuous stream of
fixes. But getting these in in a controlled way has highest priority
right now wither way.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
David Hildenbrand (Arm) (7):
      MAINTAINERS: mention for-next branch in MEMORY MANAGEMENT - MEMORY MAP
      MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
      MAINTAINERS: add Zi Yan as co-maintainer for MEMORY MANAGEMENT - THP
      MAINTAINERS: sort entries in MM sections
      MAINTAINERS: add missing files to MM component sections
      MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
      MAINTAINERS: route more MM changes through mm/core.git

 MAINTAINERS | 165 ++++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 105 insertions(+), 60 deletions(-)

---

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3

change-id: 20261029-maintainers-e2699bff7521

--

Cheers,

David

