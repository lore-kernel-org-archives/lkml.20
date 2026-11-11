Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408825;
	b=zzvsYdlcS7kHhjQU2x3N7lt0mf4AUAUi1Vv94gEXptJNtRyPMtkezU8u040yRtyiw5il
	 4NrMo7EbfA6b5AErqRzUyAuGP0lDL5ki4aEMQbxApFr9YfTlU5lnuqCbRz7+3l0DEONrq
	 tn6b0i8XrF+28sngekDpfB7D6gdp9VTAQYi95GdvFopcFELA9ZV4QSnNz1kgcw+hJNnVL
	 SaMc6PzsArrpY0cQoBl3Cs2J/Ni9AVgNwBL+7oh+iHieTSla5mvPFF/UaLMCuPhU2rZrt
	 Nrys+aQKDr3R+NDlxSpHXkhp4cknYBG8eiYoW2sw2QftLG/TqrFCgxAnPZ/5pt4Mg0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b4sM8p1tTNaPGayyybeEyqVTJtS8aLvMWjajmNIN9tU=;
	b=AnspGrxApK3h2F0/TwrYgNtvfYnTyL7Y8Pe8o/KQ1hOhPSVdd7EyIuhjKRYS4X1FJLY0
	 +txdMyo+juJykzTvGQLpWl0pJBoufw/I3mEU637jFGe4fFwZ3WAmkB76yYtVol/b0IlnW
	 DQ+v+HeWLu/8yMLN4B3CU/I2u9HgmtEWBCSn2omQi5R681N6izRy3bTvaxtiWoqq3H/QE
	 5hprsXQ/YYVxOqGvGDLpieK0IBTFWXOvVqZ5ALKqXOKUv2e9G/An9eawLYCyQnB9fcslQ
	 /dMPx38WaZVyRjyNlUXDN6R4kU5epVfn8xNzYtoGPYKXkDMNI8FnoqEAw524hGwA0Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVAkSsQi;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BD0606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BD0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVAkSsQi
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso20614565e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408823; x=1795013623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4sM8p1tTNaPGayyybeEyqVTJtS8aLvMWjajmNIN9tU=;
        b=RVAkSsQib3j19dbhqVR2sdcks/BUmd2OjcQ78UjH5NxshfY/v59l98QRVHLW7kw9tX
         A7lJJArWoUN75ymWV+xjbTlxY+K2xPUlG+03KtKh0HFIJppCFMBwbjHGNEHAoBR0eYJF
         fwiS+srpoHXoAuB2gWjjskdF30sgLcrfwFLNhNMnZmcj+g1kPXoEDlkw0nGaCqK5auqM
         G3sH8EiUV6wTBfapH8mfnhzB4IJcoME01/hcBXrxAFEX9M+Fp/0ADjaw3X3HUz/utt9a
         +7A9PeAmLAkuUHBHwqKNaGkZIAGqYqPrxsMpx38QdLZTEiXDjJCDsTa29v4vtAKE+FgS
         UdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408823; x=1795013623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4sM8p1tTNaPGayyybeEyqVTJtS8aLvMWjajmNIN9tU=;
        b=NuCNRNoGzA4+6YYo62tnn8LVV48TbyZfX7O5g0URw+PYvcEJVBIi6OC/1hXxVLcSVg
         noptAsi1jLKBVTHe3tXmGhmXO41vESUTa1Y0QpVpmX6CXvFSrM+YX/p7HyW+p03daHRO
         8SoQoprLLH886cTxP7xQ13opzRZxjv9GSbApezjR1AvZqHlH4Ucbn+cT+7njTKt12iBL
         iibOLuOfAzGwYYA8VJJPyBh/Zaw7wJsjnr/DFZCkYHcRGijeuhYQadEoI6JBNRzLqISq
         wJ89y6gkVjMHX+D34lbGQh9iOA8pzZf0gW7DRNaB26UNlklhaHMnCU5EuP6A+Gv4PLsv
         uWmw==
X-Forwarded-Encrypted: i=1; AL+hErETHTaM1HNFbVav3Osjte4RuAvytRvFVrCQkg7BJkVcsYRBab7HqU9wPX/Wksz+r9axhn9mDX4w3lL5vvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cOM/JB4E2n/BjkmbtYtAmLNzsxMxfmonP5jhzL8qvqlbVPsF/
	KYHFyh4HlbYYFstFVwxDcPIsHj+HZU//sN8zo1h1/1usvtN4GmUw257T
X-Gm-Gg: AYBFou27ZtoCFg+uHaYPMSG+3KtNBZiriqbidQDFxfJ0eCKnUTle51W3NMlW3LRU7TT
	w8cqG9eCTZz1aVG5zoqe00y86DJmUwwjkzp7cm0yazx5oiDYQVrS72bK6d5QAN0hnhS7daWE+Uv
	GLnmqUHHQaieRu0nZ2rwVldHfjpQSuzJj8idCz6WOI0JuasV/gf7l88rkA+h18cJeDJc8j3dSbF
	zT0vC/5GECCk9AMLGPSJDJDaiu941Xn0TCWoij+DvngXDlCViiunhvr+H4N8HpOC3YsnYNYlTrO
	M0BpB4kxAu0t4wxuLHKlWMslp5nI6mqCZY4SFnKSpI9j4xSNGozF6+zwx20FD4LCCwekW0Sp2cE
	JHtpHObJTwDJYZAQbYBkl/bLjau4wT4U+dfeFxzM+Khlca8mXdlBsr/sIIF0bijVFkfPygSHCbj
	2kB/x/TrVARIpa4/SHL3jNtUwQ4WTImKUKDmdW4SfjGJoznFItraLdIR23XGrA9/Jj1mEIPPaLA
	IBjkulrVlQD16b/r6uMCdMdPnBPgWRW9bK90DiJHxruwHsx19Uxf2M8TYnG7cNdCLsj/+y3exMz
	lZfxJ/lK4NjX3cucqCRROYkUD/xJepPQ9aaFj2C7b5dFNFOAn/bGW9bjZaIVTTTKCKAj
X-Received: by 2002:a05:600c:190a:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ba0936c8bfmr47936675e9.7.1794408822864;
        Wed, 11 Nov 2026 06:53:42 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm52895945e9.0.2026.11.11.06.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:53:42 -0800 (PST)
Message-ID: <a987a2f9-0580-4011-bee3-d706b4f41da9@gmail.com>
Date: Wed, 11 Nov 2026 15:53:40 +0100
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
Subject: Re: [PATCH v2 1/3] mm/hugetlb_vmemmap: fix lost HWPoison state during
 optimization
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
 <20261111093747.50048-2-songmuchun@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261111093747.50048-2-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 10:37 AM, Muchun Song wrote:
> HVO copies the vmemmap head page before remapping it to a newly allocated
> backing page. Memory failure can update the old head page after the copy
> but before the remap's TLB invalidation completes:
> 
> CPU 0                            CPU 1
> init_new_hugetlb_folio()
> __hugetlb_vmemmap_optimize_folio()
>    vmemmap_optimize_pte()
>      copy_page(old_head, new_head)
>                                   try_memory_failure_hugetlb()
>                                     get_huge_page_for_hwpoison()
>                                       hugetlb_update_hwpoison(old_head)
>    set_pte_at(..., new_head)
>    flush_tlb_all()
> free_vmemmap_page_list(old_head)
> 
> The raw_hwp_page linked to the old head is then leaked and the folio's
> HWPoison state is lost when the obsolete backing page is freed, allowing
> the poisoned huge page to be allocated later.
> 
> Serialize HVO remapping against HWPoison updates. This ensures that an
> update is either copied to the new vmemmap head page or applied after HVO
> installs the new mapping and completes the TLB flush.
> 
> Fixes: 11aad2631bf7 ("mm/hugetlb_vmemmap: remap head page to newly allocated page")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-18e93f17-529b-4d84-ba44-a41829f4be64

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
