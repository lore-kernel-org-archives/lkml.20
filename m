Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A1486BB9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357902; cv=none; b=uyzSaIwj5wVoZMWhMe9Y7A942KyoSjIP5hHtL/9kcLYiBVntzMwJSWwlT1dxjDH2KJ9DhzMJIyrWsM/VcmwS3HR7K8VXWCPjfu+X8NF8RKzOApYuqpkR/McZoJfmCcY2wb5UzxlcuTJBlvKJcPfWanVqrpomcBJ4Ul4bAkjWldM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357902; c=relaxed/simple;
	bh=0yD5N7KjhxtUYTgarMEKtXwQ3YvJGVtnMAneE2LGYbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4W3SUp7XQoMokEzwKIxXdEalm33VaPA98JWSHWk8hmgLZkLgT9DYNRED4ZD/RbgEViQsl675hTEjXZ87CwtZ6o8gDLmFSo0wk/JRwSvXqfD+bHKTmuvF40YOTrkz/jejUUjsiuCXxeQByjJf8SG15a0uynCQivq+Zvw2r82KO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=B3zsgfKO; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="B3zsgfKO"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90e95a18c92so16371586d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788357899; x=1788962699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Why+id/p3RNpzcV3QpTHawTDpT4ABQ4KUVboBTGGWGA=;
        b=B3zsgfKOPQiyVEjSqCb7T8EXPZffzQJJBKGEcM/kpkcrAur2INOHYekY1tvKZUI5C/
         WqsRvYoFPjr+LQZmjPx+1qDLH1DKCBQH9ifIrHZrnGm512nSDOq4A7Y5J/RLQvixE3dM
         LMOsK7PEkdhvJrpte/DnDwZKIyJdgZV/O7DeKM6wv2AE6NXa2plESfh95pGq3AaUWGDJ
         fLCdXttm0imlLRna6dG46/PlgbUrruSj8ktjREKdSG5pYsv/WXBWTcTi69SYYPpaQZNw
         RedqiFCqdpUWT1QPgjYK/o3XSK9TosES/8I3/y+cMMEmMICfBVMOTNX/yR6ECbGvEx9/
         vSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357899; x=1788962699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Why+id/p3RNpzcV3QpTHawTDpT4ABQ4KUVboBTGGWGA=;
        b=EzL/xtCfU+dgnQ9ImMEbIvFnWGa+lOx7YvesBUQOFgGhqPkbnw4+gZVkrMDE+lJFdO
         5wAafi1Cc/wYTNkdkWQ6f0211BgedZEtkO505wCA0iyFippmKcJtGPk7GZ+2cde9Nzo+
         EJHxxjXGM23HZUCm3WSvjCPb+Cbk4Jsf7HHuOzadAY1FOOc+D/Hty6Opimq1D33L5XjZ
         WDv5wYPyGzVoNGZGmyxdpwP3sBUFzCCe5Hht6tKFIfQNgNMoTNo57tQokxlDb5D91DT6
         QBcuPKkhhNgHNb3CyBycM1Y0zW4Xi9o0pmbxhrStvvc7wcOiOkfplWgr1zSCum+qeSHh
         k6nw==
X-Forwarded-Encrypted: i=1; AKwUvByMclz4roM4O+PBB0rD9yp2wlvrI47Meyt2vKdS4S7xOz5QBKD1/G/4zuGPrUIwmNZYq/K39caYAHga1xg=@vger.kernel.org
X-Gm-Message-State: AFuF++lmE4+HB6I0y6Ah1WywuD94ozLY6uCPICkg8VK2bhjfixpZHY/W
	aOL4CyI81CaDF0ADcSS3u/IqPkL+ZAaisVrd85PBiEhUEFqSw8J/imOBNq1TOVXLoDc=
X-Gm-Gg: AYBFou1LKt/yhDytIAiJDMsI6Yxzo/Mu6hwSrEV5rrhuRDQQXL3qUZXlqetDoy6nRgI
	gdMSbGz8SxPa8Xowmzulr+wAK5IpXbAgCIZUns5NSM6W3lPnmsUKZ6s1Dy6Xk38qpB/zvOP2Mup
	31phyGt9tIknv4GC+QaPYI+POEwxQfwwEsXPTNQ+HcdbVWIhlMKFkGW2R6Ni/IblQjYOEu2VZt4
	2lBTZle071ZkvQRJqjoW3PEvQcXYxqCrS2C6yGBfmfabb3c+MtikPTQXFl1hUn6IsL9OpnrhNLc
	Vfs53oPBoM91avnzxsnf3510W6abuqSnUhOg7osZhPD9D74LDLbMMpeyOvYAO0z7m7GvYtTEII3
	FYhT28IkyyqwgcM2Ej8MPoL3uVATDMeUBgwWKDuA9kt79bnDh4TUZF2TalYwHjPRibM9uOsEE/w
	evROuDhl5F8YzHoyeyYWJRGu92tFSR2m8owWjpYKh9D9t/ynRm02P8g12e0el8fxHj1MFVt5JrZ
	PU4E5+W0WGIvsATnA8P6YAgVXVFKokOwNzxZwuDO0ny
X-Received: by 2002:a05:6214:b6a:b0:907:bfc0:781e with SMTP id 6a1803df08f44-90eca3d4856mr65248836d6.30.1788357899289;
        Wed, 02 Sep 2026 07:04:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7ffdsm18809156d6.25.2026.09.02.07.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:04:58 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:04:57 -0400
From: Gregory Price <gourry@gourry.net>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mempolicy: fix div-by-zero in alloc_pages_bulk_interleave
Message-ID: <apgrrQM5cFWRA4HR@gourry-fedora-PF4VCD3F>
References: <20260902090245.16411-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902090245.16411-1-liujing@cmss.chinamobile.com>

On Wed, Sep 02, 2026 at 05:02:45PM +0800, Liu Jing wrote:
> In alloc_pages_bulk_interleave(), nodes_weight(pol->nodes) may return
> 0 if all nodes in the policy mask have been offlined at runtime. The
> subsequent division "nr_pages / nodes" triggers a divide-by-zero
> panic.
> 

now i'm positive this is LLM produced without understanding the
component.

A policy cannot have an empty nodemask, it can either
1) have no nodemask (default policy), or
2) be perceived as empty during a torn-read during a policy remap event

If you are running LLMs to search for surface level bugs and try to
hot-fix them without taking time to understand the underlying component,
please at least:

1) tell us that
2) generate reproducers

these "quick fixes" based on surface level observations are going to hide
real bugs and just degrade the overall state of the system.

> Add a zero check returning 0 (no pages allocated) when the nodemask
> is empty, consistent with the guard in
> alloc_pages_bulk_weighted_interleave().
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> ---
>  mm/mempolicy.c | 3 +++
>  1 file changed, 3 insertion(+), 0 deletion(-)
> 
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2600,6 +2600,9 @@
>  	unsigned long total_allocated = 0;
>  
>  	nodes = nodes_weight(pol->nodes);
> +	if (!nodes)
> +		return 0;
> +
>  	nr_pages_per_node = nr_pages / nodes;
>  	delta = nr_pages - nodes * nr_pages_per_node;
>  
> 
> --
> 2.43.0
> 
> 
