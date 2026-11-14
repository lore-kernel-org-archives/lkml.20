Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614607;
	b=B2twScxpBPixJ96bygchclemMnCRHVQf0tXpS39wH/8VhjT5yd9NprVB/VWZhjqXk0dY
	 X/IiENmMJqumfdnVJbKp2PtgLaQ9PUTBUPVnlyFhpNlu44aVxptm0o2NGHLgzlNXDS6FK
	 +deh6XnChWOvslE2ITWpA3lzcLD6RYaoa1f31ep061tHLP+XPb7UzxynXknNp+8G84CZh
	 Npj1p8m9QJZAtZEsyQRdiswg42ks6HpQf0zyWVKBe7JMgyHYtQO/1iHl67wNutvDonBEQ
	 gi2EOSah7mp9E6gWd9Gb5D56AJPHIIpimTl9GgvGGprQQ62k9ebub+Mw5zx4p5bOrUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iZa3MBp/IUb2x30boNDvuDodJN8AJhJ/Yn3eROGZAMg=;
	b=piZ43HeHDh16yRzyaPD5affMBKLCxiKFqUD/T3AuUUSUgieuOi1U6hu1RBG60LYlzc79
	 oaOXU4zcLJDXvb/KEU85o0ndafYml/G5KQAAIg9OldiZ1mlXyAWFKzsHJ5Y1KTXrtUbiB
	 sIHc0Yp4nj1Hzfq56MW3hP3/0Ba0gZpXc0qxVMnqImZqVaMsnnckk/TE52x7x+fqmasOQ
	 y1XLO13uUYBXZRFBtEDQ+ZXXA30LIOznrDgwptTErUyHbB2ZFm9D4Z5a4K9taSqypcOp8
	 IVVURVtVN5pQpuadSz5hKhIhudqRWnRwvceTqO18QGSZk8CGE4sxRCiIBzHVI96cY+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4G3kB6v;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211B3606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211B3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4G3kB6v
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so1645352d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614605; x=1795219405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZa3MBp/IUb2x30boNDvuDodJN8AJhJ/Yn3eROGZAMg=;
        b=d4G3kB6vC+800jyePp2Zn5uqUyJfuzmDYa94sZsS/QDUqBEFDMpE2o5TR2GctlywGk
         l8bSNtAoymX+aBRV/501QSOsGb/tggF40yAj9iyGIVjCTqSjD5eFeAAGRKXuCV+Bpxct
         S83v2lv1a9p1PJQBpianIXBOxFinTutAkVuj0kaxY68L9hKWrHEvqzxvSmolwcyCYVi1
         pdIME6C1A4kkia/VudCr9SSehJNkGF2pIeMEG84EbfRpme/G+bRmlJbgl3YhgrkntCGi
         WxjmKTB0y8zU1bZFGqr4C7RYbSbBR//WR1kmw8FDxNF+okyg5bqYH3qi/Tuju9zo2R2P
         qM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614605; x=1795219405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iZa3MBp/IUb2x30boNDvuDodJN8AJhJ/Yn3eROGZAMg=;
        b=b5sPv6gt19rt1MaaLoFJvfLkrequy+fjJCLs5ohcyfgE54PgcZA1wkQrZizXuu60k0
         QutuOUc/r1yjcWtbn40m6JS5x5cGh389ywEv6kRUHBv3LzqGSpc/yoo0VqKFohWkWP0g
         BsQBupVW1usbu54NhiE6LKKie7LjiDAvkN5f8M4umv8P98S5HZyB77GmJekjomKg5+Vx
         vrrJ58tXCzCkzIn+7dDZhGh4Y081FiEISEg+i2RUe7H4cTF/lXuGRT/LPez47jAWh09U
         TSKR5jfgLbCj5pqjhpkthoPWasf0xjpL5eqSc+JjhexN+In/5VMGSgFHd3Hn2s/kl62x
         Z0sg==
X-Forwarded-Encrypted: i=1; AL+hErFBl3T1aT6HsQoVPQqGAMdx+eyCaKHh2TS9uqdlvlCo+NEw2TcgxbeVZ5WQG8wXCyeNJATGFJeF1fmZwbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z4ItAe6jpEwZqEPIKMUX5Ey1ax3NnsJhSALMSYha4rqjidyjh
	bD/mLiQdip+ZVMOo2WPv6VKaw7Jx+K6dmjq+C4pEwPEGqnijZpp7xHkU
X-Gm-Gg: AYBFou3qhT7LLB86wkaAR64LxCk+JPAPTEmj07Q2k3GGO6F7L522cwPR3wW8X3ZgsEQ
	09tL4LpK+Fn8P+JPDYoXlMOd1HV578jhPLMQ30DBeZZMWlPHQmWrMxjJCw7JBQ9YSb/j/TBTfZU
	TCXxekHYt3afQcc0y9c+DlOE2GpMA2aOOkwcJVfggkvpOCGBap1uG5qhlky5lnxDefCP76/UQ6p
	8rMZLxd65Wrlix1D8pqMqAr9O6qg8Nr/ZcIgIqILlT4Wz6YFpJz8NZ6YTqebdIothUxzpgCS1vt
	QpOoa5SFb3DpFSz3c9g97ciXZILxnhkVA59Y4lhqm3fNqFJII89OYaGzP106wWytqCiLKPXG87W
	ZNVkOJPGIExXJfxTLnWglqU2dMRrZVRYHKlHV5nDvXNxdfHsTcOi1xoi+xxv/UYQARj3g6ik1PD
	zY6Exu46UG6pN9AOFFyR0oLJf2XTEcZv4MfWu6CG+jla5E2GHU+oy5y6Y4FsjxX78vTouRPx9kx
	AAhtZSkdKv3nAPDfO4NuIF851ps1X4jQ5QadFPARAXlZC1Oxq5mSLAVcWAIUH3shLTr52YaJa6p
	aekVRV4l3gQmWpI8+DueMQwpIvTXa5cT0oduaVMNsRclQAwk/pdoF1+h44ly7zqZMYJsUBPEv9c
	sqeZxEA==
X-Received: by 2002:a53:a8c8:0:b0:677:d1d9:127d with SMTP id 956f58d0204a3-67d8976c451mr1770896d50.100.1794614605107;
        Fri, 13 Nov 2026 16:03:25 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5e::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a4359absm3414111d50.1.2026.11.13.16.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 16:03:24 -0800 (PST)
Date: Fri, 13 Nov 2026 16:03:24 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com
Subject: Re: [PATCH] mm/mempolicy: ignore a bind policy whose nodes have no
 memory
Message-ID: <avelG_Yo_-3ClgPS@devbig011.atn3.facebook.com>
Mail-Followup-To: "Gregory Price (Meta)" <gourry@gourry.net>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com
References: <20261113192642.2618878-1-gourry@gourry.net>
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
In-Reply-To: <20261113192642.2618878-1-gourry@gourry.net>

On Fri, Nov 13, 2026 at 02:26:42PM -0500, Gregory Price (Meta) wrote:
> apply_policy_zone() assumes that policy->nodes intersects N_MEMORY, so
> it reads a bind policy with no N_HIGH_MEMORY node as movable-only.
> 
> On systems with CONFIG_CPUSETS=n, nothing rebinds policies when memory
> is removed, so offlining all memory on the nodes a bind policy names
> leaves it with none. The policy is then treated as movable-only, and
> movable allocations are restricted to nodes without memory.
> 
> This results in allocations failures, a VM_FAULT_OOM leak, and then
> an infinitely retrying fault that hangs the process.
> 
>   page allocation failure: order:0, mode:0x140dca ... nodemask=2
>   Huh VM_FAULT_OOM leaked out to the #PF handler. Retrying PF
> 
> Ignore a bind policy whose nodes have no memory. policy_nodemask()
> already ignores a bind policy that does not intersect the cpuset.
> This covers hugetlb's policy_mbind_nodemask() as well.
> 
> If the nodes regain memory, the policy applies again.
> 
> CPUSETS=n with HOTREMOVE=y is unlikely a common configuration, so this
> isn't marked for stable.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Hello Gregory,

Cool find! Thanks for fixing this.
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> ---
>  mm/mempolicy.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index ca7e744727b1..5dc2d7ef1544 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2096,6 +2096,10 @@ bool apply_policy_zone(struct mempolicy *policy, enum zone_type zone)
>  
>  	BUG_ON(dynamic_policy_zone == ZONE_MOVABLE);
>  
> +	/* Memory hot-remove can leave policy->nodes without memory. */
> +	if (!nodes_intersects(policy->nodes, node_states[N_MEMORY]))
> +		return false;
> +
>  	/*
>  	 * if policy->nodes has movable memory only,
>  	 * we apply policy when gfp_zone(gfp) = ZONE_MOVABLE only.
> -- 
> 2.56.0
> 
