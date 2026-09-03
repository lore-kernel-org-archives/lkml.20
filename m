Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532913CAE80;
	Thu,  3 Sep 2026 06:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417636; cv=none; b=fLsqf39W8bNkpE+WldpIjeTw6s6cNoOyA8OCgoIHXrlmDjUpoIQJbUjaukbKHNqM6pJRnE0E/e3yOwqo1yl73oJoTgV8ufixKz0nGtlX4ZHYD7O0Zy2wKWY0rgSBh3k7CfkZNEX4rt6+14zKa8BMVkFVCpHbOUBJ2h3x/DLJNOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417636; c=relaxed/simple;
	bh=ejMNEUzKxafjlD89Za7m2oNvTOgJyqZLzjphiTJE20w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIy7poPH5OcxESLGWcjA5MWCDpTq0ZSW8p2sYsEeqokp2M+Sbf6N4JAKW/IXW+3Kh7QK1GlC8SP4eXcaKalHSFmjWAJRZ+eDPSdtkUnYQq5aAcnm5nthWMgRFmzb4yVt6eOCOamXL/9jcaboWoxSPqNOrWU8ITyTadGJS8o2m3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Akj6NORP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Akj6NORP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D3B1F000E9;
	Thu,  3 Sep 2026 06:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417630;
	bh=SG9pVxMHTL6Sx40NXjlorl4kGOk+6vdpYuFCN+zzKcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Akj6NORPryy44xPL8LghMdNzeM/h2f+So0BapcNasrDUnI9JxsvSEK67K14aXv9C8
	 9R9omclSqkfYElyYOyrr9zS95EuubHVvbBzUAU8FF4JbByPoxsV9wflEVzgLgUdoaV
	 YaaGm9xRxgpwyHioQN9hJkaQ2W1oQcUkkgw3Iry/EU8Wlof2wtLAmgkhQmn+Lpb/pg
	 4UUJoE6OohxeUbzCkDwxXySPOwOyJCEWoFZamjJTNfbNF1PBeNf5/wEYjVmcttPx/A
	 VVzteso9/d/Lc8cJFkLcnpdGE3wXtKdeHuKOxAJ0tBkKjTdL6FtdsJePpUzwYBmzpB
	 fjCgIBISrpYxQ==
Message-ID: <b192753a-b7c1-4086-9c15-4af2008a5670@kernel.org>
Date: Thu, 3 Sep 2026 08:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
 <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
 <06bce1c2-8498-4988-b5c0-ab42bfba86cb@oss.qualcomm.com>
 <dd3c20f3-89dc-4b5a-935e-e0e142988e4d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <dd3c20f3-89dc-4b5a-935e-e0e142988e4d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2026 08:32, Konrad Dybcio wrote:
> On 9/2/26 6:59 PM, Krishna Kurapati wrote:
>>
>>
>> On 9/2/2026 7:40 PM, Konrad Dybcio wrote:
>>> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>>>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>>>
>>>>>
>>>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>>>> present.
>>>
>>> [...]
>>>
>>>>>>>                  - qcom,eliza-dwc3
>>>>>>> +              - qcom,glymur-dwc3
>>>>>>>                  - qcom,ipq4019-dwc3
>>>>>>>                  - qcom,ipq8064-dwc3
>>>>>>>                  - qcom,kaanapali-dwc3
>>>>>>
>>>>>> This changes the ABI without an explanation.
>>>>>>
>>>>> As per the harware specification, the controllers do have both
>>>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>>>> info. Will update the commit message accordingly.
>>>>>
>>>>
>>>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>>>> incomplete? Lack of context here is not helping.
>>>>
>>>> If they have these IRQs but it does not matter, then it is not a good
>>>> reason to change ABI and you should just add the clock as optional to
>>>> the end. Was this binding already released? I think yes.
>>>
>>> IIUC the intent of the patch is to allow specifying the currently
>>> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
>>> Bundling the DT change would have made that easier.
>> Yes, I wanted to add the missing hs_phy_irq. I didn't want to bundle in the DT along with the usb binding changes. DT change was posted separately:
>>
>> https://lore.kernel.org/all/20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com/
> 
> Shipping bindings and DT changes in a _series_ is preferred, what one
> must avoid is changing them within the same _patch_

No, DTS cannot be posted within USB patchset.

Best regards,
Krzysztof
