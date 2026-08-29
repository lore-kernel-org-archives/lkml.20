Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258C7083C;
	Sat, 29 Aug 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787999318; cv=none; b=L1c/+4GyPOxCaFSRwh1r32t875SOewA9Y8XGJBctfEiAj0R32C0mF1CP+aNHBUgE/sZ9AJe2Riw4uWwWb6GgcHcKlfS1SFyyN/9LNnbyohI5DwRaQiZqWzqC9cu5D5tmHqvWCpX8kZmphNApAKtYRnn25hmPe+NHQCiqgeXzuFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787999318; c=relaxed/simple;
	bh=GsBhpbOLrySC99dIaT34f6OHVks3jkxuW/tLp7ccDL4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=foLJD6DqZLqFkEvmOdf2DX/wSL1DiWG+REdG12xNFl00o7xGILV6w8nYx6tlXcNKK3PtS3pRpwvQzhrEhnZVTg7Chup5GgZX+M6KBUSkedsNH+m0NI4AFvf9t7RtSSoii5IWk3pja1gqtaOjzo3727YBauKTx2Lxk5LExKi+WUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HsEzYRps; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yZbbCKsf; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HsEzYRps";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yZbbCKsf"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1787999313; bh=svRVpfKt7DAf1SNL4xmrqzo
	nRN0pWlMpZ8nBCldd458=; b=HsEzYRpsoUYyFSr0Wrdwaxb0zYooif00UcYtRkFS3z/dNvHjFC
	D0Gxs/TafSTOoOWWvwEKJyAxhrKqdLKSKhk6ong84CGSrA23JoE5YxASQXeeq7fIU6sAeiw7KL7
	z4a9nPiEEJrnAqZfBv20HO7oE1dPE7u9UvLROB62W2vRmIpYeLoOQOBQf+RYzLsRRFQi/FSx14T
	YjlEgVVpfyggpTR7vQ+8wjUxuuW0Z2Y83x9SW/8dPar0z8/tmjI3yZZ7MOiGuG1P85Be17rbq+R
	epuV6tCKg3nsbkOegxeOzvHukYV/fRqe1q6C3j4zRGd6BD9LERLPuXS681fFD0h/rUw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1787999313; bh=svRVpfKt7DAf1SNL4xmrqzo
	nRN0pWlMpZ8nBCldd458=; b=yZbbCKsf5GPpyRDBa5GQeCmYDWbbHizw7Io3KQLP9xEPiYEoV2
	6J1IXwLB0HzkP1Ncm+Dmf+dq2sXpG/g7F7Dg==;
Message-ID: <8ad49542-e88d-4ac0-ab12-ef84382d96d7@mainlining.org>
Date: Sat, 29 Aug 2026 13:28:31 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Subject: Re: [PATCH] media: i2c: imx258: Add reset-gpio support
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, git@luigi311.com, pavel@ucw.cz,
 tomm.merciai@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org>
 <ccydtgy5lwhesdlg5mtbxllwfcnzhm3k7g6m5xyyhprwizooof@s7qrku6yvqlk>
Content-Language: en-US
In-Reply-To: <ccydtgy5lwhesdlg5mtbxllwfcnzhm3k7g6m5xyyhprwizooof@s7qrku6yvqlk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ondřej,

On Fri, 28 Aug 2026 20:16:30 +0200, Ondřej Jirman wrote:
>> @@ -1128,6 +1130,18 @@ static int imx258_power_on(struct device *dev)
>>  	if (ret) {
>>  		dev_err(dev, "failed to enable clock\n");
>>  		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>> +		return ret;
>> +	}
>> +
>> +	if (imx258->reset_gpio) {
>> +		ret = gpiod_set_value_cansleep(imx258->reset_gpio, 0);
>> +		if (ret) {
>> +			dev_err(dev, "failed to deassert reset\n");
>> +			clk_disable_unprepare(imx258->clk);
>> +			regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>> +			return ret;
>> +		}
>> +		usleep_range(400, 500);
>>  	}
> 
> There are two times given in the datasheet. min 400 us between reset deassert
> and ID register read over CCI. And minimum time between deassert and stream
> start, which is 12ms.
> 
>   https://xff.cz/dl/tmp/b8efc244280a2b35.png
> 
>   https://xff.cz/dl/tmp/ed9b967a140bd347.png
> 
> I wonder if this driver satisfied the second constraint. That may perhaps depend
> on how userspace uses it.
Thanks for datasheet timings. There is an existing software reset and 12ms wait call
inside imx258_start_streaming function. It should satisfy stream start.
Please correct me if I am wrong.
-- 
Best Regards,

Muzaffer Kadir
