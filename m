Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB834D2EEB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856529; cv=none; b=LW2hbDvamKB/SDi+nFrZ/8b/2+xLX0TvEqvWcUyxhTjy6vjHTUFsCzsCNJTm1LVPLkJrbfoQjqfzWars9+Wv8f6jL4tr93ZypB+N6DlEfpOq3lfrxyLNDTAbVZVfPThAQCQamMxNeMjG+AjXXu5qMzfMd9K03+U+1ja5rcdB0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856529; c=relaxed/simple;
	bh=yb/lqOyr/nZMu11/OYRhUWyuYmFvZ8CIb30pEANJt9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gU5hXZZw7KbaFVmjqsn5uGKEityYQwPxZIsG7hj6IuxS7ZybVMpWSayYc+Vi/Y8Lwq6z/K6EL71vz2dmFbX/ZeFMVYE7eJD3h2sE3+0C8yyUcZcxyQKj1P0GS8cRrqbgjPjM53bcTbPcc+kCr3J91eO+QMWTPmQd9/kXebqcRAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=izNM/KdE; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="izNM/KdE"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e50a650a0so11872085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787856526; x=1788461326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGoSq2TdAc7iekoqeJsQuM/rBlzw2s8Vqw8atuDxr34=;
        b=izNM/KdEbnQTVpMy06rpfIO8M9zgLY5SwWQOrkSN45JMsAHmb0OZQYEf96X1uUOfqH
         TNv/vqSeK3DehoneP2IsHyIbHZlN/L7Uo/Kbo9wNsl/2F1FXSeem23BNT1h7dGYpFnJU
         mR7sFRPgwnbr1ikQcfcdalrqc4jKC852KOZ2cAA+DlmD/lDefnK+mWS6UvjqXUAs5bB9
         jGz50dzk7YBWq/MI9mTZfmg1ETC1rWLLt9aXqOwXlBfplp5xqT8drpMqJC5xOxM0IS5W
         YZ5G0bJvvQHNZfYBD7GRYo1Ax+pHGv8Q5Es2j7UKyMuV51gAG9z/yBv/4RzWQph9n88V
         y8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856526; x=1788461326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGoSq2TdAc7iekoqeJsQuM/rBlzw2s8Vqw8atuDxr34=;
        b=U8/xrdOSQbYXtwRynJKB7iwCu0waE1+7uwMpj/PuIqviX/0q3Oi70jjw5IkRYWIEmF
         POsd/Mw6zT17TwDfr3YGF/GuQGzAr7y9jm7K29JZRyNycRcm6jzy4dyTRTO5LpDVXCA3
         YgUp7WH8iDGoo4dzzR3GHVRdd2myOxKc15jYtrVPp9r7Dpjkj1P5ZBH1UpLTrEtEr94U
         +ADDSbW3oNMlVMoahgEKtYN1pdbGeJOSauJW/olenn6ZWkD8hnAtnVcWCfCJIFeMOcSe
         Rg+mHYglSLZpTLz8qwRFlbmxsfe8yHQmREpPTd0+vFNwioO9FUYEXnaWGu+c+hFZd3w8
         Ot/w==
X-Forwarded-Encrypted: i=1; AHgh+RrhGGjepV6y9+kB40TjK4TnYj2vc9LGSjQ4IaCdjXe6axrZBtxf56ni0IkLOH08/F1y6HNqCMwtR72KIZw=@vger.kernel.org
X-Gm-Message-State: AFuF++nnlkyavXcbCOdblJ0UIsvtFUCw/gFPnyPZnSbBiVz+pkfvbvFn
	qaE5c8Qr1l/XuY6QjpJEoLwnhQ+KnlYDBv3Jc9fQT1mz9woEx49I2b3kHV/PLJuDVX4=
X-Gm-Gg: AR+sD11Aw0ojmnyl6erG3RrZ94ObhC+lT/xjF7qWVq7ca+ir/ZhkHClIHuFdnD0CMkn
	TgoUQtK4igvnUfFFXwxE8as2kHp+ShZ+A4OG291NsmggAx5csPeeHnv2b5fWE2cKyUMUp3TUmfa
	i5yIl9v9hNwLfDOqJF6ZYaLRv/B7JhExg/rNgjL48k/AjOyU2rREUwY8UZkE7nhtdhGbvKHYOLp
	9k23TpXBF9R+jo+53zY/zZ0ODsrVsYpVXSpprjGNsDI/Hhh0XTsRBY5MH9sRW02C3LCi/N01I1D
	FkplBdXKwPlyDT652ZQ09rjqPAbSdwZgk9SqDyFpQnEMscTBxuMzTwKXZqJPvPzSEch90BmF5T0
	hFSSBm39tz17NhYSpTVEc6Ov1Q6FhDv+NhUOmLgby8Y4MRjJASe7YpL5JP7f4rgEicyRZUOL37R
	DKaryESbDdNO9EuUz8Va0DF8N2uI2I/5MbH1/oXLKt1rBwz2fejEF2EW+mg3G06SBQna9qwIt5p
	knGWjcsC37mEYUMSsQWCj5AeuPH2cETdm9ve+5SZ57Q
X-Received: by 2002:a05:620a:478a:b0:939:1459:efb2 with SMTP id af79cd13be357-9391459f1a8mr23802785a.24.1787856526365;
        Thu, 27 Aug 2026 11:48:46 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939137059f0sm26648485a.6.2026.08.27.11.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:48:45 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:48:44 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, 
	jannh@google.com, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, peterx@redhat.com, jgg@ziepe.ca, 
	sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/mempolicy: use vm_normal_folio_pmd() in
 queue_folios_pmd()
Message-ID: <apCGce4hi_8gtyE2@gourry-fedora-PF4VCD3F>
References: <20260821144947.167382-1-gourry@gourry.net>
 <20260821144947.167382-2-gourry@gourry.net>
 <6d855beb-1d24-4a6e-ae62-ac9e05e358e5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d855beb-1d24-4a6e-ae62-ac9e05e358e5@kernel.org>

On Thu, Aug 27, 2026 at 07:05:21PM +0200, David Hildenbrand (Arm) wrote:
> >  	}
> > +	folio = vm_normal_folio_pmd(walk->vma, addr, pmdval);
> > +	if (!folio)
> > +		return
> 
> 
> I think this is best written as:
> 
> folio = vm_normal_folio_pmd(walk->vma, addr, pmdval);
> if (!folio) {
> 	if (is_huge_zero_pmd(pmdval)) {
> 		walk->action = ACTION_CONTINUE;
> 		return;
> 	}
> 	return;
> }
> That way we minimize checks on the expected path.
> 

Sure, i'll spin a v2

> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 

Thanks!

~Gregory
