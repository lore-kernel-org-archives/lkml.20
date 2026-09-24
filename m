Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A94471400;
	Thu, 24 Sep 2026 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245704; cv=none; b=eiqFQCbGGkkrWlIG558rnaVr+ubRWr6a9/mT+Dm1H45cFzod2sN1TzijFP1L6PoeuCjn06UhtvIFjtl6EETjEYtFBKn6TWr4NIeVIeLfdDX82xUdtKr29k8AL4l7gGzbqvVycE9FoE7c958H0YDv7GE/WKtgpDn6t6DcWBYbfSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245704; c=relaxed/simple;
	bh=TFe/rkio0Xb7YAAPo9GyCH1G11f02LaQiYMT79+8PkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiR++rqoFICTi5q0A9HakfKUAOqJcBw5mZUUqxE+VXBbYV8QRmdVU0nzlCT4terptARR1k41gy3qOHdwkbgw5+TKRDCPjBXuBZkNK8+M8RazzpgWSDygdPwdWIaejPppOpQKHTF4G7AxEwilUcQSjBrjKjXEGBarSwMndmxtTQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehN9kY3S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehN9kY3S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CA21F000FF;
	Thu, 24 Sep 2026 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790245702;
	bh=RO3pD7Q9+eQAPt4mIEHLCPHWj9ylSpQSd8EUvJUV68k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ehN9kY3S16mwiPpWIqXUBkd5hPCW7NXCUfm9dHVmmKs4VS6gwEyV4j4nHHdB+cYCq
	 smsa3uzpTXcx7YKAzxQk6HHTQ//Ny2fNiiO3UgY4qY0oXBC0fbqcxW4LbvNnqbRLgd
	 Fxy36ADnplqbxDgOAPCO7KWlW5sOPi1dz1GMuiwRJazYJvcZCYM3ebKF/AotMiau7N
	 50lAdyTvxvOOCn5e3y6C2VUacOASKaVi+8smHAh3g+dQSzGsvdX6Y2i0IbvLPQ4Q0P
	 yXNKFB7X9cBLMsdR1N0cmttdd9NOplVn2yGzyY/5Wje2139C1/kKvbME3lAvh36cOH
	 g1xCKrxl/idMw==
Message-ID: <19a05a1e-6d27-40ad-bb61-b7ff4e3ddbb9@kernel.org>
Date: Thu, 24 Sep 2026 11:28:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Karl Mehltretter <kmehltretter@gmail.com>
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <rm4C3dzRACNd_2ryMMuye2bD7vs_rT_4nbtr2DN7t0Y3bTLnwruweMpVv4J_x2FOoSXvakXCuo7vOpCvY5Sr4g==@protonmail.internalid>
 <20260923074256.9357-2-liujianfeng1994@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260923074256.9357-2-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2026 08:42, Jianfeng Liu wrote:
> Commit 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on
> DEBUG_KERNEL kernels") fixed a dangling reference in the DMABUF_DEBUG
> default, which had the side effect of enabling the option (and with it
> the page-stripping sg_table wrapper handed to importers) on every
> kernel with DEBUG_KERNEL=y - i.e. virtually every distro kernel.
> 
> drm/msm is broken by this: it maps imported dma-bufs into the GPU's
> own pagetables with iommu_map_sgtable(), which needs the struct page
> of the attachment sg_table, and it fills the GEM object's page array
> through drm_prime_sg_to_page_array().  With the debug wrapper in
> place both silently produce garbage (the wrapper zeroes sg->length,
> so the page iterator yields nothing and an uninitialized array is
> kept).  The VM_BIND map job then fails asynchronously after userspace
> has already enqueued GPU work referencing the mapping, which shows up
> as an arm-smmu translation fault from UCHE, e.g.:
> 
>    gpu fault: ttbr0=000000088a889000 iova=000000010741c000 dir=READ
>    type=TRANSLATION source=UCHE
> 
> This breaks hardware video decode (clapper, chromium) on Adreno
> systems; bisected on a Snapdragon laptop as v7.3-rc3 good,
> v7.3-rc4 bad, culprit 143755bdabaa9.
> 
> Revert the default until importers that legitimately need to build
> phys-based mappings have been converted.
> 
> Fixes: 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kernels")
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

This is a very obviously LLM generated patch.

Please state so in the commit log.

Also I don't believe reverting the change is correct. Fix the bug where 
it exists in Adreno.

---
bod
