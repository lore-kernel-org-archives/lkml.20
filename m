Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F82F7EE3;
	Thu,  3 Sep 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446274; cv=pass; b=GS/vhKyms9aZvowquHCY1OT9W/EhzcZ7wwYssS/7S6oGVxQ4C8Hy2VyXhyEe+CfUI9qaumsPfyOlAZRiwIdyCmfNCOtM7/qFhD2HTYXewC3L6pSbVZOE39I3N6wzwe/OfhykCFcEyYJt9mlIJ7EwPtUZaKlVmknkMnOrXGjdUd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446274; c=relaxed/simple;
	bh=o5B4PFwe4Y8xPcsxjP/I+iPe2xLMwdd4wzrJvzvk2zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7+BQJIuk68+shp3yzXdb9JTDvRkz43PFFfSl1bhtceinqPlXTY3+O7JTe+1WomQSaG95vXMkw7Y16q2cm4gQhs9NkdjZczLgK7Z7i2ctePwLhTNRbMcgsFbzUchdpMde8heclHtx9w+5WNDYIKY2mq8PVB6VNxw1WcKyHTQNvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=Zk+ilItl; arc=pass smtp.client-ip=165.173.182.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="Zk+ilItl"
ARC-Seal: i=1; a=rsa-sha256; t=1788446235; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jn9OKk668HhFO20QWGGjArwE0JLoqFuFPdeX4ocnPVSFO2U5TVaM1ik6SdrvhYdkcUfkmyypkLPnBRQQpRlCWUoHifpIb7pmk0AgUrhw5Td3s84D2KaJQh5uyIChUw8Y1TxJe3bfjvcZWpyMnqTUR4UgXWZVlrC1cCIjPmKrS64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788446235; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M7InBmUufvhMm7TfH0iam0WESH107icCZyhDamP4Oig=; 
	b=AVcZ90QIVfsZ44cPd8eohS7G/1Tlvi8wyYZd0ZLujm+D1iIbYXUBVcAkKHxg7SlYv3+OWXyffwWY6pxxebssk0CoDUZwm7+tROfYQoxGOWqCr+f9/X0uAGVii7UfPsDEJS00vUD4wE4AOJg/2I7kI8VFDVPqxdZ1mnkMpL3goEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788446235;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M7InBmUufvhMm7TfH0iam0WESH107icCZyhDamP4Oig=;
	b=Zk+ilItl2cXsOtvb2vEEw/OuQm6a3seBQkfLo47HP4nxI9goPHBbiSZMPaYF6Een
	4x4jF8KXvFfKrcCX1D4ac9MHytZjdZbF/NAtFv1EbvN92Gaikeho2mHRVJZs9w4aLWj
	3NiJBG9nhypBY2Xg+ES3+b4UtfV6yrP6tkDwjzNc=
Received: by mx.zohomail.com with SMTPS id 1788446233626753.3556779201841;
	Thu, 3 Sep 2026 07:37:13 -0700 (PDT)
Message-ID: <824de124-7690-4b51-bd26-71b39ff94f8d@collabora.com>
Date: Thu, 3 Sep 2026 16:37:08 +0200
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
 <7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com>
 <39101571-58f2-43c5-b76d-62f8ab57d551@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <39101571-58f2-43c5-b76d-62f8ab57d551@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Krzysztof,

On 9/3/26 11:53, Krzysztof Kozlowski wrote:
> On 31/08/2026 13:32, Michael Riesch wrote:
>> Hi Krzysztof,
>>
>> On 8/27/26 13:45, Krzysztof Kozlowski wrote:
>>> On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
>>>> A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
>>>> and in some PHY blocks both work at the same time. The existing
>>>> PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
>>>> the transmitter or the receiver.
>>>
>>> The consumer knows this already, no? Imagine consumer of the phy is some
>>> ISP receiving data over CSI for given port, thus consumer cannot
>>> transmit over that link.
>>>
>>> All this seems redundant.
>>
>> Indeed the consumer should know what to request. For example, the MIPI
>> CSI receivers should request the PHY_TYPE_CSI PHY. But I am not sure why
>> this should be redundant?! Can you elaborate? TBH I don't really
>> understand your remark.
> 
> It is redundant, because consumer CANNOT put there anything else than
> CSI type and the topology already defines that. It is basically
> duplicating existing information.

We might not be on same page here, so please let me write down my view
on this.

For the CSI PHY in this combo block, the consumer on the RK3588 is a
MIPI CSI receiver, that roughly looks like this:

csi0: csi@fdd10000 {
  compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
  [...]
  phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;

  ports {
    csi0_in: port@0 { /* from image sensor */ }
    csi0_out: port@1 { /* to RK3588 VICAP */ }
  }
}

For the DSI PHY in this combo block, on the other hand:

dsi0: dsi@fde20000 {
  compatible = "rockchip,rk3588-mipi-dsi2";
  [...]
  phys = <&mipidcphy0 PHY_TYPE_DPHY>;
  // or alternatively:
  phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;

  ports {
    dsi0_in: port@0 { /* from VOP2 port*/ }
    dsi0_out: port@1 { /* to display */ }
  }

That is assuming the DPHY case, of course.

With that in mind, yes, the consumer CAN put something different in
there as CSI (or RX). The argument can be omitted for backward
compatibility, in which case DSI (or TX) is selected.

And yes, the topology should make the selection of the PHY obvious, but
I can't see how the PHY driver should obtain this information if it
wasn't for an extra PHY_DIRECTION_* argument.

What am I missing here?

>>>> Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
>>>> D-PHY or C-PHY and transmitter or receiver. They do not replace
>>>> PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
>>>> selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
>>>> binding.
>>>>
>>>> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
>>>> Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
>>>> Signed-off-by: Jason Yang <jason98166@gmail.com>
>>>
>>> Where is any DTS using it? I did a search and no results of upstream
>>> posting.
>>>
>>>> ---
>>>>  include/dt-bindings/phy/phy.h | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
>>>> index 979b5dfd8353..8ee3f88e6d80 100644
>>>> --- a/include/dt-bindings/phy/phy.h
>>>> +++ b/include/dt-bindings/phy/phy.h
>>>> @@ -24,6 +24,8 @@
>>>>  #define PHY_TYPE_CPHY		11
>>>>  #define PHY_TYPE_USXGMII	12
>>>>  #define PHY_TYPE_XAUI		13
>>>> +#define PHY_TYPE_DSI		14
>>>> +#define PHY_TYPE_CSI		15
>>>
>>> DSI and CSI does not look like types of PHY...
>>
>> Fair point. AFAIK both CSI and DSI are protocols on top of the physical
>> CPHY and DPHY communication. Maybe we should stick to
>> transmitter/receiver/RX/TX direction/.../something. Would work for me
>> too, my simple request is to *NOT* introduce the same magic for each
>> combo PHY block over and over again, but create something generic.
>>
>> What about
>>
>>     #define PHY_DIRECTION_RX	0
>>     #define PHY_DIRECTION_TX	1
>>
>> or so?
> 
> Well, I asked for any DTS user of it and I did not get it except
> pointing to irrelevant and completely different 15 year old Samsung chip
> and to some "future" work, so no clue. I still claim that direction is
> obvious from the graph between producer and consumer, thus is redundant,
> but I am happy to be corrected by showing me the code.
> 
> Talk is cheap.

:-)

I agree that having DTS patches showing how this is used in the RK3588
would tell more than thousand words. I hope the sketch above helped at
least a little in that regard.

@Jason: can you include the DTS additions in your series?

Best regards,
Michael

> 
> 
> Best regards,
> Krzysztof

