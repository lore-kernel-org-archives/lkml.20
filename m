Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792475866;
	b=D80yihp0XkJ4Q/pznf6UVAqKkUEMooOh9kVcfDh444RnnSrpjH1x0N2KeUTP2oB3OB3o
	 s7qb/fS2WF8aiQSBveclFobua1+HYdwCWytwHsKMD8oNF5aRFpxjBF/1plYia8zq+XS3f
	 s1gmlGSoZ1Ncb5BmvKOIRoqV2hYglqFETBTsy8WsqohJvKOq4Ncuhat+o6G37mKbA61EX
	 SP2gM91BwLO8DC+gXLSlYg4aOODnMMBlBiNDsc33o2GAIG0UwNLqZLD9DzjDlo+LMbSkX
	 gCT50B+kTAnc+OcakbVOnUS8fG9vjmc5nc+62ITCLHt7yflzlVu4tFpl4Ajur+4dKLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792475866;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2iaM9OT1kpXTLHWYBcxjMMF73r2IZAgtIiZyPOt4dyY=;
	b=d30Wau82ZftLHXjflybgTGU/m5xt67VeZcGGP8Lkp5E5bGQVuOQ0oKGCo4o6hE18HOlH
	 MWTYoS16Jpr02sPBhlcO7dhSZdTNZc5k51eIXKFVKt+QTdotGuhQL51n1bkmPL0Hjlr34
	 nCZ0IOU68vQlSzgKjZldSZ7ytYc+4IOdwyurmA+IQ9n4ZG1ofnipviz1f/yvY8l54Afhw
	 lCN/3ws70i1GJS02Oor4E5tSmVlochFBrfqItgKcR+rr+HDeWh1oZGxfocrqqIgIRbd8w
	 iDnoJ+q0GSNKhlOvNXx98Fwrz6Inox0ISjVULorugGkkyn+ppkaNeqyWnKA4MgvuQiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qv8AWNvh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25980606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qv8AWNvh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7261F000C4;
	Tue, 20 Oct 2026 05:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792475865;
	bh=2iaM9OT1kpXTLHWYBcxjMMF73r2IZAgtIiZyPOt4dyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Qv8AWNvhIwbt99gYbJLMAyU5gmnaNCIwApm2UVKN6Gy5yCFJNWCMCWcgrpkw7K762
	 AwgLDjQ80vt8l7EIwe2M2XltNqQl6IRv+/mKAQBXYRAKX2bazFJPjKR8Gi40J5qAdA
	 Z2v4vJGtveP/gz8D+hgie6avBgZMpCTEHv6eTbq6wQaWe/XwUmheQwvlRRpsBGDjSJ
	 /KeEixNb8bAd+M9nb2GC7RUiuAKN5t1smdLU/pYrJqD1oO/VRDObFSmMFK4JOP0RXm
	 oGJh8wbSkONE4DWrhLsuscEW6zKi1UL0Aat/8u4f0x7uRySLlx5z9bkm3SELbkKhq8
	 P9N9VWRE1Polg==
Message-ID: <69332560-6f04-4ddc-a031-46e8559ca8a9@kernel.org>
Date: Tue, 20 Oct 2026 07:57:39 +0200
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
Subject: Re: [PATCH 1/3] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf binding
To: Moteen Shah <m-shah@ti.com>, conor+dt@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com,
 ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: u-kumar1@ti.com, gehariprasath@ti.com, vigneshr@ti.com, afd@ti.com,
 a-limaye@ti.com, y-abhilashchandra@ti.com
References: <20261019080736.944127-1-m-shah@ti.com>
 <20261019080736.944127-2-m-shah@ti.com>
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
In-Reply-To: <20261019080736.944127-2-m-shah@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/10/2026 10:07, Moteen Shah wrote:
> TDA54's MCU domain exposes a shared scm_conf syscon region that other
> peripherals, including chipid, access into rather than owning a
> dedicated register window. Rather than a bare fallback entry in the
> generic syscon compatible list, give it a dedicated binding
> describing the region and the proxy/claim/lock arbitration scheme
> that gates write access to a subset of its registers.
> 
> Some of the claimable registers are gate clock controls, so also
> document the required "#clock-cells" property that lets the node be
> referenced directly as a clock provider for those gates. The clock
> specifier selects the ePWM time-base gate by instance number.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>

Incomplete DCO.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time.

Please kindly resend and include all necessary To/Cc entries.

Best regards,
Krzysztof
