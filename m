Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072706;
	b=Qrtj61Kb6ano2NIakYixMFSFuDGv/vbzpaljdgRdxu+Slg2IgIj0ceH8QhlJ3kbi0Z/b
	 njt3ySI/UVHv3u6/qd0PCyntRr82gkJfRj2ZX/qFy7kjqft66FVBLeDaWMQdzpMxkHYPm
	 KpcPuG81iS8f48W7T/HGtrXwMewrxb4FxCC4DOLXhOdwIQwNOdXv/qfBTF8ku45x+/QIJ
	 2xuqXVmESR9QQ34AGTufcfpM99NLXH8jEj3j4/qsJdEIq37NplkG7Yuy/wAPewK1BDTi2
	 jMgRLx1Z7/OE+VYJ4e4fvSsIHTF/LEViDogvFFqAopSjgwOp+p9zjbcUkT7vvtp3RKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=7Mznwc8GrpzJ8tK5EL1ob+iPEtoev+BzmKX7CHPnJ74=;
	b=zuyG5gMePZtkthKYqXOzEwv80NOVlw6b1xPUBezcCui2jhxiP5nJfizbMMr1raQEsY9X
	 AURPGL/Od8zr9Z6qs8yKl5Swp1gpMbSJMSur+aS9YaBXRotEi9EJ2Jaeqv4Xj9gwBtnVr
	 4/GZJURbONRZI+OOKxzb1NCjJ3RllVHufYNwa+yiXtkxn4f3EQOEJy4uljIcMu2WS7kdw
	 Asl3YxG1+gnCrRWGNJmnMVM5HEmOT0WPs1wmARZhTZESv6jTEmXA9wYz4v0giZI/Eooqk
	 1/TNJHAMAP+WeObbj8Pi7gIct49Cr1ZwDH3wgDw6Pk3KtGIgrTc6ySjO5uN8AqhySMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=LpEct1xf;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF3B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=LpEct1xf
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so6419174a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793072704; x=1793677504; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Mznwc8GrpzJ8tK5EL1ob+iPEtoev+BzmKX7CHPnJ74=;
        b=LpEct1xfjN1thI8TbP1fFa5w4w7QpAjyNF4cILo4hjgANhwzNTKcYl0/OAf4qytQ+D
         bTfw0B3W1YrJQBpG4CQa8BYUw8l2YA95j8Iad3IOM19h6jXJAZgZVZG4NeFqABxjmQVx
         cqyrWzfJOtShgzKATE8MA+KO/cZ6XpKKBzqfRYPV63n+KEkSREwYLpTIdKLylOucISku
         0b4t0cDOYZZ8VUkN5GYjeY7kLbNFUAZvUWcO7vKMGLuSX/T0QUI3kWhBk14nybsQgrpx
         sgvekJqRyNLDD3CwyDUMJUgSY/E+TGZ5+ZTFoQY3fbSMcNnskQ516a1VLRqdlAxCgpFM
         NMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072704; x=1793677504;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Mznwc8GrpzJ8tK5EL1ob+iPEtoev+BzmKX7CHPnJ74=;
        b=lI2choNkwbU41lHE4Uv+zKGHAFDvzbzqoUDY85DgNcx03tg3qd+RWxqQd+AwKOM704
         bO9k6MKUPWyH7u6QiZjC/K0OtG1V0I+SdcbuVjYu+7BKtp4fFC9/M+/n2R3u0X41Xvh/
         wxdSvMvRyWqAphI8tGGoVZC8HdtxfOmFZCggFy5bkKWOJWnMcHpxtfyHe4GKX6MjBQg7
         rhkPGULSH+UeQJXHoEHYNs9gWeTI81q9QOIBTJ4xvtshjjNfE84AJo9Bsa3g3BykZelr
         BTHYGCbfxGMF3xuwWYmeAb72fepAasUpabBkoQ7rAa0vaByo/NZoUzvA8Ybjjctuq9cL
         To1A==
X-Forwarded-Encrypted: i=1; AKwUvBwPVFHlqIYlo/41xndo3Beb/dfuuqh/EsEF0sPZyey/QwvYPCMnv3d5H8DDWvt133ugpTzBHJ/Inu0utH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe0R1w5ubq7V6XrgpxYJT4NKxGHbWIYiPpNBFfC2nRFwBjLcgR
	E/WoEgoIc2TsaoyMVKaRndcmxNspcmjMK3mD29EpUC3rj9z9kXYjsciT/POljzOk5kI=
X-Gm-Gg: AYBFou3ZQaUtqumZ+zLr7ovvMGn59H1Lb2s7NH9MjbxzzN/BaiFY9T2GX+yeUKQYuRD
	z4k6b81eVi0HNuY5+fgzl0bMk6Shj3ataxSNRbtRHaQ/wMmZL9XvlFsJDr9pwQlU6aGOdAHt0Lg
	ttn2islEOoq7QCIeKbeM/JcR3UT8kRtGJgUcO1r9saa/eiylVp9CoO/FTJGokROaJiMzuSQe86Y
	98iyau5cnPxKqdh7is5w95aTOzy5u9EaYvS19nyuIoqG1id0ZWhFZgW7aSxLv73KXhi3AfGOcJe
	0IEzOxHLhKhde0Z2MVRqDNcc6NlAYLeYziUND5StoYt+qDoLbuwUiZjQ5bzULW1ad6k5lLH/0Ew
	9rY+zSsB1djVkZuJiAbGpWk3VgqQUPtcZsjWDrIpOjGE8ZOMulNbpTXn2b9gOYctecc2yAzZc5T
	HMaB9rlg8kcnC0z5QeSHHwIrS63GpZNyvOLmi7DMuRgLLUNefmtZ8fLvNqDwCmEUCNT4Pu1SxRy
	dUPczqr/K2KCGrPk11Y2LxKbOE7oBleMMg8qMXdU981+Fk=
X-Received: by 2002:a17:906:9f85:b0:c41:5a0e:3356 with SMTP id a640c23a62f3a-c46bded5befmr907107666b.41.1793072703836;
        Mon, 26 Oct 2026 20:45:03 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:49::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e7c83sm382468666b.30.2026.10.26.20.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:45:02 -0700 (PDT)
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
Subject: Re: [PATCH 41/46] mm/vma: call ->may_split() before a partial
 merge
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
 Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
 Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Gregory Price <gourry@gourry.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-cxl@vger.kernel.org, Chris Mason <mason@kernel.org>, 
 stable@vger.kernel.org
In-Reply-To: <20261027-fixes_core-v1-41-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-41-6f74bec9a5bb@kernel.org>
Date: Mon, 26 Oct 2026 20:45:01 -0700
Message-Id: <179307270137.1171062.14886397073081900278.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 00:18 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> A driver can use the ->may_split() hook to forbid a VMA boundary at
> certain addresses.
> 
... snip ...
> 
> Fixes: 38607c62b34b ("fs/dax: properly refcount fs dax pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> [ david: improve description; cleanup the code ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

Attached a vma unit test I used to test this

-- >8 --
From: Gregory Price <gourry@gourry.net>
Subject: [PATCH] tools/testing/vma: test may_split during partial merges

A partial VMA merge moves a boundary just as a split does, so it must
consult the driver's may_split callback. Removing an entire VMA during a
merge needs no split check.

Exercise permitted and rejected partial merges in both directions through
vma_modify_flags(). Check the callback address and resulting boundaries,
including unchanged boundaries on rejection. Also check that a full merge
succeeds without calling a rejecting may_split callback.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/vma/tests/merge.c | 87 +++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tools/testing/vma/tests/merge.c b/tools/testing/vma/tests/merge.c
index b26f1a66a1707..fcc052be15601 100644
--- a/tools/testing/vma/tests/merge.c
+++ b/tools/testing/vma/tests/merge.c
@@ -1488,8 +1488,95 @@ static bool test_expand_only_mode(void)
 	return true;
 }
 
+static unsigned long split_checked_addr;
+static unsigned int split_checks;
+static bool split_allowed;
+
+static int merge_may_split(struct vm_area_struct *vma, unsigned long addr)
+{
+	split_checked_addr = addr;
+	split_checks++;
+	return split_allowed ? 0 : -EINVAL;
+}
+
+static const struct vm_operations_struct merge_split_ops = {
+	.may_split = merge_may_split,
+};
+
+static bool check_partial_merge_split(bool left_edge, bool allow)
+{
+	struct mm_struct mm = {};
+	vma_flags_t left_flags = mk_vma_flags(VMA_READ_BIT, VMA_MAYREAD_BIT,
+					      VMA_MAYWRITE_BIT);
+	vma_flags_t right_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					       VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
+	struct vm_area_struct *left = alloc_and_link_vma(&mm, 0x1000, 0x3000,
+							1, left_flags);
+	struct vm_area_struct *right = alloc_and_link_vma(&mm, 0x3000, 0x5000,
+							 3, right_flags);
+	struct vm_area_struct *middle = left_edge ? right : left;
+	unsigned long start = left_edge ? 0x3000 : 0x2000;
+	unsigned long end = left_edge ? 0x4000 : 0x3000;
+	vma_flags_t flags = left_edge ? left_flags : right_flags;
+	struct vm_area_struct *result;
+	VMA_ITERATOR(vmi, &mm, start);
+
+	left->vm_ops = &merge_split_ops;
+	right->vm_ops = &merge_split_ops;
+	split_checks = 0;
+	split_allowed = allow;
+	result = vma_modify_flags(&vmi, left, middle, start, end, &flags);
+	ASSERT_TRUE(split_checks > 0);
+	ASSERT_EQ(split_checked_addr, left_edge ? end : start);
+	if (allow) {
+		ASSERT_EQ(result, left_edge ? left : right);
+		ASSERT_EQ(left->vm_end, left_edge ? end : start);
+		ASSERT_EQ(right->vm_start, left_edge ? end : start);
+	} else {
+		ASSERT_EQ(PTR_ERR(result), -EINVAL);
+		ASSERT_EQ(left->vm_end, 0x3000);
+		ASSERT_EQ(right->vm_start, 0x3000);
+		ASSERT_EQ(mm.map_count, 2);
+	}
+	cleanup_mm(&mm, &vmi);
+	return true;
+}
+
+static bool test_partial_merge_may_split(void)
+{
+	ASSERT_TRUE(check_partial_merge_split(true, false));
+	ASSERT_TRUE(check_partial_merge_split(false, false));
+	ASSERT_TRUE(check_partial_merge_split(true, true));
+	ASSERT_TRUE(check_partial_merge_split(false, true));
+	return true;
+}
+
+static bool test_full_merge_no_split(void)
+{
+	struct mm_struct mm = {};
+	vma_flags_t flags = mk_vma_flags(VMA_READ_BIT, VMA_MAYREAD_BIT);
+	struct vm_area_struct *left = alloc_and_link_vma(&mm, 0x1000, 0x3000,
+							1, flags);
+	struct vm_area_struct *right = alloc_and_link_vma(&mm, 0x3000, 0x5000,
+							 3, flags);
+	VMA_ITERATOR(vmi, &mm, 0x3000);
+
+	left->vm_ops = &merge_split_ops;
+	right->vm_ops = &merge_split_ops;
+	split_checks = 0;
+	split_allowed = false;
+	ASSERT_EQ(vma_modify_flags(&vmi, left, right, 0x3000, 0x5000, &flags), left);
+	ASSERT_EQ(split_checks, 0);
+	ASSERT_EQ(left->vm_start, 0x1000);
+	ASSERT_EQ(left->vm_end, 0x5000);
+	cleanup_mm(&mm, &vmi);
+	return true;
+}
+
 static void run_merge_tests(int *num_tests, int *num_fail)
 {
+	TEST(partial_merge_may_split);
+	TEST(full_merge_no_split);
 	/* Very simple tests to kick the tyres. */
 	TEST(simple_merge);
 	TEST(simple_modify);

-- 
Gregory Price <gourry@gourry.net>
