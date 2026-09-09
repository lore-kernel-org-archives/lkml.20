Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D21545D89;
	Wed,  9 Sep 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953711; cv=none; b=Q3gMFxwNwh6wWGScy2Hzs5fADvSmWNFItW58M0WKSAO7xwgkhKGQL/TLJBGK0GVLJtnQt1tu6hWBeZFInVE8Hks715Ksd3/N5vzqtRR18fp3mBTWUdHl3NnkQhKIZecUrXWF5+SM56GF4Hcm6MEtuEJHa/c31KCRHvPXUNZXiGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953711; c=relaxed/simple;
	bh=vWtYzgFoGyDW55i1EvWYaGwYdE+b+139zE1xcTgIGLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZE8e8lL9EHBW6G9XRK5nprttJLTAjmsHvYyNgtn6L8V4B4b/9KgsCZFKs4CuWbNfS5HczPOmN9oHP3T8/ogS1RJnSryQVyTl20+dz/KCG7NrmgTBlcX5ZV9hefUjuOQa41YPo8b80Wtdmf2LnNyBTyDGbLpF5v6jp/fta1mnUfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hDZ/cSx0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hDZ/cSx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788953706;
	bh=vWtYzgFoGyDW55i1EvWYaGwYdE+b+139zE1xcTgIGLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDZ/cSx0bzccFpphdPKKNtfp6k0jlDQ1n23WXH3eE8oCcTUe/6KRHEt6rQC8pSJJZ
	 10Shmt7hi2kahfuAmSUfXa7VNc2TN3DUfB5SlCo5s3+YqyYUfee8bdf0cDgKEfmniS
	 vrPtpgIJATczURXsqnfmQKIBE95ehYnJozWK3RNRjguiZPDGZqqdVfjSxdGLWKMlks
	 1dMsp+ZBWQo7DC+h/WQOCVAlgpzrZJ2Eiw3wGypOa44P9/GF61uvy3Q6jvQIvb3QmE
	 FNL736Ore/nnmdh6QheYCK0gCxI3ZZJ4LhqGO8Mw3itzK984Q5Yna3nSLCIJzCusRH
	 t7/vTN9j8OSkQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E53017E0917;
	Wed, 09 Sep 2026 13:35:06 +0200 (CEST)
Message-ID: <6800d4bc-cb1e-4807-a302-3f5d7a3a53e8@collabora.com>
Date: Wed, 9 Sep 2026 13:35:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] drm/mediatek: mtk_dp: Rework register offsets
 for proper PHY usage
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "granquet@baylibre.com" <granquet@baylibre.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 =?UTF-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
 <20260709113148.49090-7-angelogioacchino.delregno@collabora.com>
 <ad5343f93cc992dca96b42f6cb81868de0458f70.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ad5343f93cc992dca96b42f6cb81868de0458f70.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/28/26 05:32, CK Hu (胡俊光) wrote:
> On Thu, 2026-07-09 at 13:31 +0200, AngeloGioacchino Del Regno wrote:
>> Rework all of the register offsets to subtract the DP PHY register
>> range from the MediaTek DisplayPort IP register range which starts
>> from TOP_OFFSET instead.
>>
>> This is done in preparation for adding support for registering the
>> PHY from devicetree, and also for properly handling PHY registers
>> in the PHY driver (instead of half and half...), which is also one
>> prerogative to add support for new IP versions in the future.
>>
>> Note that the current regmap_config was renamed to make sure that
>> it being legacy is mentioned, as a new config will be required in
>> future changes.
>>
>> Of course, with the TOP offset being related to hardware registers
>> this will never change for the currently supported SoCs, hence for
>> simplifying code, the MTK_DP_TOP_OFFSET_LEGACY is added statically
>> to the legacy regmap configuration while, on the other hand, it is
>> added dynamically to the mtk_dp structure, as the latter is used
>> to add an offset to every register write in the mtk_dp driver.
>>
>> The regmap_config provided reg_base (which does exactly the same)
>> cannot be used here, because the PHY driver is using the very same
>> regmap pointer, and the offset shall not be taken into account in
>> writes performed by the PHY driver (only ones performed by mtk_dp!).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dp.c     | 101 +++++-----
>>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 255 ++++++++++++--------------
>>   2 files changed, 179 insertions(+), 177 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>> index b50264ca1f31..b2e5fa0914bc 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>> @@ -35,6 +35,27 @@
>>   
>>   #include "mtk_dp_reg.h"
>>   
>> +/* PHY Registers - for legacy only */
>> +#define DP_PHY_GLB_BIAS_GEN_00		0x0
>> +#  define RG_XTP_GLB_BIAS_INTR_CTRL	GENMASK(20, 16)
> 
> Align the register definition indent to other mtk dp register definition.
> 

The plan is to make cosmetic changes later to align all register definitions
in the entire mediatek-drm to follow that, because this indent style is a bit
more readable, especially when definitions get a bit more complex.

#define REGISTER
#  define REG_BITMASK0
#    define BITMASK_RELATIVE_VALUE
#  define REG_BITMASK1

>> +#define DP_PHY_GLB_DPAUX_TX		0x8
>> +#  define RG_CKM_PT0_CKTX_IMPSEL	GENMASK(23, 20)
>> +#define MTK_DP_0034			0x34
>> +#  define DA_CKM_CKTX0_EN_FORCE_EN	BIT(10)
>> +#define DP_PHY_LANE_TX_0		0x104
>> +#define DP_PHY_LANE_TX_1		0x204
>> +#define DP_PHY_LANE_TX_2		0x304
>> +#define DP_PHY_LANE_TX_3		0x404
>> +#  define RG_XTP_LNx_TX_IMPSEL_PMOS	GENMASK(15, 12)
>> +#  define RG_XTP_LNx_TX_IMPSEL_NMOS	GENMASK(19, 16)
>> +#define DP_PHY_AUX_RX_CTL		0x1040
>> +#  define RG_DPAUX_RX_VALID_DEGLITCH_EN	BIT(2)
>> +#  define RG_XTP_GLB_CKDET_EN		BIT(1)
>> +#  define RG_DPAUX_RX_EN		BIT(0)
>> +
> 
> [snip]
> 
>>   static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
>>   {
>> -	int ret = regmap_write(mtk_dp->regs, offset, val);
>> +	int ret = regmap_write(mtk_dp->regs, offset + mtk_dp->legacy_regoff, val);
>>   
>>   	if (ret)
>>   		dev_err(mtk_dp->dev,
>> @@ -436,7 +460,7 @@ static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
>>   static int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
>>   			      u32 val, u32 mask)
>>   {
>> -	int ret = regmap_update_bits(mtk_dp->regs, offset, mask, val);
>> +	int ret = regmap_update_bits(mtk_dp->regs, offset + mtk_dp->legacy_regoff, mask, val);
>>   
>>   	if (ret)
>>   		dev_err(mtk_dp->dev,
>> @@ -566,7 +590,8 @@ static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
>>   			   DP_TEST_COLOR_FORMAT_MASK);
>>   
>>   	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
>> -			   val, PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
>> +			   FIELD_PREP(PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK, val),
> 
> This is not related to register offset, so move to other patch.
> 
>> +			   PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
>>   	return 0;
>>   }
>>   
> 
> [snip]
> 
>>   static int mtk_dp_phy_configure(struct mtk_dp *mtk_dp,
>> @@ -1401,21 +1414,21 @@ static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
>>   			   SW_RST_B_PHYD, SW_RST_B_PHYD);
>>   	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
>>   			   DP_PWR_STATE_BANDGAP_TPLL, DP_PWR_STATE_MASK);
>> -	mtk_dp_write(mtk_dp, MTK_DP_1040,
>> +	regmap_write(mtk_dp->regs, DP_PHY_AUX_RX_CTL,
>>   		     RG_DPAUX_RX_VALID_DEGLITCH_EN | RG_XTP_GLB_CKDET_EN |
>>   		     RG_DPAUX_RX_EN);
>> -	mtk_dp_update_bits(mtk_dp, MTK_DP_0034, 0, DA_CKM_CKTX0_EN_FORCE_EN);
>> +	regmap_clear_bits(mtk_dp->regs, MTK_DP_0034, DA_CKM_CKTX0_EN_FORCE_EN);
> 
> How do you know MTK_DP_1040 has a meaningful name DP_PHY_AUX_RX_CTL?

Datasheet states the name.

> Why don't you know MTK_DP_0034 has a meaningful name?

...datasheet doesn't state the name :-)

> 
>>   }
>>   
>>
> 
> [snip]
> 
> 
>> @@ -69,43 +29,59 @@
>>   #define DP_TX2_PRE_EMPH_MASK			GENMASK(19, 18)
>>   #define DP_TX3_VOLT_SWING_MASK			GENMASK(25, 24)
>>   #define DP_TX3_PRE_EMPH_MASK			GENMASK(27, 26)
>> -#define MTK_DP_TOP_RESET_AND_PROBE	0x2020
>> +#define MTK_DP_TOP_RESET_AND_PROBE	0x20
>>   #define SW_RST_B_PHYD				BIT(4)
>> -#define MTK_DP_TOP_IRQ_MASK		0x202c
>> +#define RG_SW_RST_MASK				GENMASK(7, 0)
>> +#define RG_SW_RST				0xff
>> +#define RG_PROBE_LOW_SEL_MASK			GENMASK(18, 16)
>> +#define RG_PROBE_LOW_SEL			BIT(16)
>> +#define RG_PROBE_LOW_HIGH_SWAP_MASK		BIT(23)
>> +#define RG_PROBE_LOW_HIGH_SWAP			BIT(23)
> 
> These new definition is not related to this patch, so move to other patch.
> 
>> +
>> +#define MTK_DP_TOP_IRQ_MASK		0x2c
>> +#define ENCODER_IRQ_MSK				BIT(0)
>> +#define TRANS_IRQ_MSK				BIT(1)
> 
> Ditto.
> 
>>   #define IRQ_MASK_AUX_TOP_IRQ			BIT(2)
>> -#define MTK_DP_TOP_MEM_PD		0x2038
>> +
>> +#define MTK_DP_TOP_MEM_PD		0x38
>>   #define MEM_ISO_EN				BIT(0)
>>   #define FUSE_SEL				BIT(2)
>>   
>> -/* offset: ENC0_OFFSET (0x3000) */
>> -#define MTK_DP_ENC0_P0_3000			0x3000
>> +#define EDP_TX_TOP_CLKGEN_0		0x74
>> +#define EDP_TX_TOP_CLKGEN_REST_MASK		0xf
>> +#define EDP_TX_TOP_CLKGEN_REST_VALUE		0xf
> 
> Ditto.
> 
>> +
>> +/* offset: ENC0_OFFSET (0x1000) */
>> +#define MTK_DP_ENC0_P0_3000			0x1000
>>   #define LANE_NUM_DP_ENC0_P0_MASK			GENMASK(1, 0)
>>   #define VIDEO_MUTE_SW_DP_ENC0_P0			BIT(2)
>>   #define VIDEO_MUTE_SEL_DP_ENC0_P0			BIT(3)
>>   #define ENHANCED_FRAME_EN_DP_ENC0_P0			BIT(4)
>> -#define MTK_DP_ENC0_P0_3004			0x3004
>> +#define DP_I_MODE_ENABLE				BIT(6)
>> +#define REG_BS_SYMBOL_CNT_RESET				BIT(7)
> 
> Ditto.

Ok

> 
>> +#define MTK_DP_ENC0_P0_3004			0x1004
>>   #define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK		BIT(8)
>>   #define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0		BIT(9)
>>   #define SDP_RESET_SW_DP_ENC0_P0				BIT(13)
>>
> 
> [snip]
> 
>>   #define VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT		(3 << 8)
>>   #define VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT		(4 << 8)
>>   #define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK		GENMASK(14, 12)
>> -#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB		(0 << 12)
>> -#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422		(1 << 12)
>> -#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420		(2 << 12)
>> +#  define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB		0
>> +#  define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422	1
>> +#  define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420	2
> 
> You change the value. Why?
> 

That's done in order to use the FIELD_PREP macro.

Cheers,
Angelo

> Regards,
> CK
> 
>> +#  define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YONLY		3
>> +#  define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RAW		4
>>   #define VIDEO_MN_GEN_EN_DP_ENC0_P0			BIT(15)
>> -#define MTK_DP_ENC0_P0_3040			0x3040
>> +#define MTK_DP_ENC0_P0_3040			0x1040
>>   #define SDP_DOWN_CNT_DP_ENC0_P0_VAL			0x20
>>   #define SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK		GENMASK(11, 0)
>>
> 

