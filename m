Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275052;
	b=kX02FKnsxdC6lG41lHt2FZA9C9RS6ZD+o24sgsf/Dl4mJvjWa6M22/tA4SSmd8Lcymwn
	 bwy0flzhAy854yP41uZBBFakEfZvPkkc3nP1ZmqtaUSAJYwyFTpd6gOqib0BDZsANnFu4
	 RiTkzv61D0xh5MXPpn72KxV9fFr32FKoj2Wd45eByK9R34W5wOhpiWnh74KyYS2ynD13J
	 +tVqhvB4FhYh9F2mNdjn4ki6qGaXhrmfvOq9fcxlWbyXXZriE3zFHUYsVfNXo4wuvHQEd
	 bZd/duT1pqMuAZXkHK9L92f85xoMmQKNjWnQkmB+TRIM0Xi7u3BbVvVnOeJTxevDTSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=85WNzndYYnYjdw+c5+YUiQvdyptr/w4CZ44uKXD8zJs=;
	b=rBXiMiL0VHwiK8m5vZIcIavQ7gFw9W9uIxRnTclAksDw/wJlqB0qeqc4+VH+mWwozjNP
	 SAslnJTrfmPVK2lIoLI3fqs4WNIm1OklP2MLmBNVElYr9U8HXoJ7qdx6crugyBPs7kjnS
	 JxIfEkB+OCWX7txZkqrY7jb7Bwq2i0PeuU983+rvTpZm+s0eq0e8Rg4JgSaNwOJCenHJz
	 Tib/CKmg54xKOjP4lC47GM8fHzrzN31o+Tichl6J3z7imyw0q/lG+kaNMkYcGqi2Zl8PZ
	 mnPrG704uoY4et592dClZRitiawTFIXBFkIj8wt+/P4ijfp0C7kHVQ87QUH/ncTNtpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOoC3x2Y;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61A5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOoC3x2Y
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso14215345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793275050; x=1793879850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85WNzndYYnYjdw+c5+YUiQvdyptr/w4CZ44uKXD8zJs=;
        b=QOoC3x2YyskGvLJscTJSqiZXiq0SzZ2ahe/1p8X3vlAZHS62uH4dZ6cUo79jHAZpvh
         gstHjhyT/KASszJi3nPoOF8N0uc1AXfq14EEU3V4uiitOU6YvZd84O3OxYftQxfqwT21
         1Xg/HXiEQY0BjJqDw2TwqFjHEua9jmVS+VW63MRXNm2xT+M+RqiOwtmJkOPMSc34pU1Z
         pwM664IN+FqBJP2wEaz5xwU/w+ySOyJAPTIBnP/KDznTLIcbc0/cZ5DTTKziW3BIPkEG
         kA/j40sM/53vrHeMfZvTlUaymrZwf9BDyIckL6DZh40RWyHf8Ko3mfXnFiWjpbjlHdD+
         1r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275050; x=1793879850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85WNzndYYnYjdw+c5+YUiQvdyptr/w4CZ44uKXD8zJs=;
        b=RV0z5TTw3/gWOJv7bvVQo1EdmRT1rLJIAYqE8vRSTxDLlJdVB4h8tYqE24ChRyiIF0
         1ERRtwgUSBOAbWQr5L37OZ000PNUQulqAYQGFoosr65hwFuTcf4Tjdx5g36dPpqpeBO1
         R8qW8Kv+eaAODIuhAhYQj3Z9narzEt68k0u6VyxYzctlXgVQ0LlfBzl0X+StyOPwP11r
         GPkQa52U1+GWdeCP1ZsgxcEj9kcqRBskfdxd6Flf9uslc6nKTJgb/wAtypccfgfePLSH
         xqlimdi8+tKi6OgP1hTGCkKtfiqc6ZceWfM6Rj4pAoaIllTVQnrPYd8UjeOTw8B2i+ES
         Wfug==
X-Forwarded-Encrypted: i=1; AKwUvBxVerMulx++QYQaw4mHCHjmCVe0L9lBK4+3pawz7bKQbaNg7b1vMp/zX4PXWbh9c7BDgGj3aH4/FI1ucIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvElO0HqhfPpxto/v+oexcvUmcd43maP+dORJ2SgzibyvyA1oA
	eu+HzkjLLZ88winCnPIXLpeQl0Hb3mTU8FEtTJjx24HtIY6QFjpNm633
X-Gm-Gg: AYBFou3z9FbfI6p9UFS2Otj+OnFH61gxK0l9Dgu8N74PW+XQHy40kYU0aXJVW3uMogR
	obU9pdYC0GKuBr6kTA3cEIQuiEnFNxjC3FxFPzrMy84WasQrU3AifiKSo1FiGlL9EQAmksGTX/0
	y5JAFgPN20VG/w0bkOmaxYR8SR2Tce9+SDP5uNd86WNdHZkrpye2Jl03EEQr4ofJbn5talkQOT/
	nUCcjgR8M9re4GPf+DkqoTe4wqlelXuLHflNR68PvS8Ldmjn+k+XNR335EL5CEwlmKeL6A6wznO
	NPsQjqjWWqADBp9+ArugHi/qgHSvdqnzirfV36Xz3pM2jILKTxaYfdoTzxyaphOBGjB23m1UyQb
	wFg1hI8k02Gx/EIJGcJgoPxSN46bo+LKNBVzW7U9gEwkyB5gSmaFsxhtR/2vwIl2q0ZD0v6ldOY
	obt+Snqwp48KyrGRJXmFQ8PmV+xJWyo4oHB6w+BJdKRJKvRRn1a7mH7Xn/F7fMslENG6xUx1g4L
	ZttEf1QC6FaW3qs9pxqUQqcy+1CrXPUINyjvAGc/FIiRiHoo/u6S5qBHoAYzf5V5v3mgQ7PF5wK
	Wt1JVRyBjslcSGeFNWdory4qJdIWOjTYMGzj7/u0tmE3Bg==
X-Received: by 2002:a05:600c:1387:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4a96667b9f7mr114934065e9.5.1793275050100;
        Thu, 29 Oct 2026 04:57:30 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a966a56abesm79733875e9.0.2026.10.29.04.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:57:29 -0700 (PDT)
Message-ID: <9f0f96ca-86c8-4732-a6bc-a7f955873ec2@gmail.com>
Date: Thu, 29 Oct 2026 12:57:28 +0100
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
Subject: Re: [PATCH v2 1/2] mm/vmalloc: drop VM_DMA_COHERENT from
 remap_vmalloc_range_partial
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ye Liu <liuye@kylinos.cn>
References: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
 <20261029-vmalloc_remap-v2-1-c4705cbf26c2@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261029-vmalloc_remap-v2-1-c4705cbf26c2@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 10:19 AM, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> No caller maps a VM_DMA_COHERENT area through this path: such areas
> come from dma_alloc_coherent() internals and are freed via vunmap(),
> never through remap_vmalloc_range[_partial](); all 13 callers pass
> vmalloc_user()/vmalloc()-backed addresses.
> 
> The flag was added in commit fe9041c245196 ("vmalloc: lift the arm
> flag for coherent mappings to common code") as a mechanical
> translation of ARM's VM_ARM_DMA_CONSISTENT.
> 
> Drop it so DMA-coherent areas can never enter the path.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index db669103dc66..a888eca016a8 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4894,7 +4894,7 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
>  	if (!area)
>  		return -EINVAL;
>  
> -	if (!(area->flags & (VM_USERMAP | VM_DMA_COHERENT)))
> +	if (!(area->flags & VM_USERMAP))
>  		return -EINVAL;
>  
>  	if (check_add_overflow(size, off, &end_index) ||
> 

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
