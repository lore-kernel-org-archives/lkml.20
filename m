Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB0549F102
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355750; cv=none; b=QlJgKNEfnIPqtMcndYJOOhJI2TMpp5vq7gMO6IVf/ZC9kd4VmFRXvfdmviq95tqHnaBH1F4IjPccHSq60Cuaw+oZE3JOxGhMOtf2TVXQrX+zXUUke+59Qx1uq8KaVfT3Xs/vOCOJlkkkS8JTfEYZIN394Ew+3N9tfLJ5q4ah0wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355750; c=relaxed/simple;
	bh=c8WBW1pnn0loekPRPl0wrUlaDmIkbo4zuoz4LRRoASQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NbvfaalqZEX63nOcJ1Q4u2oElJc/WQZPF6BnnE4AE5k7tUAdvjOuxd9GAlX0E2COZ+seq9KRr3VUV10JH/fTaZLFa97o1jzayVNUejrs9XNYSlmwe+Xg297y6mj3/9eKCto+SYycALwCuFogxPraxRkzGHrJK/v1fzK/N4sxi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdqtzIZk; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdqtzIZk"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso13663165ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355748; x=1788960548; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipWz6RsGTzunItby4GsbJNxElWjk3oalhREfbMO20mA=;
        b=jdqtzIZkBNk533vpAdjQk+E7GTe2ZAnfceHzGTGsRuZHen5Gk/CV/khaLPLgMrB/sR
         IpnIf5YspRHDM+9E26dlvc85WElZ8NKDLU9OddQxH8QAOQDsp70PsqBVmP5oalCfmwlk
         F9cgwHtHsZjsErID7JdfuuMysX6t8DXDbA/r9Vr2lYJlPnYuk8NpOrjxLQbQyXXaAzNr
         YsqqF2LmvBTthelxl5jECmNMAcBCPf4yvZRRl9yXDfUlVMmvTQrVp7LNsQGuWYzgx8y8
         2HG9udPlepCP0wfqZQH6OQ/asF7ykaGroUgEzLcgL+zkm4KcguKd3E88ypOJPFv5uO+/
         0sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355748; x=1788960548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipWz6RsGTzunItby4GsbJNxElWjk3oalhREfbMO20mA=;
        b=NsYv939GgNSmatDU4EKz9muhNCSx7+d0MuXwAXIpfshTAieEgvwtGHjpeeslGN4nHG
         /L3D35ulbNwmYGHiyTXNgXOjSh2lrSz2XRaHuaj5FZSKwBSffCSoGXP7zlfhiGclNBiI
         JMmed3WvY3o3/kJB0eOkBIJExAdf7cgkDXh96gBhqHdnUP8oqayIX0gbXA85TjQIhWXn
         0CfYow+OXKBMGN2kJai5bv72iw8pQVc8O6wJiWtyau246/g3TfJsNCtgEOSjMvSImssl
         eZhF8MWr839OHlUfu2+ajkbvBKRppQwcbPreMM8tEZQamFSy2qySHnHE3Ts6KbI/5ol4
         5pUg==
X-Forwarded-Encrypted: i=1; AKwUvBy852R/h2GzvnVo1z0RyXzwSjcGyNo0cODL7wfe7ZLyNY3hmDAL2lNubFDiLOr2YxTkgd8witDeWt5ysCs=@vger.kernel.org
X-Gm-Message-State: AFuF++ku+RteB+QSO7m99pRM0+oWYEL/Tg9+I3Er59vrwjMt+lVoBr09
	0r+3JmvBIUb6MLP9txrbNjCUDGpFF2Zaucj+Ma4Lug2IqbtNNACeGDewAfkXlqPu00ohqDuMeOH
	dULsFig==
X-Received: from plxe5.prod.google.com ([2002:a17:902:ef45:b0:2c9:b703:3bfb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3887:b0:2cc:864b:539
 with SMTP id d9443c01a7336-2daec625d64mr73388455ad.6.1788355748310; Wed, 02
 Sep 2026 06:29:08 -0700 (PDT)
Date: Wed, 2 Sep 2026 06:29:07 -0700
In-Reply-To: <02876cea-5727-2ca4-bead-73659ea6fec4@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <02876cea-5727-2ca4-bead-73659ea6fec4@google.com>
Message-ID: <apgkowGgWeWQPz0m@google.com>
Subject: Re: [PATCH] mm/folio: EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio)
From: Sean Christopherson <seanjc@google.com>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, David Hildenbrand <david@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 01, 2026, Hugh Dickins wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> To simplify independent development in the KVM and MM subsystems, now
> export to KVM the lru_cache_drain_for_folio() which MM added in 7.3-rc1.
> 
> Link: https://lore.kernel.org/lkml/bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com/T/#u
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
> Hoping for 7.3-rc2, which would make my life easier: thanks!

FWIW, squeezing this into rc2 would make my life (marginally) easier as well, as
this is the only non-KVM change in Ackerley's guest_memfd series.

>  mm/folio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/folio.c b/mm/folio.c
> index c02dcea9c03c..50a6dbe55998 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -33,6 +33,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
> +#include <linux/kvm_types.h>
>  
>  #include "internal.h"
>  #include "page_alloc.h"
> @@ -926,6 +927,7 @@ void lru_cache_drain_for_folio(const struct folio *folio,
>  			*drained = LRU_CACHE_DRAINED_ALL;
>  	}
>  }
> +EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
>  
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>  
> -- 
> base-commiti: cee9395acd8043be0644b25c34bfa86623f2b935
