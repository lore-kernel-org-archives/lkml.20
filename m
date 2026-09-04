Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA953BB117
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540942; cv=none; b=K6LE1y4bwRmVgVHg7AxLHDrwV+rmk8xT4ncIbQt6ZYmH3likuiXcoyozZLxcja7RZfCqxqTGaFeTkCwnFdud9+wg0hun6y5INKvqtByGbo+xMivl0NSYdJoRRoOWs79LmzgRJDCKG2Xw8d29NY6M13VvrGCnVxfFWUgbrxk/QQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540942; c=relaxed/simple;
	bh=fSG/uWQM4sDFRilkvaBS5weiif9F6HNeCyhlujv4ecA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M7R13t5odaPWZtF6HWphwNZEFNuhNv8dfDB5PsrDNYC4EdWM/zGlIy2TmXzJbhYRLtHft5kC8G58s7G3IcYk3r3zpM26icUTjw5fsQn6iPlEuQm0xXPBJyN3yABpG5nY3L01W1wp7g+CoguLqQLw9rSObpGcMmL5kkApOr8Pz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcIrgV4q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcIrgV4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BEE1F00A3D;
	Fri,  4 Sep 2026 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788540940;
	bh=JWzQDMCqMzScRq/sk6ImDfpLj+5dEyOIQHVkSIya66A=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=KcIrgV4qkecOHI89hbMs4FtYxudrugbAZECmvITVEjPTemuTTacExZQ8pOiqUj26H
	 OgBqJ7XFg8s67QNBIrN+fyb+148/X11/1iI7oKUgZkeUL1S2v2w9uNFttc+cul/Y4A
	 kTz5rtWTlv3jsk2hFeYTK5wb7gDFlobApFwfDcBU9ekZsJsoLQxzdoF1mlDSX7fbZc
	 ymBOelE48KTLCgiyyQvsf/+1wAEhHjtRO5X1eAZDwERtaoGLUO57rUKouSJ3eMLJOD
	 QkaQFZPc47zX/wIQbGfTpCzg/hFUAA/t/+pPMB8GjduvVW1gRijx7cRymnqOvamdos
	 DBif+89oRsqwg==
Message-ID: <e153dbfc-e1ff-4811-a470-e547b6c5c7be@kernel.org>
Date: Fri, 4 Sep 2026 11:55:39 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] firmware: stratix10-svc: add PSCI secondary CPU
 offline on warm reboot for agilex and stratix10
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 linux-kernel@vger.kernel.org
References: <98ce724c07946338bb0a6ffa7d2b204a93a7a6fe.1788452660.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <98ce724c07946338bb0a6ffa7d2b204a93a7a6fe.1788452660.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 00:52, Adrian Ng Ho Yin wrote:
> On Agilex7 and Stratix10 SoCs, secondary CPUs must be offlined before
> a warm reboot to ensure a clean PSCI state. Agilex5 warm reset is a
> SDM-owned HPS reset that holds secondaries in the new reset-release until
> ATF releases them, so the secondary cores dont have to be put offline
> first. Register a reboot notifier that calls remove_cpu() on each
> secondary CPU when SYS_RESTART is triggered in REBOOT_WARM mode.
> 
> A snapshot of cpu_online_mask is taken before the loop since remove_cpu()
> modifies the mask as CPUs go down. CPU 0 is excluded as it is typically
> not hotpluggable. Failures are logged and the loop continues so the
> reboot is not blocked by a single CPU that refuses to offline.
> The of_device_id table carries a per-compatible pdata flag to enable the
> notifier only on platforms that need it; Agilex5 leaves the flag unset.
> 
> The notifier is unregistered at the start of remove(), before async
> channel teardown, to prevent a reboot notification from racing with
> driver shutdown.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
> changelog:
> v2 -> v3:
> - Use ctrl in psci_offline_secondary_cpus() via dev_err(ctrl->dev, ...)
>    instead of pr_err(). The controller pointer was unused; this both
>    consumes it and attributes the failure to the svc device.
> - Keep of_device_id.data / stratix10_svc_pdata rather than dropping it
>    because both intel,stratix10-svc and intel,agilex-svc happen to share
>    the same notifier path. A separate patch adds intel,agilex5-svc without
>    .data so Agilex5 does not run this sequence. Agilex5 warm reset is an
>    SDM-owned HPS reset (REBOOT_HPS) that holds secondaries in the
>    reset-release / P-channel block until ATF CPURSTRELEASE; Linux must
>    not PSCI-offline them first.
> 
> v1 -> v2:
> - Drop workqueue fan-out: remove_cpu() serialises on device_hotplug_lock
>    internally so concurrent workers provided no parallelism. Replace with
>    a single sequential loop over a cpumask snapshot.
> - Fix CPU identity bug: get_cpu()/put_cpu() did not prevent task migration
>    and the notifier can run on any CPU before migrate_to_reboot_cpu().
>    Exclude CPU 0 (typically not hotpluggable) and offline everything else.
> - Fix pre-count race: the two-loop atomic pre-count had a window where a
>    concurrent hotplug event could cause dec_and_test() to fire prematurely.
>    Eliminated entirely along with the completion and timeout.
> - Replace of_device_is_compatible() checks with a stratix10_svc_pdata
>    struct carried in of_device_id.data, retrieved via of_device_get_match_data().
> - Move psci_cpu_off_teardown() to the top of stratix10_svc_drv_remove(),
>    before async channel teardown, to close the race where a warm-reboot
>    notification could fire while the driver is being dismantled.
> 
> ---
>   drivers/firmware/stratix10-svc.c | 88 ++++++++++++++++++++++++++++++--
>   1 file changed, 85 insertions(+), 3 deletions(-)
> 
I had some erros apply this patch, but was able to finally do it. Please 
double-check the applied patch on my branch: socfpga_firmware_for_v7.4

Dinh
