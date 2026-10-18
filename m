Received: from mta0.migadu.com (out-203.mta0.migadu.com [91.218.175.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61D3D5244
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363487; cv=none; b=e4+8Mv3x/L7VXa53Py+NAaTpCfctvn8ECWNJ0OC63duyVxhQJtOlGxZDm6z0JclKsBOjdQf+t+dYeODg3Tz8wIU44Dljn0EoCNC/xlsnesq4GdME7jIjegkCZh0RcPfkItZo73ylU8u+qzW0mu5VnzPeuaoBlNcynrdiYoPbjDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363487; c=relaxed/simple;
	bh=zWR5OAyWdhXmhQvTQixGFKFnKfWZir2Dn2fJQFSHfXI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ggb6t6Hjsz1TGYjgsieI4KiGxjM3ewJantj7XSBBvyxztObSNCG3jiAd3eNXTn2TcjLkth/krOtUIw8KW0d7JeVvR0wq9QAT931YYkb66yKkaBGUAzt3cw7gIYE8D5/iKcPgj7RimbEzInuk/atMiVQtH6LMIKi1CHcZBWYweVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=AQHcW6GB; arc=none smtp.client-ip=91.218.175.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="AQHcW6GB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zWR5OAyWdhXmhQvTQixGFKFnKfWZir2Dn2fJQFSHfXI=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792363481; v=1; x=1792968281;
 b=AQHcW6GBj/etZQqq+KWhh5fyqPXpAbgNPHRzDTfotoqmQP8EbpDKlkt8uB1o/+nDdMVvJYfx
 aNa5qeVovowbD3fhKRJ0XXJ3AwP9XLNweRM/FpOqxRSqOc61zLENRXILoFo3rfLp99O/M9UtRQ4
 Y95+3oFjHWCE/FaTGfQXArwHWeoP0xj5bKTwmvd7SKRHmD3KehRnWvRofgEqWzdQipwPYihzZq1
 jfZJ2+n74InJDX00ejhSFDgBTFnq/hC8fEmtIwOqhS7ciCO0K18d3Y4XhP4mB4R9DLkDDC75NKw
 VqXT/nnNGsNdHfcZ20wDzvlLZgw6YxNUtmaKDLj1WUWXQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2579d1d25b7eaed8;
	Sun, 18 Oct 2026 22:44:41 +0000
X-Mizu-Trace-ID: 2579d1d25b7eaed8
X-Migadu-Flow: FLOW_OUT
Message-ID: <7d1fd5e4-a35a-4675-8b0c-005e9f022646@packett.cool>
Date: Sun, 18 Oct 2026 19:44:31 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: aw88261: complete the start at trigger
 time
From: Val Packett <val@packett.cool>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srini@kernel.org>, Luca Weiss
 <luca.weiss@fairphone.com>,
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Federico Amedeo Izzo <federico@izzo.pro>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20261016120000.aw88261-trigger-v2-1-tvlad744@gmail.com>
 <58c229e2-ee81-4b75-92e9-1eaee2d19d0b@packett.cool>
Content-Language: en-US
In-Reply-To: <58c229e2-ee81-4b75-92e9-1eaee2d19d0b@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/18/26 4:20 PM, Val Packett wrote:
>
> On 10/17/26 7:00 AM, Vladyslav Tymoshchuk wrote:
>> The amplifier is started from the PRE_PMU event of its AIF widget, that
>> is from DAPM in prepare. aw88261_dev_start() waits up to 20 ms there for
>> the PLL to lock to the bit clock and powers the amplifier down again if
>> it does not.
>>
>> The Qualcomm AudioReach backends only start their graph, and with it
>> the I2S/TDM clocks, in trigger since commit b54a38af7138 ("ASoC: qcom:
>> q6apm-lpass-dai: move graph start to trigger"). There every start fails
>> with "start failure (-1)" and the speaker stays silent for the whole
>> stream, as seen with six AW88261 on a TDM link of SM8750.
>>
>> Split the start at the first step that needs the bit clock, the PLL
>> lock check, whatever the host does:
>>
>>   - PRE_PMU clears power down (PWDN), configures the I2S interface and
>>     the PLL and writes the boost settings of aw88261_reg_force_set().
>>     The amplifier stays powered down (AMPPD) and muted.
>>   - The unmute, called after the trigger of the CPU DAI with
>>     .mute_unmute_on_trigger, does the rest: it checks the PLL lock,
>>     clears AMPPD, checks SYSST, enables the feedback and unmutes. If the
>>     PLL does not lock, "start failure" is logged, the amplifier is left
>>     as PRE_PMU left it and the next trigger start tries again.
>>   - The mute in trigger undoes the unmute (mute, feedback off, AMPPD),
>>     and POST_PMD sets PWDN as before.
>>
>> So only the steps that need the clock run in trigger: 14 register
>> accesses and 1 ms per amplifier for the unmute when the PLL has locked,
>> 12 and 1 ms for the mute. The same steps run there on hosts that have
>> the clock running from prepare. aw88261_reg_force_set() only writes
>> boost settings and now runs before AMPPD is cleared rather than right
>> after.
>>
>> wsa883x and wsa884x split their start the same way, with the
>> configuration in DAPM and GLOBAL_PA_EN in the trigger-time mute. The
>> vendor driver of this amplifier family (aw882xx) also starts the
>> amplifier from .mute_stream, with the same sequence.
>>
>> The register accesses go over I2C and sleep, so they need a nonatomic
>> trigger, which the Qualcomm DPCM links using this codec have. On an
>> atomic PCM, as seen from substream->pcm->nonatomic in .startup, PRE_PMU
>> does the whole start as before and the mute callback does nothing.
>>
>> POST_PMD can also run for an amplifier that was never powered up, as
>> seen when the card is registered, so make "already power off" a debug
>> message.
>>
>> Assisted-by: LLM
>> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
>> ---
>> [..]
>> +/*
>> + * First part of the start, which does not need the bit clock: power 
>> up and
>> + * configure the I2S interface and the PLL. The amplifier stays 
>> powered down
>> + * (AMPPD) and muted.
>> + */
>> +static int aw88261_dev_power_up(struct aw88261 *aw88261)
>> [..]
>> +/*
>> + * Second part of the start, which needs the bit clock as the PLL 
>> locks to
>> + * it: check the lock, enable the amplifier and the feedback, and 
>> unmute.
>> + * On failure the device is left as aw88261_dev_power_up() left it.
>> + */
>> +static int aw88261_dev_enable(struct aw88261 *aw88261)
>> [..]
>> +/* Undo aw88261_dev_enable() */
>> +static void aw88261_dev_disable(struct aw_device *aw_dev)
>> [..]
>> +static int aw88261_dev_start(struct aw88261 *aw88261, bool enable)
>
> "power_up", "start", *and* "enable".. this naming is a mess now.
>
> Would be nicer to make the *names* more descriptive of what's actually 
> being turned on/off.
>
>> [..]
>> --- a/sound/soc/codecs/aw88261.h
>> +++ b/sound/soc/codecs/aw88261.h
>> @@ -564,6 +564,8 @@ enum {
>>   enum {
>>       AW88261_DEV_PW_OFF = 0,
>>       AW88261_DEV_PW_ON,
>> +    /* powered up and configured, amplifier off: waits for the bit 
>> clock */
>> +    AW88261_DEV_PW_READY,
>
> Would make more sense to stick the intermediate state in the, well, 
> middle. And rename the states to something that makes sense like { 
> OFF, WAITING_FOR_BIT_CLOCK, RUNNING } instead of making everything a 
> comment like the slop machine left it.
>
>> [..]
>> base-commit: 0f8bc3b93b76d16682a4d4999f9559b1e18016f9
>
>
> It does work here, anyhow, so
>
> Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai 


Though after this last reboot now, it's weirdly stuck when on the 
speaker profile, changing the volume did not play the "boop" sounds.. 
(nothing appearing in dmesg).. until I switched to the earpiece profile, 
when a big bunch of those played in a row!

Not guaranteed that this is related to these driver changes, but 
suspicious..


> Thanks,
> ~val
>
