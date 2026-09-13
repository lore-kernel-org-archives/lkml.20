Received: from mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2313F929C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330060; cv=none; b=RYlakDJSQ93SUxhefl1ApR4Cj7ZEIQAy6Kbe9Wu41FmOPCRl5LEaTVlKWKIm6sehLB5z9GPg46+ApM2plBugSibhd2PjFUdBj8oaiH5ydcKCg4QQEB8OWt3WnPfRdLjaUXP6et+7oDCZOPInwsFvde5XyI9MbVqhbWeYwNjNpyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330060; c=relaxed/simple;
	bh=umvGmk2i7FPajTe1ipddW/f9CiWIlzCrAUkGgm4y3OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GK1/iA9kJxEWrkHpOuGUEPF/Q37BBqZcI6amq+UdXTMWdG/f0FUAI+NTStpQIT7JHy9bWynjves0dA+rYxtf3QaaZLuVfjRfC6QI4sUrhx7R8+KfthWR93a05NsCX4SYTuvtWat70nEz9BOPMoMrKhMdoUYurIzNtFndIDK5ICY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N3h2MD5m; arc=none smtp.client-ip=91.218.175.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N3h2MD5m"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=umvGmk2i7FPajTe1ipddW/f9CiWIlzCrAUkGgm4y3OA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789330056; v=1; x=1789934856;
 b=N3h2MD5mxUzD8CvJc0Ezb+YyoZrlcumlNNReOODKtwAQieOCM68PbLQzLxJLljvlsv6cZw1W
 r7rjE2NpVVfxPe3CeK0BAc0eWfaPSlN585Iv6IwZ3L0WDFeHyDOvYfOpJ6JvZZ7AyaRHvG7vEyO
 Ipacuwvj0m7mhK9rEdARrpGQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cdc5a4b19a0571fb;
	Sun, 13 Sep 2026 20:07:36 +0000
X-Mizu-Trace-ID: cdc5a4b19a0571fb
X-Migadu-Flow: FLOW_OUT
Message-ID: <860a28bf-9c69-48da-9fa7-1cdb82761c35@linux.dev>
Date: Sun, 13 Sep 2026 22:05:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] soundwire: amd: fix work drain ordering and
 pm_runtime guard in remove path
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-4-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260910190240.1604447-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 21:00, Vijendar Mukunda wrote:
> amd_sdw_manager_remove() cancelled amd_sdw_work but not
> amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
> schedule_work(&amd_sdw_work), an in-flight irq_thread item can
> re-queue amd_sdw_work after its cancel returns, defeating the
> cancellation.
> 
> Fix by calling amd_disable_sdw_interrupts() first to quiesce the
> hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
> then cancel_work_sync() for amd_sdw_work. The existing
> cancel_work_sync(amd_sdw_work) is also moved to after
> amd_disable_sdw_interrupts() so that any work item queued between the
> old cancel position and the interrupt disable cannot escape draining.
> 
> synchronize_irq() is deliberately not used before the
> cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
> IRQ deliveries can occur. An IRQ handler already in flight may still
> queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
> amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
> This fully quiesces the driver workqueues, making synchronize_irq()
> unnecessary.
> 
> Also guard pm_runtime_disable() so it is only called when runtime PM
> was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
> only at the very end, after several fallible hardware init steps. If
> sdw_amd_startup() fails mid-loop (one manager started, the next fails
> before pm_runtime_enable()), sdw_amd_exit() triggers
> platform_device_unregister() for all managers. Calling
> pm_runtime_disable() on the partially-started manager finds
> disable_depth already at its initial value of 1, silently increments it
> to 2 and returns without a warning, so a later pm_runtime_enable() would
> only bring it back to 1 and leave runtime PM disabled. Use
> pm_runtime_enabled() to skip the call when it was never paired with an
> enable.

The alternative is to do a pm_runtime_enable() in the probe(), and later
a pm_runtime_set_active().

That way if the probe is successful, then the remove() will always deal
a balanced enable.

Maybe only put a single 'fix' per patch?
> Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index a57b59609bfe..bbe1e73ed255 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1172,9 +1172,11 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
>  	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
>  	int ret;
>  
> -	pm_runtime_disable(&pdev->dev);
> -	cancel_work_sync(&amd_manager->amd_sdw_work);
> +	if (pm_runtime_enabled(&pdev->dev))
> +		pm_runtime_disable(&pdev->dev);
>  	amd_disable_sdw_interrupts(amd_manager);
> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
> +	cancel_work_sync(&amd_manager->amd_sdw_work);
>  	sdw_bus_master_delete(&amd_manager->bus);
>  	ret = amd_disable_sdw_manager(amd_manager);
>  	if (ret)

