Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D04570FF;
	Fri, 11 Sep 2026 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112882; cv=none; b=ilTbRL9tc2MyAgeP9LB9j6p9y6FkH8SHTCIoocrtu+GGfw3CAwHbjI2KGXolCBggdYjxEHJCLjb3eQ8FrkkEGRBR11HELh9ywzuvI6dtPdtKL6RpL9LLJkPXGWXD/5CJq0j25tpCtcqkRBGDJ+kKNjxCUzv9ePMeVunog+hPRpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112882; c=relaxed/simple;
	bh=ruI4u/j0531/L6p3OmQduRDVD6eAPgK4O4B88AoufBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBd5uq7rEvXDgjXrrUqhBX2zUGnt0wHTu27ISgYuReI/li8fAfCIJB40dT62aN0dqR5gTkpABmUNc4tqfLQlx3V+e7bhjOa1TQr1I8zf0n19TdffpNKBX/3GnStRDsmIbKGUWSJPv/G0fIcXN0ZTkGu44K5BtZF3M+1TQFWm0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fKTBOdIU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fKTBOdIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789112876;
	bh=ruI4u/j0531/L6p3OmQduRDVD6eAPgK4O4B88AoufBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fKTBOdIU38tZS6iAx4RsuMRR2ViORWzbPsH7zJy86cIpgB4cIE44WdjoNAB7ftLGg
	 yCzwD6mJnjfFT+WTcPyUvTIGEWFZdZ+nBiWg0gfNeCmmtCzqBgAfItQf/JjNXFJPJn
	 Fo8kOgX3+W3tkS4r6kahQdKQBnagoxFo1mrT2q6+0e0pSnPyn+eoIi4VZMDMXFZN2p
	 E1YNUMCmSiBe+xtyuSLIK2XTt/iI+1PhbvYwQnS0kdaSGR0oVsddaGabEvS/vkySdW
	 3MHOtl0slIOUkVT0VUw/HDSpvtlkc2tg6FilUKX+tAc3E08DZlcuIuXWqGwwy0J1bQ
	 YX5GHHosJw7xA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6886417E0CA6;
	Fri, 11 Sep 2026 09:47:55 +0200 (CEST)
Message-ID: <87408499-de7e-4359-a2ea-d997abd1d0c4@collabora.com>
Date: Fri, 11 Sep 2026 09:47:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask
 to SoC data
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 justin.yeh@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-12-angelogioacchino.delregno@collabora.com>
 <cydeh263kd5o2un27oeplqx2phe7vzhxvk53kr7dbvtplazafv@rs37qtkhguhj>
 <4e658914-7a17-444b-b20b-8d8b647238b5@collabora.com>
 <m3fpa2igwmsnsxhhxtg5hubsmxbn2vmzcpo4hwacs66z52x5ll@xrl5kac2qmtk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <m3fpa2igwmsnsxhhxtg5hubsmxbn2vmzcpo4hwacs66z52x5ll@xrl5kac2qmtk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 07:15, Manivannan Sadhasivam wrote:
> On Thu, Sep 10, 2026 at 11:05:39AM +0200, AngeloGioacchino Del Regno wrote:
>> On 9/9/26 19:25, Manivannan Sadhasivam wrote:
>>> On Tue, Jul 07, 2026 at 05:42:44PM +0200, AngeloGioacchino Del Regno wrote:
>>>> In preparation for adding support for the eDP PHY found in newer
>>>> SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
>>>> data.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
>>>>    1 file changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
>>>> index 4603f28d1466..f5aadc5fdc42 100644
>>>> --- a/drivers/phy/mediatek/phy-mtk-dp.c
>>>> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
>>>> @@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
>>>>     * @regs_ana_lane:  Register (layout) offsets for ana_lan
>>>>     * @regs_dig_glb:   Register (layout) offsets for dig_glb
>>>>     * @regs_dig_lane:  Register (layout) offsets for dig_lan
>>>> + * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
>>>>     * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
>>>>     * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
>>>>     * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
>>>> @@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
>>>>    	const u8 *regs_dig_glb;
>>>>    	const u8 *regs_dig_lane;
>>>> +	/* Register masks */
>>>
>>> Duplicate comment. With this removed,
>>>
>>
>> Sorry but I think you didn't understand what the comments are there: the kerneldoc
>> is used to describe the structure, of course, but the comments in between are used
>> as a way to describe (and kind of enforce) the order of members.
>>
>> /* Register offsets */
>> u16 member1;
>> u16 member2;
>> ....
>>
>> /* Register maps */
>> const u8 *regs1;
>> const u8 *regs2;
>> ...
>>
>> /* Register masks */
>> u32 mask1;
>> u32 mask2;
>> ....
>>
>> etc.
>>
>> Does that make sense now? :-)
>>
> 
> Yes it does. Sorry for the oversight
> 
> - Mani
> 

No worries, it just happens to everyone from time to time :-)

Cheers,
Angelo
