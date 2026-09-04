Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3125041B8F6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502073; cv=none; b=PwrC/q9bQq2odAyLkZPBvyytZFXQ1DgUWZrnK4vl3IIvF6lJi1MgK/W+zu2jioZzGaWo+85Jxp/UXieFNbbOZiso0p07YLdrcxrPp3SEGjAxlMcjezzPPLNmYn888bSYnQoSX/6AROMSbLfxWpftJLfDlmqTLLN5YJYlHhOBYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502073; c=relaxed/simple;
	bh=uUyVtBlB3xa4kfI5hBH/AW2uWbAMM7OxdjtVgB9zCt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tB8OFx+a0GpE/pNZiewSMBv2XBVXCN1tO1G69oUwwbewJqXsY2YXMWjtk8VJmj2uC0PPhz04jvnM0RD720gCscNbj6SWtZKBYJ1Pq9m5nTwOdjIi/vBPC5DB/4w5P2OlVyxmVdTXc0/BNjp1uUio1X+dIMKdsfAQt9L10PDeDcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 4 Sep 2026 15:07:46 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: youngjun.park@lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.1.125 with ESMTP; 4 Sep 2026 15:07:46 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Fri, 4 Sep 2026 15:07:46 +0900
From: Youngjun Park <youngjun.park@lge.com>
To: gaoguixing <gaoguixing@uniontech.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, chrisl@kernel.org,
	shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com,
	baohua@kernel.org
Subject: Re: [RFC PATCH] mm/swap: fix swap table count encoding for empty
 slots
Message-ID: <appgMkDEZkgKID48@yjaykim-PowerEdge-T330>
References: <2FDEE109C6578F17+20260904025411.106943-1-gaoguixing@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2FDEE109C6578F17+20260904025411.106943-1-gaoguixing@uniontech.com>

On Fri, Sep 04, 2026 at 10:54:11AM +0800, gaoguixing wrote:
....
>  mm/swapfile.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index d6c5c25755be..02fd5ad94185 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -163,16 +163,16 @@ static void __swap_table_update_count(struct swap_cluster_info *ci,
>  				      unsigned char count)
>  {
>  	unsigned long swp_tb = __swap_table_get(ci, ci_off);
> -	unsigned char flags = swap_table_count(count);
> +	unsigned char tb_count = swap_table_count(count);
>  
>  	if (WARN_ON_ONCE(swp_tb_is_bad(swp_tb)))
>  		return;
> -	if (!flags && swp_tb_is_null(swp_tb))
> +	if (!tb_count && swp_tb_is_null(swp_tb))
>  		return;
> -	if (flags && swp_tb_is_null(swp_tb))
> -		swp_tb = shadow_to_swp_tb(NULL, flags);
> -	else
> -		swp_tb = __swp_tb_mk_count(swp_tb, flags);
> +	if (tb_count && swp_tb_is_null(swp_tb))
> +		swp_tb = shadow_to_swp_tb(NULL, 0);
> +
> +	swp_tb = __swp_tb_mk_count(swp_tb, tb_count);
>  	__swap_table_set(ci, ci_off, swp_tb);
>  }
>
Hello,

If I understand correctly, this function was added during a custom
kernel adaptation, and since the flags field mixes the count and the
Z flag, you'd like to split out a dedicated helper for updating the
swap count?

To me the layout and helpers in swap_table.h and swapfile.c already
read well enough. A mistake is possible, but following how the flags
field is used across swap_table.h and its callers was not hard.

I can't quite see where this would apply or what it buys us from this
diff alone. Could you progress & share the rationale and an actual patch on top
of the upstream series?

Thanks,
Youngjun
 
