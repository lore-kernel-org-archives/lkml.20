Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513B5349D7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172008; cv=none; b=t4P/UJ/IvuBhwaX64FKOPuFWh2+wVHw4smIKlRJTFYCUUM9fei4k7MBG2/0+G6XTbYJj2uusfDujXRa6ARPY00wn/XknyH1SS30aSiTn+mXWf/qMI56GtQhjH6E768K+RKfknc0yCxropIaXlkCNRfwr9wMbr4Jw0GAqh0tnCqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172008; c=relaxed/simple;
	bh=VMXKgys7rHGCQ71YCzP4v4236XAMt+edIpZGJQ0mRso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljNA3MbOHF4uAdcSGIFRWfqwklokPsWVlxaC7rIMRjxeQSnqs/cNKKVrcpo6VoCHspkWu95JkGtMHQ5A27KQm1WwXJMnVria0wsVmLg/Vlm+IHKHibqZTtClDwxz41lB2nSQ9N5C6o8LKBrhKRulfmXs6WcgVRgyWi7tEO/XtoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=jO182K02; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="jO182K02"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id BB4936005419;
	Wed, 23 Sep 2026 15:00:02 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id TtYfAO6D5TEG; Wed, 23 Sep 2026 15:00:01 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D0B006005407;
	Wed, 23 Sep 2026 15:00:00 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1790172000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zMpQIzSE1A4gQGE0gs74srF8YkorVeLnRriYevmcCrQ=;
	b=jO182K02CqwApINj+AWQmz5NNVEY44Mo0hNPMAUWKpoRLquA8SEMo4UvA5ZWmekKbygN8Q
	1gv1wruFEzR68HxmkGOwnSjIArYYNGKsL/A3dr967Pdl2xZ+DuzJn6KzgcP5MPH9oQwn5v
	kk5oZpVlgyxuSIj7mWww3C3wLzoxxKtyMg3rReE2C/qWBzjYQ3Ks45aB8tx4msuvTHi4OE
	YdM7tyIN5i2UTir07MBS06UwyrBA7I/1NLc58CrbSwKtDqsQM9qaSOWtcBnTRxxf0VWreC
	rDTWgIltPXthrdTwwJwUJeeK60bFNRJZexQDeQGb+PZ+oIULBEGF9176lcqqYA==
Received: from [IPV6:2001:8a0:67f3:eb00:ee56:8d5c:4e29:8df0] (unknown [IPv6:2001:8a0:67f3:eb00:ee56:8d5c:4e29:8df0])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 3DC4B360133;
	Wed, 23 Sep 2026 15:00:00 +0100 (WEST)
Message-ID: <60094a20-d034-4029-94ea-c4bcbe1edf02@tecnico.ulisboa.pt>
Date: Wed, 23 Sep 2026 15:00:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware/psci: Convert poweroff to the sys-off handler
 API
To: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260923-firmware-psci-v1-1-430646653fc6@tecnico.ulisboa.pt>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20260923-firmware-psci-v1-1-430646653fc6@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/26 12:12, Diogo Ivo wrote:
> The PSCI poweroff handler is currently registered via pm_power_off,
> which fires as the last SYS_OFF_PRIO_DEFAULT handler. However, there
> are two problems with this approach: PSCI is a firmware mechanism, so
> its priority should be SYS_OFF_PRIO_FIRMWARE, and the point of the
> sys-off API is to eliminate pm_power_off and make the ordering and
> priority between shutdown mechanisms explicit.
> 
> This patch converts PSCI to register_sys_off_handler() so that its
> position in the shutdown sequence is explicit and governed by priority.
> 
> In an ideal world PSCI would always be registered at SYS_OFF_PRIO_FIRMWARE
> since it is a firmware mechanism. However, this approach would lead to
> several problems:
> 
>   - On platforms with ACPI/EFI and PSCI there would be a clash at FIRMWARE
>     level, and the first to register would prevail.
> 
>   - Not all platforms have a functional PSCI SYSTEM_OFF callback. This
>     happens for example in some Tegra X1 platforms, where shutdown needs
>     to be handled by the PMIC driver, explicitly marked as a
>     system-power-controller.
> 
> As such, the approach here is:
> 
>   - On ACPI systems EFI (SYS_OFF_PRIO_FIRMWARE + 1) and ACPI
>     (SYS_OFF_PRIO_FIRMWARE) already handle poweroff at higher
>     priorities. PSCI registers at SYS_OFF_PRIO_DEFAULT as a fallback
>     that runs after both.
> 
>   - On DT systems with no system-power-controller, PSCI is the primary
>     firmware poweroff path and registers at SYS_OFF_PRIO_FIRMWARE.
> 
>   - On DT systems where a system-power-controller node is present, a
>     dedicated platform driver is responsible for poweroff. PSCI
>     registers at SYS_OFF_PRIO_DEFAULT - 1 so that driver takes
>     precedence while PSCI still acts as a backstop.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
> ---
>   drivers/firmware/psci/psci.c | 44 +++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb23a..fc7986b7f12f 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -13,7 +13,6 @@
>   #include <linux/errno.h>
>   #include <linux/linkage.h>
>   #include <linux/of.h>
> -#include <linux/pm.h>
>   #include <linux/printk.h>
>   #include <linux/psci.h>
>   #include <linux/reboot.h>
> @@ -79,6 +78,8 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void)
>   static u32 psci_cpu_suspend_feature;
>   static bool psci_system_reset2_supported;
>   static bool psci_system_off2_hibernate_supported;
> +static bool psci_system_off_supported __initdata;
> +static bool is_dt __initdata;
>   
>   static inline bool psci_has_ext_power_state(void)
>   {
> @@ -329,9 +330,11 @@ static struct notifier_block psci_sys_reset_nb = {
>   	.priority = 129,
>   };
>   
> -static void psci_sys_poweroff(void)
> +static int psci_sys_poweroff(struct sys_off_data *data)
>   {
>   	invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
> +
> +	return NOTIFY_DONE;
>   }
>   
>   #ifdef CONFIG_HIBERNATION
> @@ -665,6 +668,40 @@ static void __init psci_init_smccc(void)
>   
>   }
>   
> +static int __init psci_poweroff_init(void)
> +{
> +	int priority = is_dt ? SYS_OFF_PRIO_FIRMWARE : SYS_OFF_PRIO_DEFAULT;
> +	struct sys_off_handler *handler;
> +	struct device_node *np;
> +
> +	if (!psci_system_off_supported)
> +		return 0;
> +
> +	if (is_dt) {
> +		/*
> +		 * If a system-power-controller is designated in DT, a dedicated
> +		 * driver should handle power-off; in that case register PSCI at
> +		 * SYS_OFF_PRIO_DEFAULT - 1 as a fallback. This covers both the
> +		 * case where that driver fails to power-off the system and the
> +		 * case where it fails to register its own handler.
> +		 */
> +		np = of_find_node_with_property(NULL, "system-power-controller");

Sashiko flagged a valid point here, where if the first node containing
"system-power-controller" is actually disabled in DT we will still
demote PSCI to SYS_OFF_PRIO_DEFAULT - 1. To fix this I will send a v2
with the check
		if (np && of_device_is_available(np)) {
> +		if (np) {
> +			priority = SYS_OFF_PRIO_DEFAULT - 1;
> +			of_node_put(np);
> +		}
> +	}
> +
> +	handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, priority,
> +					   psci_sys_poweroff, NULL);
> +	if (IS_ERR(handler))
> +		pr_err("Failed to register PSCI power-off handler: %ld\n",
> +		       PTR_ERR(handler));
> +
> +	return PTR_ERR_OR_ZERO(handler);
> +}
> +subsys_initcall(psci_poweroff_init);
> +
>   static void __init psci_0_2_set_functions(void)
>   {
>   	pr_info("Using standard PSCI v0.2 function IDs\n");
> @@ -681,7 +718,7 @@ static void __init psci_0_2_set_functions(void)
>   
>   	register_restart_handler(&psci_sys_reset_nb);
>   
> -	pm_power_off = psci_sys_poweroff;
> +	psci_system_off_supported = true;
>   }
>   
>   /*
> @@ -822,6 +859,7 @@ int __init psci_dt_init(void)
>   	init_fn = (psci_initcall_t)matched_np->data;
>   	ret = init_fn(np);
>   
> +	is_dt = true;
>   	of_node_put(np);
>   	return ret;
>   }
> 
> ---
> base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
> change-id: 20260530-firmware-psci-f4179901d35d
> 
> Best regards,
> --
> Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
