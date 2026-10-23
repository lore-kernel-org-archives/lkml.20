Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779105;
	b=BXKFRFzDq4bstnkUY+LfCGtHp0NmX/6G8zMc2ySGzHnfppvGTxaCW0Y9oAm+WRepjvAp
	 2DvhWu9GgnRafhcRond6EIadVhXX7UBNLjmNSBMZIfEwkrK5jK89YRx2nAJl2yD8tC7MH
	 XT6fYA58HzPQJuZU7BAcOuwyvaP8HF+iHVpM7y07D7xY2M/aoZ9hAdrSgPOagji9GYQsp
	 HlFz1G9qGQZ9AWcF2ram4Xjw6g08NoByCy/6lTlauUKwJjgpXt99gD+4posi5P8hQIf+b
	 Vle1b22bm1cGhTFN/rCbWVMZqBlCmY/0beFxw5bmnu0xDk4gE1jiPHlUJvRcNHhpDEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779105;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OER7OiM3baakXk7yT31L3dFSCqe76IjxgAS+7zkqevo=;
	b=3prqHuNnB8DJcL9YbivESpHDh764fOPdK6/X928N25xDkvY5HwXaBtsPl0I5ULgm9qnj
	 cFtIiaxl4RQyEETRvCdZ+p38IipxXmCjErhaVsbSNSDowT/lhyr++KZrgdXJudO4QKKw0
	 XSy6IgqrvNwXGrJKIv7VTA6Cku4zoCkedlpYr9AgLHH6qZLWbCl28B/sbvnmdVntN5TQj
	 Hvjj4nQ4Kd13nycxDcevexOlysiA4DSAy8Ybuc/vSRYUYEUM1QsSI62cfE5n+67RegJgC
	 BMKm8quqD6jTFC/bxi2MyOmw5aRWIZdaqXHcDwVUpBBffNK/P+CnBnoHQAaRT+rFSiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Em6Da7KA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24F5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A24F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Em6Da7KA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792779103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OER7OiM3baakXk7yT31L3dFSCqe76IjxgAS+7zkqevo=;
	b=Em6Da7KAdkjGvpkiw/HLt72foCTy0Z/L/Xx9V9UN6vqLsti1l/qXcnKgaq5U+g1/nmkQLY
	Me8rtJ2HYhuebjLfq3XtujU6QSkg0f2w4DdSVPxJyqPWTepqCwN9nNRkCshdKFj4hwI+76
	LCT0G+rVK9FwtjEhDEMiraOCDLXKw/Q=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-Oo1hwXJmNQqXxXN_ESpGSg-1; Fri, 23 Oct 2026 14:11:42 -0400
X-MC-Unique: Oo1hwXJmNQqXxXN_ESpGSg-1
X-Mimecast-MFC-AGG-ID: Oo1hwXJmNQqXxXN_ESpGSg_1792779101
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53639e47be2so23255261cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779101; x=1793383901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OER7OiM3baakXk7yT31L3dFSCqe76IjxgAS+7zkqevo=;
        b=QHFlfPVdLB+Yz/mp1gYFJvaFyIOTv5qq+KSKkfEIVymM7XIHiaj+pl1t8tQBucaREG
         rWmGOvhZbpEZnk1KNDzo4L1lO4oyo5sKvX/VqYsqY1ylzctQArIp48VWK+oU+7xkuYdL
         zxrOeeK+y7aGQH4myhJ7+HFKaPvMBb0GFjEhiyZHhVZ/ih9gaFT5EfzIQPQEduoeLZ+1
         Oc1qgzi9kO+ARSnC7geMXv3QxPdHiGxIPaX3NcDY7sYMFEDDGBBannrYTZsOF2YEdUhj
         A4ergXOH5o9+O3/7Hg//SUClB7wvpy+fIqPDCbKcOVvkoqFigGHDXiASAeFr7JMDYDQi
         RBZg==
X-Forwarded-Encrypted: i=1; AKwUvByHknacLy8I2guYnC3Q1EzNsJpkoBS24taoyO5UIdkByQSGLOhPU5Fpaads5T/muPYuUwwtdsQuQ6mOysw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpFkugdmtBFzQvEssBWsciKBRX/iqmIWGYQV6PKJTA5nCybAMx
	lYN6nwQzkCKPAF56dZ9AE0agi2KcwqMfp3vNA16UI9B4joLZxEWGDt3lgxcqhiGubAqxGAozlmt
	VmBmUFWL8/rf3Cfc/jS9v22R3tjTJXa2T12pBHMDqrEr9awB0T/VhcieXrZarUCJmEw==
X-Gm-Gg: AYBFou1lNLBkNLpoLsPmM6EmdiLrruaQQZnUm0YY3DhrQ1dli1GLR/4/5SSWa5mc3T6
	hGQQkrIATUipBVXj6KrA2vAp2WR3rwQ4DV/J2XpTTgNR39n+SiT6ZQJ7fl5+msDXlPhNIFMNwRB
	NU33rI+qmBLcwekJ5sGh7U5M3e2jz4HHMWlZJ+rDTyT7Ka/iF2q+aRD/69C31do71BDnHhZ3XPs
	i4D6gPATmCSC1S63hrVor8KU9CX2dRN1zFyp9HZ6p9slIUi8oDMKJomtx74l+vblHllQ7xSc/Ja
	cb3b3HLRqi1NemF0Xky+ENFwX77aMRuVeAqNCYn21xjh/MEgAJFmKrKVOHHnPxOOVKeOB5H3OXs
	VGCo=
X-Received: by 2002:a05:622a:1394:b0:536:cda:d3b0 with SMTP id d75a77b69052e-536c2923e1fmr44456911cf.75.1792779101130;
        Fri, 23 Oct 2026 11:11:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1394:b0:536:cda:d3b0 with SMTP id d75a77b69052e-536c2923e1fmr44456341cf.75.1792779100422;
        Fri, 23 Oct 2026 11:11:40 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm448581cf.9.2026.10.23.11.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 11:11:40 -0700 (PDT)
Message-ID: <44a9f234-aeed-4986-8660-608b8a23ecdc@redhat.com>
Date: Fri, 23 Oct 2026 14:11:39 -0400
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
Subject: Re: [PATCH] mm/vma: fix expansion of VMA_MIXEDMAP_BIT VMAs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 =?UTF-8?Q?Jakub_Mat=C4=9Bna?= <matenajakub@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261023-vma-expansion-fix-v1-1-6142baf1f46b@kernel.org>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20261023-vma-expansion-fix-v1-1-6142baf1f46b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/23/26 11:17 AM, Lorenzo Stoakes (ARM) wrote:
> Commit ca3d76b0aa80 ("mm: add merging after mremap resize") combined
> merging with expansion of mremap()'d VMAs, however it also unintentionally
> disallowed the expansion of unmergeable VMAs.
> 
> Previously it was possible to expand a mixed mapping which mremap() had
> already ensured was a legal expansion.
> 
> This is clearly seen in the mremap() logic, as it checks
> vma_is_fixed_mapping() to determine legality of an expansion rather than
> vma_can_merge().
> 
> Additionally, copy_vma() allows for a failed merge to result in a new VMA
> being instantiated if MREMAP_MAYMOVE is specified.
> 
> However, this is not attempted, as a failure in vma_merge_extend() is
> assumed to be an -ENOMEM failure.
> 
> Since vma_merge_extend() is used exclusively by mremap() to perform a merge
> and/or expansion, resolve the issue by invoking vma_expand() for
> unmergeable VMAs there.
> 
> Explicitly assert that the VMA is both non-fixed and a mixed mapping.
> This provides double insurance against broken changes in future.
> 
> Note that khugepaged_enter_vma() (which vma_merge_new_range() runs) is
> redundant in this case, as a mixed mapping is not subject to khugepaged.
> 
> Also update the VMA userland tests to add a required predicate.
> 
> Reported-by: Luiz Capitulino <luizcap@redhat.com>
> Closes: https://lore.kernel.org/all/20261023023106.515365-1-luizcap@redhat.com/
> Fixes: ca3d76b0aa80 ("mm: add merging after mremap resize")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> Confirmed that this fixes the repro and passes mm selftests and the VMA
> userland tests.

Thanks a lot for the ultra fast fix and for the attention you gave to
this issue.

I tested it the same you did and (of course) it worked. I'll work on
testing it on the environment that reproduced the issue originally, but
this may take a bit. I'll report back if there's anything unexpected.

Another detail is that I see that you CC'ed stable (which is of course
correct, since this reproduces since v6.1) but I guess this fix won't
apply since the VMA code has been changing a lot.


> ---
>   mm/vma.c                        | 19 ++++++++++++++++---
>   tools/testing/vma/include/dup.h |  5 +++++
>   2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index 1be613044b4a..88ef92ab24ec 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -1851,12 +1851,25 @@ struct vm_area_struct *vma_merge_extend(struct vma_iterator *vmi,
>   					struct vm_area_struct *vma,
>   					unsigned long delta)
>   {
> -	VMG_VMA_STATE(vmg, vmi, vma, vma, vma->vm_end, vma->vm_end + delta);
> +	const unsigned long start =
> +		vma_can_merge(vma) ? vma->vm_end : vma->vm_start;
> +	VMG_VMA_STATE(vmg, vmi, vma, vma, start, vma->vm_end + delta);
>   
> -	vmg.next = vma_iter_next_rewind(vmi, NULL);
>   	vmg.middle = NULL; /* We use the VMA to populate VMG fields only. */
>   
> -	return vma_merge_new_range(&vmg);
> +	if (vma_can_merge(vma)) {
> +		vmg.next = vma_iter_next_rewind(vmi, NULL);
> +		return vma_merge_new_range(&vmg);
> +	}
> +
> +	/* Mixed mappings are permitted to be expanded, not merged. */
> +	VM_WARN_ON_ONCE(vma_is_fixed_mapping(vma));
> +	VM_WARN_ON_ONCE(!vma_test(vma, VMA_MIXEDMAP_BIT));
> +	vma_prev(vmi); /* Reposition to start of VMA. */
> +	vmg.target = vma;
> +	if (vma_expand(&vmg))
> +		return NULL;
> +	return vma;
>   }
>   
>   void unlink_file_vma_batch_init(struct unlink_vma_file_batch *vb)
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
> index f449129ea97a..e0eab4eca998 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -1727,3 +1727,8 @@ static inline bool vma_flags_can_merge(const vma_flags_t *flags)
>   	 */
>   	return !vma_flags_is_hugetlb(flags);
>   }
> +
> +static inline bool vma_can_merge(const struct vm_area_struct *vma)
> +{
> +	return vma_flags_can_merge(&vma->flags);
> +}
> 
> ---
> base-commit: 2bba28e98578de622ef307d00875aa8f8bca3d10
> change-id: 20261023-vma-expansion-fix-6843391177c4
> 
> Cheers,

