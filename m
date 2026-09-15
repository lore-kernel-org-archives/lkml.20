Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A53B47E0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474928; cv=none; b=qbjxC3ZlByTiHDc8ktXakVb5C1ZQX/TwSHFDM53bOL62/4kbdSEggdMfY7i1SsCBI29pHHvJCs0WZJFotEOSRGQGffmNN3vLV9WExjSr1MwesYnxeqCq+anQs034EPT4iviXO8nxVLUNPdnYVSXCFkZPu0/bWX2e8jEc/ITLSmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474928; c=relaxed/simple;
	bh=8jLB9CAeAb0g4/yzsEq/6xK7tGdUPDNgXdhRVSOiY9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUB5UP+Ulm3RD/TM/exZ6EOUV5XnVDbPVXBv/cX5yB2Rh37SGFv34tu/DZswaAAUaGtQvshDgywpuZkDB5fv+i4V/coUMrXsIuYxFlQelO4nDk05J5glEUzpkKiE6HpUEh/aYHw8Z+WBqAUN6NgZpt9wCvGOyjnJPqXN19ogTe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rC1lA+Zn; arc=none smtp.client-ip=91.218.175.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rC1lA+Zn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8jLB9CAeAb0g4/yzsEq/6xK7tGdUPDNgXdhRVSOiY9o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789474923; v=1; x=1790079723;
 b=rC1lA+ZnAmVlC4pd2V2xg3yuSowI0OSleGTCIj/UIJfXeZm6lwyUKT1hl/twOtcivsZvXdOr
 uIAH24PttzvA8AfkvCfobCL3w3Nj6TxDgpbAAmYR0n6FgJQ9OW0Ung9DCKmycgJ2HHuyh9sws8p
 13b6mElcC23PoQJ7dKilCS8s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2cdac61b0a829b24;
	Tue, 15 Sep 2026 12:22:03 +0000
X-Mizu-Trace-ID: 2cdac61b0a829b24
X-Migadu-Flow: FLOW_OUT
Message-ID: <071e3833-48af-4ca4-8eda-c6c825580def@linux.dev>
Date: Tue, 15 Sep 2026 14:22:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
 <20260911161903.419814-3-ckeepax@opensource.cirrus.com>
 <8b54604a-ec75-4c84-9909-358510f6f3ba@linux.dev>
 <aqkMOFfQo2YRYt2C@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aqkMOFfQo2YRYt2C@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> It would appear the reason for the disabling of the IRQs is that
>>> the IRQ handler iterates through a linked list of all the links,
>>> once a link is removed the memory pointed at by this linked list
>>> is freed, but not removed from the linked_list. 
>>
>> That wasn't the reason, even if you have a single link we all thought it
>> made more sense to disable peripheral interrupts on the host before
>> calling sdw_bus_master_delete()
> 
> What was the reason for deciding to do that, that is not in itself
> a reason? A drivers remove callback should be able to access
> registers on the device. The host here requires interrupts to
> do so. This was the only functional reason in the code I could
> find that things were done in this order.

like I said it was thought to be simpler this way, we never thought
about the need to do anything in remove().
IOW this is a missed requirement that led to a simple solution, not a
deliberate decision to cripple the remove() step.

>>> --- a/drivers/soundwire/intel_auxdevice.c
>>> +++ b/drivers/soundwire/intel_auxdevice.c
>>> @@ -508,9 +508,12 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
>>>  	if (!bus->prop.hw_disabled) {
>>>  		sdw_intel_debugfs_exit(sdw);
>>>  		cancel_delayed_work_sync(&cdns->attach_dwork);
>>> -		sdw_cdns_enable_interrupt(cdns, false);
>>>  	}
>>> +
>>>  	sdw_bus_master_delete(bus);
>>> +
>>> +	if (!bus->prop.hw_disabled)
>>> +		sdw_cdns_enable_interrupt(cdns, false);
>>>  }
>>
>> Sorry, that sequence looks really weird to me.
>>
>> See the code in
>>
>> void sdw_bus_master_delete(struct sdw_bus *bus)
>> {
>> 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
>>
>> 	sdw_irq_delete(bus);
>>
>> 	sdw_master_device_del(bus);
>>
>> After doing all this, one would mask the interrupts on the host side with
>>
>> 	if (!bus->prop.hw_disabled)
>> 		sdw_cdns_enable_interrupt(cdns, false);
>>
>> but that host is long gone.
>>
>> Does this even work?
>>
>> The last sdw_cdns_enable_interrupt(cdns, false) looks either very racy
>> or useless, no?
> 
> I mean it definitely works and fixes the problems on driver
> remove. I will check to see if the call is redundant at this
> stage, or if there are any potential dangers I am missing.

ok

>>> diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
>>> index 9710f2dc04e29..7495d35ed2fc3 100644
>>> --- a/include/linux/soundwire/sdw_intel.h
>>> +++ b/include/linux/soundwire/sdw_intel.h
>>> @@ -307,6 +307,7 @@ struct sdw_intel_ctx {
>>>  	acpi_handle handle;
>>>  	struct sdw_intel_link_dev **ldev;
>>>  	struct list_head link_list;
>>> +	struct mutex link_lock; /* lock protecting link_list */
>>>  	struct mutex shim_lock; /* lock for access to shared SHIM registers */
>>
>> IIRC shim_lock was used to prevent access to common registers shared
>> between links. How many locks do we need?
> 
> I mean we could reuse the lock but in my experience locks having
> a clearly defined purpose is less error prone, than having catch
> all locks. The shim lock claims to protect the SHIM registers,
> this one protects the list of links. But if you feel strongly I
> am happy to try reuse the shim lock for this?

I am not asking for you to share, just that we need to have a discussion
on whether this new lock is redundant or not, and wording that describes
why using existing locks isn't desired/needed.

this shim_lock is a protection for very low-level access to registers,
and completely tied to the way the IP registers were clustered together,
it's indeed a different conceptual level you're after. So even if there
is some redundancy or overlap, it's probably simpler to use a different
lock for different things,

> Ultimately, I am not super attached to this way of solving the
> problem but we do need to come up with some solution to allow
> drivers to access their device in driver remove. This causes
> devices to take 1-2 minutes to remove the driver and fills the log
> with loads of error messages. I am more than happy to entertain
> other ways of making that happen if you have ideas you prefer?

I don't have any objections with the requirement to let the codec do
whatever it needs on remove(), this was a miss in the design and it
needs to be addressed.
I am just nervous about the interrupt part and possible race conditions.
Maybe the last stage of the remove() should be to mask all interrupts on
the codec side with a common helper shared by all codec drivers?

BTW we did have scripts to remove/insert in loops to try and find
issues, not sure if you're aware of them and if they still work, see:

https://github.com/thesofproject/sof-test/blob/main/tools/kmod/

