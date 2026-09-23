Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF99A474258
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199239; cv=none; b=rH6pzbMhj76D8L9xsaD/wUHVY9Xlh7v3BePhnywe5q8By111aVyOUJ0wIfRiQ/S0tIRMIhrjEfLnOruc2xb90yH7BWaEpjkAIL+lZPoFIwjj5kdtVgUPLOPnYU9qtGG1TBmZ8qru1CBdvPi8PMqHRP7ceW9RGidxROpkN6z1nXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199239; c=relaxed/simple;
	bh=Yik2wdS6lGzEWkbUHPjcKpXsUOxZLFjaelNXe4MMfVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q66Srw0Kw5N9MCVRsUp721jSq9ecBBg/WDXYsA9KGG0yJHIsUc5QiVL0hF7cUUS077ukgaCbmYS05oxll86ONnZdHauKr09P/jX08rJsHhtutWeYWknlEy0Nkx+abcjA86weje706yGsrMiKkwylwZhsRLEbgz3+b+WsnQ5Z3mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IJCb8CA7; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="IJCb8CA7"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7e0bcso14286691cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790199236; x=1790804036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqsGonkxLuJTixdtNLZefAY+K0pHqSZLan+XJO0/Hac=;
        b=IJCb8CA79PcnEbBHfL0mKJls6L7Vmj4pWlNClCu5HCc1qed/6l75rRwt9w1vvoun1T
         r2idCVe90TQTfQpet5TRGLYlEuNZeRMPVA4jOxun9cbXmN2SoE5uyRfGrJW3ddDONYeR
         d8DpmpdvFxTuy2nL90H3ghZBPSbgG8WBzeIbgYUEQ7WyehwgRj6h3jVmG3UeIr7NEUW7
         JF7BzSEdKJnY83VDbg4BldGWa5KFMk7KmnA2ePTloyjyrqO6m/YJ8yX4pSt0E+HTIMIk
         9ZdBb7tLAP5+QquEirky0p2EfiOvpQE+UcAo53juO176O/eibGUH2dI7N8B1wgh1+Z6l
         pe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790199236; x=1790804036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqsGonkxLuJTixdtNLZefAY+K0pHqSZLan+XJO0/Hac=;
        b=x+uXbkgsYy0O3WC/fhcp64Na/3RmUlEjTh0HEyKKDmdgGA7vcXhnjWBiYLWMkrtNoV
         +XGxenViUIwFNe+qCZeOAXXpwAaQYHAQlAwIXuD+NrDoKEoEL+K0A9UKw9b02gO0+6CD
         f95M8aawv2bgesNb7vB2Ld5CK0J8e2ez0GPIn49zO1CnGRhh9wqNhBsjYfQr7TFAvXhk
         2eEim1H1IE9bCSZP8coSHfqUQsp8nE3IcTexntQRb734pICIjZBRpFadI1ASreu/d4IS
         RZrO/ycL5xjiK4vhvpj3hoc6yZnhQhjq3S8bduEs/sRQHC5anERL9s2ccq+lnluycz1k
         romw==
X-Forwarded-Encrypted: i=1; AKwUvBzw4UiiffZwYwhjfZCRRu8OmwByz9VxUAcuCAIiI7o0moSQu87DHe/AxoNroQhJyavWj0wMGyHQEthkXTs=@vger.kernel.org
X-Gm-Message-State: AFuF++lkKda3eDBIJvqCYmOPUw9IZmMt3shnt0ehmFhjEsaa1+jlxWft
	5XeyngcWnhEvb4IG2VR0yUn37kwLOXLIHlgHC9NIssbZ2ezPasloYImekkyr+5U1FKk=
X-Gm-Gg: AYBFou0mFQAAPVml9XfstvUSEgL4CDAagXZu7pSwgt+005RLWWIAGhmcKUvx2a59VAh
	ar7eBlWvoMre5N4qLOUl7hlKOOkeE/qDwZSl0+3ZVX/TrW1NGsVEU+wuTaNC31SEn3yz3HsYtB+
	6W4ipWMRtLPRj/neB6uY595TW4/e8VcB5AtyttBSA8LiwHL/JexvkpFWhdhNEaWTA6iDEF3mfNu
	MB9JCne+ogveU/AkZyX2EhO5Bzoz8d7M+WBBEfmGEcGKM76SQrr+jxP573ujZXRQlyfyx1+bjTy
	stgb8v5JXkTxh9g1LTsdhTLBs1wpKLa/G5dlwrw7/uWOVlo3j+hfp/jPFpIsMNZzygJ/Me7T7Ue
	I9ntx3ddL3T7ahviPr8Uvw/eei/nJKDaTPUr2Q8yRLz05UMbIYFaYtenPkvED5l7I5ottYsSOkF
	XcD3smCW93P+RM7nHd/J+bmDy18ixOYSxMwIJUaZr73SReegbi/dj1iel0VFGeWBuz9YGMKqe68
	6HWBhFiFMqoXIHA1zoiPXhXGf6IDfuy7p6CKRDBBD5EK5ZIzkmqVvFy2Lelkv0THg==
X-Received: by 2002:a05:620a:4150:b0:93a:1048:7d2f with SMTP id af79cd13be357-93c345b615cmr75748385a.41.1790199236442;
        Wed, 23 Sep 2026 14:33:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248e22f7sm310457085a.47.2026.09.23.14.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:33:56 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:33:53 -0400
From: Gregory Price <gourry@gourry.net>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v3 2/2] kselftest: mm: fix intermittent failure
 khugepaged test
Message-ID: <arRFsYK6rzmax-4n@gourry-fedora-PF4VCD3F>
References: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
 <20260923-fix_khugepagd_fail-v3-2-b387e92fe1a9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-fix_khugepagd_fail-v3-2-b387e92fe1a9@arm.com>

On Wed, Sep 23, 2026 at 04:29:52PM +0100, Yeoreum Yun wrote:
> There are intermittent failures in collapse_max_ptes_swap() and
> collapse_max_ptes_shared() when using the khugepaged_context:
> 
>   // while running ./khugepaged -s 2
> 
>   # Run test: collapse_max_ptes_shared (khugepaged:anon)
>   # Allocate huge page... OK
>   # Share huge page over fork()... OK
>   # Trigger CoW on page 1023 of 2048... OK
>   # Maybe collapse with max_ptes_shared exceeded.... OK
>   # Trigger CoW on page 1024 of 2048... Fail
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 23)
>   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
>   # Run test: collapse_max_ptes_swap (khugepaged:anon)
>   # Swapout 257 of 2048 pages... OK
>   # Maybe collapse with max_ptes_swap exceeded.... OK
>   # Swapout 256 of 2048 pages... OK
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 17)
>   # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> This happens because khugepaged may collapse the pages before wait_for_scan()
> is called, causing a sanity check that expects uncollapsed pages to fail.
> 
> For example, in collapse_max_ptes_swap(), after faulting the pages back in
> and paging out up to max_ptes_swap pages, khugepaged may collapse them again
> before c->collapse() is called.
> 
> To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
> collapsed by wait_for_scan() for anon. This prevents khugepaged from
> collapsing it again before c->collapse() is called.
> 
> This failure was observed on NVIDIA Spark with 16KB page.
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
