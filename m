Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AC1518140;
	Fri, 18 Sep 2026 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752994; cv=none; b=VtS4hhyVtobKdFyX1KbJ6p6zb7Y+Udc+rzGKGTVPyLLTLFANBN5ie1MVKPbAW+/VH57fiSpukE0WXma8x58bKeTGd3SQxuJsGTmp/xixmnI+6pwRXnCSRWccaBsR+ZVIaLNXZj7sC34U2VRbm2NdbPC8Enz22wNMluED5Jzz0YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752994; c=relaxed/simple;
	bh=2srv1XLkscOatAp2l4+oooP8vZZpRy+cubNoI7IaP24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1DwansFkjg8rOQIROcjIfTktULl81RsPx5q+BSLuGgHludRqV3+hq8rWNRSI9TZ40rHUPnO38n1kmGRYE7PFa+l3DFktSKSEUey1v6sCi3cCHWXa+1BaOF/iEf2JFLFrRoUNM6an7mv51y9tIxKz9bkOOseUpa8bEOO+I+ab08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eBdR4zQ5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eBdR4zQ5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0C0D1596;
	Fri, 18 Sep 2026 10:36:18 -0700 (PDT)
Received: from [172.18.224.124] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EFD13F7B4;
	Fri, 18 Sep 2026 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789752982; bh=2srv1XLkscOatAp2l4+oooP8vZZpRy+cubNoI7IaP24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eBdR4zQ5mqr+kLhrkLlnUHMi5INt3IUoHVvjNTADZu6tTNm1EGNfBvRHUYVi0VNxG
	 ZDXwTlZaAMYofuUgHh2IvIykf7ebHqEnZE73bYnTBlxl7L/nxtQNK1WIAN7S7uB+V8
	 fyOjTikMpTBePwQm7nA9JLRE7o6HqtO9I9jHrT9s=
Message-ID: <f31009e2-f7e0-426f-a546-1ed3ba63a1b4@arm.com>
Date: Fri, 18 Sep 2026 19:36:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1
 pin groups
To: Mikhail Kalashnikov <iuncuim@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918165414.1129076-1-iuncuim@gmail.com>
 <20260918165414.1129076-4-iuncuim@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260918165414.1129076-4-iuncuim@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/18/26 18:54, Mikhail Kalashnikov wrote:
> Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
> that used on some A523 boards.

I was about to say we should add port specifiers to the node names and 
labels (i2c0-ph-pins), for functions which are also available on other 
pins, but I see we don't do this for I2C on any other SoC, so that's 
fine. It's internal, so we can fix this later.

Compared against the manual:
> Assisted-by: OpenCode:DeepSeek-V4.1-Flash
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 85ef492ff..0ec5d19f7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
>   			interrupt-controller;
>   			#interrupt-cells = <3>;
>   
> +			/omit-if-no-ref/
> +			i2c0_pins: i2c0-pins {
> +				pins = "PH0", "PH1";
> +				function = "i2c0";
> +				allwinner,pinmux = <2>;
> +				drive-strength = <10>;
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			i2c1_pins: i2c1-pins {
> +				pins = "PH2", "PH3";
> +				function = "i2c1";
> +				allwinner,pinmux = <2>;
> +				drive-strength = <10>;
> +				bias-pull-up;
> +			};
> +
>   			/omit-if-no-ref/
>   			i2s2_pi_pins: i2s2-pi-pins {
>   				pins = "PI2", "PI3", "PI4", "PI5";

