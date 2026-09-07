Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C7446C84D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778578; cv=none; b=MfJd7nVUKvIjshtTdf46VdNAN/GvlIyHf8HiHRliSGpql7hBB5HHXBsO+vVh37hqe4P7AEdXl7ZFXXSvYxCZIeJoQwb9+jDQK6ImXFQ6tqo/5Ft/rHX0hSNFxgADgh6KUzCugn0q4ij6Xft9u9hV8KsAu8K1pMHiwUfaOKKLex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778578; c=relaxed/simple;
	bh=5Cz88xtidhTh0WVWZXBvzWGRI2sWfcL1c962MWDXOt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSDXlQ2zIxoU80Sti2EUsvrGDwfqRabnRh0LAiK0nEaPg/jpW0qk47y5vMtVODUsZ7uyjzVXn4hYVd/QLef56FTWJZi7frgyoqmJePvzqEdGzxmcOUe6IdOz/6bKmzXzTyhICCmPfj2osVWsTUYL6mkdvfh+26M/RNnS2zbTFpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVrCJnrw; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVrCJnrw"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db17b40eso793255e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788778575; x=1789383375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qOp518ytTAH6/dnN5OP4wt3M73KjqMFaIqs6o7qE2pw=;
        b=RVrCJnrw754IwqophVPw8Lpwbdaiuncb1iVgYslmYQ7gWUpjiJBVqF5szvIM5c08tj
         i6n9R/zLMeccQSmq1pUQg/hYz1PR1oq5HkSQaDizfJnm+ZRGKtfhq7GwDdq8Yp4FRX50
         NVjAtelFF14oE2lF1vH9EXvQRNZjzu725Gq+M83ENSJQxAwqfEfeUy5Lqij2qQcUH9jI
         JhbFMrtarSpOhnhHFbV5LLQZzIiadkXOQgj1SXfM22a3uJqWZvLkefla4rdW4NKhTA7Z
         yajLx8tm1OSiYS8nzR6+7OqkD96Qj8MysJ2ZGkbIj4/qpm2dnke/HAHVpcNODY/ekX9D
         ypyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778575; x=1789383375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOp518ytTAH6/dnN5OP4wt3M73KjqMFaIqs6o7qE2pw=;
        b=bbnX6y8N0+MPmtOQv6OSErCpefDeHxriIcHfA1IMymtkPvYxkdDimgoQxHFef5O6wh
         cEotWwBM/nanfaXlyY0JK7nM1Sotfcl4v1I1dQLDosxuyhV1LGA0B/YdJc+wdi0Pa9CJ
         Uvxvuw44G/Z/Olh3VLGivHj3yG1nmRPSQ4xaniKKcXiWrcAv9sF7newfeJ+SswoLmgAh
         U2nIZDl5eyXAxap8J2P3LowZHDYy+LeviCvAIbYcxxV7pEOi6n7zlTREs6wqeZnu/mDo
         Q0Yr/+wskVXF3++k6/ULS07IH72es7x5+rxwhIMW7q8Cl4KJmXCTjMCUCBSzO6qvs/NG
         VByA==
X-Forwarded-Encrypted: i=1; AKwUvByiYVukravINThAZ/rt0Gijpfwwi3Tz4QpcKAPV9IoSywG+gSEAMa8KVzcmqJTJRU0vigrJzixyTF6WME4=@vger.kernel.org
X-Gm-Message-State: AFuF++nSxi2Z4HruwG5SGzUbqYiSoBDwvw5U6og91Z6ekKLr72PyVMw1
	Dwe2Ekc8td0QAQdGWDGh/3FZGmhUS1jvPMsIJAUENPhtqsBhcM0leFT1Vo4HMg==
X-Gm-Gg: AYBFou0Ivw4BUM65PUlHq14bV1sa18FKNYnUznS/hre+MLMXR3zmLTMMjuO21Zx4SWl
	gh3/GAWBsZckfOSWvGyZyIpgTjEOS8AGN91kBqddTbub3sNC2nl0MixYgI1EKMLGWGs63xhe6Yi
	HlpuZxQb0pQUVB6Cl762ydT+eSbyXT4Jd7CtJezEClEJaUjQwBhWy2FAvRZDv2BiUEPCa6XsKt/
	gI1JU/nN1P/uSZxqYSZeLJmFBaZw8LitI48tmP/3eKyZoVFDI+FB2SSUcB4SZOwVKlHxeDab50/
	8J7F6RCd/zr0qCuPuCw3cwSbe2gdRCRHOnUBuRnmRx9jR6Xvsc2zum3fHUGrjHrjAkC6LLC9NZk
	oYc3JXUn5NsbTV9CTK5smau3fnLFN/cJdb8guhnivBvw6xpApCm1kUIkRwkuSJhWG4cQnEr96fq
	srNgc9V3o2o2VwKxb0w4uf1q/7wGEqHMEGDAIIua9++eVE0UgEwg==
X-Received: by 2002:a05:600c:c48f:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49d010c4f64mr133554825e9.0.1788778575186;
        Mon, 07 Sep 2026 03:56:15 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm459522435e9.9.2026.09.07.03.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:56:14 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:56:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/4] phy: core: Add phy bulk data helper functions
Message-ID: <20260907105611.uvhdywq2pwikfz3y@skbuf>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-4-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083709.425893-4-inochiama@gmail.com>

On Fri, Sep 04, 2026 at 04:37:07PM +0800, Inochi Amaoto wrote:
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index ea47975e288a..13f9f030122f 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -81,6 +81,17 @@ union phy_configure_opts {
>  	struct phy_configure_opts_hdmi		hdmi;
>  };
>  
> +/**
> + * struct phy_bulk_data - Data used for bulk phy operations.
> + *
> + * @id: phy consumer ID
> + * @phy: struct phy * to store the associated phy
> + */
> +struct phy_bulk_data {
> +	const char	*id;
> +	struct phy	*phy;

It's not clear from your design intention if struct phy_bulk_data :: phy
is permitted to be accessed individually by consumers. Personally I see
no reason to. In that case, can you explicitly mark "struct phy *phy" as
"/* private: Internal use */" (like struct regulator_bulk_data does,
albeit for "ret"), or simply say in the kernel-doc description that it
is managed internally by the PHY framework (as is done for both struct
regulator_bulk_data and for struct icc_bulk_data :: path)?

This should help at least LLM review flag abusive users.

> +};
