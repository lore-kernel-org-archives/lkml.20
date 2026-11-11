Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408936;
	b=oO+JTgi2+sDoaUNEWxU8l3JvE+r+NLUID5U7B9ROFaBcnqWoZ3p9W+yHmR4oFdKM/Onn
	 e+MJhbnp3h3ptqeToIczheJlhuW7DTstH6KGmfUNys5qFkikxMUnNDJANKLW+H8jYmenP
	 UQeBlzXnR9XdPceYYXIpj9o69Mt4indgwZtINCuLPVqMZ4feeMRfQYB9up0Bj4RqpLcPT
	 OFnE9/68dMJMng8eh4zfiY0Ixboo0VmUNOE/sfSyeoYhDBr43dO8vHch3Xk1sCK7Gwd18
	 8pff4Dz4D9tXgpm9W2cGJLgyTks8yw8JwTov/xzJE9vV/dPQLXHJqUGuTzwVdOxxApw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vXxZNPloblwez8eotIUyzVyml6BygSTK9IEoRgeJrow=;
	b=eUsggWoUAapuDzbYPyHl7ax/vyca9cH6E7UGupFTsJgpJE1WCDSxdPKUHjbV8BIszQNJ
	 p4jZ9/GpZGHFvy5KG1Lo4g3/EHy5hjI/219sOFqc8dfpByf3XzZSRH7Nq4oDEka4tReuJ
	 2Z+0E3gfSxvU5uNxLCufyY+aa1OoUN6jN4Bhslgxz8XTVS9WVpUiPs7CjnrOwfBdJb3Az
	 cSolpy5s3f+elikDb6LX2/654eordWrdT2nD6izpGrCBpEVVK22EMEnsiDu+cIT2GHWX4
	 Pf1C51KW/3t1iZOk/x/7OuFkzqlw6aU2E3Zz9/2nR2GYRkIwljxypzXB7Ij4ZVSBU1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxLhxysO;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAB606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26AAB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxLhxysO
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b467581b98so30029745e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408934; x=1795013734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXxZNPloblwez8eotIUyzVyml6BygSTK9IEoRgeJrow=;
        b=RxLhxysOcaNdcB0XGAEo6B0YeZFM4L1zjSNZgalq3sSFQPok1HrneylAxIwgB+JjVH
         ykeGhbIsoEAbxjsX/+xNyyrEKlqaYFFegHgIYnBLzb1DJHPyoeGT08bFKkuUT337bThC
         oB+8f8PQem5apiluQM2nmt/ksGjsDY9RsVn0ueSKmoh4Uspjk4N3OlwRewgrtgoMMY8X
         eLEQikrs8lhL/A/elJnXgUD8aArfLzROzEWCgXPza+cc1Rubpnw3O6GWo4WU1UJxfhDR
         uw5bdJqTo9mw/d8Ec9BTKelOV7tyAMJnQw0c67Y1UEk3sJskwVMvuratCTzlW3UOpQsR
         dZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408934; x=1795013734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXxZNPloblwez8eotIUyzVyml6BygSTK9IEoRgeJrow=;
        b=OeR8k3v36K11AqM2+w7L50JkT6qSI89/RiBVe8G7/Jl8qu+YgrmOJnRxaJJUt8XQjY
         sKf4zGrk8mmh8CpFMrCvwedMZLtYjpcPyKcRqHpoEufCxb5tx3Yripcqmx10rnMy1mIr
         LcMGJO1z3Dh1QA+q9oix4H1xfT0OHAVM5hsFkzEC9BD+uWBeQYQsHF1AAFG++DsR8SGL
         78YztP+IdAgreZMfJOYJth9E/LloNULs3nnluE4g+e25bM2ck6RkbxEQbyLFO1olFKGX
         6tAn1hXAfSb3YALMVVRZENf0Hy81GCiWnCnN4ntJP/TPAeujgj+xN8wzd0kXKNUeEAn5
         44xQ==
X-Forwarded-Encrypted: i=1; AL+hErGdAlo0ZKq9yN5EIEL7tZ1PMdJ6bg3WzBD4Xa/xlCQD7OF9BIPv2Ftw5kBfIvDryjJAWhp8cxM7Ns9TDmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AMp15KCiqNTIaoVGqb9QnnEO5XRNja+pbaFSerplDAqXjGNY6
	OTqWfMxCIUkH+m2mEfE8+74Q0WwYdHfYWk/FSSQAiwuheLPXH7czLjsY
X-Gm-Gg: AYBFou3gjNnyHtYr8VFiXFY0bzhO86I6aXKHTLDOIvpJKPIIPq+u5JhVuShWRtfJCxP
	uDPxlZJKwRHjfzQ6QaADmfVA05dkc9xfmKQgI6fTDdmDf4eETRxK/MUl23bNanm+EzHunbFy2Z/
	OQq2j5/I+4WsmKNKqb03cUVYcwr5b4tJPHHbkk8JUa4SdGarZZowB451zChiCsU3kTeT1zY9PmF
	ePQm0fvxq5PP0LM+lHMoVbzPHznehNWCzLPxfvVgRyYhUzf+gwmPn82WQB6yYfsKHgNg4hKQUF9
	865WngLq5U4eKCBZFpm8W4sxSdOFIkpuPTcRgNV1gmMsgpLHwrNZ+pmmIKXCwau0JuSFpifZugu
	UwAy19YKL08n5F69sz40w7010wIIbEROQ2MrtGh1+GfGV+T8IdpxAxD9z4prdMjtYq581kKx1ml
	6tV6gVfA8PtDIJcHoLinjzYfCGvzWPMtkd6c3320r8UFQCUFUl/IUq8ffurOCujlRSX/EtM+1M7
	MJKcE7+qAy8hZWy4l7ut0ujivObssLBLnscqnaQyayanjE6eyR4gjx90xAaAySQ/z4THa+2x7b5
	FK39Yz71/iYE0Ssad9QkzuxKDe82FanM3EI7Mj2M0Sd0Gdj08c8a4sv1fgrd01uQbKM5
X-Received: by 2002:a05:600c:4f4a:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ba0938a45bmr58472185e9.14.1794408934448;
        Wed, 11 Nov 2026 06:55:34 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c554832sm1485795e9.12.2026.11.11.06.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:55:34 -0800 (PST)
Message-ID: <5b4c2e29-9c83-458c-a8ab-fc78cb1fc92f@gmail.com>
Date: Wed, 11 Nov 2026 15:55:32 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm/hugetlb_vmemmap: fix PMD split TLB flush race
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Miaohe Lin <linmiaohe@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Sashiko <sashiko-bot@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111093747.50048-1-songmuchun@bytedance.com>
 <20261111093747.50048-3-songmuchun@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261111093747.50048-3-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 10:37 AM, Muchun Song wrote:
> Bulk HVO optimization converts vmemmap PMDs for a list of folios into
> PTE tables before issuing a single global TLB flush. After publishing
> a PTE table, a concurrent single-folio optimization can observe it and
> remap its PTEs before the deferred flush:
> 
> CPU0                             CPU1
> hugetlb_vmemmap_optimize_folios()
>    hugetlb_vmemmap_pteify_folio()
>      vmemmap_split_pmd()
>        pmd_populate_kernel()
>        /* TLB flush deferred */
>                                   hugetlb_vmemmap_optimize_folio()
>                                     vmemmap_pmd_entry()
>                                     /* sees a PTE table */
>                                     vmemmap_optimize_pte()
>                                       set_pte_at()
>    flush_tlb_all()
> 
> Modern MMUs permit overlapping TLB entries with different mapping
> granularities only when they translate to the same physical address. In
> this race, the stale PMD translation still points at the original vmemmap
> backing range while the new PTE can point at a shared or replacement
> vmemmap page for the same virtual address.
> 
> Serialize deferred PMD splitting against PTE remapping with the HVO
> rwsem. Hold it for write across the split-only pteify batch and its TLB
> flush, then downgrade it before remapping the folios' vmemmap pages.
> This guarantees that no PTE remapper can observe a newly split PMD until
> the stale PMD translations have been invalidated.
> 
> Fixes: f4b7e3efaddb ("hugetlb: batch PMD split for bulk vmemmap dedup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-fbdc3410-a4cf-457e-88e6-684380fbadfe


LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
