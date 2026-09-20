Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841EA3E51F8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789922704; cv=none; b=tiEOr3x3hV6g4pyzJ9W+fa/ajREXsHingsAifCdnwovpdn79zSc20FbVC50ATnmFSyl/8mBkKlJAym6M/UYLSBGJ8mUmlFb07GD+aS29HTAA3AV3y4nnb73QEli8Ly6JDjkCu/BNE1b5KuSt3TXLxDFzs9UNDTGiI8sA+eAL2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789922704; c=relaxed/simple;
	bh=U2SEVMMBM2oBxPJceSFXH0toXJtnPV2187ZEM0CBGbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCB4V57jtjAtknBf1Kv8iHIwPV3hZFnRm4/29hasfy0ldqGpqXtr4DWTFIRKz+BIGJSE6bQnAudcmKA66qpjzyu5373jPCoAJ+AoM3c/nemKlEUNNByB00OV6InILybomr7mY24TRiz91p+F6MMFrHSYIG349RTty3cUQSgfBh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nta+sS1y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nta+sS1y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64661F000FF;
	Sun, 20 Sep 2026 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789922703;
	bh=ONy9/2581bILVhAB1ty1WLi3VoN6cFcTsuhn9VMjyng=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nta+sS1ymInEHAcYL21C5ckeCN01eLzhYv5iDoBSPu/bFyNxk2IMVfG866uzX29WF
	 sg05wWtsHqRPObu+xMFOjtvPguMHm4e2wVNoJww73xL/iEtIgs8a/QT0PUyf4wEq3k
	 pTP42PArXCJgrXtAF3JjLYAeAIBx+nSRkjDexL2Y5OiDab3ZV/jdwfkrKS1q0M5ifI
	 +9d/vSRqVSR5ZskZssHYVm/bw1CWQpJd71lerg4yKLCwveSuRwp5+pMmMxhE0CXoP3
	 SuklxY6JQxe0lQXLo7Anrfl8O8NxCo6OWqBx8kmRRmY0C7GxmL9sy0Mb/VpvUGDtFJ
	 zz8tTuetIyG8g==
Message-ID: <5a153e76-a149-4084-92cb-785f7b47c6d2@kernel.org>
Date: Sun, 20 Sep 2026 17:44:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: layouts: u-boot-env: handle quotes in MAC post
 process
To: "Michael C. Pratt" <mcpratt@pm.me>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
References: <20260820211654.8794-1-mcpratt@pm.me>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260820211654.8794-1-mcpratt@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/20/26 10:17 PM, Michael C. Pratt wrote:
> Although it is not common, some board models from some vendors have
> a MAC address stored in u-boot environment as a quoted form, e.g.
> 
>     ethaddr="AA:BB:CC:DD:EE:FF"
> 
> This is acceptable formatting for a u-boot environment variable, however,
> it makes parsing MACs in post processing more variable and currently fails.
> 
> Add a second attempt when initial processing of the MAC address fails,
> by allowing a longer length and try parsing again if it seems to be quoted.
> 
> The mac_pton() function has strict behavior on the length and location
> of delimiters for each octet and that each digit is hexadecimal,
> so attempting different offsets of the same string is not problematic.
> 
> Signed-off-by: Michael C. Pratt <mcpratt@pm.me>
> ---
>  drivers/nvmem/layouts/u-boot-env.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

this patch looks stale as
commit 45cb0223740b863089ce3cc523155cf7a55e1479
Author: Tomasz Maciej Nowak <tmn505@gmail.com>
Date:   Sat May 30 21:53:33 2026 +0100

    nvmem: layouts: u-boot-env: check earlier for ethaddr length

already has some changes in this area,


--srini
> 
> diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
> index f27f387bb52a..ff71c3c25d42 100644
> --- a/drivers/nvmem/layouts/u-boot-env.c
> +++ b/drivers/nvmem/layouts/u-boot-env.c
> @@ -38,11 +38,15 @@ static int u_boot_env_read_post_process_ethaddr(void *context, const char *id, i
>  {
>  	u8 mac[ETH_ALEN];
>  
> +	/* Handle quotation which increases length by 2 bytes if present. */
>  	if (bytes != MAC_ADDR_STR_LEN)
> -		return -EINVAL;
> +		if (bytes != MAC_ADDR_STR_LEN + 2 && !(*(char *)buf == '"' || *(char *)buf == '\''))
> +			return -EINVAL;
>  
> +	/* Handle quotation which offsets data by 1 byte if present. */
>  	if (!mac_pton(buf, mac))
> -		return -EINVAL;
> +		if (!mac_pton(buf + 1, mac))
> +			return -EINVAL;
>  
>  	if (index)
>  		eth_addr_add(mac, index);

