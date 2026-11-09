Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213330;
	b=T/ToozjM7jQvQNqWqq0kaBzz+QGYZkf6zpVc9t4/xCJGU79VrjcBN5Wreg4K4u+5lr+z
	 nbOyo6IrCEsm2tRCiEZf+RR3XCLgp4/h4NQK/JGOPKkpZiS1pH9QtBdW2/5oOrtoBaRH9
	 K54dOawJjKnzd/84hwMHoOE6shj09BVbbMbui8xnAMBS1AHATo8S/NzxAt9Nsu9UNSgli
	 DEX6zvrMH6Wr/09dGu2xtsb7QwYAkV9toXD2GVwCh9Yfr6tRw55IphZ0kNI/nAPsD7bRk
	 glihydLRk8wIHHlf6hcjc7OiXd6yq58LS4Xezc0JYuFriDyS+DeoS0fTwb94JsPni9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6v/EUAzIuUZtunuZ0TzsEXeSSrt8us4QeYlPDnXiIyE=;
	b=CoCp+MGmT0nZKf3x1XMajI3LRHnwsFRv6z6w10nUiFgoAK5udlKzVgQql4ICeLhUU4Sj
	 pMc0tlq8GrDYwt3B4bM8wkOgPZjkEYNBevOqdzK0CbJlBO9vpbihf90dse2HMdOwp8oyW
	 N2hLY7A5EJ+Rfs0PYS1lqskMsktsKRtaymuXEsN6I++PkQeeCtZ84oqxHGCB46tv0HGWK
	 axA7v8JZGmxsF6QEwA1H5yjS/qU+MI08vPvHLXwZL7SeyLSnhxVOF+KByxnaYzIb9AckP
	 bHKMoKDHG2Y2hCdeqvGTqYDCcSUZAsTi+wAobjNo1+2n1QwGOUfsvCUzsHtDJQ9+/Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmd1vfA7;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101AB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101AB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmd1vfA7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so6475085e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794213328; x=1794818128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6v/EUAzIuUZtunuZ0TzsEXeSSrt8us4QeYlPDnXiIyE=;
        b=kmd1vfA7HwVdKlIlNMcEdgSvfMccQHxtsBaQ5wrlPJ2pETJCu/dB5avuxdOeVXJbBi
         KOyzf4oZ3H5dRwTfXxv5zF2iW+FgAxXtoL6vUAonyK9hiz4/gOsvk3QAg1rxIyH4OaDU
         5lVlTkXusCDeJ+5UZeQ0nSIlh7ca0tSHggdztmbjQYOlZ3cyydUW29Af4wLsYFNoSj7l
         Uxe49m7b5cT9hGql+cIpNRaBHqcFlYVq5WdXa1NK+FbgspW6vo3pbYAJRtHgpDx8Tp0K
         4xviTwp0YHAbFBBwYfvbPfMiKK5Pj8dPPA6arIrC4UUfVfMyjMGyOJiMz6TDbfz4O4pa
         AqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213328; x=1794818128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6v/EUAzIuUZtunuZ0TzsEXeSSrt8us4QeYlPDnXiIyE=;
        b=b7l6f+9Sdb5r8xjAPps9Bpw4Hd3AQYo8/Co+IJ56OE+Mm7nujA2ru8+wh6gl+HHeXT
         7oAOlen3uB0wf6hPEw7x7QwLJz7tFOCu+nH3BVTd0p196v7ie1kMyjv9lDefkaUyI9fP
         W2WnPkKH1FAkzPtwuo//pG/xAeP8VSahbtEMfxs6KPHbuTN6xXwnZ5vwnDBxKdzI8VT+
         ZdVdn/UEQ+ESsmcd4iz7sm0VUFt0ITWffSoc5FdnasblN6C+KwZwR962S7fAGETLGaDu
         jA87xm9r+zGPaaNKgzenXfhwjzXcRRSvF69MvXCNb/BdLOuJuXOhDtk/OQIYDL79oxPe
         mKIw==
X-Forwarded-Encrypted: i=1; AL+hErGhg6MCLRxMi6OwwHWWRVLyGsYUA2rTpUQ3mFzwVRpM7fw6RxrvczxRCuOqnd4HVRjgdu7FzBD3hkLMuZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MK3uL323Kw2S5Flv29buNBE/JJoyGBnvOogpxLyWku9AJI2SQ
	5D1wvt6PVfNT+E7N5SmuD9TwoOTSfJAprqSFMy39puW34Hjh8S2Y5OG4
X-Gm-Gg: AYBFou3voKzhI6wsZql7g0h/2Sigw/pHEgsOnUTlbRCj/hOqlm7AIM0lYAppC+eubMQ
	Ig1ga27/qyYrXN4mBYIKa5Bq0P0AuKM3FLtqknf5up3EBXLMnCBa9UFE4kq4scAMiBwYmQkwCcU
	4oRT5fPyXYtBq2nXUGe352EYc4BLZt21MolK3CVdmw0SLglyjEqrYErN13OXlDUWCDNjd12YWDx
	mXi97uGYeOV3odjgLk11iwnrgFiFwDvK/7o3m2/7MQXc6hlJ0IHYQ2fzkN2giFO98yI1frQjEVF
	B5i7TvOvG+EcPn8C8oa+nqgdg9Vh+H74FZkdHMbxI2LzYeqPambykRj+EwgJvRW1+/sxDesL4H0
	C3QMrGSPyJCU5bH3DTRq7dkuxrBTn8jfQdchim1z2KnPWegfwJpYpIT0X7pBf6o5/lgBapjuwoJ
	wb1ldiAia0eXGAmG3e6an+dwDFc20TJTGn7yuvQP2NP5PaLW+rGJ3MlmR4GAOrNhgm7WZ1AUTWw
	/R0xQLZfy9kQ9Yr3kGaY6u0RU2Ms6qrwukS3uWLavBid78Hr+3bUj9uNrHiJVOjmxkaaPO8LfMU
	GHCp513pZPf7uXEplx65+pcWiIiDC5h+ONBhLdbsJRJ8
X-Received: by 2002:a05:600c:37c3:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4b963c87b5cmr58185485e9.16.1794213328165;
        Mon, 09 Nov 2026 00:35:28 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1ddc7sm170118285e9.4.2026.11.09.00.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:35:27 -0800 (PST)
Message-ID: <4bae9936-02ca-480f-b754-c7048702c667@gmail.com>
Date: Mon, 9 Nov 2026 09:35:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] mm: limit pagecache folio refcount when mapping
 pages
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Steve Sistare <steven.sistare@oracle.com>, John Hubbard
 <jhubbard@nvidia.com>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev,
 Chris Mason <mason@kernel.org>, stable@vger.kernel.org
References: <20261107-refcount_overflow_stable-v2-0-c38f6809b106@kernel.org>
 <20261107-refcount_overflow_stable-v2-1-c38f6809b106@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261107-refcount_overflow_stable-v2-1-c38f6809b106@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/26 11:23 PM, David Hildenbrand (Arm) wrote:
> With large file folios, overflowing the folio mapcount and refcount
> became possible. For anon folios it is currently not really an issue:
> each large anon folio can only be mapped once into a process; on 4k
> kernels it would be more processes than usually allowed on a system, and
> on 16k or 64k kernels the processes alone would consume hundreds of GiB.
> Something to be sorted out at some point, but it's not as urgent.
> 
> Being able to overflow the refcount is not really big news, but it's about
> time that we do something about it because some modern technology might
> find ways to abuse it :)
> 
> One of the enablers for that was commit ddc58f27f9ee ("mm: drop tail page
> refcounting"), however, file thp support was added later.
> 
> File folios can be mapped multiple times into the same process, allowing
> for processes to hold many references to the same folio.
> 
> As a short-term solution, let's introduce two folio refcount limits:
> one for ordinary consumers and one for admins. Leave some headroom
> before the refcount goes negative, which we really don't want (having
> the mapcount go negative is also not expected).
> 
> Start reporting SIGBUS if we run into limits. When restoring mappings
> from migration entries, instead zap the pte/pmd entry. We allow for
> slightly exceeding the limit to keep things simpler.
> 
> During fork(), prefer not copying page table entries over failing fork.
> Export __folio_ref_count_over_limit() right away as that will be needed
> from fuse code next. Use has_capability_noaudit(current, CAP_SYS_RESOURCE),
> so filesystem credential overrides do not affect access to the admin
> reserve, and to not generate auditing messages simply because we access
> optional reserves.
> 
> This is far from ideal, but better than all easy alternatives we can
> backport comfortably. For now it fixes the big problem: letting
> the refcount (+mapcount) go negative and cause trouble.
> 
> This is only a temporary fix, we'll follow up with something better.
> 
> Check order 0 folios as well for consistency: each
> folio_add_file_rmap*() and folio_dup_file_rmap*() needs a prior check.
> 
> Also, just document -EHWPOISON for copy_present_ptes() while at it.
> 
> Note: When zapping file migration entries, uffd-wp is preserved using PTE
> markers, but uffd-rwp protection is lost because there is no corresponding
> marker. try_to_unmap() already has the same problem when unmapping file
> folios, so we'll happily ignore it.
> 
> Note2: For now we don't let migration or PTE table collapse exceed any
> limits. Admins can always refault, and if we are already operating in
> admin reserves, something is already off.
> 
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM.

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
