Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1017C4CDA3E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391179; cv=none; b=f15qvBamPvUhciCXhpStQyfFvk00xN6mumDiRsJDfffAiv+cdzW0mzWD0lnJB7xiEDg/P9CGKUWwIOAehlHoqVZRruVk5V4G40+Tq30oFD6qLdT4dgN4fogMfUwBSjL2vy8fQ3B1KHbrHMsWdNs7rRwLkBH3FJZf0LiZOWE4HA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391179; c=relaxed/simple;
	bh=YfYHbPshNF22vRBtJCgXQrl41GLL7Ua8eOIdr5Gqej8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SumuAx+KUjPZBfilgy9MH/HPfz34giZr2jc2otZLSbKm28smkJL5dAfI0tit78IWgH5cvAIrYs7I7O93Z+Xxq8VvqBtCeEQvNWjKecwW5Fl3KHPTMkAspO2CThQhLQXhT6Sa4hH1VZLFCCiHCCGNt39Hx0hY6UhTkjF0mO60ods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h/UDUzI/; arc=none smtp.client-ip=95.215.58.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h/UDUzI/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YfYHbPshNF22vRBtJCgXQrl41GLL7Ua8eOIdr5Gqej8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791391176; v=1; x=1791995976;
 b=h/UDUzI/49q+HLauPwFy45wm218YnF6UhaooxYBJJ2XDmkYUsOe7y61saE3ooxVK+2Rj0vtX
 YUd1/cD9s8l97lHTn6aT6ZohR5FsAjsx0wtWp4OOTTH+Nk1ldu8AKKEBgXwvAlq/+mFj7bG0fQ2
 fjDdD846/skcWr4K6K3ZZJuA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bc8cee966bfacb3a;
	Wed, 07 Oct 2026 16:39:35 +0000
X-Mizu-Trace-ID: bc8cee966bfacb3a
X-Migadu-Flow: FLOW_OUT
Message-ID: <3b718d6e-462e-4d22-b42b-915cd88bd60f@linux.dev>
Date: Wed, 7 Oct 2026 18:37:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
To: "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <528a9777-1587-4dfc-a366-000fc0867d4b@linux.dev>
 <SJ2PR11MB8424E1911A4CA6F9414A07DAFFB92@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <SJ2PR11MB8424E1FAF2D8D1EAD84C3B92FF942@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <SJ2PR11MB8424E1FAF2D8D1EAD84C3B92FF942@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sorry Bard I missed your earlier answer.


>>> On 9/15/26 15:13, Bard Liao wrote:
>>>> ACPI may report a ghost SoundWire peripheral. It will cause unexpected
>>>> error like duplicated links, codec driver can't probe, etc. This series
>>>> check the presence of SoundWire peripherals and skip the non-existing
>>>> peripherals.
>>>
>>> I am afraid this raises quite a few opens, such as the 'mockup' support
>>> and delayed enumeration.
>>
>> The mockup support will not change. We will only check the existance if
>> no mach item matched. And we can always add the mochup configurations to
>> the mach table.
>> And indeed, it will add a little delay in some cases. However, based on
>> our test, only about 1 ms delay will be added.
>>
>>>
>>> A better way to only deal with actual codecs would be to only probe
>>> codec drivers when the codecs report as ATTACHED and get enumerated,
>>> instead of during the ACPI parsing stage.
>>
>> But this doesn't solve our issue. The DAI link will still be created
>> and the sound card will not probe because the codec driver doesn't probe.
>> Our target is that the ghost device should not be added in the DAI link.
>> So that the sound card can probe properly.

I don't see how the DAI link would be created if there's no device
registered for the ghost device?
I guess we're talking about separate layers...

>>> This is a solution that was discussed a ong time ago, probably circa
>>> 2016, during one of the LPC miniconferences, and the direction from
>>> maintainers was that the probe could be used to enable resources (power,
>>> gpio, clocks) that might be required for the hardware codec to become
>>> functional and report as ATTACHED. That's the reason why the probe is
>>> done on all codecs exposed in ACPI, even 'ghost' ones, with an
>>> update_status() callback to the codec driver when the presence of that
>>> codec is detected on the bus.
>>>
>>> In practice I am not aware of any codec drivers doing anything with
>>> power/gpio/clocks in the probe stages, at least for ACPI platforms, so
>>> it may be a good time to revisit this direction. SDCA class drivers do
>>> exactly what I described, the subdevices are registered only upon
>>> enumeration, not during ACPI parsing. It's a much simpler design with a
>>> lot fewer potential races.
>>>
>>> Problems:
>>> - this would be a very invasive change to sdw_slave_add(), with the
>>> device_register() skipped and moved to the enumeration stage. It'd have
>>> to be opt-in and used only a newer platforms to avoid breaking the
>>> 'legacy' devices.
>>
>> I didn't change sdw_slave_add(). All the change in SoundWire driver is to
>> add a flag and a completion to share the information of whether the
>> enumeration of the bus is completed.

I still think this option would be best, that way you'd only deal with
devices that report as ATTACHED, without needing any additional
wait_for_completion.

> Do you still have any concerns about this series?
> Or maybe I can add a module parameter to disable the feature?

The main objection I have is this piece of code:

if (ret == -ENODATA) { /* end of device id reads */
 			dev_dbg(bus->dev, "No more devices to enumerate\n");
 			ret = 0;
+			complete_all(&bus->enumeration_complete);
 			break;
 		}

This assumes that ALL peripherals report as ATTACHED at the same time.
If for some reason a peripheral attaches later, then the entire logic
would be broken - or you will have to add a large-enough wait time
before trying to enumerate devices. That's different to the timeout for
the wait_for_completion, what I am referring to is a delay to let all
devices show-up as ATTACHED after the bus start.
>>> - there is still *nothing* that would tell you that all codec hardware
>>> on a given platform completed the enumeration. You could have a fixed
>>> delay but this would need to be large enough to cover all cases and that
>>> could make the platform boot slower than the current solution - not ideal.
>>
>> Yeah, I set a 3 sec timeout. I believe that is large enough. And the flag
>> and the completion is to avoid the meaningless waiting. With the
>> is_present flag, we can ensure a bus will not be waiting for more than 1
>> time. And with the enumeration_complete completion, we won't wait for the
>> ghost device to be enumerated.
>>
>>>
>>> Another option would be to parse the ACPI0018 device, which describes
>>> audio endpoints and makes references to codecs, which could be used to
>>> filter out 'ghost' codecs that don't provide any endpoints. The spec for
>>> this ACPI0018 is not public but could be reverse-engineered from Windows
>>> platforms. The main benefit is that this filtering could be done in the
>>> ACPI parsing stages and not change anything in the probe and startup
>>> sequences.
>>
>> Is ACPI0018 reliable? Will it still list the ghost device? The ghost rt722
>> has all endpoints listed in its DisCo table

If indeed that's correct, then the use of ACPI0018 would only make sense
if the probe happens only on attachment, not when detecting the ACPI ID
as we currently do.
