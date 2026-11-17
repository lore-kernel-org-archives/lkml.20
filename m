Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917285;
	b=HiDtmuqBz/vQqiabxeuXm0C6GJnnCGGsXsuLlRyZne+kFXBI43SED8V2WluimI9OZtgC
	 jnwyqHHxzYga6aY+ar+LH8L6qH1TZIpfMsypOpYRrICAfuVXC8LpApwKFk2CAw8E1dcG3
	 RsBZ2NJS+MfIoI4zzcSL0iM3v6pc8/XyTQz+O16Y1/xkDlSPDbTFV6jxRRaXCB9T4bDwn
	 qyvcQ7SL+NuqyTVjaVZDJUH3OxQFafqLlPCB/QuXLmy6bmmpbhHdDnZFtsVpTWNedJX2W
	 wqWWTvoR7sg3itNHA+jix/4C2KICZwk8uo2CrH69vzkfJif5z40VS8bz1yPBrPFoe3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917285;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LFj3lXy8NNHrgy9P4EuYba2xkoAH+TOYY0+5Iczv/q8=;
	b=ENj1Zuhm96Q7qT/N2OxtxiSSxZGzgdaB1/rRQSTFlwKN7Oh7vl1LtQBp2g14JBg6wEMo
	 T7JcAvL3PrlzblrlSNDf7NDzUNpKml3dCTkD+ddQYTL98LoNiffSvFEp4wFQhXJse5vJx
	 YEEBGiOdSlmVPSLDOByf9Lh0IWNGQs4E2GX0S1qGGICEfJtAvuoHGycQw17xlSS4cA61J
	 ue1agxXC/LjKNK//lOHOdfC754aG6D+y5CVNsYugWUmmMLdOIVB+CjehWhKnkS+rqVOGI
	 +10/Y8hO043zoWVWyPCbdKXmvUgT/nE7QjDNmFt25VF6tEzB1VO6hg8CCka+SNjhpDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="g5Zst9//";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3628606A339;
	Tue, 17 Nov 2026 12:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3628606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=g5Zst9//
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794917283;
	bh=qGJ17IHmxkOflCOJsC/QkOY+G2dnIFle6zJPxp+P/7I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g5Zst9//jEGwPRI2YVRn13Ge4CrvbaNDygbVKekV3LEcFCHtNupowTPbIecPAePKM
	 zhNFpAjFJOOOCUoFV5dvjgYDgOmbcSrLROXZdi/gcOgujS3XxFXoC7YwkqP+IKXdqx
	 1R9e6RQCGFonunfgM/RicojeTaKvGIkScD4cBgcW9CgghkiILWL89MzeFBvQi1Ihxp
	 I9Gn1MRFjOSqS/hTCpoJLSlv3OY2wGeCBACLVD/llWvGnulPUZm0FCupxM3sz3EQwe
	 K0rLoXI+2M312jQ6LP2d2zStRgnbsL1GxW9HzjQjR+kO4Nz+jNmXL6IJo/gDPErav0
	 gBB8gzRb00kRg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9365A17E00E8;
	Tue, 17 Nov 2026 13:08:02 +0100 (CET)
Message-ID: <6935d7a4-2f91-4abf-81e9-f77c2b6c80d2@collabora.com>
Date: Tue, 17 Nov 2026 13:08:02 +0100
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
To: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
 <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
 <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com>
 <k8LLawty9o68P00hLr5LO1163o_m16f_vf8fBZvdD18nOatszy1i4Dp7DeC8Hv2--Q08YyZfhCRnQbVDps0lqB2zZrx-k_GxKUaqj6eT6r4=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <k8LLawty9o68P00hLr5LO1163o_m16f_vf8fBZvdD18nOatszy1i4Dp7DeC8Hv2--Q08YyZfhCRnQbVDps0lqB2zZrx-k_GxKUaqj6eT6r4=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 13:02, Roman Vivchar wrote:
> Hi Angelo,
> 
> On Tuesday, November 17th, 2026 at 1:56 PM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
>>> From: Roman Vivchar <rva333@protonmail.com>
>>>
>>> MediaTek SoCs are often released under the same marketing name, but with
>>> different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
>>> mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
>>>
>>> Since the speedbin is stored as a number in the efuse, add support for
>>> converting it to the bitmask for opp-supported-hw usage in the DT.
>>>
>>> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>>> ---
>>>    drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
>>> index 980c29d01337..d2e5c69c580e 100644
>>> --- a/drivers/nvmem/mtk-efuse.c
>>> +++ b/drivers/nvmem/mtk-efuse.c
>>> @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
>>>    	return 0;
>>>    }
>>>
>>> +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int index,
>>> +				     unsigned int offset, void *data, size_t bytes)
>>
>> You can *literally* reuse mtk_efuse_gpu_speedbin_pp....
> 
> No, I can't. On later SoCs CPU speedbin has different encoding.
> For example, on mt6768 it can be stored in either low or high 4 bits.

That's the part where you pass the right nbits in devicetree for the speedbin cell,
being it still 4 bits, that statement doesn't change the outcome.

> This is out of scope for this series, but I'd like if we kept this
> callback for the future SoCs.

All that the logic of your mtk_efuse_cpu_speedbin_pp is doing is assigning

BIT(val[0])

to val[0].

All that the logic of mtk_efuse_gpu_speedbin_pp is doing is assigning

BIT(val[0])

to val[0].

To me, that looks code duplication, and duplication is bad.

> 
>>
>>> +{
>>> +	u8 *val = data;
>>> +
>>> +	if (val[0] >= 8)
>>> +		return -EINVAL;
>>> +
>>> +	val[0] = BIT(val[0]);
>>> +	return 0;
>>> +}
>>> +
>>>    static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>>>    					 struct nvmem_cell_info *cell)
>>>    {
>>> @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>>>    	if (cell->nbits <= 3 &&
>>>    	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
>>>    		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
>>> +
>>> +	/*
>>> +	 * On mobile SoCs, the CPU speedbin is a number. Convert it to
>>
>> Other SoCs have got the same efuse style as mobile SoCs: anyway, all MediaTek
>> SoCs (apart from networking ones) are (in a way or another) variants of the
>> mobile ones.
> 
> They're not really variants, some of them have no direct mt81xx/83xx sibling.
> 
Noone looked hard to find the siblings for some of them - though there might be
one (and just one) that has no sibling :-)

Regards,
Angelo
