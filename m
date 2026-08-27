Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1989938D6B5;
	Thu, 27 Aug 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.42.129.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822472; cv=none; b=T8bWHJLF/HPH/RUhEXPCWoBNen79T+vknEp+llrDh6pqUpx9HmKo45leKMBwunijCuGQ+NVJvHvrnJK//9/jOlgyW8TGMpzu37nLUqnyzYWKlyCPQESNiMHLAteGMYtJeSjXWb17kDetKVRLmKaczUvfjV8pMQBOpY+uKdtnZes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822472; c=relaxed/simple;
	bh=WSdt2tsyHAa5JFOp0JQT8C+WLq/BfAWYCNKF8klKlGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2rLhWVAhnS4Sx6aMg5gBu7VdX2KQXhJzVSMkIhIDlKEeve5TXRQsbcg/8g8cxt4rw8nuxLbrUWcmlGo5gZSulLRW71PwnpOrbNpour09LPH6wRVcy39SR8s/oTaSJAnRJIrkWflDXFv1I4ZDavfMoMLi2HsE5FXvtSX/3nIh0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=kz7bH0oV; arc=none smtp.client-ip=84.42.129.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="kz7bH0oV"
Received: from [10.0.0.94] (unknown [79.142.128.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 267AE5340789;
	Thu, 27 Aug 2026 11:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1787822461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QLJaUAOjKhzMPiVbviAnkyKdfqksMQk35UVALf0VbU4=;
	b=kz7bH0oV0Qfol3XlCFHCPncD1E7Sd3QUhoAPd/c+qkiTx1YZYtBsKafU4gJz1uc9z4nSYQ
	TXgMpyqHWUroQxi3ntyIY/pcnnz1aqQ2fQYZcfHUslupE4NpVwo0KgvQDfDDmCn0Hp/dfb
	u0f/W5uXWsr9Li5J/N17zNNGuY7dHB8=
Message-ID: <e03b34d6-e61f-48bd-9e13-970d7034c379@ixit.cz>
Date: Thu, 27 Aug 2026 11:21:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] media: imx355: reuse existing CCS defines
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819-imx355-ccsify-v1-1-0b6cef77e340@ixit.cz>
 <178772520896.9142.15892216055046447878@freya>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <178772520896.9142.15892216055046447878@freya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/2026 08:20, Jai Luthra wrote:
> Hi David,
> 
> Quoting David Heidelberg via B4 Relay (2026-08-20 01:47:08)
>> From: David Heidelberg <david@ixit.cz>
>>
>> The driver may not be MIPU CCS compliant, but does use same address and
>> often set same values as compliant drivers. Do not define for every Sony
>> imx* driver registers we already know and are standard.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> I'm sending this as RFC, because we'll need to upstream at least 4 - 6
>> drivers, which aren't compliant with MIPI CCS. Quirking these drivers in
>> mipi-ccs would be pointless, thou we could at least simplify and unify
>> what needs to be separate.
>>
> 
> Indeed, while working on IMX708 I realized it was in the same bucket, and
> ended up implementing a similar approach (of reusing register defines and
> helpers from CCS).
> 
>> Thanks for the feedback, just did few lines for the idea how the final
>> changes will look like. Anything ambiguous will be left as is.
>> ---
>>   drivers/media/i2c/imx355.c | 46 +++++++++++++++-------------------------------
>>   1 file changed, 15 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
>> index 8eb8588cb71bb..57f7c70d18453 100644
>> --- a/drivers/media/i2c/imx355.c
>> +++ b/drivers/media/i2c/imx355.c
>> @@ -14,50 +14,34 @@
>>   #include <linux/unaligned.h>
>>   
>>   #include <media/v4l2-cci.h>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-event.h>
>>   #include <media/v4l2-fwnode.h>
>>   
>> -#define IMX355_REG_MODE_SELECT         CCI_REG8(0x0100)
>> -#define IMX355_MODE_STANDBY            0x00
>> -#define IMX355_MODE_STREAMING          0x01
>> +#include "ccs/ccs-regs.h"
>>   
>> -/* Chip ID */
>> -#define IMX355_REG_CHIP_ID             CCI_REG16(0x0016)
>>   #define IMX355_CHIP_ID                 0x0355
>>   
>> -#define IMX355_REG_LANE_SEL            CCI_REG8(0x0114)
>> -
>>   /* PLL registers that depend on the external clock frequency */
>>   #define IMX355_REG_EXTCLK_FREQ         CCI_REG16(0x0136)
>>   #define IMX355_REG_PLL_OP_PREDIV       CCI_REG8(0x030d)
>> -#define IMX355_REG_PLL_OP_MUL          CCI_REG16(0x030e)
>>   #define IMX355_REG_PLL_IVT_PCK_DIV     CCI_REG8(0x0301)
>>   #define IMX355_REG_PLL_IVT_SYSCK_DIV   CCI_REG8(0x0303)
> 
> I think rest of the PLL registers could also be reused here?
> 
> While they are defined as CCI_REG16, I think writing just a byte to it
> should work okay.

It could work, but I wouldn't risk some undefined behavior. The datasheet define 
it as is, so I would go against it (at least without seeing bigger benefit).

> 
> You could also reuse the CCS PLL calculation helpers instead of hardcoding
> the values.

I tried, but I would skip it for now, so we keep the verified configurations 
against datasheet. Maybe in the future if there is need for it and we can 
validate against more configurations.

I'm sending v2 cleaning the driver up with the basic scope :)

Thank you
David

> 
> [snip]
> 
> Thanks,
>      Jai

