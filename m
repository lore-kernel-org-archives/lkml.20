Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E414A47ACDD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884404; cv=none; b=ZksDrXOTCKSc91vgxsAxHJIoUq7+LhSLJ6dfPWDosa/g8KROf/FZ33/KvRQeEqUntbU2rP5+HUNFYohJRnaiAg5nsZ4hYJ5yN4xQQMAiphh53mRes4w1aP5ES/lKuC590bDDtWu5tKz8RzONwGEqLstILl5010Mx3X2r+5LIeA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884404; c=relaxed/simple;
	bh=XZTzCR3YxKwqm649NplBZ5ogv6xoQ0xU3FORRre3ZTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNFVd2ALRtFc6RLjASBsV9WUA7XRadI5pHKiwWV5ZK6ulbjT6UtFMt+1E7fh2RozrDbtXE58jRUnj/nigAIeHQjc5QZ4sLnQR4awx/+gc5kDrsCMAb13U/SkWDt+3xJiCglfRx0aTEB6fDk18EH+nZDyB9zlN9Vm8UUlaWhRbIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nJyOJX4H; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nJyOJX4H"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0368F169C;
	Tue, 13 Oct 2026 02:39:59 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CE253F7B4;
	Tue, 13 Oct 2026 02:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791884402; bh=XZTzCR3YxKwqm649NplBZ5ogv6xoQ0xU3FORRre3ZTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nJyOJX4H2K9Pa4BGjhnhpGbsn6lEr2zXS4gJ+55tCTfZ41HPL6Ltga7TA+iTNGPu4
	 Qy6/+gG3YZVWpe3GJ8goUL5zZK7nXacxuqAkM6689bebDTTO5mJCvLRqiUl9sE7sRT
	 3mFZyJ3R8gZfk4SZoj9fK2LAAKnSG/cpuOWwVpt0=
Message-ID: <019fee57-8984-4bd6-8912-ec9b1718eb08@arm.com>
Date: Tue, 13 Oct 2026 10:40:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm_mpam: Use an atomic counter to schedule
 mpam_enable_once()
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com
References: <20260915115646.54113-1-leeonion.muyu@gmail.com>
 <20260921114957.3382350-1-leeonion.muyu@gmail.com>
 <CAKpSQZD2hEuAF9CDD7o9F6v6j-s3sDEwVPtEk9_QLBFjk=nqvA@mail.gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <CAKpSQZD2hEuAF9CDD7o9F6v6j-s3sDEwVPtEk9_QLBFjk=nqvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ping,

On 06/10/2026 07:31, Ping Li wrote:
> Hi Ben,
> Gentle ping on this patch. It would be good to know if there is
> anything else you would like changed.
> Thanks,
> Ping
> 
> Ping Li <leeonion.muyu@gmail.com> 于2026年9月21日周一 19:50写道：
> 
>> mpam_discovery_cpu_online() scheduled mpam_enable() after each MSC
>> probe, and mpam_enable() walked the whole MSC list taking each probe
>> lock in turn to check if all the MSCs had been probed.
>>
>> Count the MSCs that have had their hardware probed with
>> mpam_num_msc_probed, and schedule mpam_enable_once() directly when the
>> count reaches fw_num_msc, the number of MSCs reported by firmware.
>> MSCs that were already probed no longer cause work to be scheduled.
>>
>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>

It's a bit late for 7.4 now but I should be able to take this next cycle.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

>> ---
>> Changes in v5:
>> - Schedule mpam_broken_work at the error site and return early,
>>   removing the duplicate err check at the end of the function.
>>
>>  drivers/resctrl/mpam_devices.c  | 69 +++++++++++----------------------
>>  drivers/resctrl/mpam_internal.h |  2 -
>>  2 files changed, 22 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c
>> b/drivers/resctrl/mpam_devices.c
>> index 2f09f4b78bd3..4fc82acd854e 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -49,12 +49,20 @@ static LIST_HEAD(mpam_all_msc);
>>
>>  struct srcu_struct mpam_srcu;
>>
>> +/* Number of MSCs reported by firmware */
>> +static int fw_num_msc;
>> +
>>  /*
>>   * Number of MSCs that have been probed. Once all MSCs have been probed
>> MPAM
>>   * can be enabled.
>>   */
>>  static atomic_t mpam_num_msc;
>>
>> +/* Number of MSCs that have had their hardware probed */
>> +static atomic_t mpam_num_msc_probed;
>> +
>> +static void mpam_enable_once(struct work_struct *work);
>> +
>>  static int mpam_cpuhp_state;
>>  static DEFINE_MUTEX(mpam_cpuhp_state_lock);
>>
>> @@ -72,7 +80,7 @@ static DEFINE_SPINLOCK(partid_max_lock);
>>   * scheduled via this work_struct. If access to an MSC depends on a CPU
>> that
>>   * was not brought online at boot, this can happen surprisingly late.
>>   */
>> -static DECLARE_WORK(mpam_enable_work, &mpam_enable);
>> +static DECLARE_WORK(mpam_enable_work, &mpam_enable_once);
>>
>>  /*
>>   * All mpam error interrupts indicate a software bug. On receipt, disable
>> the
>> @@ -1854,7 +1862,6 @@ static int mpam_discovery_cpu_online(unsigned int
>> cpu)
>>  {
>>         int err = 0;

nit: don't need the ' = 0' anymore.

>>         struct mpam_msc *msc;
>> -       bool new_device_probed = false;
>>
>>         if (mpam_is_enabled())
>>                 return 0;
>> @@ -1865,24 +1872,22 @@ static int mpam_discovery_cpu_online(unsigned int
>> cpu)
>>                 if (!cpumask_test_cpu(cpu, &msc->accessibility))
>>                         continue;
>>
>> -               mutex_lock(&msc->probe_lock);
>> -               if (!msc->probed)
>> -                       err = mpam_msc_hw_probe(msc);
>> -               mutex_unlock(&msc->probe_lock);
>> +               guard(mutex)(&msc->probe_lock);
>> +               if (msc->probed)
>> +                       continue;
>>
>> -               if (err)
>> -                       break;
>> -               new_device_probed = true;
>> -       }
>> +               err = mpam_msc_hw_probe(msc);
>> +               if (err) {
>> +                       mpam_disable_reason = "error during probing";
>> +                       schedule_work(&mpam_broken_work);
>> +                       return err;
>> +               }
>>
>> -       if (new_device_probed && !err)
>> -               schedule_work(&mpam_enable_work);
>> -       if (err) {
>> -               mpam_disable_reason = "error during probing";
>> -               schedule_work(&mpam_broken_work);
>> +               if (atomic_add_return(1, &mpam_num_msc_probed) ==
>> fw_num_msc)
>> +                       schedule_work(&mpam_enable_work);
>>         }
>>
>> -       return err;
>> +       return 0;
>>  }
>>
>>  static int mpam_cpu_offline(unsigned int cpu)
>> @@ -2106,8 +2111,6 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct
>> platform_device *pdev)
>>         return msc;
>>  }
>>
>> -static int fw_num_msc;
>> -
>>  static int mpam_msc_drv_probe(struct platform_device *pdev)
>>  {
>>         int err;
>> @@ -2713,7 +2716,7 @@ static int mpam_allocate_config(void)
>>         return 0;
>>  }
>>
>> -static void mpam_enable_once(void)
>> +static void mpam_enable_once(struct work_struct *work)
>>  {
>>         int err;
>>
>> @@ -2867,34 +2870,6 @@ void mpam_disable(struct work_struct *ignored)
>>         pr_err_once("MPAM disabled due to %s\n", mpam_disable_reason);
>>  }
>>
>> -/*
>> - * Enable mpam once all devices have been probed.
>> - * Scheduled by mpam_discovery_cpu_online() once all devices have been
>> created.
>> - * Also scheduled when new devices are probed when new CPUs come online.
>> - */
>> -void mpam_enable(struct work_struct *work)
>> -{
>> -       static atomic_t once;
>> -       struct mpam_msc *msc;
>> -       bool all_devices_probed = true;
>> -
>> -       /* Have we probed all the hw devices? */
>> -       guard(srcu)(&mpam_srcu);
>> -       list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
>> -                                srcu_read_lock_held(&mpam_srcu)) {
>> -               mutex_lock(&msc->probe_lock);
>> -               if (!msc->probed)
>> -                       all_devices_probed = false;
>> -               mutex_unlock(&msc->probe_lock);
>> -
>> -               if (!all_devices_probed)
>> -                       break;
>> -       }
>> -
>> -       if (all_devices_probed && !atomic_fetch_inc(&once))
>> -               mpam_enable_once();
>> -}
>> -
>>  #define maybe_update_config(cfg, feature, newcfg, member, changes) do { \
>>         if (mpam_has_feature(feature, newcfg) &&                        \
>>             (newcfg)->member != (cfg)->member) {                        \
>> diff --git a/drivers/resctrl/mpam_internal.h
>> b/drivers/resctrl/mpam_internal.h
>> index 04d1a59f02af..085f086e2b2d 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -452,8 +452,6 @@ extern struct list_head mpam_classes;
>>  extern u16 mpam_partid_max;
>>  extern u8 mpam_pmg_max;
>>
>> -/* Scheduled work callback to enable mpam once all MSC have been probed */
>> -void mpam_enable(struct work_struct *work);
>>  void mpam_disable(struct work_struct *work);
>>
>>  /* Reset all the RIS in a class under cpus_read_lock() */
>> --
>> 2.34.1
>>
>>
> 

