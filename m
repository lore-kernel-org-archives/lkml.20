Received: from mta0.migadu.com (out-73.mta0.migadu.com [91.218.175.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612273B42D8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789887744; cv=none; b=lcYhDZwUyfzFvKRcXZxY1W2g8mzL+UIZNlIZVzoKDZCCmyQ1ZDlUYBQmSpLYrp7uXuUBB8t/cST4PwCwMPejNZ6UJkm7xeVc9dcKl9DjKwXwgtspkhD55amMr2P3UMh65jlLwobESE/aubaq9OBd+JPO4ja+rklAYNAly9Y1+2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789887744; c=relaxed/simple;
	bh=s/zcXtQDZNBKXL9VB/WZBjdppAH2i5+OL4Mxoj4gz+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJAlMGGabIc6+ap1nMQVpgRR0YHA5KYGmGNGSQ7CgpIHgeBO1IvxkV9Y75C2hXJn4DZ2cIUSLoKpHNI1ACTk8dKcOlx3S+pY77cHm/rvdu4c24Y5IXix9gui2QhcFhowODSv5yefdzxoa9pM86o2gv2vWqKKAuf4StgBMHvoW+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jGvPrMAy; arc=none smtp.client-ip=91.218.175.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jGvPrMAy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=s/zcXtQDZNBKXL9VB/WZBjdppAH2i5+OL4Mxoj4gz+4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789887740; v=1; x=1790492540;
 b=jGvPrMAylT6gZ4gx4XYUMzCdXXLvHNfKAk9kviAr+/cIwXaHmaJXMOUyS2HJadGqBfZ5NeyO
 JZSV9q9HHgUmYoQnYBW/OYCtvqMYPILHSEbUSRoQrqDXqxnc2OAQRL+IdTy5jEB4gG1a/DZVBga
 787B9txM3uzxgRWtyGoAqseg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 9699ff2ade150688;
	Sun, 20 Sep 2026 07:02:10 +0000
X-Mizu-Trace-ID: 9699ff2ade150688
X-Migadu-Flow: FLOW_OUT
Date: Sun, 20 Sep 2026 15:01:56 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Hui Peng <benquike@gmail.com>
Cc: Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ipv6: sr: fix 16-byte kernel heap leak in
 seg6_genl_set_tunsrc()
Message-ID: <aq-E5MPYZS5s9_bk@fedora>
References: <20260919204807.2812472-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919204807.2812472-1-benquike@gmail.com>

Hi Hui Peng,
On Sat, Sep 19, 2026 at 08:48:06PM +0000, Hui Peng wrote:
> seg6_genl_policy[SEG6_ATTR_DST] uses NLA_BINARY with
> .len = sizeof(struct in6_addr), which only caps the maximum attribute
> length and allows 0-byte SEG6_ATTR_DST attributes.
> 
> seg6_genl_set_tunsrc() then unconditionally copies
> sizeof(struct in6_addr) (16 bytes) from
> nla_data(info->attrs[SEG6_ATTR_DST]) into sdata->tun_src via kmemdup(),
> reading 16 bytes of uninitialized skb->head heap memory past skb->tail
> and exposing it to userspace via SEG6_CMD_GET_TUNSRC.
> 
> Enforce NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)) in
> seg6_genl_policy and validate nla_len(info->attrs[SEG6_ATTR_DST]) in
> seg6_genl_set_tunsrc().
> 
> Fixes: 915d7e5e5930 ("ipv6: sr: add code base for control plane support of SR-IPv6")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> diff --git a/net/ipv6/seg6.c b/net/ipv6/seg6.c
> --- a/net/ipv6/seg6.c
> +++ b/net/ipv6/seg6.c
> @@ -138,8 +138,8 @@ out:
>  static struct genl_family seg6_genl_family;
>  
>  static const struct nla_policy seg6_genl_policy[SEG6_ATTR_MAX + 1] = {
> -	[SEG6_ATTR_DST]				= { .type = NLA_BINARY,
> -		.len = sizeof(struct in6_addr) },
> +	[SEG6_ATTR_DST]				=
> +		NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),

After you setting the policy here.

>  	[SEG6_ATTR_DSTLEN]			= { .type = NLA_S32, },
>  	[SEG6_ATTR_HMACKEYID]		= { .type = NLA_U32, },
>  	[SEG6_ATTR_SECRET]			= { .type = NLA_BINARY, },
> @@ -242,7 +242,8 @@ static int seg6_genl_set_tunsrc(struct sk_buff *skb, struct genl_info *info)
>  
>  	sdata = seg6_pernet(net);
>  
> -	if (!info->attrs[SEG6_ATTR_DST])
> +	if (!info->attrs[SEG6_ATTR_DST] ||
> +	    nla_len(info->attrs[SEG6_ATTR_DST]) != sizeof(struct in6_addr))
>  		return -EINVAL;

There is not need to re-check the length again.

Thanks
Hangbin
