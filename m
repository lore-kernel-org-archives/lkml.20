Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094364;
	b=crXd+7Nv6ZEsQ6jAKPcMl6VpO07obaqitaUgH0r1gVOTOsGfHtCN+yqUqd8UZ9tZ5qtq
	 812qVaCXjFU8fOw8f5+uVCt8xLC/tT8VtX3LWikN+wjSpTtcssLLNX22hL/WEoDX2L8xP
	 0lZ7lDMFRfAZBvlUrGfmgKEec5Yes89N0CbhoBKeA1Ngn7mYtrKYQefs1Fv8E2U08N0/u
	 1NEs49QgCaZMBs6OnFzkoiELQnsDvoXaD+/BhZihpT8cSMZHKDHFkhQsDMogH+oNyC9AY
	 TCZRLNq+PD0mTVHfn0vK02RiyDQvV6MIEI2iNCv/LFzbPr17N79k3oQbIhqwS0Y7DEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094364;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+T9dXJtHkajTuMxj33xJNknQApvv9iNPJoMhnaDiDss=;
	b=LAcymcTvcnTq+RVOUyIWE3rqBXTNFKAZRfrLmefONkLMVGVTb7XyDO2TRNwg024p+S8G
	 sNfzW/CUuej2TzpNfBvTlx/7ThPb9W4en2UCAsfsRxjw+KyAu4rdgz2CstxDSCgaMzLv6
	 vJbP5yG9oYrmCFQp508ZY++Q4TmSbQV6a3qur4wbgd6Kz2GfBPJ6vCfPkz7ox7WaKTT2+
	 Cojq8Gp6omQ8N7Ld7kMlVHZ0BY1MYXSPKCABYHVGlhfp7aEqD+qWT7jAZme78TPBENgZ+
	 7V0THsygVVUZgtwTFbePHGXm7Kz65lVNrX9RrZdJg/tlD8x0U5A1BXRF4Tjis9koAgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkUpZ2aC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A83606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkUpZ2aC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321DB1F031EE
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094363;
	bh=+T9dXJtHkajTuMxj33xJNknQApvv9iNPJoMhnaDiDss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jkUpZ2aCKBAeL1KLPaxmtw83wNwTccBRSeBIhfZc6M4YBj74AnSCzGu/Vj7kKPZMJ
	 xB2+0PDyXJXQVB1EOn1ayaYzAx2mrJaWD8WmhUUZNmpwRSsDxZjX9mgfrYsVSBHWd0
	 VseBgRTYSAXzURjIAt+wjLxG3BCNO4grdGuYE16SirgMNVffR5YFZcQVUOPmL2cUlx
	 JGQcAvHByekurCovG0OYBu6ebbnIlf5DPz9bP5GyDI5tAMKRdsvP6VsqDAdMHElQkR
	 7Ie+U1N8faxW6AVJ4aydtmjH1gM3ZCXqRxH7V6Fb/x36iXpasqD76VEf0+2FHLR0Yr
	 244BIDm1VbR8Q==
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93ead211f14so79156085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwiSV38T9Kc1hrt3NDaWsIxGqpIJUNocsNbq+LyYquNmDxJHhcz+KiFL7epfbqGYiz2OyhWly3Y8C3KCUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJku5q6YdFyt7UQZkJiYbjUvCNHHO6DhkIeuJ3Hkcg+9WNzCIYo
	4lWmnOWQ7p/CH9o3uD3Mrt2T19+jz+UUn4+5725osbn/Z6SQO9sFZTOplaj7PnMs47K9w2Mxugj
	SBsW9DC9FkJC3p1BvOCMXWD5jTitlyTI=
X-Received: by 2002:a05:620a:1793:b0:93f:1fa0:9f27 with SMTP id
 af79cd13be357-943f4ad5cb9mr379876485a.29.1793094361679; Tue, 27 Oct 2026
 02:46:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org> <20261027-fixes_core-v1-2-6f74bec9a5bb@kernel.org>
In-Reply-To: <20261027-fixes_core-v1-2-6f74bec9a5bb@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 27 Oct 2026 17:45:49 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xh2BXe_e+8oJS3ZbzoLi=7r7-+90SHPy1+OwcPNdGUxQ@mail.gmail.com>
X-Gm-Features: AclHuK_Q0tGAJYZBBe8Ofc91w4jrj3Ei9mVOmmElYzvOyxGV38djS-jM8bZnzBM
Message-ID: <CAGsJ_4xh2BXe_e+8oJS3ZbzoLi=7r7-+90SHPy1+OwcPNdGUxQ@mail.gmail.com>
Subject: Re: [PATCH 02/46] fork: take mmap_lock before copying mm_struct
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Lance Yang <lance.yang@linux.dev>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Minchan Kim <minchan@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-cxl@vger.kernel.org, stable@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:18=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> dup_mm() copies the parent's mm_struct before dup_mmap() takes the
> mmap_lock. A concurrent brk() can leave the child with a stale mm->brk
> and newer heap mappings, causing later brk() requests to fail.
>
> Other operations (e.g., PR_SET_MM) on the parent's mm_struct can similarl=
y
> cause inconsistencies.
>
> As a simple and robust fix, grab the parent's mmap_lock earlier. This
> way we don't need to update individual mm fields in dup_mmap() and
> keep missing ones. Stop updating the 4 existing members (total_vm, data_v=
m,
> exec_vm, stack_vm), as that is now no longer required.
>
> Keep releasing the parent's mmap_lock in dup_mmap(), before
> userfaultfd completion, to avoid moving the userfaultfd handling into the
> caller. This should get cleaned up later.
>
> Move uprobe_start_dup_mmap() to preserve the lock ordering.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
