Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6913E171B;
	Mon, 31 Aug 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175998; cv=pass; b=PbwxeRFklVUBmfwH4Cd1gfvgWJaD7drFrWJ3VhkHCB437iCCYf73vxrDClvlFxKNLBQuvENiMCXqSVWxFE6OWn6FHbYYBxT8w5U06BImzf7G5qmsyscTj0b1Jc8VXZEGNqB7BZXDOxnUXS9grc620gndQUArBx5Le9yvVRyFutA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175998; c=relaxed/simple;
	bh=UyRY932Yjb/dprpWj4Fd9dVkkp45pgkjt/CMJDFk0v4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMOB+RML2AEFujg/n626UntQSgrOVSH916lO09SEFvP7ln9YUKz4uU4NfU5PH28jOUL/6T0hHWYJWyU2nLC/RienurfawMN3gBo+129Yz1izx0aDKVmacF8SqsnfZdlOU5+EcaffX6uncclJTDy80HbpgzoXjbj79fxprDJ4G/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=P0k80emA; arc=pass smtp.client-ip=165.173.180.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="P0k80emA"
ARC-Seal: i=1; a=rsa-sha256; t=1788175966; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EleetKclAEvQ9L8pxV+F2QaLovXSAX6nfqp7L2Nqd9U8FpNH2/2TX8NZRUHw2KGe/lUdhE0DDlqn3y7qBKG7HfyC9P9FDqBV252NRxoGUUjU/5fQtbkW5W8RosfmAXhHo770nlMqGJpzFLY2Ox8M3syVApjt4Xqzs1Wq3pV1u44=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788175966; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1bmoP76gMT2BwTB0k454lDwNfisMmqxZAOhXk7e+A3o=; 
	b=QUEYz6uRfersySI4lzmZxIKqpG6P0kFTyuKqHiKcGzuzOEmyuY48CuG7VRKnkoAczXTTr1De1qBuK/lyaKiMH9rqjZ8p0shfQVDFJRYikUIX71Gwec89ifnmjmykg5ww8DvHsA11EuxUL7SBM58WWHfecoK3i0iO0FX9QUqEo7s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788175966;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1bmoP76gMT2BwTB0k454lDwNfisMmqxZAOhXk7e+A3o=;
	b=P0k80emAkoE/Zslcoz8ZEZZ/6Y62orx0DOwYdj4TWC9BSjP7pP/X7dKauvmGalyZ
	fFM7I8rAkBr5T96AjZlb7Is26uO8PthOcrfvQWed1wBJ3cVHZU9zazr//2XgQOhZcms
	WdUVwqVFOlZcVMozsgbEPIYT55Y9FMczq9B0flWM=
Received: by mx.zohomail.com with SMTPS id 1788175962298302.1922470156459;
	Mon, 31 Aug 2026 04:32:42 -0700 (PDT)
Message-ID: <7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com>
Date: Mon, 31 Aug 2026 13:32:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>, Jason Yang <jason98166@gmail.com>
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
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260827-thundering-cream-saluki-dd05df@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Krzysztof,

On 8/27/26 13:45, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
>> A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
>> and in some PHY blocks both work at the same time. The existing
>> PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
>> the transmitter or the receiver.
> 
> The consumer knows this already, no? Imagine consumer of the phy is some
> ISP receiving data over CSI for given port, thus consumer cannot
> transmit over that link.
> 
> All this seems redundant.

Indeed the consumer should know what to request. For example, the MIPI
CSI receivers should request the PHY_TYPE_CSI PHY. But I am not sure why
this should be redundant?! Can you elaborate? TBH I don't really
understand your remark.

>> Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
>> D-PHY or C-PHY and transmitter or receiver. They do not replace
>> PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
>> selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
>> binding.
>>
>> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
>> Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
>> Signed-off-by: Jason Yang <jason98166@gmail.com>
> 
> Where is any DTS using it? I did a search and no results of upstream
> posting.
> 
>> ---
>>  include/dt-bindings/phy/phy.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
>> index 979b5dfd8353..8ee3f88e6d80 100644
>> --- a/include/dt-bindings/phy/phy.h
>> +++ b/include/dt-bindings/phy/phy.h
>> @@ -24,6 +24,8 @@
>>  #define PHY_TYPE_CPHY		11
>>  #define PHY_TYPE_USXGMII	12
>>  #define PHY_TYPE_XAUI		13
>> +#define PHY_TYPE_DSI		14
>> +#define PHY_TYPE_CSI		15
> 
> DSI and CSI does not look like types of PHY...

Fair point. AFAIK both CSI and DSI are protocols on top of the physical
CPHY and DPHY communication. Maybe we should stick to
transmitter/receiver/RX/TX direction/.../something. Would work for me
too, my simple request is to *NOT* introduce the same magic for each
combo PHY block over and over again, but create something generic.

What about

    #define PHY_DIRECTION_RX	0
    #define PHY_DIRECTION_TX	1

or so?

This is pretty much what Jason had in v1, but 1) generic instead of
Rockchip-specific (if anything, it probably should be Samsung-specific)
and 2) switched the constants to match the state of the art in the
kernel better.

Best regards,
Michael



