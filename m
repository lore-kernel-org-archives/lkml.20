Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECCC37F726
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142461; cv=none; b=cjC7zUpgbxbpJog00RqYaS4t5BDUpwVcdUG1nwOvfRKuGuuRvGe1wPtrrdGjx4QEDhLCDlvr/33BxHcGCNAlkO1NdIflf8bGRjm/tZPUH+cmviAH43ZEOeSLqS0PkDC6Fx9aFzZ3JkIHBnDcjk4OrXtIlNNcGeBVtonizbMOzpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142461; c=relaxed/simple;
	bh=LfZUCcHckxwBJGbXWgZ4XVVNUFEQGrpJOjc9kpc6S74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+jl+vHiNjlXhkeAI7+j/jOGldX7DgyxXTnC7LcX21mrKRNlJbSbQ/6wBO93JMqi4CwafYnWnNezOPbo/eqSoILI+JbyQtXbnAGsF/Mc2PzvTp5KWLzKd62DcPvQJFGpG4I1dSKuSOhCyPWhJVh53B0NLsQKhTBvLw6Fs8zCZc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K+0/BO9e; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K+0/BO9e"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60E21A25;
	Tue, 22 Sep 2026 22:47:34 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F6F93F86F;
	Tue, 22 Sep 2026 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790142458; bh=LfZUCcHckxwBJGbXWgZ4XVVNUFEQGrpJOjc9kpc6S74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+0/BO9eHcs0DtUDS329tW9XVTJxbIwhHYUt8ybGAQtlN9shZxIup/w6+bQ1hYTwL
	 Zv5NnrL68/vFEp533lZgzZZwe63LJx5LID+7GX5UxdHI3EgQBf0WZMIvybeQPRisVh
	 +qK1VQ3VrJfrmL3B46G7ikIh47D6qvgotmhH9+/I=
Date: Wed, 23 Sep 2026 11:17:34 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kaitao Cheng <kaitao.cheng@linux.dev>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH] mm: Add CONFIG_SPARSEMEM_CLASSIC
Message-ID: <e3neqdb2bym2kq5prnpz7og3lcnbtzg3o4ya22v77t35s3u5jx@tmmx35jhc46k>
References: <20260920070406.95354-1-kaitao.cheng@linux.dev>
 <0baf8c5f-1327-4cb1-867c-e0b08085b9d3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0baf8c5f-1327-4cb1-867c-e0b08085b9d3@kernel.org>

On Mon, Sep 21, 2026 at 12:34:48PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 09:04, Kaitao Cheng wrote:
> > From: Kaitao Cheng <chengkaitao@kylinos.cn>
> > 
> > Several MM paths identify classic sparse memory by testing
> > CONFIG_SPARSEMEM while also testing that CONFIG_SPARSEMEM_VMEMMAP is
> > disabled. Repeating the compound condition obscures the memory model being
> > selected and requires the local SECTION_IN_PAGE_FLAGS alias for the same
> > state.
> > 
> > Add CONFIG_SPARSEMEM_CLASSIC as a hidden derived option and use it at the
> > conditional sites. Remove SECTION_IN_PAGE_FLAGS and test the new option
> > directly.
> 
> Sorry, but reading CONFIG_SPARSEMEM_CLASSIC I would have no idea how it relates
> to VMEMMAP.
> 
> CONFIG_SPARSEMEM && !CONFIG_SPARSEMEM_VMEMMAP
> 
> is pretty clear in comparison.

Probably there could be an argument to clearly differentiate base and vmemmmap
sparsemem mechanisms, but the proposed patch here does not make it any better.

> 
> -- 
> Cheers,
> 
> David
