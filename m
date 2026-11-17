Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930529;
	b=gPDO3F4sX7h3ejnOCAdSgwkMY7Pwz7jV7jzq0bHN0Jf3fVo/mcO8AABZeEp5j4s+6lnq
	 7yhBS35mSgB5z34100WQD+IxeIcXlb+OY8VFD7dYp0XHdrONqv52aXqNoqsB8aFBm5QO4
	 nuYP0pZRPU3fVpme99Igf0vj0dANzRA5c3O4sO8ZROS/oqH+oONz+R2v7vD191w+wpGap
	 4D7fGXW2ot6hZTH+HIvlShL3MpMcCDoW2FXKJia3VpM15PCQoMz180/cupEnNRWYWqg0/
	 p3K4uiPRvmhKnLZIfMUtrzTfzjmPr+byS6wN24QCJTYHEsVA7XfwDsZ9LEMbbydUMrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930529;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VgPRk0vDvsuBvOpeo8M0DW1178H12JJzSD3va/dOj4Y=;
	b=p2X+bCQElR3zQAgTXHwPkDhvU35KHnwBWeWVB0hP0+LoJWmEvriLreDQyjJyEqMKBZ7K
	 htw466nCmObrXTPbDumPI9bJyqZLHCx3NJsW4AO5iMQR7hOHkzUhgFX4BiZWab1sPL7pH
	 OnycOPU/YjX1DUlEYpVz625Pu/mCoD383xydwd09kAG/5BrNI1Pwh9+Y1QQRxjvmQCqBL
	 4Tv+6JoDWL1AMZPzObRq0hyMzQaCmO/YHkIqEY5LAZuUD3g86Cx+OaAVf5/hK3A3YvTNS
	 bBtSQC1ScX2n2XjcOGnVcle933KyRt+XdlPR1iK81dpKUbxDW59mrsc5+aDoi2w9r/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMFkgrBe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74A2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMFkgrBe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE81A1F000C4;
	Tue, 17 Nov 2026 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794930529;
	bh=VgPRk0vDvsuBvOpeo8M0DW1178H12JJzSD3va/dOj4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oMFkgrBeuXKxA+zSIGSIukJnHe3kyV+BDMKJJgcpoWorTmXRuwCbsF/riDTModdvK
	 o1GrRZjPSCb9ATAHtQ68nqfowcCDeb6txzsaE5RK2HNXPeHQNLAfIQBVLtvOdFi9BQ
	 fPRFH3pgKSpoeI7JIY+TJPnFQRWiwpHFjklH1HYCMshwtO0Oi5SrnKfKKtGDXiEwwq
	 eSDA/t4zvPoTKjFAfXeG47o3sqYz6+0zWp19D3D0+WGyOQz0cL2uTArfj5SEOuPAEn
	 0xHLTv6n4x8t8ctlra2TJx/Js5/zUb92vouxH+udDFBFVwE5LsBjPvdkQya7ZDb+oq
	 tVoFJyW/pxQHw==
Message-ID: <1cdf714e-50fb-4ad9-9d1e-a5e878f381da@kernel.org>
Date: Tue, 17 Nov 2026 15:48:45 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: layouts: u-boot-env: Put cell nodes on
 registration failure
To: Zhu Jun <zhujun2@cmss.chinamobile.com>, rafal@milecki.pl
Cc: srini@kernel.org, linux-kernel@vger.kernel.org
References: <20261112023114.118202-1-zhujun2@cmss.chinamobile.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261112023114.118202-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/26 2:31 AM, Zhu Jun wrote:
> u_boot_env_parse_cells() takes a reference to each matching child node
> before registering its cell. nvmem_add_one_cell() transfers that reference
> to the cell on success, but does not release it if cell allocation or
> initialization fails.
> 
> Drop the node reference when registration fails, preserving the existing
> behavior of continuing with the remaining environment variables.
> 
> OpenAI Codex assisted with analysis and patch preparation.
> 
> Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")

Missing CC Stable

--srini
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/nvmem/layouts/u-boot-env.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
> index 33ec2350386f..f4839571b794 100644
> --- a/drivers/nvmem/layouts/u-boot-env.c
> +++ b/drivers/nvmem/layouts/u-boot-env.c
> @@ -78,7 +78,8 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
>  			info.read_post_process = u_boot_env_read_post_process_ethaddr;
>  		}
>  
> -		nvmem_add_one_cell(nvmem, &info);
> +		if (nvmem_add_one_cell(nvmem, &info))
> +			of_node_put(info.np);
>  	}
>  
>  	return 0;

