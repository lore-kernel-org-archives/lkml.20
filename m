Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C7947AF69
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910743; cv=none; b=Hh4KtIIhQc5wbiQkC8sMb8agOR+Kwaq11rNC1WEjdQVm/Ym06pBpMaXu7B/LCVdxjQEHpmOSuJZiL+NhnXywOKMnQgaGNbBEyig3o7i1mTl3NuL+gcoL/PB8f4TIbRuX9AO8kA2t8KW7k4AtF/bd5ug+tfhaXZiJhE5xECqVzIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910743; c=relaxed/simple;
	bh=0JuHyGtucJF7J9mRhufnkU+88GP5uhF9yvKU27FqKs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVZZNIHJeWL0uR80DHUNozJkmc/lgeu1ru6IDu2cFZrmPff4x3cVsyr7Ln8MKdmK0efM4DRrwy450THjPDXFTA1whXWqQO3K8xpdjMb1KA9XeDROG8c+sPI1GM3ec+J7RO6cCHd790y5vV83bbBldxCQlOSo9SmGxUR/xko3XF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FCx2+XwB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FCx2+XwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791910740;
	bh=0JuHyGtucJF7J9mRhufnkU+88GP5uhF9yvKU27FqKs8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FCx2+XwBELik0r+RNoxSIFBIkx7ohE/ZAy5J8mrZ+mxhFSZ6jTCy/smD+24zb4XlU
	 hTup/KmIT+2qyVBUFLWDHoxLcr/0JXP9xm+uwv1TBBojGS2dUXx2mWR0lZuYoy0Rkj
	 uoq0yuQDHesUxT3iKtakO6KHtjJfe3uH/Xlt50UNyoC5d5IPFHKQMTHKv4DvWYM+cX
	 HbAfQVlwRz9su+5ODPAHW5R9lNrcduxXWZOB5I0upXHXwASdo+bVIX9mJMLgLKB097
	 r3PHBqQ8ujQfphZzXlLim4HCwvo+/EF967HH6GhIYzIg84t3SXT50M1jwMXS3/1swJ
	 97WZqCCOu9VzA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EED5C17E0099;
	Tue, 13 Oct 2026 18:58:59 +0200 (CEST)
Message-ID: <86109ed5-2c0b-4b1a-8c48-1102bd043fad@collabora.com>
Date: Tue, 13 Oct 2026 19:58:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] drm/vc4: hdmi: Bump BCM2835 max pixel clock to 165
 MHz
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261013-vc4-common-scramb-v2-0-a41d15e131ad@collabora.com>
 <20261013-vc4-common-scramb-v2-2-a41d15e131ad@collabora.com>
 <682b6dc0-0b9f-4b2c-afd5-459e3f669130@collabora.com>
 <CAPY8ntBFT_R1HbzzCvdvJ01SV8db0Cz7HcuRE7HaoyJ3-1FATQ@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPY8ntBFT_R1HbzzCvdvJ01SV8db0Cz7HcuRE7HaoyJ3-1FATQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dave,

On 10/13/26 6:59 PM, Dave Stevenson wrote:
> Hi Cristian
> 
> On Tue, 13 Oct 2026 at 01:16, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> Hi Dave,
>>
>> On 10/13/26 1:37 AM, Cristian Ciocaltea wrote:
>>> Historically, the HSM clock for BCM2835 was fixed at 163.7 MHz.  Since
>>> the pixel clock had to be at least 1% below the HSM clock, it was capped
>>> at 162 MHz.
>>>
>>> Since commit cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate
>>> depending on pixel rate"), the HSM clock rate is set to pixel clock *
>>> 101 / 100.  For a 165 MHz pixel clock, this gives an HSM rate of 166.65
>>> MHz, which, per Dave Stevenson, the hardware can handle without issues.
>>>
>>> Increase the max pixel clock to 165 MHz, which matches the maximum TMDS
>>> character rate of HDMI 1.0 through 1.2.
>>
>> It seems this will cause CEC register corruption:
>>
>> https://sashiko.dev/#/patchset/20261013-vc4-common-scramb-v2-0-a41d15e131ad@collabora.com?part=2
>>
>> We can easily address this by clamping the CEC clock divider to its register
>> field width:
>>
>> -       clk_cnt = cec_rate / CEC_CLOCK_FREQ;
>> +       clk_cnt = min_t(unsigned long, cec_rate / CEC_CLOCK_FREQ,
>> +                       VC4_HDMI_CEC_DIV_CLK_CNT_MASK >>
>> +                       VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
>>
>> The consequence is that the CEC clock would run slightly faster than the nominal
>> 40 kHz, i.e. (165000 × 101/100) / (2^12 - 1) = 40.6959 kHz.
>>
>> I think this is still within the CEC bit-timing tolerances and shouldn't cause
>> any issues.  Could you please confirm?
> 
> My reading of the CEC spec agrees.
> 
> All the timings have tolerance of +/- 0.2ms on values up to 4.5ms, so
> that would allow up to a 4.3% tolerance on frequency.
> The error from clipping the clock divider is 1.74%, so fairly
> comfortably within tolerance.
> 
> It's only video modes with clocks in the range 162-165MHz that will
> have any inaccuracy, so pretty limited in scope anyway.

Yep, the clamp would trigger only for pixel clocks above 162.178 MHz.

> Working backwards, achieving a 40kHz output with the max divider works
> out to be a 163.8MHz HSM clock, so that would appear to be why the
> limit was introduced in the first place.

Quite possible, indeed.

So I'll prepare v3, which adds yet another prerequisite patch to clamp the CEC
clock divider.

Thanks,
Cristian
