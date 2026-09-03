Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5113463B8B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435619; cv=none; b=ItNa8Ap/1VJ2LmelJsU/o9g2jzXC2A0iWf/04N8k6A8ZEHKQDOgKpcquOrBZrdLTYmsXlJWqUfXwitV//Wixqmjfvhtcf2FDJATjMzqPc6vU9RKvhr72ifEQuZ57/Yflmw5i5h+hmxxRe95HhcSrI3sDwHZVcVmZqwFxIGotfIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435619; c=relaxed/simple;
	bh=vSfj/YDBiTb8VQvjMN25hzbY6MDhGmqzw9y1OPXWvvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eFk3wdP/7dmmijejD+UP5JU+dYEKtGGiZURjhwh0jJscfAVoOiWNwr8lYvdHASvnYLneCA0pr9KQH7Xk4XG4p9K9l5g+J6v6jnDSU5lHaJCkOTz5J4Ctu37CArpMzcW4eN4KirQVjXAoELJF99dO4y+bYOweBntltAIVxao2B3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3s0Jt/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3s0Jt/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E879F1F000E9;
	Thu,  3 Sep 2026 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788435607;
	bh=B4BBGfOt76Oa3dnjsdcenOxgJs0YNRxuZeseO7zke0o=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=g3s0Jt/FzM5aGpR7UyTFpRmAe5DXNPSMW+V6mp42yn0BwXN9tgDqqkqLj3mNOZPGq
	 Odi4pL0L985YDXm+jXSvD5OhS5HOdY2Vd2ta34zmzy3Pg8MNMHnpjGw6E+TY66cgfu
	 beXAFHKk7QWTn14V1bklXa+apUL8LWOy9M91A6zZrbTSFYcbhSRe+JC31aNXPzb3/M
	 FKcotoYt+nRGXJRZE1COtc7bFK87gp6GwGsUnkuiYQKgz5dzwq6PPBJ04UMY0aQtMT
	 aM0SAWuQMtDaLs6t0iOMLEJo9eXAnFX2qnvTt46fPshZI9pzNjYyZbxYMJqzzy6tBs
	 a7G57VYefGsGQ==
Message-ID: <cdfcf658-c1c1-4b7b-8127-4cb907d4f51c@kernel.org>
Date: Thu, 3 Sep 2026 06:40:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: stratix10-svc: add PSCI secondary CPU
 offline on warm reboot for agilex and stratix10
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 linux-kernel@vger.kernel.org
References: <ab0bb836bdd80fbad772a49616b1edba372420b7.1784020512.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <ab0bb836bdd80fbad772a49616b1edba372420b7.1784020512.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/14/26 17:16, Adrian Ng Ho Yin wrote:
> On Agilex7 and Stratix10 SoCs, secondary CPUs must be offlined before
> a warm reboot to ensure a clean PSCI state. Register a reboot notifier
> that calls remove_cpu() on each secondary CPU when SYS_RESTART is
> triggered in REBOOT_WARM mode.
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
> ---
>   drivers/firmware/stratix10-svc.c | 88 ++++++++++++++++++++++++++++++--
>   1 file changed, 85 insertions(+), 3 deletions(-)

I had a patch conflict when I applied it on top of v7.3-rc1. I fixed it 
up, please take a look at socfpga_firmware_for_v7.4 to verify the fix.

A few comments:


> 
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index de938ab2db0b..e10550237ea1 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -24,6 +24,10 @@
>   #include <linux/firmware/intel/stratix10-smc.h>
>   #include <linux/firmware/intel/stratix10-svc-client.h>
>   #include <linux/types.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/of_device.h>
> +#include <linux/reboot.h>
>   
>   /**
>    * SVC_NUM_DATA_IN_FIFO - number of struct stratix10_svc_data in the FIFO
> @@ -96,6 +100,14 @@
>   #define STRATIX10_GET_SDM_STATUS_CODE(status) \
>   	(FIELD_GET(STRATIX10_SDM_STATUS_MASK, status))
>   
> +struct stratix10_svc_pdata {
> +	bool needs_psci_cpu_off;
> +};
> +
> +static const struct stratix10_svc_pdata psci_cpu_off_pdata = {
> +	.needs_psci_cpu_off = true,
> +};
> +
>   typedef void (svc_invoke_fn)(unsigned long, unsigned long, unsigned long,
>   			     unsigned long, unsigned long, unsigned long,
>   			     unsigned long, unsigned long,
> @@ -280,6 +292,7 @@ struct stratix10_svc_chan {
>    * @svc: manages the list of client svc drivers
>    * @sdm_lock: only allows a single command single response to SDM
>    * @actrl: async control structure
> + * @psci_reboot_nb: reboot notifier for PSCI secondary CPU offlining
>    * @chans: array of service channels
>    *
>    * This struct is used to create communication channels for service clients, to
> @@ -296,6 +309,7 @@ struct stratix10_svc_controller {
>   	struct stratix10_svc *svc;
>   	struct mutex sdm_lock;
>   	struct stratix10_async_ctrl actrl;
> +	struct notifier_block psci_reboot_nb;
>   	struct stratix10_svc_chan chans[] __counted_by(num_chans);
>   };
>   
> @@ -1981,9 +1995,60 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
>   }
>   EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
>   
> +static void psci_offline_secondary_cpus(struct stratix10_svc_controller *ctrl)

ctrl is never used in this function.> +{
> +	cpumask_var_t mask;
> +	int cpu, ret;
> +
> +	if (!alloc_cpumask_var(&mask, GFP_KERNEL))
> +		return;
> +
> +	/*
> +	 * Snapshot cpu_online_mask before the loop; remove_cpu() modifies it
> +	 * as each CPU is brought down. Always preserve CPU 0 (boot CPU) to
> +	 * run the reboot.
> +	 */
> +	cpumask_copy(mask, cpu_online_mask);
> +	cpumask_clear_cpu(0, mask);
> +
> +	/*
> +	 * Offlining is best-effort: if a CPU refuses to go down we log the
> +	 * error and continue so the remaining secondaries are still attempted
> +	 * and the warm reboot can proceed.
> +	 */
> +	for_each_cpu(cpu, mask) {
> +		ret = remove_cpu(cpu);
> +		if (ret)
> +			pr_err("psci_cpu_off: failed to offline CPU%d: %d\n",
> +			       cpu, ret);

Perhaps use dev_err()e so that you can use the ctrl->dev?

> +	}
> +
> +	free_cpumask_var(mask);
> +}
> +
> +static int psci_cpu_off_reboot_notifier(struct notifier_block *nb,
> +					unsigned long action, void *data)
> +{
> +	struct stratix10_svc_controller *ctrl =
> +		container_of(nb, struct stratix10_svc_controller, psci_reboot_nb);
> +
> +	if (reboot_mode != REBOOT_WARM)
> +		return NOTIFY_DONE;
> +
> +	if (action == SYS_RESTART)
> +		psci_offline_secondary_cpus(ctrl);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static void psci_cpu_off_teardown(struct stratix10_svc_controller *ctrl)
> +{
> +	unregister_reboot_notifier(&ctrl->psci_reboot_nb);
> +}
> +
>   static const struct of_device_id stratix10_svc_drv_match[] = {
> -	{.compatible = "intel,stratix10-svc"},
> -	{.compatible = "intel,agilex-svc"},
> +	{ .compatible = "intel,stratix10-svc", .data = &psci_cpu_off_pdata },
> +	{ .compatible = "intel,agilex-svc",    .data = &psci_cpu_off_pdata },

I'm not sure why you need this of_match_data to make the distinction 
between the 2 platforms when both platforms are performing the same 
function.

Dinh
