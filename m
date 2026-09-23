Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F8414429
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198565; cv=none; b=hsiZZxR8sWp3egzoDYPXdhRVsTriWCG8SIGrk4ka96Dd3i04+4DTPp0IyPrZ1KYtIJ7VyWV2tW4OMhBl4tNSKD/q8F1Sudycilo1DISoMCEX1Ck5JLuA/sKkaMvOl05SOl//MOyxszc1IBu8NI/T9FhMMdiGPunImIcCYZRP6XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198565; c=relaxed/simple;
	bh=Hw9vFtfLNadtKGcW37IdGOgqwKhIf5argLx7FSCLVNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKNnpx7aHuQr+D7hJZLpnJmjFaIgT0LFZSdeOcbL69nPJuk/WZNzBGANi0HUbRicuZcyWWC4fCBVajF//bCfXCfD9GCFbb1jXS94IPwK8A1KOMLbeo/H5DfBYdEvtIPvmZM/5LnqC/3mCkYxvjFIhoq29CtsPN/C9rxyvSNXYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dl5+EOLf; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dl5+EOLf"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93a2dea320fso125442085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790198559; x=1790803359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6JszVb+RTu6ALEMMDucuPIFOfd98yGFKjSHhbkgHgjU=;
        b=dl5+EOLfz+6ghzeb3ZMIe1VMfK+/ddoyHUT4H6XZM5TyY2WwAqNnWnGJP9PpGJ/lqU
         2Hn7MtvUHcYDwas6eouw2TCs4dB/592o+l9omfa4/G/4+XxMqRmT9w1tDvQVfTW7M1EO
         1krm7AfxA4uqME8K6uDuiz4vCmGRCI0qN1niIrQqi4I0B4lJpdjkGpudT7++yDY81LUJ
         LtTNT31KA8lDOTNKM/CAW5KinWLSmH/zPleCAM3KS5o2fXrhPEd1XicpXludiAtybYCx
         y3itvVQuZhrq9WqY5zVPNhId1Phfa525vRocAYNjm6i8sX545aP06kG2h3AQ4Cux0hqB
         RgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198559; x=1790803359;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JszVb+RTu6ALEMMDucuPIFOfd98yGFKjSHhbkgHgjU=;
        b=quQUB4ECaLdyiIs015EpuBBpvQdJLDT9knXQejXFqcNqAekghy9pdqXUulAE62071/
         r5K2VboJITfDcIpYzWXHgj/vtGk3r4Fa7rTRc6ctj9cgQJjfKhMTM79huaFXGpBjJ19R
         nFH3Xygn0s/2D9u+2Brd/YdO9iTPcUB/mC/SyaeEK/KcNDXh9wZCeweib8bzurxURVJw
         EkAUK/U8BjLt7TiiodCOAarqdazk5RxT76LRiKwpSuhNtgTghubegomG1A/y8U7Kpmqg
         UL+ZUwSEjiL5WaYGHBO2DaYWQHE0diWTMFtw9REZmxiO2QyqHc3sSS4nh+u1MJjsKK57
         anig==
X-Forwarded-Encrypted: i=1; AKwUvBz3PLqAk9smgDJjwe8ebdEmjIOp+AITqtEBMoGMXHFVo9ObFA2gNVDdzAwz7u0KtWCkmGdy0ZnbR2Z52qc=@vger.kernel.org
X-Gm-Message-State: AFuF++lmYTYqNJph+q4wrJE+ivDrIeYC3bcrybzhDwghExu5W9hFj0os
	CzegsEaYoT5XsKQ0RG2hf8NntdbkUbAN8W83CMkCz6W74HLevkuOEwvFsTHFzZHwFQg=
X-Gm-Gg: AYBFou0pzy5Mi0kFT26IDa8YBYJgH3+2fm+v408Mv4wRCqmKI/T5mXsYJCYh9wDuyPG
	W0IjN/VIBdK/h7j3vH01x8JYs8JYDQtU5eRykgnQE3qAFSbLcEB5EMi0AKXpNfvFo5LwmqBjdH2
	nFSUeRQHOxQtmoRBemcS2tNDBNfIu1areW/0805hfX625Hs7nqWIvVyoxRC/cXJZpd/nm+Dr82H
	brG2JQy3HMLh97xIOTyvnTyOMlvX2Ef1U/vnnGAofGICYsCfn44ttof/jXW4iEK/jqm5e4WsG+x
	mvd6iZcXAdkX7HUgqQ3BWVni8zKPjiGdFq3rEpf/xkrTXssN59a7Lts6RhcsQz/U35aX390UfsH
	gFMIVRScKhJGWegr+pj6iolmm6ashKxIbZDrtoWJh6H+VMD0UaJVhUIHJePRTRpKJF4KfCCx8OO
	9ZL45+Vsp7dTc125JIoF3lKoap5jhWdEFKqwd+EMzK6Brd9UTdewVIPRrpYYJB4BVZJczgXfaeS
	20IDNd6F5aoxBi9h1mYZfKqfLycC15ren3PXT4G9ZqPC2/Qbj9P5cAAMQyHIopNSw==
X-Received: by 2002:a05:620a:225b:10b0:93c:b10:7243 with SMTP id af79cd13be357-93c346c2cabmr50513785a.5.1790198558842;
        Wed, 23 Sep 2026 14:22:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248cf620sm315660985a.43.2026.09.23.14.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:22:38 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:22:36 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/vma: predicate setting mmap_prepare VMA fields on new
 vma alloc
Message-ID: <arRC6lU7yJCrosDp@gourry-fedora-PF4VCD3F>
References: <20260923-fix-mmap-prepare-overwrite-v1-1-3b3f1bfcdf5e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-fix-mmap-prepare-overwrite-v1-1-3b3f1bfcdf5e@kernel.org>

On Wed, Sep 23, 2026 at 06:45:41PM +0100, Lorenzo Stoakes (ARM) wrote:
> It only makes sense to manipulate VMA fields if a new VMA was allocated,
> rather than merged.
> 
> VMA merging does not compare vm_ops or vm_private_data, so a merged VMA
> keeps its own, which is also what the legacy f_op->mmap path does since it
> never touches an existing VMA.
> 
> Currently, these fields will get overwritten by whatever state is
> established in the mmap_prepare hook, and if the VMA was merged,
> vm_ops->mapped will not have been called, so this could destructively clear
> existing state without replacing it with anything valid.
> 
> There is an implicit requirement that vm_private_data and vm_ops are
> fungible across VMAs which means that losing the 'new' state is
> fine.
> 
> However in this case the 'old' state is being overwritten by potentially
> invalid 'new' state, so this must be rectified.
> 
> Additionally constify have_mmap_prepare while here.
> 
> All existing in-tree users either derive state for the tree or are
> unmergeable due to VMA flags, so this has no direct impact.
> 
> Fixes: c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file callback")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

