Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95272416872;
	Mon, 14 Sep 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380528; cv=none; b=u1TpvMH3QwvAHbVtYrj68CL8tO165qOti9xU4czNx6J85YPB0t8pOiJWW0uycKaecWaU0Nrq+zVGesiqUj92FV3HuTKDz8oznHQRHTJqvime6dRE8v+DTluOMRwCh8VXryqNFmUA17vhnSSy8IvgmeDjUaYwFmz9PL5JVgJmpl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380528; c=relaxed/simple;
	bh=5hiwm5m4HgXoKmPMhyVnnwn4Qx2zvIXwgyMsi1FuMRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1K8ycAUfT+80NawoGOFGNxZZAH7m0bADftwaXWVjZ2yI64aFFNutcBZUL8PCwJm5pkK25MLcO3MIJUjsjSt42SF2GOARCAuv81wmS9UNZJq0ho/vgTcjapf9gHlBp8zGzfFkxqYoqar52jWeFtfsOoWgpbFl7gNv0G93F61fcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p7YtOasr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p7YtOasr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 863A31570;
	Mon, 14 Sep 2026 03:08:42 -0700 (PDT)
Received: from [10.57.9.62] (unknown [10.57.9.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4C503F7B4;
	Mon, 14 Sep 2026 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789380526; bh=5hiwm5m4HgXoKmPMhyVnnwn4Qx2zvIXwgyMsi1FuMRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p7YtOasrgrzvHcpLJgx2YE2hzPdur0T3l50iJe5WMCVV6HN64LCoIrs2QrbGPkfaj
	 gO/UBnrKZRvqbrkVraxbPHO0rY9yLWK3F1g0S2gTMUewvEKwVcdwROZDf5zHw6lyzz
	 PibSlr2sEMnHPRN66wmeOGTWXdhkurVM4ONZnCw8=
Message-ID: <04fe6b38-c662-4b87-9544-8df1d8367122@arm.com>
Date: Mon, 14 Sep 2026 12:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
 <20260910221349.19d86f1a@ryzen.lan>
 <CAGb2v67TW_E7S9Mt1RyGJdw8NbV0D0PzM8Sw0Vhx9PzMe6CVwg@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v67TW_E7S9Mt1RyGJdw8NbV0D0PzM8Sw0Vhx9PzMe6CVwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chen-Yu,

On 9/13/26 17:34, Chen-Yu Tsai wrote:
> On Fri, Sep 11, 2026 at 4:14 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> On Thu, 23 Jul 2026 01:26:38 +0800
>> Chen-Yu Tsai <wens@kernel.org> wrote:
>>
>> Hi,
>>
>>> On Wed, Jul 22, 2026 at 6:43 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>>>
>>>> The Allwinner A523 uses the same GPIO voltage "withstand" programming
>>>> (setting the input level voltage thresholds) as the previous SoCs, but
>>>> for some odd reason inverts the encoding of 1.8V vs. 3.3V.
>>>>
>>>> Add a new bias voltage type to note this difference, and select it for
>>>> the A523. At the same time also use the newer "CTL" version, which in
>>>> addition allows to turn off the withstand programming for I/O voltages
>>>> other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
>>>> Ethernet PHYs). The A523 has that enable register, but didn't use it
>>>> so far.
>>>>
>>>> This fixes eMMC and reportedly Ethernet operation on some A523 boards.
>>>>
>>>> Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A523")
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>
>>>
>>> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>>> Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A
>>
>> so what happens to this fix? Is it good to be merged? And who is going
>> to take this? Linus? Or does it go through sunxi?
> 
> Linus needs to take this. It seems you didn't send it to him, nor the
> linux-gpio mailing list?

Ah, good point, thanks for the heads up, for some reason I CC:ed DT 
people, but not pinctrl. My bad, and might explain why this was somehow 
forgotten about.
Sent a v2 with all the tags, thanks to the testers and reviewers!

Cheers,
Andre.

> Can you resend?
> 
>> Cheers,
>> Andre
>>
>>>> ---
>>>>   drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
>>>>   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
>>>>   drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
>>>>   drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
>>>>   4 files changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
>>>> index dfdcfa740ecc9..cffc1e53eef14 100644
>>>> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
>>>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
>>>> @@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>>>>   static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
>>>>          .irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
>>>>          .irq_bank_map = a523_r_irq_bank_map,
>>>> -       .io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>>>> +       .io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>>>>          .pin_base = PL_BASE,
>>>>   };
>>>>
>>>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
>>>> index 801f62abc93df..001bd42afa3ef 100644
>>>> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
>>>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
>>>> @@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>>>>   static struct sunxi_pinctrl_desc a523_pinctrl_data = {
>>>>          .irq_banks = ARRAY_SIZE(a523_irq_bank_map),
>>>>          .irq_bank_map = a523_irq_bank_map,
>>>> -       .io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>>>> +       .io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>>>>   };
>>>>
>>>>   static int a523_pinctrl_probe(struct platform_device *pdev)
>>>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>>>> index cabcb8b6f38e5..634d9f1f23947 100644
>>>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>>>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>>>> @@ -718,6 +718,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
>>>>   {
>>>>          unsigned short bank;
>>>>          unsigned long flags;
>>>> +       bool inverted = false;
>>>>          u32 val, reg;
>>>>          int uV;
>>>>
>>>> @@ -757,6 +758,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
>>>>                  writel(reg | val, pctl->membase +
>>>>                         sunxi_grp_config_reg(pctl, pin));
>>>>                  return 0;
>>>> +       case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
>>>> +               inverted = true;
>>>> +               fallthrough;
>>>>          case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
>>>>                  val = uV > 1800000 && uV <= 2500000 ? BIT(bank) : 0;
>>>>
>>>> @@ -771,6 +775,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
>>>>                  fallthrough;
>>>>          case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
>>>>                  val = uV <= 1800000 ? 1 : 0;
>>>> +               if (inverted)
>>>> +                       val = !val;
>>>>
>>>>                  raw_spin_lock_irqsave(&pctl->lock, flags);
>>>>                  reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
>>>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>>>> index d0936a32123ba..2c8648c3301b6 100644
>>>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>>>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>>>> @@ -128,8 +128,10 @@ enum sunxi_desc_bias_voltage {
>>>>           * Bias voltage is set through PIO_POW_MOD_SEL_REG
>>>>           * and PIO_POW_MOD_CTL_REG register, as seen on
>>>>           * A100 and D1 SoC, for example.
>>>> +        * Some SoCs invert the encoding for 1.8V vs. 3.3V.
>>>>           */
>>>>          BIAS_VOLTAGE_PIO_POW_MODE_CTL,
>>>> +       BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>>>>   };
>>>>
>>>>   struct sunxi_desc_function {
>>>> --
>>>> 2.46.4
>>>>
>>>
>>

