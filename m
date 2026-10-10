Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127A43B4A2
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626304; cv=none; b=WhOGVLB9CrU20upIupIWPazu7JLWzCztLDeyp5VAre5ZtVjmvNxJ+hQKzZu8Pxi81TM/zIoG0BzyKsRcqHBzZXxSXElnVD5rftSlsYchvNPb96B8UEyXoB9Jrsyzw0Jq321xGpdlmhdr7wvHPxXlom+a61HpuXTK/a/iUIksSPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626304; c=relaxed/simple;
	bh=OAbnJDh7fe4r+/UrLn79AbfXGFed72PIpNORup6M8os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hq6q6VYqgcMlGuK2gIOWSCOe+ZMM5VkexSqyBfpssYECtYrNKlbPjODOFUA4twbs3kVCmJvdMkcDX0sT9aFXOZVlnVAKpkcvrWekEOf56oMsapZKByPmpSQ6hfjc5EdTOyt0FEqDmBxPLftlWChvYp2hhH/U8FSdmI8nbmhdxcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoWXNSPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoWXNSPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC8E1F000FF;
	Sat, 10 Oct 2026 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791626303;
	bh=QvnkvLtda/rMoARtnwYn7sNzYphFVMCDdG5HrVdsEsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OoWXNSPmC7aomO/qL5FrCOYGUk0MjGnEvvS67qACxOjUNH3ibjhLX9Nq8BunMAM6c
	 IpWgnn8nCsJZgc1iisSfTDUBg+w2Er0od02JE3A3L0EAIEX54dJ8fuA5zs8T6HZ4eP
	 5dDZGQ2UUR//Gvmrw/NEj+hNEqrz8bZF9GcWzdi1RTYvMCKvfcIfs+FqsVfpvQOCNL
	 NtHwWMNR/aZ5rvbXyDlyzO11KP1B4lLEJjdzgGk0AULtyAL3vCw/DNt8WqIifzhadY
	 jkBh+EOgJKQnOp6G2LdCynMkuT/rfkdntoC8zzVFbIIz3hLEWCfz/BLBfnPsPNmytU
	 uo+NxkfMgn4FQ==
Date: Sat, 10 Oct 2026 11:58:15 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 6/6] mm/mm_init: add zone mismatch warning during page
 init
Message-ID: <asoMN5F-3qvaW5w0@kernel.org>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
 <20261010075755.83339-7-songmuchun@bytedance.com>
 <434B0573-BF18-4413-9BDF-C5873CC13206@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <434B0573-BF18-4413-9BDF-C5873CC13206@linux.dev>

On Sat, Oct 10, 2026 at 05:32:59PM +0800, Muchun Song wrote:
> 
> 
> > On Oct 10, 2026, at 15:57, Muchun Song <songmuchun@bytedance.com> wrote:
> > 
> > For vmemmap-optimized sections, tail struct pages may be backed by
> > shared vmemmap pages. Those shared pages must carry the same page zone
> > ID as the struct pages initialized for the section.
> > 
> > Warn in __init_single_page() if the shared tail page has a different
> > page_zone_id(), which would indicate inconsistent initialization.
> 
> Please ignore Sashiko's report [1], both are false positive. It didn't
> realize that shared vmemmap pages are initialized early before __init_single_page().

I didn't realize it too when I read this first :)
 
How about a short comment above vmemmap_optimization_verify_zone()?

> [1] https://sashiko.dev/#/patchset/20261010075755.83339-1-songmuchun%40bytedance.com?part=6
> 
> Thanks.

-- 
Sincerely yours,
Mike.
