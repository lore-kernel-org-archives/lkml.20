Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136189;
	b=vUWQclvlrXKPVvbJ5a+a2xDICHtY/RaizSOER+RW78gIEJEq7nwEDLS8jeBYj0veheOo
	 G+y5Pml0ouAi+OM5e5mGERRqU+yf1GmgFWU3DNeEgkV4D6RP0yAUHW8o6UbBi33jG6BzS
	 wLgqgpPD/X3ffSUGhxWd6hstL+6QZRCrRrN9UvAO7/hgBd3ARL+q4gKmmQj12HT0Nca+E
	 /xquHdGpGRmVg4R6q/qOkTsXWCWORjj71OvlDD8UoV/PtkRrziUKsVjLVSL9GcE8RU6dq
	 MScFMdFKzC0gxdE6AvqMX7YowWoS6MNsYhgLR0StYTfQ/wKmTaKMORjfccoA2nurhOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136189;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9d3CjGk4IyINuQoAlcYK4HfriQfpoCwO3FN0Jov9T4c=;
	b=OdQBU92soIsLf55o8hynUfFDNXC9YI6nvdefg6S2mJETg2nwChvXW365EpulR0BNzTaB
	 eXVBpR7MzNseAfZGKP+rM8M7LDaGq+XCkAJczRadEOrjgg5fGYJoIzVDYXsfhQHqVFcYd
	 qnTVnhWcuuk9LOjyM1XCUZ76ChPU4KI01z7oMu1XACkpBoiqbWqaYh1HbMLuW5L1l9DEn
	 wNGX6P2Z2PF8+B16nsVHc+UtDNDAunlZ12XBjk9sNY87smyszPC0eUN4WnhINiOAMeEz6
	 ec1Jd6MMaWFvnUcWR4u7HVK0oXOVspVh1g3we0u6JA7NPuOi+Y/33lvQbgYF2hqwzOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R6z+kAm0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A2606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R6z+kAm0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0CD1F01289
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136188;
	bh=9d3CjGk4IyINuQoAlcYK4HfriQfpoCwO3FN0Jov9T4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=R6z+kAm0PuJyWoP1wDpeDsMLfxEdKmvEBBNq9ncNVSENbCX0QB2ik5uDEOmNLgJ2P
	 VjQn8CTRH1BrUxIyQVAonsw5zEoLGAz9Mo+1iV1QE4yWhK65BlHE2meFhE3PxIgA8g
	 /w44e+ZyxOFykN7XZDiFYDvmvxGU4dH81q/05iLJklEIVVEHQ1lomD5FIRAh3Mz+zg
	 L+keYsUOFf+gHec1Kcsndv1zeAUtqDN7WkbVKUcnNs52DNFvLoGFNR87W2E5YFEqGp
	 YGLXO/1Xh5JYSqvvFMXmATv4ECYgilcVloUirDQAQjuUbZ4s0DrO6SctrHKceD5mJV
	 XmNhaeI0DoOGg==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-930c0f9c1b1so21393785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:23:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNYYs3aObp9H9QP4OvmcRuKA7XIiIl8u6geEfQIcy+G7h9VrsCU6Prb4d5ywIqYIwcnGX0cbnyyAqXZVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYId1aUvK7gbS9PFeL5oFKlvUmnGnqMsy/h3NVVFWXuSpF2Frhf4
	mNU6ha2lcv3WwWmuT+2NbLcgcNTL/d2/m7a/FFov8POyO5KmRgCZO7pCsKILgeeuE9DjvRJJpND
	Z+f9GKBAJPbkzdrvifWw5MdA8vmqlSj8=
X-Received: by 2002:a05:620a:17a9:b0:93e:9934:d179 with SMTP id
 af79cd13be357-94408cf6b61mr29933485a.56.1793136187480; Tue, 27 Oct 2026
 14:23:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org> <20261027-fixes_core-v1-9-6f74bec9a5bb@kernel.org>
In-Reply-To: <20261027-fixes_core-v1-9-6f74bec9a5bb@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 28 Oct 2026 05:22:56 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xy0mbje=iWGNkaGKOS9BzZdu=oEhZK6zokUV5=5-sANg@mail.gmail.com>
X-Gm-Features: AclHuK-0yMwUgshVkFS8VwS5_y6OqXYnXUcZ3OjIhbezUk0HJVn0mGZCE7K7epg
Message-ID: <CAGsJ_4xy0mbje=iWGNkaGKOS9BzZdu=oEhZK6zokUV5=5-sANg@mail.gmail.com>
Subject: Re: [PATCH 09/46] mm/rmap: handle device-exclusive entries in folio_referenced_one()
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

On Tue, Oct 27, 2026 at 7:20=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> page_vma_mapped_walk() can return non-present device-exclusive entries,
> but folio_referenced_one() passes them to PTE young-bit accessors that
> require present PTEs.
>
> We must neither call clear_flush_young_ptes_notify() nor
> folio_pte_batch() with non-present entries. For example, clearing the
> young bit on non-present PTEs can corrupt the entry: on arm64
> PTE_AF overlaps the swap type, so clearing it turns a device-exclusive
> entry into an ordinary swap entry.
>
> folio_pte_batch() will VM_WARN_ON_FOLIO.
>
> Apply the same approach as the previous fixes to e.g., damon_ptep_mkold()=
:
> treat these entries as old from the CPU's perspective and obtain their
> young state through the MMU notifier.
>
> Skip PTE batching and MGLRU look-around for non-present entries, and
> don't modify non-present PTEs.
>
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>

[...]
> -               if (lru_gen_enabled() && !lru_gen_switching() && pvmw.pte=
) {
> +               if (lru_gen_enabled() && !lru_gen_switching() && pvmw.pte=
 &&
> +                   pte_present(pteval)) {
>                         if (lru_gen_look_around(&pvmw, nr))

I was also a little concerned about the internals of
lru_gen_look_around(), since it visits a few neighboring
PTEs. But after checking, I found it is fine, by checking
get_pte_pfn() =3D=3D -1:

bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr=
)
{
        ...
        for (i =3D 0, addr =3D start; addr !=3D end;
             i +=3D nr, pte +=3D nr, addr +=3D nr * PAGE_SIZE) {
                unsigned long pfn;
                pte_t ptent =3D ptep_get(pte);

                nr =3D 1;
                pfn =3D get_pte_pfn(ptent, vma, addr, pgdat);
                if (pfn =3D=3D -1)
                        continue;
                ...
                if (!test_and_clear_young_ptes_notify(vma, addr, pte, nr))
                        continue;
                ...
        }
        ...
}

Thanks
Barry
