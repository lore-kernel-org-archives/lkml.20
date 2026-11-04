Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814033;
	b=j0QnuX6Wd0GrYJJEwkdDEDR70XvmRiZpHRAt2e9T1ZOInrKIfSBR99iFRGzUZ4ad5++U
	 Fxg9B9warQ4KncCm142yZL3YL6Xqqeb/zboXxTiJrSpe1g+anm/QHvQ96JFyW2h6yAJek
	 VP1NQzSbj+dAxCqyQs76LV9crtdYQ2cxgsyAmyzYpgen7VFZiR7wg2Zl/Gp6ciIYGYOMY
	 ESf9YVnMPA0b5ohAobsAfRSHPtcFqKSTc7wON5ibYrom/MVXWppHRqpVO1q6LdvJmNIpx
	 elmuZamPz5qK/d23ETMqzHZbWP6BAK6g+mJ2+LTVR5imcXqjfzvh2tLH+DYMtq6bcHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814033;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wdafFITQJe7oXT8wqC+Y0AsS4Xihwh+O5NxVVj5bpWM=;
	b=zidPLUQOPpvN/D81fvBcX8+OO/3mqOhWxtGGGNQfCHFrzw0kjfPHpXYSkB+2mIkiNLDn
	 jxYaZacdC4rSDw7pjqWfDUmuQD3FE/ijHRyZFk4a0oIh0UTeM4wWU5dp7r6U7ZqKZTuCP
	 mEtxv5FbHKJ429v3UnwqQCJCasuVg5YNP6xvBYHa+uyz7RFtpFuZpQpkbj/wqlYuakmR3
	 WiGCFAt4fT3t12bK2FT2vf55QeKF64SbmfdpQ+KSUgtzuMHoypLNyPlGPOjisKf50d/4i
	 LXCjiRWV997Vw9Gm/dq5QhCMmTZKArgpL8pZ2VrFO1synDZSeYbvahY1IEweri50ang==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mOtwudKy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1577606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mOtwudKy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7331F000C1;
	Wed,  4 Nov 2026 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793814032;
	bh=wdafFITQJe7oXT8wqC+Y0AsS4Xihwh+O5NxVVj5bpWM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=mOtwudKy2KGqNK+6dI+1+thxM7Ld8vm2IIxn2bATElFT97LgsEcJjkPJ61Sx2gVak
	 l3X55LWFIs21HDFqah37IAbzOTwB7/b5KVdwFWYPIagTIyVcLYRDkFM1wUyxdYu8KV
	 xmhv4L1fxcWptxokfJHWotKU8PQiyfN1hYbLP/vhOgIZKzPQt4AOpzs6a/OJwtN77k
	 RWPd343Kne3wTSx/QZJD4NQM2KHDwVdQ+xFtjlR5aFoKdIMq6qkHV1jF63p2eCT3mZ
	 ktVLZCMkXdpSKw8UWcTGpEYMG1ZQ24lUqkp6h6suN21nFuF3rHBlJNjDjZuyuLOl1g
	 80HGX0umeWZrA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5C5DFCE09CE; Wed,  4 Nov 2026 09:40:32 -0800 (PST)
Date: Wed, 4 Nov 2026 09:40:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@google.com>, kernel-team@meta.com
Subject: Re: [PATCH] ratelimit: Fix data race on ->burst in ___ratelimit()
Message-ID: <6966fbb2-c849-433c-a4f6-c2b9d05479be@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20261103-ratelimit_race-v1-1-07486c49ec12@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-ratelimit_race-v1-1-07486c49ec12@debian.org>

On Tue, Nov 03, 2026 at 04:29:54AM -0800, Breno Leitao wrote:
> I am seeing the following race on my debug kernels:
> 
>   BUG: KCSAN: data-race in ___ratelimit / do_proc_int_conv
> 
>   write (marked) to 0xffffffff83084544 of 4 bytes by task 186 on cpu 3:
>    do_proc_int_conv+0x94/0xa0
>    proc_vec+0x48a/0x8d0
>    proc_dointvec+0x16/0x20
>    proc_sys_call_handler+0x263/0x3b0
>    proc_sys_write+0x13/0x20
>    vfs_write+0x559/0x610
>    __x64_sys_pwrite64+0xce/0x110
> 
>   read to 0xffffffff83084544 of 4 bytes by task 185 on cpu 1:
>    ___ratelimit+0x137/0x3b0
>    __printk_ratelimit+0x18/0x20
> 
>   value changed: 0x00000001 -> 0x00000000
> 
> This could be reproduced by flipping kernel.printk_ratelimit_burst
> between 0 and 1 while a kthread calls __printk_ratelimit() in a loop
> makes KCSAN report:
> 
> ___ratelimit() reads ->interval and ->burst once, with READ_ONCE(),
> because sysctl writes like the one above change them without taking
> rs->lock. Commit 6bae8ceb90ba ("ratelimit: Fix data-races in
> ___ratelimit().") added those snapshots.
> 
> Refill rs_n_left from the snapshot instead, which is also the value
> the function has already checked to be positive.
> 
> Fixes: cf8cfa8a9978 ("ratelimit: Reduce ___ratelimit() false-positive rate limiting")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Because we have acquired a lock between times, this might get an old
version, but that can happen anyway and gets fixed on the next call.

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  lib/ratelimit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index e2d65d3b1c3545..d24864f12d871e 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -67,7 +67,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>  	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
>  		rs->begin = jiffies;
>  		rs->flags |= RATELIMIT_INITIALIZED;
> -		atomic_set(&rs->rs_n_left, rs->burst);
> +		atomic_set(&rs->rs_n_left, burst);
>  	}
>  
>  	if (time_is_before_jiffies(rs->begin + interval)) {
> @@ -77,7 +77,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>  		 * Reset rs_n_left ASAP to reduce false positives
>  		 * in parallel calls, see above.
>  		 */
> -		atomic_set(&rs->rs_n_left, rs->burst);
> +		atomic_set(&rs->rs_n_left, burst);
>  		rs->begin = jiffies;
>  
>  		if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
> 
> ---
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261103-ratelimit_race-041f9bf78da1
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 
