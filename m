Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912221;
	b=t7j9FbbtpwLQySbid05FmcxiK8MrSRjHBH6UAVv9pitPwi8p1dPtBNCuDbhJidJr4FBx
	 +CT5JVFfEy0kQomDTdMDef/RB4ttZEErrZ/0l0E3wq8iTemKv+RfK3bCW5AinQ95byLCd
	 zLAs9qKtd0cigv+IoOAbbhUCnq7HKy7aEWfZtl4Sgq9lcsOFt1Oadc45hNfy9lKgD+GDB
	 CfL9F6abTt61G+OuKs5/0lbv+kzInZrjkBYWYCpaeVQVI9xhepMsNSMRjkmkanhDqSvyg
	 kVyK22hw6ixHZPvzNxeLui/2YyZFFVnkFXdYd97yxaxqHUezHoHHyuqc+/8NT6LhflA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912221;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oya8J1CPElef6oZeFlm2b0Uh/NkwyFXzThuDchjvEIY=;
	b=oOO9aGwuhwiIPH6sPHQVMqQgB/+1sUoVqBdlyJt0STeau38OxzKq+mcfEleanTD3sc9w
	 9wsQHIkNtICJ7VFoIdzrUveMaOdSAZw1eRtWia6hx3eiawKiAKsW5NNtI2CcjaZaX7Wei
	 YbtibTowjy4b2VoJXLPDRZgqKlk+q82ycpRy14Q1m5Id+/Qz2xWHecUGAkc32+29Ywa+o
	 AQWINOjekAYvwqdS28FIox9q7eSNG9TIwATc0gh6YnyW65kUs2qY4/0IhDtj9rNFXnLZD
	 JHbuqwX6oFoPwlcxOtD/BET5DlmbjWwxXuomKeMHpYo4qjnaG+Lt9ofK4W1eWcXoHnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CH6YGOtG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28608606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CH6YGOtG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECC11F000C5;
	Tue, 17 Nov 2026 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794912220;
	bh=oya8J1CPElef6oZeFlm2b0Uh/NkwyFXzThuDchjvEIY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=CH6YGOtGI5PPL+fkA3FlQdXSmGq9++wtuZWDQdPqqimFHBPd++Ux03OgqN5vEmvWY
	 8dfYmRZuWyU7qtcv4OKNi6B4RulSluSJvXH+gZTzL0Cw1ju968YWL24aoedD0KNoRj
	 fGWb6Y4jJpHt6r9KLrCGsKUBNCftWhM2u5iCdaW+s0ttoN+oyKbMElzywjPXM7ApG4
	 xGcOkur1KQQ5vNzaIqaVGkad0rm+n8rfcTXWS2v78VNmZTYxyyw/c02QBWVy7urqt2
	 FWOeW6jvlyW/pLk9UB//ld3OfyVl0hBapBtE0jhhYdMrf1rLf+ZDqTYMoM9XtCPhsR
	 JK6IA7swwYzwA==
Message-ID: <6733d2b6-e41c-4f9e-9ccd-80a704c5307a@kernel.org>
Date: Tue, 17 Nov 2026 18:43:38 +0800
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
Subject: Re: [f2fs-dev] [PATCH v2 07/20] f2fs: support subpage blocks in data
 write path and writeback
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-8-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-8-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> With blocks smaller than PAGE_SIZE, a folio holds several blocks, so
> write_begin, write_end and writeback have to handle individual blocks
> instead of the whole folio.
> 
> - Read, zero and reserve the blocks touched by a write per block in
>   write_begin, and mark only the written blocks dirty in write_end.
> - Write back only the dirty blocks of a multi-block folio and complete
>   write I/O per block. In subpage mode every inode is written back by
>   f2fs_write_cache_folios(), which now handles dentry and quota folios
>   and checkpoint errors as f2fs_write_single_data_page() does. Both use
>   the new f2fs_cp_controlled_inode() and f2fs_wb_folio_action() helpers
>   for these rules.
>   It also resets the error for each folio, so that the remaining folios
>   are still written back after an error, as writeback_iter() expects
>   for integrity writeback, instead of redirtying them.
>   f2fs_write_folio_dirty_range() cleans up each block where it is
>   written or skipped, and advances last_disk_size only up to the last
>   block it submitted. On an error, it clears the dirty state of the
>   blocks before the failed one, so that only the failed block and the
>   ones after it are written again.
> - Count inode dirty blocks from the dirty bits of the folio state, and
>   count every block of a folio dirtied without one, e.g. after a read
>   of the whole folio or through folio_mark_dirty(). Attaching a folio
>   state to a dirty folio converts its count to the dirty bits, so the
>   counter stays balanced.
> - ->dirty_folio() does not know which blocks were modified, so it marks
>   the uptodate blocks of the folio within EOF dirty. Otherwise, a folio
>   dirtied by mm after writeback cleared its dirty bits, e.g. through a
>   pinned page, is cleaned without being written. The updates made by
>   f2fs mark only the blocks they modify and dirty the folio with
>   f2fs_folio_mark_dirty(), which keeps the other blocks clean.
> - Compressed and atomic files are not supported yet in subpage mode:
>   write_begin returns -EOPNOTSUPP for them. Inline data is converted
>   first.
> 
> Some of these changes also apply to large folios when the block size
> equals PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
