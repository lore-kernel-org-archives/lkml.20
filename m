Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87EE446859
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907157; cv=none; b=DoCFQ4WoF7d8PpDY2nmEuBRGswecfqFFlNjpiLHORbkNVfJSMchRBdMR6yzB11vl5P1xNtYPLDHPn5XdcZjYD3O4/Ns2UlNnErIQp6qfBwgBrvcQKirHhFA5ibKuRuI3sioVbcDN4bu9GoXxG9qGq0f2odc4HemhTl/HmOGEQig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907157; c=relaxed/simple;
	bh=W42kzDiSpz8PxcqIdsrRncQnFltKx9M42mKJrJhvMWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ggVGxGricsTRPEMOE/XtpdyLiEHNX5eh50Lxh/XrpzbNH8mkwQEZe6pxB8u/vyp4rWKTq3tV4fodpPS7sDUA7IU1HvuF88aGZIAw3pSfla5/GvOuFeHXbDM5PcdeyAIP/Fxy1qtqtvyKfskSk3lDEf7bQnX1k5IkUK6kMLa5By4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TceMJkOy; arc=none smtp.client-ip=91.218.175.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TceMJkOy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W42kzDiSpz8PxcqIdsrRncQnFltKx9M42mKJrJhvMWg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789907135; v=1; x=1790511935;
 b=TceMJkOyZvjrSs6BJ6e3dUW+JsHj+O6lHyf3xh226lssIfEecUlG6lfGQ18AAJS9WRRed0gf
 f7WUmPQwkt4lSqsFzE7lJmHWnQiJ59gnfPqHzMaNe8Tu2yxhPfNCcedonuL2zmcMzPAWtsG0Int
 zMhG/pDRDG4m17uHHu49585k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bea8566f21ed8081;
	Sun, 20 Sep 2026 12:25:33 +0000
X-Mizu-Trace-ID: bea8566f21ed8081
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	surenb@google.com,
	liam@infradead.org,
	vbabka@kernel.org,
	shakeel.butt@linux.dev,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	mhocko@suse.com,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	jannh@google.com,
	pfalcato@suse.de,
	riel@surriel.com,
	harry@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	youngjun.park@lge.com,
	peterx@redhat.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	trintaeoitogc@gmail.com
Subject: Re: [PATCH v3 2/3] mm: implement and use vma_has_anon_rmap(), silence KCSAN
Date: Sun, 20 Sep 2026 20:25:28 +0800
Message-ID: <20260920122528.8344-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260917-vma-is-faulted-v3-2-5c22314a72e7@kernel.org>
References: <20260917-vma-is-faulted-v3-2-5c22314a72e7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Sep 17, 2026 at 08:47:42PM +0100, Lorenzo Stoakes (ARM) wrote:
>Provide a function to abstract the common task of checking whether
>a VMA has an anonymous reverse mapping associated with it.
>
>If the VMA is attached, a VMA or mmap lock must be held when calling this
>function.
>
>For an attached, anonymous, VMA:
>
>          Transition          |              VMA/mmap Lock state
> -----------------------------|-------------------------------------------
>   No anon rmap to anon rmap  | Write lock/read lock + mm->page_table_lock
>   Anon rmap to no anon rmap  | Write lock
>
>vma_has_anon_rmap() never provides a false positive (the lock precludes
>it), but if only a read lock is held, a negative result must be re-checked
>with mm->page_table_lock held.
>
>A VMA obtains an anonymous reverse mapping when first faulted or forked
>and it is removed when it is freed.
>
>Detached VMAs cannot be concurrently manipulated as they are removed from
>the maple tree so require no guarantees.
>
>Use data_race() to silence KCSAN about non-existent data races between
>concurrent vma->anon_vma read/write on optimistic fault tests.
>
>Update the core VMA merge/split, rmap, mremap, KSM, fork,
>khugepaged and fault preparation callers which test vma->anon_vma directly
>to use vma_has_anon_rmap() instead.
>
>Finally, update comments that reference anon_vma to reference the anon rmap
>instead.
>
>Since the lockless read in reusable_anon_vma() is doing more than checking
>whether the VMA has anon rmap - it is returning the anon_vma to be used on
>fault - do not alter it.
>
>There is one odd one out - file_backed_vma_is_retractable() - which holds
>neither a VMA nor mmap lock and is stabilised by the file rmap lock only,
>so simply add a comment to explain why it's necessary.
>
>Reported-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
>Closes: https://lore.kernel.org/all/20260829100034.423064-1-trintaeoitogc@gmail.com/
>Closes: https://lore.kernel.org/all/20260909115723.528501-1-trintaeoitogc@gmail.com/
>Reviewed-by: Pedro Falcato <pfalcato@suse.de>
>Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

Nothing jumped out at me,

Reviewed-by: Lance Yang <lance.yang@linux.dev>
