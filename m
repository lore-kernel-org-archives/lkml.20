Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184424;
	b=rwzZ3y3WLW0M9mDPG8Z0//XLOw17CzflhNVcmdHRSPCzHlJPa3jwZd4AA56wV31WdPcW
	 AyMYzcGK3HCG3zu2cgJ+gIT0t8f947YG3aMqPV6jCyEt6E6ehovrqt0Vh3zmEDc+cHbwL
	 84hvopiRS6wBE+yIFesDpR1iMMH9NHqukkC6rF8xRTE33SRPrf1A8sMWg+auUhPGW+SfW
	 QyzyEfpAGbzLN9w/OnVjQe7zq85OxfRtHywzMQo2aew5Ob4/WHj1FNvSu8PurrgOl68vA
	 Og/fXd61s0kXytNtDyaqJPzwmfOYdZ7K3XQodbj8sWQw3MdoI+rNi72oWf4VGbb6xUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QtJgRxvzKAXyLcWV37WI7jPRIzFywEjZjOEQjPn90QQ=;
	b=t9mZejFCte4E83z5RQ7xd2c984zBmKgN2bof06+pJygVNx4fRQNCsHluvvcHAmzoVkYr
	 GRvw+uFwWZ86FINFq8qY3Zc7JyKDpXub1Kq1bBvcxwzW/F6cPTX8TDBCij306QU93cp4k
	 UHnHaNk4h3yARPQ0/M67Ohepqoggu8PjXyZSEcHS5E/8g4zNZCIifSvs0TmHxpretkz7k
	 BPtX2Yt5iCv5CW4b1QSAMeazsi7YHCX3s6jqDsI+BEmTb3fhZ7OBm5NUYEysfsevKpIZV
	 Bg631hdBSqJrA6AJ+NrzmCwvGhfM2Nt0ZFruHhTQONYY7jH5CPjlXvNXFJ1nl/HJfjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWop4aud;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D2606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E2D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWop4aud
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so9820015e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184422; x=1793789222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtJgRxvzKAXyLcWV37WI7jPRIzFywEjZjOEQjPn90QQ=;
        b=cWop4audVaaTfROA28R+VMMgaO5lk69VEzAQq862O6NgJ91E7Ojm22LdBKepFIkvi+
         2RxSOjvP3Bg2hnDiV9W8xEUT2dib4LXt/RayRKnVNPKgqMTv7OkydtZslgpYHHKOx1NI
         eC9Q4pv7WxMCnLqsefQQRew7TCdczZszejUN90vpzhYLWEtf7h4BvxeCo+Lo2nhyLtwS
         P2cxMPiLuQ+STcrBOWdvyYIp6ny5AJNReN+ZoRilQUrbaInLyKs75eDkDqk2Fiw4c0V3
         0qKysJG87A2vrCEhpSvo9oPfDvdRUBjIRHbXchj8OXRkNDmN/NAKOQ/rLor218bbc6pT
         tnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184422; x=1793789222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtJgRxvzKAXyLcWV37WI7jPRIzFywEjZjOEQjPn90QQ=;
        b=mSAk0AZh1evuH6gkxeBU2m6D0cU3PKcSR46Ht88d5uJEXfqEMsQs1PvT6/eVSM6njl
         Gy0hd/JeEPtg12FNQWU5pZBb/662q8t/+k59bP780ZJWljtL1S8D/Rp9sS0przpgnYVE
         4d5+2VMYOhz/hxJDdIC13MPvDQH85Ok6hhZ58btdomlz68buVvze3oY6yy/DAU067x+G
         Ag3g9HdTka4F9zMZpWVD3+ZZofrPqlarC/WdokL7oIgKSza/Cd/DgobNMBCHN3zW6zr1
         aRqLe5ZKHYlEc/83mE/Ltpt26Du8zxHxj00cs6HHyIRPbYRUGefTM4j8Mve/iX/syjb7
         6YeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfIX7z5qQ6Q/3XJqHyBcq/7ibProUiaY/benCG9COQQqf+JqKm7TWKklk6KLb/4fxod+Z+42piIalpX6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhxibbjDDmqf+WmAVxEdhdlRyrNLTlp+va0ON5sfCG0ERzEKjQ
	dFlvl4OUFcef87zkaR/n/MlxZRZfTjL8u3bKKxwB0dPRCub7Umqv0DhWLGUay8Xr
X-Gm-Gg: AYBFou2Hl9QvCvHbJO9Km3wGMr+X1sI3C0SDgrDRIDpwKTKAYS0U+grE41zagJJSRdr
	kps4tJvbd4HU2RsEq4f+kmyNHnTare3EyjftOnnTsHBzBairY132O+8h5hXCHVwkyke8nP5n75r
	Rkn/ZNWug/HkzRO8w+YyrM3JhlAj+lCgSHH+jAM9Vyeea3Y3V2KqiZU8s2gth0Ha6s4LmmJw6S/
	8PcZAgOIrybMuxmkUCf9X7K620LfyZOBsjvafHEg9XoOEciUzH19J5dcsvPrjSLEVB08w+PUuOp
	kSDzzXEzzsDjqXd1zVqxIvjO0SH7oe9jGLwRmDbvpQJh6hi5tcnkd/uWiW52CER6vWkMgec1do+
	7QFy+lHaBl1ZGvyay0E+LMNQb3YyOW8Y5EFE2JipV0KaFdF8Qbn+GhQuKt4B111UzA++VG7u+9d
	dHuWAcReZOJxxMiPERaTS9aHmuuZEa2mYejUWH5ACgZIwkHH9NEpBqiWdBQcDH8Cfr9LZFAjdPD
	Pt1VLx4gEfYigwpS5tmKwWj9ZTpUGj/AYsu9c1/KkWyJ/acuIBeGhwK434QYrgDSpMKk8ysEmZy
	lc2i10850ZIsvR/Z0Mj4NT2p
X-Received: by 2002:a05:600c:354f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a965ec95f6mr41130905e9.10.1793184421788;
        Wed, 28 Oct 2026 03:47:01 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm28645811f8f.46.2026.10.28.03.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:47:00 -0700 (PDT)
Message-ID: <df9b55ea-7068-44c2-bec9-6c2fbfd4e06b@gmail.com>
Date: Wed, 28 Oct 2026 11:46:59 +0100
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
Subject: Re: [PATCH 1/2] mm/vmalloc: drop VM_DMA_COHERENT from
 remap_vmalloc_range_partial
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ye Liu <liuye@kylinos.cn>
References: <20261026-vmalloc_remap-v1-0-b7a907814e90@linux.dev>
 <20261026-vmalloc_remap-v1-1-b7a907814e90@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261026-vmalloc_remap-v1-1-b7a907814e90@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 7:09 AM, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> No caller maps a VM_DMA_COHERENT area through this path: such areas
> come from dma_alloc_coherent() internals and are freed via vunmap(),
> never through remap_vmalloc_range[_partial](); all 13 callers pass
> vmalloc_user()/vmalloc()-backed addresses.
> 
> The flag was added in commit fe9041c245196 ("vmalloc: lift the arm
> flag for coherent mappings to common code") as a mechanical
> translation of ARM's VM_ARM_DMA_CONSISTENT. It is also unsafe to keep
> since commit 5ea8ec74c57c0 ("mm/vmalloc: free unused pages on
> vrealloc() shrink"), which frees tail pages of non-VM_USERMAP areas
> (VM_DMA_COHERENT is not in that skip-list): a shrunk-then-mapped area
> would hit vmalloc_to_page()==NULL and vm_insert_page() would
> dereference it unchecked.

this isn't quite true, is it? the dma remap helpers vmap() without
VM_MAP_PUT_PAGES, so nr_pages stays 0 and the shrink never frees
anything there.

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

the change itself looks fine to me.

-- 
cheers,
jose a. p-a
