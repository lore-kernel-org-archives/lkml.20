Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793228056;
	b=03FSc7A2IugzM960dqEhs1wEHCzDERKN5CTLw9ms/fxp1OL8IFsdDSoChnAaMsp/YYs6
	 ID4Yv7LJzVLKgbmpy3kICaoSlp8EdCBJb5H19J7R3+mHl+ZW287f8U0bhngcwEMyxYDYt
	 /R9l4uh+yW5cZet61nM7lIaQuKp0ZtE8h0S+BKl6/W4hxSgUZ54+y1ZEROGE14xOGAQO4
	 zfvIYpZ2Bk5pUqG6nL0L4kwrWHwKWJ5EWEQZWpQuAhlzTEr0xRtu6zbpm8p/yiBN4i8yn
	 Emg0+zT4hWIF1xwDBaDww3HyYlfGCegR5s5GWAnHcwbD4aa8gVHAKpN1Lyy1FiXdklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=1nzL/A4OIGWxPEaAp0V3O0CBZ7XOASlD1R5vK61L67g=;
	b=SN/VRIhvpKYYSspiG34zRPmgZpF3hjjm3yqezOT0JCOhmTtkuAimUOd67X//wInZIv3p
	 ytjUhLvrdFFxBQtkDWS870MrmCLFxoqxGClhmd1vIQjM34xg/1P8qnL1hK+jntxRnNpi4
	 yYaEV6S1FR90GNm6U1MkNDXPfzv7MM3MTVo3+BX6TC27fe1kfIaNhG1fF4G4E0ok4lfP9
	 Di/cPBmSLfRNWxmAHxPeAxgzSCtMLdvruvMCj6R1fuc+9eEazshR9bLkkk99RzbHiJ5sY
	 U/L9C88xraMBKyMztVp67CACvmvHXMb2aFh2MhIEB9YTxWkok2raGDQAuyz5i39+nXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Jd09Eqyr;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA7606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FA7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Jd09Eqyr
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2253302a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793228053; x=1793832853; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1nzL/A4OIGWxPEaAp0V3O0CBZ7XOASlD1R5vK61L67g=;
        b=Jd09EqyrE5Ah8cRBCETOBxDbT9b0oGnFriZ7N/vtIFnR4atxKwoVXBEkw9jWiyscaL
         9cBv//XvhVx0QHadjkJLBobkr5XoWyssGxmav1gWZI3g+BwjlhfZWo65PjCsgnm9H3K3
         xu5Gt8LjlHXosZzQxl27itMRU6XM03eBrNEUzaUgmLacP/vWk9QUrBawj9QiMopYPRXA
         tFTTkouWxIpyyRzhMiRtstmfu3ZGpQ3UoEM6m+ucddIsmxmD56hyTjhxLKo4VCQBrV7A
         s99qsxF/HxZexb7mRhlnvehngAX2PDIIfWSoapPGufqyJfpOj/CE/u6FaQ8yHPJb3EEt
         tvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228053; x=1793832853;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nzL/A4OIGWxPEaAp0V3O0CBZ7XOASlD1R5vK61L67g=;
        b=HiDeiMpEpZIagMHaLtfBhTRooGjBTDmukncz/6Ye07w6hF9a/ZIEV5LslE2hoXgJJl
         cg+HNWrmOcfDpsmw2YbDL6QS2E0gUWpuMddusnRYRjxQ0P3nNuS1XVEEiemr1KvIvjtV
         NRNXm6tguJALKM3NSkkbU9vmI+CQunnoS3Mz9BhQpG/KLBaLy9bK4as/wcyUfJsnaRDd
         NBCYm85PDm+XcfrPhW3PMXe6COKI1tQToXHqllbzYa0wrzXaQ6BLA8i7e3cve0s4oVPk
         f/VVFGzLoyDCc5H++rUHMsYSQE5lCnaqEuHlrANXSozEYLQcvnwmoW1n43ayI3ZJmy8E
         47WA==
X-Forwarded-Encrypted: i=1; AKwUvByRODgDfYxXtsfxRMDMaxqJglPrMpGqZtWQNbXpvhWyrNsIbwOsiqx0vOET2MDIPzW0cch66ueR4LHl6go=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWupmtBgmjLb9eneuIyiqkQ6J8PfjRLhCcQhbqks2iqzeaf9az
	nKBIGm42yvnCFZRl7k+xdilzAT3AdattdOFVsdxUcChmbGAwO77LUpy/274VrhwAiKs=
X-Gm-Gg: AYBFou2Wz2aVMsvdbbXwrrzZSUEMlCbX3rNxcSykfMM9/fMcd2QyMgYzy2rlsxXhC1F
	Kd9JDjdBfzgE2FJJ0mWlRENUgnlz2UXaEquL2463k2+LKbiNGQlCvsNqIcQIa41DyW/jw0hOohk
	t4Z5NHM2RFn21Htzg3y9ki60ByLQakpLXbU4VYm6oeeq2+SRU/yMk6bikS+Ia7CRvTTlQeuIvVo
	yE8cI9AIXzONeZXUZoeTfJ6IxqisAXCr1W/3rteQtRwQAzVD7MMH6Tx3IlmgVz+3WJMnLFIcPYF
	rmBvEHuy428fzy13KArCqEnh+/P2gkx+NLbJuShOJWIRR1dZVQ1xYFbNs3uxdW2DS1CGLHyyIX6
	WdjOqoPD9Hl5EHgJcAypKjwXsZ9ca0Jh0XnEnKQbgtkE/K1VsjGTtkgptESAFwQC5A9xZN4fvPM
	EdTk/7P1YyDSQa72bWqAK9AZI/0KlpYX+uz3p2/fECOqfhmoEPBumat91FpMILCNKJo+cljx5av
	ZYaVYKRUgAJdTSsozx3l4dbPmbTh58Na9iGu/QSSGyQ2kGG7yrRq+SACjU4bSvoMjq6zJcDiTSh
	H/5qU0azwny02peoHeI7zRzyKeloQ2FM72yA2OzzT3U=
X-Received: by 2002:aa7:d0d3:0:b0:6b4:78c3:b8bf with SMTP id 4fb4d7f45d1cf-6b49cbfe65cmr2043596a12.26.1793228053385;
        Wed, 28 Oct 2026 15:54:13 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:49::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964601f2sm1991741a12.37.2026.10.28.15.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:54:12 -0700 (PDT)
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
Subject: Re: [PATCH 45/46] mm/memory-tiers: unregister empty tiers outside
 memory_tier_lock
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
 linux-cxl@vger.kernel.org, stable@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
In-Reply-To: <20261027-fixes_core-v1-45-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-45-6f74bec9a5bb@kernel.org>
Date: Wed, 28 Oct 2026 15:54:10 -0700
Message-Id: <179322805093.453251.8441529644965692562.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 00:18 +0100, David Hildenbrand (Arm) wrote:
> When offlining a node's last memory empties its tier,
> clear_node_memory_tier() calls device_unregister() while holding
> memory_tier_lock. A concurrent sysfs read can hold a kernfs active
> reference and block in nodelist_show() on that mutex. device_unregister()
> then waits in kernfs_drain() for the read to finish and release its active
> reference, while the reader waits for the offlining task to release the
> mutex.
> 
> Return the node's former tier from clear_node_memory_tier(), making the
> helper more similar to set_node_memory_tier(), which also returns a
> memory_tier pointer. Let the caller unlink an empty tier under
> memory_tier_lock before rebuilding demotion targets, then unregister its
> device after dropping the lock.
> 
> Fixes: 9832fb87834e ("mm/demotion: expose memory tier details via sysfs")
> Cc: stable@vger.kernel.org
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price (Meta) <gourry@gourry.net>
