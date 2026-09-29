Received: from mta0.migadu.com (out-239.mta0.migadu.com [91.218.175.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A946D21A42D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670876; cv=none; b=rMJ1RfMw1G16nucEjgIu4FOV4vSsJYeV0yRyMM9VYzMBFOCaz0tbYcBuw2DlFOM7dXiWf3bqA9vTXdd4Zp1emSSzuLztBpHnEWFOdGgQymPzLxi6pfD1LN/smLJeD5K5WYG9/lUGQmhBKGFijlHgdud14ZxXzeNmaA1HcxCg4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670876; c=relaxed/simple;
	bh=3pHXDM+z38dWey2hjyXucmd7Mo8iqM8NY08hRkJBOtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMOmYCAoQCweWBaSr7EXPN8ZqGuRJQ8zK2EEL4if02Xxnfa5TMkLrJAxtWSPvoEAsIa0slTi4bFmdNGdz7V6auOyH2UjZjMy9+guUrVcbhJluXXx6niqudPpT1X8M8o/h4qKpG+cnONypzIim03bwhY4VKAiAGVOUk5hENFNw8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MjkQcsup; arc=none smtp.client-ip=91.218.175.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MjkQcsup"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3pHXDM+z38dWey2hjyXucmd7Mo8iqM8NY08hRkJBOtM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790670872; v=1; x=1791275672;
 b=MjkQcsupGq6A2X9affmCi2sdooMeA8WiGfrD5woM3gDlvFtlYJLRK5Fu5lPY73GP10SeWO9U
 VPUaaNbx5B/N2CapWcjwhd2wUiMja2INQdXF33nGrE5uPSdQqBh8X0vQhQ6uonYb4nrWnxKexlp
 FvEP+g1pjZ9mKB7qa8oAUTjg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dcacd1af2af8d5bc;
	Tue, 29 Sep 2026 08:34:22 +0000
X-Mizu-Trace-ID: dcacd1af2af8d5bc
X-Migadu-Flow: FLOW_OUT
Message-ID: <db7d1d3a-1be3-466d-9f95-2dabe918e57e@linux.dev>
Date: Tue, 29 Sep 2026 10:34:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <2c4ea801-f048-405d-a163-e65691e93fc7@linux.dev>
 <aronxfoVEKfBm9Zb@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aronxfoVEKfBm9Zb@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 10:39, Charles Keepax wrote:
> On Sat, Sep 26, 2026 at 05:55:06PM +0200, Pierre-Louis Bossart wrote:
>>
>>> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
>>> index 901a71262094f..1439cef43462d 100644
>>> --- a/drivers/soundwire/intel_auxdevice.c
>>> +++ b/drivers/soundwire/intel_auxdevice.c
>>> @@ -508,8 +508,13 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
>>>  	if (!bus->prop.hw_disabled) {
>>>  		sdw_intel_debugfs_exit(sdw);
>>>  		cancel_delayed_work_sync(&cdns->attach_dwork);
>>> -		sdw_cdns_enable_interrupt(cdns, false);
>>>  	}
>>> +
>>> +	sdw_bus_slaves_delete(bus);
>>> +
>>> +	if (!bus->prop.hw_disabled)
>>> +		sdw_cdns_enable_interrupt(cdns, false);
>>> +
>>>  	sdw_bus_master_delete(bus);
>>>  }
>>
>> sorry, not following - this sequence seems to rely on *two* calls to
>> sdw_bus_slaves_delete(), is this intentional or I am missing something?
>>
>>
>>  void sdw_bus_master_delete(struct sdw_bus *bus)
>>  {
>> -	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
>> +	sdw_bus_slaves_delete(bus); <<< this would be the second call?
>> +	sdw_bus_slaves_put(bus);
> 
> Yeah seemed the simplest way to not have to change any existing
> drivers, the second call is a complete no-op if the first was
> done.
humm, that seems to work but I get this layering violation after-taste,
and I wonder if this works for AMD?

AMD use a platform device instead of an auxiliary one, but overall this
looks like the same problem of disabling interrupts before the
peripheral driver is removed, no?

static void amd_sdw_manager_remove(struct platform_device *pdev)
{
	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
	int ret;

	pm_runtime_disable(&pdev->dev);
	cancel_work_sync(&amd_manager->amd_sdw_work);
	amd_disable_sdw_interrupts(amd_manager); <<< SAME PROBLEM ??
	sdw_bus_master_delete(&amd_manager->bus);

If this is indeed the same problem then the AMD driver should use the
same solution...
