Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026200;
	b=TzcG7mgH8fAQ09IjoAvSmg3qkUCPRZcw9cou25YDioP2eqcOjxJ6i++RCIM7FAOSk8p6
	 B+rvRw+tVtoqFZLkMthpCKlPiuwlLDuXVAv894tU0/SJCvEPZ5s0sVqzPEpcO0f+A3KVG
	 PjqXsLu9th9q/YkdA1qkbmQPYVg+3EqBtGdPEFu+4QoGh/tk/bmrbM2yFF4uReJgkvHhg
	 tAsAW1MFN1nw9qVKbtEWV32a0Tqi4LsnrGShgj98q61uJV9CHUDggdjxKT63aR8MOAxZu
	 1igH1Z18X7AiFTMY6qEWNmnnFTfqTy7ASabZ0XAYl5RiZ0RZ2TKKXSjaL7/sLl2uEqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026200;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=X1oQuy70UgKD0jIhv1PPeTm937BIFvaHwD6vzeFRSYc=;
	b=CEftcDpLzSHAoRiypAFO3Y/vEExcUEnZDbrmu0+IOvENQg/P2d+IaxH7Iygg4EIFgV+8
	 3wbjD/JPyJV/VkspjQs1eMuXD6r/Ztz46t7tSjfuSgsrEseVNqQN5siVq0icm/krbj8Ys
	 xF+WzwAw2YrX23l6Zhj//58L3KauqIHuyoC4k+UpvBONnTuYaBHYHZyH1aRtvXdLsk1zu
	 K96mcpC9R+WMzc5r4CMVT80jO8OURc96Qp1GDwcmEVAnZ6YZ+mKOA2uR/exE35ULTMae8
	 9yk4a2K2Umr3FBJ8SZ5w2TZ9T0kwNara8cK3w/ncZLP7JZ67ElOEw0CQZQEEv7rAkyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="t4NfJd9/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68663606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68663606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=t4NfJd9/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616BD15A1;
	Mon, 26 Oct 2026 07:49:56 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE2463F7B4;
	Mon, 26 Oct 2026 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793026199; bh=CR0imfGgqiScyd7wesG/X+HJxG7MT9e6at/JgsayxXw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=t4NfJd9/QIFsAcS9JRjthTLtEAU0vi8eocBFej2Ng7+6VcDBWysjFRVcRNr6dvZPs
	 /pD9S6W6AHLKiB+TJ2cuo/X1wYJoMpGWRTtw1Xa6Hq43lXFnlXUD0o9C5eP8AkGSle
	 AnJamrmbOrfoFDrrswJ5JhG2srTOUpPf1I1FE96g=
Message-ID: <c0fe8907-81e2-4bde-a5a4-193209946583@arm.com>
Date: Mon, 26 Oct 2026 14:49:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 RESEND 05/15] arm_mpam: Don't stall MPAM enable when
 an MSC fails to probe
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, zengheng4@huawei.com, jic23@kernel.org,
 gshan@redhat.com, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-6-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261020134239.3921377-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,



On 20/10/2026 14:42, Jinjie Ruan wrote:
> mpam_msc_drv_probe() registers the discovery cpuhp callbacks only when
> the number of successfully probed MSCs reaches fw_num_msc. Every failure
> path returns before the counter is incremented, and a failed probe is
> final - the driver core does not retry. One failing MSC therefore leaves
> the counter below fw_num_msc forever: the discovery callbacks are never
> registered, mpam_enable() is never scheduled, and MPAM stays dead
> system-wide - the resctrl filesystem is never registered, and no error
> message hints at the cause.
> 
> An MSC can legitimately fail to probe on an otherwise working system:
> firmware may describe MSCs that are not accessible from any possible
> CPU, e.g. when the possible CPUs are restricted with nr_cpus=. The MSCs
> of the clipped CPUs then fail with "MSC is not accessible from any
> CPU!", or their cache resources become unresolvable from PPTT.

As the MPAM resources are system wide we need to query the support from each of the MSC to know what
resources will end up. I do appreciate that if you have full control of your system then you can
know this in advance but then you can also adjust your acpi tables to mark the non-accessible MSC as
disabled. As such, I don't think changes such as this should be in the driver. Here is a previous
explanation for a similar patch [1]

Thanks,

Ben

[1] https://lore.kernel.org/lkml/59c21340-4e3d-4c48-9d9f-c0f78a023bac@arm.com/

> 
> Count every completed probe, successful or not. Failed MSCs are not on
> mpam_all_msc (either never added, or removed by mpam_msc_drv_remove()),
> so the discovery path skips them naturally, and MPAM is enabled for the
> surviving devices.
> 
> Cc: stable@vger.kernel.org
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Fixes: f04046f2577a5 ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/resctrl/mpam_devices.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 61cbc75625fa..a44d66a5733d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2120,21 +2120,31 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
>  	msc = do_mpam_msc_drv_probe(pdev);
>  	mutex_unlock(&mpam_list_lock);
>  
> -	if (IS_ERR(msc))
> -		return PTR_ERR(msc);
> +	if (IS_ERR(msc)) {
> +		err = PTR_ERR(msc);
> +		goto out;
> +	}
>  
>  	/* Create RIS entries described by firmware */
>  	err = acpi_mpam_parse_resources(msc, plat_data);
> -	if (err) {
> +	if (err)
>  		mpam_msc_drv_remove(pdev);
> -		return err;
> -	}
> -
> -	if (atomic_add_return(1, &mpam_num_msc) == fw_num_msc)
> +out:
> +	/*
> +	 * A failed MSC must not prevent MPAM being enabled for the
> +	 * surviving devices. Firmware may describe MSCs that are not
> +	 * accessible from any possible CPU, e.g. when the possible CPUs
> +	 * were restricted by nr_cpus=. The failed device is not
> +	 * re-probed, so count it here too: otherwise the counter never
> +	 * reaches fw_num_msc, the discovery cpuhp callbacks are never
> +	 * registered and mpam_enable() is never scheduled - MPAM stays
> +	 * dead system-wide, without any error message.
> +	 */
> +	if (atomic_inc_return(&mpam_num_msc) == fw_num_msc)
>  		mpam_register_cpuhp_callbacks(mpam_discovery_cpu_online, NULL,
>  					      "mpam:drv_probe");
>  
> -	return 0;
> +	return err;
>  }
>  
>  static struct platform_driver mpam_msc_driver = {

