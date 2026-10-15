Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EFE2E5B2D;
	Thu, 15 Oct 2026 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071081; cv=none; b=XDY25/Vya08VnZjGP98/kUfLkprNuBrNSZqknAZxp9xMCU4xDyM77OZ+Zh/ES83hJeojA2R6bu9mjbWl1dU4kh2X8a/wPBzb2UycMWNNZOPMMBzK5l8nB5q+jfxtwqWz97JwQNJlEoHNPOY9Ahf6ttbVaesllsbw+mZaMNGMrU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071081; c=relaxed/simple;
	bh=vmA6XUYtlHqFYF1V3I5JQfJJrWaaZuz3a5rJ1xnV/z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pp1bb/6XJMGHlINiVcr5xbeIlvBJluQsrEwRlQkJs9kXKpssNlPp9c8U7GgPCy3oKu0LWqz6uPhm3TrDLW+Co2e8jp0jy2KAFavw/QwAASDPcjhlFS/zDLIb4oktJ8352rt1whTfA8tpPehwXkb5O/+iO2MMvCd+65Th7juO87E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz11t1792071051td5e74615
X-QQ-Originating-IP: ZY3dpyG3QC+HIamw3iX4CacHKho9duMeYS2GbkIpwjU=
Received: from [127.0.0.1] ( [180.159.160.209])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 15 Oct 2026 21:30:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8017279923020972316
Message-ID: <8E9F476DB51FFE97+cb168190-d184-474a-bec2-91edf7bdd2bb@radxa.com>
Date: Thu, 15 Oct 2026 21:30:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: sophon@radxa.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831-sc8280xp-qup-pinctrl-v2-1-a69bbbdb37e8@radxa.com>
 <3d00c7d2-026e-4ce8-bda6-bb2d0f3c3123@oss.qualcomm.com>
From: Xilin Wu <sophon@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd
In-Reply-To: <3d00c7d2-026e-4ce8-bda6-bb2d0f3c3123@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nc4Sv39/e83WTkWT9LCrG+JtKlGp2is4gTi79+kMOaP/0VXRZmEcXsYc
	Funsydf1nz+K8V9C8t5dag7jLSZJonpJa5FgjkHLMVrceuV7G12pHAaf682GZKMyXEii4u3
	tI4TEmErKbYilqM9aLA+0jbYKl12+IN43CJO3m3XcX0bBt+j/3X23xDDw4K/A2XDPr/3f9k
	zo2kPsFhJGGr+M5YCLEfh6SeARKJ0TvuJHZxhWydm0vPSJ04YDAAAQP/phgNPjPkecYHjex
	fTUbOBa2IKwxywfNrRDf2THRTWKBrEqGbxC4565oIIQVxVHa95MqmkorzAPlgGd2rWlQn5v
	E2IpJ70Tg3duQGej4FKsVifOTFCA77M4p+3UgerGYLpIfWZZkzheaVe/ENTf2glynvPdIvx
	TRTi2M87b+V+o//oH3wNdpaVpQX9hXCul+PI0lYy2QKT1PaCbi/ynDhv+5Tfsk0d5iEWFKz
	aZOa8NsITHC8eg4jAz//AdYPVJTkBPbck9zF5A5ItSezlLhFTkckXhniKNBvOlM5pt6PnL7
	t0rst3YTpyYV3lyDZ59NFdEUxXm4Z/vhuN6y38GwluKg7aVVenBAzqAWmRgGpd1l+kCoZF9
	c82bZfbwPepVxkGK1isNcj1JADjfCs0pBj5UkG8CCMCZsrpwzo71IKfYhbYiGvkkymQD3j1
	AHBXMORoCuTIZeTnXW7l9FgGHbZFJqt9z/I5V06vkjLv9q9QR0Vx2ubJMqiVQRmbBc+u8ur
	6FCIPw+Vqo2IoL2YZDGrMzQvLIhqMqzr1qUghvRNeXkSzBfx74lzsROUSIPLmRHEUJcdrQa
	ru0ZjhkR0IC60wNE3LmaKcAjke76aSfeqRI0qN3Zfm39vBmE1lCOTe2o0+dOx2AmzCtfQH8
	CNjuK989C7ob0ft7yg9gCHw1KPHc1Aa3wFKbkeZk/zC3XsBESawyyYrErH0DabAUOW5YFxB
	hIJ3IibatZmUYqUmIgfPBjqu1MWGgX4ehdi/uaMKhDEVwHpM0bPyKESp8nVQXKfiyJwEZOw
	1Udy4JkUVXFr+7m4kSm4P2M52LTooUoLAYiPh0rTs+HjUSyTv7w6V5zZ/uQD/NtMJXBp345
	BoTvz0z6UWb
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On 10/15/2026 8:18 PM, Konrad Dybcio wrote:
> On 8/31/26 11:55 AM, Xilin Wu wrote:
>> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
>> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
>> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
>> the non-linear QUP instances, and keep the mux function names aligned with
>> the driver-supported qup0..qup23 names.
> 
> [...]
> 
>> +			qup_uart0_default: qup-uart0-default-state {
>> +				cts-pins {
>> +					pins = "gpio135";
>> +					function = "qup0";
>> +					bias-bus-hold;
>> +				};
>> +				rts-pins {
> 
> Please keep a \n between each subnode, there's a new tool in town
> that will be very grumpy if you don't:
> 
> https://lore.kernel.org/linux-arm-msm/cover.1790892852.git.waqar.hameed@axis.com/
> 
> https://lore.kernel.org/linux-arm-msm/e869c2bb5005830c9ac1d4bf998696ffc4eed335.1790892852.git.waqar.hameed@axis.com/

Cool! Thanks for the pointers.

> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


-- 
Best regards,
Xilin Wu <sophon@radxa.com>
