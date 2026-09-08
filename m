Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDABA3537CD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840685; cv=none; b=mJuneIZTqk6VQIB0SBbBVEH+46xnzWA76cuIdCvNlIlE8qZosesNCSI3a99QXm8x7qQqYLryp4PldNmpnCJ6F+hHwolFLG27+GfK+lr7zqLSJ6w4263bNjq6kpV50c6t5IRBe80p8CIJGuBogCYro7gFlzCqawvzION7IMBfWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840685; c=relaxed/simple;
	bh=sqNyn1Z+ZQ+b8tLzzcSh+t9423tl6ZqJ3teD5MJ6sB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0ieIS9N7+KOBecUgXt45iajDllE5q2+MrWJTaXA8aCwEuKDGtN22qPC2lYLW5mReE2MRDJSRSGWnWK+YY1uhZXbrZbAzvhCLrCvAV6sABbvbp5Wqdqj1Ai+Ymyu1sIMKsk8gMBHt/nT5tvnvpRNVOA6d4tk2zywPltHEKr+wpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m70lSacZ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m70lSacZ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso4289075a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788840683; x=1789445483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k3IBDytwN2H/xXV0TEBFachD5Go/E9+5M3oIjuDOU/c=;
        b=m70lSacZjBpp9rdTgF86VcVrxWCHSOa11nzhLQM4bHUTFwG/GfEMArbDK97Y0Ku2CW
         2Y+UIO/OHcolVcVm1n0QiOespv/DKhgtpOFJug4QqtvFbqxqdQHymepNPBIec0kKuzK1
         16AjSZ/KcPPS4lOmIEeTFL/C1cNCPF0YtsNUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788840683; x=1789445483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3IBDytwN2H/xXV0TEBFachD5Go/E9+5M3oIjuDOU/c=;
        b=A8NHbe44EgY0OqQeYPfAB2CWYKyOl5hiRGKSrCFHhy7C4AbeV1VgwWqbEBtVgq3A+v
         Q2y7z8Zhru9fhsyT82xarn9MHzAWUhRoxn2M1I2ui01/1aamcLn6qT56NxVVg2uxugav
         dK3bV55EzDdqSnecB79CrY/Vs/xT/2Kp+/n8eDZTH01eJTOebdHU+/imr23hnES9EH5L
         WcW1XiMI2FK9bsnlFfH/VmY54qQS/HC4Nh7fg7nmblOjO6hZYPnLfY6SrTvNelQoIS3+
         RAfRrGXGdwuEoRUdUeISHA5/JJHvQkGeMsCcICiMO450JTnI6+1UhffQ26H/mrmK191t
         qVZA==
X-Forwarded-Encrypted: i=1; AKwUvBwUJ3mPSNdL08vT8VTRdIhpWUnnWJFJVcUqDPJdBdjjKy7Ka65APHKzCYBrYi8e74ETQ5EJTCFN6qHY8GA=@vger.kernel.org
X-Gm-Message-State: AFuF++npry9fryRgIpfmEu0hvzhSTbprj036nY7hqHwcKmOrgqCXSO09
	KLCwM4ciopycBffFMU+2Hvf96pUwU83WH3EhNGvbI3v2tj3Lu0cXR19d18k0KHmGww==
X-Gm-Gg: AYBFou1hCSEFFdcPsO7yX7RPg9AxSzksp8+YLk9JkiFRyZBS5ePHU8Ps0A/a6vn9085
	SbwqkkWlaT826pcCEhK8Nn6b4Fz9kNtFz2fZXKyqrwhWv99TdnRNWBzfeVKuB9eMTiLbOCt1tE/
	j9VYWbXZKcR39mDDrG3MkfpaL79LGeK9R3jArDDM40faBFLfKnajL3XtHGAY48rxC0PszmFtNKP
	9U5Cw0uR6GohoB5tI1L/K4ckk/j1wwgXRbO3RGV8PFtD9lqxLED45KQPc7QZYTvzbu1aMycYR3q
	/cIPbhdMPrObhjed577XSHXmJJawVir3XD6dtkX8YPHyL325O4zgHlZgpVQ33I2930B2xNkIWzM
	8HQHVwSSo6dWCqVxDf9wh8mEpEaxxoFvmhiqqb9Px052znwfDh0D4jnD/Lo0pmtmylx6fHIylf+
	jVHLx4hpoZaI9kydlfO3I1yuzo5BOcaBK0UE6iyA4Y8BJS8EtWKh9zR0mg5rQ5b2j3ZAlSZO6OV
	kb/1lWCY63bmMYAUZSG6XbVl2CV
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr39121529a91.18.1788840682937;
        Mon, 07 Sep 2026 21:11:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:56ed:100b:a906:b2eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b3312f9a8sm21325570a91.2.2026.09.07.21.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 21:11:22 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:11:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v3 01/14] mm/zsmalloc: replace PG_private with pointer
 comparison
Message-ID: <ap-Kx9qjJX2ElrSw@google.com>
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-1-6ae22f9d9272@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-remove-pg_private-v3-1-6ae22f9d9272@nvidia.com>

On (26/09/07 22:56), Zi Yan wrote:
> zsmalloc uses PG_private to indicate first zpdesc in a zspage chain. It is
> equivalent to check zpdesc == zspage->first_zpdesc. Replace
> is_first_zpdesc() with zpdesc == zspage->first_zpdesc in obj_allocated().
> 
> For get_first_zpdesc(), first_zpdesc is from zspage->first_zpdesc, so
> replace is_first_zpdesc() with first_zpdesc->zspage == zspage, the second
> requirement of a zspage chain, where all zpdescs point to the same zspage.
> 
> is_first_zpdesc(), is only used in VM_BUG_ON_PAGE(), so performance impact
> should be negligible. While at it, change VM_BUG_ON() to
> VM_WARN_ON_ONCE_PAGE().
> 
> It prepares for a future commit that remove PG_private.
> 
> No functional change intended.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Codex:gpt-5
> To: Minchan Kim <minchan@kernel.org>
> To: Sergey Senozhatsky <senozhatsky@chromium.org>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
