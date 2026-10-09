Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC0339A4A7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526612; cv=none; b=gM9KGlZVyteriNJCsnRsImkcFUwZ0pZ6DrXT3CgPAZhY+aa4B+DmkSnGq+8b4sWzRJ9HoU3ehXlQJTy+VSArsAtz4ESSiyDXqQbYq9dkqVoGAOxw7UWiNwIywBaj4MuwD9aa2vGNTu4z4SFRPD0rXi1QMYlfbsZXeAlOc1rD/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526612; c=relaxed/simple;
	bh=Qqm/xOnxE62/wvgOjhIU1u3xn+YPCeDLxc0PlMRCH7g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NJvTG9SOpUPfblipk/fT90QDgHGsEbdqo5yNd+mzNiK9dDRHmaQC6BIzSShYy5uEuB6UaWny5HoecR6YH2Fm67ejAn+MhqxEX2mgC1gwNX7KodhjOoVKhN6LGuWfXhIaXZuVSWv3VnRRy+mG2pB+A+4Y6Z0/fWKJMYOBr7piCB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bRlQEJFy; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bRlQEJFy"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b056d58f2aso32554757b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791526609; x=1792131409; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWW6pSaXaHUM1wAEC6gE0iO0re0mXFQVa9Pv7/vaQG8=;
        b=bRlQEJFy2R7r5SAIKw5xm0jJ6kfnMekQY4sFvw7cegAa4jhIfd3JR9eUSi32HJnW60
         dHkrwpOMvVitYXF5QKt9qRCK8OYs89etGsM9HedL9vy86RhrOGNYqta07b/9RXunGdPq
         a7X6y7wxvPgL4FSQH40Bqo9ck3QqJlRbjBX6tmitj5VnPQ9jICc26ZcyC4TjPMKabJXM
         dmjkuT35BrkyIBiJ2qzmKuQoPHg586q2rRko6pc1F0tau6ohvZxX/BHytKIIgTOUK/mX
         jyoQK1gjdEGcu7dsE0iRUB1ppntVDJ6DPyHHy5HawTCbQUrqCM3oG1qmYECByIfZhBM2
         r4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526609; x=1792131409;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWW6pSaXaHUM1wAEC6gE0iO0re0mXFQVa9Pv7/vaQG8=;
        b=X6VbEVvAjUvjMoG+db3d/AsSnM0F6Z8Xm5xfPwaAb0WnJsNdK1OWjjZWJM7f0m8/R9
         IWB7wcyVT/ONAGvZPmmDOo9wYYPulIRM4Z7KBqQNyTGnkDAzyhbkB8YVXKmlErouKEAb
         ZSscFHx+A9SLi8NuYK63C9HU+ByFhE9eI5GnmMbVH3jrnGf9eDQQMPhOaCWeraKCzKL0
         uCriSHzhpROYTUNwVT8JdnHuiCFo6Gmo1Fm2/vfBjeTy03qWC9znBwZURkJ3S6fNpb3Y
         5X1i5LK8/4Ao2iu9Xg7OZ85tg85/kxSMU/hxOsWWdG1He0y2aJXkIYDygEXuJ64DIech
         ZDyA==
X-Forwarded-Encrypted: i=1; AKwUvByJGFQZcFbZFAfXB05ciWCvTsEPAuGPj8iHV3/n1RgwDek6CmFytJd7pHGIQ787zamWgPX4AkW7U+ANRBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3VQUez6Dzm9STkE6q9xP0Ptjn3QFv/wHj48f/w8H0uHYFmzg+
	ARs41hQ7/c5O+H5evIWHcp5JMPpFIh+Edh44uFLu++w7rPxuyn0vCX7o8lrgVCnTAceFcKLSSr/
	KVmXJDw==
X-Gm-Gg: AYBFou3iz/i5SDg95AEZMOliO04/7rLzZStLD6KxJEmB26khPnJ7BXhnVTNPxm3HRC2
	w2Tty+kRzvU9f4HXI7RVNKZRJTcVCPykxHo9oCPYKFtlDFve9d23O5PfWdFDx6gR6KJqSqFKeqs
	25TUDpDz4qJVjIlx8sRaKw86tjC3dHelDLyFwCYz9B0qZ+5EnCr2pb0+kqae0vDQb8EBIdLYogI
	9RQdHzd9OI9tfHWx7zIy7Tfp9u+OfK2Nnlrlxnw6YRi+sDK9gFkulOu8XrviuSAwkKXEPnwbVuQ
	3GmMLnvysmMXEHUFzeMVRvLtEjtAbfZQrxWdzqXokwbVp2hTMgXPaRWFGf19eZa9Xy4CAYHQDv9
	pRR63NqlUGfDNZOz7GdQY5ajTaeThBMfXvxxufvKfjCfnsKueqPykuPDGiA9t5UQAy+c9/X3ELD
	0KdPUu8R+qAvZfmG9Zc9FkqSgmTnWjzCGHF2wMFkr2mQBMM937CAcFpgkxD8I4Aq3HV9Cl+C4Pa
	24/n22xqyA32qyfpW2zh22JgziYIQ3hnmI6ff0k2JXzS6bLKvIvtkNnmvE=
X-Received: by 2002:a05:690c:3685:b0:89a:63bc:8c4 with SMTP id 00721157ae682-8b07ee6d7e3mr2905837b3.78.1791526608330;
        Thu, 08 Oct 2026 23:16:48 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1ef106sm3668887b3.22.2026.10.08.23.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:16:47 -0700 (PDT)
Date: Thu, 8 Oct 2026 23:16:36 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Kyle Zeng <kylebot@openai.com>
cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    Andrew Morton <akpm@linux-foundation.org>, 
    David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    outbounddisclosures@openai.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/khugepaged: flush deferred unmaps before dropping
 a failed folio
In-Reply-To: <20261007041001.43181-1-kylebot@openai.com>
Message-ID: <f079a394-32e2-d8aa-f750-d5e3e87a7f42@google.com>
References: <20261007041001.43181-1-kylebot@openai.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Oct 2026, Kyle Zeng wrote:

> collapse_file() can fail its reference-count or dirty-folio check after
> unmapping with TTU_BATCH_FLUSH.  Both paths put back the isolated folio,
> then unlock it and drop the lookup reference before reaching the common
> try_to_unmap_flush().
> 
> The page-cache reference does not keep the folio stable once the lock is
> released.  Another collapse can replace and free it.  With its PTEs
> already gone, that collapse cannot flush the first task's per-task TLB
> batch, and retract_page_tables() skips short or unaligned VMAs.  A CPU
> can therefore retain a user translation to the freed folio.  This has
> been reproduced with unprivileged MADV_COLLAPSE on a memfd.
> 
> Flush at out_unlock while the lookup reference and folio lock are still
> held.  The common flush continues to cover the accumulated pagelist on
> both success and rollback, preserving batching on successful collapses.
> 
> Fixes: 6d9df8a5889c ("mm/thp: collapse_file() do try_to_unmap(TTU_BATCH_FLUSH)")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Kyle Zeng <kylebot@openai.com>

Good catch, yes, thanks: the folios already on the pagelist were correctly
flushed before reference dropped, but the one failing folio had its
reference dropped too soon.

I might have chosen to fix it differently (holding the final reference),
rather than duplicating the try_to_unmap_flush(); but you've put a nice
comment on its no-op when already flushed (thanks to Zi Yan), so I don't
think it's worth messing around with this good fix you've already tested.

Acked-by: Hugh Dickins <hughd@google.com>

> ---
> Changes in v2:
> - Use Assisted-by: LLM.
> - Explain that the common flush is a no-op after out_unlock flushes.
> 
>  mm/khugepaged.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 75639298efc2..e1a5890818ad 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2478,6 +2478,11 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>  		index += folio_nr_pages(folio);
>  		continue;
>  out_unlock:
> +		/*
> +		 * The folio may have been unmapped with TTU_BATCH_FLUSH.
> +		 * Flush before releasing the lock and our last reference.
> +		 */
> +		try_to_unmap_flush();
>  		folio_unlock(folio);
>  		folio_put(folio);
>  		goto xa_unlocked;
> @@ -2488,9 +2493,8 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>  xa_unlocked:
>  
>  	/*
> -	 * If collapse is successful, flush must be done now before copying.
> -	 * If collapse is unsuccessful, does flush actually need to be done?
> -	 * Do it anyway, to clear the state.
> +	 * Flush before copying the folios, or releasing them in rollback.
> +	 * This is a no-op if out_unlock already flushed the batch.
>  	 */
>  	try_to_unmap_flush();
>  
