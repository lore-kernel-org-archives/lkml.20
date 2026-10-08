Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B94395ACE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479355; cv=none; b=m0SkdxOeSRP42Z+t9Gswn2xnJaAx0LDj5yUFYzvbt5WT77r9sDbd5ZTNqAAekNO0nzXVxMutrfviAptiwaRAjMDhn/qX4PxkCgLONSFz+SXZl7ZjKQnwdkU6U1T0PkEyMGR2ckBKvIk0oSlJJUT1fdUUF4nh4aKegh+yMXSI2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479355; c=relaxed/simple;
	bh=1oloFMjQ06T1FjKj8lEY+zHJKqnYyF8gfW4tAfD5QFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJRDOHNESrooiDeispXfZ0unxYc1lgVUxmKaE8Q+kCGJsgnUJ5Vh0IaNpfS8fWplgZO7dnJaeLGdcmNltpmOBp4CvkG1oLviAfpaS+rZqhACG1uNzsK8hgyyQQ9XdQ+VAaUxcfxa/rBqhTbhGiOzaUzeWqVC7URQpJ9tDGXu6LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VRKgn3Sk; arc=none smtp.client-ip=91.218.175.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VRKgn3Sk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1oloFMjQ06T1FjKj8lEY+zHJKqnYyF8gfW4tAfD5QFo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791479350; v=1; x=1792084150;
 b=VRKgn3SkDNFFAE8xbnrtqAfAXnfNozdrOvokRBcUUEs2kRFa3nnbFq9dMGiaqOvMpL4I/B4z
 H5VrXE9uQUupVG7FMHSgCNe3YCxZpUmaabpVslEHMriXHX9V3V/+Vi3iNMNSmEtfe2/Oc5Zk1AI
 EOSEbsQFnJT09XTxZPYhvqs0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f262cf85d91e4159;
	Thu, 08 Oct 2026 17:09:10 +0000
X-Mizu-Trace-ID: f262cf85d91e4159
X-Migadu-Flow: FLOW_OUT
Message-ID: <175ea8c2-2375-4b1c-a2d0-dcc7998c9e76@linux.dev>
Date: Thu, 8 Oct 2026 19:09:05 +0200
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
 <3b718d6e-462e-4d22-b42b-915cd88bd60f@linux.dev>
 <SJ2PR11MB8424C255FBA45B9F4CA02113FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <SJ2PR11MB8424C255FBA45B9F4CA02113FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>>>> A better way to only deal with actual codecs would be to only probe
>>>>> codec drivers when the codecs report as ATTACHED and get enumerated,
>>>>> instead of during the ACPI parsing stage.
>>>>
>>>> But this doesn't solve our issue. The DAI link will still be created
>>>> and the sound card will not probe because the codec driver doesn't probe.
>>>> Our target is that the ghost device should not be added in the DAI link.
>>>> So that the sound card can probe properly.
>>
>> I don't see how the DAI link would be created if there's no device
>> registered for the ghost device?
>> I guess we're talking about separate layers...
> 
> Sorry, I sould say the DAI link will be "registered".
> With commit ("ASoC: SOF: Intel: use sof_sdw as default SDW machine driver")
> We will create a mach table with the peripherals reported by ACPI if no
> matched item found from pdata->desc->alt_machines. And the machine driver
> will register the DAI links with all the reported peripherals. For example,
> a DAI link with rt711 will be registered even if it is physically
> non-existent.

ah ok, sorry I missed the point. Your commit message threw me off with
the statements "It will cause unexpected error like duplicated links,
codec driver can't probe, etc." The problem is really that the wrong
machine table entry is selected which leads to problems at the card
creation level.

>>>>> This is a solution that was discussed a ong time ago, probably circa
>>>>> 2016, during one of the LPC miniconferences, and the direction from
>>>>> maintainers was that the probe could be used to enable resources (power,
>>>>> gpio, clocks) that might be required for the hardware codec to become
>>>>> functional and report as ATTACHED. That's the reason why the probe is
>>>>> done on all codecs exposed in ACPI, even 'ghost' ones, with an
>>>>> update_status() callback to the codec driver when the presence of that
>>>>> codec is detected on the bus.
>>>>>
>>>>> In practice I am not aware of any codec drivers doing anything with
>>>>> power/gpio/clocks in the probe stages, at least for ACPI platforms, so
>>>>> it may be a good time to revisit this direction. SDCA class drivers do
>>>>> exactly what I described, the subdevices are registered only upon
>>>>> enumeration, not during ACPI parsing. It's a much simpler design with a
>>>>> lot fewer potential races.
>>>>>
>>>>> Problems:
>>>>> - this would be a very invasive change to sdw_slave_add(), with the
>>>>> device_register() skipped and moved to the enumeration stage. It'd have
>>>>> to be opt-in and used only a newer platforms to avoid breaking the
>>>>> 'legacy' devices.
>>>>
>>>> I didn't change sdw_slave_add(). All the change in SoundWire driver is to
>>>> add a flag and a completion to share the information of whether the
>>>> enumeration of the bus is completed.
>>
>> I still think this option would be best, that way you'd only deal with
>> devices that report as ATTACHED, without needing any additional
>> wait_for_completion.
> 
> With this option, the codec driver will not probe and lead to the sound
> card doesn't probe. My goal is that the machine driver will only register
> the DAI links with the peripherals that are physically existent. So that
> the sound card will probe and audio will work. This is also beneficial to
> the case that a peripheral is broken. The other endpoints will still work
> in that case.

Right, in the case where the machine is already selected and *expects* a
device to report as attached, it doesn't matter if the codec driver
probes only on attachment.

>>> Do you still have any concerns about this series?
>>> Or maybe I can add a module parameter to disable the feature?
>>
>> The main objection I have is this piece of code:
>>
>> if (ret == -ENODATA) { /* end of device id reads */
>>  			dev_dbg(bus->dev, "No more devices to
>> enumerate\n");
>>  			ret = 0;
>> +			complete_all(&bus->enumeration_complete);
>>  			break;
>>  		}
>>
>> This assumes that ALL peripherals report as ATTACHED at the same time.
>> If for some reason a peripheral attaches later, then the entire logic
>> would be broken - or you will have to add a large-enough wait time
>> before trying to enumerate devices. That's different to the timeout for
>> the wait_for_completion, what I am referring to is a delay to let all
>> devices show-up as ATTACHED after the bus start.
> 
> Not exactly the same time, but when the bus starts and do the enumeration
> process, aren't all peripherals enumerated at that time? In other words,
> doesn't it mean all existing peripherals are enumerated when there is no
> peripheral with device numver 0?
> If for some reason a peripheral will not show up at the first bus start,
> we can add a quirk to skip the peripheral and assume it is always existent.

Well, you've got two problems here.

a) there's a difference between generations. Starting with ACE2.0, the
SoundWire bus is started much earlier than in previous generations,
where the SoundWire bus was started after firmware download.

In other words, the timing to sync and report as attached differs by
orders of magnitude. I am worried that this code might break stuff on
older platforms.

b) there's nothing in the MIPI spec that says how much time a device
should take to report as ATTACHED. A well-intended implementation
following Recommendation {2121} would e.g. try to find the sync word
with a default frame shape of 48x2, which isn't used at all by Intel.

If you want to keep the code above, you absolutely need to record the
time at which the bus started and wait TBD ms before signaling
enumeration_complete(). You would also need to deal with a case where
another device shows up with a delay, would you throw another
complete_all() then?


