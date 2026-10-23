Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792726247;
	b=LWpyuMH/RLjTNjP415blc0PDE67/pED5Q5GufvZlW9gZtM4/8mR6htT8rLkj1GefHwCs
	 LUpdW3kfBTu7C6U0ahfmIVkX/qiB5L3NSZgi3w3WRNLF9OMaXiD9BY7qpvyIkMrQ1ZThF
	 AbOAJUFCEtuk0TzCmVzwyRVRFz/flDnR+0+cj8D67jYlQ9pfSROO2xx1sYDEbxl5MQZuV
	 iu+YM/2BOL5qA9KZoZjnYYcnbMrtUOPSrME0K3xykAw6sYrNijhCU1iH0qfoesndUSS2c
	 +I7WZjghGkjWBLV/PAAdjz7i/MYfyYgXwQ+nA1E4b9Kw2jpeyCHtSHa3GwA2XHDU/nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792726247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=zIGi8MMXWRGMe2b3LNjOQAhNFelVBzD0TDA4w15AaDU=;
	b=kxiaKKpQ6frEji5pK9L/3ltlBFBWVxAPcvISWgdlCEtEDEN+13auGPH1Vw+7CFvJ8AuB
	 /KPDq2B7rOvdbCiYw9rPexd91/Z/+GsAxx5FS47/p86x/rYc82zxp5C1r+GoGvhtI9DaX
	 Fnpks1FyQcZrKXL24K8cqCTdVd77K8JMEQ86Ei89L9IjYvGZH8C0sxR8/77dhhjtqjrf7
	 Rc4Sv0lvRYGJSW1tjQSl4JpbCCQMaVxGSDXARqPBkesbaS4ss0Vmku7eOqVDwl65SPTyR
	 Y8XwJrIQ9mlxJe17T3U9v5SZPouFWwLFukwCS4Hoh806ZZIwIjBBUaStGFeinWiHq8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zd7fBeeb;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A91606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A91606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zd7fBeeb
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8437d47592bso34463a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792726246; x=1793331046; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zIGi8MMXWRGMe2b3LNjOQAhNFelVBzD0TDA4w15AaDU=;
        b=Zd7fBeebd1lfpAdRXJ6+JaaGysO3Yu/EcHrtxnqCSaM0p6TEFW0QDtBZt1yJXl+db0
         7+Www+4fxL7At+3HbiTjO7mx5kBphe46M/2RuOyP0+fHckPTfuyOlLoVphddtXSzq+eH
         JXsJ1BvaxshV0aJQc0Dbt7ZkEG26eWuK7Dl58UATjC7SPnuS3k2qKdRIvwgNdzgBG6dH
         X8IugpCPbz4LP1A7MwqxHjzQNCoXhFSsDqteamcaJHVB/Id/w29pudgazxkbzs4rY9Wl
         7LnzIyuBUowkkY2ZssaDe3mHQMVN4MdV89vheVbDUfeMX7ekF+QlqmInsdZ1rcVFaCCX
         6ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792726246; x=1793331046;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIGi8MMXWRGMe2b3LNjOQAhNFelVBzD0TDA4w15AaDU=;
        b=FhiU4X57oXQTbbWEqrV2wneiAQNB55jahhgQszqpb40WfXQjgQuLhAd90eqP1miGC7
         DaOh83T15AhzP5FRCeuZ1fkXcFowGEwmkhIpQlwZwB9T3q1tJJTJXNo4nZjAfgwblrpt
         56w5bU+b6GHksXZ9l90I46rSzNdLj/63mCBa3ofhgOh+64MR5AVQtRy/7lBJVISN8qFp
         FmsHWyNhtN8Ab9ZV1oj5kuDGhDQc/hPaqNtIkjVM9Bg2jzDJkPvIBhLjD0WcZ1Hyy6hE
         enpc0v1au1tW1ZRaCaKrw4hEY+ep+YOAeKdDH0R2//AoPkE02Gjz7aiLvU49Rp0lGC4b
         x9Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxaZMVbzSlBqIbLoncEUsTYyMJXJjiOIZs+Woz4evUR3tsxi035ObA3tX+UDZ+ekYgmbTY1qtJHJ9/hxic=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAITtMHZTCyojzcHwcwZm1IafCJUj3wU5v4F7k1m0MiqbGxKIP
	MxCUG5VFKQRq6y5XuchG6uBtTDKcvLZ6BRW9Tqz4eRYpe6F3jMLE0kST
X-Gm-Gg: AYBFou2nonKPypXf3f6y5odiO6nigFV7i/6kV9zm8xVbyz86tsgF4631l74RGXy4zHo
	ai+/vL430PtKTwsZdjuF5Wp7tFtDajRk0dFltMaLJWu2WUyDH+l/U6IZLbcsZoevoeNfkpH6mpu
	ikk38kwkyc1IDfEnncbGvfTHZXVPKTrHIwZ5I5qHhIyVT2aen17VHXXFTYAp4ioI8//+zX59n/+
	9MOugG5JAUBVJ5bd9VsgGsRmlH8X4y58nnPZd1fCzHjlvs4Mcehwk/f8XWA3k45sj/Bzt3fRApK
	x5WPa6BnWL3aLSKhhiXizOJ2F3/hREnJEOK/f4u5O/wpTrYpiSeGINgltUWqsOk37z8MAgG8Zvw
	GeNA7eWY6VMPnugF90uPeBjmks6+eE4ruUd1DBf+S0sAVzkvZkgX6ZCgH3QZeeq96VBtQoTzqK+
	GdmXwx3sMH2KcoDMwYBIoawX3aUe7npZHLgk+dGma3MUd6q9megd16aBXlcvKiDpa8MQtJGQ4/J
	48QGQk7lCLjB0fvScswUWI5sAap9pvYHrla1Zy5xsU5CL58nD9shGNkTtEDYwetslP1/BzQHmvb
	/7YLWqgxkuNmd8cqTQ==
X-Received: by 2002:a05:6870:e196:b0:4a7:235d:b346 with SMTP id 586e51a60fabf-4a821ef833amr776609fac.1.1792726246059;
        Thu, 22 Oct 2026 20:30:46 -0700 (PDT)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a820ab47f9sm697893fac.13.2026.10.22.20.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:30:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/mremap: populate calculated fields in vrm state
 correctly
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Nickolai Zeldovich <nickolai@csail.mit.edu>
In-Reply-To: <20261019-mremap-fix-shrink-charge-v1-1-a3ce209e5360@kernel.org>
References: <20261019-mremap-fix-shrink-charge-v1-1-a3ce209e5360@kernel.org>
Date: Fri, 23 Oct 2026 11:30:35 +0800
Message-Id: <179272623522.1002865.18403086831547127814.b4-review@b4>
X-Mailer: b4 0.17-dev

> Commit d5c8aec0542e ("mm/mremap: initial refactor of move_vma()")
> introduced the vma_remap_struct helper to pass state sanely through
> mremap() logic.
> 
> Part of this state is vrm->delta - equal to the absolute difference between
> vrm->old_len and vrm->new_len (the old and new lengths of the VMA,
> respectively).
> 
> This value is used to correctly charge accounted VMAs.
> 
> When shrinking a VMA, mremap_to() sets vrm->old_len equal to vrm->new_len
> having performed the shrink of the VMA first, prior to any potential
> move (e.g. MREMAP_FIXED | MREMAP_MAYMOVE specified).
> 
> However it does not recalculate vrm->delta, which results in incorrectly
> overcharging the VMA.
> 
> The charge leaks to Committed_AS globally, meaning a mischievous user can
> cause allocations to fail across the system in strict overcommit mode.
> 
> Resolve the issue by abstracting the update of vrm->delta to
> vrm_populate_calculated() and invoking this from mremap_to() when
> vrm->old_len is changed.
> 
> Additionally, update vrm->remap_type whose value depends on
> vrm->delta. The field is not read again after the shrink, but it is the
> logically correct thing to do and protects against future changes which
> break this.
> 
> Fixes: d5c8aec0542e ("mm/mremap: initial refactor of move_vma()")
> Cc: stable@vger.kernel.org
> Reported-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> Closes: https://lore.kernel.org/all/20261017233527.797191-1-nickolai@csail.mit.edu/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/mremap.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 2e1ee879f70f..3f645cdc8060 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -887,12 +887,6 @@ unsigned long move_page_tables(struct pagetable_move_control *pmc)
>  	return pmc_progress(pmc);
>  }
>  
> -/* Set vrm->delta to the difference in VMA size specified by user. */
> -static void vrm_set_delta(struct vma_remap_struct *vrm)
> -{
> -	vrm->delta = abs_diff(vrm->old_len, vrm->new_len);
> -}
> -
>  /* Determine what kind of remap this is - shrink, expand or no resize at all. */
>  static enum mremap_type vrm_remap_type(struct vma_remap_struct *vrm)
>  {
> @@ -905,6 +899,13 @@ static enum mremap_type vrm_remap_type(struct vma_remap_struct *vrm)
>  	return MREMAP_EXPAND;
>  }
>  
> +/* Populate calculated fields. */
> +static void vrm_populate_calculated(struct vma_remap_struct *vrm)
> +{
> +	vrm->delta = abs_diff(vrm->old_len, vrm->new_len);
> +	vrm->remap_type = vrm_remap_type(vrm);
> +}

Hi Lorenzo,

Good idea to update remap_type for here too.

Reviewed-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

-- 
Thanks,
Xueyuan

