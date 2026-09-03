Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E843E5EFA;
	Thu,  3 Sep 2026 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417025; cv=none; b=u0swNhXkY+jJwuwverbO8I4unvxC41ZhUVrphxlmTViugQ606qYRO6SYZxjHeo2pUi4nbAtZwmEN3EzJJxuOwEnFbBLIXOL5XY5JHqCoBJ41nYhriTexLMmz1IlQSpsOpK6SpouSBT8PXQ/uIa21kFZQlq1kR7p5i6xzxJfS200=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417025; c=relaxed/simple;
	bh=K0mIDOj1jh/DIVga59w8LwhKbcyWJv95VugPIdNx+Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLY1ljyplkdiXvPEH4aVqMWlcAvx1C1hOr7elqXty24AeOHcQLriI/FF8HZX4Hmr3zSHYheIFF6EGL2G7F39DSXfQLsh4ngJdfrgFWE95YhgEC1Nh61Vjon0OHuTUce24gtEYlDtkqlVnqvT1QgSpyBNTqX1VbKf1t3MQBekdu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVfxUnqT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVfxUnqT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909D11F000E9;
	Thu,  3 Sep 2026 06:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417022;
	bh=rIPeNlXft5qwGDCPcStsc5nZyiqlws4Zz6uCNrYyQyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MVfxUnqTqzgIOA7Stjk2sqCaMIwJHJR6btTQ4cX8mfQ2icxuWipuP0pX9C4OMlJWa
	 FPOTO0sd+enJCX7IUzVrVcJaLWn7m03XIlLRDdyJBueIjhX0ewV4d2yO+dXLJYaFO2
	 qcWMXM1xhKnJwyX6aYAp87iHjfV/qaVkc4FCWBbDkUXYMIwFishNeg4hLghHi4u31s
	 KKx3nF8OnJyc/Zkr640S+C1jgfrt/leuDDxiAvm3xKbUSHiDWRm+soC6Gcajyhmf/w
	 qaotj/umUpBgoIVjJ2SlKheRgPxgIWW59tpNwerALUo7ewpDK1LTIYRRoDtWJUU33A
	 kmWr9YXcCopLw==
Message-ID: <791fe5ba-5110-47d8-b0a8-9ab447762671@kernel.org>
Date: Thu, 3 Sep 2026 08:30:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: usb: Add CIX Sky1 USBSSP controller
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: cix-kernel-upstream@cixtech.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, fugang.duan@cixtech.com,
 gregkh@linuxfoundation.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, pawell@cadence.com,
 peter.chen@kernel.org, robh@kernel.org, rogerq@kernel.org, vkoul@kernel.org
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
 <20260903023521.2064986-1-hongliang.yang@cixtech.com>
 <20260903023521.2064986-3-hongliang.yang@cixtech.com>
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
In-Reply-To: <20260903023521.2064986-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2026 04:35, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 Cadence USBSSP controller
> glue layer. The integration adds glue registers and mode strap
> controls in the Sky1 S5 system controller. The CIX glue node wraps
> a Cadence USBSSP core as a child node.


Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---
>  .../bindings/usb/cix,sky1-usbssp.yaml         | 137 ++++++++++++++++++
>  MAINTAINERS                                   |   3 +
>  2 files changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 000000000000..73231a2741bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cix,sky1-usbssp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Cadence USBSSP Controller
> +
> +maintainers:
> +  - Hongliang Yang <hongliang.yang@cixtech.com>
> +
> +description:
> +  The CIX Sky1 USBSSP controller is based on the Cadence USBSSP DRD
> +  controller. The integration adds glue registers and mode strap controls
> +  in the Sky1 S5 system controller. The CIX glue node wraps a Cadence
> +  USBSSP core as a child node.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-usbssp
> +
> +  reg:
> +    items:
> +      - description: AXI property configuration register
> +      - description: Controller status register

Same comments. Individual registers are not a device.

What is the actual memory map there?

Best regards,
Krzysztof
