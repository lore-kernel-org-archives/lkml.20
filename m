Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E3F3D47A8;
	Thu,  3 Sep 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429192; cv=none; b=jBhdPlKuOS4YaSh0XLJM53s4OF0Hqj2TYIVIcchdTdR8n7T+Ff48O0mcPiFHcpIaw3QljhpBEzl/Aa8qdNzWS3i0rni2veNQ6QM+dVy2v/NPeiaGTBhdkbUKFlMsDgF1RlteKUjnZPW48sa37KvRrHw1eBIkVSc4oSV41Zv+ExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429192; c=relaxed/simple;
	bh=8AE2cjhdGtRwIw6fjDZrqgdZl2NnVgJZ58wH9fvfC4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4iJsqVeYNShp0RludWsl5NLvgWvmQO2DFrHZA6h013UFnNKwka7VEaDSKDt1M4rd5Ad0ABAda33ns+GSgW21/we4FBWO679+0YjszI/rI9nzLPavffvQ36MPdo73BzBS6wWCxAk3SvaYA39Ze3fxGZTokHN+UQFYOjpKiLZdQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYpSzabT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYpSzabT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5531F00A3D;
	Thu,  3 Sep 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429191;
	bh=Ig70CvKU23MKJaMu+7vf/X3puEFetI2IvCaYt7MGOTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DYpSzabTnx0TQpLw1BRY4h7flD3BtfPblDkynYp8vVUaF5FGUaFOfX2jcsyDUsytE
	 SaL9yCjT9wTKRm37IVAMOfBEmaT+cAsURwKbzryA+4KvL6x/Z2qbjTtmuui5iaQgSv
	 qiowfDuqhfmxLL/Et8mZB9RM5kYbzpg9DoGr1UN65qTBsV9CKdbH/Uv3K5bpPDY6x+
	 En8kdNWM8QZmaBCinQX1ntGVaS5FqE6cWaLnqZqVTr0YLeY5BKOpDVNfIf1wwa6nqR
	 seVIcW5qrzbmlpKjqAchigCtPUIDf4I77WMbaimexQ7KjlVfViwhkWfZPInhhe4xIq
	 Lzebs//WeH52A==
Message-ID: <39101571-58f2-43c5-b76d-62f8ab57d551@kernel.org>
Date: Thu, 3 Sep 2026 11:53:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Michael Riesch <michael.riesch@collabora.com>,
 Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>
 <20260827-thundering-cream-saluki-dd05df@quoll>
 <7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2026 13:32, Michael Riesch wrote:
> Hi Krzysztof,
> 
> On 8/27/26 13:45, Krzysztof Kozlowski wrote:
>> On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
>>> A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
>>> and in some PHY blocks both work at the same time. The existing
>>> PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
>>> the transmitter or the receiver.
>>
>> The consumer knows this already, no? Imagine consumer of the phy is some
>> ISP receiving data over CSI for given port, thus consumer cannot
>> transmit over that link.
>>
>> All this seems redundant.
> 
> Indeed the consumer should know what to request. For example, the MIPI
> CSI receivers should request the PHY_TYPE_CSI PHY. But I am not sure why
> this should be redundant?! Can you elaborate? TBH I don't really
> understand your remark.

It is redundant, because consumer CANNOT put there anything else than
CSI type and the topology already defines that. It is basically
duplicating existing information.


> 
>>> Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
>>> D-PHY or C-PHY and transmitter or receiver. They do not replace
>>> PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
>>> selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
>>> binding.
>>>
>>> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
>>> Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
>>> Signed-off-by: Jason Yang <jason98166@gmail.com>
>>
>> Where is any DTS using it? I did a search and no results of upstream
>> posting.
>>
>>> ---
>>>  include/dt-bindings/phy/phy.h | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
>>> index 979b5dfd8353..8ee3f88e6d80 100644
>>> --- a/include/dt-bindings/phy/phy.h
>>> +++ b/include/dt-bindings/phy/phy.h
>>> @@ -24,6 +24,8 @@
>>>  #define PHY_TYPE_CPHY		11
>>>  #define PHY_TYPE_USXGMII	12
>>>  #define PHY_TYPE_XAUI		13
>>> +#define PHY_TYPE_DSI		14
>>> +#define PHY_TYPE_CSI		15
>>
>> DSI and CSI does not look like types of PHY...
> 
> Fair point. AFAIK both CSI and DSI are protocols on top of the physical
> CPHY and DPHY communication. Maybe we should stick to
> transmitter/receiver/RX/TX direction/.../something. Would work for me
> too, my simple request is to *NOT* introduce the same magic for each
> combo PHY block over and over again, but create something generic.
> 
> What about
> 
>     #define PHY_DIRECTION_RX	0
>     #define PHY_DIRECTION_TX	1
> 
> or so?

Well, I asked for any DTS user of it and I did not get it except
pointing to irrelevant and completely different 15 year old Samsung chip
and to some "future" work, so no clue. I still claim that direction is
obvious from the graph between producer and consumer, thus is redundant,
but I am happy to be corrected by showing me the code.

Talk is cheap.


Best regards,
Krzysztof
