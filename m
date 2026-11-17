Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905653;
	b=DU/9H9VkUED0FIid0KBn7s8eNA/UilrFNo7NXIyODl+6Ow9ehY9agzL4qbE0YVb1JQMn
	 s8YJmbwbYhuPcJN5mGeK7o+5aSXVEBn6bH2qY7MGzbZUWbuSKtNtL/E6/7p/EWb9QEfpn
	 bIJp6Sr697SL4Decb0bXfURMjfSEJ/3VQKeYGFcHzg3VdDuVMVyvY0vyEgHkoB9W+DxgR
	 hetfWSi3jBuzpSTg7jXhvOAI9QQ6QPOhpM0L8Q++/lOztjYDIcwV0/UUfTNU42vb5KKg0
	 VULtIy6kAK/92BbQQsOf4MmPRnwSFp2aiehMQxEgh6rpBxoPi5D+TU1yaSjB4eVjAPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905653;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xoqdIKT6S9pjGgEJNeSle+HgG7N60MAqw5HxEVi8hEA=;
	b=W5DGjBG6xSwxho1M8leqPrOI/PoOFazIp9xeaEeD++5jWMD9QbN/o4hqdMLcz469FQBs
	 bW7pI/E0R2dljX2ITbq7DXNENGx4iOXJLaE8xt8P0KD6LtL9LMfWlBXencc6P5QQJECIQ
	 E/9yWtRbWO0JaC+61sFZQX7mrz0pR53k75S+Do/7Qkn1SYKYXpEFvUImEKmy1J054lpU0
	 AE4xTLLqKPdSUDU36wYCr7fquUXLKNhFHUqCv5seX/g3PI4iH3X0c9dW6yr6f9GHERk8Y
	 6DEkNIV+CmMqtUf0tLJ5QRRW/xmHH3F+uBtPDiHhGtsvfA3GYEyRts/PKZCwYeFFZEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVtUkHUj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVtUkHUj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7347A1F000C4;
	Tue, 17 Nov 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905653;
	bh=xoqdIKT6S9pjGgEJNeSle+HgG7N60MAqw5HxEVi8hEA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=WVtUkHUjJATZ+7jGAR2WLUzlSvPn73Wjuqi5Q6tbS9Iyd6Ve9rvve4QQMQjakEFck
	 ynGzRrLdPZ8Iuc/JqksHd1iwn7dsBedV1MBsGTRTCd4TwIi5s4lRYYi7Y0Hs/3IP+r
	 JWgoMV4qzphwA0LU4xgC3qML+XFAlF6Bpzz49PgiHxkvydghLj5YSTmxIM1UGubNHm
	 NDYtiQ6wvZ7kk2xKbbiU92mIuRyx5DqAFOZIM4Ye+HxOY9Z1BHjHL55oXL8zN/06Iw
	 RpFf0z5T/E2MhZzs0dufrE4W731t0V2/aUX3Eqle7wXCYnw58TeiY2AbeCiZY9NMTZ
	 25qzKVModbDcg==
Message-ID: <6300b592-1e44-406c-9696-af748d49b235@kernel.org>
Date: Tue, 17 Nov 2026 16:54:10 +0800
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
Subject: Re: [f2fs-dev] [PATCH v2 03/20] f2fs: extend f2fs_folio_state for
 subpage blocks
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-4-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-4-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> With subpage blocks, even an order-0 folio holds several blocks, so
> track uptodate and dirty state per block for any folio that holds more
> than one block, not only for large folios.
> 
> - Identify the folio state by a magic number. An order-0 folio can carry
>   one now, so folio_test_large() no longer tells it apart from the
>   context of a compressed page, which folio->private can also point to.
>   Carry the page private flags over when the state is attached.
> - Make the uptodate and dirty helpers take block indices, and attach the
>   state on demand in them. Some of their callers cannot return an error,
>   e.g. f2fs_set_link() and f2fs_delete_entry() once a directory folio
>   holds several blocks, so allocate the state with __GFP_NOFAIL, as
>   ifs_alloc() does in iomap, and drop the allocation failure handling
>   of the callers. The write paths attach the state before a folio is
>   dirtied, so writeback does not normally have to allocate it.
> - Handle per-block state in invalidation, dirtying and writeback.
> - Clear PAGECACHE_TAG_TOWRITE as well as PAGECACHE_TAG_DIRTY in
>   f2fs_clear_page_cache_dirty_tag().
> 
> Some of these changes also apply to large folios when the block size
> equals PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
