Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956665;
	b=zY17DuqNY0d01F2ixrfchWjNkSTMGs2rk6RQNVxzXVPkes+TYOUDodgUe+hb2cjYX5lM
	 zy/APbPt8ypchEVbAlIyGWjc4cj4HIrkuX1SFJRswSuVG6SkEu2xxEgaLEAKbOj7J4BZh
	 cwsM2s8ZP/MxooY/Ge57FRPg4TuHQLqFohwmflN3RbDONaX4hQ16i2qv2oBFzsBnjm6k0
	 VYYFb1NeBw2J3MsvzUQBgLkrGBBBjd4T0L9NOryfvexnJq8XmY7Xw4Z+TwdJtdSb0yL0H
	 mAXNlq7B9JwYTAiX8OKwJg536XXQWS1n8dRSUfjvIDDufEbDrNodafvlmPpXnNuK9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3lZs2t3RdAh121bV6KLfZWS6NNsz2CCdWLiSMi78P+M=;
	b=SNWt+BtcbQwAEx+LEKBqXm6JP6CEFInaygzm+qGzQ1+NISn45ez0+4Hqf9coOlLS9wao
	 ZlHiDaT5g4qvu8FeUsqZjW2lbNg3/kzAZxOz4wCFwgogbdTrO4NlWIITi/G06NecZHglR
	 agBDBuzG5osBK1mNMuxczFJ0cejf9m7iDJY7fq6tjace/a4mABWZvXo/Bjo8q0SfgbFgo
	 95tqxCf/wdcXfZuGqueBBdvYgow5v7Y60FGfCJCUrh023lC6Fj3gSRfkgqWhStDWh9hTN
	 uIogsVPrDmFhnITXUXq0Dvxdg4xnqhpSl/PRLwal6oPWvsjVs6Sv9DQqZvLHIKnAwag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYEEAmBG;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A00606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYEEAmBG
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3468855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956664; x=1794561464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lZs2t3RdAh121bV6KLfZWS6NNsz2CCdWLiSMi78P+M=;
        b=oYEEAmBGy2rgOvZyXDwUo+LWyi+27YAseIYvBNX8B6WjgBxqoC1WtEqRdGH+lRSJ3i
         L+TO47TCHo5oLqr8U/OwKDCCMWht9mqpyZx6H8UhyDyZr5sBDDJCTv1YW/3iCnPW+MgH
         QIfy9S2EoYLs70/PXZi8sn1hbqITP4fF4ZEdYSOGE2Dx6okT5Hfw6lsiBurNfYbEA7v1
         pbInduVtFsi+uehn6vU3/5jDPHUw5qwUoKXy82KScrrIzlrItLVkVYq8HgLekjttBbe5
         R1XzktyUjc9bVIEB4Dly1IKiUKnFGRAiNkn1JywcwTXng2AAbeJh5+Sw0/ZOIcL3CLmq
         eZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956664; x=1794561464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lZs2t3RdAh121bV6KLfZWS6NNsz2CCdWLiSMi78P+M=;
        b=kFqJnACTMAHnqpfo/gJD9/e1pzNJhMt9/TPIwwRg57e4vuwqM2X8wXfdPRCDzerKfL
         1dmVy0WMsBr9XsfMNibOkRup1qLKRTh3lCBRXuvE5EB9/RnuU5f2WYnrBeXcK4oc6I7L
         cvLK51gJF52yX+k7328WwCdSovIvLKMVOL61jE5faErids4XO9HOvoK7RNOn9ZT1D3Mf
         SMEqNLqpnFp8QrzUTMFN4ZxWTSmwh/sASN+J6RaGF8MjRsIAHR296dvHqVaVFyJixbrN
         VhxJ99JU36qR7rbqIA+kGEWdhrDW4P87hSdJhXNEfyljyjqHuohVDflLRRG3Y8QK9u/O
         KseA==
X-Forwarded-Encrypted: i=1; AKwUvBz2j6YsQ9rODt/q1OvPJXumwGqhDIe6hqOCcuSqo4f0y6oMXGkoP44lxrC73lzJ0kutTzS4tZJRbBacqPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8psw/L/t2LPwPKKz3e289aFy3hYVHTkRfvVQA4xAZkogeF8Dwt
	q157zNVHBagWI7q/TtktM7c8E3eZG/C36lO0qHxC3dXBOq5a9XQeZ0BZ
X-Gm-Gg: AYBFou35yR8pbOONV8ezwlxS5Pk3epKda9u+v3DATeXAAftiVgVFYg8l5mBmxCaDcaD
	50532XjnY5ww0UF6crFQSkcwjEskOdB2WhrqWZ33EdbtF1GG0HoOmC5dIAyTIwl/TsECe8uh3k9
	SaYeF1X3vIUduAjxomzK9zH76qyTcBuxR0ODIb/Vt9xBhw5MILj/bk1U1DdQ5+z/GSk43tpMTwf
	i8G4uXhPhqEGim0mJW9/ZG+OczpItWjn2bIVRtZbVgtcDiQPg+/4FmOsJ2t5BunTIiVB73plKPr
	P2NlENpBELCAm2QXGhqj1syo6ymWsiaza2E00uKTv5e9Grz7YdOm/98j4PTRqmGKDBsg8N3+UQt
	dEjSYNH79HqquHFa1/L73TjZxrxaAywFEngRROQQMFqzi5V/qi+L9h0QkF5dbmh7+SpDu0dCT0C
	4PekFGxCl3o97I+zix1YpGmVTKwTVSQQ8VFBI+8WYcbLLqy5azF5hgUX3H8W0BdYJ/vk2OA2YF1
	lEoykgwefp8S0kz/8KNeGkDEaROImk0jdeokd9Fip73zPvmMMEbJoKDlquVfggpNHERMjNbpbvc
	ZA4RoNIud9llkys4R1HHy7H7
X-Received: by 2002:a05:600c:630c:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4b6d82b1267mr27236735e9.0.1793956663346;
        Fri, 06 Nov 2026 01:17:43 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d745sm40066605e9.6.2026.11.06.01.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:17:42 -0800 (PST)
Message-ID: <9c162e77-df9b-4d91-ac3b-17a3b1a3da8a@gmail.com>
Date: Fri, 6 Nov 2026 10:17:41 +0100
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
Subject: Re: [PATCH] kho: fix restore order for NUMA-split preservations
To: Mukesh Pilaniya <mpilaniy@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
 Samiullah Khawaja <skhawaja@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261105-kho-numa-v1-1-e807879644cc@redhat.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105-kho-numa-v1-1-e807879644cc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 2:21 PM, Mukesh Pilaniya wrote:
> kho_preserve_pages() uses __kho_preserve_pages_order() to reduce the
> order of a preservation so that it does not span multiple NUMA nodes.
> kho_restore_pages() does not use that helper; it recomputes the order
> from the pfn alignment and the remaining length only.
> 
> When a preservation was split at a NUMA boundary, restore picks a larger
> order than preserve did and jumps over the next key. Those pages never
> get restored: they stay memblock-reserved and keep the KHOP magic in
> page->private, while kho_restore_pages() returns success for the pages
> that were restored. The consumer has no way to notice that part of its
> buffer was not restored.
> 
> Fix this by reading the order from the key being restored. The order is
> already stored in page->private by kho_preserved_memory_reserve() and is
> validated by kho_restore_page(). Advance by that order instead of
> recomputing it. This also keeps restore independent of the incoming
> kernel's NUMA topology.
> 
> Example: QEMU is started with two NUMA nodes:
> 
>   node0: [0x40000000, 0xC0400000)   2052 MiB
>   node1: [0xC0400000, 0x1C0000000)  4092 MiB
> 
> The module preserves [0xC0000000, 0xC0800000) (8 MiB, 2048 pages). The
> range is 8 MiB aligned and the node boundary sits exactly 4 MiB into it, so
> preserve emits two order-10 keys, the first at 0xC0000000 and the second at
> 0xC0400000. Restore computes order 11 for the first page, restores the
> first key and jumps straight to the end of the range, skipping the second
> key.
> 
> Fixes: 91e74fa8b1bc ("kho: make sure preservations do not span multiple NUMA nodes")
> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
> ---
>  kernel/liveupdate/kexec_handover.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe3181..7d30ad9cc512 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -511,7 +511,8 @@ static void kho_init_folio(struct page *page, unsigned int order)
>  		prep_compound_page(page, order);
>  }
>  
> -static struct page *kho_restore_page(phys_addr_t phys, bool is_folio)
> +static struct page *kho_restore_page(phys_addr_t phys, bool is_folio,
> +				     unsigned int *order)
>  {
>  	struct page *page = pfn_to_online_page(PHYS_PFN(phys));
>  	unsigned long nr_pages;
> @@ -530,6 +531,9 @@ static struct page *kho_restore_page(phys_addr_t phys, bool is_folio)
>  		return NULL;
>  	nr_pages = (1 << info.order);
>  
> +	if (order)
> +		*order = info.order;
> +
>  	/* Clear private to make sure later restores on this page error out. */
>  	page->private = 0;
>  
> @@ -550,7 +554,7 @@ static struct page *kho_restore_page(phys_addr_t phys, bool is_folio)
>   */
>  struct folio *kho_restore_folio(phys_addr_t phys)
>  {
> -	struct page *page = kho_restore_page(phys, true);
> +	struct page *page = kho_restore_page(phys, true, NULL);
>  
>  	return page ? page_folio(page) : NULL;
>  }
> @@ -573,13 +577,13 @@ struct page *kho_restore_pages(phys_addr_t phys, unsigned long nr_pages)
>  	unsigned long pfn = start_pfn;
>  
>  	while (pfn < end_pfn) {
> -		const unsigned int order =
> -			min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
> -		struct page *page = kho_restore_page(PFN_PHYS(pfn), false);
> +		unsigned int order;
> +		struct page *page;
>  
> +		page = kho_restore_page(PFN_PHYS(pfn), false, &order);
>  		if (!page)
>  			return NULL;
> -		pfn += 1 << order;
> +		pfn += 1UL << order;
>  	}
>  
>  	return pfn_to_page(start_pfn);
> 

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
