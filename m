Received: from mta1.migadu.com (out-82.mta1.migadu.com [95.215.58.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CD43CF20A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342972; cv=none; b=V7mtaVWJFnUqaKfacdnqUBN+TEUqV7qHvWOF7IqnFHW8143JoUx/U6RAA9KflmOXR5vZ5koYuZahmKZMJmtChTwrgDWoJbHoTggFG9aMuUXKWOHgeE7DGvxQVnNPPcmc39cOdiK3UiqKP/Dvc8vjE7g3z56pi1kD/EsMm+kXgzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342972; c=relaxed/simple;
	bh=8IZnVa7zv8xOQQ+fqCNPj/KOkLdz2r59exdxdGsLDlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E50graXq7fKMRR5fVTrQpjgFBDLMzRNdrC/JwGMII40DIdfjS6XNUvQJg+RA1Aox65eE4pOpS72FHWM+I2n7IlUysx6hzFw28+xUkq6Is3rUKcTfMaDe0qQ83peQtL8El/1hsPVEsCuV1MaW/XlTWO8U1BK8ce3XpFd2HIua/bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hP5113Uz; arc=none smtp.client-ip=95.215.58.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hP5113Uz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8IZnVa7zv8xOQQ+fqCNPj/KOkLdz2r59exdxdGsLDlU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792342969; v=1; x=1792947769;
 b=hP5113UzeTEMVkCJIUoiFNoSXLzVgIiOMmEy1XGi0sw86TSzhIAkC95jFSAzgxN644F4oAoT
 t1AGU1Q8g+gfxyYq6NvdkpHMY1SupCRWAHEWolA6M5MH2b7Vdp4UXN5ozSE2w8Zm+1rrzvA7nBN
 G0Nu58vF0CKcfl+s/7gsh4wE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2ff07275d37278b9;
	Sun, 18 Oct 2026 17:02:48 +0000
X-Mizu-Trace-ID: 2ff07275d37278b9
X-Migadu-Flow: FLOW_OUT
Message-ID: <62eefadc-b0c2-41ca-8a33-af330e78932f@linux.dev>
Date: Sun, 18 Oct 2026 18:49:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 10/10] soundwire: amd: fix IRQ thread dropping
 STATUS_0TO7 on simultaneous wake
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
 <20261013085111.2009061-11-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261013085111.2009061-11-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 10:49, Vijendar Mukunda wrote:
> When the wake bit and a device-state change arrive at the same time,
> the IRQ thread returned early after handling wake, silently discarding
> STATUS_0TO7. If the manager is already at D0, pm_request_resume() is
> a no-op so the dropped ATTACHED event is never recovered and jack
> detection stops working.

this wording is very very hard to follow. Please consider rewording to
describe the race condition in better ways...

> Remove the early return on wake: call amd_sdw_process_wake_event(),
> strip the wake bit from the local STATUS_8TO11 copy, and continue to
> the normal slave-status processing path. Remove the STATUS_8TO11 clear
> from amd_sdw_process_wake_event() so the single tail clear in
> amd_sdw_irq_thread() is the only write to the register per invocation,
> eliminating the double-clear race where a new event arriving between
> two successive clears would be wiped before being read.
> 
> Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 1a252a81269a..beb982b17fa9 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1006,7 +1006,6 @@ static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
>  	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
>  	pm_request_resume(amd_manager->dev);

... specifically why this would be a no-op and ...

>  	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
> -	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
>  }
>  
>  static void amd_sdw_irq_thread(struct work_struct *work)
> @@ -1023,8 +1022,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
>  
>  	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
>  		amd_manager->instance, status_change_0to7, status_change_8to11);
> -	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
> -		return amd_sdw_process_wake_event(amd_manager);
> +
> +	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
> +		amd_sdw_process_wake_event(amd_manager);
> +		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;

... why adding this mask solves the race
> +	}
>  
>  	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
>  		amd_sdw_read_and_process_ping_status(amd_manager);

