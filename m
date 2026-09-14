Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211ED37F72E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410556; cv=none; b=FfbgsMc88FvBEvICONVXeNMzpjKrPlgUOxlo/cPe683sNoSfr3LMWhRc3iHd3l+cZqd+gDBRaZNZW9XfPLAk6DzPz3lE5aryyGBcxGtC7yC+0GpMenBIwOc8tpBy/QZvDCsE67xmD7aiZDTs0fhCvpgg5YCKaYtcnI6miIt4pEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410556; c=relaxed/simple;
	bh=7/sIrvEWn39u77dnOkwjRM5cwchngQ5qOWcv4z5CNe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=po1O2PHBRKFWUqD14U2nq7C40pWVeLko7MPWobhyfPbR+WfNJuc7X+Oc7bGWlqcbAJsHnoUhUiBgIJWvgF+6tDStY8uG75d93tUux+mc/vxhQIq1HyLGiqmKg9AHlqgN0pYx/TLBtp8PbVdILrwiWdn775R4681l7TA95S69RW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HALt7N0c; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HALt7N0c"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7/sIrvEWn39u77dnOkwjRM5cwchngQ5qOWcv4z5CNe0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789410548; v=1; x=1790015348;
 b=HALt7N0cOxMnNaUow9IIH4OTA9XZK5nHjBI26EWot4SxX/FiokO0Vp6n7rUjQJwqpXAndp9/
 sLQYEnUTgS2agFYD15teXBYrELTAYWp3d6lJALmYzj3ggqNheIZF61FStfhR1ZfeYW6cp0J4mRi
 8rmAr9Bq8cyu83YeE6nt3FBI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 46738f0eef395c07;
	Mon, 14 Sep 2026 18:29:08 +0000
X-Mizu-Trace-ID: 46738f0eef395c07
X-Migadu-Flow: FLOW_OUT
Message-ID: <029a18c3-f6f5-4971-8ee2-25a98dec416c@linux.dev>
Date: Mon, 14 Sep 2026 19:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] soundwire: amd: fix work drain ordering and
 pm_runtime guard in remove path
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-4-Vijendar.Mukunda@amd.com>
 <860a28bf-9c69-48da-9fa7-1cdb82761c35@linux.dev>
 <3abf2784-49ff-459c-9022-acd88bd767b4@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <3abf2784-49ff-459c-9022-acd88bd767b4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 08:07, Mukunda,Vijendar wrote:
> 
> 
> On 9/14/26 01:35, Pierre-Louis Bossart wrote:
>> On 9/10/26 21:00, Vijendar Mukunda wrote:
>>> amd_sdw_manager_remove() cancelled amd_sdw_work but not
>>> amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
>>> schedule_work(&amd_sdw_work), an in-flight irq_thread item can
>>> re-queue amd_sdw_work after its cancel returns, defeating the
>>> cancellation.
>>>
>>> Fix by calling amd_disable_sdw_interrupts() first to quiesce the
>>> hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
>>> then cancel_work_sync() for amd_sdw_work. The existing
>>> cancel_work_sync(amd_sdw_work) is also moved to after
>>> amd_disable_sdw_interrupts() so that any work item queued between the
>>> old cancel position and the interrupt disable cannot escape draining.
>>>
>>> synchronize_irq() is deliberately not used before the
>>> cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
>>> IRQ deliveries can occur. An IRQ handler already in flight may still
>>> queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
>>> amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
>>> This fully quiesces the driver workqueues, making synchronize_irq()
>>> unnecessary.
>>>
>>> Also guard pm_runtime_disable() so it is only called when runtime PM
>>> was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
>>> only at the very end, after several fallible hardware init steps. If
>>> sdw_amd_startup() fails mid-loop (one manager started, the next fails
>>> before pm_runtime_enable()), sdw_amd_exit() triggers
>>> platform_device_unregister() for all managers. Calling
>>> pm_runtime_disable() on the partially-started manager finds
>>> disable_depth already at its initial value of 1, silently increments it
>>> to 2 and returns without a warning, so a later pm_runtime_enable() would
>>> only bring it back to 1 and leave runtime PM disabled. Use
>>> pm_runtime_enabled() to skip the call when it was never paired with an
>>> enable.
>> The alternative is to do a pm_runtime_enable() in the probe(), and later
>> a pm_runtime_set_active().
>>
>> That way if the probe is successful, then the remove() will always deal
>> a balanced enable.
>>
>> Maybe only put a single 'fix' per patch?
> Thanks for the comments. I agree that it is preferable to keep each patch
> focused, but in this case both changes are part of the same remove-path
> cleanup bug and are tightly coupled.
> 
> I do not think moving pm_runtime_enable() to probe() is the right fix
> here. In this driver, runtime PM is intentionally enabled only at the end
> of amd_sdw_manager_start(), after the fallible hardware bring-up sequence.
> If one instance succeeds and the next fails before pm_runtime_enable(), the
> remove path can still run for the partially started instance. In that
> scenario, an unconditional pm_runtime_disable() is incorrect because there
> was no matching enable for that instance.

My take on error handling is to avoid partially functional setups. Keep
things simple, fail big and fail early. Well-intended concealment
schemes will introduce more problems, e.g. if the link for the right amp
fails the left one might work, but users will complain about left-only
sounds...

That said, I am not going to lay on the tracks if this is the design you
want for your IP.
