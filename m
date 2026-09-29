Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8359F3A5E9F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713291; cv=none; b=isN9KGczJkmMRBipY2p7nmCub8880qvPEhLuZSElJ89wHk88frmnoYWvy4n9SDW4ZH29+b39Jub3Q20QznpHreVC9RbZCyAVBVsEZpgHTVtCuCs+rbwbW2KWs/t3Zd6J6uCal6arGqH2QZocFexahcWJbopjcpf+A9Cm7fcnJAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713291; c=relaxed/simple;
	bh=RL2gYF+ZoWvC15kXnXLpDyPpT7INMRPaAECdkTdM6K0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=smZOx3/9q/tJ4qCvZFmXuKCWmX+3iN8wMysitDMwESKVqkOmgaV3vBoGPEM0PveXjqSXD90TYPgXhnbx5+Y2+Afr/rk/mvkUxNFrlYTR75pkEOltEFBPuVS9hCDJqJzZjwgzstpQoID6ruh429BnID/N2i/602hcxxWj+Jt+p4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dZBZNw/J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dZBZNw/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12411F000FF;
	Tue, 29 Sep 2026 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790713290;
	bh=WNXUzGSmJcg+x1Y67m5TU8BDoA/huH4kHiMBSuw+QHQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dZBZNw/JUw63SYHQEK7bPJ7nkX8D5Ba5G7q42k8NZrKTda19/l4Y2w/bB9YguySoT
	 yUXN4+La4u35x9e4bp7AHS7peAUNw+M/12nSdhAE+OwhXw429/K47zrVkJxuJEDKfB
	 T2vF6LllaLvHlrW1vThl+HVfd2bJwpanOpUWIQeo=
Date: Tue, 29 Sep 2026 13:21:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kazuki Hanai <hnkz.64@gmail.com>
Subject: Re: [PATCH 1/1] shmem: fix unicode_map leak on remount with
 casefold=
Message-Id: <20260929132129.f22de2069651aa2eaf56bf7c@linux-foundation.org>
In-Reply-To: <ba38f80f629fd093c77f3a49fdab7b71ee7bbc5f.1790687276.git.med08elkadiri@gmail.com>
References: <ba38f80f629fd093c77f3a49fdab7b71ee7bbc5f.1790687276.git.med08elkadiri@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 15:13:24 +0200 Mohammed EL Kadiri <med08elkadiri@gmail.com> wrote:

> shmem_parse_opt_casefold() calls utf8_load(), which allocates a fresh
> struct unicode_map, and stores it in ctx->encoding.
> 
> On mount, shmem_fill_super() takes ownership of it via sb->s_encoding,
> and shmem_put_super() frees it with utf8_unload().  On remount nothing
> takes ownership: shmem_reconfigure() never looks at ctx->encoding, and
> shmem_free_fc() only frees ctx itself.  The map is leaked.
> 
> 50000 x "mount -o remount,casefold=utf8-12.1.0 /t" on a casefolded tmpfs
> grows kmalloc-32 from 660 to 50574 active objects, and nothing is
> reclaimed on umount.  A tmpfs mounted without casefold stays flat.  With
> this patch kmalloc-32 stays flat too.
> 
> Clearing ctx->encoding after the transfer is what makes the unload in
> shmem_free_fc() safe: otherwise a failure later in mount would free the
> same map twice, once via put_super and once via fc->free.  This mirrors
> what shmem_reconfigure() already does with ctx->mpol.
> 
> This is easy to hit once casefold= is reported in /proc/mounts, since
> mount(8) then passes it back on every remount of a casefolded tmpfs.

Thanks.

I recently merged
https://lore.kernel.org/20260827152516.805622-1-hnkz.64@gmail.com

Which is preferable?

> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -5202,6 +5202,7 @@ static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  	if (ctx->encoding) {
>  		sb->s_encoding = ctx->encoding;
> +		ctx->encoding = NULL;	/* transfers ownership */
>  		set_default_d_op(sb, &shmem_ci_dentry_ops);
>  		if (ctx->strict_encoding)
>  			sb->s_encoding_flags = SB_ENC_STRICT_MODE_FL;
> @@ -5302,6 +5303,10 @@ static void shmem_free_fc(struct fs_context *fc)
>  	struct shmem_options *ctx = fc->fs_private;
>  
>  	if (ctx) {
> +#if IS_ENABLED(CONFIG_UNICODE)
> +		if (ctx->encoding)
> +			utf8_unload(ctx->encoding);
> +#endif
>  		mpol_put(ctx->mpol);
>  		kfree(ctx);
>  	}
> -- 
> 2.53.0
