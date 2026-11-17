Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913504;
	b=sRv/+xs+AuFlI9i23Bw3bo9CRLBn3liya5dKnf3SN/YdKn2MQ/WrIsy/obEg0B1+8PCp
	 waZF+UqfqTl8egyKmZQcUypgbhAMyBrGWCIdE6nevodx41xG3UlxRj9jioVbeoD1t9Qdf
	 XKWD4m0qZZP2r3hyvOq083BMdDFM3vTTSBNHMWL84Q6b8FB4+5D1kasol5teAUqtqLtNr
	 c4Pwmadj1KtoGGGQp8KiWDLcn/1mKbbFB/EA15iMkq84JMbnXlWOQ4SpFgXVFt3XYozbu
	 LpkgTcoFPd2zmYULhZWk4Cn52g06aiUqc4auwiB+4WMM9jp9dBVqWmTtpc8IP6uIpvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913504;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0aeLPSDDDFeW1BLMOTbObFuLTDcOldTAMyOYwl0JEB8=;
	b=H8bvU/E7wlqZ4LiNQum+H9Tz6pliyJjaeJMNcZouLS8k5Dt0rSrs+/uh/AO8Ntuqiv1Q
	 4ztzmWL8NPd440CZAGKrMZt9gVhL9juAFMlqhPaEEoIFqPfH7X4+TW0kRRdg2K9VhcdwV
	 WGoD9wPKbQv/QPQzLJrQ43yj0jJKa5o7RHesJHLvQNMvfpsGwtWtfaA4VfpwOeyHoizAR
	 2N5g1svE0aWi7zAAq3VRdqbdi0S+Rl+GR6o9szFBQtw24ampCKHAGA9gt4F7TO1uE2lur
	 +soJdsGpGuuApdjzcKMawuYZO56CyyKPR96O6tpk5Cw/9SGTUNPZDxLIrkn9g7ntZbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFzUemGl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF08606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFzUemGl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADC51F000C4;
	Tue, 17 Nov 2026 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913503;
	bh=0aeLPSDDDFeW1BLMOTbObFuLTDcOldTAMyOYwl0JEB8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=oFzUemGlpJZqX5lszMojpcUV/qvVrTIYEwiEaGIbfRxml3yFEy5bygJ+dfbJU/cct
	 SgDwRQNfpiPChQ3dwpZyOrfRQZeKPq78FFMWrqN6DsFZZ4ocwX68GkcOOeB/24s+fn
	 EwY6DtUSkAXBkk47b9VqEelBaWVqiPmwseJCS3ejqePFUN7VnerhKNLILGiI5gAzzL
	 gQzCqbXU4JFpA7S1ZiwZ67hIHuxD6gFgofEI9Kpwu7EWuvyKg7ltBpqz8iNfd5tE0q
	 p5hLa3jO/Cma4sTl90Kl9k640UhHcCCtMgVXSg3BnmsZOL4aMs+NwjaG1g9bKzXUdh
	 3CMs2rABRHTpg==
Message-ID: <aefcfd01-62b1-4e03-b1eb-bc46cd4b54fb@kernel.org>
Date: Tue, 17 Nov 2026 19:05:01 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 08/20] f2fs: adapt range operations and mmap
 for subpage blocks
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-9-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-9-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> - A writable PTE covers the whole folio, so page_mkwrite prepares
>   every block of the folio up to EOF and dirties only those blocks. It
>   reserves them only where it may allocate, i.e. not for a pinned file
>   or a compressed cluster.
> - Align zero range, punch hole, preallocation and truncation to the
>   block size instead of PAGE_SIZE. When i_size grows, write-protect the
>   folio straddling the old EOF so that stores to its new blocks fault
>   into page_mkwrite.
> - Update i_size of an extending direct write in ->end_io(), before
>   iomap invalidates the page cache of the written range, as ext4 does.
>   Otherwise, a read in between zero-fills the blocks beyond the old
>   i_size in the folio straddling it and marks them uptodate, which hides
>   the data just written.
> - Unmap every base page overlapping a punched or zeroed range, and
>   truncate the page cache without truncate_pagecache_range(), whose
>   unmap underflows for a range ending in the first page.
> - For SEEK_DATA, treat a NEW_ADDR block as data only if the block
>   itself is dirty.
> - When truncation zeroes the tail of a page, mark only the block
>   holding the new EOF dirty, not the blocks after it.
> 
> The SEEK_DATA change also applies to large folios when the block size
> equals PAGE_SIZE. The direct write change applies to any block size, so
> i_size is also updated before the sync of an O_DSYNC direct write.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
