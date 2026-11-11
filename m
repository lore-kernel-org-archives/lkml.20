Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408981;
	b=Et2CllPe8FG7T4oOWdlvvrZ/oFgDycWj6MzloOd1adbwEKEc5mCoNazNl0wgh7jC9X24
	 BZ6AXYw37dGZOgoenX9LbG1geJLxyJvlqpZJdQpWu2j87i6b5Y1MQCpmW1Rmi5zQDrTbC
	 S5snzWl0I0TAHOJmXrb2nAh+PGxP+33cSleES9O0KdMxhI88qWsV2ZHcyPkIwDMm0O5ZN
	 yCcqFLJiJGwB/kr5jS5AYVtozi+7znpxgUv9R0eTY2DuXvwMTdQYjMdx1Ek1i7bQhSi4H
	 BVIjc5fOaVX2vbUGE/ZleZ7EAgkesaXK6rM/AUSr+/mNGvcc5uimEsUjwWvo4/oVarQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MYyJqKHKy98cz/KTExGNTJetx9UGJc+W2b5O0OHZLt4=;
	b=YUkNrg8S/SMXQPvSXNR7XURpz85K4ad+T6U5QeIC00tF3OvmhcDuqfpyHxltLVlIHu80
	 X619cQsyCW+uLutQfS5htp4EDI5vMJl8vn91dNZYEjGzJHLHJZWdxnH2Q5RniIt0dcIus
	 5fy2//hoNThxLewHOcbelDEpfMfg5fgwZgGV0fBoT+be0iynSM5RsqX51KV01/TiOKVn6
	 jiejvGmK0o753miqMDodmh8VCixZLpCtb41+l/2BF5dS5aCvzdPIvILKpy9T2znbWMSKH
	 y27PtoE5pnLUa9TwKJE1tPJ0OqwDK7YCPDlyxtr5+JPYIvQDL7tkUoGmMnYM+F2LbKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGF+OwVA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E0A606A881
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E0A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGF+OwVA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso25199905e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408979; x=1795013779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYyJqKHKy98cz/KTExGNTJetx9UGJc+W2b5O0OHZLt4=;
        b=DGF+OwVABMpS2xBu0T6d07x5i1sBBDP4m4vqxkjoTgsPNkT6n/XAuf+zDy/mIAUflx
         rAPxgMuj4EnkAwQ8/8tf3gVR1qZbiU++2jcYfsxcdZK01Fh5djQJBAmVN6ZwG4IJGTnr
         Kmuu9zqea6V+UlVcuO6zyTF4ULlXDYPWg3fjcyC1mixriL+3y6i2G+2aRQ362m2FsNi+
         yDMdOY0eixVhT2ZS+PmgQb361VHkqTWTzElyYXLrVNCk0hsSVjli9CWLj+9yn8mV2Bhg
         g9i5EpUBL3zIB0POGK7O76WlZnNQIwdXiRpFUPPjjtKz4dWkH4dkHJMfLAtLLPr8UZ27
         VxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408979; x=1795013779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYyJqKHKy98cz/KTExGNTJetx9UGJc+W2b5O0OHZLt4=;
        b=kHHLUo5aTnX0Z/3T+Qod7UrDfsW0L8erSrntTc32ElpIV/x7NGyf0tqfhfUKmrPKQF
         SYhdt77ZF45k+MXzRSYoOiwItDjoDGle+Li3O02XQzHVF1rkngx3wto1qgBLIrh+Pl+q
         /XcHUh+XlHj7uKhX7MH6kJIzfe6bRAor20AsYMCFqPbnFxnhtWFARru0Zx2u+EzPFMzQ
         0z8uoTKvo1bhaba28zL74sUwHvBxYInnKElfSJbE9Uns5XIQp/p98Q5sAwlhdg9a81p9
         JzJDtzSCVRSCJFNVNZVPSoMH/JXuEbUzqZamZM4cfhNpzVECeq+AkNlq4zJUydHMPXe8
         w09A==
X-Forwarded-Encrypted: i=1; AL+hErGp5FvsYu1MM182Pme0daRP7m6qu3G3L76ufXGdlUKK6bFjn8RlNfhApJ4CvADRoxDXZ84lt0PHjWhGmqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AO8PwFx2GyTBNHxUDHigB8Z7Aiy0z9fLO2Knp6R4CaQDOyBEj
	lNDd0uc3YIYjTxDQ9TlQa6r/xIffeh1BfsHPOlZ3y6gIewNyL+tNdyIF
X-Gm-Gg: AYBFou3sDe7ohDDd9C9ZdtrEwMTG+7RRc78iugvi2eaueaUUPj3369+jXpV3zKJE/vY
	e4knzIe6+kx6wefa81n4Tw7GRMUyH9VGcj17o++3O9AR4Sxxkt4kKKvz//HXN9EboXssScF0gl+
	PyBMJcDSS8joGfZLdKU0ebJ+0pHhiYdX2OlMhFYBKbgbYHRVgcLjgb44rIx4z7GDwG3ZioQSRLc
	B9UvyFuIjzaEyNOefg6aIkCevseTAWe7RgdnPPuyyzGcydLNeCIEkqP0GSZkh5/V6u3yaK3W3Q/
	UVFW0uerx24USIr0D6/psE3FrZHLiKRxJRPlvuTQsRIWOBdDMwzC4hbyN83KzRZ01D+3fjv+hBD
	ALeibYH3Q80DBNpwoP1U8UZ+xXLzMnYmxQ2PS5lTcytPLJdWceFSppEWXRWM/9y+wiA62jW6WjP
	N5ByMmriLSSLlcQ7rDyMrkBhDwyKwHIG/24T+9F9z+0HHBs1RfcUL9lFSpSG4I6/PnZ/h04B0Cx
	Qb5yE45pe6FzaIA8uTNFkR85znUnO281LstuucjxlJqAAczRGsKoV/NWYN5UjBBM2x/ydsX+7SK
	bwFgD0UJOjcyi0SfgGlhTl+3dJZp7tm2rczI16EWNk5zwJDVmtIqYLPiQ3ANvOnTeFDvIw==
X-Received: by 2002:a05:600c:e558:10b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ba0938e116mr29687345e9.20.1794408978700;
        Wed, 11 Nov 2026 06:56:18 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c554832sm1533175e9.12.2026.11.11.06.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:56:18 -0800 (PST)
Message-ID: <998f89d2-774f-47d3-b6cd-df7bbfbf2b3b@gmail.com>
Date: Wed, 11 Nov 2026 15:56:17 +0100
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
Subject: Re: [PATCH v2 3/3] mm/hugetlb_vmemmap: fix deadlock during PMD split
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
 <20261111093747.50048-4-songmuchun@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261111093747.50048-4-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 10:37 AM, Muchun Song wrote:
> vmemmap_remap_range() currently walks vmemmap page tables under
> init_mm.mmap_lock. If the walk reaches a leaf PMD, vmemmap_split_pmd()
> allocates a PTE table with GFP_KERNEL and can enter direct reclaim:
> 
> hugetlb_vmemmap_optimize_folio()
>    vmemmap_remap_range()
>      mmap_read_lock(&init_mm)  <-- outer read lock
>      ...
>        vmemmap_split_pmd()
>          pte_alloc_one_kernel(&init_mm)  /* GFP_KERNEL */
>            <direct reclaim>
>              ttm_pool_shrinker_scan()
>                ...
>                  change_page_attr_set_clr()
>                    mmap_read_lock(&init_mm)  <-- self-deadlock
> 
> Since commit d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on
> attribute changes to avoid UAF"), reclaim through TTM can enter CPA,
> which also takes init_mm.mmap_lock. If a writer is pending, the nested
> read blocks behind it while the outer read cannot be released, causing a
> self-deadlock.
> 
> HVO walks vmemmap ranges whose intermediate page tables remain present.
> vmemmap_split_pmd() revalidates the PMD under init_mm.page_table_lock
> before installing the PTE table. Use the lockless page-table walker so the
> allocation no longer runs under init_mm.mmap_lock.
> 
> Fixes: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/sashiko-outbox-206969@kernel.org/


LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
