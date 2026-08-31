Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D051C3002B3;
	Mon, 31 Aug 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179183; cv=none; b=uURbfZJzLp/O9xa/7EIPbFff/668zUlq/P4KWSkIviuwfrhNptptWP6yIAs4oDKyK6cf4i4DGmAhGLOakI8gQ4RLepIKjMyfoSV8tUlJ8U1DDcWeEhdk2vlxxt3cN6i2PitFvDq0j0N9hZPjJSy3qRcDBQlhRkQGarDHKRD5WCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179183; c=relaxed/simple;
	bh=kqWZdUbO/cevyKrTmPu/qX0VrhuKHsW+ejvoqp0b2q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rs/tEEldWhJVTQ3lJXudYhhXI7YqAV0yC88sjOQqKMZ9XVyD5/MAgzGOyQI2qoauSzqa0tFa4S33Ycvv13AVs5YlFpz/yKyjFmpoHhVwGB1UtApT38D6BctS3uf3EAEhgI27T65DZVdErxHMouBxXLmMmLOKx+WhRFe6k9JuFKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7uTbC96; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7uTbC96"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB721F000E9;
	Mon, 31 Aug 2026 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788179181;
	bh=eb/WOth3QHO7b2deSxPg2dsGsdtW//M9kO5/XINCZpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Z7uTbC96vMB8wTVL82TboFu9v1N8bt+8twm2O7gvFvF7kEmHuIr9Rl+AulS3n1IAs
	 0CXgzb1OQGD9VQjEblJQDZmdgIKFx5FZph+EVNuWndP2kIuf8TjRHB4JD5oqDuv7WT
	 Kp64BqL7hRxVIQ3cvSOv8tjHz33G3tcB5klMAPJFDRWNsOEVo84Ae2jOPE+mNJN+bR
	 fG9fvOrra5AjTTQyxv15QIwb1VZNgc8ka+69FLbsFR8UT2284r4fNNyfpG8VAcABCC
	 eIZGFqji+hAm/3OziDk9GLwVwNIADVYVCnUwyRBov9+ESQdEQZZY/x1zjGPWGqH/rd
	 sN+B2NglngGOQ==
Message-ID: <d8376922-bdd1-44ce-8985-3a0fcfb1d587@kernel.org>
Date: Mon, 31 Aug 2026 14:26:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: usb: qcom,snps-dwc3: Add ability to
 select UTMI as reference clock
To: George Moussalem <george.moussalem@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-1-5c1f3170bbe9@outlook.com>
 <20260830-primitive-faithful-mouse-cdd1e8@quoll>
 <SN7PR19MB6736260F96F41BC5B5F726C39DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <SN7PR19MB6736260F96F41BC5B5F726C39DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2026 15:17, George Moussalem wrote:
> On 8/30/26 13:41, Krzysztof Kozlowski wrote:
>> On Tue, Aug 25, 2026 at 02:42:26PM +0400, George Moussalem wrote:
>>> Add ability to select the UTMI clock as reference clock which is passed
>>> by the glue layer to the DWC3 core to calculate the reference clock
>>> period and frame length adjustment based on its clock rate.
>>>
>>> In the flattened snsp-dwc3 model, it is currently not possible to pass a
>>> reference clock that differs from the default since:
>>> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
>>>
>>> This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
>>> and IPQ9574 with a reference clock rate different from 19.2 MHz from
>>> moving to the flattened model.
>>>
>>> The Qualcomm takes care of clock and resets management itself and sets
>>> the ignore_clocks_and_resets flag in dwc3_probe_data to true, so the
>>> core doesn't acquire the reference clock from the devicetree.
>>>
>>> The existing DT property 'snps,quirk-ref-clk-period-ns' has been
>>> deprecated.
>>
>> There is no such property.
>>
>>
>>>
>>> So, add a property to select the UTMI clock used by many (if not all)
>>> Qualcomm USB controllers as the reference clock.
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>>> index ea60f7220afe..aa263dfd42a1 100644
>>> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>>> @@ -155,6 +155,15 @@ properties:
>>>        HS/FS/LS modes are supported.
>>>      type: boolean
>>>  
>>> +  qcom,select-utmi-as-ref-clk:
>>> +    description:
>>> +      If present, pass the UTMI clock as the reference clock to the DWC3 core to
>>> +      use its clock rate to calculate the reference clock period and frame
>>> +      length adjustment in GUCTL and GFLADJ registers. This is needed when these
>>> +      values based on the standard clock rate deviate from the hardware default
>>> +      values. If not set, the hardware default values are used.
>>
>> Sashiko comment seems valid. You describe Linux behavior. In your commit
>> msg you mention that clock cannot be passed since commit 613a2e655d4d,
>> which is a driver commit. So trivial answer would be: if issue was
>> caused by driver commit, then fix is within driver, not bindings.
> 
> The issue stems from collapsing the snps and dwc nodes into one: the
> same clock was passed as "mock_utmi" in snps and as "ref" in the dwc
> child node. In the flattened model, this causes two issues:
> 1. the core driver gets the ref clock by name ("ref") but you would
> break the binding by changing the clock name from mock_utmi to ref and
> perhaps causes backwards compatibility issues.

Driver can also take mock_utmi if this is exactly the same clock input.

> 2. Even if you change the clock name, the new qcom glue layer sets
> ignore_clocks_and_resets to true in the probe_data struct which means
> the core driver doesn't acquire and manage the clocks/resets.

That's a driver problem and can be solved in the driver.

> 
>>
>> Maybe there is different issue which is not purely-driver specific, but
>> I did not get that from description.
>>
>> For example, if given SoC has different rates, then the SoC-specific DWC
>> compatible defines which clock to use and you do not need such property.
> 
> That was possible in the 'old' way because it was allowed to pass the
> same clock as both the mock_utmi and ref clock, albeit in different
> nodes targeting snps and dwc respectively.
> 
> To solve it in the driver itself means we'd need to create compatible
> specific match data structs which currently aren't in the driver and all

Which is standard way for all the drivers. DT is not a way of workaround
for driver problems.

> SoCs that require it (at least the ones in this series) wouldn't be able
> to just use qcom,snps-dwc as the fallback. This would increase
> complexity of the driver (which now is nice and simple) and would
> require a change to the bindings too.
> In addition, for some SoCs such as IPQ6018, we'd need two compatibles
> because it has two USB controllers and only one of them requires setting
> the ref clock.
> 
> Kindly advise so I can adjust v-next of the series accordingly.
You did not describe the actual hardware problem. So far you said that
combining DTS nodes and specific driver code needs this property, but
these are not valid reasons. If your driver behaves not as you wish,
e.g. passes ignore_clocks_and_resets, then just change that. Or handle
that different clock.

Otherwise what is needed is to describe actual hardware configuration,
hardware problem being represented by this DT property.

Best regards,
Krzysztof
