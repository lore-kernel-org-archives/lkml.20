Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96513FB7E5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510983; cv=none; b=c0XP/zEX9xQnbjOZmed/fzyPov4rfs+tIq+3UM0hTQ0XlBGwcZ37dCJ9FdcoPmMsLrmqD+sjmZPsbI5+Z0vlDxvATLZSEHOlu+SvePvcaBkdxPLXm63BVo/Lxre8E6T4+7G9DpYiBdLOE4OZkyeegsWko4VwSNHMswZ0jYGg+HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510983; c=relaxed/simple;
	bh=Ki0Y7jCJUPsKOkVlpwoJEGCtUXVqqw1bsh3/6RM8VHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOdyVk64ggutfG7P+L07QlpFVSCpnDwNAOiHiKMbidDcUobn+dZlnh/HUj/SvRndSEC7UbibrbBCQ58JQCeyY6FrI8zkgDGDx71YvltXXYsLX4lDfHTLuPXucsaJN6q9Ju6xQwI3Mr4903WZD8QAHe1qac3nZJuvsEnYKVxvjMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TCIirzp9; arc=none smtp.client-ip=95.215.58.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TCIirzp9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ki0Y7jCJUPsKOkVlpwoJEGCtUXVqqw1bsh3/6RM8VHQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510979; v=1; x=1789115779;
 b=TCIirzp9Ea3CDlppno4WO1HdWWng+fbOcrdOA51hjAYBWGjNi9dM1pIJlJ/WCS2c3iQRyW80
 BOh6ZNsMKPFHCNRmcCZB5KNIOlI+YFhLFQbNINORmuGFvi5Yyx1vXTpgN8PbQjbDKl20VTFTXAB
 QSgsD7G08SRT1nCnHZ2Irerk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e47383df19b5bde6;
	Fri, 04 Sep 2026 08:36:19 +0000
X-Mizu-Trace-ID: e47383df19b5bde6
X-Migadu-Flow: FLOW_OUT
Message-ID: <10c5c5b4-cfd5-4d69-8312-ccff02a2e05c@linux.dev>
Date: Fri, 4 Sep 2026 09:51:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] soundwire: dmi-quirks: drop the ghost RT1320 on
 the Surface Pro 11 (Intel)
To: Sergey Lebedev <lsa.uz@pm.me>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bard.liao@intel.com>, Amaan Lalani <zlzzm2014@outlook.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830151516.44629-1-lsa.uz@pm.me>
 <20260830151516.44629-3-lsa.uz@pm.me>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260830151516.44629-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/30/26 17:15, Sergey Lebedev wrote:
> The Microsoft Surface Pro 11 for Business (Intel, Lunar Lake) carries a
> single physical RT1320 amplifier on link 0 and describes it twice:
> 
>   SWRA  _ADR 0x000030025D132000   SDCA class 0
>   SWRB  _ADR 0x000030025D132001   SDCA class 1
> 
> Identical apart from the class id: same link, same manufacturer, part and
> version, same unique id 0. The part reports class 1, so only SWRB
> enumerates. SWRA never attaches on any boot or firmware version tested,
> including the November 2025 bundle.
> 
> The ghost is not harmless. It consumes an amplifier index in
> find_acpi_adr_device(), so the real part is named "rt1320-2" and the stock
> sof-soundwire UCM profile enables switches on a device that is not there.
> Its endpoints also reach create_sdw_dailink(), which builds DAI link names
> from link id and function type alone; the ghost declares the same SmartMic
> function as the real part, so the card fails to register at all:
> 
>   sysfs: cannot create duplicate filename
>     '.../sof_sdw/SDW0-Capture-SmartMic'
>   kobject_add_internal failed for SDW0-Capture-SmartMic with -EEXIST
>   sof_sdw sof_sdw: probe with driver sof_sdw failed with error -12
> 
> Remap its _ADR to zero so sdw_acpi_find_slaves() never creates the
> peripheral, which is how ghost devices are handled already - see
> ghost_realtek and global_ghost_adr in this file. Both failures then
> disappear, because neither path is reached.
> 
> Matched on DMI_PRODUCT_SKU rather than the product name. A later batch of
> the same model could carry a different RT1320 version, which would change
> the _ADR; keying on the SKU keeps this remap to the hardware it was
> verified on, and follows dell_sku_0A3E above.
> 
> Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Suggested-by: Bard Liao <bard.liao@intel.com>
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

the other 1/2 patch should be skipped for now until the problem with the
NEEDS_INITIALIZATION flag is understood.
> ---
>  drivers/soundwire/dmi-quirks.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
> index d75037558..8b3c5c8d1 100644
> --- a/drivers/soundwire/dmi-quirks.c
> +++ b/drivers/soundwire/dmi-quirks.c
> @@ -111,6 +111,25 @@ static const struct adr_remap ghost_realtek[] = {
>  	{}
>  };
>  
> +/*
> + * The Microsoft Surface Pro 11 (Intel) describes its single physical RT1320
> + * amplifier twice on link 0, as two _ADR entries differing only in SDCA class
> + * id and sharing the same unique id. Only the class 1 entry enumerates; the
> + * class 0 entry is a ghost.
> + *
> + * Matched on the product SKU rather than the product name: a later batch of the
> + * same model could carry a different RT1320 version, which would change the
> + * _ADR. Keying on the SKU keeps this remap to the hardware it was verified on.
> + */
> +static const struct adr_remap microsoft_sp11_intel[] = {
> +	/* ghost rt1320 on link0 */
> +	{
> +		0x000030025d132000ull,
> +		0x0000000000000000ull
> +	},
> +	{}
> +};
> +
>  static const struct dmi_system_id adr_remap_quirk_table[] = {
>  	/* TGL devices */
>  	{
> @@ -207,6 +226,15 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
>  		},
>  		.driver_data = (void *)ghost_realtek,
>  	},
> +	/* LNL devices */
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU,
> +					"Surface_Pro_11th_Edition_With_Intel_For_Business_2103")
> +		},
> +		.driver_data = (void *)microsoft_sp11_intel,
> +	},
>  	{}
>  };
>  

