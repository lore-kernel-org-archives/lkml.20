Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920437;
	b=cAapKHbUyhiErEhPA6Fj1IjsdE+ld/r4Yb+AOvmHfkm0wGp1e29dimHwNOA0GlbVeF07
	 CGXrfwS5QszweYyfJBbgbLtN6DoGMMhEwP5biXWTqBn1kC/gsaFOiStfUFuDp+tMcJE24
	 X6z3qKFI1CT4PJHx7/rNz8ZsNQwjlLYBzrWwYWCfEqdjZOZDP1WcIuAEZGRR8c+cUMwpT
	 8cPO3T3PgsgqrsM1z/6RurFjD7Fy3Dm2ZoSmVperC4YqSaJG30PYa4lz6hSbAFraRKlW5
	 ThQ3CL+2Rpb8k+VqSuhoECbq/oaNKX2e/eVmalhCsqE+TWX7xw5rULL75JO4NQLFm6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920437;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JUOdabo39cYI+zW/eEKHZMnZIatTlY+cId8myHDRV2s=;
	b=moYc/6PaXL4NwIK6k+GHoeYZRhS0U0EMhbGQ3FkVX2srjJJFBqXOnsFplMjxNnWX6/dl
	 6Wmg1MgHk52ajWpYOvQFEWnh9JTRM3LH8bPRIt/R+bWLN7CX1Rj+JjyzGpB9X1Hz/p4in
	 j6WXjIo81yPFK/lyqz59EPVddmmR91ua3hiYLiJSTy338T4BsNLFZ1MEolDfdP9uSOHE/
	 oOpcRD11QjdoJtQg/leSwke9h1xJEMy8bwfnLpu0uohQDVropRnrJP2qaIxXW1y2A5QbW
	 UUGbQd26U69oz+wfE7FQWsrN+5NMfKFyDszkiWvJvsAM0S02wbmSU1wcsrtx58+PK0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ERMF1Msp;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0F606A33A;
	Tue, 17 Nov 2026 13:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E0F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ERMF1Msp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794920435;
	bh=J3o9ngeXHrhSGhzzdLAJVM84tQSLjRDwo0it59TZFqc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ERMF1MspUmEZvVpSORcKjItgszj/8BSvOB7x26APsQ2AQSpzeeccdcBlX7+uLPgbP
	 PxE+G9cS86OImKnO9S3Fx1Urkk1FO3bjGCyuq/yWstbF0Wg2FNF/PBgZhQfAkekTE5
	 jmeuiIKolKkdeMejklUybPd6XuNbLsTbeI8E7C0lSsf9T95zz9viG/QVv8Hh0kXVHW
	 XaOofoZTYtmUo0DgaTtb4P7bt/S31/+Mxb7E9N8mCDxM6PXcWNDoPGOJo1F4PZIsSN
	 wq+nd1nkUYXI5niB/Kwy2kizEsn4M8Ap5ty5KpVCxzRZgzLTUfDEy4nd9YZxka9AJC
	 4gSt9pr6OYUKw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A52E17E00E8;
	Tue, 17 Nov 2026 14:00:34 +0100 (CET)
Message-ID: <911e4163-8a2c-4ca2-8903-8d3ddb7266e8@collabora.com>
Date: Tue, 17 Nov 2026 14:00:33 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8167: Add DRM nodes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260921113914.779393-1-l.scorcia@gmail.com>
 <20260921113914.779393-5-l.scorcia@gmail.com>
 <bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org>
 <200ef6c1-eced-4c36-832d-3fb409aac866@collabora.com>
 <5715e9e5-857d-4104-aedd-9662da0fc0ab@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5715e9e5-857d-4104-aedd-9662da0fc0ab@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 13:55, Krzysztof Kozlowski wrote:
> On 17/11/2026 13:53, AngeloGioacchino Del Regno wrote:
>> On 11/17/26 13:35, Krzysztof Kozlowski wrote:
>>> On 21/09/2026 13:38, Luca Leonardo Scorcia wrote:
>>>> Add all the DRM nodes required to get DSI and DPI to work on MT8167 SoC.
>>>>
>>>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt8167.dtsi | 369 +++++++++++++++++++++++
>>>>    1 file changed, 369 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>>>> index 27cf32d7ae35..a50bae4307c1 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>>>> @@ -16,6 +16,22 @@
>>>>    / {
>>>>    	compatible = "mediatek,mt8167";
>>>>    
>>>> +	aliases {
>>>> +		aal0 = &aal;
>>>> +		ccorr0 = &ccorr;
>>>> +		color0 = &color;
>>>> +		dither0 = &dither;
>>>> +		dpi0 = &dpi0;
>>>> +		dpi1 = &dpi1;
>>>> +		dsi0 = &dsi;
>>>> +		gamma0 = &gamma;
>>>> +		ovl0 = &ovl0;
>>>> +		pwm0 = &disp_pwm;
>>>> +		rdma0 = &rdma0;
>>>> +		rdma1 = &rdma1;
>>>> +		wdma0 = &wdma;
>>>
>>> Folks, what is happening here? Why Mediatek is adding bunch of
>>> undocumented aliases? This should have never been accepted to Mediatek SoC.
>>>
>>
>> It's always been like this on MediaTek from day 1, what's up with that!?
> 
> I wrote what is wrong - they are undocumented. You were never allowed to
> add undocumented ABI, never. Even 10 years ago.
> 

Well, that's right.

> I don't know what is day 1 in this context, but for a few (5-8 years?)
> we do not allow more custom aliases. Neither new DTS users of these.
> 

That actually poses a severe issue, as mediatek-drm relies on aliases to find out
the instance number of the display controller components, on all SoCs.

Any advice on how to possibly resolve this without rewriting the entire thing?

Mapping that by mmio address in the driver seems too stupid/dirty/bad/etc.

Thanks,
Angelo
