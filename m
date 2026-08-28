Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1774483B4;
	Fri, 28 Aug 2026 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925235; cv=none; b=FMmE+7Sn6E7idZDgsFoUkcqeW3TIE2u9h6dVzJztIEan0Cb+4NOxHmW9Mdmu4lhk+48gaqSiDfB24d2RdLpoaTjteqVyt7S6HY1Du/DBBWGzeWrPTQGHZCMguCJtt1ujWZXnfEeq2KAIlLRBILUkrTBRwVr3Zxp+H2shXT5cDs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925235; c=relaxed/simple;
	bh=kXgMR8hm7kIp8DTHlR4dY9/bTOwLY6WheomYKQPg77U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5CMqLPehkxpYcsMqHVd122cLoFzBlQyhn5SwwEzfYcV9/CbbCyePdID+wOiYTcbMJaFU+BLrFw8aSn9CSouMZD9wTF3DTNHTKBaxBAFC/rIQ+dluCEkMYZVH3N1/RMzpMh4KXWgupub4bJ9BbMzFJHArQe3PlFOr4/mSmgFlt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCMAXylf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCMAXylf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED5C1F000E9;
	Fri, 28 Aug 2026 13:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925234;
	bh=JEf/yn3xobDd76sGZN0XNmJaP5BkkaOWJh0ShYjek9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MCMAXylf8rvXx0DPau2LPmmdP5k3QV2NBU/JYno6+kWTDW69nVqX+qfrnlzxm29aD
	 xDnzNKuVbwvWDmMoXyn+DVYlOgUUH07+E7aG4Q5k4fRX22SevYtodw4SrH2bhsg3LW
	 jRBZZIlVxqKdDnIeOV+4u3pj3c4IJSf//jFkywHjsD1+wmLzbHd51L0F46mIESs5MY
	 Ic6UEmOUTDMzXC0+l73ChZ/IWTME55v9xlZlEFW+gKkXK0/JIkHMY6bCv7v7bMsRZb
	 RIUEg1VLxR+IQj6yO11SF6XLJjvQTKY3H8H2+T81THqyqIRNbyxV0LvP99ngOG/qN/
	 tpWRAofjtqU7w==
Message-ID: <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
Date: Fri, 28 Aug 2026 15:53:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Matt Eaton <linux@divinehawk.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com>
 <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
 <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2026 15:18, Matt Eaton wrote:
> On Fri, Aug 28, 2026 at 2:39 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
>>> From: Matt Eaton <linux@divinehawk.com>
>>>
>>> Document the xhci-no-soft-retry-quirk property, added in the
>>> following patch.
>>>
>>> snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
>>> peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
>>> accepts it there.
>>
>> I do not understand how this sentence is relevant. Please describe the
>> hardware needing this.
> 
> I came across this while porting the UniFi Travel Router (IPQ4018),
> the stock Qualcomm kernel is 4.4.60 which predates the soft retry
> code. The command ring hangs if you disconnect the device while it's
> transmitting. Reproducible consistently when using USB to tether to a
> phone.
> 
>>>
>>> Signed-off-by: Matt Eaton <linux@divinehawk.com>
>>> ---
>>>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>> index 4238ae896ef6..5d67a41658f7 100644
>>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>> @@ -25,6 +25,10 @@ properties:
>>>      description: Set if the controller has broken port disable mechanism
>>>      type: boolean
>>>
>>> +  xhci-no-soft-retry-quirk:
>>> +    description: Set if the controller cannot perform xHCI Soft Retry correctly
>>
>> Why isn't this implied by compatible? Looks like controller's property.
> 
> The xhci device is created by dwc3 core as a child device, and so
> xhci_plat_probe() is used. I think a DT property is the right
> approach, similar to quirk-broken-port-ped, but to set
> XHCI_NO_SOFT_RETRY.

Linux driver behavior should not matter here. DT property for telling
Linux what to do is not the right approach. As I said, it's implied by
compatible unless you bring hardware reasons why it is not. Driver
reasons don't matter.

Best regards,
Krzysztof
