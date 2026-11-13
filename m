Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584678;
	b=Hb3+zozKsrkgvEf9xr2TaxO7ZlAODnRsBSeO0ZnoOMShPMO2DLyEBCULilM/EYmLtbfr
	 o4TQG6nMqU5u5xJ/NccfOqQC8j+UpQ6bSCaCf7/Vw+WYbYalOEivDuJcl8/E7bDmlGh8v
	 hdP6U4zG8LHIc/mBW3d7tY4qHBicxR/Iojqep/r0O8eLKNwxMG8vbNArL6tweIWcnBesZ
	 TiWovhxHVd19DMX3Ol483HIKlM7pOdXvRlBNWTsnKKhfVACRO2WxzkQs7eA7N8PltRbg7
	 b+NKLruvwajg7WQcbff/V0/S0hp1W00W5j3Xd2iwUwIt/E2PTbMdj3tQ6bdR4gENNwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584678;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PbD4AtMB8bc+XYwJsGjxS6XrtV8DXvidAzLVTNW7qq0=;
	b=GBr/gQYvlwSx54HZUFWSVCnCUkJOVWe9a09bit5qWUwnUClVdeAZlvGaVIN0owB3P0Qw
	 w5nfq2xZjjF9O71g8RAFOISPjOx8XFFXJ6TEfwzyIFX69XwWyxItciOXouhenv/vTxC0A
	 2DW/nv6oVyu2HA2kz3ev0G7CEl/XNcKnacw1XHX5U8475g6EqCCnmrw0dIAzGva/coGKf
	 VZ0xHRGP+KD304CzeGnmfWP3ci1yR4WfClJWppBZtnHrO209s0vvl2bV/2n7Egscy4+cD
	 DjMqI5ycCyZsC0Al6pNBYokLo6poZTnQW1dtOO63yWWW9U5eAzjaj4pSJM5f5xASIlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+6TskSy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9D606A327;
	Fri, 13 Nov 2026 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+6TskSy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446111F000C4;
	Fri, 13 Nov 2026 15:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794584678;
	bh=PbD4AtMB8bc+XYwJsGjxS6XrtV8DXvidAzLVTNW7qq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D+6TskSyn0FKpFu5tg/C7jAmpR5r/CKULYkdn4H71AEu0ZAs9GFKfxg7OI7ZpOVRP
	 PjKWss5sth0A9kyeIT+Xw650IetB4HFv44Fcbc83BAOBuG1CEUizlfVq7hXMptDdkB
	 S6LonQFgC5YlwuVsEcMamNf0FmLS4x11t3ePv6T4BrvdqlMLSlSITqks+AX2DUR/tU
	 Uaew2SvQbL8Ifz3lxo+XwVuecy1lCOsirWJbbk3MonDPJ7ApEh4AyKuSE/HLjy0dRx
	 5C/kV1s5GzQMpBi4muWFF3VXOCHh7qpkf9DC1XD4lh8bHu2DNMIXtl3hSBBmOZDHoA
	 HdVlrjdk+Kb5Q==
Message-ID: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
Date: Fri, 13 Nov 2026 16:44:29 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: add device tree for Asus Vivobook
 16 X1607QA
To: yass27106 <yass27106@gmail.com>, andersson@kernel.org,
 broonie@kernel.org, srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <01b2c920412848ab85493acc2d4f5fc1@gmail.com>
 <5cfd0705da5845b88ffe6d9e8bfeb966@gmail.com>
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
In-Reply-To: <5cfd0705da5845b88ffe6d9e8bfeb966@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2026 14:24, yass27106 wrote:
> arch/arm64/boot/dts/qcom/Makefile             |   1 +

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Please read submitting patches document to understand DCO.

Looks like completely corrupted anonymous patch.

>  .../x1p42100-asus-vivobook-16-x1607qa.dts     | 239 ++++++++++++++++++
>  2 files changed, 240 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 88230c4e00e..7332a73dbac 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -509,6 +509,7 @@ x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
>  x1p42100-asus-vivobook-s15-el2-dtbs	:= x1p42100-asus-vivobook-s15.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-vivobook-s15.dtb x1p42100-asus-vivobook-s15-el2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-vivobook-16-x1607qa.dtb
>  x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
>  x1p42100-asus-zenbook-a14-lcd-el2-dtbs	:= x1p42100-asus-zenbook-a14-lcd.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> new file mode 100644
> index 00000000000..fc572d779b3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/* Hybrid device tree for ASUS Vivobook 16 X1607QA (X1P-42-100).
> + * Base: proven x1p42100-asus-vivobook-s15 (panel, USB, boot path).
> + * Transplanted from x126100-asus-vivobook-16: audio stack
> + * (WCD9385 codec, WSA8845 speakers, soundwire, sndcard) + firmware paths.
> + */
> +
> +/dts-v1/;
> +
> +#include "purwa.dtsi"
> +#include "x1-asus-vivobook-s15.dtsi"
> +
> +/ {
> +	model = "ASUS Vivobook 16 (X1607QA)";
> +	compatible = "asus,vivobook-16-x1607qa", "qcom,x1p42100";

Missing bindings.

Best regards,
Krzysztof
