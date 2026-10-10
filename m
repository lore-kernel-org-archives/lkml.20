Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7417378824
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642398; cv=none; b=QHJSlS4UJDrTut14RJj0qNzEsvsVa8Ehx4WA9CHSO24Ye4jy7mlJIdWt2tuKaTgHsrtnPvbMjcebBeLR1TAphKwsmjPDhwvg4fva6N3JZK+voDlCjH/oRKQOzSURjQHfQZN3QFkjgdCHp9TyaGf7b6LgKKK3L+WNKUIlWkP/F/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642398; c=relaxed/simple;
	bh=gFXGxYoVq1eMBW//EzzFu9LL6AhPjbOiHn7p+q5UgD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7xp1pPa7bW4jsciEyg70FIQz6P+E9Df9dklCrych08KIu3G3rVBjg2L342/ZguMLuaEu9nJJUXdPP1CWxJwzCp9zybfySvbsdR7arfUOGkoeUQRdQ80JimF0vxYUOLXsWtLcUdf8mJjJ+d1BRRkCPpEDYtO9PgD4dnpMAg8ICc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QEhkLMzw; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QEhkLMzw"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53391022dc0so7601951cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791642395; x=1792247195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sud4Kk2KOGUwm2j68I0efec0mWQp36Kh5Z34rJLtTPs=;
        b=QEhkLMzwqK5bxeEUxww+PD0JymZI7vxjOOl2BJQp5mQ09V7vKjt9M+6XvgnzOI0eTG
         9pOUpXy3UPI9cFGS6cP1z/Hi9UgT9B1AvX9jQHQpge6jkDLRl55tOffaWSSLHeUCWuz9
         68z+HatypAnrylIQ4lHWzVPGrr4ggjNkib51KTdQ8025e47Zfxue36WdCY3avfermHby
         xCRcUPDh++c48tcn2SSIQ4OqHUgq4cWkCp1bYdWZL80dmCs/2k9SyFhF2B+awz+L26qi
         UBwGoy4QRcD1dyDje3dRX2zTaMA5Kz7CI+iuqkt2N0UJfTu8EhkuyuCdELlHvtVss9Dg
         WeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642395; x=1792247195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sud4Kk2KOGUwm2j68I0efec0mWQp36Kh5Z34rJLtTPs=;
        b=CsAFWOFf5UDEr+PqItHArfHG9EddgX39KIml+HN0YiJRTOO0UB9BFG+v4nHQl9re4g
         Buj9Ejd4elvr+pex2l6FC6t9KP+Qo154HARv0uXBtrFfs7D167w1JpdDi9ld0ozJOL2Q
         APlvh/se29GoPLEtYHL3gqS2AFuMrAwAVs6Q7pFBiGWrKrsTF4N0jMJWzNYEYuccOVla
         qqKacbmnP9t09V7Z+c+R/zwKvpH81kRueUns5gAl71UHR+AGiOjX6VdwoNzUXv8njjHM
         i1yNKdx938d//cji2R2UBPPmJ1B2ji7qCMcFMC++9tjHO8FSqbRfoEQfZCCiDyTiLa86
         RXiw==
X-Forwarded-Encrypted: i=1; AKwUvBwqsQarqjYR8RAw87oOyAizt0ra2V4Ub6F5xr0s7fN+0z/PL47WYO924sm8CtQ7LfdqH6/vR8tqNazkGjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT2hEpPNUuPE6UNe4QLiXNCQYyxwvcTFdk5P+qrwsjMMmZcQhi
	XZhFnWAXUb/RO0e0xgK0kVSGF7Ybk285S471pAHhJLelKIGBqfm1rgmmwmENZEhZxzU=
X-Gm-Gg: AYBFou0l74aUTVFSJE/9eNvAaE/Xht753KAEr0rnGgjsF/OerKnnQZRhigDQGfZA2yT
	9momTy0LZ58LtDDv0RwarBW3BhMOKKZMsCd6XNmegawNQ/LzmPueyDuc05SGXcE6poxYwQb1RTQ
	eILXJ6HPTRIP1Zfi2eOTpXJzbtl/+JdYE8gtUUiLU2BJIrtUsoPxWg3tBUIySeC8T6mB9UB04Hc
	TK0z9o8g9E2CBjzc/exPRmsib6iCqySxnSXHpCyiEG8rxuW32H/X/BUhkkt6wMBZvgqbUxQodYk
	Eu6STk7MfnmvgtW3SaDZP/6J7bRtKdyhsDxK0fQFrt0HfykSHNa7H/SkajP5oWHWwx8W2hUbsLG
	xxC7RE8pc0PVdfMo3O8ugRq6a9eI5TQ9BjouBx2krSbHCfgSMH3Xi+o7glDOwxC0wcEHgxsCODz
	Orve0ryg8F6HOqG7a5J9skqHXJPvJjrfRFzaeMaOvnhsLDNw4TD3azq31IG/S4ROTBx0RZnbHlg
	ltn7V60rc+Vxf/eyUsdgciRnYwnj2UHcWm9RcIttP+aYAYdsxIMhiA=
X-Received: by 2002:a05:622a:4d93:b0:534:b7d1:cd1c with SMTP id d75a77b69052e-5359f498f75mr87118251cf.8.1791642395448;
        Sat, 10 Oct 2026 07:26:35 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b79a186sm41486481cf.20.2026.10.10.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:26:35 -0700 (PDT)
Date: Sat, 10 Oct 2026 10:26:33 -0400
From: Gregory Price <gourry@gourry.net>
To: albin_yang@163.com
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	david@kernel.org, vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH] mm/madvise: add cond_resched() in THP branch of
 madvise_cold_or_pageout_pte_range()
Message-ID: <aspKmWIrOzNjiP-t@gourry-fedora-PF4VCD3F>
References: <20261010024042.4070048-1-albin_yang@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010024042.4070048-1-albin_yang@163.com>

On Sat, Oct 10, 2026 at 10:40:42AM +0800, albin_yang@163.com wrote:
> From: Wei Yang <albinwyang@tencent.com>
> 
> Crash log:
>   watchdog: BUG: soft lockup - CPU#63 stuck for 23s! [stress-ng-vm:1665914]
>   ...
>   Call trace:
>   pmdp_invalidate+0x48/0x68
>   madvise_cold_or_pageout_pte_range+0x84c/0xb00
>   walk_pmd_range.isra.0+0x1ac/0x3b0
>   walk_pud_range+0x120/0x190
>   walk_pgd_range+0x170/0x1b8
>   __walk_page_range+0x184/0x198
>   walk_page_range_vma+0x94/0x128
>   madvise_cold+0xd8/0x198
>   madvise_vma_behavior+0x234/0x638
>   madvise_walk_vmas.constprop.0+0xdc/0x210
>   madvise_do_behavior+0xa8/0x328
>   do_madvise+0xd8/0x140
>   __arm64_sys_madvise+0x2c/0xe0
> 
> Signed-off-by: Wei Yang <albinwyang@tencent.com>
> ---
>  mm/madvise.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index eeee82cf2b3f..0755e6d99757 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -450,6 +450,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  		spin_unlock(ptl);
>  		if (pageout)
>  			reclaim_pages(&folio_list);
> +		cond_resched();
>  		return 0;
>  	}
> 

This same improvement came naturally from refactoring the entire
function into a proper pagewalk structure:

https://lore.kernel.org/linux-mm/20260922235830.2350770-10-gourry@gourry.net/

this function is really nasty.

~Gregory
