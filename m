Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416096;
	b=hwKhTXquhH8dyAGzTdRx00CJzzfngLgY2uae5hxIDlIwLpJa5ri7jSpa3su8Q1Wg6yTL
	 rl6DXOebqObZFbCqFLg2Z1rmXIFRlVBh8dmm1jByZu6YhlCwegZZUKdJkW3uRGe5kzcJX
	 j+Bp1alzp0WinotPViPzCk431EdySUgw2RTPoO+cuXmtUzEJYkHlCHA5oqrhw0cwgjP6A
	 9sx5Djgg32F5C2Rr7jaTyyXKN+Yh4RZybFOCScU0DEll+psKYtxOUPBvhY0NAL4CJ+7/w
	 P4l7QxWOwW5NMehQ/zhKw7m8IuVTXMkd3MtAqQyeGrG66HYqqf6TgrmG+jIa9LbJbkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bt8vCFJ78PDhrhf1lGPW3TnU1901Xv/Y93kmnDKVKUQ=;
	b=DoaBFChOv2JEcg9BYZHPFdZIrxIBZwrXEEa9KGL8JB5dtPa4SYOP3D2Ox0DmhoNrVMC3
	 LOkZQU9QhBUtQGCJybz5oVjEhIcMIaWBQOlZlqYUmz+Q2F5cL5OCcgnWqF78YrmhDOT5S
	 +cGiOilCpVB0Oic9sblGUoM6TKFG/0b1MHpdJfoYCkAX2nR5Ud9YNxEIqZerMh0gfLvqx
	 RF0a6R137kksG1Lf/kavj86RNvaUWRMz6zbRIY6vkyP9B77ctbW6FdMp+3Aaj5w2itIMZ
	 WVWV/lauR1psYSCoexEs6N+GVHKEIpAqZfjljpQubhT6pvKqd9+PyZrCiYHdWbTRFag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6gIDP2b;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F56606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6gIDP2b
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so2588365f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416093; x=1795020893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bt8vCFJ78PDhrhf1lGPW3TnU1901Xv/Y93kmnDKVKUQ=;
        b=h6gIDP2bR+ndlNlwUwFpPDjipDxEkAuXkZD9KDzYyZtK+jMT0/14OlPfSDDCII9gkf
         T/npnVs1hBlBRLClggxVNz/TpCnqBuggKdShsruFOMJy5Xfhkc4vK7nu5VVzQG/t37ky
         eFqk+RuWxtsTTmBYlkP5aLwkqzfG/teu/Ak+b52DMtWI3DVp5vZBOvBYA+r0Lo+N+TqF
         escboYZcbAGqtcR/C0gnLiRM23j49eM/bVrkNUuLd71A8KfZnGRKBp6Omsth9qTZIUHG
         71kzS+DA0tW78FwUUavB0ifqnihUzBe1w5QzCloPMXTq80dfwopu8wPrNHe7WZdfmb1a
         wVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416093; x=1795020893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt8vCFJ78PDhrhf1lGPW3TnU1901Xv/Y93kmnDKVKUQ=;
        b=HBe7yhKpoEvWiEro8NLpuVawdnWjD8LZDddDeKMLmNeKz+m0OlwylgbaTx3NqgNaR8
         /aLwks5FGMkOYwyOWZ+Ar9MI6BfkM55BZeEdE/4CrsI9m0vE/mXpolMVOFMtB/enKLOJ
         0sIlF7m38IvI2lpVuVpFjJgTAnkRDk9bFU3bE15zk+g3zA8m6R58UYTMhX9zNUZEbmeo
         PjCZLe1ztJ1YWvxzwpUUbBJ3P8iUN3Uru/I0oo9hk0gZRXmZYF3w3wXxNmozytNPXDyK
         dswkSbqnDTlNKgxJfvfbBa+CfL7XJm7Fa6/Bb/Y6G94nisTvs1CUHg85sqwpOA7a/lrw
         Jllw==
X-Forwarded-Encrypted: i=1; AL+hErFqBLFSmDoLhuD8Ax++9emFOT329w8Jg3KDKT+g/tlWrQYW2LG5Gnr7hyi1+5B3x3wXpg/YBZVHqUIdp8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z83qzE4MlL0eBAqwV1Ojx4Gk52u3S3wtjMC7fbWMxkSuQY6NkTY
	iYvsNWx7i+yqgy4Bzzq5rz311LtOsLZ+Liys5EmjyF94MzLMUc8T3e0Q
X-Gm-Gg: AYBFou2k7r8E7DNXxwxhveHOLDLrl6W0cusi4OAcSKwWsqHuu5n0oPPqRwAIcx1a+A1
	dtK57CC0l0kT8mqcpds52EkQ9BuueBGIU5y2nMFE38QJDtiy3u1p3bhmkKQP71BYyGEtSAl2ym0
	Xrb/3blkcSZxA0caWs166+Q7AxFPpo+5RCQD87S+pPtP8xajGmwJQUIrKMNY8zZhkPUv2ZXVcN8
	Goal1ef7O6h2nEBBXVAb+TZ6iUOYlMHtM3V5dYlCGKGPgPn+EA3zJ2Th3lDNNST/zV5THY8PDQR
	1gFFaOKbFkCHzJaHyAjZCQmRiSv4EsC70LvQf4LSFE89ykXehYWRxDk75l2mA7AtI9MowUXjX+9
	5aWvpVIprD+yJxRHZUvjyildC/lLXMJQrB8Qxv308EaGgrDPlUkzUhSkbjc6eyn69S/x7Jgrfqt
	WcF/E6nTpde3DUbxFlx1QpRBiH9EY/dAwjp62O/EAx/3AoAz/T22Ywx8S0PPUU5cirIL2rSPEvq
	0oXcGrN585Y6AaNtyg/g8na0/W/NJ+u4X/EL/H+y5ukdTgsI3ykOFWHyyj4R1JNmXgv+PMOxIqY
	WWeBUJqdE5mgHrfxNxfFAiLkxXexl9KNJ7/HfuuhdflcJYI1Dmoq7AX+7ybx12jA8HlWLEuOseX
	8eG/OMN4ihHzE9g==
X-Received: by 2002:a05:6000:490a:b0:48b:a4b:5a2c with SMTP id ffacd0b85a97d-499c5783a79mr5463489f8f.3.1794416093393;
        Wed, 11 Nov 2026 08:54:53 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c835fcsm11451395f8f.59.2026.11.11.08.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:54:52 -0800 (PST)
Message-ID: <8c221ebf-ccc0-4541-bdc7-ae216d149dae@gmail.com>
Date: Wed, 11 Nov 2026 17:54:50 +0100
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
Subject: Re: [PATCH 4/4] mm/huge_memory: use the large-page PAT encoding for
 huge pfn mappings
To: Eliav Farber <farbere@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, William Kucharski <william.kucharski@linux.dev>,
 Vishal Moola <vishal.moola@gmail.com>, Alex Williamson <alex@shazbot.org>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261111140655.34281-1-farbere@amazon.com>
 <20261111140655.34281-5-farbere@amazon.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261111140655.34281-5-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 3:06 PM, Eliav Farber wrote:
> insert_pmd() and insert_pud() build the entry from the pgprot that
> vmf_insert_pfn_pmd()/_pud() took from vma->vm_page_prot and passed
> through pfnmap_setup_cachemode_pfn(). That pgprot carries the PTE-level
> cache mode encoding, but x86 keeps the high PAT bit at bit 7 for a PTE
> (_PAGE_BIT_PAT) and at bit 12 for a PMD or PUD (_PAGE_BIT_PAT_LARGE),
> where bit 7 is _PAGE_PSE.
> 
> A memtype that needs that bit, write-through or write-protected, loses
> it: the cache mode index of the huge entry drops from 4-7 to 0-3, so a
> write-through range is mapped write-back. The other x86 paths that build

here contradicts the cover letter, shouldn't it say the same as the 
cover letter since its the one right?

> a large entry from a PTE pgprot convert it first, see populate_pmd() and
> populate_pud().
> 
> Convert in the two huge pfn paths. Add a generic pgprot_4k_2_large()
> that returns its argument unchanged, so that only architectures which
> encode the levels differently have to define it, and x86's existing
> definition is picked up.
> 
> The folio paths keep using vma->vm_page_prot as is. They map
> struct-page-backed memory, which x86 maps write-back.
> 
> Fixes: 6857be5fecae ("mm: introduce ARCH_SUPPORTS_HUGE_PFNMAP and special bits to pmd/pud")

I think that 5cad465d7fa6 ("mm: add vmf_insert_pfn_pmd()") would fit 
better, IMHO.

> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>   arch/x86/include/asm/pgtable_types.h | 2 ++
>   include/linux/pgtable.h              | 9 +++++++++
>   mm/huge_memory.c                     | 4 ++--
>   3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
> index b1a669e775f4..b1ffd72e47ef 100644
> --- a/arch/x86/include/asm/pgtable_types.h
> +++ b/arch/x86/include/asm/pgtable_types.h
> @@ -497,6 +497,8 @@ static inline pgprotval_t protval_4k_2_large(pgprotval_t val)
>   	return (val & ~(_PAGE_PAT | _PAGE_PAT_LARGE)) |
>   		((val & _PAGE_PAT) << (_PAGE_BIT_PAT_LARGE - _PAGE_BIT_PAT));
>   }
> +
> +#define pgprot_4k_2_large pgprot_4k_2_large
>   static inline pgprot_t pgprot_4k_2_large(pgprot_t pgprot)
>   {
>   	return __pgprot(protval_4k_2_large(pgprot_val(pgprot)));
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 780fe849ff8b..112814d31f0c 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1787,6 +1787,15 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end);
>   #define pgprot_mhp(prot)	(prot)
>   #endif
>   
> +/*
> + * Convert a pgprot built for a PTE so that it can be used in a PMD or PUD
> + * entry. Only needed on architectures that encode attributes differently
> + * between the levels; elsewhere the pgprot is used as is.
> + */
> +#ifndef pgprot_4k_2_large
> +#define pgprot_4k_2_large(prot)	(prot)
> +#endif
> +
>   #ifdef CONFIG_MMU
>   #ifndef pgprot_modify
>   #define pgprot_modify pgprot_modify
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 052c50dadc48..945d480c1512 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1675,7 +1675,7 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
>   		}
>   	} else {
> -		entry = pmd_mkhuge(pfn_pmd(fop.pfn, prot));
> +		entry = pmd_mkhuge(pfn_pmd(fop.pfn, pgprot_4k_2_large(prot)));
>   		entry = pmd_mkspecial(entry);
>   	}
>   	if (write) {
> @@ -1804,7 +1804,7 @@ static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
>   		folio_add_file_rmap_pud(fop.folio, &fop.folio->page, vma);
>   		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PUD_NR);
>   	} else {
> -		entry = pud_mkhuge(pfn_pud(fop.pfn, prot));
> +		entry = pud_mkhuge(pfn_pud(fop.pfn, pgprot_4k_2_large(prot)));
>   		entry = pud_mkspecial(entry);
>   	}
>   	if (write) {

the code LGTM in general.

-- 
cheers,
jose a. p-a
