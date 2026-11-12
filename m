Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509576;
	b=IkUG7/CkusRJ/Lslqj1pI9/Gh9cOUBfFlDNw50UjCWWXoF99SduMc14Kax98lliuYWgB
	 EK4Ry6B4ZYvfZXNyRYwaGUwWK8WrHxDoh55SHT5bKwjwhzsShpXvYlu71E/sOSbjLkP4B
	 nKLH6WFzkQLLMoIG3gIowpn3blUxM4OZ/OcNeBp5c+0ty8lHpYVHEnlHCEzEqDgtbvXZs
	 fknTmaidxjSUisunW/G/+K0njUPqTWd112DK9EPZcn/qxk6A8PGl+UCGSRMFavqzezEgi
	 +9ikWarREzxSwAEWuojSBhXGMKhPMnXAUi8fs6GhowZZ9q4eswGyo2GahuyUxmLDRuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hcSnrIWaKcLWPzgkvDFN69lIrdlqfIyxKv5P92W20vU=;
	b=aurwWy7CBej9yZRubB3sDMjeu3TgfD6jcUX0TxCUnVoqiuBzTOLKzvx/mDXv6JuEqmMD
	 99g4D6XnktxVHUt2jChBVWayDrzsea11nOC3rdlkefvdb4RsPErhGD+4kuZda75T95//Z
	 hBzs/Xoi4ECEfbPqTCWnFci4eD/nKejgEYzV2MzRiszgAMvPWQTRuglmz+ymzRkyLiYzq
	 43Yna+Qm8E3RcgU1UnWF2WdCnpka0RBKnn/ViSn56QxnPDP01bUkbVnnruit4DFXLfAR2
	 fyY6+K4fSp5WdRNKQWJdGnFPvIWIGi7qU3WuZE1mib3zeMIm3NZyFdLSXhtjvR+F+ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UVr9vl9D;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B048606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B048606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UVr9vl9D
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b2d14968c9so3225767b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509575; x=1795114375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcSnrIWaKcLWPzgkvDFN69lIrdlqfIyxKv5P92W20vU=;
        b=UVr9vl9D05rZx/AFvhB7hufhtQfAytEmGAhBm8lM3RFPHSvyT9jwaLU2ratUeL9Jzr
         VLpXVVz/BE94Ao1QOAzw1C0XD0krPM4NL31X7oDnhng/guj3aU+rgYGhPWUjeMVBqxJA
         oU6lkfTqaGSVQlJtvwP9dNRcNKd7X6XNDQ1IF4EHp1CjlDhfKdY9LNAwAgRba+fgnivj
         kC2qLUn8n9+YLYGqSq4kyGiP1sOnLR9jDk8z2E1Tgk7/gDFgSt+3WiYAd2IHFQldWtrA
         Fm51nEpNr1S3/us/datkheFmkoHaL0hZRTn2dlBIcFr9flAsLcfGQP9ue3/FYvZlqOBz
         uKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509575; x=1795114375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hcSnrIWaKcLWPzgkvDFN69lIrdlqfIyxKv5P92W20vU=;
        b=VaFzg57QaxV/b5iedR/wzCM2Vn3p5UDjXFmK2ogvUEW+Yg/brAfQlH8+4YMZm/Ptnm
         mfzzOGLWpY8rIaHGqSDQGhy/lm7J8uW4EBeKdCRQVjtAul3GK8/UL+27iBDN4Xxga81l
         TNVDy3wGp8BrLJqBwnLtQ5SqoSzA8o0ninxl0Q4zdhMkAqs/7IehRc+NE+jnxEOaX83S
         nC0xr7T6mVuMmgAOvDtP6Whcs30xrFBlCzok7tMuaVsKH8jx0AxIR88iy8MfnoqCUYNu
         d3YuR4sKSMD+vVUgWyp5ZgxIAQkcGCjbi0AtPWEZbvTo3F8uIuHLN1exRHc+z+WoJn95
         dg7A==
X-Forwarded-Encrypted: i=1; AL+hErEWBVW0rthpBLUvVEa2h9Fx9G8YE2KjyhuGeqxtVgpiupwDfTmeMmZoJNVeyRCDggNFNIbsbUn1hP6TbMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EU+Vmn97SEk4At/wYqMq0Wit+hTBDlAtDUmceUS9Nww2IoGyX
	kNapbtV0VoKq2zv/VDKHv73KpGW5uRSZWZmUxCK8a0zhyOqegnVPOWYI
X-Gm-Gg: AYBFou10RHB3ibJ4FHIq2sEvs1cyEA0Sj5+lg6FC9xYUuJhCj4inKCTF08IJuRWECh+
	WrcTDSB9gcS8N+pEFm+cvnCCmchLv56A4GdbWCxUXEfWk+xolT4tnEqOfEWeJA/Cedde0RNPMVN
	Yt2SJoZ5uUD6kduMGALJ0WnFvgf5jBHwx7pnSeiSr3osFmeaaS8SUCI27ZS5YTvn/cHiaR/9IUt
	h+/RYTXVYr9+lycWM6nwfe/d7bQpuVkDVLIMfFK6H17ak78Od0tSYSE68odVoxrsdVIMJg/YjuY
	Oh8DSNj6LYFZ7uP24riJBEzcF+UgMOmzvbFmfiWx2hYH7AhMjygNf+vm5UvO3BbqWep+hM0HCaE
	DmPpROf2IWCThpMjqyMNj35rsKpFlkw890CoDfQPXFs/FY91+Uq1FQOkgsrUSCaP0albCVy4dgQ
	xKqV/itQn4Ws9JvV6WFWDYYcT4xCa/oa6ET7vScSC49ZzuiHuH28z6g3JNkbFBXXIEKhNNsxB+F
	mh2y+2kcAdx1P24gW6fDrq8ix7F838dj4OLasG3zZD9t8b28VUvPuZD5cG7QiVSO2DR7s+gzFVJ
	0h21pQdd6bfTDrrIFDWdXWKYEdCtiSiSXJaqHJy6IBGxm0HnDRk8iym8/slvKU5Z7zIizLipDu0
	Tu2+u+Q==
X-Received: by 2002:a05:690c:f03:b0:8b3:7f47:8ad4 with SMTP id 00721157ae682-8b4aa323f76mr2781817b3.41.1794509575553;
        Thu, 12 Nov 2026 10:52:55 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa933d5esm2680387b3.19.2026.11.12.10.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:52:55 -0800 (PST)
Date: Thu, 12 Nov 2026 10:52:54 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm/page_alloc: only skip kswapd nodes below their
 kswapd watermark
Message-ID: <avYKuUJJNFylInRP@devbig011.atn3.facebook.com>
Mail-Followup-To: "Gregory Price (Meta)" <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>
 <179446431092.482102.12227242887844422381.b4-reply@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179446431092.482102.12227242887844422381.b4-reply@b4>

On Thu, Nov 12, 2026 at 01:18:30AM -0500, Gregory Price (Meta) wrote:
> On 2026-11-10 14:44 -0800, Joshua Hahn wrote:
> > Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
> > NUMA restrictions") makes get_page_from_freelist() skip any node with an
> > active kswapd on the first pass through the zonelist, so unrestricted
> > allocations don't immediately consume the memory kswapd is freeing.
> > 
> > But kswapd is also woken for high-order requests. With THP defrag set to
> > defer, each THP fault that fails on a fragmented node wakes kswapd at
> > PMD order. kswapd reclaims a batch, wakes kcompactd, and sleeps until
> > the next failed fault, so it stays awake much of the time even on a node
> > with plenty of free order-0 memory. This means those order-0 allocations
> > get directed elsewhere.
> > 
> > This was observed on some Meta production workloads running on 2-NUMA
> > systems, where processes with a preference for node0 allocations
> > continuously allocated order-0 pages on node1, despite node0 having
> > hundreds of GB of free memory.
> > 
> > Only skip a zone with an active kswapd if it is also below kswapd's
> > target watermark.
> >
> 
> I feel this commit message could have been simplified further.
> Brevity is the soul of wit.
> 
>   patch (details) skips any node with kswapd running - assuming that
>   this means memory is low, but kswapd is woken for other reasons (e.g.
>   order-N allocation failures).
> 
>   This results in fallback allocations under X conditions, which leads
>   to xyz performance isues.
> 
>   Only skip nodes with kswap running if the node is under the relevant
>   low-memory watermark.
> 
>   (test details)

Thanks Gregory,

I was going to ask to have the commit message updated as a fixlet but
I think given the amount of change going in I will just send a new
version with a more concise commit message to make it less confusing.

Thanks again, have a great day!
Joshua

> Otherwise this looks good to me.  Looking forward to the watermark
> cleanup afterwards - i agree the change here is a bit ugly, but
> probably preferable for the backport.
> 
> Acked-by: Gregory Price (Meta) <gourry@gourry.net>
> 
> -- 
> ~Gregory
> 
