Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E547236E48D;
	Thu, 27 Aug 2026 21:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787866996; cv=none; b=FG+AyOa+wItJSfShG0jPAh6XweBKSBz0uDmTmOts/WIMYcfmdegBiWP63Mz0T7Mp28Fol7cBhkfyxc6wokZk6WFZ9YTI7QNo+04m6zRgBqhFt9kZBpKCx0tz0UnpJEWgpPDNODH/hsCLYD/WovM8qRgVv9fsRDqz84MXMDGoLSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787866996; c=relaxed/simple;
	bh=92Dv57M7Xdm8lma4PWfeskzuUst5H/MnbaNH6KnTzuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlRi8hMLCAcuHCoAk7jf9yUyy+9Dr18MYIIpZLHJd4pwbfbgaq0TgkI8QR3mWxog0C9B0G3/AOuBVer7tMzgEivqXOhcEJImXMipOb6UBnKtBzEzm3pwkap/xWSeWIDzt5ujjnLATgUhxkhUVYqIP+OaRou+zu5GvQM7D1MFOuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gO4snFbY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gO4snFbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099C21F000E9;
	Thu, 27 Aug 2026 21:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787866994;
	bh=4JuAU+RlRFFgowlE8y5vu246G7lREQ6bpVyCNH9/6jU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gO4snFbY8kph8z5xcQ1LBM9FCXgPvSqOQ3NwWm6jmVsgwG4sYazcOU1OOp0hq+JvB
	 HzY3W26KeqQA8dljBWoFjh3aUba6EfIara8M80sluJGemipVWfbla7Xd2qfLntvn3X
	 t2WYPNIv7xxdir9rwbOhy2VOIEVpxwOGFV2EUkzraqeEJORWtKlkz6L4dUMSllVOgk
	 URV5wyEdUsoIjVhrrZAt8f1FBaH2m70xDOCgV7t+Iwt6Wfa3K2MhRjgNZEiC866bJf
	 GPehPaBwWVghZvWVLEwj0k+D7r3lwjUdzx9wmjmR3SEzpjiCuXY10ss+b92q1yOf0w
	 ZGPIg9vOZ9IRw==
Message-ID: <205a39ec-712c-42f3-8c5d-12a66e07a0a5@kernel.org>
Date: Thu, 27 Aug 2026 23:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge
 compatible
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Caleb Connolly <caleb@connolly.tech>, Frederic Laing <dev@fredfunk.tech>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
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
In-Reply-To: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2026 01:38, Rinat Muhamedgaliev wrote:
> The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports
> DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.
> 
> Binding it as bq27411 selects the wrong register map and produces
> invalid voltage, state-of-charge, and temperature readings. Use the
> bq27541 compatible and rename the shared label along with its fajita
> and enchilada consumers.
> 
> Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C,
> built the DTB, booted it once with fastboot boot, then installed a
> locally built postmarketOS kernel package. Before the change, readings
> included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the
> bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and
> 33.3 C.
> 
> Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")
> Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36

This is fine.

> Link: https://gitlab.com/sdm845-mainline/linux/-/merge_requests/148

But link seems irrelevant here. We do not reference downstream PRs in
upstream commits, because it should go the other way.

Please drop it.


> Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 948a0dd18..0c6203fa8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -790,8 +790,8 @@ &i2c10 {
>  	status = "okay";
>  	clock-frequency = <100000>;
>  
> -	bq27441_fg: bq27441-battery@55 {
> -		compatible = "ti,bq27411";
> +	bq27541_fg: bq27541-battery@55 {

If renaming it, then node name should be fuel-gauge@.


Best regards,
Krzysztof
