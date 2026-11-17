Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916579;
	b=fm94xZjOEX5L+JjqqH0aegtOVh49HkC17+kkSvoNij2k6u9FdQUQyCx1iYq2qRoy7+C1
	 rGbLyKv93aWhr4jk2pZ/lul9yAKrh7aRz4Jw1h4+ffz98GmdJkSaJ/lhu/0VuJBiB07uR
	 9T2PsEOqbiBiGTTtJjlvf0Jxn9pS2imo6UFug73qardsmhgmOjebU8VD5Z0Cs+GJEc2A3
	 rbrCtCk+w9XjoAac0rI359C3qRwNx4g2lJsFIt+FvZyJTwbToPPF3A6a7hHn9cB2JKMGC
	 anA8ljhdIAXoEFkrPfCjLWbkDsCQ3cSmTE6Wmf5gjqrtqR7avUe7u4Ox/mc33kxyLEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916579;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+g4s4CsRp753caRGQ8nP+zdpf6kG+Xd0GDytahTsGS0=;
	b=O+foRqTfxPyaa89OCsatvG1IT/cu/v+wrPUo1FcRQ9ISTT4DeKulASfBrs6gfGWfVv/Z
	 2o9Y0qOBDLlIoqJxXp0rsCTkGr9yU62d/4BAUxCNbm7z+gEaumqiC6QD5gSa2NodOT0E0
	 OcpyvP9opN7zwOzzN+463VJDJkgvxbSqYKRO7qeO4gGakD7uyvo8qwKQTvA1CIbqMmocJ
	 SK3RGZ0N1uW/teGuynt+4+EPtdraqjwP72ENfh4ffhHgPxh/zS8PSAqXUEYwmEgrc+DGo
	 ak2PGXprQV2H3ZZS4QnpeJoxfpS2y2J1nRTBkN1j49my9dQryMgWIpBXMpAhuC9Z13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OJ0Ri1hX;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21505606A323;
	Tue, 17 Nov 2026 11:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21505606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OJ0Ri1hX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794916577;
	bh=xprsVSXiD6Uje2Wx13zsXfkOKpUEfW7TFnIEvYtbNDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OJ0Ri1hXzPmJy6FioVbhAf4bn01yT+Zlb2CZDVE2h4V9AHiSs9/HupFYguSY94qZA
	 E8AURRN8V9yBDcNjjQ4JDbtjEludhlQ8xV3Erz7XAS85bGtmXjZAOQYV0/qx8pZzwG
	 ZWWNroxc2nLR8p/Y4yGT6QMtKrgs0+8LZniFLbefHKvp61oD9X0/cPjodHGDlbWHHC
	 fXwuMa4GH40edpM0169EIqt7vtrcmeaLp2bmqK+PMEhiE3WatW6cP4csBF//ikLzkU
	 3WWwFzlMckmmdK6tGw31ZTkMbQpGC/nO3MPphBhgmzxoAAFTtLdU1Hti5ubM29Wpo9
	 1qkQt4+tAV4/w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA3AD17E05D6;
	Tue, 17 Nov 2026 12:56:16 +0100 (CET)
Message-ID: <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com>
Date: Tue, 17 Nov 2026 12:56:16 +0100
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
Subject: Re: [PATCH RESEND v5 3/4] nvmem: mtk-efuse: add CPU speedbin
 post-processing
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
 <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> MediaTek SoCs are often released under the same marketing name, but with
> different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
> mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
> 
> Since the speedbin is stored as a number in the efuse, add support for
> converting it to the bitmask for opp-supported-hw usage in the DT.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 980c29d01337..d2e5c69c580e 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
>   	return 0;
>   }
>   
> +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int index,
> +				     unsigned int offset, void *data, size_t bytes)

You can *literally* reuse mtk_efuse_gpu_speedbin_pp....


> +{
> +	u8 *val = data;
> +
> +	if (val[0] >= 8)
> +		return -EINVAL;
> +
> +	val[0] = BIT(val[0]);
> +	return 0;
> +}
> +
>   static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>   					 struct nvmem_cell_info *cell)
>   {
> @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>   	if (cell->nbits <= 3 &&
>   	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
>   		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
> +
> +	/*
> +	 * On mobile SoCs, the CPU speedbin is a number. Convert it to

Other SoCs have got the same efuse style as mobile SoCs: anyway, all MediaTek
SoCs (apart from networking ones) are (in a way or another) variants of the
mobile ones.

	if (cell->nbits <= 3 &&
	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0 ||
	    strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))) == 0)
		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;

Cheers,
Angelo

> +	 * a bitmask for supported-hw usage.
> +	 */
> +	if (strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))) == 0)
> +		cell->read_post_process = mtk_efuse_cpu_speedbin_pp;
>   }
>   
>   static int mtk_efuse_probe(struct platform_device *pdev)
> 



