Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B947DD64
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009782; cv=none; b=s2g/zCqYCWtcZHcjmmSBhcvqF0nUW3ViyTt9zOC98sTg7kvzRDzr2xogT+j1aUNQZsvQJr5Q93yIyH2VKUDf8zLEcUBRdAOlL3Dowlq/Z/4y4yqrsXbXGsVTRp0JLq/W8sv9hXLApnN14rg3V4rxObyGYpvMzdhfdT30CuJVrVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009782; c=relaxed/simple;
	bh=yW2JRdI+sHVXqRRLn3ro5rxRmw1YQMKkbezj+YasMm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENtgd/GfMOa/PT18/KdK6Tbk5PBDCSyvhZ6mFYV5qTM9aCje6h0pECMxgDoRMPdBWQiEKUkLGSC+NNi2j+0PWpXxPzvvcSzzf5bfB/v9H6IWGyVqKPmwejhdHTx3Z9p5tmKTdfEKhHNYeLEUhVUJ7/nEqS68titRWTcxHSnV62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=rdAxAsMm; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="rdAxAsMm"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5339199d8c3so44049451cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792009781; x=1792614581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8KpIQc9Vyaph3vkgeCaoJ68oVGAH4Ek85s5zfjWhrac=;
        b=rdAxAsMmZjVc+aFoV7+zMJ2GvAxRjMz/tFtzAatt9ZbyWsHrVKsMcAa+d81t4EGrJy
         kdJql+zC5+eQ+90faaXFS4Sb4K8hOpZhcCSGW8kvnLn9oCiBV2wDxDjnmMVl2VCmQ7XN
         Uwg6uggwkp4CA/yv4jlqeKfvCcxqo81sK4jH69lYZ+5N4JHExW62PKKbqis6oA2XRVEt
         Eunxjf+o0xNL95IWFknf+wI+8v6qCuOnhmKG8gzEzmFU8lQuzHi6xLLK58k7qPSRrX9B
         o3XJRpEKzSy/9aa2JFaLclIr+ZhFKrjLoy654fdxJNu2b7w/B3M5hhpnJuYZx18si2QI
         sQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009781; x=1792614581;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KpIQc9Vyaph3vkgeCaoJ68oVGAH4Ek85s5zfjWhrac=;
        b=XKeTvHH+4CyGYE/4wQiuMYh9Hhkw0i8pwN0ka66lYVcotDvGEmfcq9mfKhedgfIbmL
         OIrEdQAvtErUDXJSKEGcmZPQblurGYlGSK0D1iDz2v+8vX6pNzUT91YjpaVxzUDYcWiC
         v4FLSccOef6S4jYcxR+VwPOUpf/uj+DobfxkR6Qlas6gb8lICo3+5jISf7vtUYEboLr7
         nVA0GW9eVbAzfgjqeRjedE1LIhdhrb+DRhdSK/GaD4176+jj6y2YGBAa5AlwkkIH3exQ
         weLebTETF9x0CGfEPDFDT+vHgGR2549pbZ4Bc2QZ6lK2MhbSF2rWpRdygX9VPlSMHpCk
         8ucA==
X-Forwarded-Encrypted: i=1; AKwUvByYtBAw/loyjTd31KJVU1ALtKRHdr5kcKwT9RRy0JkvkRpNrfZblD6xPWvODlctd/lRSFMMXMTZi0qDSsk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu3IgtxBxCDxSo+asELoojjRkXM6Mmv/oO1uTik4vSEUuc3F1i
	0vqiajEcDmiBa7TpnoyHT4kN/wf6OGWfTbPLzbrF8xbg566kY/9clVRUo0sSPOR4kes=
X-Gm-Gg: AYBFou1Ia369KjTIT9RibTj9omj9SIXxYy308NjDJw8DMbjGRRjrJwpnh0eSvKsS75j
	r2g+ekkFvwBm14JKt5O6KLTAlJEpxQz8WDMCBUHrFgyW284ZKKFAt+uQ1cWAGQOIMA+2lZeiCID
	gR+coOg4QIaTtVPj6oJJRLNa613xYpOh3pPDhdmq7PLb5emR9xB6TIsv6nYYGmVThAObqeE640y
	1icruYI612qKerK5SDNhgO4KCzrizXI2x7zzSNWJ2+l0vu7sbpI7gtENHYpYpZcXfk5XZayrDDO
	rozON0yEELOb2qMuUisOYwTzdp93xXJWrXxQNYC0NOSyC3tneXIiLcQoNbEHflKKdltoDhHK/RW
	yKAROCHXTk04FCjPjOBj30w6gQq4XnwZ25/M4ffd6EGqQBvKWBrARbQ+18vrRudF5Gmi4qmwMXj
	iifdAW5Q1E+1TfbWrYOrqgQAzKHzESf780eBbUYbPsuUbn3PhjNduwVpCIQTgrxLbOWeeI
X-Received: by 2002:a05:622a:22c5:10b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-535fc2dba9emr47727251cf.33.1792009779058;
        Wed, 14 Oct 2026 13:29:39 -0700 (PDT)
Received: from localhost ([2603:7001:f100:5081:9526:3c0:45cc:5ac6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5361281f0f2sm5986961cf.25.2026.10.14.13.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:29:37 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:29:36 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>, Harry Yoo <harry@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] mm: page_alloc: make defrag_mode retries follow the
 promoted order
Message-ID: <20261014202936.GC371161@cmpxchg.org>
References: <20261009125503.126202-1-kas@kernel.org>
 <15a9e03e-c748-4e51-b8cc-583a3610c897@kernel.org>
 <20261012192834.6934ef85444dee4a60d6d876@linux-foundation.org>
 <as5q14OsbK2CmOrh@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5q14OsbK2CmOrh@thinkstation>

On Tue, Oct 13, 2026 at 06:37:20PM +0100, Kiryl Shutsemau wrote:
> @@ -4127,6 +4127,12 @@ __alloc_pages_may_oom(gfp_t gfp_mask, unsigned int order,
>  	return page;
>  }
>  
> +static inline bool order_nofrag_promoted(unsigned int order,
> +					 const struct alloc_context *ac)
> +{
> +	return ac->reclaim_compact_order != order;
> +}

order_defrag_promoted?

Otherwise looks good to me!
Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>

And agree 7.4-rc1 with CC stable is fine. Sadly, not sure if anyone
but Meta is using the feature right now.
