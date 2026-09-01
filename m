Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26BD49F13B;
	Tue,  1 Sep 2026 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288995; cv=none; b=uGwWaz3kQXkcbI9/iviuJSus1B8Rr5zh+1DHLj20M9qcKtaA/5KT3gAfBWOUihwPpoRvt0sF4b+HutSNJXiTi+vgx38T9CiaYA3J3UFmQCid+Sn3Vvy128xDj/1reAy9FCfz93eNM2FfWzm0pA4zp/RQk4Btjbt6cakrEcfTbr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288995; c=relaxed/simple;
	bh=q5QuUKJDeWCGWw5FZIn0pla+4QA0N53j/PFvJ2v9otw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y03gr7SGBxSbsFGhyL+QRE46R7jM6WUn7IbE+77RJsmSk/L+z9GtIviF0ET2M9TZJ7twMf09DVipqY++l8ga8fX3drEYJN4E7vSuimcXGRmZUDx6/YwF6EbeCXbtYoVQ9j/igpnLz7xXMwHdGRl3O7JQ+qnZ3S5kHkkDZJ5cfHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pk5Vs0IP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pk5Vs0IP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2991F000E9;
	Tue,  1 Sep 2026 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788288994;
	bh=soj2uFsYNX757aHImCwMM0LMVX32Pw6BHhDFsDFZfdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Pk5Vs0IPCvpa2mVAmhiOng2EmTWFN6zn/Q42Pc6xkIUrXSMEvSh5GJYTtz1Abl2bm
	 8TeAs8lSjBBPZelsoGeQ75FmbeH0ZsmS1SOq+N2vXnadIBXaa2C4UJqROXRfwro8we
	 Akox8XBMUdaAVZXU8LdDI2IHdbMKnGWeg4xJGncMoZyU55AVyp+62gtQgDz8J3tMus
	 0DeYFqzIvOMXFd7LpLmZnNQwwXi6NvYGi5OitGqlcfLOzFIIdwu1a4kREN58VkQ8/B
	 vzO9vEi4xYY2w1+8y5t/QR5kM1sYa1ddBqyf/lmc/fayxAr3m49w6QM6S/lpsCvTJm
	 zhLqrbATkE/ig==
Message-ID: <8348dc87-15f2-4019-9e27-744ab4a801b8@kernel.org>
Date: Tue, 1 Sep 2026 20:56:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] thunderbolt: Make the ring register layout
 configurable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-10-44bc9348683c@kernel.org>
 <20260901085802.GC106095@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260901085802.GC106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/1/26 10:58, Mika Westerberg wrote:
> Hi,
>
> On Sun, Aug 30, 2026 at 10:19:28PM +0200, Sven Peter wrote:
>> The ring descriptor and options registers are laid out differently on
>> the Apple NHI. Describe their offsets and strides with a
>> tb_nhi_ring_layout struct that NHI drivers can override.
> This is odd because Apple is sitting in USB-IF and they are behind the
> original register layout so why they do not follow it themselves?

My guess is as good as yours but knowing Apple's culture it's probably 
separate teams not being allowed to talk to each other...

>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   drivers/thunderbolt/nhi.c   | 30 ++++++++++++++++++++++++------
>>   drivers/thunderbolt/nhi.h   | 18 ++++++++++++++++++
>>   include/linux/thunderbolt.h |  3 +++
>>   3 files changed, 45 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>> index fc54ff7edfb9..3a3d334e69fd 100644
>> --- a/drivers/thunderbolt/nhi.c
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -176,19 +176,32 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
>>   
>>   /* ring helper methods */
>>   
>> +static const struct tb_nhi_ring_layout nhi_default_ring_layout = {
>> +	.tx_desc_base = REG_TX_RING_BASE,
>> +	.rx_desc_base = REG_RX_RING_BASE,
>> +	.desc_stride = 16,
>> +	.tx_options_base = REG_TX_OPTIONS_BASE,
>> +	.rx_options_base = REG_RX_OPTIONS_BASE,
>> +	.options_stride = 32,
>> +};
> I'm not fan of these to be honest.
>
> I think either adding ring_ops that includes hooks that can be overridden
> by non-standard HI or not sure if we can take advantage of regmap here?

Sure! I don't think regmap buys us anything but I think I can get away 
with just adding nhi_ring_desc_base() and nhi_ring_options_base() to the 
ops.


Sven
