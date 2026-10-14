Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73522C21D0;
	Wed, 14 Oct 2026 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973355; cv=none; b=WdrBUWhESKBekUZmnyExKItt6cKe1Fu0v7THeg2koX/glSI/BbsbMAwaYfsOFVfwJD77ZB4GjcRXYsvKKKUSzIOiRvGsbj+bPyU2zMD7GFBbxeUxMzzxKwCkfJPCGA2AFYVn9Hx9fpJnGgm8HQMbMdY6vIJyEftx3ADdNPEUtA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973355; c=relaxed/simple;
	bh=1ESQ0ekRio6WEiqPpZNuXzRCMorhN8/L6m7ea8uJC8s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=arGmyB1fV9HDauVQVUCXqEzW3pm2KmO7lUfT2FWs4kl4HTrWXGGo83RvDZB+ciXxwhvTPpnx4BbEnPEGZnRQrQPDBaboD+dFhbDcsyKxbAc3qRTJ8ceNgSt4MuuP22muHoclezQpUEzeve0BNgQk5L709D5+7riP4IX90ARRk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2kM6Zga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2kM6Zga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0CA1F00898;
	Wed, 14 Oct 2026 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973354;
	bh=HFwvdFjQOwo7pNUIA7Q1LUEaShtAWaPIThtJF3QfRdg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=K2kM6Zga5EhfcsonE7sl3EtIK834t52YBu16IpCI54NiHzwbxmjsop6jsIk4seoj3
	 njJaiBnWL97Mky0phu1y9UjhuwQz43S++fXQhFTaqOCvAt5Y3CWHlddrdzcOw4HvQD
	 OwRSsDgQeM+ImnftFCyosIEzLm06LF+Sw8A+uwibe47IxbaAp1crYzv0TRWkLhUuZ/
	 sjaXy5f2p2dVFmncemOue2KWkbbi1T8ySgYR7sjjr9HJDJadx3FE8ysaARLs/ShGJ7
	 QObrWjZpdlAaIqiSwA5p4QBsUx2sfobMcSd4UIn/jSIi6ioVDd/WsGsm+EarAFiRTP
	 5VWMjU8ncMtNQ==
Message-ID: <c5af1a40-e498-4855-8797-2663db83b9e6@kernel.org>
Date: Wed, 14 Oct 2026 12:22:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, tglx@kernel.org, radu@rendec.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <20261013-coexist-sixtyfold-cc6614086d3a@spud>
 <20261014-eminent-normal-lynx-3ebba3@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20261014-eminent-normal-lynx-3ebba3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2026 12:15, Krzysztof Kozlowski wrote:
> On Tue, Oct 13, 2026 at 06:54:11PM +0100, Conor Dooley wrote:
>> On Mon, Oct 12, 2026 at 02:02:43PM -0500, Alex Elder wrote:
>>> Define the binding for the MSIGEN interrupt controller present in the
>>> Toshiba TC9564 SoC.
>>>
>>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>  .../toshiba,tc9564-msigen.yaml                | 70 +++++++++++++++++++
>>>  MAINTAINERS                                   |  6 ++
>>>  2 files changed, 76 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
>>> new file mode 100644
>>> index 0000000000000..39dc63964bd52
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
>>> @@ -0,0 +1,70 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/interrupt-controller/toshiba,tc9564-msigen.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Toshiba TC9564 MSIGEN Interrupt Controller
>>> +
>>> +maintainers:
>>> +  - Daniel Thompson <daniel@riscstar.com>
>>> +  - Alex Elder <elder@riscstar.com>
>>> +
>>> +description: |
>>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>>> +  upstream PCIe port on the PCIe switch it implements.  The switch
>>> +  includes an embedded PCIe endpoint that provides access to various
>>> +  SoC peripherals (including an interrupt controller) via its BARs.
>>> +
>>> +  The TC9564 MSIGEN (MSI Generator) provides an interrupt controller
>>> +  with 25 hardware interrupt lines.  It aggregates internal interrupts
>>> +  and generates a single PCIe MSI to the host.  Each PCIe function
>>> +  implements an MSIGEN instance.
>>> +
>>> +  Each MSIGEN uses a gated clock and reset line.  These are provided
>>> +  by the clock and reset controllers internal to the TC9564.
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/interrupt-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: toshiba,tc9564-msigen
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupt-controller: true
>>> +
>>> +  '#interrupt-cells':
>>> +    const: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +    description: Gate clock from the TC9564 clock controller
>>
>> I'm surprised that the clock is not mandatory.. Realistically the reset
>> is also mandatory, there's probably one instance of this on the device,
>> where both clock and reset are connected. I'd add both to the required
>> list.
>>
>> Otherwise this looks
>> fine to me. I know you mentioned this device in the other series that
>> we were discussing but I don't see how it is related and is perfectly
>> fine to implement as a standalone device as you have done here.
> 
> I still do not understand why do we need to describe the inner wirings
> of the tc9564 device. So far I found no posting of DTS showing proper
> usage of it on the host. Without proper usage, what is the point exactly
> to describe the inner specifics of tc9564?

And as shown here:
https://lore.kernel.org/all/20261012152408.3729237-5-elder@riscstar.com/

there is no single user of any of this (this=reset, clock, irqchip
probably and more) in upstreamed patches.

I am getting tired to keep discussing it, so next time instead of words,
please post CODE which is the argument - who uses any of these devices
you keep adding.

Best regards,
Krzysztof
