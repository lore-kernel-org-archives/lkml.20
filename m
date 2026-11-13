Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590314;
	b=BPFy+LEPI3pf12JBphyKlx6rcF0u1osaNCZ6JMwoi2LheuktV7vtwE1rEermlYtD37i6
	 gE/Ve19DoEu6mZUkv4+ahTOFwLP+XtXDgbQCS6mfNT9LSPWNdF9xXJs1uFsJMdR180tYd
	 WLre1EscqcVFhVXzKIlczhjZtF4tiT/JcwSuVUVH4SUivQwkXmz7ma2e2OHMYInfsEfz9
	 Y26zFb+sifGiS6wBnFc8sO5AvHypw8w5VGefrCUFMsCPR1ah42N6s66EE90aKi+mywwrL
	 hXH3MBEdsQVqKJX49bFkUOrhTIUuCcVJmcfA0zZcS3dAK02zkqRueW77XT+3UfMNPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=hnhSF7Az6Z9lY2PNjeRQ4LQp1XBnKkpuWvbgZfPvipQ=;
	b=eVDbc+81v1YlaPxktsVdGNBjMElst0+YfRiOe6j7YXVJb8ZzqMAPKCOwrOv1La7YGuLG
	 htayZBhpw3LfH+alJDGvnkHvom3PKdmarytllcwX31VCYSrk0Z2OcXE+KJCQerJLHWx7l
	 lQvaJ8eIJ4k9bAFKDrOvym9ziYS9GKZfUNPVtuoP2/BjPlKJJ9oDhw6PM30M1VFWWhMF/
	 AAVH+YgQ0j3Hb9fYg4Ol2fAb8PfX60VG4AB3IHS4Xos4bvUp2e86pGMk6rg9lXe2st3bX
	 6dHOXkRRwPHKdghPZw4xfSZABMTVFG6reVRK8XN/p/jkD3B6inqfeBHqDBvmYBb1+Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UbInh4Sj;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76288607D2ED
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76288607D2ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UbInh4Sj
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so697494b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794590314; x=1795195114; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hnhSF7Az6Z9lY2PNjeRQ4LQp1XBnKkpuWvbgZfPvipQ=;
        b=UbInh4SjclTw3m9sFrAEO7wdu2DfXCd7BAfmA+mmL1eQXzHGJVs3SiLI8jfyrizMJo
         1tlZcvJj2J8M1KgSnRdWTjdls/BdnSvxp8nPua0FdH202+fYd8iGVZxsgr5kIms2mHPo
         L05c/z2bcQ2+N2UnSs6YycD+ZROaQmh8IGZv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590314; x=1795195114;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnhSF7Az6Z9lY2PNjeRQ4LQp1XBnKkpuWvbgZfPvipQ=;
        b=fdVz90p98MNHRSxE5WrnfzImo/mTkJJKMMOys1zWeOBBnySfLTeOSnkDsfMYKv9h5X
         zY+e6xEx8+NqHC2MhbZlVDgyW4v6hmuDMj5e7bHUsywUyn1+WJcuhjObSJgi+HcKJlkt
         vgHfcyWo5PYMfCjtvZEue333MaU+nHD2iS31tBKKETqc5H+EH9hHGoeYoMdHeLZFVJLP
         BD8PFH+9WKRsSMbE2PGdWCDTwFvxLwAdWAjwZpvbKdRsaDNOut7zSO7HythmlgJL2XNf
         emNJm/0QG/j9l+PVZXeRqYypF6sHuCv/noMpgiQKwHus4JzxR7tpDCwbDjPxzISoxTep
         N8Ew==
X-Forwarded-Encrypted: i=1; AL+hErG12ALazBew50g1uMO8M0T/sCGcqV6GaJGFc2SdbKcomnMdXLPDEmS2RdyQv8XY7Y0Sp4KzGMIPnU8OlCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DPzD+GoxL8JQPAhLMhzuko23LoUo7dJgc2YZTeHakjSy4wATV
	3mLwkX7Zet5ll5g4NJUnlUj9qt7Xc8THvGGJ+sZnr/2rnR/WAAH2kVfPwV+V+4MOEaA=
X-Gm-Gg: AYBFou3Z6zutzh8XWunbm/8fDyqwlDYuz5olF2cZ+8FKZpBtIMGsxSLocHIvt5TL5ZT
	Wwm0P2pC0/NZtrn32xM5FqvOSwPpZ2T3V5m0He+HqdZUipCfoNtwgwJT/90+fkmnmjD9X6nockD
	Avcpq5Zi+Hzd3Ii/h9CskXr3xlFF6xCu8d10nb0NPQGOmHRhI4Z4EuOh7aAjuvYzOGEDyrp3m99
	wUwPwyTsEcE/RhzRDJoD+OaxNF9SpEmjAKKGVG4AEHEsQvkkWeBjDas2Y05Ps8HR7/JNICCuL9V
	moFtngxLseXsgInFWwjgW9I0qeKmlVNRyWMdE7SCEBuN9fewLZHI88It2hsTifNQa8yJLhq6xUa
	2GZb/PziXTvtBMl0xTVxJRBGCwmE/4y6ioAogpNLWnfQiaLSxZuyILh7CiO/P4XPc7tq91b/c4C
	r+l70oHz07OHi03YQk4wMQJL3SpRhHLXboXmC8NohEmT/iUp5zauYViJpuugUcUqUdcSEGtPsdU
	rU1Ad/pE1DLBTMd7DXVowbXHZovTIwZbexfnixpvzoPdJD6nX51UbUok9VoI/rbXhVyWf04ii56
	Udr5ZBqRpbctC6h5qH/++rR0rgyT/pJVU9/szNPQnju+2BLPEiplzEneL8JIAkhW5VEtzDzKCzW
	Ux30YmRcLctM93soWxffOc8vnVgRQk+ep9rmTFMU+Syjb04AFWu6Pc3EAi6oiNAy08rPaeHWNZK
	cmlFCgy8WkE3G0WuBBV3zc5Ixe5VvFHnHaNVDBi6WEV0pfr0nkR92wovi0UiA=
X-Received: by 2002:a05:6a00:2c89:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8beb619a61emr2835248b3a.27.1794590313819;
        Fri, 13 Nov 2026 09:18:33 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6dbbdsm1460009b3a.24.2026.11.13.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:18:33 -0800 (PST)
Date: Fri, 13 Nov 2026 09:18:30 -0800
From: Chris Down <chris@chrisdown.name>
To: Usama Arif <usama.arif@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, terrelln@fb.com, dsterba@suse.com, hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com, chengming.zhou@linux.dev, Andrew Morton <akpm@linux-foundation.org>, linux-crypto@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH 1/2] crypto: zstd - use vmalloc() for stream workspaces
In-Reply-To: <20261111153532.1036709-2-usama.arif@linux.dev>
References: <20261111153532.1036709-1-usama.arif@linux.dev> <20261111153532.1036709-2-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113091830.c58bbfda1f249304@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Usama,

Usama Arif writes:
>Use vmalloc() and vfree() directly to avoid the high-order allocation.

vmalloc() doesn't avoid high-order allocations any more. Since
a06157804399 ("mm/vmalloc: request large order pages from buddy
allocator"), vm_area_alloc_pages() first tries the largest order that
fits, and splits the block up afterwards. So for these 383 pages it still
asks for an order-8 block first, then order 6, 5, 4, 3, 2 and 1.

What the patch does avoid is kmalloc() rounding the 1.5 MiB up to a 2 MiB
block, which is where the 516 KiB per stream comes from. Maybe say that
instead?

Once that's fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
