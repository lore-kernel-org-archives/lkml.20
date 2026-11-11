Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416053;
	b=xgn8cNDdIUJvgmZDUfuD7QjaR6QOLe4J4MlVhilcyWOcFpZ92llW2Zk549ctKcs9qn8J
	 TpUtegE5VILbqqTKSkBD8wSg/b3ofkytg9T6tb/F2fj+N6Z2Wed/fVEA/Q5vXiZ+PV+ZA
	 zKpoZfc8Re13A/vbz5HP0GTZSZ95AykTwMFZ7EgrZDENLR85jLeoHZIuvr1kvMJS2fDp9
	 9mp1s4vTN0J7IyTbaKBzlBtnwWm3RsQJSGgb98Wcfei94XbGCS3ZtPLhiMmsctIfhvers
	 E/WFSbe3gLwHVJuCeFhSlhmAezyCLXTy2O97z2dJ+v0VO2RYON+eepftoW46sWvmN0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5ZV0DCoX0z7OhXM84shwRnxOMC/GGm++gJpoqjH6j0k=;
	b=K1ffDHB/8dEdrgdi9+SjYL4VVSHkhgXGvc8JO3pBt5uGEJ09YiAC458bMTXcJfxBb+sh
	 nHYkOXq46FnrZRq4cM95wTbX2xGhJxH1rrz26bPf7ZQuKpxwmHG+AoJ5MO5BkY52OPsAO
	 gi03chjZX3alI5AJEjE46KK9uTh1VQbD+vLiuIbtWPtJgcuUTr3WUYCpUvOGj+JwLsDC4
	 yIs1iLklrztHw7jasrnE9sdcbodu0vk7wPUtUx6NEa2B3WPWGi5LLxLnt07Iu5Hm6Qr3p
	 7+8puGtv21TUtH95W6AtYtJ0nYFa12W/3EYXbQJBzSomamIInTiQ80FgZObgzyyP5zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZyYxBMQ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E843606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E843606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZyYxBMQ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so41071135e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416051; x=1795020851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZV0DCoX0z7OhXM84shwRnxOMC/GGm++gJpoqjH6j0k=;
        b=KZyYxBMQhoqm1v9L3djyJSijLKbDor5uyNbASTNpYJbdkLtxD7qjcG3Zoi41yqp+uT
         gInzPpEzF6WQkVj0PUHegzZUAKvysl9YQ+pJ5cCNEEB6eCzJ3ZFeUceaikXH8g9CX4H/
         ha5nCvktdng6jAimL0rZlaX8ddSuKjVMaxT+hWoL4cHWjlnljjr9V519iI2FWtFpifsT
         C553h8OJcn/ARvsEndJVVOtimgEx6dsn/x3xrGVPBlrwPkDLAANOFnYjiJZxg72tqcVs
         1RRMnZwaqDrYm4nLb5gFiA9lKxapTcRok6FXNteOU5M1y4uyO2wn02OwmKS+aGqmJSvH
         pKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416051; x=1795020851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZV0DCoX0z7OhXM84shwRnxOMC/GGm++gJpoqjH6j0k=;
        b=XAJQ07eVFdHZ3z5h9GanEZOW+W1VTzP0URvtjXRLyLW9GCs8pHPX42JZgAkjhHbqED
         lZZBscZDBiMG3d3vEOFFWlFOHHtBDbDAmbdJrhGsvr+SeH01/wdDrXzIqK2OGGUdkSi9
         1IWe9tLo3ErzjEDT4QDHMh4T0lhPDqM41cNNm6SpyL1yeuqZakxwdJtkjtAlCuqPI2P2
         zl8HesZkKZNZUYZUSkLHSN5qKCF739NnLFtiRRqy/3c1SlhJbzwlMWu9Z6YNQ3CEbiR2
         jv4VtJwL1h0595XK3QdyPcrqcCY/I4VDcdaJqKMBG0YDnUMYc3mApDDl+Vw1E0HRmzjH
         KfqA==
X-Forwarded-Encrypted: i=1; AL+hErGrdnjTnAgVY/9r6jGQPhuuNuDDv9HpO00qvvh5NK8TTXPmsSge6WaTUyteVKqVap3IgJQTvmfdM+PsYLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z843Xf9gMTv2UPecF3iV8Marn/8ozBG/1CxIUNgVF9Sr+pEOFRI
	YyS9aJ63DfiWBApbo5yZmR9FXxamkpV8S87mp2Lqs8v0JGMu65N1ltgb
X-Gm-Gg: AYBFou29EtatYA4/krncJSbmMEph/5QErMdZQxVP1yZx4rBnSrK/bKKIQUPyY0POTV6
	ps+g8gjcFkPEJxnqTVbEK1aK1MPlczmYD8kjuXm2gsLLMN1KORQpFFL1BTOh2FcLu0sVGahHSBR
	SYtJrF3/vE17ha1A1ZrgBjqwDpfI2mkPeqOUywlZug7R7sG1iSK5yToSpqGY/TdKW2/Z+V5rkTs
	r6w714ou3C6J053F+0ylr8IyDZQkqjjiFPUpenyYgbyojGW9K2sp/Phu/e76Ez/NCxaRuNX6s5/
	P9pA3u7ndYZv22LAQkI6jjzJH7/+dc9TczZttbXb7cfvlmwmar5ZggJRmOys7CHOWcopy1ju8Ho
	zUHH8cn25sAoQdBEPlT69vKViWfdLPnVv+cWS5COffghxJkbdcVAH1ZbIgQap1matm7J1DUR8VP
	jqc98AbuwlaoXpk5BD6+mwaQvNFs6VJpKgm425VF/smIRuI99/RhsYwjGeOLq3IOjWzbDABdyzR
	w7OgjBgpvazKQYf5Xc107Y7ZS60/fp1jDzNMArK0cG/z2Q1gJ3Q2iVtd/Wv2st3pdh4UOBzJzJx
	P6AQVKFMZ0fNkkH/Nl6MsiP1B2xz6RmvM65JCYzqQCljQpwcop3K4+WiveTR1RoHNk9Y5r+TAsy
	CwBS+e/cnQlLekQ==
X-Received: by 2002:a05:600c:4e11:b0:4a2:1612:636e with SMTP id 5b1f17b1804b1-4ba0937797dmr51138865e9.5.1794416050686;
        Wed, 11 Nov 2026 08:54:10 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm11523387f8f.39.2026.11.11.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:54:10 -0800 (PST)
Message-ID: <c1b4cd90-ed08-45e0-8e2d-51b52b16c4ca@gmail.com>
Date: Wed, 11 Nov 2026 17:54:08 +0100
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
Subject: Re: [PATCH 2/4] mm: don't report OOM when a huge PMD race blocks a
 pfn insert
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
 <20261111140655.34281-3-farbere@amazon.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261111140655.34281-3-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 3:06 PM, Eliav Farber wrote:
> insert_pfn() maps the PTE with get_locked_pte() and treats a NULL return
> as an allocation failure. pte_offset_map_lock() also returns NULL when
> the PMD is a leaf, which a VM_PFNMAP mapping with both ->fault and
> ->huge_fault can hit: an order-0 fault that passed handle_pte_fault()'s
> pmd_none() check can reach insert_pfn() after a concurrent huge fault
> installed a PMD leaf over the same address. The task then takes a
> VM_FAULT_OOM for a mapping that is perfectly healthy. Changing an mm's
> THP policy while another thread faults the same PMD, for example with
> prctl(PR_SET_THP_DISABLE), is enough to produce the mixed orders.
> 
> Walk to the PMD first and tell the two cases apart: a failed PTE
> allocation stays VM_FAULT_OOM, while a PMD leaf returns VM_FAULT_NOPAGE
> so that the access refaults onto the huge entry.
> 
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>   mm/memory.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 0f54ee0a6d88..b7b89d041f42 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2866,10 +2866,25 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>   	struct mm_struct *mm = vma->vm_mm;
>   	pte_t *pte, entry;
>   	spinlock_t *ptl;
> +	pmd_t *pmd;
>   
> -	pte = get_locked_pte(mm, addr, &ptl);
> -	if (!pte)
> +	pmd = walk_to_pmd(mm, addr);
> +	if (!pmd)
> +		return VM_FAULT_OOM;
> +
> +	pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
> +	if (!pte) {
> +		/*
> +		 * A concurrent ->huge_fault may have installed a PMD leaf over
> +		 * addr, which pte_offset_map_lock() refuses to walk. The
> +		 * mapping is fine, so let the access refault instead of
> +		 * reporting a failed allocation.
> +		 */
> +		if (pmd_trans_huge(pmdp_get_lockless(pmd)))
> +			return VM_FAULT_NOPAGE;

we should split the allocation from the map, which removes the re-read 
and the leaf special case. something like:

	if (pte_alloc(mm, pmd))
                 return VM_FAULT_OOM;

         pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
         if (!pte)
                 return VM_FAULT_NOPAGE;

maybe could work better :)

>   		return VM_FAULT_OOM;
> +	}
> +
>   	entry = ptep_get(pte);
>   	if (!pte_none(entry)) {
>   		if (mkwrite) {


-- 
cheers,
jose a. p-a
