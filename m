Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DBE3451C1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402292; cv=none; b=DU3meCQzyuTMppXf91aQXRdqRHvvKFQCJFkTXNsJEusvp7McsESCpd3C8mhwSwKPRyhEK6ZS7PkmrOTPuIMu8aSYcQf4mUn4islaCKr967vy/pfzWAGTSpVZu1J31tVmnxoEQtsLxUmM+lWKTFBwKWQ1NUTFelndHlQgbH29Do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402292; c=relaxed/simple;
	bh=iC7and9h7b1SIUvtmbF0bA5C1kwIySKrp0zXHTwCAuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X76WpFqfSbqaxsBkWyf87YTgdsh1x8h+mOLEe5mVw6EYaJIQLq6/uszqOcgZjUFXC8yvBJ0dYMLVp2M505fRQUXwkJy+pz+oxkGvC81aeAMrHu0eSSiOn//JjUC3T+EWMh6iNoixbK0wOBb6WGxTfw2C7fK9kxop+MDso70n+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUFHSksd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUFHSksd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso20386975ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788402284; x=1789007084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEnLbsLjH8lfXnlpNq4YY44i+y0cC+hZ66l4ewIS6QE=;
        b=WUFHSksd8voXxr0ryYu0+kvRy0EX1RU8TfWn+MFz4NCqadw5Ao4UfrPKnVY4FmT3B1
         taVMNHKNk9L5+7sEAVrMfAEOG3ZTzCHuj2e/EKWWFx3x5UG0gjTd54Ee6PGRUG4wsrbT
         n8BACLv/iEEDToIGyRmycrG1bCqgLrQR0IKGSzJ+r2/BRV1K37Q7YXegdDd3ep74B6QK
         zSHvO6z8qkkc/xT7Bhs8Pz3tT5CpaWIVV1dSdxmjwSsIS+WNiITuwyP97lazZv1hSMrf
         LFQGSKJZzIdyFvMVnFaoJHj7Tg69Prws1MkO66iYRBfZNBCd1UbRfAKn4YgpTQs1m6PB
         FiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788402284; x=1789007084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEnLbsLjH8lfXnlpNq4YY44i+y0cC+hZ66l4ewIS6QE=;
        b=s5Y7jBerCauEyxgTlM84Z7TT0xjClxU9NxL3D4i/V/SaVoEt/8KG4CVYxRxoCV0vTB
         7zdRwKUxkp95vBE2KX0xK1Ewl8a2oqm+oWfX6vQyA0TvU9FGREO0Wcr8qJt95yy/JEft
         UPH1B9YIkhNVwMBf+/WjtlRpvEtLjsRgh9w8ctJDjQ2TnduJ3tlBSw0XR35QjiBcPeQc
         mO1tL7Yhhraz8cUhtH1u7onk7H5ChVFiZq/iBrOq8bzFmQxPfBggzqxtSD3W9KkTfz0U
         fM36O0LyueQK930LuuTCYubYxLOGnI8EoJtVe5qirV8WfaKMizky6nTJ1XcWDeQjPCWm
         ZSaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUwRCbtuabNWTv8l6Rm9jaaePJ273wOIN7VSTz2AgWbvGNYeIxvcJuy83tPzRhmWZjiJ17ouE4Vy7tgSM=@vger.kernel.org
X-Gm-Message-State: AFuF++kSR21CxuosUiFafYQkPOSQkQH3cLPj71fYwLBaNvKa11iknAs1
	IeYLuBovBmVBw/hS154TNpzIz1feUfdCxRCf6pJCGaT87Myg/lw9t/Vw
X-Gm-Gg: AYBFou16ysOD1HOtOq/KeIfk56ctxtI8jIsXom9/LgHeongqMMCGOiwddeSUom0PLcM
	1QfyCNQe0IUFxHn2WmMazX3PAuxShOSsD0TNbx+k9db+aSLHrMjs3+4lYNY+6/0gkgYJeLL/pbf
	JieZtkbxtLBfb63AdWq3z4xN6XeW8y/EhHIz28lx/y9nwyUfpjFqf8WtRRnlw43PGbp+PWSRnv3
	ALSFO6Ku11R+OzDXCdMKVpa8FD5hxz4tEb8qWrQT7i1rgDjEr+QijJWEOpD+xCTOo7quUqzXHL2
	IlKY4S5lJN97JzO+avNSCpzka5zqeKcYjOexM1qYt1r/fTo4yDBa7RYI9P1zoEocjGLFaXab9bm
	hzwksDqV9YGUYbI3xYDOBXwqZb48uvDLkwECkNtNWjdcte+6ldnLoGYnDjTEzzxYMZWw0H7Zdzc
	7ZanTSV/VQNTMvSdMBDVFYHhByZf8eTsDst1mo0O6AUQFGDyJ9Sr1eVE8+JKI=
X-Received: by 2002:a17:90b:5384:b0:398:ceef:edbd with SMTP id 98e67ed59e1d1-39aee1bbae0mr14243570a91.18.1788402283444;
        Wed, 02 Sep 2026 19:24:43 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08766a2dsm2107662a91.15.2026.09.02.19.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:24:43 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 03/12] mm/damon/vaddr: remove a debug message
Date: Thu,  3 Sep 2026 10:24:22 +0800
Message-ID: <20260903022431.74074-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-4-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:36 -0700 SJ Park <sj@kernel.org> wrote:

> There is a debug message in the DAMON virtual address space operation
> set.  It has not really been used in a meaningful way for the last few
> years, though.  Remove it.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/vaddr.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
> index c8c32b2ae0402..f884d3f78f30a 100644
> --- a/mm/damon/vaddr.c
> +++ b/mm/damon/vaddr.c
> @@ -189,22 +189,12 @@ static int damon_va_three_regions(struct damon_target *t,
>   *   <BIG UNMAPPED REGION 2>
>   *   <stack>
>   */
> -static void __damon_va_init_regions(struct damon_ctx *ctx,
> -				     struct damon_target *t)
> +static void __damon_va_init_regions(struct damon_target *t)
>  {
> -	struct damon_target *ti;
>  	struct damon_addr_range regions[3];
> -	int tidx = 0;
>  
> -	if (damon_va_three_regions(t, regions)) {
> -		damon_for_each_target(ti, ctx) {

Thanks for the cleanup. The debug message was the only user of
ctx here, so the signature cleanup follows naturally.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

> -			if (ti == t)
> -				break;
> -			tidx++;
> -		}
> -		pr_debug("Failed to get three regions of %dth target\n", tidx);
> +	if (damon_va_three_regions(t, regions))
>  		return;
> -	}
>  
>  	damon_set_regions(t, regions, 3, DAMON_MIN_REGION_SZ);
>  }
> @@ -217,7 +207,7 @@ static void damon_va_init(struct damon_ctx *ctx)
>  	damon_for_each_target(t, ctx) {
>  		/* the user may set the target regions as they want */
>  		if (!damon_nr_regions(t))
> -			__damon_va_init_regions(ctx, t);
> +			__damon_va_init_regions(t);
>  	}
>  }
>  
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
