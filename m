Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901B4E13E0;
	Fri,  2 Oct 2026 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954866; cv=none; b=VtIXWqX56jrcSrj/TOAiGZ+hjIFy8LHQGvIpPPg/U2h8PjBW8d6dSiptEt7B3dbJLo51owHDd5GEgq8Owi/kVEiuQ7SqfDdBge0/Wgc4fxaHPjCs7usGUy0rH7TvR/OlW2f2Q4LTrVvdCejH7OSs+RIJWhpiX7Wert2fSJxWdfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954866; c=relaxed/simple;
	bh=Sdy8ppgMO0Ku5mtrcj+hsZNR2N5sWyHDemiN4M4U6CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBkjR6gVy9AE6y+zD7+iZFJ/VqqYXYewNklfehk0b5m3iMBE2SCQV9hzsTiTYn06s/FmtiFBfmeate0zqil49ICn68/G4rUzNiNZhazb5PVAbQHXQQFyfgCrYJBYOjvnHusMBMNvgVvetmWmENFZH/kkcmL9MnRmy/lI5r/ZPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uxAWLLpB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uxAWLLpB"
Received: from [192.168.33.75] (185.182.214.55.nat.pool.zt.hu [185.182.214.55])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BF875E;
	Fri,  2 Oct 2026 17:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790954747;
	bh=Sdy8ppgMO0Ku5mtrcj+hsZNR2N5sWyHDemiN4M4U6CA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uxAWLLpBmzFiLL2o4hUhBy6L/m7j405wCpSoVwP0Dsm3SDCjmuUX1N1KJjsaVZo65
	 b3dc1K51oOO6PJtC+kTCJSeCyQpHiNZ1sxCVKaSnN36F87x5svDtCo5MxqA36Lrus/
	 ICnOHnqyjnMn9+etW6VEShCeg87VcpaDEqxGCMLQ=
Message-ID: <8d771bbc-dd16-4183-82f4-f8733596867d@ideasonboard.com>
Date: Fri, 2 Oct 2026 17:27:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: rppx1: lsc: Fix and use LSC_SIZE_VALUE()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?=
 <barnabas.pocze+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261002121643.418200-1-barnabas.pocze+renesas@ideasonboard.com>
 <20261002151858.GA1933679@ragnatech.se>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20261002151858.GA1933679@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

2026. 10. 02. 17:18 keltezéssel, Niklas Söderlund írta:
> Hi Barnabás,
> 
> Nice catch!
> 
> On 2026-10-02 14:16:43 +0200, Barnabás Pőcze wrote:
>> Firstly, the size values are 10-bit unsigned integers, and there doesn't
>> appear to be an upper limit in the hardware documentation, and testing also
>> seems to confirm that 1023 works as expected, so the correct mask to use is
>> 0x3ff (1023), not 0x1ff (511).
> 
> I have the fields (x_sect_size_{0,1}) in RPP_MAIN_PRE1_LSC_XSIZE_01
> defined as 10-bits so it is documented right? The thing here is that the
> incorrect define LSC_GRAD_VALUE was used where LSC_SIZE_VALUE should
> have, and this masked the error, no?

Yes, to both. Sorry, now I realize my description is probably confusing. What I meant by
"there doesn't appear to be an upper limit" is that all 10 bits can be used, so
the upper limit is 1023, i.e. there isn't an "additional" upper limit documented
apart from the limit inherent in the bit width of the field. So it should've been
something like

   Firstly, the size values are defined as 10-bit unsigned integers, and there doesn't
   appear to be an additional upper limit in the hardware documentation, so the upper
   limit should be 1023, which has been confirmed to work empirically. So the correct mask
   to use is 0x3ff (1023), not 0x1ff (511).


> 
>>
>> Secondly, actually use `LSC_SIZE_VALUE()` when populating the size registers
>> instead of using the `LSC_GRAD_VALUE()` macro.
>>
>> Fixes: b39656efb71a ("media: rppx1: lsc: Add support for lens shade correction")
>> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> 
> This fixes it correctly.
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
>> ---
>>   .../platform/dreamchip/rppx1/rppx1_lsc.c      | 34 +++++++++----------
>>   1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
>> index 8badeca23e249..ffc52ca23dd99 100644
>> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
>> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
>> @@ -57,7 +57,7 @@
>>   
>>   #define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
>>   #define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
>> -#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
>> +#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x3ff) | (((v2) & 0x3ff) << 16))
>>   
>>   static int rppx1_lsc_probe(struct rpp_module *mod)
>>   {
>> @@ -157,24 +157,24 @@ rppx1_lsc_fill_params(struct rpp_module *mod,
>>   	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
>>   
>>   	v = cfg->x_sect_size;
>> -	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
>> -	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
>> -	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
>> -	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
>> -	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
>> -	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
>> -	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
>> -	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
>> +	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_SIZE_VALUE(v[0], v[1]));
>> +	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_SIZE_VALUE(v[2], v[3]));
>> +	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_SIZE_VALUE(v[4], v[5]));
>> +	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_SIZE_VALUE(v[6], v[7]));
>> +	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_SIZE_VALUE(v[8], v[9]));
>> +	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_SIZE_VALUE(v[10], v[11]));
>> +	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_SIZE_VALUE(v[12], v[13]));
>> +	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_SIZE_VALUE(v[14], v[15]));
>>   
>>   	v = cfg->y_sect_size;
>> -	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
>> -	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
>> -	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
>> -	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
>> -	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
>> -	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
>> -	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
>> -	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
>> +	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_SIZE_VALUE(v[0], v[1]));
>> +	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_SIZE_VALUE(v[2], v[3]));
>> +	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_SIZE_VALUE(v[4], v[5]));
>> +	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_SIZE_VALUE(v[6], v[7]));
>> +	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_SIZE_VALUE(v[8], v[9]));
>> +	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_SIZE_VALUE(v[10], v[11]));
>> +	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_SIZE_VALUE(v[12], v[13]));
>> +	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_SIZE_VALUE(v[14], v[15]));
>>   
>>   	/* Enable module. */
>>   	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
>> -- 
>> 2.56.0
>>
> 

