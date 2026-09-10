Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA5935BDCE;
	Thu, 10 Sep 2026 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031144; cv=none; b=WEoU8ofNALSzQbrAmsMUvFLWEUyRsS2yAqRIeui8YQj8GpSgE5wCkC1qFdPN9Vd1ZBHZTtIWHKNb8Zid6xGDvUamd9asX4AF85apLkAuAn+kusIZrJ/lp8UHY19u8XXqd3vTyfK0GbAGXvuHMI7f0Olh2xRe56dNTXwzPG0P26I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031144; c=relaxed/simple;
	bh=ENZtiC11cN8l9AXK3zwCWvbeBdYrcIe4dNlUeqoNVa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ro2IpetiDmbRTDE8nvrsdrimo1GVPwCG1Fn5YL+PVHFLOH3LST4sTwPkPnr9wglSisE9UXEjcsbWYXRw1gZwPLY41WzYwsIxWQsjgWdQ4uY+Ll4NMHtvU/7U73TgaDj7SiISWsHEv+MDnS3F2tN+ccJv/7eHVrRrTss8qWlEnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hpwx1d6K; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Hpwx1d6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789031140;
	bh=ENZtiC11cN8l9AXK3zwCWvbeBdYrcIe4dNlUeqoNVa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hpwx1d6KkcuuuuFphNt/pZ/VR8BjoOH5fv8MXS0R+5rm9HjX1Cd2liAZ6onBYK+la
	 UCLg7HGxELLEciRfhop14a1zKwPvk4B1xFRtWouRB3QLlfH2jhCvXyDVRwRHOiQLvh
	 uwUxJuCEdaRV/rfQnFmoZtEbxu3712xOozfhdI5whCMvB+k1i0Uzoe9LYbsdP9jq4o
	 e70XRYF4vOLRWRqNCenNscEKPoAXHCqW5DN8G8npBiSAmWZr0RXmhT30HttnlubQwn
	 aT0JDEf88wFwKzfSR1HiWUZlDIGJ0hdVnAA6cREzbbhtn1EpOwH3f4ra3pYe2PwY/l
	 kgC7V9GLK8t0g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C301817E05D3;
	Thu, 10 Sep 2026 11:05:39 +0200 (CEST)
Message-ID: <4e658914-7a17-444b-b20b-8d8b647238b5@collabora.com>
Date: Thu, 10 Sep 2026 11:05:39 +0200
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cydeh263kd5o2un27oeplqx2phe7vzhxvk53kr7dbvtplazafv@rs37qtkhguhj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 19:25, Manivannan Sadhasivam wrote:
> On Tue, Jul 07, 2026 at 05:42:44PM +0200, AngeloGioacchino Del Regno wrote:
>> In preparation for adding support for the eDP PHY found in newer
>> SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
>> data.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
>> index 4603f28d1466..f5aadc5fdc42 100644
>> --- a/drivers/phy/mediatek/phy-mtk-dp.c
>> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
>> @@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
>>    * @regs_ana_lane:  Register (layout) offsets for ana_lan
>>    * @regs_dig_glb:   Register (layout) offsets for dig_glb
>>    * @regs_dig_lane:  Register (layout) offsets for dig_lan
>> + * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
>>    * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
>>    * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
>>    * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
>> @@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
>>   	const u8 *regs_dig_glb;
>>   	const u8 *regs_dig_lane;
>>   
>> +	/* Register masks */
> 
> Duplicate comment. With this removed,
> 

Sorry but I think you didn't understand what the comments are there: the kerneldoc
is used to describe the structure, of course, but the comments in between are used
as a way to describe (and kind of enforce) the order of members.

/* Register offsets */
u16 member1;
u16 member2;
....

/* Register maps */
const u8 *regs1;
const u8 *regs2;
...

/* Register masks */
u32 mask1;
u32 mask2;
....

etc.

Does that make sense now? :-)

Cheers,
Angelo


> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> - Mani
> 
