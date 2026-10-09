Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57F3D6461
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534600; cv=none; b=bpb+VmVxudCOUJWXA/Sny25FWS1dJxBZqP9fRv6XhJHEAZFtGzyEHdQBW8+jDAxJaC2eGpkaz38rF2qio0qaLdKxlxD9AosIS5iO94NV/fzapiYrXkCqzm3qM58tdV2pLSlkus4RSQg0S1VJpuPvLZDVOK2HoowzYcr0ufz/AWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534600; c=relaxed/simple;
	bh=WeqeCyNrzocxMkqgH+YHDHaNBH5ygVdjb7ookExq2Oo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Rs8P7X7wM7NxRsJVTp+ETBa0ED7vBU6OYiMAeIuJigYNQdMzOr44BdMZSo+ARaVjnag9ro7oikIby2alTv9c4KHv0uPOziqgVBzAtO1deys2oWFiAYW2wQ/gl06kOO5VZvrSe5WREsT2m5qeTuxybDc8Ncv7I4AtklSQ/VeFPCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQjINi6F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQjINi6F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE931F000FF;
	Fri,  9 Oct 2026 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791534598;
	bh=q4jmmasQ/0jT937eO5jL+cJshoUDEJU04avQ9ToLdpU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=VQjINi6FGbYwSlk7R64p+A9Y3z/pYDooJ0nSJloIGXeRWqN5H69bJKE0o4FHZlUMx
	 VSCvqDuPbzG7U6tRnpHdFJ/NAVzJ6JyZaHCZfGket7x8FgUSvZUa6luBuHsoR2+y4v
	 hhZexMOyb1V23iLiBkx/JTTEwJIsyCTvrGFHQ+a1jLwHYQJXxQY9Xt6TdO2Dl8l9+a
	 iot5pGdEVVQ71xzhoW6ei7nFyMlAv5HkdQWa7R4fR4U3QlmzHDCorc4TAAlstkMnwM
	 q8n4ZGMFWbf32e1ZSv5w3qwhBZBCadZUfDeRNc91kyKh/y/ES6Z6LUTQ/E4TfBnx0Q
	 BwevlEf6cJJmQ==
Message-ID: <29c03ab9-fdf8-4e45-8432-84690e656157@kernel.org>
Date: Fri, 9 Oct 2026 16:29:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com
Subject: Re: [PATCH] f2fs: avoid cache writeback busy loop with zero
 thresholds
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20261009035354.3330915-1-qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261009035354.3330915-1-qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/26 11:53, Wenjie Qi wrote:
> When both cache writeback thresholds are zero,
> f2fs_should_wake_up_cache_wb() returns true even with no dirty caches.
> This makes wait_event_freezable_timeout() return immediately and the
> writeback thread busy-loop instead of waiting for its periodic timeout.
> 
> Return false when both thresholds are disabled so periodic writeback
> can proceed without busy-looping.
> 
> Fixes: d7f084b1ad93 ("f2fs: cache: wake up f2fs_writeback when exceeding threshold")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
> Based on f2fs/dev-test at ce439a2b0690.
> 
>  fs/f2fs/cache.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index c76c4660606c5..88d4e479c8469 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -740,7 +740,8 @@ static inline bool f2fs_should_wake_up_cache_wb(struct f2fs_sb_info *sbi)
>  	    nr_dirty < cache_thread->cache_wb_dirty_threshold)
>  		return false;
>  
> -	return true;
> +	return cache_thread->cache_wb_total_threshold ||
> +		cache_thread->cache_wb_dirty_threshold;

Thanks for the fix, do you mind I fold this into original patch? as it
is still in dev-test.

Thanks,

>  }
>  
>  static int f2fs_cache_writeback_kthread(void *data)

