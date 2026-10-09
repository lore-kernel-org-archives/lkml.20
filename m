Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6C470EA1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530609; cv=none; b=HI+TaMoqPoUcTWsGKffkHiDvrn+NGqI6Y878iX+mNfrd2u3zsTfQeUBqmgFl055Osd/lgbVPOB0DsGIYchDU4HizrDoQ+wwkRk8LLjd0QXYUnwaFcz2fONx5VbLE5FQ0Gq3IOx7/2jenTn+tZ5wrumQc/5A5C9yvRP0UfDSeL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530609; c=relaxed/simple;
	bh=ufj8Y2p1ocOHc1po6Wa3kmTRP9jaECo7NTDNTmL+ZJc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I33WcgnF6X1iji8JC/Slpm+PL6apjMB1OpkbhSdpHm6nJIQpauJv+uqD7CQhES4E+qUrOt7VoJ0rb1wZZLSwLVG5ijwGLtFNH67jSfOQKeizAOIxMyiy3AIJJlSBeHftihqyCLjCqsyHKlQWm0/Ft86+oKFP4WddRtonMp4nqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIufdaMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIufdaMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4C11F000FF;
	Fri,  9 Oct 2026 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791530607;
	bh=k5xr3lKilJrL0OQxQ9rOoAvwtUG141XK3q72654Keoo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=QIufdaMzeAzhyxlIk8JdZCVjZZmdSERIKV6YeNN8tjL1+qLUEXXIqSJWwrDfsBYld
	 x+i96azDNwt4dnKnRjG/ZuGxraox0TDMR/Z4rk4s8RvntsH4dMdeZKCQnMsXfs6KW+
	 d77R7V8ZNv+NEeifxTL0NJRsAkwPcHFVXPFnONlIKJJWU8+c1u08TrYG3F25uger70
	 BQCNYHlEibf6m7fk/lQcxxksSRABMh8h3ZJNEoDyVd2fIDeI9ToQXdiTgizZxU4K18
	 r9Xk+zebgAzq7N6tqxNnea21690kj/SNGiKPYslnji+5Bw4/l1XE5Wdu6W7uX3cf6d
	 DOC/AQ+zylM+A==
Message-ID: <b55e3d43-589f-4d04-a7d3-4cc52aa66fc9@kernel.org>
Date: Fri, 9 Oct 2026 15:23:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: cache: count the temporary pins apart
 from the regular references
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261005192114.1511660-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261005192114.1511660-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/26 03:21, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> f2fs_unlock_cache() and f2fs_end_cache_writeback() take a temporary
> reference on the entry around clear_and_wake_up_bit(), so that the entry
> is not freed before wake_up_bit() returns. f2fs_destroy_cache() waits
> for the LOCKED and WRITEBACK bits and then expects the refcount to be 1,
> but the bit waits can return as soon as the bit is cleared, before the
> I/O completion drops the temporary reference. When the completion runs
> in process context and is preempted there (e.g. dm-flakey in
> generic/311), umount hits:
> 
>   kernel BUG at fs/f2fs/cache.c:567!
>   f2fs_destroy_cache+0x260/0x268
>   f2fs_put_super+0x1fc/0x428
> 
> Count the temporary references in units of F2FS_CACHE_PIN_BIAS, like
> GUP_PIN_COUNTING_BIAS for folios, and check only the regular references
> in f2fs_destroy_cache(). A leaked regular reference is still caught
> there, without waiting for the completion.
> 
> The pinned entry is freed by whichever of f2fs_cache_put() and
> f2fs_cache_unpin() drops the refcount to zero, as before. The shrinker
> still skips an entry while it is pinned, since the refcount is then
> neither 1 nor below 3.
> 
> Fixes: 6e392158cf54 ("f2fs: cache: pin cached block in f2fs_end_cache_writeback()")
> Fixes: 61ba87b33e87 ("f2fs: cache: pin cached block in f2fs_unlock_cache()")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
