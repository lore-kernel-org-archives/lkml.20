Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE91486E71
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885025; cv=none; b=D/TqLO+89Guf5+cpyo1unT8/ykQQ392tHdWo5CVTnTzqRrcNwDVpKj17DrPXih9Ql4Im1juEF2MACRg+V/8/6vIOP/XWZiJmqguAXi6sAhMSen/u2CErchNmY35/swiIyG/kbVv6Fyl2clcAlxu+kqQDo+GlJnScU2CVIA7QZ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885025; c=relaxed/simple;
	bh=6uSuRsr67H5R+4bXXJ7KtrqxoiPpVpq1MSu+LvqvEEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XJ+LoVzBIlP7sAHh3B4BRibYb9Qlp4wEZ9qYiDZNwDDqACuANaGGWVZLq13ltJGex7fMZtinrUJbJvt8LEPeapAjFbQwonqVFbwRRnAN0N+P1vuWPZN+NbmjascxFSVU+7yjaPjH7FRroNhgpE+HBrmWCVonOzJBc+cr77T+cVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmJPBX7E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmJPBX7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B311F000FF;
	Tue, 13 Oct 2026 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885024;
	bh=2L34z+bOs84sZoHi9G7zWfo0PJtuhsn1e2vgvgH0gTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HmJPBX7EJ06gfSIk/CPzPyZoB06dosq4VlKJU+T82QwD/Ema0z9e7cWcjFxJ7m4Ca
	 pxERnuW6IM+dTBeI/b8GAhY5K+O+CL0P/NUynQSIlLgDFUacZQ+OTt0FZoTpFOa3on
	 Pva+I8hRzTMMXj7wF04jZwIOOK+HYCig1O2JUeJ36SItVZ9txaZWI/wWh3QhKgyv4L
	 pBhLWlZecUxnTD10zjL9UTxq6U8GfhmLpzEMlzyVKB7E0ZxQ0My+AC3W+GUd9uGNAC
	 J5x1O4lU+1ThKoH+XBmOBoLmZiJJwHWv+O6eYsl3rJywvywi15+BgUqH/w9U2IoQdG
	 PfjT0qyiyfbjg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
 Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Priyanshu Kumar <priyanshukumarpu@gmail.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260919135327.74089-1-kaitao.cheng@linux.dev>
References: <20260919135327.74089-1-kaitao.cheng@linux.dev>
Subject: Re: [PATCH v2 0/3] memblock: Remove unused exact nid allocation
 API
Message-Id: <179188501773.4183299.8247277870365097333.b4-ty@b4>
Date: Tue, 13 Oct 2026 12:50:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.1-dev

On Sat, 19 Sep 2026 21:53:24 +0800, Kaitao Cheng wrote:
> memblock: Remove unused exact nid allocation API
> 
> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
> mechanism") removed the only memmap_alloc() caller that requested an
> allocation from an exact NUMA node. All remaining callers allow fallback
> to other nodes, leaving the exact_nid argument unused.
> 
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/3] mm: Remove unused exact_nid parameter from memmap_alloc()
      commit: 063b5e8bbd216c27e885f45e29e23d053aa565fc
[2/3] memblock tests: Move exact nid tests to memblock_alloc_range_nid()
      commit: fba3e86fb848f79c4573243affcd7d79d378958d
[3/3] memblock: Remove unused memblock_alloc_exact_nid_raw()
      commit: ea27be9f7ce90a05e779d20b60969ce2a9834f77

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: for-next

--
Sincerely yours,
Mike.


