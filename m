Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3E377EC3;
	Wed, 16 Sep 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570817; cv=none; b=lTRDoIFVSqxY1ZGYccr21DDXnN9ng2sdcOB59ksfb/KqHPFKFenmGzqppXcYK4NAIPJITpWqZIBWT51W3APGwtyDVSuT/RpqSJurZI+sMfLnq+imAPtBhGuogTzWmy57y/18Dm5khnL/TgRgY54q1DsezQ/ua6VcOWJgFf3BPmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570817; c=relaxed/simple;
	bh=ydKzWL69NnaN10RjhQvNW86S24n3mw1SNddwbUqlgzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGnoR1lkrrUxVmHmzsd1uqblo8Vpago0raA0mW3m9Hq2xU6zbUFB8D45dDolwbLEutephZf2YULS29ulZQCw/yb4a3nq8/axI1VABbCYT1gIIAsqOmXRgkcGWo+oz85KgjoVAmNuv502tmN0XKEpXp7/MzJ7RXpyRIibawfaibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aV069TXV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aV069TXV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487A81F000FF;
	Wed, 16 Sep 2026 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570816;
	bh=HZm36PncUJM37p4r1C4HcVe3FcQx8pg5XwjZj1iY6hM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aV069TXVw0Nt8NR30JOGjKvgGWqEudCd7cTJgoJp8KByqz+EguRDFz3LoMD7cndqB
	 y4CJbR+iEbDZgK7FdakiGnEzMwaqvffmm21EuIP+C/1UQMIGkDJijptOMFW1aECUqs
	 STISdv4CCA0WRMALeBI2qf4Gr6UNC7HJaGBn68g9WoItV6I8r0L3QF62gQUYIMM6tW
	 tOfpvWOlLKgfk9uO2jSEEBQWhx1hUHIHbqUY6mxtqAaUPPVwQUMa+fTKK1AGm4RpNo
	 fsvX7ncTSeDtRMUMrE5mqx2ngIfjEtQCjxtqXp28bE/6TRLywBtLXqDvK/szr7zBH7
	 4TN5/zoXPU3DA==
Message-ID: <364fac74-f28f-4aed-8e83-1125a7bfb3ef@kernel.org>
Date: Wed, 16 Sep 2026 17:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: airoha: Document support for
 AN7583 USB PHY
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
 <20260901123933.15388-2-ansuelsmth@gmail.com>
 <20260907-auspicious-liberal-raccoon-bd7a81@quoll>
 <6a9e7d3b.0f5dc47b.330412.df04@mx.google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <6a9e7d3b.0f5dc47b.330412.df04@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2026 11:00, Christian Marangi wrote:
> On Mon, Sep 07, 2026 at 08:35:56AM +0200, Krzysztof Kozlowski wrote:
>>> +
>>> +    required:
>>> +      - phys
>>> +      - '#phy-cells'
>>> +
>>> +    additionalProperties: false
>>> +
>>> +patternProperties:
>>> +  '^usb2-phy@[0-9a-f]+$':
>>
>> You should not mix MMIO and non-MMIO children. Either children have
>> distinctive addressing, or not. Not both.
>>
>> The other problem is that your children have no resources, so are not
>> really distinctive children and should be folded in to the parent.
>>
>> I already asked that at v2, so let's finish with asking: drop the
>> children.
>>
> 
> I misunderstood the request and tought it was only related to the PCIe
> part.
> 
> I'm not really sure how to drop the child without complicating the node
> structure a lot (also I feel dropping the child would make the description
> of the HW less clear and I would like to prevent that)
> 
> The register for the usb2 node 0x0 and 0x1000 are offset of the register
> declared in the parent node 0x1fac0000. For usb2 1 the phy registers are at 
> 0x1fac0000 - 0x1fac0200, for usb2 2 the phy register are at
> 0x1fac1000 - 0x1fac1200.

0x1fac0000 - 0x1fac0200 and 0xx1fac1000 - 0x1fac1200 are both already
within the parent (which is: 0x1fac0000 0x1200), so I do not understand
your explanation how this would complicate anything.

> 
> The driver read this offset and apply it to every register access for the
> related phy.
> 
> The usb2 child are needed for the specific airoha,usb2-monitor-clk-sel
> property since it's specific for the usb 2.0 phy.
> 
> Also would like to stress that these PHY are all part of the same register
> block.
> 
> One solution might be to just classify the usb2 node as 0x0 and 0x1 and
> handle internally the register mapping with the driver. But again the
> problematic thing is map the monitor-clk-sel with the relevant USB 2.0 phy.
> 
> Any hint on this? Is it ok to keep the child node and use 0x0 and 0x1?

Best regards,
Krzysztof
