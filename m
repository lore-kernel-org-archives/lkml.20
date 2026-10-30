Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396106;
	b=TP3PPSpEBbmZyFfa6OBmqDppv+ccjDABuFGDD/nOzvf7Ud5URbcfjjliOPfRXbTg6jZ6
	 1cdr6zvvTHKneS++2FERnZu3EevdqgPKx2BeO96pVQALlpaTPFmTY40OPNpgQJJlwuAnG
	 Ntdb2r6EcKWNjcA5coS8VrHBdhpKPnmf8IOpE9iEpBShKiKEoHO2AsIaa7oCy5LwJ9Esc
	 ZXOgn8NT+GI56LwRaNV7dbDSizb9qD0FrWiRqiVtbjCDT+mJOKfRFfJcAW5oWz2b3zpUa
	 5/t6J3Xtr+0kvW58zLRiks4+iu0XRZ4NbUQRKqj5NHY0k1CteVTbLrWMB9OCc1HvejQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396106;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1+5veRcUECUHly0A5XA/CEflolz9T2ehe39P3T8hUGg=;
	b=V4zrhtWi0r4HVYWyPUdcbpH+eFRi4qr4eyrcdyRS/U913SMDrPUdRjsD1YMm4E7ykuAl
	 HWRU07KpKUIHX6d8Ot6AmZw/U2BOWGwsGdyzAGtlYOUn8Vo/gneJe5VXkkzDf98UMPzVb
	 auY5lIZEbvwzElQXXKDA8H2/scscj2fjmV6gBIuAhwfGAR42gBZxoAF8IaSJGEfO2dWFE
	 73PHoUA9YtHwuO6Ct45eXL7LnnfyBgGyqbSWM8zc+cS+8Cg9YH721v6Y0JqjSu9LRTsqw
	 c3yhQ2ebGKZMGWrmn4kJYg8AEX37Bzg1LQWt+nlTdBIv3ZtqCbTVjhWj8OcEkSLmoig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJUUy5Wj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJUUy5Wj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C271F00A17;
	Fri, 30 Oct 2026 21:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793396105;
	bh=1+5veRcUECUHly0A5XA/CEflolz9T2ehe39P3T8hUGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PJUUy5WjqOFEOxxPslcS9cq4MRpfXs039oRUc7R6QiTbVXF82widIkdQ8Pp4EF62s
	 3fDDxpyXa4VvrI5WI1oZcH3kM0gxdCtz1/nzGt64w3YVK/DcZn4ePMllnHx5uA7UZD
	 fVWkW/Pa8lpw8MUnexfi3Lw50bZlecr54soRm4itbXSJPISr/dPv7efWoyWemgNwVu
	 Qyjd1gzv62LrwQoud9q/diiIdAn8Nygg/Yal9ASP/pHLt3SDon0LS1frQBDdE1Ckl9
	 uS33/S4QNRkZHcM4Ml6EXoCkQJbTyf729p4IX+pbI7Idfmf7vblYdIsMIilaeu7Vg9
	 5dNUfZMBkDCEQ==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 30 Oct 2026 22:34:25 +0100
Subject: [PATCH 1/7] MAINTAINERS: mention for-next branch in MEMORY
 MANAGEMENT - MEMORY MAP
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
Message-Id: <20261030-maintainers-v1-1-97278f8a5f54@kernel.org>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
In-Reply-To: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=david@kernel.org;
 h=from:subject:message-id; bh=7LhecTsls3AZLNquyQvMAAtG4l+9TG1hurjRyz/UVtU=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLKe8ub+msSa2L//3hX1pffWrdjklXMk1MiGd+tJyaXWV
 d5ldkU9HaUsDGIcDLJiiixBwfcNXr5cV1vtxscMM4eVCWQIAxenAEzEqZbhr/yM3p1tOh/jhVfG
 9u3q/LiNq3HPsZfmnpbZMg/1uA54uTH8Zouca3uz/EPdvIWb54h08/Cp/sydcORc3DOBUMsOQY0
 yLgA=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

"memmap" will be used as a prefix for branches, but not as a branch
itself. "for-next" is the integration for all these things against which
people should ideally send patches.

Not mentioning a branch makes them assume "master", which is wrong.

So just mention the right thing, which is "for-next"

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a162e9bcab10..dbb5582ec1c74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17566,7 +17566,7 @@ M:	Mike Rapoport <rppt@kernel.org>
 M:	David Hildenbrand <david@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git memmap
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 F:	Documentation/mm/memory-model.rst
 F:	arch/*/include/asm/sparsemem.h
 F:	include/asm-generic/memory_model.h

-- 
2.43.0

