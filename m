Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793206482;
	b=eU3dvIjjssGGfa7Jv3PF/kA7eZjvpDloZI7sA7LcFAjtchcJEs0dNVGP/vpvADcMXQ3Z
	 YMRDnn+a4EIC5+UBQLB7Byl9fX5kJBG9Va8HckPvjNOJpbJx+z3eOHCtK7654Mo93TD8T
	 O7w3Jt946O+Dr6pTGKRusrfGuaTh5AhJanjqLmFutN+ufzIjkifXlaXJDRlY8SX41RdJl
	 Z5/M4Qeyc6S5KOBmaLztNMho6DVlYpMkpKrwWf6UHdNKEl5XXzU9GER9c8KsU742YSHMT
	 M59RWgWfdhcX+AtQrIaI+SW8DLVBTF94RuCDDJErChzfnlxT1EotbzD/Xy+VzH0CsPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h3ystJhrkZfs4wDwVdxIpAnqZwF+5sjgEnOhfYS+4Ds=;
	b=nYTFnG3ot6OEf9WspLsXm7mLT+1Hja7RjI6qxJ7pV+hN797EQ+UoeHsyaaCel+Ms0D0f
	 6HWqugjhTInv81sGJ5hkK/uDvzCJD+0ZuhLeO6pJe06afvpC9NL4RF5S1Tx6CrpxEfjyA
	 1DAM5CFSb4Z6ewlqDEdDGwQZaNmku2vbCI8BsDkUIcxOaToM7IeR44KX9L22tVbXaNKm3
	 JR9nLby3cGjuJ3Twm926f4vwD7/Q8umySOldhWVHd033nhTre67VR4QLZhwKE2sTMGMx7
	 P1yXNNQIeIRn7ZDG7fJ5If0DM1+X5EX/o9pdujhgh0p6zicjUEW0KxkmNcDjRQSUAjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oj4eYMqF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED0B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oj4eYMqF
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso207708866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793206480; cv=none;
        d=google.com; s=arc-20260327;
        b=QW33cnGpGwsiuP67EI3z9upLobj7BjCOogTiUK4sBhHUIY8T4+OSkCtk4UpNTh+r7D
         Ym12af8ufyC2GTQpqToJCucq0Xnu2owr9MxSE+st7U2j88FQibeZtnl1mHemg46nW0NY
         bqZCm6nkbcMeVZFSjcTTE74StK3+weNXwvBXKLyA0Yk1fEhEZZWcNxsbJXpt0uzecyAZ
         s2aAqEXnZhntx1u8OvGg/RzAouiaiWy/70a8zE1bPiVCcEcltHh/9aBG4CToPpiCjeSn
         l3lNyOCUVRLcLRL26XdRkCszWZZj8OsH0D+YPGkUilj5LPv7j4/BkV8CmfdPVEbv8pI1
         ItFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h3ystJhrkZfs4wDwVdxIpAnqZwF+5sjgEnOhfYS+4Ds=;
        fh=A8PR49yt+EZ8zmBpffopu/D4Y81COfsilOJXg/7I19w=;
        b=ddYdqvClEkWh2nrnro5RzM8/HgghKSzKdtPR5ME8hL0ZFhz+2J2Evknj0fpdfZAoh3
         q2bGICnc7zjqlhpaFCRmxxgREP7l5PPHflWGFIQDTumX4PYQ5VkPjxRvBqKlvZak+zRD
         uLG39wlY/QjcjF5jERZi1qxbkilznCRxPjDJGpvxGD9j54anNyGCrCElm888CQxYDn2p
         W4hhIo1q0vMV65tcT6IhSjEtjSy/Ra8ALPUzVyigJYRwL4gTp7+NJlXpHUu+BB8Ydfg6
         1/qAw4x3WjH9gbM/UFsZqEsQdFP2Cq7dxZbKbyabkPOErP4ViuvtkJbi/vEMAmL+w+Mg
         XChA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206480; x=1793811280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h3ystJhrkZfs4wDwVdxIpAnqZwF+5sjgEnOhfYS+4Ds=;
        b=oj4eYMqFg7gHe9H2JcxnVX1xekmxsJ19PcyDmk/OMgjn5UXSCYYnXu7Ac1axMQ7SR9
         q4zcTyMTKwoBmlpjcyBns4x2YrJV/wZCM14e5QvikeiV0C+wKNF7KUibECOIrMdPWZb8
         TeeSnShwQLOPfWWedxcIMlWY8bdOdzbeIcmNlPYAeJPXpTRHI3uLnL51w/g/MSBgrYqU
         hM8NCxRBVHWjK69lGvL9PkV9slxoAJvbLHj55IQQFN7GfFG4bIrQO3qJDWc5uDOrVsDp
         Urwxbb1Ol2RkuzF1a7HS3sIe18QCl/MS8DkzaZbxu24cwwm8EY03lDrdPNjvlUvh/BZE
         LYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206480; x=1793811280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3ystJhrkZfs4wDwVdxIpAnqZwF+5sjgEnOhfYS+4Ds=;
        b=i/cZNpxdhBtSrvtY4iiM6ohF8+L0FW+gNq6L031qaQ/XHGbA+0hq8+uPGVxbuGy5NT
         J8LdERyBkF6PzQHMLiY/ntA2T+4VEKzWkbTK21g6GD4hNHYc6wEXawHpW7xpMsLYRNj4
         K2c4SmV6FjvWeJKYteqTyAA0iMC0rbrWS83ipj+AO0e45TY/zjmm6j5CwCk4vQZq7h2o
         rVLE3zPdsqk79NUJT2Z8l0uyiZHTLC5lZsqsWoleq9If4YujVdEndtOnAM122Pd4RbOn
         IzuaGu0Gtu8mcwO7UCWIjd7deO8aSQQ68sdHCLj8jLo5olYGS+nuOdPLm5YnZWWvKfIL
         4IrA==
X-Forwarded-Encrypted: i=1; AKwUvBxTdekj+obdc5/x+ORlQcXOWDFr46BX5FEwqY/a7P4gIlJlgaXvEl8w9p9WTeoXgwWxmSXJFQ4S+zJafQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaG/vosI6QEbiT39ERPY6zmfVE1N4SjhcOoweMulOybHnX1LtR
	ad4xdjjcTg+mlvkW3qZik6/JxDWkevIg2MezyEg1HhKAMLxDdqWM6P6AF2oHvKfybZJUa1tuCJW
	wOIAFENuJxXSyhHKq79x2UvOyq/tHmmA=
X-Gm-Gg: AYBFou3z1dnZbcqUWWR/Ffs2NTssTtvwtGrFXFVSX7Nx9is1cpqrwl14+PUzbP1m8Zb
	PiLfmNOv/kiL0h8P1wLsqYrrH//u1VrnhK8HaUlKWmx2WtZhFZiIVAw2OlOATu067h7iCjCQOKd
	0oy5oh41qVFmuvp9PwEJ7RYeMMNgysXDv93Dj7u2Etvgr0BQeajNDDNpq+4f9dF0ZDBkRPHLcC6
	JqyzL1cahUi5MlN6D7GawxY+ak+E7jKVDEeBXaBCkHBotiJpucDmCJiM5uI+n9/inOsmTAX3wiQ
	Hp1sePIu0JAvda/0ujz8NhLQTS3AiAjr/xa/3FLvdXXArzSlbFZSlrNFM0CVOUqaGydKvVTvN51
	JaLcyWd8ruWEHOqtTFc6JYqdQAQQ9TvXxbptlAeMjDOs1/BybfXTrIpwx5scVzcsUbYCqDA==
X-Received: by 2002:a17:906:f586:b0:c46:5973:2a1c with SMTP id
 a640c23a62f3a-c49be00bf7amr248310266b.37.1793206479455; Wed, 28 Oct 2026
 09:54:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-1-6f74bec9a5bb@kernel.org> <auBbKP8UNI9talDL@gremlin> <e5766fe2-6cbb-45bc-bc57-87314c130de8@kernel.org>
In-Reply-To: <e5766fe2-6cbb-45bc-bc57-87314c130de8@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 29 Oct 2026 00:54:01 +0800
X-Gm-Features: AclHuK9Ir5cjQUbkmvsMXXN1XNQvMKyhNeup0qo5sC4qB6sDOiJzphX3Pz6BQcc
Message-ID: <CAMgjq7DzLFcznTqVaRneoN+qa9StPTvcBwHMdLM52ZbfZ-ffEQ@mail.gmail.com>
Subject: Re: [PATCH 01/46] mm/mglru: don't use stack pointers when walking PUD
 and PMD tables
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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
	linux-cxl@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 3:07=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/27/26 09:06, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Oct 27, 2026 at 12:17:21AM +0100, David Hildenbrand (Arm) wrote=
:
> >> From: Josef Bacik <josef@toxicpanda.com>
> >>
> >> MGLRU passes stack copies of page-table entries in walk_pud_range() an=
d
> >> walk_pmd_range() when walking to the next level. These copies can beco=
me
> >> stale when khugepaged or MADV_DONTNEED (CONFIG_PT_RECLAIM) removes a P=
TE
> >> table concurrently.
> >>
> >> This pattern dates back to commit bd74fdaea146 ("mm: multi-gen LRU:
> >> support page table walks"). Likely, earlier locking masked the latent
> >> bug. Later changes exposed it: commit 1d65b771bc08 ("mm/khugepaged:
> >> retract_page_tables() without mmap or vma lock") allowed concurrent
> >> retraction, and commit cf4a65539c13 ("memcg-v1: no need for memcg lock=
ing
> >> for MGLRU") dropped the walker's outer RCU protection.
> >>
> >> The fix is simple, so just fix the original commit so we don't have to
> >> speculate. To fix it, pass the actual PMD/PUD pointers. This restores =
the
> >> RCU-protected lookup and validation against the live PMD. Note that th=
e PUD
> >> handling is required as well to handle folded page tables correctly in=
 all
> >> cases.
> >>
> >> Fix generated by an LLM and sent by Josef Bacik in private.
> >>
> >> Fixes: bd74fdaea146 ("mm: multi-gen LRU: support page table walks")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> >> [ david: handle walk_pud_range() as well, clarify+simplify description=
,
> >>          adjust Fixes: ]
> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >> ---
> >
> > God, terrible. And why does MGLRU feel it needs its own independent pag=
e
> > walking mechanism?...
>
> It's all a big mess. I think at LSF/MM there was some talk of using that =
also
> for traditional LRU, but I guess it might take a while ...

Right, there are reasons, MGLRU's page table walker uses a bloom
filter and have some zig-zag avoidance. It would be nice to fold that
into the generic walker eventually, but it=E2=80=99s not a high priority ri=
ght
now, but we=E2=80=99ll get there eventually. And using that for CLRU lacks
support for lazy promotion so I'm not very sure about that, but still
things are being unified bit by bit, so it will at least looks better
step by step. :)
