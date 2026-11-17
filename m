Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915582;
	b=cxFzJx26xLlQvZue8QiLBUBZEGkPJtAlpZPNDWhp2X8UYfkrIOIZFeRp69XvZEC7XG+5
	 wtp36oyi0ZUJZhSgXUEaoGllZ9Auc42ucHKBTsGEova2usfwqJ1+4bzY+tVanSacFXKMA
	 h0f+Je8LXGcI8hWte9IJEAwB04DkfujYmFQPYLQw05rG8M+3F+YwMDlr1yOgNwtmjMtql
	 77oWKg2s3PJvyFjpH+RknJ3Meyq5XzT8PG4KewzpJuQfL6dxhRRqSqXqFZs4T/J5elBOm
	 HNgwRotlMy07NHORdm8fB63Rea/dOY7dGqn058kTQevlqi6ENgOWKVlp29ac1V4uggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915582;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kTKfM3E0D9hYugyXbXLMpuiAOru2XWcId1jwWBVeBXg=;
	b=NgHyjnBl9L60e2ln/3e8+rj0U1RmxZ5a/Qr3h35GQpbjeEYiisYkxd7PoWS1QgI0HFzZ
	 xwWBVFeI62QjkiLhAh5lscrQg4MJfMugG75wm22akuZZRzJRRg7IhNwJ6lbsA/2dWkDPw
	 /6wGP9FQy4yhMt8dZuoCINj43FNSffHQ6cO9V4K9NJwWnLBaYqFK2kw/ANBTvHuQ57a1j
	 FlpZT3V0LuJr+fuSDBbbINVf9Wsnw7EqqNZJq/pmK6pWPSswS026vnbwxMdfh/eu6gPEy
	 kxUwpKoSnztsSWImdy3d3IIoKk0fXMZB/cpPobz7bK8Jgxp80lFi+3q4Z7Ec33YzUlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mz8kApnu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D20606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mz8kApnu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4CD1F000C4;
	Tue, 17 Nov 2026 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915581;
	bh=kTKfM3E0D9hYugyXbXLMpuiAOru2XWcId1jwWBVeBXg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Mz8kApnuvbwlXmwzwNzy/CPFYHpUl2A1cOq1pXVfAT/TSWONCPXb57x8+5A3SJ+5F
	 tgzd0ObNnMcSK8/WKYdKoSY01RbThRZEMvYLHCLedYr05t8cu1LJEM2tgixY+OBCH4
	 T9uJ5dfXSxdrJR+BBnZqV4oUuiTRDBqoC3oSnt+Xsi/QxOwdWhtlMC8EzEfvW3i79R
	 5nJLDe2x24cu4sonrrv3JzaTUDWIzlH59phyo5M94Iq+vtCSu1MnxXT0QKWdE1NN8u
	 fz9g6jZSJLGC7JLRmH3wVw18VSj4+uy3WHtWWIaP/xqBrv7Po8Pv/XacHQvAoUcNyb
	 2saaI0TjG1Wpg==
Message-ID: <b253465e-d0c6-45eb-9ae8-798ef9ced6bd@kernel.org>
Date: Tue, 17 Nov 2026 19:39:38 +0800
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
Subject: Re: [f2fs-dev] [PATCH v2 15/20] f2fs: support subpage blocks in
 atomic writes
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-16-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-16-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Writeback already writes dirty blocks to the COW inode per block. Make
> write_begin of atomic files reserve and read COW blocks per block as
> well, and remove the -EOPNOTSUPP checks. Skipping the read of the
> blocks that a write fully covers also applies to large folios when the
> block size equals PAGE_SIZE.
> 
> Aborting atomic writes drops the page cache and restores i_size without
> i_gc_rwsem[WRITE] and invalidate_lock. With subpage blocks, a page fault
> in between can make a folio writable with only the blocks within the
> smaller i_size prepared, and a read can zero-fill the blocks beyond it
> and mark them uptodate, while they are inside the restored i_size. GC
> reads through the page cache as well once FI_ATOMIC_FILE is cleared, and
> then moves the zeroes. Hold both locks across it as
> f2fs_ioc_start_atomic_write() does, except at eviction, where no one
> else uses the inode.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
