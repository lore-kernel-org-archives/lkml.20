Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549EF3B1034
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788103396; cv=none; b=W7RsvZ7odsYH2hEfAAiMdpPQX5IOHmOOQ7TNwHsXbEHHpUuDaVo1S4bkLhWojAcpEQAzLdE8ieYdJ8MQ7geWZ9RLRYTcd3mk9Zvrs61o17uWKNnJdgnAgG9RyVdb9TwcplzCRSyyHS6/Gg5BuSwYdQiEYk4zLzozLZ5HNB90Fvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788103396; c=relaxed/simple;
	bh=fR5ijYKXUf3WRWtDreYEbCVDynbL1apeRIsE+A786ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THRQ+BfjaW0s8kkDYDehEum3pTzEtq0hVPNA1xYCaKTHFILKPx7ClrmEEd4QSDzyL6tDM+3Gu5raHa35y42s+1tUYbkZSmx8zidJwLXzKmp6+VvTAGdPejeXzRDe7MwORwCFaWzslyNUQopAoNE4cz76tA/IhRORlIJbNISPJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYhwLzLn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYhwLzLn"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6d28aa26cso18188215ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788103394; x=1788708194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSSNdx4wCVGEy9NUCcpQnulEBBrI8D0cxb20fm37FAk=;
        b=pYhwLzLnPrtkeyb86mKqOpERqbJTXLLb5CkCo3Gz47pZBeooQM1joqTDHsww8bwYiq
         vefrcceEwmDcW6RlC/hvb8vHH/pnPv8Z5ALy4ZhEv5aLzxai3PHGrhGfSbNx+z7On8Bx
         O5gANKFtH2kKYJI6ZeLqQyNMCwn9ucVLyE26K8/8cfHidm5TDgnrLZ7bXcFs9IZOOrxz
         V+VmnhnNhMrFINhapckY8wobE1di9fvTHO8hZxskqBwxKnn7AtV2s/U2FhLRwlJiHPfD
         tRE4U5/eIePJpTOWyb3fYfds6KdmGfEFOKIPBG3FtQlBzJwOmma6pHxzF/CeeLts+IGp
         FIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788103394; x=1788708194;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSSNdx4wCVGEy9NUCcpQnulEBBrI8D0cxb20fm37FAk=;
        b=NEFbyCTn8RaZRkAiPJEjizSVV1e3Cs5eN7B12f8mOhXwLpB9MAnEYSK4iJqqI9L/+3
         YwO9ZIr7dzNnWHmRohNKVmUHSksxCwFzBT9Bt4PP9l+nwH+XPak8RuGYgRQby+ngFnRN
         joubs8rR7rLW6wYccjsVEVzylKZCD/iv0nkBI1seCkSjBep4qSAbe1rKo04iiZv9bjLP
         zBaHJWZEx4yDyb8ob2zDqMRha6i+C64+8HxgEqpZk/R7ho+N0j70hlURI7mh68joWAH2
         MdxscMTkhy1BaJ55bFx1XMbY8tvfVw0WhDpyVeF2lcIKtBRvZTj5yqdJk5toicR+Ipld
         M3hg==
X-Forwarded-Encrypted: i=1; AKwUvByww02LVhWzHqTxaL919AWV/tK4yntdRIDjWKXsPyoLy14bNwTn7JEmIEAZOrdD58zchw05eGo1uYyfa+w=@vger.kernel.org
X-Gm-Message-State: AFuF++kFGXIjFqnJ0IxVkjDhcNQBi0fwZC4j8FST72uyX2LaZm+uZ8hh
	lexdkN70yi0/r/6lcURHWEJtXF4ls4Aq97EFGVSK11Ac095m33PtsN4w
X-Gm-Gg: AR+sD13vBx7aDiv09w9b08k9AbFjJcrQmn3Xj4A4Mp9/RNxUWb7+KbLW4/DV6hIo4kc
	g2gcWf+RPLmavELHHqMdmHtK9fBILsTQjNvn6P8ZLlE5AgYFUUSd6gFFI+/9JUMHadQeb5lUOnJ
	PWTkE86TXA3KT8QMw6Mk0GW6y+4GnP0hg4urVQpYk1tKJs0fA2KhKW1oeFVRTylMZLF5fE5wHBV
	Lz6qnErpDe6COyrtQ1spTTPPUyNEwwXpzGucupsTU/q2xb2xfEgg1fVbRCUOs1Z2wJfrrTGPr0t
	rdRFFFt8p/2sy1cvM3puTbS8xRVnPRFbl35Kq6lxs/S/QdzLBCF2DBZ1yFwEnra3+YQ5mtzrAFB
	Tpfy1KZjbmmyyeO0uXWVyvsvQ+1Rm2JH1H1z7f0m49Gm2P5rSg09NWRPBNNp7Q/8p/eM9J8VOqp
	StGQxCuv+mTD66YyVS0m/gqPA+fY1uaHnmFLYIMfOjFnxzi0gHWZhk8Lw26vBqW82gyMEaI5VmZ
	8oYzSFjqzgcf/5GKmCpuu9P
X-Received: by 2002:a17:902:ccd2:b0:2d8:d4d9:ce3b with SMTP id d9443c01a7336-2d8d4d9cf90mr167753515ad.22.1788103394485;
        Sun, 30 Aug 2026 08:23:14 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8dad3ddeesm17231775ad.61.2026.08.30.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 08:23:13 -0700 (PDT)
Date: Sun, 30 Aug 2026 23:23:03 +0800
From: Kairui Song <ryncsn@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: kasong@tencent.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>
Subject: Re: [PATCH v3 09/18] mm/huge_memory: move anon_vma and filemap
 management into split helpers
Message-ID: <apRHC9Hk9Ve1gO0o@KASONG-MC4>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-9-9b43f5163238@tencent.com>
 <acdfa561-0690-4c78-bc50-92d308f4dca0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acdfa561-0690-4c78-bc50-92d308f4dca0@kernel.org>

On Thu, Aug 27, 2026 at 06:36:18PM +0800, David Hildenbrand (Arm) wrote:
> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> > 
> > Only anon split needs vma info, and only file split needs the filemap
> > handling. Move the related code into separate helpers so they are
> > genuinely more self-contained.
> 
> This patch seems to do more than that, like relocating the
> folio_expected_ref_count check (and duplicating it, which is not so nice).

We can keep it where it is right now, but this patch is moving the
anon_vma_lock_write and i_mmap_lock_read into the two anon / file
helpers seperately, so keeping the folio_expected_ref_count check
outside and before the helper call will cause a potential higher
false positive / negative rate of this check? Leads to unnecessary
call to unmap_folio.

How about moving the folio_expected_ref_count check into
unmap_folio since the purpose of the ref check is to avoid
unnecessary unmap? No more duplication that way.
