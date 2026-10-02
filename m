Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099ED474245;
	Fri,  2 Oct 2026 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933961; cv=none; b=hKRieSfbFG9EvOp310pBCWXmP4yuittOnsk3kzW0tDuYXdatxvJnRginJuHtcAZNLvq8d86MOfbLqIwn1FgsONzc8mM/2npPELutxP2jBHrbV+SmOVy6V1sym0Zf7UmjK5emxZhsr861tucJnNt8aVNG3n3SllkAC4t2j6kSZ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933961; c=relaxed/simple;
	bh=hA1zeAk4wxpxXGX4kPhV20Ts9tikCfkkYTnQNM8EwqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozgvn3OL9UYL6orJPnPqpvVqT6rP32kEiP4Dppmb9U1B3gb1uI4bqA7R7KudO1PnNdtEIySkRYPMW48MiwfFzLVRP8rV6Nru9oupTLGWd2agGiPN0FJSQbuNK0eDLTz0KFn1DT8GVTw+p87XoxVVlue5OQYxy6EX2lDMghHse6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Trs8e8WE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Trs8e8WE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06C91F000FF;
	Fri,  2 Oct 2026 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933959;
	bh=fjj+f5ijhUmhJthBkgxDWQqiZjrQVyrTMW5I1jLfkXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Trs8e8WE4T7ghZ6J2kcvRzDd0DVCDTPX6L68v8d5dXlAwzAWeMXWbzzq8jBLz0R0u
	 vw9YwyWOV1syIYezd4ixmTAeQQcPPj3Ub6H1lE0BT5jL/aktfvL9Jm0G3fol5pZa7R
	 tONxMxHzUdbCoUGXmYvCZgD9IY6hQA07u3wk6+Qoq34z2Xl5jcGinVkblKveXL96BZ
	 YdqZooGF1WY+jhnpfQehYlyhMxfZBydrAJv1a8FBkdtfIHiZu2g++MRKnWLqCYJcIg
	 Ujtya90RKbBwlZmO8VXKhBAYvjbduRxIkFQRlVNOXXpYEkF+Evv8yb2+TPa7NOu+XV
	 wFxHrH1SO5bPg==
Message-ID: <7a66abc8-3b9a-4a9d-a094-e47e3588091a@kernel.org>
Date: Fri, 2 Oct 2026 11:39:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: arm: keystone: ti,sci: Add
 ti,tda54-sci-pdm compatible
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 afd@ti.com, u-kumar1@ti.com, vigneshr@ti.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-3-b-padhi@ti.com>
 <20261002-observant-prudent-booby-eac28e@quoll>
 <ac1d3bae-81c5-47b6-99f1-50e5b06c1a86@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
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
In-Reply-To: <ac1d3bae-81c5-47b6-99f1-50e5b06c1a86@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/10/2026 11:30, Padhi, Beleswar wrote:
> 
> On 10/2/2026 12:01 PM, Krzysztof Kozlowski wrote:
>> On Thu, Oct 01, 2026 at 01:11:27AM +0530, Beleswar Padhi wrote:
>>> The previous TI K2G and K3 architectures were tightly coupled systems in
>>> terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
>>> were sent to a single sec proxy thread terminating at the core running
>>> Safety service (DM). In K2G systems, DM handled both Safety & Security
>>> requests by itself. Whereas in K3 systems, DM serviced the Safety
>>> requests itself, and forwarded the Security requests to core running
>>> Security service (TIFS) on the HLOS's behalf. This posed various
>>> limitations:
>>>     a. Increased latency: An extra forwarding hop through DM adds latency
>>>        in requests and responses.
>>>     b. Freedom From Interference (FFI) concerns: Having Safety service
>>>        proxy Security's requests (& vice versa) undermines the isolation
>>>        and FFI of the system.
>>>     c. Potential Deadlock Scenario: Forwarding messages between Safety
>>>        and Security cores can result in a deadlock if there are circular
>>>        dependencies.
>>>
>>> To eliminate all the above limitations, the TI TDA54 class of SoCs
>>> introduce an architectural change: Isolation of Security and Safety
>>> services. To realize this enhanced isolation in hardware, two
>>> independent sec proxy threads are now provided for HLOS to communicate
>>> separately with the Security and Safety cores respectively. And the
>>> TI-SCI message forwarding has been eliminated in Software. The System
>>> Firmware ABI5.0 version necessitates this improved isolation and FFI
>>> change.
>> I don't get at all how above description helps to understand this patch
>> and this new compatible, except that this is not compatible with old
>> variants.
> 
> 
> You just answered your own question.
> 
>>   So 30 lines of text instead of 3?
> 
> 
> The existing system controllers have been compatible in all TI SoCs
> for over 10+ years since Keystone generations. Using 30 lines of
> text to explain "why" the new system controller is not compatible
> with old variants is worth it.

If you decide to spam us with a lot of description, including marketing
crap ("To realize this enhanced isolation in hardware", "this improved
isolation") instead of writing concise and precise messages, accept the
outcome of maintainers choosing to allocate their time in "improved way".

Best regards,
Krzysztof
