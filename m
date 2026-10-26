Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004565;
	b=Vjl7U49vQKeZZ5cHbRwKXG59jUKU+ESTmUkzwD4d/B6HgLpjOYHzzTXu0mPs8Sj3aVD6
	 aKLevIuVkhsitwFKddPMtjGszjxBpPo3ZJb59PsvtWBbbyhI6LH57D018S4e/+A6Y0Gsa
	 26L5txr1SdpY8SeBPlN/BznbKUCX+Q9x+hQWhyazlIdbiy4B2IO/Y+1+8cwBlAhm9BAim
	 YkYhVSo6lDk/l6R0olWlHZbiVRiZvrKE6TRMWGuwFWTUgUF0ZpLf+Em6Be1bCL6ayvHX9
	 2QfBmr9Rj7pzAveOW8vWWDsjCCQef7AhSqLUEpXMs505ePtFWCkhI3Q4C/ag+BIlSVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004565;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LizEjFCJdKeMefdED2BcpHWLU6j6r3nsMZtDur3gTtc=;
	b=e24JUufrdg8cqW5CJ0Zm+whtqn7keozYAgwuA8hJo+ZQU9QEzzb0MylIFe1XLvn5rzEZ
	 +MWdCbQlDsjoEC10uILsQnrWyk00d+n54n3nAVurxXibRRD15d65yELfuvlnLtzxFq+Ea
	 zllANMC1hCxcyddA+6T69OLyscyir6ndSnKyLKH0hIgYJKozAIyMCJSHjvDbe3usg5ia+
	 Fzn31btwsR02/bkynRnWWU3zEhSFV7EOiO3MiGQQpvR3xToOea6lRP4G7eL9kBoJgkmVJ
	 xhYr6rL7zYnmwy29drR/lUbkc8yRIRXeTqbtppeKpEgkjggsiucrHcSXfdp65xttqWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GMtoT7WA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8276606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GMtoT7WA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775751F01825;
	Mon, 26 Oct 2026 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793004564;
	bh=LizEjFCJdKeMefdED2BcpHWLU6j6r3nsMZtDur3gTtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GMtoT7WA0VI2aRx3RSWdTPDMssTiugbINS+ZVvEm7JzvPEc6/KiaoxF09CbnzOdBt
	 IUlee+A4yr6WVB7T/mEhKTY2kHvT4PG6tsPFJD2LhKretqSZxh5dQrb8naD4FijljT
	 FiPapaTw9AA3EiUQWIUSLoFeqvJTnVBh0BPoQKWr2OZcmqtlmGCAeWZX8DquyBEvPq
	 U5tVf5KDpCGkshQjdSZNkCbDuDuacp8wR1O/3dcQ5avu0eJar0PVcUwwl+6ldeDy4x
	 Yt3pduRlUKoTF4aeCARBh4+ByM7jtUGFFPq9jFjeIJ6E7Jf7pqJ3VBV/7xEkltJZg7
	 +hU5sqY7jHD9Q==
Date: Mon, 26 Oct 2026 09:49:15 +0100
From: Gao Xiang <xiang@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Giuseppe Scrivano <giuseppe@scrivano.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] erofs: don't reuse a superblock for a mount that passes
 device=
Message-ID: <at8UCyjlHgxxBAaf@MacBookPro>
Mail-Followup-To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Giuseppe Scrivano <giuseppe@scrivano.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261021083826.1870937-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261021083826.1870937-1-zhanxusheng1024@gmail.com>

Hi Xusheng,

On Wed, Oct 21, 2026 at 04:38:26PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> superblock_share together with device= is rejected in
> erofs_fc_fill_super():
> 
> 	if (test_opt(&sbi->opt, SUPERBLOCK_SHARE) &&
> 	    sbi->devs->extra_devices)
> 		return -EINVAL;
> 
> but extra_devices is kept in sbi->devs, not in sbi->opt, and
> erofs_sb_share_test_super() compares only the backing inode, the
> fsoffset and sbi->opt.  So once the image is mounted with
> superblock_share, a second mount with superblock_share,device= matches
> that superblock and get_tree_super() reuses it without calling
> fill_super() at all.
> 
> The same command line therefore either fails with -EINVAL or succeeds
> with device= quietly dropped, depending on whether a compatible mount
> already exists.
> 
> Refuse to match a context that brought device= options, so that it gets
> a superblock of its own and fill_super() decides as it does today.
> 
> Only the incoming context can be tested: a shared superblock may have
> extra_devices set itself, because erofs_scan_devices() fills the device
> table from the image when no device= was given.
> 
> Fixes: cd4108319bb3 ("erofs: reuse superblock for file-backed mounts")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  fs/erofs/super.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 16fa3b853f1b6..bc9ab5a6234a0 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -825,6 +825,13 @@ static int erofs_sb_share_test_super(struct super_block *sb,
>  		return 0;
>  	if (!sbi->dif0.file || !new_sbi->dif0.file)
>  		return 0;
> +	/*
> +	 * extra_devices is not part of sbi->opt, so the memcmp below cannot
> +	 * see device= options.  @sb may have extra_devices set from the
> +	 * on-disk device table, so only the incoming context is tested.
> +	 */
> +	if (new_sbi->devs->extra_devices)
> +		return 0;

Yes, it's indeed an issue, but the comment message here is useless
since erofs_fc_fill_super() doesn't explicitly support `device=`.


>  	return file_inode(sbi->dif0.file) == file_inode(new_sbi->dif0.file) &&
>  	       sbi->dif0.fsoff == new_sbi->dif0.fsoff &&
>  	       !memcmp(&sbi->opt, &new_sbi->opt, sizeof(sbi->opt));

		&& !new_sbi->devs->extra_devices;

I think you should just add a line here.

Could you please send another version as soon as possible so I can
apply.

Thanks,
Gao Xiang

> 
> base-commit: 1137aa577a35e2684e8046c3e53f920e79c7cc60
> -- 
> 2.43.0
> 
> 
