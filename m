Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792519525;
	b=nY6T7hXeDDjAps39UEyJ1ESbBeKfof6Uk1Nc0cuxRAH5l+ddbKSbNaIIHENREt08GpyE
	 nq+jQp33frUWUcT27p1GwFxi8uSMBfKrFA1GRR5N+x5gPo7ysBn0qQWiX2MOYZ7iEeFRr
	 nr0EFA4+n7rpwNZeQmdKRux+IAiBppuAJ0zYe+jNobJKNB9FwPpBTWaF/x4/ky7LS1Oir
	 XQzsl4HQIB6GMFsAx76g2NfdyYxXpQQfLz3aSTgyWbImpF7VKlWjivKRnNIqf+eYF8aiW
	 9apASStqTNWHWKFMyDX8jLgmCCo4A8lEGElU8Nu8fZX1kN4xezXbRE2gUfeTw+YB8FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519525;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=9eSaud7dFUgdPyFW0o5bdI3JdYL7Fm5AQErAMesA9t0=;
	b=slwN6s+JKsiGGnaSIpObJz2EW5uR34c0feiLFc8HRAM1wHgiGQy9Br96bHEKnD1Dal8e
	 FQfTRDvE7ofnc5KP0mM2zvlB7lReZmMZo+S8ucSEVtqRzzVs6P7F6EtQga+SpeAFdk5Xg
	 f1Ec3G+s2NgbOiCGHnaLzaJfrT/QY/7/3A6z64SRHj5/+macdGeJUXxiN5DiL59Kbcya1
	 65HmPZnJWSG2HSHF0JPz/iqT6v1U+5f949JdLnn/yLLT1UD1fZTe9pRnnqbjjHEzulM/g
	 lXKOt2ERGfBhlMDAxqROVaYp0oJvj7Leq/5l+xyJiwzoVvtxP0Je8nwXWpqsiCFRgEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=YHdstS9E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E3606A319;
	Tue, 20 Oct 2026 18:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 790E3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=YHdstS9E
ARC-Seal: i=1; a=rsa-sha256; t=1792519481; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cO8218ncU8S2STckPIoI6sh//5C20e0X4YryZKZF4JsnI8OI1xXGAQ109xvGisqckvR5aTrx+yWJJpNCQD1Ik4mGSDcmcxlCO3FrBqd/nOcN1qRETRXNe7l7CF7nGqmoezGCb1X/wqocu5k55kMc5fYf3PaKKKBE1a+pTNnOsqE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792519481; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9eSaud7dFUgdPyFW0o5bdI3JdYL7Fm5AQErAMesA9t0=; 
	b=UCqDPq8Rr2ancdsrd+CRdkAmgGKt7SO94IJKA9UtkrH4euthKvtzBQ5NmaGmlAdI6fjyncqii6c4dIjXcY/PeGiG1kgR7J+SPUHuUL5x1xA5ydAZR5K7mFwx/+eYiDXvHDQL7ARK2mQ6wCUvVF/CAdz1ouUSAQjdP7ZKktNR3HM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792519481;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9eSaud7dFUgdPyFW0o5bdI3JdYL7Fm5AQErAMesA9t0=;
	b=YHdstS9E7BGjv2OfXeJ2yZfFlYEDODFcCUHON6STCZLLvpIVPsdTejFX2UUjqOHe
	FXyn6YE9sE7NfFz57BRen2Ln3Ij/LiUIrocMDVAgWkbRREEIzkzHAUxkggmhPJJG5A7
	/4HYL8d4Zb/KqlaVnBZ/a4NC4G7GCSN2dYDqgn/s=
Received: by smtp.zohomail.com with SMTPS id 1792519478414682.148302063257;
	Tue, 20 Oct 2026 11:04:38 -0700 (PDT)
Message-ID: <94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com>
Date: Tue, 20 Oct 2026 20:04:33 +0200
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
 <2501273.NG923GbCHz@diego> <20261020141039.GB4157247-robh@kernel.org>
 <25254818.ouqheUzb2q@diego>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <25254818.ouqheUzb2q@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi all,

On 10/20/26 16:57, Heiko Stübner wrote:
> Am Dienstag, 20. Oktober 2026, 16:10:39 Mitteleuropäische Sommerzeit schrieb Rob Herring:
>> On Tue, Oct 20, 2026 at 03:37:35PM +0200, Heiko Stübner wrote:
>>> Am Dienstag, 20. Oktober 2026, 00:20:47 Mitteleuropäische Sommerzeit schrieb Michael Riesch:
>>>> Hi all,
>>>>
>>>> On 10/19/26 17:06, Rob Herring wrote:
>>>>> On Mon, Oct 19, 2026 at 04:15:03PM +0800, 楊智成 wrote:
>>>>>> Hi Krzysztof, Rob,
>>>>>>
>>>>>>> Existing OS should ignore surplus cell if the driver is coded properly.
>>>>>>> Same as adding new properties or new front-compatible.  The question is
>>>>>>> how the existing driver behaves?
>>>>>>
>>>>>> As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
>>>>>> driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.
>>>>>>
>>>>>> 1. Keep the second cell. Add the patch as follows:
>>>>>>
>>>>>> - if (args->args_count != 1) {
>>>>>> + if (args->args_count < 1) {
>>>>>>     dev_err(dev, "invalid number of arguments\n");
>>>>>>     return ERR_PTR(-EINVAL);
>>>>>>   }
>>>>>>
>>>>>> + if (args->args_count > 1 && args->args[1]) {
>>>>>> +   dev_err(dev, "only the transmitter is supported\n");
>>>>>> +   return ERR_PTR(-EINVAL);
>>>>>> + }
>>>>>>
>>>>>>   With Fixes: and Cc: stable, the stable kernels maintained at that
>>>>>>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
>>>>>>   dts, and the receiver fails cleanly instead of getting the transmitter.
>>>>>>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
>>>>>>   It goes in with the series, since two-cell dts only exist after it.
>>>>>>
>>>>>> 2. Use a flag in the upper bits of the existing cell, as Rob
>>>>>>     suggested. Existing kernels are not affected, unless a board enables
>>>>>>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
>>>>>>
>>>>>> I will write the impact clearly whichever  approach is selected in
>>>>>> the related commit messages and the cover letter.
>>>>>>
>>>>>> I think the cell approach is easier to read and more symmetric in the
>>>>>> long term,
>>>>>> but it breaks more. Which one do you think is better? Thanks.
>>>>>
>>>>> I'm not a user of this platform, so I don't care. Up to the platform 
>>>>> maintainers to decide if breakage is acceptible. You just need to 
>>>>> document the issue in the commit message.
>>>>>
>>>>> Rob
>>>>
>>>> It's a bit of a pickle, all this.
>>>>
>>>> I gave it some more thought. In the end this is an IP block with two
>>>> PHYs. No more, no less. One cell is sufficient to address those, and it
>>>> could be 0 for the transmitting PHY (DSI, display) and 1 for the
>>>> receiving PHY (CSI, camera).
>>>>
>>>> Of course the two PHYs can operate in either DPHY or CPHY mode. The
>>>> phy-cells have been (mis?)used to select the proper mode of combo PHYs,
>>>> and this principle has been applied here too.
>>>>
>>>> However, we have the special situation here that the mode can only be
>>>> changed for the complete IP block (and thus for both PHYs at the same
>>>> time). As Bryan points out, we need to check and complain if the PHY
>>>> mode is not set to the same value for both PHYs.
>>>>
>>>> I suggest using a property
>>>>     samsung,cphy-mode;
>>>
>>> I guess, a maybe nicer way would be mimicing
>>> 	Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
>>>
>>> with its
>>> 	intel,phy-mode = <x>
>>>
>>> with x coming from include/dt-bindings/phy/phy.h
>>> for the distinction between cphy and dphy, so we don't introduce yet
>>> another way to describe this.
>>
>> We already have the plain 'phy-type' property which takes the same 
>> PHY_MODE_x values. We don't need yet another vendor specific property.
> 
> even better then ... and I didn't look deep enough it seems.
> 
> 
>>>> (name to be bikeshedded) that sets the complete IP block into CPHY mode
>>>> (DPHY being the default) to distinguish between the modes. Since both
>>>> modes use a different electrical interface, this is clearly a hardware
>>>> thing and thus suitable for device tree.
>>>>
>>>> Then, we can address the two PHYs with the help of the already existing
>>>> phy cell (without any bitflag tweaks to the value).
>>>>
>>>> The sole drawback is that we need to accept the PHY_TYPE_DPHY and
>>>> PHY_TYPE_CPHY values that some OS in the field might pass. (For Linux,
>>>> it should only be the former.) And we need to handle those values
>>>> correctly. But I think this is not more painful than the other
>>>> approaches. At the same time, this design seems to be the most correct
>>>
>>> The current cell values are 10 + 11, so as long as we don't re-use those
>>> exact values for the other constants the driver should somewhat easily
>>> be able to recognize an old DT?
>>
>> I think you will still have an ABI issue of what does old OS do with new 
>> values?
> 
> wasn't the main contract, a newer kernel should support old DTs ?
> 
> Aka the DT is parked in some firmware part (u-boot?) and gets handed
> to the newer kernel.
> 
> I don't see deliberately handing a newer DTB to an older kernel as a
> very common occurence?
> 
> 
> And from a practical standpoint:
> 
> We're talking about devices with DSI displays that are at stake here,
> so we're in the embedded world.
> 
> In other areas we're still fighting basic functionality like actually
> handling the type-c orientation correctly in the usbphy.
> 
> So I really don't see a device with a user-updateable mainline kernel out
> in the field, apart from people hacking around on their devices to try
> out new features and new kernels, simply because core functionality
> is still evolving in mainline.
> 
> 
> RK3576/RK3588 devices still ship with a vendor u-boot/kernel, with
> completely incompatible DTB afterall.
> 
> 
> So yes, supporting old devicetrees on new kernels I do see as important
> but someone working extra hard to combine a new DT with an old kernel,
> I really don't see as an issue here.
>

Just to make sure I understood it correctly: the current suggestion
would be the standard integer property (optional)

  phy-type:
    description: D-PHY (default) or C-PHY mode
    enum:
      - 10 # PHY_TYPE_DPHY
      - 11 # PHY_TYPE_CPHY
    default: 10

plus changing phy-cells to:

  "#phy-cells":
    const: 1
    description: |
      Argument defines whether receiver or transmitter PHY is used.
        - PHY_DIRECTION_TX
        - PHY_DIRECTION_RX
      See include/dt-bindings/phy/phy.h for constants.

plus handling the case where an old DTS may still have a line

  phys = <&mipidcphy0 PHY_TYPE_DPHY>;

and the new kernel will convert it to something equal to phy-type =
PHY_TYPE_DPHY and phys = <&mipidcphy0 PHY_DIR_TX>;

plus ignoring the whether or not an old kernel can work with a new DTS
or not.

By the way, if we handle the case of the old DTS with the new kernel
correctly (which we should IMHO) then we do not need to change the
existing DTS nodes, thus eliminating regressions.

Is this summary correct?

Best regards,
Michael

