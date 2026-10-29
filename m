Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236832;
	b=dY8SZ4ZfjbjszXXGNHpy8hjFw7hmf+5+N7Tp5oeF7wmvUza/teN8Y21tGaxxX3HpAcFi
	 3xTAZoz0HXD/cX86tvakmDKAXHNKnqHVVD+hUIkfKTcD5MQryY8CP5V/Q8NLt6pV5uQf+
	 lAARwHnNALeQU6sOLHdv8npr3dkCh9CQEpaTAqrREi3GVvueeocB9JcrC+QhBKB/h3zBk
	 GKKE4Q5tu2Jr58aj/FZ3x/5TdqiANBEE9mo32CmDSxLQAsbIEnzWxUMD9+tdHb7gV8l3Z
	 yxfVhnsOg/fYuQvAEuh43NmKhNESOEoR9WyV9P66F3AYg5w4T4q5rYl1AO3X2Gx2F8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=TWYN3MXkVQTFS4ykvP4ULAqrY98K2LtbRow9MYNtF9g=;
	b=rP9Rxy414JfueJMysByuyZuVx/SHXBkDUwldjzG+ybjoR+qIU1nyoO8NhKhrF6c42Efl
	 Mz4mU7Kc4hrzgxm8jazGz0nYvw+fUccRWGWAG8CEZtC/fasblGT7wd8swJM8P5SIyv915
	 tf0Eh3bRK6tgu/ha6I6zEp/3iuN9zuiOMr+iipdDJpqK58mp9YGBjk5+3Xbfo1v2A1DMw
	 NvDJxrmvOERj3nM2HJRZRwwtPowTaqCzjO+huMdv7rwZc5SGWI6kf4+0uSNLb9wD4MfOY
	 1EgmNte9Vov6rk56/bNyt+HxgQ9nQTYhObpS0Qi3MBhERIFV1EDaymr8ieXsvVn3cEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="X0XY/GAi";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181EA606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181EA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=X0XY/GAi
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so328118a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793236830; x=1793841630; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TWYN3MXkVQTFS4ykvP4ULAqrY98K2LtbRow9MYNtF9g=;
        b=X0XY/GAiMek/vFbkNlCS++xCJPhcJpRxEM4fx1Ljjv6aCGTfMX2iHg06Cuvz3jbJ3x
         Q0dDwGr1BIBMf5kqCtqsb5bfcPFaFZlUqEnSi6skik2W1J4zJ5GeZ5elYQvrlDRe91e/
         CP3Ywj3kmY6/6N/XufcgSAxLlc+irLxiHwNEWl3k5M1t7aKrd+VArviVR+LRPwX+IZPm
         GpA3SbXg+reoCoke8l+SC4GaT3nXvce2SqP/adtt8ITzlbRj4F9bRx8OgSUJIJiobyeZ
         u80Of7gLVfSgCHHisozRXuwKcVBjIh2eid1AKfwHBlqSo1BxKhOy27h+nd0r4z6VpL4i
         tJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793236830; x=1793841630;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWYN3MXkVQTFS4ykvP4ULAqrY98K2LtbRow9MYNtF9g=;
        b=PZJ/t0O4L/HunWo1sStvvl8YlZNNlsGyLy2JshioUnwB/rIQcWykYnD0AtUrvkhGfU
         y3VE2/p+MhP6L6gWYRQctvrPl1I84pQ3cQV1WepZutwr11ssTGfbuRehqr8K8LrobHN4
         7tNLGIv62CvuEYhQNS9tuHfeM8rrG2V/e+Fh9oY9ybZMwPZU0Yn3Tt2knNxXZVceYOtR
         KbCRqZigdCiQ7G6HjWiqkF6lAQY8nuKANSM+fL3LwElhn0Cyy74g2l3xtKpvj5eusybb
         IEC8dgP13Q5qehhsaSdVv2aVjNLDo0AfaW4fmUOA1s0uqas6c4siB80nxtp4tHMvb/Ob
         7VPg==
X-Forwarded-Encrypted: i=1; AKwUvBwAE2dT/CsFUI2OMy+dU8lnsSL04kN964wvARJmcvHBDq5PUXOMi+NnrNh9w6lq/1Wnsvm5frs5n7x6kvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKruJWitcARABTR7ULVYy+1+8RFYwphw9cCbtqs/QuEeQXmIzut
	J448QzbFZ+3OD5b6LMGR7NNoqJSiW56YjHZpT7hW6ICuxtHmHA7NQ2RSzpmgq8+kpOM=
X-Gm-Gg: AYBFou3g0ZedIjXD7FR0on3o5iL7wWLnSNTLWJUHfIKKvgvAAn8oG7w9sAjuQu+YQdc
	EzzaW/q2H5wgWa7VJYPWS5BuSKgFpS1rPtd3xmBb8eWg7sAwJJROd0J7EwSN2AnrynYD0X9MhNe
	PcRtzczNzHe3NxiMSm808WYisCdPht4/7pivyrEzQoti1X1/KqBKTvM0FS9RANWPmBjjGQcfxWk
	G9/TOkpqiGwAB69M++btFG0HWUjaTJGh0gCIlL+r/TVetKg0rtXSQrIFAamm2ilifX14XEOIvo9
	kZLYesattOg7Xjic2g99hpWheS7OxnkEKo5evBza4LgPGQfJkcyzQx4rgeTHI7vG1vP2BZWfAdj
	39SsAnRZ4448NqRU4jrv+kpWZN/fuhnl4/TrZGn2sWBUY7qVbIXA9M9qDWASPA14nF2oa0+nQOn
	4fztsAGIbT5k2twpA+errPLcSll/oQCTJ2Up7JTngC9aCRQfw9yvN6Z8/Wt9tqQGsFnFf1rp85P
	NZ6CKtum2j5Di7e+zKY8fvEfpfgf2Q38732QXC+YvWg03L5QMSaHg3+OtveI3PQO6sjO5iSAQIP
	X3TaFBcZNVBKUc6aZAwp
X-Received: by 2002:a05:6402:c507:10b0:6b4:8d8e:c5c9 with SMTP id 4fb4d7f45d1cf-6b4b0b82678mr569270a12.4.1793236830233;
        Wed, 28 Oct 2026 18:20:30 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:72::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd649f69sm671275666b.43.2026.10.28.18.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:20:29 -0700 (PDT)
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
Subject: Re: [PATCH 15/46] mm/khugepaged: always recheck the pmd in
 try_collapse_pte_mapped_thp()
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
 linux-cxl@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261027-fixes_core-v1-15-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-15-6f74bec9a5bb@kernel.org>
Date: Wed, 28 Oct 2026 18:20:27 -0700
Message-Id: <179323682749.453251.17316394789253085295.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 00:17 +0100, David Hildenbrand (Arm) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> try_collapse_pte_mapped_thp() drops the PTE lock after it has cleared the
> page table, and takes the PMD lock and the PTE lock to remove it.
> 
> In between, MADV_DONTNEED with CONFIG_PT_RECLAIM can reclaim the
> page table. The pmd_same() check is supposed to handle this, but it is
> only done with CONFIG_SPLIT_PTE_PTLOCKS.
> 
> Fix it by performing the check unconditionally.
> 
> Fix generated by an LLM and sent by Josef Bacik in private.
> 
> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ david: adjust description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price (Meta) <gourry@gourry.net>
