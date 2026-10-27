Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793143969;
	b=PnNtVtLfpWnfLQAX0kZGQHsiOdblWItmiNKCp36S0V33NKpcyIaXPBdBqturMvwfBAJm
	 XLSCOKvrGCCtSRSz3BEX4Edy6wlQijIR8LfKK8Eo/RNPyNmxi+So5s25PH+4qc9hMVBPd
	 DGSJR//IK8ia2/WswskZQ/W1Iky67yUFVDpusp0fNmYJkZ0BGFZjkQMFZj0b3UTHEAUrG
	 CLKiQArMMLLa3DGqCBJ9jbBYkG7xblGNygSut6rNi8Cx9Ixaihq3EnZJd7xqZThTixkFQ
	 CPAjgdGi/AsRbQZQfQ3avtLfpSgEidL5b6N8bTot1iwWpaESW1KSayC0BnT2rnU4GDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793143969;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=zD2kSTFXj5XzbQ3Oa4Be7F0BUxFZM9qWFm05WWoBfFU=;
	b=yIeQZVbdUdD+bW0Tg2AmFE+x/WsMvUg2gdhaUxf/eHDSeeE1vI6aQkB3S46FoGUx7g4Z
	 z5vX1L47GgfGPjzRkOfM6SsOhYInimvGCY9STHal/XBhbtyN84sG83VlgamX/m7ZOzBdB
	 6cEyGvrENugT8k+Rhie+12wOv7O/d7STArF7n27iI+HZYG2H4n2tpm2oXmoLn0PEfv0II
	 8dWd8W/agNY4RH5x1IWAKgXpX8UuqRFHlcz6VgluPwLL9KB6i9zP1Ar8V+UNx+btJZ2yH
	 /2W8Sa9jYV3Ix0AWJBeaAohG3dpZaw/uddobtyi4MenoZ9KuFlOvWB4KjphEkMeK0Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=gyPHIR+e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90355606A31A;
	Tue, 27 Oct 2026 23:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90355606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=gyPHIR+e
ARC-Seal: i=1; a=rsa-sha256; t=1793143944; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OwdPDzOzG9WuY8hto80JRg3jb81o92HicD3w9PfNO9JnZd/fGoYFdL8NbK06XXofifZSm5d8shJiqeJUZoq4V+lcPel5S/StaQA8nVDz+a/4OFLP8D16LnGrqp8eooCieI4oKixrGvb4q3QwxfTm6fQfB61NF+6DNaLMQSymPpk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793143944; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zD2kSTFXj5XzbQ3Oa4Be7F0BUxFZM9qWFm05WWoBfFU=; 
	b=mUtEAOjvKLpnwUnNf4tGzyj4ja8MHevrwv3usyq6WBBFOePSC6zlJVJPRj1WQQHlfeFF9NRBQqXyIBrWwFV13azvcvSIcSQ38M0A4wdvAQ3jLRegahkGuVOPUYBzv8CXjW3hnucAFtAF16Y0OSoeRtSN73TlMfQ9qgFoLc5M4FI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793143944;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zD2kSTFXj5XzbQ3Oa4Be7F0BUxFZM9qWFm05WWoBfFU=;
	b=gyPHIR+eS/HFS0jYYZ6GuaIUjxfpLQl9PkO56JNx+Lmyl2xq/O2ghm0ev7A7nex/
	+0n0ghUmPgIFE/s8FgcUITfUUdF5jtCa/u6kWg2CIhRqI0lc8OXvh4zxCE+njeYk6D6
	IV/f8D7nLREVThHaRZa7tCPwdMMduJDEMRlliFlM=
Received: by smtp.zohomail.com with SMTPS id 1793143941809990.7357308475366;
	Tue, 27 Oct 2026 16:32:21 -0700 (PDT)
Message-ID: <850be915-d42b-427e-a036-907b9364f9d2@collabora.com>
Date: Wed, 28 Oct 2026 00:32:17 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>
Cc: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <25254818.ouqheUzb2q@diego> <20261021024239.GA3667411-robh@kernel.org>
 <3435698.oiGErgHkdL@diego>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <3435698.oiGErgHkdL@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Jason,

On 10/21/26 10:03, Heiko Stübner wrote:
> Am Mittwoch, 21. Oktober 2026, 04:42:39 Mitteleuropäische Sommerzeit schrieb Rob Herring:
>> On Tue, Oct 20, 2026 at 04:57:34PM +0200, Heiko Stübner wrote:
>>> Am Dienstag, 20. Oktober 2026, 16:10:39 Mitteleuropäische Sommerzeit schrieb Rob Herring:
>>>> On Tue, Oct 20, 2026 at 03:37:35PM +0200, Heiko Stübner wrote:
>>>>> Am Dienstag, 20. Oktober 2026, 00:20:47 Mitteleuropäische Sommerzeit schrieb Michael Riesch:
>>>>>> Hi all,
>>>>>>
>>>>>> On 10/19/26 17:06, Rob Herring wrote:
>>>>>>> On Mon, Oct 19, 2026 at 04:15:03PM +0800, 楊智成 wrote:
>>>>>>>> Hi Krzysztof, Rob,
>>>>>>>>
>>>>>>>>> Existing OS should ignore surplus cell if the driver is coded properly.
>>>>>>>>> Same as adding new properties or new front-compatible.  The question is
>>>>>>>>> how the existing driver behaves?
>>>>>>>>
>>>>>>>> As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
>>>>>>>> driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.
>>>>>>>>
>>>>>>>> 1. Keep the second cell. Add the patch as follows:
>>>>>>>>
>>>>>>>> - if (args->args_count != 1) {
>>>>>>>> + if (args->args_count < 1) {
>>>>>>>>     dev_err(dev, "invalid number of arguments\n");
>>>>>>>>     return ERR_PTR(-EINVAL);
>>>>>>>>   }
>>>>>>>>
>>>>>>>> + if (args->args_count > 1 && args->args[1]) {
>>>>>>>> +   dev_err(dev, "only the transmitter is supported\n");
>>>>>>>> +   return ERR_PTR(-EINVAL);
>>>>>>>> + }
>>>>>>>>
>>>>>>>>   With Fixes: and Cc: stable, the stable kernels maintained at that
>>>>>>>>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
>>>>>>>>   dts, and the receiver fails cleanly instead of getting the transmitter.
>>>>>>>>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
>>>>>>>>   It goes in with the series, since two-cell dts only exist after it.
>>>>>>>>
>>>>>>>> 2. Use a flag in the upper bits of the existing cell, as Rob
>>>>>>>>     suggested. Existing kernels are not affected, unless a board enables
>>>>>>>>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
>>>>>>>>
>>>>>>>> I will write the impact clearly whichever  approach is selected in
>>>>>>>> the related commit messages and the cover letter.
>>>>>>>>
>>>>>>>> I think the cell approach is easier to read and more symmetric in the
>>>>>>>> long term,
>>>>>>>> but it breaks more. Which one do you think is better? Thanks.
>>>>>>>
>>>>>>> I'm not a user of this platform, so I don't care. Up to the platform 
>>>>>>> maintainers to decide if breakage is acceptible. You just need to 
>>>>>>> document the issue in the commit message.
>>>>>>>
>>>>>>> Rob
>>>>>>
>>>>>> It's a bit of a pickle, all this.
>>>>>>
>>>>>> I gave it some more thought. In the end this is an IP block with two
>>>>>> PHYs. No more, no less. One cell is sufficient to address those, and it
>>>>>> could be 0 for the transmitting PHY (DSI, display) and 1 for the
>>>>>> receiving PHY (CSI, camera).
>>>>>>
>>>>>> Of course the two PHYs can operate in either DPHY or CPHY mode. The
>>>>>> phy-cells have been (mis?)used to select the proper mode of combo PHYs,
>>>>>> and this principle has been applied here too.
>>>>>>
>>>>>> However, we have the special situation here that the mode can only be
>>>>>> changed for the complete IP block (and thus for both PHYs at the same
>>>>>> time). As Bryan points out, we need to check and complain if the PHY
>>>>>> mode is not set to the same value for both PHYs.
>>>>>>
>>>>>> I suggest using a property
>>>>>>     samsung,cphy-mode;
>>>>>
>>>>> I guess, a maybe nicer way would be mimicing
>>>>> 	Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
>>>>>
>>>>> with its
>>>>> 	intel,phy-mode = <x>
>>>>>
>>>>> with x coming from include/dt-bindings/phy/phy.h
>>>>> for the distinction between cphy and dphy, so we don't introduce yet
>>>>> another way to describe this.
>>>>
>>>> We already have the plain 'phy-type' property which takes the same 
>>>> PHY_MODE_x values. We don't need yet another vendor specific property.
>>>
>>> even better then ... and I didn't look deep enough it seems.
>>>
>>>
>>>>>> (name to be bikeshedded) that sets the complete IP block into CPHY mode
>>>>>> (DPHY being the default) to distinguish between the modes. Since both
>>>>>> modes use a different electrical interface, this is clearly a hardware
>>>>>> thing and thus suitable for device tree.
>>>>>>
>>>>>> Then, we can address the two PHYs with the help of the already existing
>>>>>> phy cell (without any bitflag tweaks to the value).
>>>>>>
>>>>>> The sole drawback is that we need to accept the PHY_TYPE_DPHY and
>>>>>> PHY_TYPE_CPHY values that some OS in the field might pass. (For Linux,
>>>>>> it should only be the former.) And we need to handle those values
>>>>>> correctly. But I think this is not more painful than the other
>>>>>> approaches. At the same time, this design seems to be the most correct
>>>>>
>>>>> The current cell values are 10 + 11, so as long as we don't re-use those
>>>>> exact values for the other constants the driver should somewhat easily
>>>>> be able to recognize an old DT?
>>>>
>>>> I think you will still have an ABI issue of what does old OS do with new 
>>>> values?
>>>
>>> wasn't the main contract, a newer kernel should support old DTs ?
>>
>> Well, yes, it was. That was a position I inherited. I hear complaints 
>> about the opposite though.
>>
>>> Aka the DT is parked in some firmware part (u-boot?) and gets handed
>>> to the newer kernel.
>>>
>>> I don't see deliberately handing a newer DTB to an older kernel as a
>>> very common occurence?
>>
>> Do you want things to break when you do a firmware update that's picked 
>> up a newer DT? I don't.
>>
>>
>>> And from a practical standpoint:
>>>
>>> We're talking about devices with DSI displays that are at stake here,
>>> so we're in the embedded world.
>>>
>>> In other areas we're still fighting basic functionality like actually
>>> handling the type-c orientation correctly in the usbphy.
>>>
>>> So I really don't see a device with a user-updateable mainline kernel out
>>> in the field, apart from people hacking around on their devices to try
>>> out new features and new kernels, simply because core functionality
>>> is still evolving in mainline.
>>>
>>>
>>> RK3576/RK3588 devices still ship with a vendor u-boot/kernel, with
>>> completely incompatible DTB afterall.
>>
>> I can only keep my own house clean...
> 
> ok :-) 
> 
> 
>> I only ask that compatibility issues be documented. Up to individual 
>> platforms to decide if they care or not. So, your decision.
> 
> The discussion would be a lot different for SoCs like the RK3399 or PX30
> that can and have run mainline software in a usable way for years now.
> RK3568 very likely falls in that area too.
> 
> But for the in-progress SoCs RK3576 and RK3588 anybody wanting to run
> a generic userspace would need a heavily patched kernel anyway, with
> other unreviewed/unmerged dt-changes, so personally I can live with it.
> 
> Especially if we keep the (in my eyes) more common case
> (old dtb, new kernel) working.
> 
> 
> Heiko
> 
> 

(when) could you post a new iteration of your series that implements the
suggestion above?

Thanks and best regards,
Michael


