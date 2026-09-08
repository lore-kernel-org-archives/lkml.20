Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7954B1D8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872659; cv=none; b=I2Gqh8nuuqdveRgmj7sKtFQJkAFzCNd4cLqdcYSCgcEr3pFRa1BgHX+gr5DAiXEiASSVWDVKc3MaezTXk1Zwpr16DLrHfuXVXuRb/yVx7NxEvxDiKwnNMMfZ4og2+w3kSIkeiiE8/S29uy5F8r7VvVBzAAoXv7XyGGWsJYfFbpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872659; c=relaxed/simple;
	bh=Us/q7SLbzZ4oV0cqtA9AUdygdN3iWgHORK09/87t+C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEW+o/wTvDC2SYQyL09uEdkak2Hz6FbLJO789UgQRILDRCP193noAb+vbTYmMook9qOambST1/p68jkmUJFbhZIkexJWlGSxUHn133SXQjTKtrPkjhm/fmTQZEwfYJCbaRPQi69K8tpCvzP1Bg7bT6etGSDUzE/y3Y5c9IZFbjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sxziIFnX; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sxziIFnX"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so7317106a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788872648; x=1789477448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TF2FBSAbA99rTI7hgd6XJ5POJVbB9v0L/f44ZOGfZAY=;
        b=sxziIFnXwxCymezC0ZKR8x8fO10AH7DBeCwwIR7eD9XJzKS5I/ZJI8q7gtg07fkBm+
         hFbg4RwwYXHIKOVlIO2xTO9mRGNRCbhpE5HT4b9wbNAHgnODx+oBTq4JHTdCBS1+zzn3
         RuNYDbTX6/VuixmXcX0rXRJCO5No3z9ZUz4gREwWZEJw7W5V4UfM7sjD6AjKoweZqLJi
         MRjpw5TGBzztrukEbsozKHnXPaaEaUII29rTHawEjn3sRqBmZD7NnvgRJfiuVgZTP6Hz
         3xE0SIRKqTYpn0mMFl4RI5HaGiqkwREyaqL2IsVdX5HUQLtEH6+bda7x783i7+JK3uYD
         yOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872648; x=1789477448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TF2FBSAbA99rTI7hgd6XJ5POJVbB9v0L/f44ZOGfZAY=;
        b=T/PGvTyxYVG0vXY+FQmnV4vwbRa+Wo6nXDJbB4yNwo1wIhT/6QHPhCfCliR5+oUGGn
         EVUfQjQEmaxpnl7FPj2YWO94hB/e10LEyHAe2RLawg2SFL9uEVKAQwZI5q8YvRWdJM9H
         3A0ldUP4ZU6o1GXzK9i21alb3JUijVLFV2w4rhsSuZu3XLmNgeB8nxz5nVK6P7z8ONmd
         A+1PXe2+6vrRTx9x/oQur2EU+ZpFxj1NGpTLGm1qsR3W/OvC7SIwe5SOmafjsOhgRNqn
         eyoxECTFX2HMqvLkX723VLkUwWpAKfKYh4wTK803BuxrhZ9Yb6ohkDGcMYQmYn6AhvU9
         Bhqg==
X-Forwarded-Encrypted: i=1; AKwUvBzo2m++MVA1iFj0iAZf86XmMAAanU9uOnd3kXCWddtznPiq0Hic98WXrK2ALWdwRY8bO781BCNfePLk9+8=@vger.kernel.org
X-Gm-Message-State: AFuF++k9rQ1I+kEB1dVPl2PIsh2MfRr+DTh8FkYc0+yU5P9+n32tqV7N
	00IbjEII3ZwH42G9BZ6K9vRvz10xi9sm1LjNM8ndM2oS5kZpxL6a1/6WwBIj5xqSyg==
X-Gm-Gg: AYBFou33Qmbk6OjCIF/DU76mZbYfcAUmWql66utohUheG9AiieaOpoL0mfuGe8fRSup
	476giYvB+xzzHCvyNr1UIYb/EYn0ygSFB74W5gMqjFb+6QGf9R1cste6vT8Sa5/D0eDm/SZHF42
	lgXpugqLgPzlx/fbPblaN0v2srH3GGfnxgiPBqKKoBY4hnmTlhEXCZtnMnMWWjkFyKaLcr5wp5H
	TC15/IjrpS3bRv/PCh4nruc6gPc3Rt5NzKc4sCAO3vrKDIY88rdHZvdedtGi/AT5eFO0ikO03/z
	BFZghNUM3uvpOVcP2IV1wPJ4oV/oilh4tGkr6o2/9ytqH0Sw3CbRLeCQLNjh2JHIgNKAgKal7Pd
	lQzvin/Wc0dY3OZZxmJJGSpnJzGdxFWdXjugiAV9mAWSo0CN45Dz68+Yqjdks+D7F2H9foW4rSu
	4U45XYNknkMLVymL+jZQQBV5AnmmSNN37G522wmmV3KtqvyrOvYOGlWLDgjR6+gzqMPzzCKZP0q
	rJ9DZzXkAFXmrjop8i6FN724lz1WM7P
X-Received: by 2002:a17:907:c081:b0:c25:6230:dfcd with SMTP id a640c23a62f3a-c260c9e3320mr1176298766b.15.1788872647225;
        Tue, 08 Sep 2026 06:04:07 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d582304sm623294966b.43.2026.09.08.06.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:04:06 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:04:03 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>, Keir Fraser <keirf@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Quentin Perret <qperret@google.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>, Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] KVM: arm64: Fix host access to the EL2 stacks
Message-ID: <aqAHw8Is0bNBbXUl@google.com>
References: <20260908110713.1540304-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908110713.1540304-1-fuad.tabba@linux.dev>

On Tue, Sep 08, 2026 at 12:07:09PM +0100, Fuad Tabba wrote:
> Hi folks,
> 
> The per-CPU EL2 stacks are initialised as host-owned after pKVM init.
> fix_host_ownership() walks only the linear-map alias of each memblock
> region, and the stacks, mapped in the private VA range for their guard
> pages, have none.
> 
> Patch 1 is the fix, and it needs none of the other three. Patch 4 adds
> the check that would have caught it and would catch similar instances
> in the future: once the transfer is done, walk the private VA range and
> fail init unless every valid leaf is hyp-owned, or is hyp text mapped
> without write access.
> 
> Patch 2 is a fix in its own right, but to a different bug.
> fix_host_ownership_walker() matches hyp text on its stage-1 permissions,
> and that test hasn't matched on a non-hVHE host since 7.0, so hyp text
> is donated there rather than left read-only. Nothing crashes, but the
> instruction dump on hyp panic reads a page the host can't access, so
> the Code: line comes out as question marks. It matches by physical
> address instead, which is what patch 4 needs too. Patch 3 splits the
> start of the range from the allocation cursor, with no functional
> change, so patch 4 knows where the range begins.
> 
> Based on Linux 7.3-rc2 (df2908090cda3).
> 
> Cheers,
> /fuad
> 
> Fuad Tabba (4):
>   KVM: arm64: Transfer the hyp stack pages out of the host stage-2
>   KVM: arm64: Match hyp text by physical address in fix_host_ownership()
>   KVM: arm64: Move the private VA allocation cursor to __io_map_next
>   KVM: arm64: Check every private mapping is hyp-owned at pKVM init
> 
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
>  arch/arm64/kvm/hyp/include/nvhe/mm.h          |  1 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 20 +++++
>  arch/arm64/kvm/hyp/nvhe/mm.c                  | 79 ++++++++++++++++---
>  arch/arm64/kvm/hyp/nvhe/setup.c               | 16 +++-
>  5 files changed, 108 insertions(+), 10 deletions(-)
> 
> 
> base-commit: df2908090cda368b01ff43709f51890076c56157
> -- 
> 2.39.5
> 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent
